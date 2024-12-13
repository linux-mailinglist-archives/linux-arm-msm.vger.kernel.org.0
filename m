Return-Path: <linux-arm-msm+bounces-42159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4A89F18E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07C72188EFDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8D81F76CA;
	Fri, 13 Dec 2024 22:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iy4ruxZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C301F757E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128155; cv=none; b=VR35/tAlMBgSJ8QedCL49pX46xrFlA1zNlmNpb/ltFhL0fCFumcO8vKFtJd7cP2Zmmw60dy41U8zN3Qzv3/xR0i+7h4dqzbqhyhEdLXgW8tdb1XmluVahxTI5c/ZB5FFrGTZYGj3VptNkyNTXV9Yz7Uof9giwwGiN+lckFNguNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128155; c=relaxed/simple;
	bh=BaD95paJ/VkJ9sr52OYEiXUviKr3qlMKqDK1M2VYhhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udq/3nT2SOg1yK410L3zcxcOkhT/PedjbLApr6grwq1Wr10oObJJjURAiYbIrReSq0AdpKYBB3qtail7aFZaCLkbqCuGpdoDLHks+HPGnv8BlrxzqLhUn6zTJIwn56VsLR2BMNBqYtQVaLhNLYpFID/Jxqw4M15i7dN3wvuh/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iy4ruxZ7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30167f4c1deso19364051fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128152; x=1734732952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgnXSw22p9AVoneO37xWbi4u263z9TH7MUXsjpCeiIk=;
        b=iy4ruxZ7dU2GwX0UU0bIReTr0+EhVhOdZCLqoAZB88iHGoN3Q1q2dJ420FzGl58qVd
         mNU/TEbJm0fv3iI34VCkoEAl46MlKUbMWTVwzz8tZbkcjiDLonuus8gstxEfCq5JhOAb
         bSq6enut2OiWZmK9XyNv2U6L25mRr97USDP/4ZEnVOpc54uxBXrqVTM6nqoYPodFrnU+
         1stQpSJstS0h6qhW1qjdyLkYOXU2oOjNmq9a593a0SMJVgdXr0UKvLm4pLPcLAYoauFq
         9WtO+OFzYZQdWPfgx9KoT5skOapLm3uCNqZ8xpQsID165cwW8ChuWqTDRWmRwRdknM0B
         pDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128152; x=1734732952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgnXSw22p9AVoneO37xWbi4u263z9TH7MUXsjpCeiIk=;
        b=CdmI4Z6LzRsqKQaxYaZd4/6VqWsFdlfpM508UwhGKCxOn2hO1EbmhGqPyShZG5YHhm
         fhtKXo3ggJmq7/vVEip3lMjTbWT8tpXDmiQ1liDCxD7MJsotdkBOTAtt78wS5S+nbgv/
         IrnKT74roC8aZ/ddwouXmO0Ba9MVAvbpKl3dlYtne+VVdlHYhu0eSKmjzL6Nlgksz1qP
         VbJfARV+8CN5xtHckTS4tLGyyMbxLjf2wDqMplfCYOeoWL9CnL0t2T5/XFLCl7SAjX5T
         QoeClihXQkEXeFT9Fki9bfF5VcOHmSdu3i6XY++LtK7SwqMgD+MMVVjXa70BAefs6pkf
         x/hA==
X-Gm-Message-State: AOJu0Yz6TiYRuVPPwzDIX6d/QtjpSRyUKVkO2gPBL4PhGhf/vTubJbzz
	3J21r/9N9XVH5KDd8rxMgUbVSck+S5r/5ijG9LoKn3W8yD0udNfQCNCiFNnEcTvsYoSgLLZw4Oo
	GdosINA==
X-Gm-Gg: ASbGncv8lC/i7uWd+UDoiGKcSUs7iK5vqIowSc1IcMQIR7+rjEJ4OzVElW2PVMz+9RB
	HarjO+7XV2+zuhlte7V4UghzB8eKtot84+/cL1mlmo5BItbnjz/RZvd6WkY7H7hs2xSJQ7EjaMw
	0DAL/fnGKEn8qNZSmi5syNgqUMg/FqDRvlhsXhtVyeb7rOjur7/SKzeAa2BrkbvBC1BiPzjhi8w
	+Ti8jruOIUn25JrZmGdEPT3DTJS67gZXJkdjXzyXvaqkuCzA49XaV96ANadMPrQ
X-Google-Smtp-Source: AGHT+IFXiYUQJVe1uVw71NsugHInPekJLK+ZnsGd84wJBm8fZCjrV9y3rF3pXhIYsKwxufJI/A6oBw==
X-Received: by 2002:a2e:97d1:0:b0:302:22e6:5f8 with SMTP id 38308e7fff4ca-3025447cbc5mr12617721fa.22.1734128151716;
        Fri, 13 Dec 2024 14:15:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:49 +0200
