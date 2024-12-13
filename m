Return-Path: <linux-arm-msm+bounces-42144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE959F18C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070BC188EEA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7827E1F4E3A;
	Fri, 13 Dec 2024 22:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEuO8N04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212EB1F4E28
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128122; cv=none; b=JpJu3HtBcHY2p3VqKuXa3Qf/0rP+JqA3aCsQ6cBJN74PB2gtcmze4v9acgu7QznEQwg1IK7UwOqKN+FIdUfIZiIrlfFIwkf/KR2XjVSh56L7J46pg/Q6z2x6JYek31FqybsA+EFKLhQ7ZYSYoMurcZriFRfnopXgC/47r54VWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128122; c=relaxed/simple;
	bh=7QgX9y6uM8IuoVXb12fNuYwwo5ohWM/78vfrldIO878=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/vcxfOAuP3wSCD1B5Wiy0kfkBP+TByayc+O9bndSm1O+fDClZRJpuS1reJD3rIbiC2kL+QlYpUjbC+ZwZe2LcTVqsDFVFHnmWOmO9KAmOj41hxAwO4aLlKvKdO6w+Flt6se1Qs8WEQAASpGlUfyRbyq4ZIfAnKD/19mCs46H3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gEuO8N04; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so22165811fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128118; x=1734732918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPBrpkMr5aA0e1PABupT3RXkj7m4si362ApxB4+SXY0=;
        b=gEuO8N04cDC9Futu0nZ9K5dnKvJAPg8Wqu7Np9K7X0HTl/otgYYIndLUKf00tErccF
         V+fjYlqPspfiyZ/KmYRA0vFAZSY5Lk1dAd0k4oKrooOsSMxeMJ0X6BiIfP3KPOAEfJdU
         00dW3MuoizXQHzVEacxfpNHCVmOZLpLg+MI5kEfQRmJwx+XqWOJG4xZF4oHPdXdaoxZo
         qM/RhDnxLNkaXPCcZzBUQnUd9O0zVYTR6CWcnLVguIiW/TgMtoRQsZavMXg2MLLWYuAv
         mCpqPeVIpm/WEnDmTCwp2AFvGvpCUquNBkn2CHRVHQq432y49LjRYsTonCRh2VWvg337
         DYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128118; x=1734732918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPBrpkMr5aA0e1PABupT3RXkj7m4si362ApxB4+SXY0=;
        b=f0AH3E8bw6lQs7Nf+xiKOb8vJcWJbY+UDY1C7oit1tB9qsBh4Akl2juKFOIbMW9Dcl
         ky9i2+Wfmit9w1TCScx0D0AD3i/pL/FOvV3Evu7vDY6jyY/+8afSlUnMpQccyAOanwK+
         oDEZDf994QmaaYL9vAWwaDkqmTglh+lRPaVa+wB4mlPT5jgzbSGo9hz4N33Jo84xbfph
         Tg4HNzvEy65sJlRw5nDurQZyTprQM5P0QryKQUIhxkvlYkzOhqmMY+GzJQHJbvJl+clY
         OBoAhs/2LIIU4D7mmOl2KIKfrCox9y9tXgUgYvuxEJdKE22aR//ccLTffZz71LXdPx0g
         f5Ww==
X-Gm-Message-State: AOJu0YzQbLpzNUmyV42CPLsO5bx8GkOSKnMg7vOIVPGs8Dt+fFx/8gMk
	gOY4fEkeT2DsZxj1fYxRPFJs+5K+MBu0vFgllOjB/YHA59tCopuwriHjaTEswx4=
X-Gm-Gg: ASbGncupEpZy4j6DJAclDIzgppEr4B/7I9QfcU83sXjj7EPmQg6kQihsOF8cGzo8ZS5
	L3jZrI5nmQyz92aw2LWzkapa1BiPG87IeF5mSgadZVBxz1IKM0HeEf6gfqKHdUSS9/I03K4tVfA
	8JdseGl+cvtoMLX/XO5gG4qjkzZAyc7PHAcrUlprBKtjsiYTtNmAJ4XpTkUxvqqYDt4Im1u7WiG
	lofma1vJl9w6t3RKwb2XG1t7wgSnshcdVE6Z1TlMddJUIzWChxSrU1ukXzCkeSP
X-Google-Smtp-Source: AGHT+IFv9QPgKXbOdJB1ytjvhrHw6t+vStGwzXk8SNzxnnM1O77P5SPdGvdHPa/y3ZS10UbK3EjZYQ==
X-Received: by 2002:a05:651c:4cb:b0:302:1b18:2c09 with SMTP id 38308e7fff4ca-3025459d284mr14895311fa.27.1734128118266;
        Fri, 13 Dec 2024 14:15:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:34 +0200
Subject: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7378;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7QgX9y6uM8IuoVXb12fNuYwwo5ohWM/78vfrldIO878=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHG7/6DDe7Ilfz5k7pOBfSQ7Bn/VEgRvglmf
 3GOvddDD22JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxgAKCRCLPIo+Aiko
 1X6UB/4kvsMFX+8xjMj2IgYjv4Y2MY42SHb4hngMi1HbK05zGxk3Ea29QLXvPuWHkBRUlCs7NXe
 W69Yr+rLRNCdeSAclzIRTGS3NlVhBWt4I3quKMnbyk24uLebRdwBkbwi16i6ObBImB4n2u9vkgu
 r97pnamaYkYpNYS7PXMnq/XjhzuItYfdK3IzpIc/TsXFZ33SipcY024goGvL06qVXLBcABUkQhl
 e1i8yvW7ofiqUIGJj/t2zoOTJXC/KGCbJWLPoCJvo0XHbWRSrfJhB8YiVEL/j1CNY6vw8Rz5sKY
 fp+kVdNZCftZTw+409z0oJc3QBa4MyPzcHA4hxNj2djym1Jw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Continue migration to the MDSS-revision based checks and replace
DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10 ++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
 7 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index c6bf3bca200d268912ae92cb8399a7e82b0d5ae8..14069958a71141815dc3722b00900c4659c1efab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index bebdba68667aaf79399da8ba810ca10d70ac430f..0d43041e727e13e7a364c35090f65405c74cab32 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -93,7 +93,6 @@ static const struct dpu_pingpong_cfg msm8917_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 598113bd59f1bf33dcf0c25ecdd81057ddf1029e..d7e8fed190800324cd4cf245fd258ef8c3187a93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 6dfbd843c3b1cb0d972baab9eb463ecbb334f075..25fa0bd574894ef4d11b14af0c0ef386539e121f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,28 +181,26 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
+		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
+		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b18f4848f61391b527af243e6f0866ac3811b7cd..3f9e0045d8d6268304a2d85ebf8d86db373a3028 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,20 +95,14 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define PINGPONG_MSM8996_MASK \
-	(BIT(DPU_PINGPONG_DSC))
-
-#define PINGPONG_MSM8996_TE2_MASK \
-	(PINGPONG_MSM8996_MASK | BIT(DPU_PINGPONG_TE2))
-
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 07349ba60c15387b0fa26b13cf6acaf69125b9f8..bef98e3471d4c8530e6a0fa35c8be207e080bd6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -119,7 +119,6 @@ enum {
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
- * @DPU_PINGPONG_DSC        PP block supports DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
@@ -127,7 +126,6 @@ enum {
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-	DPU_PINGPONG_DSC,
 	DPU_PINGPONG_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	}
 
-	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+	if (mdss_rev->core_major_ver < 7) {
 		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
 		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
 		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;

-- 
2.39.5


