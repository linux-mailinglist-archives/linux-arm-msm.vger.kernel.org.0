Return-Path: <linux-arm-msm+bounces-36880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326E39BACD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 07:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 568F41C2166B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 06:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BA0185936;
	Mon,  4 Nov 2024 06:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V4OidpIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5D38F97
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730702825; cv=none; b=dKQJ3duz+4kdQq07kCfgqDRFMzgnYy/oIXSWUHfxDTVt09iULPOfnewppFjxIZoUNOTi+6H0vVXEmhXbQTvrwpOVJLv+9lLALlgOs3h1RKdDcG7OeiBPsvl8x7YXWyHOTb0iKttZjTHBLSafz+Q6N8qWAXz/w3TmDgT1oBdJP/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730702825; c=relaxed/simple;
	bh=QuoOFd8I0O91IyHHYYbLVeeFKUGtvwexJyPQTlJsxKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gV3Z1qbfPT3hisWvcjsIqSAtDHAe0YkiN/sPtqqZtxJQLSiyYqflkFq6P9Fas36VCJuH9J+aS7ER2ER6XwN+VSBrG6ecgeNq5rj735zp+QAvOEsjIyKHww3gKCpkIdn0ffd5UOuN0dSrXZBp3DXR/A1JMady/lGPBJVGLGGzVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V4OidpIG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a99fa009adcso260145366b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Nov 2024 22:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730702819; x=1731307619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcL58p8mF5Zl49nS7NSGvMtz/EmRjz2p/naj2ImhMnk=;
        b=V4OidpIGWUx6Dt8CTFiWzdw5FBf9aPdAlQywiyPBIiMH0F4YXMzI46fgEsnDJMiP45
         gpJiZGcgUtdPIfcSsf4u/yBWzkZYfauM5Nw1blWjyve6anyA0v/7c/HFfhJaxXUQe5tP
         rKh60sJ0N/zetnD2QCzRcxOxOLcC6W1BdL+soks+l1a17O0KkKqtbqiR4zGXnJ9v6ffx
         wivVmECFkGwEdBRqu1fj1lbeIKMSybNCUIgOdvgmmRZodhlMbjRqKL99+PBj3VPhiqPg
         xqxRxMrtZcryhqB6p3EI+caWHj2/3IKuUTEx3pKoafIv8MaISmeWgb6L72frpGPKG5CW
         USbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730702819; x=1731307619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcL58p8mF5Zl49nS7NSGvMtz/EmRjz2p/naj2ImhMnk=;
        b=iDdGNsAqtNpkVTT3OSq0deT/YhShVDHG7qqzysRySDbDmAYa0urSHygqog34qtkpDv
         YlgDIgBBKGS1oELifDcsHSuViRygBs5uEz+Lv06fy1yqNsu3L+i6Dz1yMCKaAxQvOy3/
         4seyPoTklYZLM5o8SFif6ajZBw2oWaukuzYLe16MBusD/E054hOmWFioX+pFne+uk9it
         f/d+4agZd90rLK3Q5AdiwRKe8qAYqJCOxWr1312UQFm2QjAYHAAl5AENwuBWOAtthIz0
         t80f5QIkX7FaZ9/vuZ0FONC1CmUKdJhlfK1ZUMZaVLWejyuLt3q7TiOxEcg7Vw+W3lhb
         en3w==
X-Forwarded-Encrypted: i=1; AJvYcCXR9LA38+3V3/qOODZYLWoEQINnyy4oNqpHAJx4GnAVjti8no24XGYNxvj1RrU2xA8xmw6KesJjgWYPhEev@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5vCO4inzXsahMwfWaTFoLbQOjSnSZfM6JPEe85T8hGlclFyXG
	LwOX50jY4c2PQOPqHfisdG9Q7oil/A/Xxw6WjixEgni3lAih2Z24bT+jFAWrRMo=
