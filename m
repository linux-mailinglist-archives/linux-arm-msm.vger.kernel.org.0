Return-Path: <linux-arm-msm+bounces-42136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198369F18B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5805E7A069F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80E31F12F8;
	Fri, 13 Dec 2024 22:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+CxmfNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4299219992C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128103; cv=none; b=NLWp3v0Rd+E2i59GkSPSygSlBIh+zgEH0cMgnRcVWe9gZaRgshHEE3B9D5wE+MIxx9t7MpY+U0xXJirhVxlGSxi2k0E2TCqd04ZS+1aVHnBZ/tFGFoFpfmvHylxa8AiqoA7zq9XQEis+UzKjZX9i8I+IZPcepBQ1iCGBk0tWosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128103; c=relaxed/simple;
	bh=EwPUAyArN3ZzS2kveec8ugysy7gaTH7/5aQfeFJ7azA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHpliL8UauAeLUTPw+INLWtPqrGIEvD2EaxGPTG4DWjrpj36OY2STWVEgh2p2xY6VPD+mLR3K2eaKl3VX/0ybiQuhxy3eeYKKAUIiFp2pmuJYmIaUHPT7vJSn8414SeF3KBa5B8EGyrpLPvwnY1+HfRMsYl2O3Qx40jJ80VYlu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+CxmfNL; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so21876931fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128099; x=1734732899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ0jMMeFZI/Qbuc2oL9nG7fzZAmL/te/xuFegx9+m70=;
        b=x+CxmfNLhCch/6jvBIBsXVcw24sSL1awfjmRMvbGcPu4hifLj0hJD3X0gxO2Hot4/6
         O6l9Bfq5biXgen7xhIwn6vrTI2MvpSzQ+of3ofaZNygQ7KHtWqgDZ4eUiIrQJ9rPzu0k
         SBOvSuxv5m6fd1Tc/D36BmpowWzdhinT/RDEts+pMdAyfRjABpIa3N225M6jCWyBAyoE
         MMV1d1lzAmieDwXrS2kygCoGt7/19ru7sU86tPi1smD/hMtX2bWIFAw9TOn7wR2wQgkV
         +xgA2/ySlFIdXtxApA+rPrFkG6v4UgVb/vfdDvnzHmEC8VoEpMnhSK14jrH3WAQK7X1v
         Ybiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128099; x=1734732899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQ0jMMeFZI/Qbuc2oL9nG7fzZAmL/te/xuFegx9+m70=;
        b=v9rfh4/Zn/NbLVxF6SzHgEVHq9lm3c8s+pEezWC4UzpUCogzJ/rdZbiwL9Bq/RR8Sg
         HWyDOHdExyZljsR8LtHHRnAoxBn8zSyGxhYzukG1tXCimt/mo7pYvOop2X/U5MoKTITf
         P3EaHVaxC5iWtLsH7Hvv9CzOkVXcwRPvBcyTRlp1KQDQ0Dxhl0VquKThtyJXXUMEV8Ke
         +0+WnqSYfKTVYxYVfiKlWjeLO8Mrep5nTlP0GiZbhGGYLmq0ngk3hyD26rBYcKyGOHOz
         oIL01rKDgf7NPZB/beZCoTg+CRas6GgtFOXdITXkpTOvtyvN+ucpzjkoynb0XeDHqIlp
         I7FQ==
X-Gm-Message-State: AOJu0Yw5orXU86+dCT2kK1IvOiu0H1NDf+padBJTBPJo90VMLSaSB5SS
	T+ee3hrwfwNslsMrQLCgJer5sDmmyctL9We89qHziTJca8Mn0zIE3sK2MGMyj14=
X-Gm-Gg: ASbGncudHEadx4+mqwEfU1M6eg1S6Vc/K7liKOJbeEwehWLZRvyYIF6RVftwUzmDsZh
	JxsPT8fPHXEmvSKlKgVldjGqc9S78cRuAwr/E4id/nXwILUQDMHzcqKZ7i2ShYtBKoqpBloErnv
	0+i5lYtxkEecsBRUv0Em89tp83xe4V9mUFbw1etjBMvRJvHs2UfzpVM4DQk3SFZpozboiorTQ2v
	IXpkU6/b0h+qwi6Z9ipxIQ0syAsNYMs+ZzgQtnrpM2zMQYliFvA17K5LUssPzaj