Subject: [PATCH 33/35] drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-33-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9210;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BaD95paJ/VkJ9sr52OYEiXUviKr3qlMKqDK1M2VYhhI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHJlJ+wZ0+52uWQv7JwEVxvjCIVm7tBJOkHD
 pN0uVLhTcaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyQAKCRCLPIo+Aiko
 1f2uB/9DIlxqKXvof+E6FhHIsHLNUaqUd31FyV3u+v9JALnwPVCW9+9slkXaCATFi4AkdsiDRpG
 nB1lEtaSPCmyats9p+E0UR0COHgV/mbl/5SD2Pl2iqyIFgY9JHQdlSgrk7ChBgI/d9uq22smOEQ
 PdjqOeW55fNitvqoUuVQ4dPuNHRZx9yBhKzhCnw2Hy9xW+dVPKV/el8wOuORdIbIrQbHI26fzwt
 Zhfyc1HLBgRCTdXuGAwZgEcw1av+EukSYeAg2GR+H8ZRVepdeOAI/1GaFWjdxiYm8AIAznmKqrE
 Uo2IqIb4EsgWJrGnT/P3p3RjWPGzsz/baePgWFPdlDzsxZYj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Continue cleanup of the feature flags and replace the last remaining LM
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c           |  2 +-
 10 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 612926b4ba9b311becd642f42f303507f7f3cee0..5ab18f8e52b6662752e7307b39163afee1ef0ddf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -287,22 +287,22 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 60c8dbec43f36e269297e90f88ecfdc6e1fbbe4b..d8fe836a9c8e2f1b039e58bc2a6e9135607bb49c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -272,12 +272,12 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index f8713b41c18aa638bb9bcbf66f3d0bfe2a279e1d..63ff7be1156fcdf9aaffb8013351f3a59a7cbe18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -150,7 +150,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 543e346ed6072693812fb3d12bc981327c3e621d..336b5fbe23fee2a734601168ba03a172115b932b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -273,12 +273,12 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index aa5894a32b3acd7d9a088d502c0cd5cca8db4e36..50de4597b28928cd0619244d2879743949e38ff7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -287,12 +287,12 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 1411239e29ad9ce84060ed9244b3c3c11182a039..abc3c41f036c3bb0c29866c59bf9998e05affaa6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -286,12 +286,12 @@ static const struct dpu_dsc_cfg sa8775p_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index cc99a9be988f703e299ebbfda1e299d9782d833e..56f7f271638e7b0cea35f6eaa0a9fa927b4a7113 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -281,12 +281,12 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 4f4583c6376b8c7e361bc0b89a9461e8e42dc65d..0a9d42bbc7fd29f924eee4c055ee81174c75f40f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -281,12 +281,12 @@ static const struct dpu_dsc_cfg x1e80100_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 06c447e5ae8f0c5a08b1d293488c4b1e4c075ab2..dfa27098929e8f9529f2b44b11d6005593801cd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -128,16 +128,6 @@ enum {
 	DPU_VBIF_MAX
 };
 
-/**
- * DSC sub-blocks/features
- * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
- * @DPU_DSC_MAX
- */
-enum {
-	DPU_DSC_NATIVE_42x_EN = 0x1,
-	DPU_DSC_MAX
-};
-
 /**
  * MACRO DPU_HW_BLK_INFO - information of HW blocks inside DPU
  * @name:              string name for debug purposes
@@ -474,10 +464,12 @@ struct dpu_merge_3d_cfg  {
  * @len:               length of hardware block
  * @features           bit mask identifying sub-blocks/features
  * @sblk:              sub-blocks information
+ * @have_native_42x:	Supports NATIVE_422 and NATIVE_420 encoding
  */
 struct dpu_dsc_cfg {
 	DPU_HW_BLK_INFO;
 	const struct dpu_dsc_sub_blks *sblk;
+	unsigned long have_native_42x : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index b9c433567262a954b7f02233f6670ee6a8476846..42b4a5dbc2442ae0f2adab80a5a3df96b35e62b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -62,7 +62,7 @@ static int _dsc_calc_output_buf_max_addr(struct dpu_hw_dsc *hw_dsc, int num_soft
 {
 	int max_addr = 2400 / num_softslice;
 
-	if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_42x_EN))
+	if (hw_dsc->caps->have_native_42x)
 		max_addr /= 2;
 
 	return max_addr - 1;

-- 
2.39.5


