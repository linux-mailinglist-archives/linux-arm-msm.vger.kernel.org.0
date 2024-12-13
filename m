Return-Path: <linux-arm-msm+bounces-42160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DF69F18EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8939916B6B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47901F8684;
	Fri, 13 Dec 2024 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HvC6M9QV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9D1F8675
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128158; cv=none; b=QCngN/TlX1cINo9agGJyBKBSH9PyIfo3tFd90cJZVtBR17PMI0EIYJdaeubMopvivL4qZo8kMRqWFlxkManstJizHwre39NPJWv4Wr5lZ/VDewnaFZR/9BfszXg3+r6iVgx9erA5VhD2mDn/RydO6dD84eSLSXCZ0z/u2te1xGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128158; c=relaxed/simple;
	bh=+r0yMgvAcmqVJeFWGnTvKvZgv2ytrwoTWcaZvOcK1dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFw4c0khbND5YUHmqRU5AZO04fRd4fVZAjMI+rguCPUr828BRwXu/Wpep1Vl72gb6Tayd4dl+yZ+FY86IZvm08pRca8oN82w/1R+0yZ7AwRR06ORBIdQ7wn4pTXFfcx8PDfByOPYF4Rigw7FfalzlDkY5lT74cmBqumQphb7k0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HvC6M9QV; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30037784fceso20866891fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128154; x=1734732954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oa2F6Om6f+iayhvrpdTHMXhkfRss8voyhoEtcZ2tCA=;
        b=HvC6M9QVFBV9D9pSmdz0aV2x7T7V6np+7XDymNPEIf3JFrs0RH48XK2HpN/WZaPQW6
         jm64ymrvWhrb7vTrqpqahaEltiKyl7AKJKGvyr+JqHgQyS8tFPdnWH87/SxWYfZWoyNJ
         IrgMfoCaH3APrqyptn5SegKwVnC9L9fYOps3sidgtFspQhDVyOjLK6OFBvp6YU9dB6Ut
         Qf8jn0Pg83ZAeIqPQT0BFupp7N1/6h+lzXEDKTyNYDLXjKJEn+gd3jfhLGpZbMQww35i
         EYcmsog9dqka7XRcR8/NBbz9n7rAvvLUEhl3HfY394i8HQ1Ebw1J7vZMFIFhqzke48cZ
         WAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128154; x=1734732954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oa2F6Om6f+iayhvrpdTHMXhkfRss8voyhoEtcZ2tCA=;
        b=ZUVoKlusYCCIO4Be+01uqagfC7/CrTeP8GM9E1Jx27uSAn8FzEn/Vdhf26RQNEiBCj
         oWqjRyxvGT3XNsn6iBt/MVNBTTrxVFpi3D0QiQSCs2psAc/Fd6rRJcOVN2CECHi/WQ+O
         GsOihyxiu4gv81iyIrhCllFRExYhJZqy8+NoXhqxMUOKFC5dC1riePC9BiTrbPKoQSuf
         f4kfZxiLbaorRJ9359x6Nv6mZCpT7kO5dWCOTH9u4p9fxpxYuf+lNzUkRMy4E64If9iY
         sGP9a9vTsZeVQFE+5leby8q1zKbFUjzafXmd5pOMwixk7ub908XU5k7LqnPSzs8FfybQ
         PZqg==
X-Gm-Message-State: AOJu0YwX8dFbFUkwhfvuDJMtU5mALvotgiNPMJx5QshSt1hin+QIyflk
	3EN+Fn1kV6blqpkAZBoCDKyOBucxiPfpFUHbXltzg9PIhx7FBte9CBaRPVIZKCA=
X-Gm-Gg: ASbGncu6pQ2K8Xj+6WaXykyn2VzFXwVha3ZVqShPx9t7mmrNoSb0uXHTstB2Yy8zBHX
	kD3hSZ+k0gnK8/YULIQYqpVwAHiFuoHp42p36nWb0fXZBcBmYnt9rYfuwjcPC1OJit9wJjhEXRx
	R3NrROe+6ORG2+FwbkoJyeKvW9qp2j/hnG7sDgANTbmpPWVrPjU11TdCor1PszEHWLhBrtnWV3B
	iTslcN0B8lT33T3hxJVVsfBLjX0qoCd4tqgdpTPDHfPYcvcIAMQO5wZTfYCUkQ8
X-Google-Smtp-Source: AGHT+IGrZvLOLjgjirwfSjLZCQR/VtLFb9aRo6pqc3/KeOlVBAwXV8XwmBKX+SleLsI6o1tkOe1oxg==
X-Received: by 2002:a2e:a989:0:b0:300:2d54:c2ae with SMTP id 38308e7fff4ca-302546115demr17181961fa.27.1734128154034;
        Fri, 13 Dec 2024 14:15:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:50 +0200
