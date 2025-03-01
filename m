Return-Path: <linux-arm-msm+bounces-49907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B49A4AA01
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 10:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D901A3BADF1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 09:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787B71DA0E1;
	Sat,  1 Mar 2025 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RaqkO3Cn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCFF1D88D7
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740821113; cv=none; b=fsDm/rOB0vbAJ22H17NPuw/4tDj4jMjJBCTCv0vehSxvfV0Xwv0WqKjNFga53KX4Bfvuctva2T3gdBissXfJ1HRiC7WOSXuSOuKAtc1os9k0A1yOAMTRBSYdJEw1arNb/owE9xy9A2PkemGLNArNbj13AeGrFvy0v6oFpFt83Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740821113; c=relaxed/simple;
	bh=FGk4O1VHJ/AALXi9JU8E7/AS9MUo+YPgs+S6pZa0Mrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9mMsOYLbVkNKbKqDKcQxFPvwESrPO4YEDtNJ98bhPPHXHmd6ZMB3splQ+5rS55WYDJbsD+bG94g9KoH4AKv7dgF1aY5CES11evlN964xZtv0UPVpx5QwjCr+ahSE9kmKnQJMNTPYjAIarpycZNqkY4wC1Tz7kgrkek+Rla8pKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RaqkO3Cn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54955222959so1378566e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 01:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740821109; x=1741425909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0S3CqHmaZKk/knnnYKsC2gVCXeH/ZZG8lvfqN607uo8=;
        b=RaqkO3CnpKN4K4zuizDWlpYM0J/WGH1kktjt6tmVgYzXTiTPgdHz4nKKl6C5ybU2P2
         /3EnILEiNn1wK05TYQJNW6xoqihEc4Uqh6dLhSc8/JFp4ATTA5/zgJ/pa2gD+bvzVTml
         4ccedfugTt0XngbPeRkHBX2Brxmi6mQX6GbqQ/6x055yLLYJg6uh6ZRPYBaelYlCuQ9M
         NsfrfBmUUxDKvuS3NKPxHO/ggZey7VTf+NZBNo3xmUffEaBRD1RvtqqWtH1kyHAa2Cg5
         JgHDZzl2gzgjrZYC6CxY8777NHQ0zv6wLHNkv77FjlIyBluxpKXmMlKip9t9QpH7ST9F
         glnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740821109; x=1741425909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0S3CqHmaZKk/knnnYKsC2gVCXeH/ZZG8lvfqN607uo8=;
        b=cNJ813vFEWpTAg7ocZi/1pObxqHKAbiaFWU/vHb4jWH4azNIHPNvVLtZTv7vaEvYei
         9Y9gKZPxexDD21+193Z8JghoaQdO8+1SKS1yj5EL0VJ0yL7eTGz9bVYCr9z6QZsEFoic
         6SiYhSCoIOiB3SdduYYVlmIKmpDOLhx/N3FoIP5wKf3kr/lYGCr1UUdOWTYZGH3++2ad
         SLsDJltui6aH/T/OOXeW3DzLz1zgbBr3QVL6FRRg6jpdv2ZRWymu/+q94inD/gy3GtEE
         T27t5T92VxkMLMN0ZcliIq4KU7RHyLLJBMUOSlyOAAmEISe6xThq1Lt8HLlWRasEFVrp
         tLNw==
X-Gm-Message-State: AOJu0YwJ4gP23J0IhVJN1y7FeocsQuBwaF6maGIr7oRl/yAdJYwyMxn1
	AzUbs1OaPWtc7YwYwftqwDtsfX1LXpIlT25iS4CZgVIXSbsKG6nzvK7a41vQqOY=
X-Gm-Gg: ASbGnctpv0ypDYtQd3a8ZHqFsnjw7Lj702lqQHRBVSjcrqs+PZTQf+wizi5+JsWDicJ
	fp8iU3PZZKDy0rlq0Zmvl+knr+23y8yG698mAiLr54VdD47o9MOACp2Jt4BVPA0egSJXbLXdiDx
	DAtd0MNZlai26df9ji/Jf+lX5naob264UGHc/w59GyIqKbwfkxbwx020WBKQQjHQ2AfOfGiR2U6
	6YsOimMMe8AR9oPgx0BHF+MxeepsBkl0q4wFsa/Z5J/ICfLr57dybkvnynLtp7wBN4D5OFufDx+
	5bnImvSHBDMuBkdc1Yv0m0SfC2QbZ4CtXX6vJBidrpJFU5eiB1WD
