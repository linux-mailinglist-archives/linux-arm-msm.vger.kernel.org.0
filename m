Return-Path: <linux-arm-msm+bounces-32135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B900497DC2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 10:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61EDA1F22255
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 08:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12584155753;
	Sat, 21 Sep 2024 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VvltQT1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F215C138
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 08:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726906665; cv=none; b=GohD2dXr4/Y0M1sbLt1pmLGwcRL1PCiv0/clfhwmpgEi2kFj9AwyDF/oBLr8mOTpyFNlOOPxyMzTxYVpgUIkuPrqngTQUaoc2iIFMFHC+hUDlwQM9KOeVcFQa1HHdcQWGhDpS/fIlt3icx38d8igKQ2BaSvMmyIJJwRSaFpEne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726906665; c=relaxed/simple;
	bh=utH3zMLcvKLREFFdRj1W6cb06ULAA1VlL6GfopIfnMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4u0Whpv6r79O49dnUDev+LtzfZQPxdG+H2k63ZgMEeI/bteIT67nppaBFWjXxpwoHHaOAXkAEzzWb/61XVWkRrILWefmYVvsoq5VfWf51I/I16YdtphIP2cVax/JIRu4QUQph+9LKFYJQR/Eot72w6F2R/bs2TTDV1T8IPvgDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VvltQT1U; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-535dc4ec181so2782540e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 01:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726906661; x=1727511461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixfycQ+OhOhX9IuLXKX0B+HAxSW+VAgfI+FMAgQa7F8=;
        b=VvltQT1UTJkuKnWBGz9/QeMYNBNig+NeOXPN45IBqgOCR/2OWaErcxcz2Se7dUVYvy
         GKNEzzOSagXhv726nExrv2h0IMdv7X7d3AzW8IkwFZmpinwSzBGkIxqqzwmmNZ5ALqGe
         mkV6Hv7rjqlVRl0VK1W3UELd56p7hPxZctm8JXHng6rU5o8AnyYs9o71zVzrzoPlTjjs
         GKi4JK0KDeSzCYVXRuZ4yON5+XqXtK22d27K0PTeXotU3r5Uw+jqJLMHk6oIMcLruacj
         hNoj2N8I0oy+XsAwuBQq/hmZCC0eFmGBoR66o3B5c0HPRDxpjJl1JUBnmYSA3VpiN8Qw
         D7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726906661; x=1727511461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixfycQ+OhOhX9IuLXKX0B+HAxSW+VAgfI+FMAgQa7F8=;
        b=d0OxsLc2HF32Ag2gzlbno3aLbXc7tzOtezwwZDhFZozcjb8vpq0iYDj9G3uYcC1Tas
         MEN/6qSXrSZ15sNDu47qgpsCk1zHPE3RgOw25BGKSi6LN0ss/PrIqkQ2u9RqQyET8CjG
         vOhHl0F1CCYSC0/JYclJ0RZ6pVapLpP0hOxOfoqfiINbLiHLjeIHzjQk6Gek3ILIabPg
         JdtmvCPKnqU8kv/BTBiwopM5S4ZIqIvuplBbUlGoAibu9VOiHHQzcNvNiHfr+J/YqM4m
         xnwiZMNZBVe/kTJcTlEi4s+ARbP2QKn5e4tEsyTdTFrdtReUE5FgtBFnEfuTy42RJKPf
         0kAw==
X-Forwarded-Encrypted: i=1; AJvYcCUsZ3pMWyqJKJbyGgLRar+yBWqz53Llrti5Z2UKmC/F7P0pg4f0tECXDoYAkbaOiSS2Wj5vBbwyHsb+AFjk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvh4+VtYnWsbqr6jGIkpxOnv9xT8OYZPld3455StWrDS//w6cg
	cZ5hqqOqEPIVKvBDAMusOuHwthOYfsBL5gvqsfJyenaiyxN830Gc/GuKavN8egE=
X-Google-Smtp-Source: AGHT+IEp2IVp8R8KzUBL8pFZ6IqlRNTBR0iIOqCUIF+8/lDk/lTF27LBao01hpKd+T+aKhAGMpWpcw==
X-Received: by 2002:a05:6512:31cc:b0:536:5364:bc7 with SMTP id 2adb3069b0e04-536ad3f1ef3mr2941827e87.60.1726906661068;
        Sat, 21 Sep 2024 01:17:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870968d1sm2466380e87.175.2024.09.21.01.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 01:17:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 11:17:31 +0300
