Return-Path: <linux-arm-msm+bounces-108424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHcLFTsmDGoIXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53657AAE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D008C30390C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2AD3F0ABB;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4DqQmv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C58C3F0751;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180964; cv=none; b=rJJgzM01IaTL48FB/jZQAxfrNzPVCsmGanz91HASEI3NcfYbZOAlYwlPY0PoKLoUX1uJH4tVZtmbGfC3nlGPZzSlpjXH3ol2KsusXKfHp83o9NmjLbqGT5laIVmKocHEnYlw278SPNEdvrfIIQPbsIB2/bGQa728ItR1D3jJ4C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180964; c=relaxed/simple;
	bh=DVNLzhxZIoTdmt3zoK4l6Qj8OfVUAe8kOwfyEvJIQ30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHtGdLEt9QTw290h02RZI65I49s3Gye99ZNEBbiP7Y6IXiw0xLEQL2+6KepMjt1YFkeP+dGcOGnHq2aBA7ZugRniUIuLmZ2M6yYUmndxzvylBObdpmiHEs8NJ81TXAQXvn9Vqr2Ad/rqJIKgmZ0fgXwktFef0aE+tLysjMZ1Hqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4DqQmv9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3AEFC2BCF6;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180963;
	bh=DVNLzhxZIoTdmt3zoK4l6Qj8OfVUAe8kOwfyEvJIQ30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J4DqQmv9uWlyPmrQeA5rMYHIndxE3hLR9+z37CUAxdouulpl7gpDyiGaYkPko+Y0O
	 rpV+gxO6pd3tsjzmLWr2dTt1CNXFlQ1AthuIwjY5X4ZWe8Ue+Z6COrohmEnf2wyXJd
	 ct7xb2+1opkiWpblKLS4SYef1fMMgHjVL9cpSsdu/rMBgoLOzpro6DRuRH1MKVespj
	 x9imZTrUXx0McI8viBOT2MGnGe7n2rvMvmP1eRkrpPCImhmdEsTXeWA4ebsVDRBsLu
	 QUVederWOsmMcUeoMR94+nqlYDWHBOAW/MQT8uRU/3Of3oFUy1KsyU/6Yb20jDhk9i
	 gWk/029rdAIuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E75CD4F5B;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 14:25:59 +0530
Subject: [PATCH v3 4/9] power: sequencing: pcie-m2: Create serdev for PCI
 devices present before probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pwrseq-m2-bt-v3-4-b39dc2ae3966@oss.qualcomm.com>
References: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
In-Reply-To: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5697;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=iQupElfzV5Zv+Psvc+SXwcpwcKd+BIeeeEJ0chYyZ8s=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDCWecGx1fsseQW0Ovecwl7oegEQz0A54gb75z
 9GIgEMobZaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwlngAKCRBVnxHm/pHO
 9cdcB/9VaEBddb05gUg0n6pvVL1tJoLyFpBpfoIQJSqs+ndw5j1wBaJTV1MgFv+ZPavwTyu0apu
 tpaa1ttpB1RSLzYFsWdX78rFz07qFSxCBtSJRO1hHlhz23wavgs3t5ch0hA6anOosdthlK/Np+6
 M38zWBv8cTZ8kmX2o2oiqvrMUBJeMuXjpqarhhdauv8Kf0CvwP7EK8AGPSuzyK7izkolImFGxFt
 +3Jqq2OBiCJlSKCekbTbQjVkFKg4Ca+A0hpgfFvtxV0eSiihNnJX2VHvNH8GC/QYgV8lFYqPIHK
 kCLXK0p8GKOmw15czyX+onTaVKv1TYfuNqbLpvfU82IWu6dE
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108424-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3E53657AAE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

So far, the driver is registering a notifier to create serdev for the PCI
devices that are going to be attached after probe. But it doesn't handle
the devices present before probe. Due to this, serdev is not getting
created for those existing devices.

Hence, create serdev for PCI devices available before probe as well.

Note that the serdev for available devices are created before
registering the notifier. There is a small window where a device could
appear after pwrseq_pcie_m2_create_serdev(), before notifier registration.
But since M.2 cards are fixed to a slot, they are mostly added either
before booting the host or after using hotplug. So this window is mostly
theoretical.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 81 ++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 13 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 038271207a27..8164c4428977 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -236,7 +236,7 @@ static int pwrseq_pcie_m2_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
 	return ret;
 }
 
-static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
+static int pwrseq_pcie_m2_create_serdev_one(struct pwrseq_pcie_m2_ctx *ctx,
 					struct pci_dev *pdev)
 {
 	struct serdev_controller *serdev_ctrl;
@@ -259,6 +259,14 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
 		return 0;
 	}
 
