Return-Path: <linux-arm-msm+bounces-108421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGZ3HCMmDGrvXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AFB57AAAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EC093006B58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A26F3F0766;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/08SqJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5183EFFD6;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180964; cv=none; b=Xmy7zW63g4+K3Ofo+wDp0V753eWhEfGCUA/Z47QCPXiDRMH2zcQHnTSbFIei+/v8bhmKSNkk3+YcYSt7tcpYyBPG1PlPvkQswPeZqE0NK1ZK+h7bH2epkjqE59QRPuMsh2F1WJ7/q0gvYW7mfxCEpnP9Y4aelo+WWpKFby8spDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180964; c=relaxed/simple;
	bh=XOOgZkMjmCOdxzWCXCORmGtjbP+hEEndsnlcGi0NxCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SziYOOubU7gy5RQNIDLcw+IJXFL7Y0qJ7uLF69YqNXAhsnDdubkf6O/p/l0lp4g5JUXczVpZ8/x4J2VEbqLiKGWV2ey2TPK+dPBOnjIaKpifx+M/LQjhwRCHbGwMd351l/tZXBFM+ItJ1qKSNRMPW68rkIDiA1U3RaMuH+RiqEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/08SqJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C38BAC4AF09;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180963;
	bh=XOOgZkMjmCOdxzWCXCORmGtjbP+hEEndsnlcGi0NxCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W/08SqJge8d0vrKD3X4kmKVgjLnFxIMS578xEONrv99xg3cT3jlKNp1C9tPcJXRY9
	 kvoNZorh0uaUCmZKQu+WS7ULTBAr+jxLL9FGSFDeroE9vCCjNmXMOKj150AFvQKJ09
	 zBsopjsJJHcGdFMJZBQ/PEpzDw/4rXhVnMhpC4Am0I18l6TqUHJyR6NHP3k5Ey3t/r
	 Aw9M8o06YXtDSqLtCBs+A8iIMbtqYUB33Afypfq9v9uW0elnbgsAJu0VJRClGyxkTa
	 dKM8qrH+aSoe33L8Z3rYJFWiTVw/ULf56fLtNClDqQsnJMzx5P03bQFLcilcffxpVk
	 npqEnXluVl8xA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B1ECD5BA3;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 14:25:57 +0530
Subject: [PATCH v3 2/9] power: sequencing: pcie-m2: Allow creating serdev
 for multiple PCI devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pwrseq-m2-bt-v3-2-b39dc2ae3966@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8834;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=3hsOpES3Yk37WGFT4yl/5CzwdSCPi9DcZBWsaTeP5Ag=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDCWeN9txK6pvmG+m6zAGfezIzY/zBXdj5TD5b
 91zUdvEjTmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwlngAKCRBVnxHm/pHO
 9ZtUB/wMvqBxdPACV5lb9yw6Uvq/PvXWI9NWN6B70hcT8EGdENNm7ImTaTOECBOYdWFEGGxiYgs
 Ht5iIi1l0pNy3t39TrGX7HeNL1WS1x3kWOdcvTIfxvjaWgxNTvlZlbLI1et0z5lW10/l4R+FHA6
 6pda/Hbnko+n0H/a/nV/CwclIW23cugKtZqx2gl71ZrkNI3maMyLWbLg2DPH2OSwUEaTkzBEcsc
 dMGo1zv0RkJm+t9lWTkDe8E7B3WYXzR2swy4STMHIR7Z57DXPgOPvcS6xbibk8O6m+Omv1nLd4P
 lGos7BPyteBdELqHkba4FLk03bbTp9AcbOFESe4UTpAKURkl
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
	TAGGED_FROM(0.00)[bounces-108421-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 52AFB57AAAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Current code makes it possible to create serdev for only one PCI device.
But for scaling this driver, it is necessary to allow creating serdev for
multiple PCI devices.

Hence, add provision for it by creating 'struct pwrseq_pci_dev' for each
PCI device that requires serdev and add them to
'pwrseq_pcie_m2_ctx::pci_devices' list.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 127 +++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 39 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index b2ed336fd5ad..469e130330fa 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/list.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -19,6 +20,13 @@
 #include <linux/serdev.h>
 #include <linux/slab.h>
 
+struct pwrseq_pci_dev {
+	struct serdev_device *serdev;
+	struct of_changeset *ocs;
+	struct pci_dev *pdev;
+	struct list_head list;
+};
+
 struct pwrseq_pcie_m2_pdata {
 	const struct pwrseq_target_data **targets;
 };
@@ -32,9 +40,9 @@ struct pwrseq_pcie_m2_ctx {
 	struct notifier_block nb;
 	struct gpio_desc *w_disable1_gpio;
 	struct gpio_desc *w_disable2_gpio;
-	struct serdev_device *serdev;
-	struct of_changeset *ocs;
 	struct device *dev;
+	struct list_head pci_devices;
+	struct mutex list_lock;
 };
 
 static int pwrseq_pcie_m2_vregs_enable(struct pwrseq_device *pwrseq)
@@ -178,38 +186,39 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 }
 
 static int pwrseq_pcie_m2_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