Subject: [PATCH 34/35] drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-34-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19053;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+r0yMgvAcmqVJeFWGnTvKvZgv2ytrwoTWcaZvOcK1dU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHJx5pYS76+n/EofFEb+VuYR548p4WAqh09O
 qVqlazYxIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyQAKCRCLPIo+Aiko
 1ZK1B/wNUFX/fsGuov4UADHEBgkk2jgZ6WedA1Kx5s0ig06ebS4pLpK6HjVQ1OBIzBh2tBXaH6u
 QYxtpUgX9y6v3OVkZqMRj5bhSZYX5siifV2ryOXgfEyT3/zKVtK7X5QHr/Gqea2V49fAj1Ri29/
 ym0k6feXwZrq+/qCABhQGNtZXHH34QDXacBX/pYVTHbEIszTzfGOSXHwG6Q7AQyrAt5YuSlZyM4
 LNxB2LniuYMbxujxmfGpYiOU/n5V3Wa6AhvkyvfiWh7Fx+wlikmAoHGi+yFrIyg3xeESzT/sXuK
 3idANZQTmzT7P8aOxiD2zgAhIovf8Jyvf9hmVjQrKf5C0BVx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Continue cleanup of the feature flags and replace the last remaining CTL
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  9 +++------
 17 files changed, 44 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 5ab18f8e52b6662752e7307b39163afee1ef0ddf..14917ae5a6e08910f676d64cd01a5ff77b31cdda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -26,17 +26,17 @@ static const struct dpu_mdp_cfg sm8650_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 3d9d4c13200da0708fd2ea86761b824ae0ab19f2..8c92154598c302af671ba70b2dc52c3deffd699e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -41,7 +41,7 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -50,7 +50,7 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index e4981bba80615603a0b96eb095a2ff69358ae115..5e53d38650156b01eb950ed4ed816cafcaa5f97c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -36,7 +36,7 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -45,7 +45,7 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 2b2628fcfaa30ffa76e20e1affbb4a7ca4bede4e..0de87d2c3055693910b00de3d8a24f9a8c256ad2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -35,7 +35,7 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -44,7 +44,7 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ad13471da10a0a1390d766f14a472a28a2d74cb0..42d25a46e885bb9f9bb9dc133177e7e6630b2998 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -39,12 +39,12 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0xe4,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0xe4,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5d192e86d905d749fdfde3b58cc55d812fa08777..de5b9943734229301889aa82e81a3b4b52ff8e4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -36,17 +36,17 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 276130a1a09e5972581745c87e630778e738508b..ed00374afafdc304cfa0ff6402aebb9697cd58b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -40,12 +40,12 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index cc702fc4abf76024662b73fbdf0c3c714ce0a50e..a0f3c83d87b2295f21e9d9d720a7d56312d9873f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -37,12 +37,12 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 7079b43aada52f72a7e898e5af2946fc679878f1..5e2dd82afe4791631a8348ebc821e7dbf78599d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index d8fe836a9c8e2f1b039e58bc2a6e9135607bb49c..94e906c051aa61e2a6b165b4afc8eeab44305b93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 336b5fbe23fee2a734601168ba03a172115b932b..60ac6fe40e3703c0762c0ec28c1b301bb26a63d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -34,17 +34,17 @@ static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 50de4597b28928cd0619244d2879743949e38ff7..4101447f043f1645c53d557c47197c5331382469 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index abc3c41f036c3bb0c29866c59bf9998e05affaa6..f3d7e4991697f2af160267174299866e349c0566 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -34,17 +34,17 @@ static const struct dpu_mdp_cfg sa8775p_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sa8775p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 56f7f271638e7b0cea35f6eaa0a9fa927b4a7113..0eff1e958571e459fdd036810fd81ba683931775 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -26,17 +26,17 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 0a9d42bbc7fd29f924eee4c055ee81174c75f40f..eebb4a7b68c6f286a9dd444849d97b4538085e8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -25,17 +25,17 @@ static const struct dpu_mdp_cfg x1e80100_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index dfa27098929e8f9529f2b44b11d6005593801cd9..93d15af04657dcd961fd9bdce68bedab3fb02335 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -73,16 +73,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * CTL sub-blocks
- * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_MAX
- */
-enum {
-	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_MAX
-};
-
 /**
   * WB sub-blocks and features
   * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
@@ -371,10 +361,12 @@ struct dpu_mdp_cfg {
  * @base:              register base offset to mdss
  * @features           bit mask identifying sub-blocks/features
  * @intr_start:        interrupt index for CTL_START
+ * @has_split_display:	CTL supports video mode split display
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
 	unsigned int intr_start;
+	unsigned long has_split_display : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a7c5cea7489df353491a8885e32d2673133d41c3..aab2e066a2100799d632f3cf6489d00ec0ca5d2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -383,8 +383,6 @@ static int _dpu_rm_reserve_ctls(
 
 	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
 		const struct dpu_hw_ctl *ctl;
-		unsigned long features;
-		bool has_split_display;
 
 		if (!rm->ctl_blks[j])
 			continue;
@@ -392,12 +390,11 @@ static int _dpu_rm_reserve_ctls(
 			continue;
 
 		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
-		features = ctl->caps->features;
-		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
+		DPU_DEBUG("ctl %d split_display %d\n", j + CTL_0,
+			  ctl->caps->has_split_display);
 
-		if (needs_split_display != has_split_display)
+		if (needs_split_display != ctl->caps->has_split_display)
 			continue;
 
 		ctl_idx[i] = j;

-- 
2.39.5