+	/* Bail out if the serdev device was already created for the PCI dev */
+	scoped_guard(mutex, &ctx->list_lock) {
+		list_for_each_entry(pci_dev, &ctx->pci_devices, list) {
+			if (pci_dev->pdev == pdev)
+				return 0;
+		}
+	}
+
 	pci_dev = kzalloc(sizeof(*pci_dev), GFP_KERNEL);
 	if (!pci_dev) {
 		ret = -ENOMEM;
@@ -368,7 +376,7 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		if (pci_match_id(pwrseq_m2_pci_ids, pdev)) {
-			ret = pwrseq_pcie_m2_create_serdev(ctx, pdev);
+			ret = pwrseq_pcie_m2_create_serdev_one(ctx, pdev);
 			if (ret)
 				return notifier_from_errno(ret);
 		}
@@ -400,7 +408,7 @@ static bool pwrseq_pcie_m2_check_remote_node(struct device *dev, u8 port, u8 end
  * protocol device needs to be created manually with the help of the notifier
  * of the discoverable bus like PCIe.
  */
-static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx, struct device *dev)
+static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx)
 {
 	int ret;
 
@@ -408,18 +416,56 @@ static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx, stru
 	 * Register a PCI notifier for Key E connector that has PCIe as Port
 	 * 0/Endpoint 0 interface and Serial as Port 3/Endpoint 0 interface.
 	 */
-	if (pwrseq_pcie_m2_check_remote_node(dev, 3, 0, "serial")) {
-		if (pwrseq_pcie_m2_check_remote_node(dev, 0, 0, "pcie")) {
-			ctx->dev = dev;
-			ctx->nb.notifier_call = pwrseq_pcie_m2_notify;
-			ret = bus_register_notifier(&pci_bus_type, &ctx->nb);
-			if (ret)
-				return dev_err_probe(dev, ret,
-						     "Failed to register notifier for serdev\n");
+	if (!pwrseq_pcie_m2_check_remote_node(ctx->dev, 3, 0, "serial") ||
+	    !pwrseq_pcie_m2_check_remote_node(ctx->dev, 0, 0, "pcie"))
+		return 0;
+
+	ctx->nb.notifier_call = pwrseq_pcie_m2_notify;
+	ret = bus_register_notifier(&pci_bus_type, &ctx->nb);
+	if (ret)
+		return dev_err_probe(ctx->dev, ret,
+				     "Failed to register notifier for serdev\n");
+	return 0;
+}
+
+static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
+{
+	struct pci_dev *pdev = NULL;
+	int ret;
+
+	if (!pwrseq_pcie_m2_check_remote_node(ctx->dev, 3, 0, "serial") ||
+	    !pwrseq_pcie_m2_check_remote_node(ctx->dev, 0, 0, "pcie"))
+		return 0;
+
+	struct device_node *pci_parent __free(device_node) =
+				of_graph_get_remote_node(dev_of_node(ctx->dev), 0, 0);
+	if (!pci_parent)
+		return 0;
+
+	/* Create serdev for existing PCI devices if required */
+	for_each_pci_dev(pdev) {
+		if (!pdev->dev.parent || pci_parent != pdev->dev.parent->of_node)
+			continue;
+
+		if (!pci_match_id(pwrseq_m2_pci_ids, pdev))
+			continue;
+
+		ret = pwrseq_pcie_m2_create_serdev_one(ctx, pdev);
+		if (ret) {
+			dev_err_probe(ctx->dev, ret,
+				      "Failed to create serdev for PCI device (%s)\n",
+				      pci_name(pdev));
+			pci_dev_put(pdev);
+			goto err_remove_serdev;
 		}
 	}
 
 	return 0;
+
+err_remove_serdev:
+	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
+
+	return ret;
 }
 
 static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
@@ -481,16 +527,25 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 
 	mutex_init(&ctx->list_lock);
 	INIT_LIST_HEAD(&ctx->pci_devices);
+	ctx->dev = dev;
+
+	/* Create serdev for available PCI devices (if required) */
+	ret = pwrseq_pcie_m2_create_serdev(ctx);
+	if (ret)
+		goto err_destroy_mutex;
+
 	/*
 	 * Register a notifier for creating protocol devices for
 	 * non-discoverable busses like UART.
 	 */
-	ret = pwrseq_pcie_m2_register_notifier(ctx, dev);
+	ret = pwrseq_pcie_m2_register_notifier(ctx);
 	if (ret)
-		goto err_destroy_mutex;
+		goto err_remove_serdev;
 
 	return 0;
 
+err_remove_serdev:
+	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
 err_destroy_mutex:
 	mutex_destroy(&ctx->list_lock);
 err_free_regulators:

-- 
2.48.1



