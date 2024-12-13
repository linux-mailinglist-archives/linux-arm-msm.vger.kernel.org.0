Return-Path: <linux-arm-msm+bounces-42152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B54109F18DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C004016B69A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F7F1F7545;
	Fri, 13 Dec 2024 22:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCJTkfeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E001F708C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128140; cv=none; b=caBWQ97FPDSSmLkTOfCdcekvKh3RnwXke/yKBykCgCaPr4RRjOjSDpv+l7MEdmsZWpJX73pecdTGHKolHwSyN9yzzSOopgsxuRt1ZdWCIXkz+wkxoHQaGPU7dk7NMKLaiBo7BUiuntg8PsGcOhUUVeDD/x45dsVz9istriXUvDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128140; c=relaxed/simple;
	bh=cM8mJZH7WCiESE+heBBJa5mbSESn3wlzED1A0y1ptCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g+tmgDTEODNWIt45107R7+H4p/3+XvtbqUp9EpCGJQlne/XidBY1o/2/DWm9K7153btlWFxvAP3hR381uhj8VF91arZl3k8SlNiMwOHT96MyV9VB3s/QFWrWgIp4Id7d8jl8uj6v6EdXz3x4QPaPCWMNK+3cR6lT5BTpttWJvlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCJTkfeS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso18586181fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128136; x=1734732936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+MyhdpzwcjwVSgBPLahm1/Of9d1fJs0qUbzcGkreCU=;
        b=ZCJTkfeSAwL0Ai6GgDL7gamfYpenDKqnAgGiF/AHJDOfFBGH8y4IC3+eTBaL9nZ1o9
         luIxmOxkKcmrDVx8aEpbVuss074nYwyV+AX4pgvc6VjJ84cwM7N95/fC/xaiutMdDucD
         /bIsklnir/A6zOdJyA6S5rt8N5WiMwe3umu9RepuNmeNpLnty54Wz4XH9ZO51rVXcaQU
         ZxIMnjDBSVVpaC8s4dKgvYabRflIrtuKx1ePidbtk6NQJ13XV3PnrNOU2bC8aP2KfYBx
         JtdCOulJb3TEUiYGFzCdhRfEQxiN/GLp1WKyyF/eEfY/3Mbd0+vJUwdt+XV0ttZoijBg
         SicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128136; x=1734732936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+MyhdpzwcjwVSgBPLahm1/Of9d1fJs0qUbzcGkreCU=;
        b=IY50mIpWFOZO9pTNsFSqj0sEdb9ivybbTZx8SO+B77Rco6NzrPPsIS6eQVc9SZ8x0d
         0BdzS2+0MnIe1KxjziIKLN4T9PulSbwEwcUjgCdnCKbzodXHuPp8nF3RXx04q2vvzU/H
         JYNqy/4GXNNDsYrmrYIk/hDCJAz1Jz7JbUOUkL6uxZ7qV1sRP/gvfSMhN6uylyI7mVBB
         Q0Sd7gNEFVd5pko0/f8d2PqWRgOb+JeM3NejWQ5DLhdoQAdnXaQVgduB+Vp4MOvh/rb3
         dlzBLwW3kaMQ0TvnNwjETAjeykMCJIyA1SW8roylMKhqIHN9zDKwRh9jlKsnDcKEwSCL
         jq0g==
X-Gm-Message-State: AOJu0Ywm8XGUQzxfR8nCnLra2YTR64Q9tAFsyEklUU9ELIsTl8hY0rRW
	E3RNAe9f8pCkvdQRnEuLo1VEiToXWy4iiHv6Di5j7Fu0JNKFO3P2+zUEPFYSl/887K1oKLHA0UZ
	8sXsyWA==
X-Gm-Gg: ASbGncuPwoUYIqLvcOn/wc1tnQC64d1Rac1Ow3PZ6x2cT1C5rsYyj4aHXy3rIsciEBc
	4OlIQ7zaBadezNRH62pumdNzW7TYEmAZ6MwRuqWHV67wzENFLh48e4Vbh1jZxuy8M+/ERWZsPWb
	obxcdBh4iY+4A7ObGCZjZA9DluGKMaqkrC5/mrYLnDZ6ATJxC3w5b5ff8js78gkda68bDr/oGtO
	659ACEobN0eL78KmgIfDonRXyueFX6O3eLoz3sdVW0RYQvAhP+SHVnT6dKnxbDx