+					struct pwrseq_pci_dev *pci_dev,
 					struct device_node *parent)
 {
 	struct device *dev = ctx->dev;
 	struct device_node *np;
 	int ret;
 
-	ctx->ocs = kzalloc_obj(*ctx->ocs);
-	if (!ctx->ocs)
+	pci_dev->ocs = kzalloc_obj(*pci_dev->ocs);
+	if (!pci_dev->ocs)
 		return -ENOMEM;
 
-	of_changeset_init(ctx->ocs);
+	of_changeset_init(pci_dev->ocs);
 
-	np = of_changeset_create_node(ctx->ocs, parent, "bluetooth");
+	np = of_changeset_create_node(pci_dev->ocs, parent, "bluetooth");
 	if (!np) {
 		dev_err(dev, "Failed to create bluetooth node\n");
 		ret = -ENODEV;
 		goto err_destroy_changeset;
 	}
 
-	ret = of_changeset_add_prop_string(ctx->ocs, np, "compatible", "qcom,wcn7850-bt");
+	ret = of_changeset_add_prop_string(pci_dev->ocs, np, "compatible", "qcom,wcn7850-bt");
 	if (ret) {
 		dev_err(dev, "Failed to add bluetooth compatible: %d\n", ret);
 		goto err_destroy_changeset;
 	}
 
-	ret = of_changeset_apply(ctx->ocs);
+	ret = of_changeset_apply(pci_dev->ocs);
 	if (ret) {
 		dev_err(dev, "Failed to apply changeset: %d\n", ret);
 		goto err_destroy_changeset;
 	}
 
-	ret = device_add_of_node(&ctx->serdev->dev, np);
+	ret = device_add_of_node(&pci_dev->serdev->dev, np);
 	if (ret) {
 		dev_err(dev, "Failed to add OF node: %d\n", ret);
 		goto err_revert_changeset;
@@ -218,19 +227,21 @@ static int pwrseq_pcie_m2_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
 	return 0;
 
 err_revert_changeset:
-	of_changeset_revert(ctx->ocs);
+	of_changeset_revert(pci_dev->ocs);
 err_destroy_changeset:
-	of_changeset_destroy(ctx->ocs);
-	kfree(ctx->ocs);
-	ctx->ocs = NULL;
+	of_changeset_destroy(pci_dev->ocs);
+	kfree(pci_dev->ocs);
+	pci_dev->ocs = NULL;
 
 	return ret;
 }
 
-static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
+static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
+					struct pci_dev *pdev)
 {
 	struct serdev_controller *serdev_ctrl;
 	struct device *dev = ctx->dev;
+	struct pwrseq_pci_dev *pci_dev;
 	int ret;
 
 	struct device_node *serdev_parent __free(device_node) =
@@ -248,17 +259,23 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 		return 0;
 	}
 
