Return-Path: <linux-arm-msm+bounces-92411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GaHBsLWimnrOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:57:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF101178BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9E83302E7D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 06:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EEF32D439;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8p9C0N4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3411F03EF;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706618; cv=none; b=DOT8qEIxHl9ZO0v+P+iLhYx3oEza/VeGEfny5ZCifSsFax9wZ9JnXx5c9DfbTdqC/eP49huU8+JOTcAjyHSiRvtsnegp1ZD90b2rozfBBAzgBHtXBon/mZXO0nJb2fIHjtXUQqxZMNwYvTbMkIy9e9Ne55F7QHPMibYyZOcceqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706618; c=relaxed/simple;
	bh=9k6PZUXz+WIcEyDU8GQDLchGRBb94F0Zkoj+zNNUO1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F9ZDHc/4i4VKtCQcbet0hlTc/9Gw6yeusfW5dqOjYtVi+dMMLPbGEg3Bxnnxn4jRwdcNiPDgRk2cWdogRpYZt0uIA6Z9sEJXrCBRk8FmgbfkAAw7wj3zqF/vq0IpukH4yq/tgBOAA6T/E8PK2mdBK77RCi4WaFofeXednRklkHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8p9C0N4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AEDFC116C6;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770706618;
	bh=9k6PZUXz+WIcEyDU8GQDLchGRBb94F0Zkoj+zNNUO1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q8p9C0N4e3p3wXLXwIbeE5jCUAUkJfDbWcg192PD0qweCb8wkDSECUXyJ9+tmGE1I
	 PRSSsyF6+jgsaxZDB2U3zvhqxhh8ozXFSUcesbEIm0dU3c0Iv9A0FbT+Uk+ByYAShQ
	 Ukwq9ULcgesP8Q8hFfDueowkBioXPcOwt4gAjmsPmj2n5bkZhshcvwJgkrNGNrht2c
	 +4Fj3YJcvOsw0I8bQv1ietkYzRv8WROk8sYiB5Oqqf3ENJePdKZd59v8J6ybQS1QQO
	 +Z2dirjv3oKGMWxVKD+gn94kaFRF6sF4vPuSW4MntkJnQ+6NNxOYRN2aWkYPNOYo+q
	 1Zm/vKtJo8D7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C21EA3F0D;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 10 Feb 2026 12:26:50 +0530
Subject: [PATCH v2 1/4] soc: qcom: ice: Remove platform_driver support and
 expose as a pure library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-qcom-ice-fix-v2-1-9c1ab5d6502c@oss.qualcomm.com>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
