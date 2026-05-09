Return-Path: <linux-arm-msm+bounces-106773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJwPEmM8/2kQ3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 15:53:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A97C4FFE6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 15:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F249A30054F4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 13:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8973038CFF8;
	Sat,  9 May 2026 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W2ZZ42Y8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A75633F580;
	Sat,  9 May 2026 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778334814; cv=none; b=uRhAqV4A5S35Zl9E/FshD67peNu0xw8u80iEiPI2Wkvwq0QH4wl99DCiNKbR0zOdrW2OYUjp+v/deqitSFhLtCbvPe3ilnmrRHCgE6ALlulCZ+BYS+D4jp0s5EDvdtZ1kmhCS4muHG2IECdL1n4jF2qAM9HyBTCbfkXPxUHsk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778334814; c=relaxed/simple;
	bh=8TLiI9LtglvQIlwwvvoeDYjEpoeHmafpexwJm0HumI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ApWt1lTp8EH7Xa2rst0hv0QHIgnK3I86y7dla62PKFTB6iyvvrkONChgJm/R/ZIKtuHcUYaTb6oWbkFlFN720VUiOKpJVi2BlFY3+4Q4fwEeg/+lNpG2ZcILbSVZ3xrCVzNkZkaj4enXKSwtVKfJ5rKXH4pakuBMV9pNaR2RE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W2ZZ42Y8; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bA
	NmvbLt+8Ujqf6tYt1+682HyqqifCqoKidfg9mgZAE=; b=W2ZZ42Y88kYSULRPhs
	GVnKkWbp8CHhnbXdmTp3wWc6HxYG+850fIqoKx8Zf1Dznqq2BHQd3ZHPRfAUBRQf
	vdP/ljd8Gz9M4KBKQ8SeRqsTDvUU5a9QlqOb7PUiTweaxkWqwbtTUSU7vq76xQrf
	fZ8EhNs3cqk+wUinSMdBCN4q0=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXLzL8O_9p486jAQ--.37610S5;
	Sat, 09 May 2026 21:52:00 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: mx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 3/3] PCI: dwc: Simplify platform drivers using cached capability offset
Date: Sat,  9 May 2026 21:51:52 +0800
Message-Id: <20260509135152.2241235-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509135152.2241235-1-18255117159@163.com>
References: <20260509135152.2241235-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXLzL8O_9p486jAQ--.37610S5
X-Coremail-Antispam: 1Uf129KBjvAXoWfCFykJFykWr15uF1kWw48WFg_yoW8uF1fGo
	Z3Xry8X3W7Gr18XrWIvanxKry7ZwnFv3W5Arn293yDu343A3W5Jr93J3Z8uw12kr4Iyw45
	AayDGw1fZFsrWw17n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RRrWFUUUUU
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wBpDWn-PAC1jgAA3e
X-Rspamd-Queue-Id: 0A97C4FFE6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[google.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-106773-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.ozlabs.org,lists.infradead.org,vger.kernel.org,163.com];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Replace explicit dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) calls
with the cached pci->pcie_cap in all DWC-based platform drivers:

- i.MX6, Layerscape EP, Meson
- Rockchip (also remove redundant NULL check and fix typo)
- Eswin, Fu740
- Intel Gateway, Qualcomm EP, Qualcomm RC
- Sophgo, Spacemit-k1, Spear13xx
- Tegra194 (remove private pcie_cap_base)

For drivers that need the offset before the core caches it (e.g.,
ls_pcie_ep_probe), use dw_pcie_get_pcie_cap() to ensure caching.

