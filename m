Return-Path: <linux-arm-msm+bounces-43865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ACCA008A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64F041884F4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6501F9F5B;
	Fri,  3 Jan 2025 11:31:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B7F1F9F58;
	Fri,  3 Jan 2025 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903894; cv=none; b=YB9OgzTSEbo3ox05qxMKCRYfAePJcBsBTbskyeAFjsdYbIwsQwMJg1qFemg+l+czrKCBG9Sf2WELwEKnpWRV7xtY5BFZnsUR6TU6IwoVpYIemMmhje2sNlHLeOvEiD6pVqcyYdwaJDPOzMBaklebFKOkcfZ/pAiM46pCnH86sDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903894; c=relaxed/simple;
	bh=ny77bzN6WrRhlg6OIky/iT5zw+3usfKugPQ8HYu69AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sjaoNBbrplArYwZxVMZNolL2VNMXjfKUEKC+DSBKODz/nWDzgOP6E9CwfUZtzzlqqHQfweyCF8TXNBdj7BRcDz/9a7EXpcn4ye1QJm4Y5D4/uXJeXbHhZgkS9/1wH9eNex/bDyCAcVk/TvF8vubeJ562wsSsynXKM3nXHMLRXLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 410c7250c9c611efa216b1d71e6e1362-20250103
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:391fbcff-1fc3-44a3-8f70-c561d7a90649,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:4137c1d9a5050ba6be514140a86da391,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 410c7250c9c611efa216b1d71e6e1362-20250103
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1689954287; Fri, 03 Jan 2025 19:31:20 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 343F9E0080FF;
	Fri,  3 Jan 2025 19:31:20 +0800 (CST)
X-ns-mid: postfix-6777CA87-95690244
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id C6BB1E0080FF;
	Fri,  3 Jan 2025 19:31:17 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: robdclark@gmail.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] iommu/msm: Use helper function devm_clk_get_prepared()
Date: Fri,  3 Jan 2025 19:30:59 +0800
Message-ID: <20250103113059.463033-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepare=
d
and enabled clocks"), devm_clk_get() and clk_prepare() can now be replace=
d
by devm_clk_get_prepared() when driver prepares the clocks for the whole
lifetime of the device. Moreover, it is no longer necessary to unprepare
the clocks explicitly.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 drivers/iommu/msm_iommu.c | 51 +++++++++------------------------------
 1 file changed, 11 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index ce40f0a419ea..2769e4544038 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -725,47 +725,32 @@ static int msm_iommu_probe(struct platform_device *=
pdev)
 	iommu->dev =3D &pdev->dev;
 	INIT_LIST_HEAD(&iommu->ctx_list);
=20
-	iommu->pclk =3D devm_clk_get(iommu->dev, "smmu_pclk");
+	iommu->pclk =3D devm_clk_get_prepared(iommu->dev, "smmu_pclk");
 	if (IS_ERR(iommu->pclk))
 		return dev_err_probe(iommu->dev, PTR_ERR(iommu->pclk),
 				     "could not get smmu_pclk\n");
=20
-	ret =3D clk_prepare(iommu->pclk);
-	if (ret)
-		return dev_err_probe(iommu->dev, ret,
-				     "could not prepare smmu_pclk\n");
-
-	iommu->clk =3D devm_clk_get(iommu->dev, "iommu_clk");
-	if (IS_ERR(iommu->clk)) {
-		clk_unprepare(iommu->pclk);
+	iommu->clk =3D devm_clk_get_prepared(iommu->dev, "iommu_clk");
+	if (IS_ERR(iommu->clk))
 		return dev_err_probe(iommu->dev, PTR_ERR(iommu->clk),
 				     "could not get iommu_clk\n");
-	}
-
-	ret =3D clk_prepare(iommu->clk);
-	if (ret) {
-		clk_unprepare(iommu->pclk);
-		return dev_err_probe(iommu->dev, ret, "could not prepare iommu_clk\n")=
;
-	}
=20
 	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	iommu->base =3D devm_ioremap_resource(iommu->dev, r);
 	if (IS_ERR(iommu->base)) {
 		ret =3D dev_err_probe(iommu->dev, PTR_ERR(iommu->base), "could not get=
 iommu base\n");
-		goto fail;
+		return ret;
 	}
 	ioaddr =3D r->start;
=20
 	iommu->irq =3D platform_get_irq(pdev, 0);
-	if (iommu->irq < 0) {
-		ret =3D -ENODEV;
-		goto fail;
-	}
+	if (iommu->irq < 0)
+		return -ENODEV;
=20
 	ret =3D of_property_read_u32(iommu->dev->of_node, "qcom,ncb", &val);
 	if (ret) {
 		dev_err(iommu->dev, "could not get ncb\n");
-		goto fail;
+		return ret;
 	}
 	iommu->ncb =3D val;
=20
@@ -780,8 +765,7 @@ static int msm_iommu_probe(struct platform_device *pd=
ev)
=20
 	if (!par) {
 		pr_err("Invalid PAR value detected\n");
-		ret =3D -ENODEV;
-		goto fail;
+		return -ENODEV;
 	}
=20
 	ret =3D devm_request_threaded_irq(iommu->dev, iommu->irq, NULL,
@@ -791,7 +775,7 @@ static int msm_iommu_probe(struct platform_device *pd=
ev)
 					iommu);
 	if (ret) {
 		pr_err("Request IRQ %d failed with ret=3D%d\n", iommu->irq, ret);
-		goto fail;
+		return ret;
 	}
=20
 	list_add(&iommu->dev_node, &qcom_iommu_devices);
@@ -800,23 +784,19 @@ static int msm_iommu_probe(struct platform_device *=
pdev)
 				     "msm-smmu.%pa", &ioaddr);
 	if (ret) {
 		pr_err("Could not add msm-smmu at %pa to sysfs\n", &ioaddr);
-		goto fail;
+		return ret;
 	}
=20
 	ret =3D iommu_device_register(&iommu->iommu, &msm_iommu_ops, &pdev->dev=
);
 	if (ret) {
 		pr_err("Could not register msm-smmu at %pa\n", &ioaddr);
-		goto fail;
+		return ret;
 	}
=20
 	pr_info("device mapped at %p, irq %d with %d ctx banks\n",
 		iommu->base, iommu->irq, iommu->ncb);
=20
 	return ret;
-fail:
-	clk_unprepare(iommu->clk);
-	clk_unprepare(iommu->pclk);
-	return ret;
 }
=20
 static const struct of_device_id msm_iommu_dt_match[] =3D {
@@ -824,20 +804,11 @@ static const struct of_device_id msm_iommu_dt_match=
[] =3D {
 	{}
 };
=20
-static void msm_iommu_remove(struct platform_device *pdev)
-{
-	struct msm_iommu_dev *iommu =3D platform_get_drvdata(pdev);
-
-	clk_unprepare(iommu->clk);
-	clk_unprepare(iommu->pclk);
-}
-
 static struct platform_driver msm_iommu_driver =3D {
 	.driver =3D {
 		.name	=3D "msm_iommu",
 		.of_match_table =3D msm_iommu_dt_match,
 	},
 	.probe		=3D msm_iommu_probe,
-	.remove		=3D msm_iommu_remove,
 };
 builtin_platform_driver(msm_iommu_driver);
--=20
2.45.2


