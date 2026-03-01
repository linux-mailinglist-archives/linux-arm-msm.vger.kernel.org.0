Return-Path: <linux-arm-msm+bounces-94695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL8YAXOgo2noIgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 03:12:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 906721CD405
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 03:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8C973241585
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 01:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2BD3148A3;
	Sun,  1 Mar 2026 01:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQIPbLjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0A72BD0B;
	Sun,  1 Mar 2026 01:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329729; cv=none; b=PA5iZA7b9rrmrc1fFgfCpDRxIx4pQETtpxksUXm4TehIBr4u4vY7agL+zPaYZAuQ2Lr/7CoZDt5Rx0Cl2VyYK4j6Vm8Y33AtggHF38/9rjrLiCQPfta44xmXDSxe3DctBM1aZPHZ5nbCAS4kSYO7/4pNj/k0MaHwRkQIhaN1bXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329729; c=relaxed/simple;
	bh=jld1C/cQGZHRChFNbONpxk261WmQgfAtedyxGoviJIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uEp5qUcqWUCNWYEQWQ5Tt8OMRsa4vSgVViKb6/dUWLlkyMhStlV5olviYtKOg4tfP1E4LZLs0qtLp6SU4FTf2SVCASQ6ns7J76hznV0HxYS4jI9Tc0T1Vn7J1Yt4bXPS6kTHs6SpkPv+P56JccCngEfL/ERyMNMvj78pCenFeeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQIPbLjf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FA9C19424;
	Sun,  1 Mar 2026 01:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329728;
	bh=jld1C/cQGZHRChFNbONpxk261WmQgfAtedyxGoviJIA=;
	h=From:To:Cc:Subject:Date:From;
	b=gQIPbLjfxihwwRp1xUHbCpQ5DSBJ99M3TTLKJenerdkpUmq3h+91mAS3cDashMMHH
	 LfoQfgTN5lBQiG7hEBwbVP3SWDEmqg66A4CoQk+lyN0mfpYUKg+85utzXU2bwwW5RK
	 QOlH+a9WdUeuEvKSO2csDismZqz5ho7Csdhi/R45dB+4vDjG7EjDR0jBwrXcM+PUCt
	 0FfW2/h2rZusUmtpkGSIuXTEwfkR9zPiKeceHmr89Ej4M6BdI7Y8sxLmo+2WAoe7DF
	 mXXQTBMAeE/u3IFB7FtVLnKvhyPeDELPjhMxXLubvFugmnIZ90byeeWvgO4M7+Wb/o
	 U/vLklzmNOsYw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	cassel@kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "Revert "PCI: qcom: Enumerate endpoints based on Link up event in 'global_irq' interrupt"" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:48:46 -0500
Message-ID: <20260301014847.1713045-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94695-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rock-chips.com:email]
X-Rspamd-Queue-Id: 906721CD405
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 9a9793b55854422652ea92625e48277c4651c0fd Mon Sep 17 00:00:00 2001
From: Niklas Cassel <cassel@kernel.org>
Date: Mon, 22 Dec 2025 07:42:12 +0100
Subject: [PATCH] Revert "PCI: qcom: Enumerate endpoints based on Link up event
 in 'global_irq' interrupt"

This reverts commit 4581403f67929d02c197cb187c4e1e811c9e762a.

While this fake hotplugging was a nice idea, it has shown that this feature
does not handle PCIe switches correctly:
pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46

During the initial scan, PCI core doesn't see the switch and since the Root
Port is not hot plug capable, the secondary bus number gets assigned as the
subordinate bus number. This means, the PCI core assumes that only one bus
will appear behind the Root Port since the Root Port is not hot plug
capable.

This works perfectly fine for PCIe endpoints connected to the Root Port,
since they don't extend the bus. However, if a PCIe switch is connected,
then there is a problem when the downstream busses starts showing up and
the PCI core doesn't extend the subordinate bus number and bridge resources
after initial scan during boot.

The long term plan is to migrate this driver to the upcoming pwrctrl APIs
that are supposed to handle this problem elegantly.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
Cc: stable@vger.kernel.org
Link: https://patch.msgid.link/20251222064207.3246632-13-cassel@kernel.org
---
 drivers/pci/controller/dwc/pcie-qcom.c | 58 +-------------------------
 1 file changed, 1 insertion(+), 57 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c5fcb87972e91..13e6c334e10d2 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -55,9 +55,6 @@
 #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
 #define PARF_Q2A_FLUSH				0x1ac
 #define PARF_LTSSM				0x1b0
-#define PARF_INT_ALL_STATUS			0x224
-#define PARF_INT_ALL_CLEAR			0x228
-#define PARF_INT_ALL_MASK			0x22c
 #define PARF_SID_OFFSET				0x234
 #define PARF_BDF_TRANSLATE_CFG			0x24c
 #define PARF_DBI_BASE_ADDR_V2			0x350
@@ -134,9 +131,6 @@
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
 
-/* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
-#define PARF_INT_ALL_LINK_UP			BIT(13)
-
 /* PARF_NO_SNOOP_OVERRIDE register fields */
 #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
 #define RD_NO_SNOOP_OVERRIDE_EN			BIT(3)
@@ -1635,32 +1629,6 @@ static void qcom_pcie_init_debugfs(struct qcom_pcie *pcie)
 				    qcom_pcie_link_transition_count);
 }
 
-static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
-{
-	struct qcom_pcie *pcie = data;
-	struct dw_pcie_rp *pp = &pcie->pci->pp;
-	struct device *dev = pcie->pci->dev;
-	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
-
-	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
-
-	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
-		msleep(PCIE_RESET_CONFIG_WAIT_MS);
-		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
-		/* Rescan the bus to enumerate endpoint devices */
-		pci_lock_rescan_remove();
-		pci_rescan_bus(pp->bridge->bus);
-		pci_unlock_rescan_remove();
-
-		qcom_pcie_icc_opp_update(pcie);
-	} else {
-		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
-			      status);
-	}
-
-	return IRQ_HANDLED;
-}
-
 static void qcom_pci_free_msi(void *ptr)
 {
 	struct dw_pcie_rp *pp = (struct dw_pcie_rp *)ptr;
@@ -1805,8 +1773,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	struct dw_pcie_rp *pp;
 	struct resource *res;
 	struct dw_pcie *pci;
-	int ret, irq;
-	char *name;
+	int ret;
 
 	pcie_cfg = of_device_get_match_data(dev);
 	if (!pcie_cfg) {
@@ -1963,27 +1930,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		goto err_phy_exit;
 	}
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "qcom_pcie_global_irq%d",
-			      pci_domain_nr(pp->bridge->bus));
-	if (!name) {
-		ret = -ENOMEM;
-		goto err_host_deinit;
-	}
-
-	irq = platform_get_irq_byname_optional(pdev, "global");
-	if (irq > 0) {
-		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-						qcom_pcie_global_irq_thread,
-						IRQF_ONESHOT, name, pcie);
-		if (ret) {
-			dev_err_probe(&pdev->dev, ret,
-				      "Failed to request Global IRQ\n");
-			goto err_host_deinit;
-		}
-
-		writel_relaxed(PARF_INT_ALL_LINK_UP, pcie->parf + PARF_INT_ALL_MASK);
-	}
-
 	qcom_pcie_icc_opp_update(pcie);
 
 	if (pcie->mhi)
@@ -1991,8 +1937,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_host_deinit:
-	dw_pcie_host_deinit(pp);
 err_phy_exit:
 	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
 		phy_exit(port->phy);
-- 
2.51.0





