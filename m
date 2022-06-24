Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B02D559C3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 16:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbiFXOgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 10:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbiFXOfW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 10:35:22 -0400
Received: from mail.baikalelectronics.com (mail.baikalelectronics.com [87.245.175.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 776DD56C31;
        Fri, 24 Jun 2022 07:35:02 -0700 (PDT)
Received: from mail (mail.baikal.int [192.168.51.25])
        by mail.baikalelectronics.com (Postfix) with ESMTP id 963A15BC6;
        Fri, 24 Jun 2022 17:36:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 963A15BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baikalelectronics.ru; s=mail; t=1656081366;
        bh=vA5/MPNRcqp2Z6oMEVuTg3iNodLiqhSD939xzOeqkHA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=nwamM1B3PL8Q0uVwPRrkKO5qMh21QRi5bXGmfsHyGDflGXcWsHUI6LoDgqL3FxUJk
         sF1jNaa6lAH/sBwJxhmgt1XUlbW+McpOB7jfCTK9rKe3XkTAGD3irzSksMZKMa0MMQ
         hFsZ7rNu+m8j3vtbU41gbKCt5/KlWfs6gAXAX5YM=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 24 Jun 2022 17:34:44 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Minghuan Lian <minghuan.Lian@nxp.com>,
        Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
        Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jonathan Chocron <jonnyc@amazon.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Rahul Tanwar <rtanwar@maxlinear.com>,
        Srikanth Thokala <srikanth.thokala@intel.com>,
        Xiaowei Song <songxiaowei@hisilicon.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Frank Li <Frank.Li@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-amlogic@lists.infradead.org>, <linux-arm-kernel@axis.com>,
        <linux-rockchip@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH RESEND v5 15/18] PCI: dwc: Add dw_ prefix to the pcie_port structure name
Date:   Fri, 24 Jun 2022 17:34:25 +0300
Message-ID: <20220624143428.8334-16-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220624143428.8334-1-Sergey.Semin@baikalelectronics.ru>
References: <20220624143428.8334-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All of the DW PCIe core driver entities have names with the dw_ prefix in
order to easily distinguish local and common PCIe name spaces. All except
the pcie_port structure which contains the DW PCIe Root Port descriptor.
For historical reason the structure has retained the original name since
commit 340cba6092c2 ("pci: Add PCIe driver for Samsung Exynos") when
the DW PCIe IP-core support was added to the kernel. Let's finally fix
that by adding the dw_ prefix to the structure name and by adding the _rp
suffix to be similar to the EP counterpart. Thus the name will be coherent
with the common driver naming policy. It shall make the driver code more
readable eliminating visual confusion between the local and generic PCI
name spaces.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v4:
- This is a new patch created on the v4 lap of the series.
---
 drivers/pci/controller/dwc/pci-dra7xx.c       | 12 +++----
 drivers/pci/controller/dwc/pci-exynos.c       |  6 ++--
 drivers/pci/controller/dwc/pci-imx6.c         |  6 ++--
 drivers/pci/controller/dwc/pci-keystone.c     | 20 +++++------
 drivers/pci/controller/dwc/pci-layerscape.c   |  2 +-
 drivers/pci/controller/dwc/pci-meson.c        |  2 +-
 drivers/pci/controller/dwc/pcie-al.c          |  6 ++--
 drivers/pci/controller/dwc/pcie-armada8k.c    |  4 +--
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +--
 .../pci/controller/dwc/pcie-designware-host.c | 36 +++++++++----------
 .../pci/controller/dwc/pcie-designware-plat.c |  2 +-
 drivers/pci/controller/dwc/pcie-designware.h  | 30 ++++++++--------
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 +--
 drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
 drivers/pci/controller/dwc/pcie-histb.c       | 10 +++---
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  6 ++--
 drivers/pci/controller/dwc/pcie-keembay.c     |  4 +--
 drivers/pci/controller/dwc/pcie-kirin.c       |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c        |  4 +--
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  6 ++--
 drivers/pci/controller/dwc/pcie-tegra194.c    | 22 ++++++------
 drivers/pci/controller/dwc/pcie-uniphier.c    | 10 +++---
 drivers/pci/controller/dwc/pcie-visconti.c    |  6 ++--
 23 files changed, 103 insertions(+), 103 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index dfcdeb432dc8..a174b680b2a7 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -178,7 +178,7 @@ static void dra7xx_pcie_enable_interrupts(struct dra7xx_pcie *dra7xx)
 	dra7xx_pcie_enable_msi_interrupts(dra7xx);
 }
 