X-Google-Smtp-Source: AGHT+IG72RVeZmCQLZ/w4O2LEjLHC0VVxdnitKV9+XQTUGK5N3xZpnbFyw2cL7T5a4PYCUs6M9Epyw==
X-Received: by 2002:a2e:a5cb:0:b0:2ff:c3d2:b0ab with SMTP id 38308e7fff4ca-302544b1a1amr17795491fa.29.1734128136508;
        Fri, 13 Dec 2024 14:15:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:42 +0200
Subject: [PATCH 26/35] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-26-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8937;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cM8mJZH7WCiESE+heBBJa5mbSESn3wlzED1A0y1ptCY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rMxhMSh/UYmpbMucknL/BO8US5VkL9Z1tOl10yJzYsV
 NH1uV3ayWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJcOhwMKzf3xHWK2A779mc
 vtNCuscsaxbknmaS3+fiWH2Hq3Pal5IDnYpPH6c3qW2wY+ft3/jMi8tkm9PtZsfaz02mea9vH+X
 0f6XFLFJ9/2J+RFLzHfHfHntiLdYyXvSJ0T7kqyj4Yd+GFeu8VHceNLsSGhcaaO82XTFoY5GFk7
 avTeaVZyqFLy2i/hZ3pOhXcm7lX+DStzo6//1kFfu5az+d/iQpvr5TosthOvddsdMF+VvbNAwqe
 s96MK+X7zG3Vq9gj3tzprz+4YqjFTOePl/B/tZ55i7uLO66KLNZrV2ruUw4uMN4Ms95ruNOaPx/
 JWrSjHkMBWYWLhNubv08ee8VddtXXZJrWCZPtxRstAwDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_OUTPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c              | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h              | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
 10 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index d5e608402082cfc3cde8d156acdc85ee366af685..6ce69b31bdbcadd4819cf198ec9e7fd7fec9d685 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -260,19 +260,15 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index e3ea28c653328cf926a18426d12f07821c413b30..96a943361fb12bc4cf6fda6fbb6bbb6a01fd97f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -259,27 +259,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_4", .id = DSC_4,
 		.base = 0x81000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_5", .id = DSC_5,
 		.base = 0x81400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index a30b8906091d3ae72f2f9cdfc558942cab0a713f..533312fbd70c22314fbabba17116cbbeca8df515 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -195,11 +195,9 @@ static const struct dpu_dsc_cfg sm7150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 1f542c3fba6a8c3ddb5eafa6536a9206cd5a61ce..68210af03c3d5248530884199f9dcda651584026 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -259,19 +259,15 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 0e4d78470d27f3c5aed8171278ffe5d9d4126174..98891b4b929fd11b92b846ea20467746fc43735e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -135,7 +135,6 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index b5a3574e2ce43f7f5d47c42fe1bdd0f084396a9f..c08d8bae3293d00ef7ff28942699ae2a52e2cea9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -87,7 +87,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f794218f14a96eda34d786783fdbde98f9ad1237..d9b500c14594ed86a8ce33b3a9dddb9f7d69129d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -176,14 +176,11 @@ enum {
 
 /**
  * DSC sub-blocks/features
- * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
- *                            the pixel output from this DSC.
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
-	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_NATIVE_42x_EN,
+	DPU_DSC_NATIVE_42x_EN = 0x1,
 	DPU_DSC_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 0db375d2d779e075d20d08de059124bee81652ab..9fb70ff3aa2d047b7e17f6f063f8b32276267a26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -185,11 +185,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
  * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_dsc context
  */
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr)
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_dsc *c;
 
@@ -206,7 +208,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 	c->ops.dsc_disable = dpu_hw_dsc_disable;
 	c->ops.dsc_config = dpu_hw_dsc_config;
 	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+	if (mdss_ver->core_major_ver >= 5)
 		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index fc171bdeca488f6287cf2ba7362ed330ad55b28f..b7013c9822d23238eb5411a5e284bb072ecc3395 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,7 +64,8 @@ struct dpu_hw_dsc {
 
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr);
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver);
 
 struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c0adda2b763648cef439c38980b9f393b59c0094..a7c5cea7489df353491a8885e32d2673133d41c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -163,7 +163,7 @@ int dpu_rm_init(struct drm_device *dev,
 		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
-			hw = dpu_hw_dsc_init(dev, dsc, mmio);
+			hw = dpu_hw_dsc_init(dev, dsc, mmio, cat->mdss_ver);
 
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);

-- 
2.39.5


