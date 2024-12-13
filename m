Return-Path: <linux-arm-msm+bounces-42135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 275459F18B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AA3B188ED17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642741F12E0;
	Fri, 13 Dec 2024 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDr788PA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D91F03DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128101; cv=none; b=UOv9nt0v08WGSQPy9ck0klkd7vdSVIKxA1MWbkWewhyV6FpwFt3Gqt7IrNpW6V7KOpgHkgexPlQDeof6YKLUXFKkhlj4rlMUFzoMKyaVOSRQixHadXUnPKdAk819iA6vIgiuThwRYieNED9R0oc4HW4budk6n/yzfHKplkBxt4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128101; c=relaxed/simple;
	bh=A6WnPvhBl3Z+fabzYcf2dOHxRtcZMwFyhbs2mOdQ8iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4vZfbHg9x9j9VvpQB6BbAeLQVy+/6QioHkyHX6mAz5FdPdkT7XgjPo/ADE6Mb2lSsKRpxtBSLw5+vBo2BbJlUoZtyMV0NzYz6LGLFuLiDCmWVmGABXVFIXmrtTLgqk5KSxebYOHsd+P7Rx9eHVLkG5K/oE1cRDiEFT8GfMI9wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDr788PA; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so18339031fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128097; x=1734732897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTH/7yV/sVk7fpji/MYDMy9koMQxLfTLhX/KiA0Zkcg=;
        b=oDr788PAF/fPefEt2v9kcki0fLFhzNUFK+bxZYH5kEO1+R00jh7wesG5ADFFy/XYiz
         BEzg2qIlrsCHWGf74+I7fcBClvPQx+/xiKwUFdZL/OXB1sXCun0itHekIONicdeFgwVr
         3kowgOkPKXiwRcE3YmgjOK9vCs+5hsi0eYXIuoPuvot7IOHyfIRiUUWpDOInjZJ9yTwq
         g38FTDt2HAbg7dpWGyeFlmRPjpWKLm2NV/YO6ZcLVfE5ViMBzvKLmIVoCJsODDVsdaze
         /2XzeOQy4jOEZedjbaF58uBI5Ua3syRKTZlLqU9bMdDmZ+8h4FyC8YNH78kW1F5KWmJ/
         lGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128097; x=1734732897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTH/7yV/sVk7fpji/MYDMy9koMQxLfTLhX/KiA0Zkcg=;
        b=v/TESl5/hE/vXHaxzna8UBoNxZOczZN7jYTafe+j64VMhmCynCIaMn9KaKVrdJdTW9
         Atf2huNYNLyvA0IIRgQOY3eXJyzhNauVu4mrFEPIoKTAOcRwL4+Jyb4u1v7WouJrJk/p
         l61up8iw/f2S1rTKlDglak8MoTu8dklLBVSMFgdZPi/TqVkFq12F9tslWbg1KiWMNASg
         G+e6gfLVEPzsMC9gOE6B0P4RC9bitwzDopMC4sY+L5Yu8YiI77Bsdct/Ncux599F6D9X
         9gZzYX7fpquxgo3jJvfJ8huuUfIHNZ6jactP8+/+VwiBFazu69BhL/FyyhXHoreEoovQ
         kx3w==
X-Gm-Message-State: AOJu0YyclGZYsNql/TApyY4NtKv9t5BeGMR5nzavZmJQdWISmgKFST15
	ymMduYCf9puA/cK9br/U9vJlcAu4T+XSAH1w/cBnhpFK75XUVSmiQ3/y+1qQu2I=
X-Gm-Gg: ASbGncvIonnjzPwuoKGJ67dGYQ+sQbAywPId1QVgKIMPoHJYlK/MIA7zwVmDjvyhsck
	GbDkD47zTTq7MTi2fTaXW/9UD3V50oZm/fYNW9Pk0G02th6+4Kp3nrTRXQOgpjOsxgTppK6Fdpr
	NaY1abBd78fWb05ka25AJl12QOACJaIqUIXlYAFPqtvW4jYhTab/wRbSBhW/tvyzNLa8+0Rt4j7
	plEXUevd6CcWlsJYvFu8RuifNsG60gY+cTIHqHar5yDuYgHtzYKghh4v7csS8+v
X-Google-Smtp-Source: AGHT+IEq1mdSS+ns5fxOv6NsloIgj+yJGaVPMoq1whCSO8bmffbu6sg/mqDXPvO8DAsoeaR7NQYQcQ==
X-Received: by 2002:a05:651c:b27:b0:302:3e14:34c5 with SMTP id 38308e7fff4ca-30254611194mr16377091fa.28.1734128096927;
        Fri, 13 Dec 2024 14:14:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:25 +0200
Subject: [PATCH 09/35] drm/msm/dpu: remove DSPP_SC7180_MASK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-9-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=23645;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=A6WnPvhBl3Z+fabzYcf2dOHxRtcZMwFyhbs2mOdQ8iA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHF7VL7PXXOA77LtJf+Xird3OikeE8ZTAp7o
 8N+R50LCZqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxQAKCRCLPIo+Aiko
 1bf9B/96E38PgGM60e3zUU8Qvgu8j2y/1h4RPr/DnWyBKiAPES3i6zL+Lt4O+c3t/ndVk6HJJVv
 Ndvc8fc6ErfIKx1VpWDTWwsZf6s7o2eCEse4xR3VAf98x++zpN61jPvFDoHFDdRUkQrA9MNwKy9
 5m4PEe+Qjcjpi0ohfnVrth2Pvv+sohb8dcRbaDxVFmvka2Nk4xO/druf11HIE62hpR3AwP/AvpT
 8W8NeEm2Z7vrkxTHDUiGWcuUeMW0uikH5dTxXiUS6l57ZDvyb7uzRkT1xH5tvOIT8MbMbq4wnyA
 7ZP444mtLwV/Vhqgcwua75Q8PXe8TNfFhIC+ZvXBZyd8aomx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Stop declaring DPU_DSPP_PCC as a part of the DSPP features, use the
