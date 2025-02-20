Return-Path: <linux-arm-msm+bounces-48649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65388A3D69F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F1CF189B2FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C981F4194;
	Thu, 20 Feb 2025 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/MAMYcm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC11F3BA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047198; cv=none; b=sDAx6gvMH6/J5aSG+mtm21Q/wFIVT3oFbj6u02V6x/IBhYA59t8A+63mnBjn9cw4dByZPaRgvqqEgfBoBcqkOF8fOQxwmNkzAz3S/X4RHQnbOgUGCYxGh0sWIBLJtX8Iql4WGbGvTz1NKwW+CePp/fVvMgPwQ5iCz0GmjWLDfVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047198; c=relaxed/simple;
	bh=bTtPeLTR7bIGAjAGWZZbYSPB+kORXsbXpocudthnDVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJOWkXgqDJNvikdHWqQfxUz3RILAeEnidmqNvZT58fMSZnmRjakpuIm7n4h8IXP/JABSN5mZjd64DbCEHf2XrmHyIFtdOC1unY6nM+/zDYUMJz8DWoU1xOXiND4JMQKcKkw/GBko0mlqU3lLg19y356NvAGK4noyu0dpCbqVUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/MAMYcm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5452d9d0d47so663458e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740047193; x=1740651993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcgN3KcZQIKunyhp5MN5k0ww8zI0POS9d4nm1tGHVCo=;
        b=B/MAMYcmOMuUNs90y1LQc71PStCPU7RIt1KryJvVN+j24+d52Cbwp7OshD1Fcio95Y
         XQp+wXeCkwU8Tw+8HM3oWtjAakmZuglF/mr8qkKhAnyHTzcN7hGhVXRhcjbAwlpLzBGy
         nHZuiQv1rnIZO5prwl+BnQBzKFWdN/AWT4pGkKD6Ug07P+pK5FYxihEULuFb72FU98sw
         NT2WDi5xBzm4cjQqlhZgGVkI23j83ib0AE9VaQfa2s6gXJlW9c5OijyA8r29RAjIikml
         78GOhJrtF3nu/laGePuNkP2B/mDYXjCrbTTBV4ik9D+d5QQyWwV7u6ZtzcmDK3V6T9kx
         7FjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047193; x=1740651993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcgN3KcZQIKunyhp5MN5k0ww8zI0POS9d4nm1tGHVCo=;
        b=DRrrnmRxHiu/uo2B/9BDb73mdQVzUMRCn2nmf3S0rw5234VcV6QNrmJnFuHgvB3F/1
         W/CpMjFoJO3W7X7B26Kyb5Od2ikrVESD9LwivMKrxYrP/gS/oNIsJIz/tNa4cjCAZWCf
         4d+UoUf2PKTaNa0gBNX1v4NbeCrfVetFl5ZZ8LmkywBtp37A+OGSHdP/AaYApFR47xf1
         1eQuyeEvZlSNH2gpoh9chHeQTjsJ5a4Fb1m3CNA/ixcgK2S4ipmDs//FeHCgUJw/FuvN
         JaNUttLeWZU5JMU1iDkXxfjVsRPPwDzCdNlNfTSSwm1Nd6YUAe+eWh2lKL0TAjuiLUKc
         MqTw==
X-Gm-Message-State: AOJu0Yxp203sJD4vOTYESMO6uPFtIEvaEsXC3oUz1j59T1+ysV0UIkUY
	EJ+aJzzgSA3Sil/BtuBi3HwC9KL9RHG52NE4Ij4rgsfCqyGwvLX+SbPfc9Guh/E=
X-Gm-Gg: ASbGncscnBEwhIZgtKwhLMqblh/wQeCBHnwbaUx5py83sKsrpJaJh9ZTwcF614z3aZA
	/AQuZoZE+QUaKu1w22v7hR+fYDtYmUsG8q7BPXHr3+7KkGn27B6YzL5pu5vK9PtFByPDZkjHhkv
	k7eT0/ZS12yNXVsQC8JvKnm0KcYm1mmz2IViR3tygl0JtqmE6BqYGxYHGtiTOb7pMRo0jNXYZEJ
	/kuBGeQUx0LhIs4TVo6+QttNSqVTqeH7Bd/yQgGFE7p45+upCLZMfF9VW3px1a7z9niEVBRannD
	m0t1J36qawmlTeIkbQWxyXw=