-static int dra7xx_pcie_host_init(struct pcie_port *pp)
+static int dra7xx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
@@ -202,7 +202,7 @@ static const struct irq_domain_ops intx_domain_ops = {
 	.xlate = pci_irqd_intx_xlate,
 };
 
-static int dra7xx_pcie_handle_msi(struct pcie_port *pp, int index)
+static int dra7xx_pcie_handle_msi(struct dw_pcie_rp *pp, int index)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned long val;
@@ -224,7 +224,7 @@ static int dra7xx_pcie_handle_msi(struct pcie_port *pp, int index)
 	return 1;
 }
 
-static void dra7xx_pcie_handle_msi_irq(struct pcie_port *pp)
+static void dra7xx_pcie_handle_msi_irq(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	int ret, i, count, num_ctrls;
@@ -255,8 +255,8 @@ static void dra7xx_pcie_msi_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct dra7xx_pcie *dra7xx;
+	struct dw_pcie_rp *pp;
 	struct dw_pcie *pci;
-	struct pcie_port *pp;
 	unsigned long reg;
 	u32 bit;
 
@@ -344,7 +344,7 @@ static irqreturn_t dra7xx_pcie_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int dra7xx_pcie_init_irq_domain(struct pcie_port *pp)
+static int dra7xx_pcie_init_irq_domain(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct device *dev = pci->dev;
@@ -475,7 +475,7 @@ static int dra7xx_add_pcie_port(struct dra7xx_pcie *dra7xx,
 {
 	int ret;
 	struct dw_pcie *pci = dra7xx->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
 
 	pp->irq = platform_get_irq(pdev, 1);
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 467c8d1cd7e4..2044d191fba6 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -249,7 +249,7 @@ static int exynos_pcie_link_up(struct dw_pcie *pci)
 	return (val & PCIE_ELBI_XMLH_LINKUP);
 }
 
-static int exynos_pcie_host_init(struct pcie_port *pp)
+static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
@@ -276,7 +276,7 @@ static int exynos_add_pcie_port(struct exynos_pcie *ep,
 				       struct platform_device *pdev)
 {
 	struct dw_pcie *pci = &ep->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -406,7 +406,7 @@ static int __maybe_unused exynos_pcie_resume_noirq(struct device *dev)
 {
 	struct exynos_pcie *ep = dev_get_drvdata(dev);
 	struct dw_pcie *pci = &ep->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 7a285fb0f619..5ea01ed4674d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -863,7 +863,7 @@ static int imx6_pcie_start_link(struct dw_pcie *pci)
 	return ret;
 }
 
-static int imx6_pcie_host_init(struct pcie_port *pp)
+static int imx6_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
@@ -992,7 +992,7 @@ static int imx6_pcie_resume_noirq(struct device *dev)
 {
 	int ret;
 	struct imx6_pcie *imx6_pcie = dev_get_drvdata(dev);
-	struct pcie_port *pp = &imx6_pcie->pci->pp;
+	struct dw_pcie_rp *pp = &imx6_pcie->pci->pp;
 
 	if (!(imx6_pcie->drvdata->flags & IMX6_PCIE_FLAG_SUPPORTS_SUSPEND))
 		return 0;
@@ -1291,7 +1291,7 @@ static struct platform_driver imx6_pcie_driver = {
 static void imx6_pcie_quirk(struct pci_dev *dev)
 {
 	struct pci_bus *bus = dev->bus;
-	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie_rp *pp = bus->sysdata;
 
 	/* Bus parent is the PCI bridge, its parent is this platform driver */
 	if (!bus->dev.parent || !bus->dev.parent->parent)
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index d10e5fd0f83c..c3d88aa27dd4 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -147,7 +147,7 @@ static void ks_pcie_app_writel(struct keystone_pcie *ks_pcie, u32 offset,
 
 static void ks_pcie_msi_irq_ack(struct irq_data *data)
 {
-	struct pcie_port *pp  = irq_data_get_irq_chip_data(data);
+	struct dw_pcie_rp *pp  = irq_data_get_irq_chip_data(data);
 	struct keystone_pcie *ks_pcie;
 	u32 irq = data->hwirq;
 	struct dw_pcie *pci;
@@ -167,7 +167,7 @@ static void ks_pcie_msi_irq_ack(struct irq_data *data)
 
 static void ks_pcie_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 {
-	struct pcie_port *pp = irq_data_get_irq_chip_data(data);
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(data);
 	struct keystone_pcie *ks_pcie;
 	struct dw_pcie *pci;
 	u64 msi_target;
@@ -192,7 +192,7 @@ static int ks_pcie_msi_set_affinity(struct irq_data *irq_data,
 
 static void ks_pcie_msi_mask(struct irq_data *data)
 {
-	struct pcie_port *pp = irq_data_get_irq_chip_data(data);
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(data);
 	struct keystone_pcie *ks_pcie;
 	u32 irq = data->hwirq;
 	struct dw_pcie *pci;
@@ -216,7 +216,7 @@ static void ks_pcie_msi_mask(struct irq_data *data)
 
 static void ks_pcie_msi_unmask(struct irq_data *data)
 {
-	struct pcie_port *pp = irq_data_get_irq_chip_data(data);
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(data);
 	struct keystone_pcie *ks_pcie;
 	u32 irq = data->hwirq;
 	struct dw_pcie *pci;
@@ -247,7 +247,7 @@ static struct irq_chip ks_pcie_msi_irq_chip = {
 	.irq_unmask = ks_pcie_msi_unmask,
 };
 
-static int ks_pcie_msi_host_init(struct pcie_port *pp)
+static int ks_pcie_msi_host_init(struct dw_pcie_rp *pp)
 {
 	pp->msi_irq_chip = &ks_pcie_msi_irq_chip;
 	return dw_pcie_allocate_domains(pp);
@@ -390,7 +390,7 @@ static void ks_pcie_setup_rc_app_regs(struct keystone_pcie *ks_pcie)
 	u32 val;
 	u32 num_viewport = ks_pcie->num_viewport;
 	struct dw_pcie *pci = ks_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	u64 start, end;
 	struct resource *mem;
 	int i;
@@ -428,7 +428,7 @@ static void ks_pcie_setup_rc_app_regs(struct keystone_pcie *ks_pcie)
 static void __iomem *ks_pcie_other_map_bus(struct pci_bus *bus,
 					   unsigned int devfn, int where)
 {
-	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie_rp *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
 	u32 reg;
@@ -456,7 +456,7 @@ static struct pci_ops ks_child_pcie_ops = {
  */
 static int ks_pcie_v3_65_add_bus(struct pci_bus *bus)
 {
-	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie_rp *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
 
@@ -574,7 +574,7 @@ static void ks_pcie_msi_irq_handler(struct irq_desc *desc)
 	struct keystone_pcie *ks_pcie = irq_desc_get_handler_data(desc);
 	u32 offset = irq - ks_pcie->msi_host_irq;
 	struct dw_pcie *pci = ks_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 vector, reg, pos;
@@ -799,7 +799,7 @@ static int __init ks_pcie_init_id(struct keystone_pcie *ks_pcie)
 	return 0;
 }
 
-static int __init ks_pcie_host_init(struct pcie_port *pp)
+static int __init ks_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 6a4f0619bb1c..879b8692f96a 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -74,7 +74,7 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
 	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
 }
 
-static int ls_pcie_host_init(struct pcie_port *pp)
+static int ls_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct ls_pcie *pcie = to_ls_pcie(pci);
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index f44bf347904a..c1527693bed9 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -370,7 +370,7 @@ static int meson_pcie_link_up(struct dw_pcie *pci)
 	return 0;
 }
 
-static int meson_pcie_host_init(struct pcie_port *pp)
+static int meson_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct meson_pcie *mp = to_meson_pcie(pci);
diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index e8afa50129a8..b8cb77c9c4bd 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -217,7 +217,7 @@ static inline void al_pcie_target_bus_set(struct al_pcie *pcie,
 static void __iomem *al_pcie_conf_addr_map_bus(struct pci_bus *bus,
 					       unsigned int devfn, int where)
 {
-	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie_rp *pp = bus->sysdata;
 	struct al_pcie *pcie = to_al_pcie(to_dw_pcie_from_pp(pp));
 	unsigned int busnr = bus->number;
 	struct al_pcie_target_bus_cfg *target_bus_cfg = &pcie->target_bus_cfg;
@@ -245,7 +245,7 @@ static struct pci_ops al_child_pci_ops = {
 static void al_pcie_config_prepare(struct al_pcie *pcie)
 {
 	struct al_pcie_target_bus_cfg *target_bus_cfg;
-	struct pcie_port *pp = &pcie->pci->pp;
+	struct dw_pcie_rp *pp = &pcie->pci->pp;
 	unsigned int ecam_bus_mask;
 	u32 cfg_control_offset;
 	u8 subordinate_bus;
@@ -289,7 +289,7 @@ static void al_pcie_config_prepare(struct al_pcie *pcie)
 	al_pcie_controller_writel(pcie, cfg_control_offset, reg);
 }
 
-static int al_pcie_host_init(struct pcie_port *pp)
+static int al_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct al_pcie *pcie = to_al_pcie(pci);
diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index 4e2552dcf982..8b113d3f3095 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -166,7 +166,7 @@ static int armada8k_pcie_start_link(struct dw_pcie *pci)
 	return 0;
 }
 
-static int armada8k_pcie_host_init(struct pcie_port *pp)
+static int armada8k_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	u32 reg;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -233,7 +233,7 @@ static int armada8k_add_pcie_port(struct armada8k_pcie *pcie,
 				  struct platform_device *pdev)
 {
 	struct dw_pcie *pci = pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = &pdev->dev;
 	int ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 2f15441770e1..98102079e26d 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -97,7 +97,7 @@ static void artpec6_pcie_writel(struct artpec6_pcie *artpec6_pcie, u32 offset, u
 static u64 artpec6_pcie_cpu_addr_fixup(struct dw_pcie *pci, u64 pci_addr)
 {
 	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	struct dw_pcie_ep *ep = &pci->ep;
 
 	switch (artpec6_pcie->mode) {
@@ -315,7 +315,7 @@ static void artpec6_pcie_deassert_core_reset(struct artpec6_pcie *artpec6_pcie)
 	usleep_range(100, 200);
 }
 
-static int artpec6_pcie_host_init(struct pcie_port *pp)
+static int artpec6_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 7ff2b7555b91..95256434913f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -53,7 +53,7 @@ static struct msi_domain_info dw_pcie_msi_domain_info = {
 };
 
 /* MSI int handler */
-irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
+irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp)
 {
 	int i, pos;
 	unsigned long val;
@@ -88,7 +88,7 @@ irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
 static void dw_chained_msi_isr(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct pcie_port *pp;
+	struct dw_pcie_rp *pp;
 
 	chained_irq_enter(chip, desc);
 
@@ -100,7 +100,7 @@ static void dw_chained_msi_isr(struct irq_desc *desc)
 
 static void dw_pci_setup_msi_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	u64 msi_target;
 
@@ -123,7 +123,7 @@ static int dw_pci_msi_set_affinity(struct irq_data *d,
 
 static void dw_pci_bottom_mask(struct irq_data *d)
 {
-	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 	unsigned long flags;
@@ -142,7 +142,7 @@ static void dw_pci_bottom_mask(struct irq_data *d)
 
 static void dw_pci_bottom_unmask(struct irq_data *d)
 {
-	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 	unsigned long flags;
@@ -161,7 +161,7 @@ static void dw_pci_bottom_unmask(struct irq_data *d)
 
 static void dw_pci_bottom_ack(struct irq_data *d)
 {
-	struct pcie_port *pp  = irq_data_get_irq_chip_data(d);
+	struct dw_pcie_rp *pp  = irq_data_get_irq_chip_data(d);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 
@@ -185,7 +185,7 @@ static int dw_pcie_irq_domain_alloc(struct irq_domain *domain,
 				    unsigned int virq, unsigned int nr_irqs,
 				    void *args)
 {
-	struct pcie_port *pp = domain->host_data;
+	struct dw_pcie_rp *pp = domain->host_data;
 	unsigned long flags;
 	u32 i;
 	int bit;
@@ -213,7 +213,7 @@ static void dw_pcie_irq_domain_free(struct irq_domain *domain,
 				    unsigned int virq, unsigned int nr_irqs)
 {
 	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
-	struct pcie_port *pp = domain->host_data;
+	struct dw_pcie_rp *pp = domain->host_data;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&pp->lock, flags);
@@ -229,7 +229,7 @@ static const struct irq_domain_ops dw_pcie_msi_domain_ops = {
 	.free	= dw_pcie_irq_domain_free,
 };
 
-int dw_pcie_allocate_domains(struct pcie_port *pp)
+int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct fwnode_handle *fwnode = of_node_to_fwnode(pci->dev->of_node);
@@ -255,7 +255,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
 	return 0;
 }
 
-static void dw_pcie_free_msi(struct pcie_port *pp)
+static void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 {
 	if (pp->msi_irq)
 		irq_set_chained_handler_and_data(pp->msi_irq, NULL, NULL);
@@ -272,7 +272,7 @@ static void dw_pcie_free_msi(struct pcie_port *pp)
 	}
 }
 
-static void dw_pcie_msi_init(struct pcie_port *pp)
+static void dw_pcie_msi_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	u64 msi_target = (u64)pp->msi_data;
@@ -285,7 +285,7 @@ static void dw_pcie_msi_init(struct pcie_port *pp)
 	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_HI, upper_32_bits(msi_target));
 }
 
-int dw_pcie_host_init(struct pcie_port *pp)
+int dw_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct device *dev = pci->dev;
@@ -436,7 +436,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_init);
 
-void dw_pcie_host_deinit(struct pcie_port *pp)
+void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
@@ -455,7 +455,7 @@ static void __iomem *dw_pcie_other_conf_map_bus(struct pci_bus *bus,
 {
 	int type;
 	u32 busdev;
-	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie_rp *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	/*
@@ -487,7 +487,7 @@ static int dw_pcie_rd_other_conf(struct pci_bus *bus, unsigned int devfn,
 				 int where, int size, u32 *val)
 {
 	int ret;
-	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie_rp *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	ret = pci_generic_config_read(bus, devfn, where, size, val);
@@ -503,7 +503,7 @@ static int dw_pcie_wr_other_conf(struct pci_bus *bus, unsigned int devfn,
 				 int where, int size, u32 val)
 {
 	int ret;
-	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie_rp *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	ret = pci_generic_config_write(bus, devfn, where, size, val);
@@ -523,7 +523,7 @@ static struct pci_ops dw_child_pcie_ops = {
 
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn, int where)
 {
-	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie_rp *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	if (PCI_SLOT(devfn) > 0)
@@ -539,7 +539,7 @@ static struct pci_ops dw_pcie_ops = {
 	.write = pci_generic_config_write,
 };
 
-void dw_pcie_setup_rc(struct pcie_port *pp)
+void dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 	u32 val, ctrl, num_ctrls;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index abf1afac6064..97de6ad7f9db 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -87,7 +87,7 @@ static int dw_plat_add_pcie_port(struct dw_plat_pcie *dw_plat_pcie,
 				 struct platform_device *pdev)
 {
 	struct dw_pcie *pci = dw_plat_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = &pdev->dev;
 	int ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 13bffa3eaed6..32df3ebccf19 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -155,8 +155,8 @@
 #define MAX_IATU_IN			256
 #define MAX_IATU_OUT			256
 
-struct pcie_port;
 struct dw_pcie;
+struct dw_pcie_rp;
 struct dw_pcie_ep;
 
 enum dw_pcie_region_type {
@@ -173,11 +173,11 @@ enum dw_pcie_device_mode {
 };
 
 struct dw_pcie_host_ops {
-	int (*host_init)(struct pcie_port *pp);
-	int (*msi_host_init)(struct pcie_port *pp);
+	int (*host_init)(struct dw_pcie_rp *pp);
+	int (*msi_host_init)(struct dw_pcie_rp *pp);
 };
 
-struct pcie_port {
+struct dw_pcie_rp {
 	bool			has_msi_ctrl:1;
 	bool			cfg0_io_shared:1;
 	u64			cfg0_base;
@@ -267,7 +267,7 @@ struct dw_pcie {
 	size_t			atu_size;
 	u32			num_ib_windows;
 	u32			num_ob_windows;
-	struct pcie_port	pp;
+	struct dw_pcie_rp	pp;
 	struct dw_pcie_ep	ep;
 	const struct dw_pcie_ops *ops;
 	unsigned int		version;
@@ -380,33 +380,33 @@ static inline void dw_pcie_stop_link(struct dw_pcie *pci)
 }
 
 #ifdef CONFIG_PCIE_DW_HOST
-irqreturn_t dw_handle_msi_irq(struct pcie_port *pp);
-void dw_pcie_setup_rc(struct pcie_port *pp);
-int dw_pcie_host_init(struct pcie_port *pp);
-void dw_pcie_host_deinit(struct pcie_port *pp);
-int dw_pcie_allocate_domains(struct pcie_port *pp);
+irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp);
+void dw_pcie_setup_rc(struct dw_pcie_rp *pp);
+int dw_pcie_host_init(struct dw_pcie_rp *pp);
+void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
+int dw_pcie_allocate_domains(struct dw_pcie_rp *pp);
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 				       int where);
 #else
-static inline irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
+static inline irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp)
 {
 	return IRQ_NONE;
 }
 
-static inline void dw_pcie_setup_rc(struct pcie_port *pp)
+static inline void dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 }
 
-static inline int dw_pcie_host_init(struct pcie_port *pp)
+static inline int dw_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	return 0;
 }
 
-static inline void dw_pcie_host_deinit(struct pcie_port *pp)
+static inline void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
 {
 }
 
-static inline int dw_pcie_allocate_domains(struct pcie_port *pp)
+static inline int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 8c5bb9d7cc36..c1e7653e508e 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -186,7 +186,7 @@ static int rockchip_pcie_start_link(struct dw_pcie *pci)
 	return 0;
 }
 
-static int rockchip_pcie_host_init(struct pcie_port *pp)
+static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
@@ -288,7 +288,7 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rockchip_pcie *rockchip;
-	struct pcie_port *pp;
+	struct dw_pcie_rp *pp;
 	int ret;
 
 	rockchip = devm_kzalloc(dev, sizeof(*rockchip), GFP_KERNEL);
diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 02cc70d8cc06..da059f1c9e92 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -236,7 +236,7 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
 	return ret;
 }
 
-static int fu740_pcie_host_init(struct pcie_port *pp)
+static int fu740_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct fu740_pcie *afp = to_fu740_pcie(pci);
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index 410555dccb6d..e2b80f10030d 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -74,7 +74,7 @@ static void histb_pcie_writel(struct histb_pcie *histb_pcie, u32 reg, u32 val)
 	writel(val, histb_pcie->ctrl + reg);
 }
 
-static void histb_pcie_dbi_w_mode(struct pcie_port *pp, bool enable)
+static void histb_pcie_dbi_w_mode(struct dw_pcie_rp *pp, bool enable)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct histb_pcie *hipcie = to_histb_pcie(pci);
@@ -88,7 +88,7 @@ static void histb_pcie_dbi_w_mode(struct pcie_port *pp, bool enable)
 	histb_pcie_writel(hipcie, PCIE_SYS_CTRL0, val);
 }
 
-static void histb_pcie_dbi_r_mode(struct pcie_port *pp, bool enable)
+static void histb_pcie_dbi_r_mode(struct dw_pcie_rp *pp, bool enable)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct histb_pcie *hipcie = to_histb_pcie(pci);
@@ -180,7 +180,7 @@ static int histb_pcie_start_link(struct dw_pcie *pci)
 	return 0;
 }
 
-static int histb_pcie_host_init(struct pcie_port *pp)
+static int histb_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct histb_pcie *hipcie = to_histb_pcie(pci);
@@ -219,7 +219,7 @@ static void histb_pcie_host_disable(struct histb_pcie *hipcie)
 		regulator_disable(hipcie->vpcie);
 }
 
-static int histb_pcie_host_enable(struct pcie_port *pp)
+static int histb_pcie_host_enable(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct histb_pcie *hipcie = to_histb_pcie(pci);
@@ -297,7 +297,7 @@ static int histb_pcie_probe(struct platform_device *pdev)
 {
 	struct histb_pcie *hipcie;
 	struct dw_pcie *pci;
-	struct pcie_port *pp;
+	struct dw_pcie_rp *pp;
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	enum of_gpio_flags of_flags;
diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 5ba144924ff8..07bc54886d71 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -343,7 +343,7 @@ static void __intel_pcie_remove(struct intel_pcie *pcie)
 static int intel_pcie_remove(struct platform_device *pdev)
 {
 	struct intel_pcie *pcie = platform_get_drvdata(pdev);
-	struct pcie_port *pp = &pcie->pci.pp;
+	struct dw_pcie_rp *pp = &pcie->pci.pp;
 
 	dw_pcie_host_deinit(pp);
 	__intel_pcie_remove(pcie);
@@ -373,7 +373,7 @@ static int __maybe_unused intel_pcie_resume_noirq(struct device *dev)
 	return intel_pcie_host_setup(pcie);
 }
 
-static int intel_pcie_rc_init(struct pcie_port *pp)
+static int intel_pcie_rc_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct intel_pcie *pcie = dev_get_drvdata(pci->dev);
@@ -403,7 +403,7 @@ static int intel_pcie_probe(struct platform_device *pdev)
 	const struct intel_pcie_soc *data;
 	struct device *dev = &pdev->dev;
 	struct intel_pcie *pcie;
-	struct pcie_port *pp;
+	struct dw_pcie_rp *pp;
 	struct dw_pcie *pci;
 	int ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 1ac29a6eef22..58f3caf75cff 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -231,7 +231,7 @@ static void keembay_pcie_msi_irq_handler(struct irq_desc *desc)
 	struct keembay_pcie *pcie = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 val, mask, status;
-	struct pcie_port *pp;
+	struct dw_pcie_rp *pp;
 
 	/*
 	 * Keem Bay PCIe Controller provides an additional IP logic on top of
@@ -332,7 +332,7 @@ static int keembay_pcie_add_pcie_port(struct keembay_pcie *pcie,
 				      struct platform_device *pdev)
 {
 	struct dw_pcie *pci = &pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = &pdev->dev;
 	u32 val;
 	int ret;
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index a52cad269f85..7f67aad71df4 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -620,7 +620,7 @@ static int kirin_pcie_start_link(struct dw_pcie *pci)
 	return 0;
 }
 
-static int kirin_pcie_host_init(struct pcie_port *pp)
+static int kirin_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	pp->bridge->ops = &kirin_pci_ops;
 
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 2ea13750b492..a9b2322624d5 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1381,7 +1381,7 @@ static int qcom_pcie_config_sid_sm8250(struct qcom_pcie *pcie)
 	return 0;
 }
 
-static int qcom_pcie_host_init(struct pcie_port *pp)
+static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
@@ -1564,7 +1564,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 static int qcom_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct pcie_port *pp;
+	struct dw_pcie_rp *pp;
 	struct dw_pcie *pci;
 	struct qcom_pcie *pcie;
 	const struct qcom_pcie_cfg *pcie_cfg;
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 1569e82b5568..7fd698da144e 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -85,7 +85,7 @@ static irqreturn_t spear13xx_pcie_irq_handler(int irq, void *arg)
 	struct spear13xx_pcie *spear13xx_pcie = arg;
 	struct pcie_app_reg __iomem *app_reg = spear13xx_pcie->app_base;
 	struct dw_pcie *pci = spear13xx_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	unsigned int status;
 
 	status = readl(&app_reg->int_sts);
@@ -121,7 +121,7 @@ static int spear13xx_pcie_link_up(struct dw_pcie *pci)
 	return 0;
 }
 
-static int spear13xx_pcie_host_init(struct pcie_port *pp)
+static int spear13xx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct spear13xx_pcie *spear13xx_pcie = to_spear13xx_pcie(pci);
@@ -155,7 +155,7 @@ static int spear13xx_add_pcie_port(struct spear13xx_pcie *spear13xx_pcie,
 				   struct platform_device *pdev)
 {
 	struct dw_pcie *pci = spear13xx_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = &pdev->dev;
 	int ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index cc2678490162..65135f5c4a4a 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -311,7 +311,7 @@ struct tegra_pcie_soc {
 	enum dw_pcie_device_mode mode;
 };
 
-static void apply_bad_link_workaround(struct pcie_port *pp)
+static void apply_bad_link_workaround(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
@@ -349,7 +349,7 @@ static irqreturn_t tegra_pcie_rp_irq_handler(int irq, void *arg)
 {
 	struct tegra194_pcie *pcie = arg;
 	struct dw_pcie *pci = &pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	u32 val, tmp;
 	u16 val_w;
 
@@ -698,7 +698,7 @@ static inline void init_host_aspm(struct tegra194_pcie *pcie) { return; }
 static inline void init_debugfs(struct tegra194_pcie *pcie) { return; }
 #endif
 
-static void tegra_pcie_enable_system_interrupts(struct pcie_port *pp)
+static void tegra_pcie_enable_system_interrupts(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
@@ -736,7 +736,7 @@ static void tegra_pcie_enable_system_interrupts(struct pcie_port *pp)
 			   val_w);
 }
 
-static void tegra_pcie_enable_legacy_interrupts(struct pcie_port *pp)
+static void tegra_pcie_enable_legacy_interrupts(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
@@ -757,7 +757,7 @@ static void tegra_pcie_enable_legacy_interrupts(struct pcie_port *pp)
 	appl_writel(pcie, val, APPL_INTR_EN_L1_8_0);
 }
 
-static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
+static void tegra_pcie_enable_msi_interrupts(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
@@ -770,7 +770,7 @@ static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
 	appl_writel(pcie, val, APPL_INTR_EN_L0_0);
 }
 
-static void tegra_pcie_enable_interrupts(struct pcie_port *pp)
+static void tegra_pcie_enable_interrupts(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
@@ -851,7 +851,7 @@ static void config_gen3_gen4_eq_presets(struct tegra194_pcie *pcie)
 	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
 }
 
-static int tegra194_pcie_host_init(struct pcie_port *pp)
+static int tegra194_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
@@ -916,7 +916,7 @@ static int tegra194_pcie_start_link(struct dw_pcie *pci)
 {
 	u32 val, offset, speed, tmp;
 	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	bool retry = true;
 
 	if (pcie->mode == DW_PCIE_EP_TYPE) {
@@ -1212,7 +1212,7 @@ static int tegra_pcie_bpmp_set_pll_state(struct tegra194_pcie *pcie,
 
 static void tegra_pcie_downstream_dev_to_D0(struct tegra194_pcie *pcie)
 {
-	struct pcie_port *pp = &pcie->pci.pp;
+	struct dw_pcie_rp *pp = &pcie->pci.pp;
 	struct pci_bus *child, *root_bus = NULL;
 	struct pci_dev *pdev;
 
@@ -1443,7 +1443,7 @@ static void tegra_pcie_unconfig_controller(struct tegra194_pcie *pcie)
 static int tegra_pcie_init_controller(struct tegra194_pcie *pcie)
 {
 	struct dw_pcie *pci = &pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
 
 	ret = tegra_pcie_config_controller(pcie, false);
@@ -1961,7 +1961,7 @@ static int tegra194_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *atu_dma_res;
 	struct tegra194_pcie *pcie;
-	struct pcie_port *pp;
+	struct dw_pcie_rp *pp;
 	struct dw_pcie *pci;
 	struct phy **phys;
 	char *name;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index b45ac3754242..48c3eba817b4 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -171,7 +171,7 @@ static void uniphier_pcie_irq_enable(struct uniphier_pcie *pcie)
 
 static void uniphier_pcie_irq_mask(struct irq_data *d)
 {
-	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
 	unsigned long flags;
@@ -188,7 +188,7 @@ static void uniphier_pcie_irq_mask(struct irq_data *d)
 
 static void uniphier_pcie_irq_unmask(struct irq_data *d)
 {
-	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
 	unsigned long flags;
@@ -225,7 +225,7 @@ static const struct irq_domain_ops uniphier_intx_domain_ops = {
 
 static void uniphier_pcie_irq_handler(struct irq_desc *desc)
 {
-	struct pcie_port *pp = irq_desc_get_handler_data(desc);
+	struct dw_pcie_rp *pp = irq_desc_get_handler_data(desc);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -258,7 +258,7 @@ static void uniphier_pcie_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int uniphier_pcie_config_legacy_irq(struct pcie_port *pp)
+static int uniphier_pcie_config_legacy_irq(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
@@ -295,7 +295,7 @@ static int uniphier_pcie_config_legacy_irq(struct pcie_port *pp)
 	return ret;
 }
 
-static int uniphier_pcie_host_init(struct pcie_port *pp)
+static int uniphier_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
index 50f80f07e4db..71026fefa366 100644
--- a/drivers/pci/controller/dwc/pcie-visconti.c
+++ b/drivers/pci/controller/dwc/pcie-visconti.c
@@ -178,7 +178,7 @@ static void visconti_pcie_stop_link(struct dw_pcie *pci)
  */
 static u64 visconti_pcie_cpu_addr_fixup(struct dw_pcie *pci, u64 cpu_addr)
 {
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 
 	return cpu_addr & ~pp->io_base;
 }
@@ -190,7 +190,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 	.stop_link = visconti_pcie_stop_link,
 };
 
-static int visconti_pcie_host_init(struct pcie_port *pp)
+static int visconti_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct visconti_pcie *pcie = dev_get_drvdata(pci->dev);
@@ -278,7 +278,7 @@ static int visconti_add_pcie_port(struct visconti_pcie *pcie,
 				  struct platform_device *pdev)
 {
 	struct dw_pcie *pci = &pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct dw_pcie_rp *pp = &pci->pp;
 
 	pp->irq = platform_get_irq_byname(pdev, "intr");
 	if (pp->irq < 0)
-- 
2.35.1

