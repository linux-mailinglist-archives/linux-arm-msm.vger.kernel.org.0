Return-Path: <linux-arm-msm+bounces-104095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH3xMvyw6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:29:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7A44559C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E448307F555
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6053D2FFC;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkPF46Ua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BCD3CFF64;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857113; cv=none; b=Uk/fRsU6NerrGXRMs64g3xylBkXnIR4AdX+Pm1UBf7X+rtZchERy5/+WEq2Zn1cF5lDbfVQu9236YP4trMHxgwuzFuXT5gR63oncRfAB5N3zN4j7/7SaVLhPafgH21n7j6Q7oS2H1xfeCfzvZRV6KEyjDYwHezCn4qGaUlkd2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857113; c=relaxed/simple;
	bh=J5UBlxRINX616sHAIUpg5vnrM9/UWUYaECY6bNwQgdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3fr+DJFs28HUysQ+Dq93CdsC1JwLwueBHRr1n6gLVoEUdlTFyZljA3MS0Q2xSCXA2CCk7FHJe/rUmDttaOosgdLfkuv0N1SOFnbsiZfIFRAmfHK1DAfAP0jrIVNICKUCUkj9nwWYziCYyAi+C89xlQ9307uDANy138EhB0Kfj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkPF46Ua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C815EC2BCFC;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857112;
	bh=J5UBlxRINX616sHAIUpg5vnrM9/UWUYaECY6bNwQgdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jkPF46UaDCQDsujCNnGdPs454GmNrpOw/u8uuvo6yFnEXY/tpSGlP9OqG4qC2iudw
	 6xnnnm//JmzI+1H7xehBMu5hGUBFH0D4Eis+3jl03YFNWx2wvFAtF4nnP9CeZLZxoE
	 iecuxRB5mS7mI7raNXMgIYpSPfcQtvgYDUIErcUg0q2cAYmyVXPUhY8FhHMsuBXbGO
	 ydjq5XjiEZ+3+IViYg2ScN4MemCTA+SAhHV6iIQ3rFAdSrNKwAFF1bEV5lq31lsIce
	 l5Y8eZ2f3jQ0DZywQpxuBgp6JhdDPT95Pmzuce3THrWw8OZtoa0pIBs9e9ehSJpu4G
	 +Aq1UF+RlnQVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1367F5A8DD;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 22 Apr 2026 16:54:48 +0530
Subject: [PATCH 07/12] power: sequencing: pcie-m2: Create serdev for PCI
 devices present before probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pwrseq-m2-bt-v1-7-720d02545a64@oss.qualcomm.com>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
In-Reply-To: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5701;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=KxccIL0wAbXZIjNEfSWb+27f0NvPCoI50tHq4aONrQs=;
 b=owEBbAGT/pANAwAKAVWfEeb+kc71AcsmYgBp6LAVbba+rmaoWNsPlB2IV19Sjs+xxhqc3+Nvv
 4wQMp8j32WJATIEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaeiwFQAKCRBVnxHm/pHO
 9ceQB/jmXhyv+IU0xoV41g0QAsVGsLDcguP0JPoHg+6zANCkUnyxVDC01ECWG1sT87CqbkQatNP
 A6tZzfebquQ7lY7QHu4bR0eHU1iIwjF8vlclN5B6HtumHDOlknbEE3lj/ATuJ/rWp0LQOMPSYgW
 nrBNYVDccO3t8vCM+LWe0mrnf2ae6qUa5jqS3nfOngknN7CWu3mL5+B/XaDT6iV9cMjedVZxGQo
 KVZvn4FzlJW0iEuxDRAiQjljVBl0jwctqdhsrvSINq+h68jOKbEz/n5R5gMc0wqNeUCeT97WW7J
 /PACoCeSEslXf+JX6FtULcPrP0SxSsWDW4gKdA4oXOO47QE=
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104095-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 53E7A44559C
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

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 83 ++++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 13 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index bdc4391c87c9..b21fcc089580 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -244,7 +244,7 @@ static int pwrseq_pcie_m2_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
 	return ret;
 }
 
-static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
+static int __pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
 					struct pci_dev *pdev)
 {
 	struct serdev_controller *serdev_ctrl;
@@ -267,6 +267,16 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
 		return 0;
 	}
 
+	/* Bail out if the serdev device was already created for the PCI dev */
+	mutex_lock(&ctx->list_lock);
+	list_for_each_entry(pci_dev, &ctx->pci_devices, list) {
+		if (pci_dev->pdev == pdev) {
+			mutex_unlock(&ctx->list_lock);
+			return 0;
+		}
+	}
+	mutex_unlock(&ctx->list_lock);
+
 	pci_dev = kzalloc(sizeof(*pci_dev), GFP_KERNEL);
 	if (!pci_dev) {
 		ret = -ENOMEM;
@@ -376,7 +386,7 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		if (pci_match_id(pwrseq_m2_pci_ids, pdev)) {
-			ret = pwrseq_pcie_m2_create_serdev(ctx, pdev);
+			ret = __pwrseq_pcie_m2_create_serdev(ctx, pdev);
 			if (ret)
 				return notifier_from_errno(ret);
 		}
@@ -408,7 +418,7 @@ static bool pwrseq_pcie_m2_check_remote_node(struct device *dev, u8 port, u8 end
  * protocol device needs to be created manually with the help of the notifier
  * of the discoverable bus like PCIe.
  */
-static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx, struct device *dev)
+static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx)
 {
 	int ret;
 
@@ -416,18 +426,56 @@ static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx, stru
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
+		ret = __pwrseq_pcie_m2_create_serdev(ctx, pdev);
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
@@ -489,16 +537,25 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 
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
2.51.0