X-Google-Smtp-Source: AGHT+IH/J66JM3jXcQg4Hm2VzetV+is+xE4RZX/iaVVXbntv7XIHbZKu0lKbD6OmxDUwOs9xArkiDg==
X-Received: by 2002:a05:6512:b88:b0:549:5b54:2c68 with SMTP id 2adb3069b0e04-5495b54357bmr396446e87.22.1740821109321;
        Sat, 01 Mar 2025 01:25:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 01:25:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:57 +0200
Subject: [PATCH v2 4/5] drm/msm/dpu: drop TE2 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-4-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8773;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FGk4O1VHJ/AALXi9JU8E7/AS9MUo+YPgs+S6pZa0Mrg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJoUqN4knEcdJD0ev8uxf4olTQ0qPmspUIZZ
 dF+m4E+3HuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSaAAKCRCLPIo+Aiko
 1WZJB/0QBY82ZFrTQlyyCk4Fj81ctmok/eKg87Go3jbdS/MB3AXf0GlaRXlRL1cfEtEPsCDnV6R
 j5aRI23DxgzeZf6iBBgrUfsDWiWenGEC1O/MxgcR7uphZmn14/D/1D3MOZeZ+NnQtuk1W0/N0EX
 EkWd7X5Jc2Qimj9WSGRIeoPt8EZEDZy4V/ojdhJAJxytHbR5Sh4lYUhAjYnVxuReDT6l6nCySDr
 quWpPjOOb5raORp7puz5D3o2OdE+ChOhgFPv95xNijDrI7IfDsM109K5HNOhP107Sv7qH2LD1lI
 8rEhgiM3Xc6DzRL16MB3GnydaXEu/7NGgvzvIOWTYW+aWvLY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Neither DPU driver nor vendor SDE driver do not use TE2 definitions
(and, in case of SDE driver, never did). Semantics of the TE2 feature
bit and .te2 sblk are not completely clear. Drop these bits from the
catalog with the possibility of reintroducing them later if we need to
support ppsplit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
 7 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 491f6f5827d151011dd3f74bef2a4b8bf69591ab..400739295de5aa509ed3a7f6c82ef45dda21c47f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,15 +181,15 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
-		.sblk = &msm8996_pp_sblk_te,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
-		.sblk = &msm8996_pp_sblk_te,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 64c94e919a69804599916404dff59fa4a6ac6cff..a253e0fdc556b57aa3752b81b803e84550ba146e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -170,15 +170,15 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 424815e7fb7dd858448bd41b5368b729373035f8..4464d4568aba0577a6f957bbd5d8d1c73f68b403 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -141,15 +141,15 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index df01227fc36468f4945c03e767e1409ea4fc0896..3aed9aa4c533f167ece7b4a5eb84fe49c4929df5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -115,8 +115,8 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72bd4f7e9e504c771d999dcf6277fceb169cffca..c122782ec8bd7e5ad68729c8c12bc8ccd0cfe0c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -194,15 +194,15 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0b342c043875f3329a9f71c5e751b2244f9f5ef7..b67578738dffe1ac83530d93eb0e631f21384efc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -98,15 +98,9 @@
 #define PINGPONG_MSM8996_MASK \
 	(BIT(DPU_PINGPONG_DSC))
 
-#define PINGPONG_MSM8996_TE2_MASK \
-	(PINGPONG_MSM8996_MASK | BIT(DPU_PINGPONG_TE2))
-
 #define PINGPONG_SDM845_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
-#define PINGPONG_SDM845_TE2_MASK \
-	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
-
 #define PINGPONG_SM8150_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
@@ -465,22 +459,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
-static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
-	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
-		.version = 0x1},
-};
 
 static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
 	/* No dither block */
 };
 
-static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
-	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
-		.version = 0x1},
-	.dither = {.name = "dither", .base = 0x30e0,
-		.len = 0x20, .version = 0x10000},
-};
-
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
 	.dither = {.name = "dither", .base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..07b50e23ee954b96e7e6bd684dc12823f99d630b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -115,7 +115,6 @@ enum {
 
 /**
  * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
@@ -123,8 +122,7 @@ enum {
  * @DPU_PINGPONG_MAX
  */
 enum {
-	DPU_PINGPONG_TE2 = 0x1,
-	DPU_PINGPONG_SPLIT,
+	DPU_PINGPONG_SPLIT = 0x1,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
 	DPU_PINGPONG_DSC,
@@ -404,8 +402,6 @@ struct dpu_dspp_sub_blks {
 };
 
 struct dpu_pingpong_sub_blks {
-	struct dpu_pp_blk te;
-	struct dpu_pp_blk te2;
 	struct dpu_pp_blk dither;
 };
 

-- 
2.39.5