X-Google-Smtp-Source: AGHT+IEM9+GwpoyKZl6DXyfHoUFNWFP013z/rJDJY6azNQJu3BsrfRzXnCOVs/HY3FvHdFiR+OFW2A==
X-Received: by 2002:a05:6512:2396:b0:545:1d25:460d with SMTP id 2adb3069b0e04-5462eee6586mr3144030e87.12.1740047193190;
        Thu, 20 Feb 2025 02:26:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:26:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:23 +0200
Subject: [PATCH 6/7] drm/msm/dpu: allocate single CTL for DPU >= 5.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-6-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bTtPeLTR7bIGAjAGWZZbYSPB+kORXsbXpocudthnDVU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNLcO4pIN+ypbPAk3kZc9xkCx3N/uJ1cgUA4
 9Jx+DG4DTuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSwAKCRCLPIo+Aiko
 1b4sCACwhvMnemZlynSEuUk5qg5JVNllVcUdExghA2X1IiBLMjPPRqFLSOs40D2uxyzV5xc8ZkN
 DV+h0qhdC20PUTM7ZUtl/Ngb6gvmA10XOTFlli0ITCbOuItVfJrj8QopMwsQasQ4R32Xg6jXOnA
 jy+HXtzpD4feH+5hz+PiR8v+ZOe/epUccGfXOIx0rEJ+tD0RT1htDMg34FAlmwkPKoG+pBz4E3N
 KpX15ArRQDd5zAZrsb+sKYoVcbdWkU8wbvOzcc5dudT95O+yhmYEThoIIShE6NwdvgibQL0U/8k
 MBuoevG8EUDJ1+wSsL3VJkxGBSalC90b4I6Bo9QB5AupStG/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Unlike previous generation, since DPU 5.0 it is possible to use just one
CTL to handle all INTF and WB blocks for a single output. And one has to
use single CTL to support bonded DSI config. Allocate single CTL for
these DPU versions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 5baf9df702b84b74ba00e703ad3cc12afb0e94a4..4dbc9bc7eb4f151f83055220665ee5fd238ae7ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
 	/* Clear, setup lists */
 	memset(rm, 0, sizeof(*rm));
 
+	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
+
 	/* Interrogate HW catalog and create tracking items for hw blocks */
 	for (i = 0; i < cat->mixer_count; i++) {
 		struct dpu_hw_mixer *hw;
@@ -381,10 +383,16 @@ static int _dpu_rm_reserve_ctls(
 	int i = 0, j, num_ctls;
 	bool needs_split_display;
 
-	/* each hw_intf needs its own hw_ctrl to program its control path */
-	num_ctls = top->num_intf;
+	if (rm->has_legacy_ctls) {
+		/* each hw_intf needs its own hw_ctrl to program its control path */
+		num_ctls = top->num_intf;
 
-	needs_split_display = _dpu_rm_needs_split_display(top);
+		needs_split_display = _dpu_rm_needs_split_display(top);
+	} else {
+		/* use single CTL */
+		num_ctls = 1;
+		needs_split_display = false;
+	}
 
 	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
 		const struct dpu_hw_ctl *ctl;
@@ -402,7 +410,8 @@ static int _dpu_rm_reserve_ctls(
 
 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
-		if (needs_split_display != has_split_display)
+		if (rm->has_legacy_ctls &&
+		    needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 99bd594ee0d1995eca5a1f661b15e24fdf6acf39..130f753c36338544e84a305b266c3b47fa028d84 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -24,6 +24,7 @@ struct dpu_global_state;
  * @dspp_blks: array of dspp hardware resources
  * @hw_sspp: array of sspp hardware resources
  * @cdm_blk: cdm hardware resource
+ * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -37,6 +38,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
 	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
 	struct dpu_hw_blk *cdm_blk;
+	bool has_legacy_ctls;
 };
 
 struct dpu_rm_sspp_requirements {

-- 
2.39.5