-	ctx->serdev = serdev_device_alloc(serdev_ctrl);
-	if (!ctx->serdev) {
+	pci_dev = kzalloc(sizeof(*pci_dev), GFP_KERNEL);
+	if (!pci_dev) {
 		ret = -ENOMEM;
 		goto err_put_ctrl;
 	}
 
-	ret = pwrseq_pcie_m2_create_bt_node(ctx, serdev_parent);
+	pci_dev->serdev = serdev_device_alloc(serdev_ctrl);
+	if (!pci_dev->serdev) {
+		ret = -ENOMEM;
+		goto err_free_pci_dev;
+	}
+
+	ret = pwrseq_pcie_m2_create_bt_node(ctx, pci_dev, serdev_parent);
 	if (ret)
 		goto err_free_serdev;
 
-	ret = serdev_device_add(ctx->serdev);
+	ret = serdev_device_add(pci_dev->serdev);
 	if (ret) {
 		dev_err(dev, "Failed to add serdev for WCN7850: %d\n", ret);
 		goto err_free_dt_node;
@@ -266,37 +283,64 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 
 	serdev_controller_put(serdev_ctrl);
 
+	pci_dev->pdev = pci_dev_get(pdev);
+
+	mutex_lock(&ctx->list_lock);
+	list_add_tail(&pci_dev->list, &ctx->pci_devices);
+	mutex_unlock(&ctx->list_lock);
+
 	return 0;
 
 err_free_dt_node:
-	device_remove_of_node(&ctx->serdev->dev);
-	of_changeset_revert(ctx->ocs);
-	of_changeset_destroy(ctx->ocs);
-	kfree(ctx->ocs);
-	ctx->ocs = NULL;
+	device_remove_of_node(&pci_dev->serdev->dev);
+	of_changeset_revert(pci_dev->ocs);
+	of_changeset_destroy(pci_dev->ocs);
+	kfree(pci_dev->ocs);
+	pci_dev->ocs = NULL;
 err_free_serdev:
-	serdev_device_put(ctx->serdev);
-	ctx->serdev = NULL;
+	serdev_device_put(pci_dev->serdev);
+	pci_dev->serdev = NULL;
+err_free_pci_dev:
+	kfree(pci_dev);
 err_put_ctrl:
 	serdev_controller_put(serdev_ctrl);
 
 	return ret;
 }
 
-static void pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx)
+static void __pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx,
+					   struct pwrseq_pci_dev *pci_dev)
 {
-	if (ctx->serdev) {
-		device_remove_of_node(&ctx->serdev->dev);
-		serdev_device_remove(ctx->serdev);
-		ctx->serdev = NULL;
+	if (pci_dev->serdev) {
+		device_remove_of_node(&pci_dev->serdev->dev);
+		serdev_device_remove(pci_dev->serdev);
 	}
 
-	if (ctx->ocs) {
-		of_changeset_revert(ctx->ocs);
-		of_changeset_destroy(ctx->ocs);
-		kfree(ctx->ocs);
-		ctx->ocs = NULL;
+	if (pci_dev->ocs) {
+		of_changeset_revert(pci_dev->ocs);
+		of_changeset_destroy(pci_dev->ocs);
+		kfree(pci_dev->ocs);
 	}
+
+	pci_dev_put(pci_dev->pdev);
+	list_del(&pci_dev->list);
+	kfree(pci_dev);
+}
+
+static void pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx,
+					 struct pci_dev *pdev)
+{
+	struct pwrseq_pci_dev *pci_dev, *tmp;
+
+	mutex_lock(&ctx->list_lock);
+	list_for_each_entry_safe(pci_dev, tmp, &ctx->pci_devices, list) {
+		if (!pdev || pci_dev->pdev == pdev) {
+			__pwrseq_pcie_m2_remove_serdev(ctx, pci_dev);
+			if (pdev)
+				break;
+		}
+	}
+	mutex_unlock(&ctx->list_lock);
 }
 
 static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action,
@@ -320,7 +364,7 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 	case BUS_NOTIFY_ADD_DEVICE:
 		/* Create serdev device for WCN7850 */
 		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107) {
-			ret = pwrseq_pcie_m2_create_serdev(ctx);
+			ret = pwrseq_pcie_m2_create_serdev(ctx, pdev);
 			if (ret)
 				return notifier_from_errno(ret);
 		}
@@ -328,7 +372,7 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 	case BUS_NOTIFY_REMOVED_DEVICE:
 		/* Destroy serdev device for WCN7850 */
 		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107)
-			pwrseq_pcie_m2_remove_serdev(ctx);
+			pwrseq_pcie_m2_remove_serdev(ctx, pdev);
 
 		break;
 	}
@@ -432,16 +476,20 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 		goto err_free_regulators;
 	}
 
+	mutex_init(&ctx->list_lock);
+	INIT_LIST_HEAD(&ctx->pci_devices);
 	/*
 	 * Register a notifier for creating protocol devices for
 	 * non-discoverable busses like UART.
 	 */
 	ret = pwrseq_pcie_m2_register_notifier(ctx, dev);
 	if (ret)
-		goto err_free_regulators;
+		goto err_destroy_mutex;
 
 	return 0;
 
+err_destroy_mutex:
+	mutex_destroy(&ctx->list_lock);
 err_free_regulators:
 	regulator_bulk_free(ctx->num_vregs, ctx->regs);
 
@@ -453,7 +501,8 @@ static void pwrseq_pcie_m2_remove(struct platform_device *pdev)
 	struct pwrseq_pcie_m2_ctx *ctx = platform_get_drvdata(pdev);
 
 	bus_unregister_notifier(&pci_bus_type, &ctx->nb);
-	pwrseq_pcie_m2_remove_serdev(ctx);
+	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
+	mutex_destroy(&ctx->list_lock);
 
 	regulator_bulk_free(ctx->num_vregs, ctx->regs);
 }

-- 
2.48.1