X-Google-Smtp-Source: AGHT+IFowEnMiDO/pTu4Oi8MLHthjGUPLyPZfFAjymH1tOvJMXm1s7ycGi2CQBqddOThNxzPIZCpmQ==
X-Received: by 2002:a05:6402:524b:b0:5ce:afba:f48a with SMTP id 4fb4d7f45d1cf-5ceb935bbc3mr15128807a12.27.1730702819312;
        Sun, 03 Nov 2024 22:46:59 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:6752:e162:c76c:a99b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565ef55bsm509953566b.137.2024.11.03.22.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 22:46:58 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Michael Shavit <mshavit@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] iommu: Switch back to struct platform_driver::remove()
Date: Mon,  4 Nov 2024 07:46:50 +0100
Message-ID: <20241104064650.799122-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7687; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=QuoOFd8I0O91IyHHYYbLVeeFKUGtvwexJyPQTlJsxKA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnKG3bdCqjD+kFfznlIAVOFLi0hJACxdKIJdHQs d8zimMeLKiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZyht2wAKCRCPgPtYfRL+ TgZmCAC7iVNHyJXfgq1NuwUsLEKQCs0OdbK3FGJTFb087AzN3L8qoZWNQ/7naPMqAa/iO/4+GLC A2oKxi5X2YXXvN/Kvagsv2AIKk6AJIWZRiPsBFWj+Ps3gBnDLZgJ06lC7qiV+1i1/uGlT8iiVLZ vs03Vk0J5Z4QLsasSAI4jMdHc1DWGQ36eUKWoCE7UlpS9fKMTuh/6l7xI0DRyMSQbZ5jne7oyV6 iVuUCy8OTrl+hiJM3OKc27D8c5vO2QwVNuS2BuC/pmSLLBWDQ8MYAT0JekQ3ByC2urzrPcTq7QI fMrzr4D5inlV9p1UPCJQFs7/4VeLVbptwDWaOxKfcLSVvoUj
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/iommu to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/iommu. While I usually prefer to
do one logical change per patch, this seems to be overengineering here
as the individual changes are really trivial and shouldn't be much in
the way for stable backports. But I'll happily split the patch if you
prefer it split.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/iommu/apple-dart.c                  | 2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 2 +-
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 4 ++--
 drivers/iommu/ipmmu-vmsa.c                  | 2 +-
 drivers/iommu/msm_iommu.c                   | 2 +-
 drivers/iommu/mtk_iommu.c                   | 2 +-
 drivers/iommu/mtk_iommu_v1.c                | 2 +-
 drivers/iommu/omap-iommu.c                  | 2 +-
 drivers/iommu/riscv/iommu-platform.c        | 2 +-
 drivers/iommu/sprd-iommu.c                  | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index eb1e62cd499a..c5bde50d1c42 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -1352,7 +1352,7 @@ static struct platform_driver apple_dart_driver = {
 		.pm			= pm_sleep_ptr(&apple_dart_pm_ops),
 	},
 	.probe	= apple_dart_probe,
-	.remove_new = apple_dart_remove,
+	.remove	= apple_dart_remove,
 };
 
 module_platform_driver(apple_dart_driver);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 826db8894fb7..efbc78bffd33 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4679,7 +4679,7 @@ static struct platform_driver arm_smmu_driver = {
 		.suppress_bind_attrs	= true,
 	},
 	.probe	= arm_smmu_device_probe,
-	.remove_new = arm_smmu_device_remove,
+	.remove	= arm_smmu_device_remove,
 	.shutdown = arm_smmu_device_shutdown,
 };
 module_driver(arm_smmu_driver, platform_driver_register,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8321962b3714..4e9bb9f4c4bd 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2372,7 +2372,7 @@ static struct platform_driver arm_smmu_driver = {
 		.suppress_bind_attrs    = true,
 	},
 	.probe	= arm_smmu_device_probe,
-	.remove_new = arm_smmu_device_remove,
+	.remove = arm_smmu_device_remove,
 	.shutdown = arm_smmu_device_shutdown,
 };
 module_platform_driver(arm_smmu_driver);
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index b98a7a598b89..9ce2fe50b22c 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -759,7 +759,7 @@ static struct platform_driver qcom_iommu_ctx_driver = {
 		.of_match_table	= ctx_of_match,
 	},
 	.probe	= qcom_iommu_ctx_probe,
