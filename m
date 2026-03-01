Return-Path: <linux-arm-msm+bounces-94693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEOvHKSco2k3IQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 02:55:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C311CC47E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 02:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57FFE305617B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 01:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766642FFFA5;
	Sun,  1 Mar 2026 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5aHlLRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3A76026;
	Sun,  1 Mar 2026 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329719; cv=none; b=rLVyHp4smCOH3+Pjp4rcttzOnrKyp7LGTmIjxlKQGpzVQfftZHIldrT8ohKd2CUWn8aqaCi1Wt7+dfV4LSV7GkdhJ13t/eOCCIi3Gvq3okW7e9e6zutwPZkymTJ2Hrz2u+Ifjb1JRvoQ1+TgUzOiB67F9Bb0cxV9VUFKQNsiB4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329719; c=relaxed/simple;
	bh=7kiiLApgJY2J3rdXHoK2H5MRLLOUtuqEDK3yvedvHLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GENy5k0O33MeJpgaggz2ORU3+xlY1cHRyBAt2p6cf9+fX8/gtxhI9WDXtZuypVM3595T8TZCekZwq+uRvgsnSVYOz3SScZJ7kikvNDd3jeWjZ4/3aBNg1ZWgQrVZAYdzmUhLWvdJvr7z9exZAY7hS1Pe0Qxlh6IooQQXLIsrAwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5aHlLRy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E9DC19424;
	Sun,  1 Mar 2026 01:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329719;
	bh=7kiiLApgJY2J3rdXHoK2H5MRLLOUtuqEDK3yvedvHLA=;
	h=From:To:Cc:Subject:Date:From;
	b=G5aHlLRyPhNhdFUVhBgNkpGrfWhNJ+m2Rmn1bJ1VB4ffp+kF5YPmwoTxYNfPxk1D6
	 YvuDMVsu7ngJc0KtAqUTOBhZMwuj88C7h+mJ4NOeazmqWV+gYirDwu0/s3mj2SxwGE
	 QrQ2/9+EqNqRchsRuiMIisrIalZT0Hk3G2cE1WvFlaN8IOp2uzngzIYjV81Rdjmfm0
	 TPY/k4qZeW3vaD55jyvk1oSqtd88Yr9qtwdb6MBE/lhvzTl4YyICNdkf7UMQP0iVlm
	 nRoSumBMTODaSINCAbHihscuoFlVCBuQkKV2qwxHcvpZLqUUGpSoyBCoO/Lxvzt1BY
	 HiyjDaTTRGCDg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	cassel@kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: FAILED: Patch "Revert "PCI: qcom: Don't wait for link if we can detect Link Up"" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:48:37 -0500
Message-ID: <20260301014837.1712860-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94693-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 13C311CC47E
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e9ce5b3804436301ab343bc14203a4c14b336d1b Mon Sep 17 00:00:00 2001
From: Niklas Cassel <cassel@kernel.org>
Date: Mon, 22 Dec 2025 07:42:10 +0100
Subject: [PATCH] Revert "PCI: qcom: Don't wait for link if we can detect Link
 Up"

This reverts commit 36971d6c5a9a134c15760ae9fd13c6d5f9a36abb.

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
Link: https://patch.msgid.link/20251222064207.3246632-11-cassel@kernel.org
---
 drivers/pci/controller/dwc/pcie-qcom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 60373fe1362f8..e87ec6779d44f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1958,10 +1958,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
-	irq = platform_get_irq_byname_optional(pdev, "global");
-	if (irq > 0)
-		pp->use_linkup_irq = true;
-
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
 		dev_err(dev, "cannot initialize host\n");
@@ -1975,6 +1971,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		goto err_host_deinit;
 	}
 
+	irq = platform_get_irq_byname_optional(pdev, "global");
 	if (irq > 0) {
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						qcom_pcie_global_irq_thread,
-- 
2.51.0