Adjust variable types from u16 to u8 where appropriate.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pci-imx6.c         |  6 +--
 .../pci/controller/dwc/pci-layerscape-ep.c    |  4 +-
 drivers/pci/controller/dwc/pci-meson.c        |  4 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++---
 drivers/pci/controller/dwc/pcie-eswin.c       |  3 +-
 drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 11 ++--
 drivers/pci/controller/dwc/pcie-qcom.c        | 24 ++++-----
 drivers/pci/controller/dwc/pcie-sophgo.c      |  8 ++-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c |  5 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  6 +--
 drivers/pci/controller/dwc/pcie-tegra194.c    | 51 +++++++------------
 13 files changed, 56 insertions(+), 85 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index e35044cc5218..dc464b460fc1 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -936,10 +936,10 @@ static void imx_pcie_ltssm_enable(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
 	const struct imx_pcie_drvdata *drvdata = imx_pcie->drvdata;
-	u8 offset = dw_pcie_find_capability(imx_pcie->pci, PCI_CAP_ID_EXP);
+	struct dw_pcie *pci = imx_pcie->pci;
 	u32 tmp;
 
-	tmp = dw_pcie_readl_dbi(imx_pcie->pci, offset + PCI_EXP_LNKCAP);
+	tmp = dw_pcie_readl_dbi(pci, pci->pcie_cap + PCI_EXP_LNKCAP);
 	phy_set_speed(imx_pcie->phy, FIELD_GET(PCI_EXP_LNKCAP_SLS, tmp));
 	if (drvdata->ltssm_mask)
 		regmap_update_bits(imx_pcie->iomuxc_gpr, drvdata->ltssm_off, drvdata->ltssm_mask,
@@ -965,7 +965,7 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
 {
 	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
 	struct device *dev = pci->dev;
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = pci->pcie_cap;
 	u32 tmp;
 	int ret;
 
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 8936975ff104..fdb89ae13e4a 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -84,7 +84,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 
 	if (val & PEX_PF0_PME_MES_DR_LUD) {
 
-		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+		offset = dw_pcie_get_pcie_cap(pci);
 
 		/*
 		 * The values of the Maximum Link Width and Supported Link
@@ -266,7 +266,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 
 	ret = dw_pcie_ep_init(&pci->ep);
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f612b..e8750178fbb0 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -276,7 +276,7 @@ static void meson_set_max_payload(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
 	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = pci->pcie_cap;
 	int max_payload_size = meson_size_to_payload(mp, size);
 
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
@@ -292,7 +292,7 @@ static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
 	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = pci->pcie_cap;
 	int max_rd_req_size = meson_size_to_payload(mp, size);
 
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 731d93663cca..9acdc18a573e 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -366,17 +366,14 @@ static void rockchip_pcie_configure_l1ss(struct dw_pcie *pci)
 
 static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
 {
-	u32 cap, lnkcap;
+	u32 lnkcap;
 
 	/* Enable L0S capability for all SoCs */
-	cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	if (cap) {
-		lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
-		lnkcap |= PCI_EXP_LNKCAP_ASPM_L0S;
-		dw_pcie_dbi_ro_wr_en(pci);
-		dw_pcie_writel_dbi(pci, cap + PCI_EXP_LNKCAP, lnkcap);
-		dw_pcie_dbi_ro_wr_dis(pci);
-	}
+	lnkcap = dw_pcie_readl_dbi(pci, pci->pcie_cap + PCI_EXP_LNKCAP);
+	lnkcap |= PCI_EXP_LNKCAP_ASPM_L0S;
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writel_dbi(pci, pci->pcie_cap + PCI_EXP_LNKCAP, lnkcap);
+	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
 static int rockchip_pcie_start_link(struct dw_pcie *pci)
diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index 2845832b3824..2e5b94c27026 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -84,8 +84,7 @@ static int eswin_pcie_start_link(struct dw_pcie *pci)
 
 static bool eswin_pcie_link_up(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	u16 val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
+	u16 val = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 66367252032b..553a940e6d89 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -179,7 +179,7 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
 {
 	struct device *dev = pci->dev;
 	struct fu740_pcie *afp = dev_get_drvdata(dev);
-	u8 cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 cap_exp = pci->pcie_cap;
 	int ret;
 	u32 orig, tmp;
 
diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index c21906eced61..939b9dcac7fe 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -121,7 +121,7 @@ static void intel_pcie_ltssm_disable(struct intel_pcie *pcie)
 static void intel_pcie_link_setup(struct intel_pcie *pcie)
 {
 	u32 val;
-	u8 offset = dw_pcie_find_capability(&pcie->pci, PCI_CAP_ID_EXP);
+	u8 offset = pcie->pci.pcie_cap;
 
 	val = pcie_rc_cfg_rd(pcie, offset + PCI_EXP_LNKCTL);
 
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 257c2bcb5f76..d041189be248 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -307,14 +307,14 @@ static void qcom_pcie_dw_write_dbi2(struct dw_pcie *pci, void __iomem *base,
 static void qcom_pcie_ep_icc_update(struct qcom_pcie_ep *pcie_ep)
 {
 	struct dw_pcie *pci = &pcie_ep->pci;
-	u32 offset, status;
-	int speed, width;
-	int ret;
+	int speed, width, ret;
+	u32 status;
+	u8 offset;
 
 	if (!pcie_ep->icc_mem)
 		return;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
 
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
@@ -492,14 +492,13 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_en(pci);
 
 	/* Set the L0s Exit Latency to 2us-4us = 0x6 */
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	val &= ~PCI_EXP_LNKCAP_L0SEL;
 	val |= FIELD_PREP(PCI_EXP_LNKCAP_L0SEL, 0x6);
 	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
 
 	/* Set the L1 Exit Latency to be 32us-64 us = 0x6 */
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	val &= ~PCI_EXP_LNKCAP_L1EL;
 	val |= FIELD_PREP(PCI_EXP_LNKCAP_L1EL, 0x6);
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..ddb0ae2bf64b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -333,26 +333,22 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
 static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
 {
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
-	u16 offset;
 	u32 val;
 
 	if (!pcie->cfg->no_l0s)
 		return;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-
 	dw_pcie_dbi_ro_wr_en(pci);
 
-	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);
+	val = readl(pci->dbi_base + pci->pcie_cap + PCI_EXP_LNKCAP);
 	val &= ~PCI_EXP_LNKCAP_ASPM_L0S;
-	writel(val, pci->dbi_base + offset + PCI_EXP_LNKCAP);
+	writel(val, pci->dbi_base + pci->pcie_cap + PCI_EXP_LNKCAP);
 
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
 static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 
 	dw_pcie_dbi_ro_wr_en(pci);
@@ -362,9 +358,9 @@ static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
 	 * notifications for the Hot-Plug commands. So set the NCCS field to
 	 * avoid waiting for the completions.
 	 */
-	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
+	val = readl(pci->dbi_base + pci->pcie_cap + PCI_EXP_SLTCAP);
 	val |= PCI_EXP_SLTCAP_NCCS;
-	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
+	writel(val, pci->dbi_base + pci->pcie_cap + PCI_EXP_SLTCAP);
 
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
@@ -900,7 +896,7 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 {
 	struct dw_pcie *pci = pcie->pci;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = pci->pcie_cap;
 	u32 val;
 
 	val = readl(pcie->parf + PARF_PHY_CTRL);
@@ -1209,7 +1205,7 @@ static int qcom_pcie_init_2_9_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 {
 	struct dw_pcie *pci = pcie->pci;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = pci->pcie_cap;
 	u32 val;
 	int i;
 
@@ -1254,8 +1250,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 
 static bool qcom_pcie_link_up(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	u16 val = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
+	u16 val = readw(pci->dbi_base + pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
@@ -1559,15 +1554,14 @@ static int qcom_pcie_icc_init(struct qcom_pcie *pcie)
 
 static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 {
-	u32 offset, status, width, speed;
+	u32 status, width, speed;
 	struct dw_pcie *pci = pcie->pci;
 	struct dev_pm_opp_key key = {};
 	unsigned long freq_kbps;
 	struct dev_pm_opp *opp;
 	int ret, freq_mbps;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
+	status = readw(pci->dbi_base + pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	/* Only update constraints if link is up. */
 	if (!(status & PCI_EXP_LNKSTA_DLLLA))
diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819..5a2cd95c6de7 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -164,15 +164,13 @@ static void sophgo_pcie_msi_enable(struct dw_pcie_rp *pp)
 static void sophgo_pcie_disable_l0s_l1(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	u32 offset, val;
-
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 val;
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
-	val = dw_pcie_readl_dbi(pci, PCI_EXP_LNKCAP + offset);
+	val = dw_pcie_readl_dbi(pci, PCI_EXP_LNKCAP + pci->pcie_cap);
 	val &= ~(PCI_EXP_LNKCAP_ASPM_L0S | PCI_EXP_LNKCAP_ASPM_L1);
-	dw_pcie_writel_dbi(pci, PCI_EXP_LNKCAP + offset, val);
+	dw_pcie_writel_dbi(pci, PCI_EXP_LNKCAP + pci->pcie_cap, val);
 
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index be20a520255b..6f0556336f44 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -114,12 +114,9 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
 static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 {
 	struct dw_pcie *pci = &k1->pci;
-	u8 offset;
+	u8 offset = pci->pcie_cap + PCI_EXP_LNKCAP;
 	u32 val;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	offset += PCI_EXP_LNKCAP;
-
 	dw_pcie_dbi_ro_wr_en(pci);
 	val = dw_pcie_readl_dbi(pci, offset);
 	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 01794a9d3ad2..920454266f3f 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -122,7 +122,7 @@ static int spear13xx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct spear13xx_pcie *spear13xx_pcie = to_spear13xx_pcie(pci);
-	u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = pci->pcie_cap;
 	u32 val;
 
 	spear13xx_pcie->app_base = pci->dbi_base + 0x2000;
@@ -132,9 +132,9 @@ static int spear13xx_pcie_host_init(struct dw_pcie_rp *pp)
 	 * default value in capability register is 512 bytes. So force
 	 * it to 128 here.
 	 */
-	val = dw_pcie_readw_dbi(pci, exp_cap_off + PCI_EXP_DEVCTL);
+	val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_DEVCTL);
 	val &= ~PCI_EXP_DEVCTL_READRQ;
-	dw_pcie_writew_dbi(pci, exp_cap_off + PCI_EXP_DEVCTL, val);
+	dw_pcie_writew_dbi(pci, offset + PCI_EXP_DEVCTL, val);
 
 	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, 0x104A);
 	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, 0xCD80);
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 9dcfa194050e..0d5a5e9027d9 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -268,7 +268,6 @@ struct tegra_pcie_dw {
 	u32 num_lanes;
 	u32 cid;
 	u32 ras_des_cap;
-	u32 pcie_cap_base;
 	u32 aspm_cmrt;
 	u32 aspm_pwr_on_t;
 	u32 aspm_l0s_enter_lat;
@@ -312,7 +311,7 @@ static void tegra_pcie_icc_set(struct tegra_pcie_dw *pcie)
 	struct dw_pcie *pci = &pcie->pci;
 	u32 val, speed, width;
 
-	val = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base + PCI_EXP_LNKSTA);
+	val = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, val);
 	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, val);
@@ -340,22 +339,22 @@ static void apply_bad_link_workaround(struct dw_pcie_rp *pp)
 	 * stable anyway, not waiting to confirm if link is really
 	 * transitioning to Gen-2 speed
 	 */
-	val = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base + PCI_EXP_LNKSTA);
+	val = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA);
 	if (val & PCI_EXP_LNKSTA_LBMS) {
 		current_link_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, val);
 		if (pcie->init_link_width > current_link_width) {
 			dev_warn(pci->dev, "PCIe link is bad, width reduced\n");
-			val = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base +
+			val = dw_pcie_readw_dbi(pci, pci->pcie_cap +
 						PCI_EXP_LNKCTL2);
 			val &= ~PCI_EXP_LNKCTL2_TLS;
 			val |= PCI_EXP_LNKCTL2_TLS_2_5GT;
-			dw_pcie_writew_dbi(pci, pcie->pcie_cap_base +
+			dw_pcie_writew_dbi(pci, pci->pcie_cap +
 					   PCI_EXP_LNKCTL2, val);
 
-			val = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base +
+			val = dw_pcie_readw_dbi(pci, pci->pcie_cap +
 						PCI_EXP_LNKCTL);
 			val |= PCI_EXP_LNKCTL_RL;
-			dw_pcie_writew_dbi(pci, pcie->pcie_cap_base +
+			dw_pcie_writew_dbi(pci, pci->pcie_cap +
 					   PCI_EXP_LNKCTL, val);
 		}
 	}
@@ -399,17 +398,17 @@ static irqreturn_t tegra_pcie_rp_irq_handler(int irq, void *arg)
 			apply_bad_link_workaround(pp);
 		}
 		if (status_l1 & APPL_INTR_STATUS_L1_8_0_BW_MGT_INT_STS) {
-			val_w = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base +
+			val_w = dw_pcie_readw_dbi(pci, pci->pcie_cap +
 						  PCI_EXP_LNKSTA);
 			val_w |= PCI_EXP_LNKSTA_LBMS;
-			dw_pcie_writew_dbi(pci, pcie->pcie_cap_base +
+			dw_pcie_writew_dbi(pci, pci->pcie_cap +
 					   PCI_EXP_LNKSTA, val_w);
 
 			appl_writel(pcie,
 				    APPL_INTR_STATUS_L1_8_0_BW_MGT_INT_STS,
 				    APPL_INTR_STATUS_L1_8_0);
 
-			val_w = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base +
+			val_w = dw_pcie_readw_dbi(pci, pci->pcie_cap +
 						  PCI_EXP_LNKSTA);
 			dev_dbg(pci->dev, "Link Speed : Gen-%u\n", val_w &
 				PCI_EXP_LNKSTA_CLS);
@@ -675,7 +674,7 @@ static void init_host_aspm(struct tegra_pcie_dw *pcie)
 
 	l1ss = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
 
-	pcie->ras_des_cap = dw_pcie_find_ext_capability(&pcie->pci,
+	pcie->ras_des_cap = dw_pcie_find_ext_capability(pci,
 							PCI_EXT_CAP_ID_VNDR);
 
 	/* Enable ASPM counters */
@@ -766,15 +765,12 @@ static void tegra_pcie_enable_system_interrupts(struct dw_pcie_rp *pp)
 		appl_writel(pcie, val, APPL_INTR_EN_L1_18);
 	}
 
-	val_w = dw_pcie_readw_dbi(&pcie->pci, pcie->pcie_cap_base +
-				  PCI_EXP_LNKSTA);
+	val_w = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA);
 	pcie->init_link_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, val_w);
 
-	val_w = dw_pcie_readw_dbi(&pcie->pci, pcie->pcie_cap_base +
-				  PCI_EXP_LNKCTL);
+	val_w = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKCTL);
 	val_w |= PCI_EXP_LNKCTL_LBMIE;
-	dw_pcie_writew_dbi(&pcie->pci, pcie->pcie_cap_base + PCI_EXP_LNKCTL,
-			   val_w);
+	dw_pcie_writew_dbi(pci, pci->pcie_cap + PCI_EXP_LNKCTL, val_w);
 }
 
 static void tegra_pcie_enable_intx_interrupts(struct dw_pcie_rp *pp)
@@ -903,10 +899,6 @@ static int tegra_pcie_dw_host_init(struct dw_pcie_rp *pp)
 
 	pp->bridge->ops = &tegra_pci_ops;
 
-	if (!pcie->pcie_cap_base)
-		pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
-							      PCI_CAP_ID_EXP);
-
 	val = dw_pcie_readl_dbi(pci, PCI_IO_BASE);
 	val &= ~(IO_BASE_IO_DECODE | IO_BASE_IO_DECODE_BIT8);
 	dw_pcie_writel_dbi(pci, PCI_IO_BASE, val);
@@ -927,10 +919,9 @@ static int tegra_pcie_dw_host_init(struct dw_pcie_rp *pp)
 
 	/* Clear Slot Clock Configuration bit if SRNS configuration */
 	if (pcie->enable_srns) {
-		val_16 = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base +
-					   PCI_EXP_LNKSTA);
+		val_16 = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA);
 		val_16 &= ~PCI_EXP_LNKSTA_SLC;
-		dw_pcie_writew_dbi(pci, pcie->pcie_cap_base + PCI_EXP_LNKSTA,
+		dw_pcie_writew_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA,
 				   val_16);
 	}
 
@@ -1047,8 +1038,7 @@ static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
 
 static bool tegra_pcie_dw_link_up(struct dw_pcie *pci)
 {
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
-	u32 val = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base + PCI_EXP_LNKSTA);
+	u32 val = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
@@ -1878,16 +1868,13 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
 	}
 
-	pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
-						      PCI_CAP_ID_EXP);
+	dw_pcie_get_pcie_cap(pci);
 
 	/* Clear Slot Clock Configuration bit if SRNS configuration */
 	if (pcie->enable_srns) {
-		val_16 = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base +
-					   PCI_EXP_LNKSTA);
+		val_16 = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA);
 		val_16 &= ~PCI_EXP_LNKSTA_SLC;
-		dw_pcie_writew_dbi(pci, pcie->pcie_cap_base + PCI_EXP_LNKSTA,
-				   val_16);
+		dw_pcie_writew_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA, val_16);
 	}
 
 	clk_set_rate(pcie->core_clk, GEN4_CORE_CLK_FREQ);
-- 
2.34.1