X-Google-Smtp-Source: AGHT+IEbJgVELQXY+5JRzndTC37rIHQt8RNMJ7BAChPpJFu+JAnt3CxYp1q/d7xtuY/48GaF/vY6kQ==
X-Received: by 2002:a2e:a7ca:0:b0:300:2a48:fb65 with SMTP id 38308e7fff4ca-3025454f6a9mr12780921fa.18.1734128099341;
        Fri, 13 Dec 2024 14:14:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:26 +0200
Subject: [PATCH 10/35] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-10-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11027;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EwPUAyArN3ZzS2kveec8ugysy7gaTH7/5aQfeFJ7azA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHFgm/rhJ1ZGnW10w+usEjV1Zdca+Vq4hspo
 aMdsiq7TKSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxQAKCRCLPIo+Aiko
 1Z+KB/97WaIwdvVW5V6XpWw+9Nj3Tfbaxibfs0HqE8NO4sTTCsUt8GoR5fl429ng1zyutcKg5Ri
 vVnqMq9YJjhTJzAASWwJDAwkQ74W7MmUu0Za8A5h8Vv6ejL09ODH9lUBRRSodwFJd65NhIFCuFi
 REIluSI2IQ1AAg0x0+MqTjXYC8fbB3bnx0GrHyts06UajASS+cADCimzyZ6du7+7yGC6sRL6898
 Vi5nC6/InFU4pIsnd/Lni8g10sFk1Cs6LodGZOIrAXDXGdLbbGgTvpnyXHgxnZlk2yMa3e3IfVs
 fraG7SYagSx+L0iSnLHVYlRuI0LjPLuVIvaSKl17INRn/Sm8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_HAS_LAYER_EXT4 feature bit with the core_major_ver >= 9 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h               |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
 8 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index bfca56ba20ea434cb22846746cd1dcf66890679c..a070345e63ee5eaf5ef6d7b8a4cc433c20c84a12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -32,32 +32,32 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 6de37c9c89995e0eecd663e6903211a453afeb56..e1eb3189aa63b88a448257976b674f5b8cbe8414 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -32,32 +32,32 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index ab11592c204e5e6ddb8cb39df5a9248ccc60d11e..260fffff80af11f05a613b324f40c11ca0bafcbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index df0af12b63703603bc6289d5bccac2940f8baa3b..6378e99452c8046f01958a96342f545c754ba8ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -116,9 +116,6 @@
 	 BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
-#define CTL_SM8550_MASK \
-	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c701d18c3522393b7d18d085d6554119f27f737b..f5c40e25ce0974ffe76622b42bf8fe6db67c1a0b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -136,7 +136,6 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
@@ -145,7 +144,6 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_HAS_LAYER_EXT4,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 9a958a0c19f54c2ed2c204e314dfa8cd9e735111..5f9cd09589bb403746d48af6f8555cd224bf3195 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -535,7 +535,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg[1]);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg[2]);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg[3]);
-	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
+	if (ctx->mdss_ver->core_major_ver >= 9)
 		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg[4]);
 }
 
@@ -693,12 +693,14 @@ static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
  * @dev:  Corresponding device for devres management
  * @cfg:  ctl_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * @mixer_count: Number of mixers in @mixer
  * @mixer: Pointer to an array of Layer Mixers defined in the catalog
  */
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver,
 				   u32 mixer_count,
 				   const struct dpu_lm_cfg *mixer)
 {
@@ -712,6 +714,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
+	c->mdss_ver = mdss_ver;
 
 	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
 		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 85c6c835cc8780e6cb66f3a262d9897c91962935..f04ae0b1d986fa8f73e5bf96babfca3b4f3a0bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -260,6 +260,7 @@ struct dpu_hw_ctl_ops {
  * @pending_wb_flush_mask: pending WB flush
  * @pending_dsc_flush_mask: pending DSC flush
  * @pending_cdm_flush_mask: pending CDM flush
+ * @mdss_ver: MDSS revision information
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -280,6 +281,8 @@ struct dpu_hw_ctl {
 	u32 pending_dsc_flush_mask;
 	u32 pending_cdm_flush_mask;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
 };
@@ -297,6 +300,7 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver,
 				   u32 mixer_count,
 				   const struct dpu_lm_cfg *mixer);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c247af03dc8ef7174eedf3d5cc267d64f17a8656..c73596ddc7edfd8065c980d203632a0707d6fede 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -134,7 +134,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
 
-		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mixer_count, cat->mixer);
+		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mdss_ver, cat->mixer_count, cat->mixer);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);

-- 
2.39.5