-	.remove_new = qcom_iommu_ctx_remove,
+	.remove	= qcom_iommu_ctx_remove,
 };
 
 static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
@@ -931,7 +931,7 @@ static struct platform_driver qcom_iommu_driver = {
 		.pm		= &qcom_iommu_pm_ops,
 	},
 	.probe	= qcom_iommu_device_probe,
-	.remove_new = qcom_iommu_device_remove,
+	.remove	= qcom_iommu_device_remove,
 };
 
 static int __init qcom_iommu_init(void)
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ff55b8c30712..074daf1aac4e 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -1159,6 +1159,6 @@ static struct platform_driver ipmmu_driver = {
 		.pm = pm_sleep_ptr(&ipmmu_pm),
 	},
 	.probe = ipmmu_probe,
-	.remove_new = ipmmu_remove,
+	.remove = ipmmu_remove,
 };
 builtin_platform_driver(ipmmu_driver);
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 989e0869d805..ce40f0a419ea 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -838,6 +838,6 @@ static struct platform_driver msm_iommu_driver = {
 		.of_match_table = msm_iommu_dt_match,
 	},
 	.probe		= msm_iommu_probe,
-	.remove_new	= msm_iommu_remove,
+	.remove		= msm_iommu_remove,
 };
 builtin_platform_driver(msm_iommu_driver);
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index c45313c43b9e..72b68d037b95 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1794,7 +1794,7 @@ MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
 
 static struct platform_driver mtk_iommu_driver = {
 	.probe	= mtk_iommu_probe,
-	.remove_new = mtk_iommu_remove,
+	.remove	= mtk_iommu_remove,
 	.driver	= {
 		.name = "mtk-iommu",
 		.of_match_table = mtk_iommu_of_ids,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index ee4e55b6b190..480e57ea6635 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -745,7 +745,7 @@ static const struct dev_pm_ops mtk_iommu_v1_pm_ops = {
 
 static struct platform_driver mtk_iommu_v1_driver = {
 	.probe	= mtk_iommu_v1_probe,
-	.remove_new = mtk_iommu_v1_remove,
+	.remove	= mtk_iommu_v1_remove,
 	.driver	= {
 		.name = "mtk-iommu-v1",
 		.of_match_table = mtk_iommu_v1_of_ids,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 3f72aef8bd5b..b8ced5d0581c 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1285,7 +1285,7 @@ static const struct of_device_id omap_iommu_of_match[] = {
 
 static struct platform_driver omap_iommu_driver = {
 	.probe	= omap_iommu_probe,
-	.remove_new = omap_iommu_remove,
+	.remove	= omap_iommu_remove,
 	.driver	= {
 		.name	= "omap-iommu",
 		.pm	= &omap_iommu_pm_ops,
diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index da336863f152..382ba2841849 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -81,7 +81,7 @@ static const struct of_device_id riscv_iommu_of_match[] = {
 
 static struct platform_driver riscv_iommu_platform_driver = {
 	.probe = riscv_iommu_platform_probe,
-	.remove_new = riscv_iommu_platform_remove,
+	.remove = riscv_iommu_platform_remove,
 	.driver = {
 		.name = "riscv,iommu",
 		.of_match_table = riscv_iommu_of_match,
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index a2f4ffe6d949..e84806eee281 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -531,7 +531,7 @@ static struct platform_driver sprd_iommu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe	= sprd_iommu_probe,
-	.remove_new = sprd_iommu_remove,
+	.remove	= sprd_iommu_remove,
 };
 module_platform_driver(sprd_iommu_driver);
 
base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
-- 
2.45.2