Subject: [PATCH 3/4] drm/msm/mdss: define bitfields for the UBWC_STATIC
 register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240921-msm-mdss-ubwc-v1-3-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5389;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=utH3zMLcvKLREFFdRj1W6cb06ULAA1VlL6GfopIfnMQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm7oEfpeo0nvjCbwL2dXM/STLppUW5swOrto7k9
 XdHqOo7RduJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZu6BHwAKCRCLPIo+Aiko
 1VCqB/9LxaTlULqdwKDcuNwoJVeE49D/XErOIzKSH73pAJu7Mpe32GRuPRCDmOlTPEkxRsso+i9
 l45NWc0w56sxH4PhPj7k7kb0enJOA+mF/4csROdGXG1mey2JkQ91evsX+gAdUUDJATv5tyYtKzM
 fclXMaHCMl8iadQpu2K9zV8c0sC7UNmbZWe5jKzuSAMeHk0kSGSt8qL2k7tKzMYIU+9slUTgemN
 CijIzfNW8lFkY7Ozx/N1qhjw5pX/BV2DBKRhlzyRhPJHkBPUmT9mSSbq87sQGaNNXSm6GPsz2ZS
 bj4qTK+Ar4E7IToM2yyfb/NxaA1DtYwZAlR7ZT1CLTc9cG0U
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Rather than hand-coding UBWC_STATIC value calculation, define
corresponding bitfields and use them to setup the register value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c                 | 36 +++++++++++++++-----------
 drivers/gpu/drm/msm/msm_mdss.h                 |  3 ++-
 drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++++++-
 3 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ca9b7f953ac4..7704e1c9eb2a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -173,15 +173,17 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = (data->ubwc_swizzle & 0x1) |
-		    (data->highest_bank_bit & 0x3) << 4 |
-		    (data->macrotile_mode & 0x1) << 12;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
-		value |= BIT(10);
+		value |= MDSS_UBWC_STATIC_UNKNOWN_10;
 
 	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= BIT(8);
+		value |= MDSS_UBWC_STATIC_UNKNOWN_8;
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -189,10 +191,14 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = (data->ubwc_swizzle & 0x7) |
-		    (data->ubwc_static & 0x1) << 3 |
-		    (data->highest_bank_bit & 0x7) << 4 |
-		    (data->macrotile_mode & 0x1) << 12;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->unknown_3)
+		value |= MDSS_UBWC_STATIC_UNKNOWN_3;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
@@ -580,7 +586,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	.highest_bank_bit = 1,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 74000,
@@ -598,7 +604,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 76800,
@@ -661,7 +667,7 @@ static const struct msm_mdss_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -672,7 +678,7 @@ static const struct msm_mdss_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -683,7 +689,7 @@ static const struct msm_mdss_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -694,7 +700,7 @@ static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 3afef4b1786d..69095c18ab4a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -13,7 +13,8 @@ struct msm_mdss_data {
 	u32 ubwc_swizzle;
 	u32 ubwc_static;
 	u32 highest_bank_bit;
-	u32 macrotile_mode;
+	bool unknown_3;
+	bool macrotile_mode;
 	u32 reg_bus_bw;
 };
 
diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
index ac85caf1575c..57c0bdf2ef65 100644
--- a/drivers/gpu/drm/msm/registers/display/mdss.xml
+++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
@@ -21,7 +21,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 
 	<reg32 offset="0x00058" name="UBWC_DEC_HW_VERSION"/>
 
-	<reg32 offset="0x00144" name="UBWC_STATIC"/>
+	<reg32 offset="0x00144" name="UBWC_STATIC">
+		<bitfield name="UBWC_SWIZZLE" low="0" high="2"/>
+		<bitfield name="UNKNOWN_3" pos="3"/>
+		<!-- high=5 for UBWC < 4.0 -->
+		<bitfield name="HIGHEST_BANK_BIT" low="4" high="6"/>
+		<bitfield name="UNKNOWN_8" pos="8"/>
+		<bitfield name="UNKNOWN_10" pos="10"/>
+		<bitfield name="MACROTILE_MODE" pos="12"/>
+	</reg32>
+
 	<reg32 offset="0x00150" name="UBWC_CTRL_2"/>
 	<reg32 offset="0x00154" name="UBWC_PREDICTION_MODE"/>
 </domain>

-- 
2.39.5


