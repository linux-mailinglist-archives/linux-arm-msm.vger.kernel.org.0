Return-Path: <linux-arm-msm+bounces-24555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C327791B5FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48A701F23A25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 05:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6042E832;
	Fri, 28 Jun 2024 05:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WP//koJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6827544369
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 05:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719552031; cv=none; b=W/d+wpWCXGQ9kGV2AkxcBRWr20WSxBVDIARV1ws9GYiLUaLIDKefyE11QTpQ9jYnwOD744K7aTvDCMEW0yt1cyUddwc/BLHGULwY9VI5H3DhtTtf8nDQyrMmykNQMF8moeuSvJWOxkqUvMkN4T7UTAp4Xgd/X09uf1yoCqNfEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719552031; c=relaxed/simple;
	bh=FEeU+ilaz87za6zCPoFOaXlZVVMvh4npbKUCi8WeMY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJHxNPokjk7J/Soyohy4wY2TtYmz6SFYhBye15pWydVNnTcKZIoQyAa34nfBo7mbRf4aWjF5IVSHP4zfRT6AyJWOjYhzfkUxMtuxtqfRpAr57mIEQSveHYA2USJM8LLzrxOlibtEQc7OBTLAU4FN+9dVlkzJxcBVrx+OOKwGx6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WP//koJZ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso181745e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 22:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719552027; x=1720156827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE116OZhrAVtMTDLnoQyRJAzaM6771HphQwBOF0FA8Y=;
        b=WP//koJZyAchgYrt88VAsD8Auu+edhF5AIqLLaU2a4PKvA3s9+GXL4lTOuVFAwmF9c
         dbJHJVppKko10srTytpdn+CB/yuToyM3BEREGHbMHi7gx1Uqlqx92Ngre/uUEcJNEdqb
         JlWaJvCgi2WTZ9GiQ19yGcc+vbHRJdBUqnenOhnaZK7zQcnKopl1SIkcuvEJJbCCU2ux
         GNMprBX1veZbgOLa/C/CAIb6VABhq+yFZh54j9zYUCmrBRqLrtvyG8+NMA8vZZI54z7Y
         +V38fjTc7coHKM57QQsevGH1Y0an53HLIMpR6HCj2T0ucYSjzh6xuQz8h0nuJEbu1Scy
         z1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719552027; x=1720156827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE116OZhrAVtMTDLnoQyRJAzaM6771HphQwBOF0FA8Y=;
        b=KfPvPQCzAQURVtG94B18R9KE6mA5gXNn3FwzVD/2fciDkUTh2VR86z6xv8mols3B1C
         MfOqUkd0Vr5RRmugvhTWII8e6A9R4Se1kLXoYUadZ/Bmm1SqkprCUC8Gywg2OZrN23/y
         Fi8yntmJmgPnJ0MYGQAkxq6QixnaR1rBq7bGsHHKrl6LlggRJczuhu2d7+Tk3WooFpK4
         XXAMOpgUr1pnyE37qYT8DF6O5invXebO01dh0UHy51Mwv+GEiwRm5KeIPJvRnNbhgYyj
         Gcmr8ggbDlSVnCWuKejAz0Pao8GJeWiIX7dITMe57GpcUALFvKAe3Dnw7zBuN/KNMsRo
         g1pg==
X-Forwarded-Encrypted: i=1; AJvYcCVGu6ZIwJxrV0G5qO5ngWZy34m5s5UpjytP0cOmxGCKIpzgfIluGkfLa1RZFNxaYsGthPpeydKKV3waJB8YWkv0t4sLqkngLqMQ7I5cYA==
X-Gm-Message-State: AOJu0YzT0oHDSHgzoIvl/t3STkAYzdThou8EEvlCwP5z3v0q6Odg24fA
	z6/VYkfTZSxV2qGPNBPPPxtA/ZV6pSLOSgqs65t8h0pAe5Ho6hfU/5lgqvRSMx4=
X-Google-Smtp-Source: AGHT+IF4eRuRBZixOvQGuZCBjBcZCcjgRAouzf5T2iMOhKSrhskvdlh7B9lkuHj35Rhv+diaJJm5Xw==
X-Received: by 2002:ac2:4c84:0:b0:52e:7125:c70a with SMTP id 2adb3069b0e04-52e7125c847mr2357345e87.47.1719552027519;
        Thu, 27 Jun 2024 22:20:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab101c5sm167736e87.79.2024.06.27.22.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 22:20:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 08:20:22 +0300
Subject: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
In-Reply-To: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FEeU+ilaz87za6zCPoFOaXlZVVMvh4npbKUCi8WeMY8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1qdh1RGtLDqrSahc1eU78cyaX6fMsk2Ms1cU3jH+5Mnr
 3jPjJ/YyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ5Exi/6en+kjt9wSPSSc/
 v3DbN6/GxTHnVxK//+UQj21NK55PelrscvGXSN5NZ5aDAdZ1EZEOFx7NyMiT2Pow/6S56eZqtwu
 a6hfquOV5D3suq7grr1S8Z5Zm4J4Im6xIoSr9bvGmlvV8sjF2mzk/v1/sH+MinDzDnrc28kXT8g
 snlOR+Gy08ZCx89p59/NzM5+EMgRI+ywMbfHUbJsv+0JwhmvnbbmfFYYdKEX3HuV31jkwuzGu4Y
 xd0eZhouamI7JpY2G21Pqgut1OukDU7zS3njblriP2avWJJLB1ys3li1N6wP77Wz2p1Kkw18+4X
 l+T0d+ekTFuzY1TOXNx0v9wj3bnDZ4sO942MF1tNrwAA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The GPU clock controllers use memory region that is a part of the GMU's
memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
GPU driver can use devm_ioremap_resource for GMU resources.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/common.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index c92e10c60322..dcc73bc22606 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -113,6 +113,26 @@ qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_map);
 
+/* gpucc shares memory region with GMU, don't request the region */
+struct regmap *
+qcom_cc_map_norequest(struct platform_device *pdev, const struct qcom_cc_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *r;
+	void __iomem *base;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL, "resource not found\n"));
+
+	base = devm_ioremap(dev, r->start, resource_size(r));
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	return devm_regmap_init_mmio(dev, base, desc->config);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_map_norequest);
+
 void
 qcom_pll_set_fsm_mode(struct regmap *map, u32 reg, u8 bias_count, u8 lock_count)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index d048bdeeba10..6cab7805a92c 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -60,6 +60,8 @@ extern int qcom_cc_register_sleep_clk(struct device *dev);
 
 extern struct regmap *qcom_cc_map(struct platform_device *pdev,
 				  const struct qcom_cc_desc *desc);
+extern struct regmap *qcom_cc_map_norequest(struct platform_device *pdev,
+					    const struct qcom_cc_desc *desc);
 extern int qcom_cc_really_probe(struct device *dev,
 				const struct qcom_cc_desc *desc,
 				struct regmap *regmap);

-- 
2.39.2