presence of the PCC sblk to check whether PCC is present in the hardware
or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c              | 2 +-
 28 files changed, 1 insertion(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index f10a737601e0456d7dfbdf97601c9dc1e7952a63..bfca56ba20ea434cb22846746cd1dcf66890679c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -188,22 +188,18 @@ static const struct dpu_dspp_cfg sm8650_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index ab3dfb0b374ead36c7f07b0a77c703fb2c09ff8a..c6bf3bca200d268912ae92cb8399a7e82b0d5ae8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -118,7 +118,6 @@ static const struct dpu_dspp_cfg msm8937_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 6bdaecca676144f9162ab1839d99f3e2e3386dc7..bebdba68667aaf79399da8ba810ca10d70ac430f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -104,7 +104,6 @@ static const struct dpu_dspp_cfg msm8917_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..598113bd59f1bf33dcf0c25ecdd81057ddf1029e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -118,7 +118,6 @@ static const struct dpu_dspp_cfg msm8953_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 491f6f5827d151011dd3f74bef2a4b8bf69591ab..6dfbd843c3b1cb0d972baab9eb463ecbb334f075 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -223,12 +223,10 @@ static const struct dpu_dspp_cfg msm8996_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 64c94e919a69804599916404dff59fa4a6ac6cff..94983781fbf957811dd5f4f7ee2f08ad4a06572a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -212,12 +212,10 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 424815e7fb7dd858448bd41b5368b729373035f8..d9e9ba364832e253ca9d0d01e3e19e0f6ee11fa0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -183,12 +183,10 @@ static const struct dpu_dspp_cfg sdm660_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index df01227fc36468f4945c03e767e1409ea4fc0896..e7e7c7b95c34b2b5f91e33020a2e182eca9ba607 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -133,7 +133,6 @@ static const struct dpu_dspp_cfg sdm630_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72bd4f7e9e504c771d999dcf6277fceb169cffca..f67990f87cbd4245ad019799614067d59befb920 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -170,22 +170,18 @@ static const struct dpu_dspp_cfg sdm845_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6d413cefbcc1edaa5fe73bacff4ca708f0e04902..1c439a27ddd6be7ee0d0cc0d4c9229b8616c21cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 2e833e638a0bf9ffa6ad1ae16466e1963f26af1f..85ae553c087137c10eefda0f07dc3a889c2757fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sc8180x_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 2fe674d1e05988f39f66a01fedee96113437ea65..73b242a28d5019b2cf76c7f7c77f4155742e1fe7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -150,12 +150,10 @@ static const struct dpu_dspp_cfg sm7150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 76f60a2df7a890c5346fe248d67d646ade574fe4..4840b384f256978ee83e8ba7828ace5be9263a46 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sm6125_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a57d50b1f0280776bb95f55b8fce9aa8259d7041..dcc16f84da552d346f4c7e96121d0c7b1ba5f197 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -190,22 +190,18 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 7382ebb6e5b2a0c1190e914fb593da93879c0d9a..c17ce0a76b2dfcf36d1fc8d235152cfd03a73385 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -106,7 +106,6 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 43f64a005f5a89e09ee9506a12cfff781530cb80..f8164950a0f7721643eabf5cb2bb7a5e3bcdfbfa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 0502cee2f116e8ce24a0daf995f46b1d693aacaa..3145d0373a425a939b5b12c8f5cef804b2409f58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -115,7 +115,6 @@ static const struct dpu_dspp_cfg sm6350_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 3cbb2fe8aba24c7b9db6bb61ff4c48f34db48bf4..6d424a4fd60bd94ddc0374466d86770138b2831f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a06c8634d2d7779f7e867fb821f8d332652ba7e9..aaf4b270f20dcc5fb91fbcb783c6d3bc673894f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -71,7 +71,6 @@ static const struct dpu_dspp_cfg sm6375_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 6790bd82432f4f254d2f243f518f61dab2c1387e..4239252a2a7dd618c7c33727396027091d7c0a62 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -190,22 +190,18 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index b8c4fed13f36c26f00c5938ccd1427db588cd6bd..ea62378a2bd0e4299f3c109f8f8b1b7c5c9d5d64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index de8310ef7339c684330ab80cd6ef81594467c45d..17ecb634fefbf8378bc3c1e2bc6fb515fe4156f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index fb87420881622839b57e352bd40ea4667c7ff0f3..7326141dd9e2c85248ca88530fb631482ab9ec4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 25a81c12f662f1d25327e6f80b1e57d8a64734c6..24a2f090613fbb048a8120c112290afe7ddf50dc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sa8775p_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 393d8002870ca001380077b2b6e4f5be25d6e776..6de37c9c89995e0eecd663e6903211a453afeb56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -188,22 +188,18 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 0dbac01ab2018f17c1420b67e628cbd15255b3ac..ab11592c204e5e6ddb8cb39df5a9248ccc60d11e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -187,22 +187,18 @@ static const struct dpu_dspp_cfg x1e80100_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e4a562546b95642bf64f440e383db584f6f38313..df0af12b63703603bc6289d5bccac2940f8baa3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -119,8 +119,6 @@
 #define CTL_SM8550_MASK \
 	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 0f5a74398e66642fba48c112db41ffc75ae2a79f..11fb1bc54fa92a5d9926addb437bc4b8f283723b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -90,7 +90,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+	if (c->cap->sblk->pcc.base)
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;

-- 
2.39.5


