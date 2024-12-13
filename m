Return-Path: <linux-arm-msm+bounces-42156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 413009F18E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5575A16B6BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FA31F75BE;
	Fri, 13 Dec 2024 22:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="csKMRUs4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E61F75A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128149; cv=none; b=FEtZYS5db/Dx2Z8TX94xui+hp/STyYOFK9WWvYG8ZMDIlE9Slp8H5ETRbDPmuSyDcHpgb1i5vhJPsD8IIFtdG24GOg92zblcJ36l7yC9S23GYYyanKnNQckmU7iLN3Gxt7+vPgvkLIkkOET+ANmpKKlJ9d7yxXd0/nUHLs1n4fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128149; c=relaxed/simple;
	bh=qthUBE7GoCVMQRQrvEIyEs3ZJm9i1ATpjMVpiF6u644=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyfPqE2WTmsrzB95yVS4hyXj3yPA1YilWXBPKPR7bwRmQgPKJ9oKl768uIqtrGIHjgB4lAb/uR0lVnVTkhsw2aagvJiIGhfCbpwI2eXY80AlYjrImhzM655KbcdY23ABm41Gqs2wdt8Gr/IygzIeCzBt7hTzdgIvrgnKZF/+KWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=csKMRUs4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so23521051fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128145; x=1734732945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsjNnmljiQF+GcCGHlt35/tGu7gr38B/2X6Hh1KrGkk=;
        b=csKMRUs4nc1tdKw9Nkk78mR116FNYL8E0kJys9N8oXDi0vxBpG37CqNKU8QMGnOqJl
         12vz8Cf9BSJo5LiKYtFtPVWVIdzxDeBiGztq+9FerCo3JF18k2woBuPGSZdKrSWmZWR5
         95A6MWXBhpAI4eSWruc5kwpYmH2ToHOA0/06NCpJ7S0hG2or07Ezt+lsaCD9pr8fOvYP
         BOENqlyOoRxlAwopwdt4m255u6yvtS9kzr6I3Ax+0gUuqmlqj0bQaTOvzHkBSM40hg30
         Zvqil4LZKI2M2J7JkzzfJ4p8H4sleDEDmiOP+mVwk/ZWnvOxiyEgu+LQfWGOsYP6kj7l
         9fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128145; x=1734732945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsjNnmljiQF+GcCGHlt35/tGu7gr38B/2X6Hh1KrGkk=;
        b=k4gtj0Cb7KKsVi42rhGuCSzKy5sVsy03w/HuTX7yziwbOBH6Dz6oZ/Kf//zaEV6rtL
         TTP91hfi7tHvlld/dUWfHgEMBe9Bp0SqXgTlXBqXOthcslMd0e2hNWV5R8TRqN6cF/UW
         m/7bdY+3SHMEH9zqyzhTBCYTr8K5mviQq4a+6xDi08n7CE4i4jz11QOEovpE07Xhgx5g
         kGYUZZVANqPLwUN+PdClN1d2ZwZKksueq34cF3QuFn/U9nM12fASTowXaLTIu2EeZgAK
         UhPYqzCdWnEkr89llkgQrNjBlw2byEtqlzpyCQovrEPf7DNZOEmBgp3kAI58BYdiqbPf
         QuFw==
X-Gm-Message-State: AOJu0Yx1wkro0e3WMo+DDtQZpEdbaaEI/rO7BYkxAFyt/r8n0yzG0qiH
	Wf1RhqhR2wjVREiyHooYmN8zeXnnoir3VQebIEdinzukBTvhfo7bM0+oUFRKXJc=
X-Gm-Gg: ASbGnculRdZTH+K2jF6eRKe2+LbMQjZXnxqHerZOdukQ3K833rS3ZtLdhMaerpHVI7+
	if7Lq6HVABmJ8U2wknCxK8peJve04X3Oeu63Fq6vKE0OZghSq7a7BYU1V3cJQkX1inr6DLWJ1E3
	Iibo8sOV9oPKSg708+Y9AmCZP7WQeCfOh0PprhhAo7GuvkbTyzIqq/htxvtPhfvSZXDSW1h8+EP
	y8n+2IWVaCPbkZysb7zL7L8t7SiiT3cmb+Oj7sCShZH4QFVE1yGh1QpN2G+80u/
X-Google-Smtp-Source: AGHT+IFMZfjmEJV5W0WCXtvr7uDBeIph4wB4DN2OZhi0OWGLYJLEPuk1nQeHx9m9aZsGGq6wMJ12ug==
X-Received: by 2002:a2e:a546:0:b0:302:336a:8ada with SMTP id 38308e7fff4ca-3025459b71fmr12952251fa.27.1734128145067;
        Fri, 13 Dec 2024 14:15:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:46 +0200
Subject: [PATCH 30/35] drm/msm/dpu: drop ununused PINGPONG features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-30-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qthUBE7GoCVMQRQrvEIyEs3ZJm9i1ATpjMVpiF6u644=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHI0Od2Dd/AFSAIFJgmX3MpHf0GiK8Ipdd+1
 WD5XGItjWiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyAAKCRCLPIo+Aiko
 1XSsB/9H/1lvDw8XN2RtXXyn0dWDJ8RtBRCnnhaKyPx+2ybX3shrqNEs4F79olIbIFKSOUTcwuC
 5j2FwKJShpkyXh65wpZ/cg+rfRajyUmlsazlHUwmciQjcZTQM+cY5R2oeuXVZcr1d5pBmkHmZIM
 PcrvHxuHzTymXQ70ex2YGDf+mKwaIcuIkP/+j3vNdVVKGbMOVJIcwEdUoFFgJtiMRtnYsuMpDRz
 pafSmYIBNyQMHVJmO144MaX3mt5CGtwjSJaM0uMbC08Ifk928fW8HEHwiQpbKgRqyknG8I9QQP2
 ABaQNCTBURaRx4RGUed6v/4LZjPdl5P/j/ONveG37oY7EoNv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The DPU_PINGPONG_TE2 is unused by the current code (and can further be
replaced by the checking for the te2 sblk presense). Other feature bits
are completely unused. Drop them from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 14 --------------
 6 files changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 45428cf6305dbaf23929079c62dc86de5f5765d1..93d1d64fca3c8a68493109c954896b0fdf2b4ff3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -180,14 +180,12 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 1d067fe8d9b142465115e1a63980492c493686cd..915c4facecb2220fe73a1b44cc60ab30b56780c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -169,14 +169,12 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 39e0e5790a9a4867f12866d7fef75f9cd7adbb62..78482b42c5f790a84587a330ed7eb160c3a2d06d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -140,14 +140,12 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 550cc06775be8e8863c29cc2a7f4ec2680339faa..20efb6313a4b98ec835865535dfb67de422168bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -114,7 +114,6 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 946308eb7a88c1604b152ff98cb27b1766a76718..8b050366e9209fb6761e9da65f0fc2e764abd996 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -189,14 +189,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 2d7e4bdd84705707198c3b265a003630cbccd28a..178c5440a9f4439b3e53719aaafa9458e353e58e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,20 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_TE2 = 0x1,
-	DPU_PINGPONG_SPLIT,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5


