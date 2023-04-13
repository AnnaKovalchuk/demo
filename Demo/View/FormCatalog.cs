using Demo.Classes;
using Demo.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;

namespace Demo
{
    public partial class FormCatalog : Form
    {
        public FormCatalog()
        {
            InitializeComponent();
        }

        public static string picName;
        public static string path = Application.StartupPath + "/Pict/";
        public static Bitmap bitmap;
        /// <summary>
        /// Метод для заполнения каталога
        /// </summary>
        private void LoadDataDrid()
        {
            dataGridView1.Rows.Clear();
            using (DB01Entities DB = new DB01Entities())
            {
                var products = DB.Product.ToList();

                //Сортировка по цене
                if (comboBoxCost.SelectedIndex == 0)
                    products = products.OrderByDescending(x => x.ProductCost).ToList();
                else if (comboBoxCost.SelectedIndex == 1)
                    products = products.OrderBy(x => x.ProductCost).ToList();

                //Сортировка по скидке
                if (comboBoxDiscount.SelectedIndex == 1)
                    products = products.Where(x => (x.ProductDiscount < 10)).ToList();
                else if (comboBoxDiscount.SelectedIndex == 2)
                    products = products.Where(x => (x.ProductDiscount > 10) && x.ProductDiscount < 15).ToList();
                else if (comboBoxDiscount.SelectedIndex == 3)
                    products = products.Where(x => (x.ProductDiscount >= 15)).ToList();

                int i = 0;
                foreach (var item in products)
                {
                    dataGridView1.Rows.Add();

                    picName = item.ProductPhoto;

                    if (String.IsNullOrEmpty(picName))
                        dataGridView1.Rows[i].Cells[0].Value = Properties.Resources.nophoto;
                    else
                    {
                        bitmap = new Bitmap(path + picName);
                        dataGridView1.Rows[i].Cells[0].Value = bitmap;
                    }

                    if(item.ProductDiscount != null)
                    {
                        dataGridView1.Rows[i].Cells[1].Value =
                        $"Название: {item.ProductName}" +
                        $"\nОписание: {item.ProductDescription}" +
                        $"\nПроизводитель: {item.Manufacturer.ManufacturerName}";
                        dataGridView1.Rows[i].Cells[2].Value = $"\n{item.ProductCost}";
                        dataGridView1.Rows[i].Cells[3].Value = $"\n{item.ProductDiscount}" + " %";
                        dataGridView1.Rows[i].Cells[4].Value = $"\n{item.ProductCost * (100-item.ProductDiscount) / 100}" ;
                        dataGridView1.Rows[i].Cells[2].Style = new DataGridViewCellStyle()
                        {
                            Font = new Font(this.Font, FontStyle.Strikeout)
                        };
                    }
                    else
                    {
                        dataGridView1.Rows[i].Cells[1].Value =
                        $"Название: {item.ProductName}" +
                        $"\nОписание: {item.ProductDescription}" +
                        $"\nПроизводитель: {item.Manufacturer.ManufacturerName}";
                        dataGridView1.Rows[i].Cells[2].Value = $"\n{item.ProductCost}";
                        dataGridView1.Rows[i].Cells[3].Value = $"\n-";
                        dataGridView1.Rows[i].Cells[4].Value = $"\n-";
                    }

                    if (item.ProductDiscount >= 15)
                        dataGridView1.Rows[i].DefaultCellStyle.BackColor = Color.Red;
                    i++;
                }

                labelCount.Text = "Количество записей: " + i.ToString();
            }
        }

        private void FormCatalog_Load(object sender, EventArgs e)
        {
            comboBoxCost.SelectedIndex = 0;
            comboBoxDiscount.SelectedIndex = 0;
            LoadDataDrid();
        }

        private void comboBoxCost_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrid();
        }

        private void comboBoxDiscount_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrid();
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Вы действительно хотите выйти?", "Подтверждение выхода", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
                this.Close();
        }
    }
}
