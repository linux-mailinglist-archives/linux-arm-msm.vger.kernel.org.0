Return-Path: <linux-arm-msm+bounces-104096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MaRC62w6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:27:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61C4454FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90EBE30630DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831AB3D300F;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTmIhP1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054933CFF72;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857113; cv=none; b=II7gL7NHVr4aMLY9Lnx99BCNj1xUAAzz2Gp8yE2NRbcYjQRd1lRrmB1WvVJnI5wVI+grbrZgrKi8f9sXcWSZE+Uyq8h4/PVe1JiRzG5V2TDCjxG8hVCckvnmlaBqBBrc1KEFABS/VbkVOj/OfviMMJUf4qfYbVVlNLhgQZe6u4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857113; c=relaxed/simple;
	bh=9F43q4LX2CRP2OAr3Vb2VkjV9k0yS3vMdJovyQFhUmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opd5zwARxmsy5ZqazqJ78dBMRP1bbdjsgyHh7n3r3T1OO55FUDxiwnDIciNMYcvAJZzcfPkOq6EyF5rIKeKh3I47R1N3IGsw5glAOjp3+UVFQKgHyzwADNeqceta0gQUp9FdAep7ZTKp51QBZ+UahTTi8mmIa+e/mKh94Wa0ESo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTmIhP1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACEDFC2BCF4;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857112;
	bh=9F43q4LX2CRP2OAr3Vb2VkjV9k0yS3vMdJovyQFhUmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YTmIhP1/4/0huxfWE6k1OCmuR3JduP17gLJN+wom8GMutTo1Vm0kYhGQWxQv+xslY
	 jxxuR6edzSKLTV/1nCXUmghwTQ4yR5UdJcDVHEemZ33Z8URaXwQl52NC2RvsQgWdy9
	 s82PAwWJzyX9rt6prm6w0zK5WuqhjjWUFP2uNngezhgolmxm+2qCZvOqiateOQtHGS
	 F/T359WnQeJPNqS3lnvDFDnzbGLwMYX3QGp4bcVlUFSJpwKDDc/kN38gvTDwh1vkjK
	 WBb3zOTJG6dhETjySjM/gsT2Rl7lyD1DeDlUx2tS71qZ6tlZudHgFSFZPUyt+EdCL5
	 t7j2+OGQ7uiUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48EBF9B606;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 22 Apr 2026 16:54:46 +0530
Subject: [PATCH 05/12] power: sequencing: pcie-m2: Allow creating serdev
 for multiple PCI devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pwrseq-m2-bt-v1-5-720d02545a64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8785;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nr5rSy3SSUTggm3+ROd35J+oxjoGsrNW4JatIPPtA+U=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp6LAVsOFwr2jZ0pC3vJWJ7Xd9TOjf4JQ0GVTxe
 M78Mf0R8IyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaeiwFQAKCRBVnxHm/pHO
 9VLNCACMEYYenEdy1q3hAR7XmXlWPLdjwwYKLDO+V2e4BFHFjfg03/h50NyMEGxpnDSdHQEpgDU
 EOkTeEK5rmtLadZw9uJWrK2GgM88UoP2iC3oWLPvgV01AiTEDk4Oi4DdVVOtR598ltuBzYfvirh
 xN/AzEm/nIfhC9gxddIPM021hr0apwKqzbQQJIgUZx4BOtXMpSYv4Sn8nB3M7mKXwMZh57OE4cv
 chJVCWQsTxudpR4grpSTSX/ky3TkZZxgmlX6clHXxp3rGrIJtUtDVxo1/12gSnSUtoLM7xtGKuB
 V2aDllOAUSjFoMpH47tiaaEUxy+B/V3jx/lDaTnS3TsdsiiC
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104096-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD61C4454FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Current code makes it possible to create serdev for only one PCI device.
But for scaling this driver, it is necessary to allow creating serdev for
multiple PCI devices.

Hence, add provision for it by creating 'struct pwrseq_pci_dev' for each
PCI device that requires serdev and add them to
'pwrseq_pcie_m2_ctx::pci_devices' list.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 127 +++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 39 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 49c326a6e445..d4d246a30a97 100644
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
@@ -186,38 +194,39 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
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
@@ -226,19 +235,21 @@ static int pwrseq_pcie_m2_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
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
@@ -256,17 +267,23 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
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
@@ -274,37 +291,64 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 
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
@@ -328,7 +372,7 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 	case BUS_NOTIFY_ADD_DEVICE:
 		/* Create serdev device for WCN7850 */
 		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107) {
-			ret = pwrseq_pcie_m2_create_serdev(ctx);
+			ret = pwrseq_pcie_m2_create_serdev(ctx, pdev);
 			if (ret)
 				return notifier_from_errno(ret);
 		}
@@ -336,7 +380,7 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 	case BUS_NOTIFY_REMOVED_DEVICE:
 		/* Destroy serdev device for WCN7850 */
 		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107)
-			pwrseq_pcie_m2_remove_serdev(ctx);
+			pwrseq_pcie_m2_remove_serdev(ctx, pdev);
 
 		break;
 	}
@@ -440,16 +484,20 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
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
 
@@ -461,7 +509,8 @@ static void pwrseq_pcie_m2_remove(struct platform_device *pdev)
 	struct pwrseq_pcie_m2_ctx *ctx = platform_get_drvdata(pdev);
 
 	bus_unregister_notifier(&pci_bus_type, &ctx->nb);
-	pwrseq_pcie_m2_remove_serdev(ctx);
+	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
+	mutex_destroy(&ctx->list_lock);
 
 	regulator_bulk_free(ctx->num_vregs, ctx->regs);
 }

-- 
2.51.0