In-Reply-To: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, mani@kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8433;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=GPFUIIrwKER6IyezrGPLm3Ggoo7yyD5LRXIRLkVOue8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpita4HLKQ2qFWK/ODxaFMc9Uuv/lk/7t/VT+Uc
 ciozcx8mkCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaYrWuAAKCRBVnxHm/pHO
 9ZKRB/9UzSOkSfrzOGjWmUpqiQKmJ0Nf4P2Fz1nvOBb/HIlvldfV6BKviQ96AWI1GrCOep/aHlK
 7UoFF8aasoykQB1ToCqdM8vQa/iGXwBwj/xiFzSvOE9FflWfR2+2e5nqUMLFSjU1oFki6Okh7E/
 8tppcC5VETVwiXtoCWK6zxbOmgfXIC/YK8PxT0myYAEcwiAxdfc7+mSTxbDs9trCBJFnQbTpXyQ
 YnMYLeJ2W5wP6SBN+Wro6KqSGNqPk7AMYq3OEN5EiEsMTuevRsq5f08Ui2mbmVIzCTJVXm9FcJA
 XuO5jtGfMha5qxIKup9cT8hF8jB92LR1U6WExmGuI0APDOBX
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92411-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 9AF101178BC
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The current platform driver design causes probe ordering races with
consumers (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE
probe fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops
with -EPROBE_DEFER, leaving consumers non-functional even when ICE should
be gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE
driver probe has failed due to above reasons or it is waiting for the SCM
driver.

Moreover, there is no devlink dependency between ICE and consumer drivers
as 'qcom,ice' is not considered as a DT 'supplier'. So the consumer drivers
have no idea of when the ICE driver is going to probe.

To avoid all this hassle, remove the platform driver support altogether and
just expose the ICE driver as a pure library to consumer drivers. With this
design, when devm_of_qcom_ice_get() is called, it will check if the ICE
instance is available or not. If not, it will create one based on the ICE
DT node, increase the refcount and return the handle. When the next
consumer calls the API again, the ICE instance would be available. So this
function will just increment the refcount and return the instance.

Finally, when the consumer devices get destroyed, refcount will be
decremented and finally the cleanup will happen once the last consumer goes
away.

For the consumers using the old DT binding of providing the separate 'ice'
register range in their node, this change has no impact.

This change also warrants rewording the kernel-doc of
devm_of_qcom_ice_get() API. While at it, remove the duplicate kernel-doc
for of_qcom_ice_get() static helper as it provides no value.

Cc: stable@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 118 ++++++++++++++++++-------------------------------
 1 file changed, 44 insertions(+), 74 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..8e25609c7e7b 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -107,12 +107,16 @@ struct qcom_ice {
 	struct device *dev;
 	void __iomem *base;
 
+	struct kref refcount;
 	struct clk *core_clk;
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
 };
 
+static DEFINE_MUTEX(ice_mutex);
+struct qcom_ice *ice_handle;
+
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
 {
 	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
@@ -592,30 +596,18 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	return engine;
 }
 
-/**
- * of_qcom_ice_get() - get an ICE instance from a DT node
- * @dev: device pointer for the consumer device
- *
- * This function will provide an ICE instance either by creating one for the
- * consumer device if its DT node provides the 'ice' reg range and the 'ice'
- * clock (for legacy DT style). On the other hand, if consumer provides a
- * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
- * be created and so this function will return that instead.
- *
- * Return: ICE pointer on success, NULL if there is no ICE data provided by the
- * consumer or ERR_PTR() on error.
- */
 static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct qcom_ice *ice;
 	struct resource *res;
 	void __iomem *base;
-	struct device_link *link;
 
 	if (!dev || !dev->of_node)
 		return ERR_PTR(-ENODEV);
 
+	guard(mutex)(&ice_mutex);
+
 	/*
 	 * In order to support legacy style devicetree bindings, we need
 	 * to create the ICE instance using the consumer device and the reg
@@ -631,6 +623,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		return qcom_ice_create(&pdev->dev, base);
 	}
 
+	/*
+	 * If the ICE node has been initialized already, just increase the
+	 * refcount and return the handle.
+	 */
+	if (ice_handle) {
+		kref_get(&ice_handle->refcount);
+
+		return ice_handle;
+	}
+
 	/*
 	 * If the consumer node does not provider an 'ice' reg range
 	 * (legacy DT binding), then it must at least provide a phandle
@@ -643,41 +645,42 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
-		dev_err(dev, "Cannot find device node %s\n", node->name);
+		dev_err(dev, "Cannot find ICE platform device\n");
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	ice = platform_get_drvdata(pdev);
-	if (!ice) {
-		dev_err(dev, "Cannot get ice instance from %s\n",
-			dev_name(&pdev->dev));
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_warn(&pdev->dev, "ICE registers not found\n");
 		platform_device_put(pdev);
-		return ERR_PTR(-EPROBE_DEFER);
+		return base;
 	}
 
-	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
-	if (!link) {
-		dev_err(&pdev->dev,
-			"Failed to create device link to consumer %s\n",
-			dev_name(dev));
+	ice = qcom_ice_create(&pdev->dev, base);
+	if (IS_ERR(ice)) {
 		platform_device_put(pdev);
-		ice = ERR_PTR(-EINVAL);
+		return ice_handle;
 	}
 
-	return ice;
+	ice_handle = ice;
+	kref_init(&ice_handle->refcount);
+
+	return ice_handle;
 }
 
-static void qcom_ice_put(const struct qcom_ice *ice)
+static void qcom_ice_put(struct kref *kref)
 {
-	struct platform_device *pdev = to_platform_device(ice->dev);
-
-	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
-		platform_device_put(pdev);
+	platform_device_put(to_platform_device(ice_handle->dev));
+	ice_handle = NULL;
 }
 
 static void devm_of_qcom_ice_put(struct device *dev, void *res)
 {
-	qcom_ice_put(*(struct qcom_ice **)res);
+	const struct qcom_ice *ice = *(struct qcom_ice **)res;
+	struct platform_device *pdev = to_platform_device(ice->dev);
+
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
+		kref_put(&ice_handle->refcount, qcom_ice_put);
 }
 
 /**
@@ -685,11 +688,14 @@ static void devm_of_qcom_ice_put(struct device *dev, void *res)
  * a DT node.
  * @dev: device pointer for the consumer device.
  *
- * This function will provide an ICE instance either by creating one for the
- * consumer device if its DT node provides the 'ice' reg range and the 'ice'
- * clock (for legacy DT style). On the other hand, if consumer provides a
- * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
- * be created and so this function will return that instead.
+ * This function will create the ICE instance (for the first time) and increase
+ * its refcount if the consumer device has either 'ice' reg range (legacy DT
+ * binding) or the 'qcom,ice' property pointing to the ICE DT node. If the ICE
+ * instance was already created, it will just increase its refcount and return
+ * the handle.
+ *
+ * Devres automatically decrements the refcount when consumer device gets
+ * destroyed and frees the ICE instance when the last consumer goes away.
  *
  * Return: ICE pointer on success, NULL if there is no ICE data provided by the
  * consumer or ERR_PTR() on error.
@@ -714,41 +720,5 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
 
-static int qcom_ice_probe(struct platform_device *pdev)
-{
-	struct qcom_ice *engine;
-	void __iomem *base;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_warn(&pdev->dev, "ICE registers not found\n");
-		return PTR_ERR(base);
-	}
-
-	engine = qcom_ice_create(&pdev->dev, base);
-	if (IS_ERR(engine))
-		return PTR_ERR(engine);
-
-	platform_set_drvdata(pdev, engine);
-
-	return 0;
-}
-
-static const struct of_device_id qcom_ice_of_match_table[] = {
-	{ .compatible = "qcom,inline-crypto-engine" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
-
-static struct platform_driver qcom_ice_driver = {
-	.probe	= qcom_ice_probe,
-	.driver = {
-		.name = "qcom-ice",
-		.of_match_table = qcom_ice_of_match_table,
-	},
-};
-
-module_platform_driver(qcom_ice_driver);
-
 MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
 MODULE_LICENSE("GPL");

-- 
2.51.0



