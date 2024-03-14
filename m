Return-Path: <linux-arm-msm+bounces-14071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC8C87B60E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 02:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9056B210E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D80EDE;
	Thu, 14 Mar 2024 01:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4nCVVLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F1A4683
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 01:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710378652; cv=none; b=LWJ0gcsjqaDyQ11cXIW/r13YqBLNCXszBodRpPS7HL8XkUlClueEff6bKnE4a19/NEDs3tqNrQSw7sYmEMalrNH6FROi+hAT7jMLwA8hiiWM0aX/k/E1V5WoWjaKzE8643MDqne9PCGFOHPjN26295bVFJ/UGVU3jQ4BdMQD8qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710378652; c=relaxed/simple;
	bh=YsE1Cp7o2/VYepcndYMfJwYo6XOZZyfG72U7gsT/rjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q00rfHiJfgDNkaOq6fmf0f4YkqJps0iGPx6akEymFl/No0jkg2u5sCZycgVIwRPnGc9xZf3miB/lKKYzIvNMwXs37zVgbvmfDL8pxg9UMZjNPR0ij4b5EdD4qhJCxMvbVKUd1MbXn9RHSSNW574WVvGCg+4JyZXZ+HmpfOq/afY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4nCVVLK; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d476d7972aso3470821fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710378649; x=1710983449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIoXYbu3MygYy7U6DbcLTmPcPWwgndAXgG/VdYHaBOk=;
        b=Q4nCVVLKM8ivoWVYz79eNSz0Sn8W7P7I2aoYEY0nf1PUpM29ZtqH4Vk/nRLbf29fcl
         +Gc1agL0NiIjwKNGOg0z/aiOXjbYcLSlebvVpFEEAjQcZTngLm9c2BsPcluR6nNwLL6e
         ZvQQABX6WB5sS33ebWLPvfy3cZHaoxnbu0zvlFxGem7NZmfA3Eg7AqZF0TBpEwlCzku1
         kzDh9Z3N5iGm7KEXPbGi+6szM0TPuw2+Ba9qS1OEE8HpCVvvJ3OjM5ttKLVkW+u5nWRj
         qFMJQ+OGe62EwFUfx7DM0FNXl6FiWteBFSFaDMHjzr/XiIej4krEI+CfsztVPG9EVkAE
         TSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710378649; x=1710983449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIoXYbu3MygYy7U6DbcLTmPcPWwgndAXgG/VdYHaBOk=;
        b=IwYODQtGKAhrEMv/MQ0CDzRJ5Zy+Byx5I1SVhVdozjXPLZS0Wsz6hL0u+aJVNVnoIV
         t+Gt97uXP7K2zTwt/X+eodeHPIainxSAd3b7GODblBfjERQFXQTWZv8kc84BlBkN7USJ
         zD4abtenWnTjLP+wxvImJLO0Jx7Nm5ilsVMFB8+w98aYftgXqGdDWDnbaDsV3TQv9krt
         O37rCgK/2+w+m/TUZUU/XEc8dWtHugsws1FCGpUoSkw6iDWOWmRxc/zmpaN1KWRhmBVI
         xBTu+TUZrADO4JE6DYLAKbds+zg/GMq48owB6Ia7HzWh+hf5EOgSdeBuN4RjEqKX6S74
         u6pA==
X-Gm-Message-State: AOJu0YwYb8Y/PmGvoM1RfWpOSPstQVzHsFV9j3RI8W72sY2QPvDoxpmb
	WTp26EPE+XlwbHsPMtZc4U90Ps1wPAJ/owiTWLhgoCk/1K2r9b3w0EyFt9IqLQ4=
X-Google-Smtp-Source: AGHT+IGq9lqZjLRsr1HGz2LENujhC5IVIdwuN01iFheK8+jN3o594B/n/y/dYcd1AfeMDzDEuMw/Jg==
X-Received: by 2002:a05:651c:204a:b0:2d2:7702:cb74 with SMTP id t10-20020a05651c204a00b002d27702cb74mr120452ljo.20.1710378648902;
        Wed, 13 Mar 2024 18:10:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 18:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:44 +0200
Subject: [PATCH v3 4/5] drm/msm/dpu: rework core_perf debugfs overrides
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-4-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YsE1Cp7o2/VYepcndYMfJwYo6XOZZyfG72U7gsT/rjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6TPJ73CcFgvbMkQBgykdG8ysiSDjorTTk2D
 2TA8Oavs2OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkwAKCRCLPIo+Aiko
 1XZeB/9hmGxD8GltmoQnMnjJdW7u/veufebGarszbXeg4m+VVW5rkTGFgb0bFTynIf1c/OwaEZe
 XnGALFa1nD5B686QnkBTzXkzo7ZNKrUPU7zqlm2q7BvC/yQiyhb01MgdkdUGvag4u3zge6GxB5D
 8Z0gw+Tu//B9vFeS8ipaF803pW+HrVP9TKo7x8xJvljb880oV/VJQ1ZNYShNjzZoULCT8QuwnhN
 M67C5WVu5khZQABLoytiH3jTHQKUghQe+Q0OBmNcaHM0oAWiSwloVvPoaSKvfUNov5jMSSOZ7X/
 kRJfWx/pA+dizwt8eCAuHDifCINGFMaYZqdx2vfT7yW83gE0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Currently debugfs provides separate 'modes' to override calculated
MDP_CLK rate and interconnect bandwidth votes. Change that to allow
overriding individual values (e.g. one can override just clock or just
average bandwidth vote).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
 2 files changed, 9 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index ff2942a6a678..2e78e57665fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -17,20 +17,6 @@
 #include "dpu_crtc.h"
 #include "dpu_core_perf.h"
 
-/**
- * enum dpu_perf_mode - performance tuning mode
- * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
- * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
- * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
- * @DPU_PERF_MODE_MAX: maximum value, used for error checking
- */
-enum dpu_perf_mode {
-	DPU_PERF_MODE_NORMAL,
-	DPU_PERF_MODE_MINIMUM,
-	DPU_PERF_MODE_FIXED,
-	DPU_PERF_MODE_MAX
-};
-
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
  * @perf_cfg: performance configuration
@@ -227,18 +213,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	if (!kms->num_paths)
 		return 0;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		avg_bw = 0;
-		peak_bw = 0;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+	peak_bw = perf.max_per_pipe_ib;
+
+	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
-		peak_bw = kms->perf.fix_core_ib_vote;
-	} else {
-		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
-		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-		peak_bw = perf.max_per_pipe_ib;
-	}
+	if (kms->perf.fix_core_ib_vote)
+		peak_bw = kms->perf.fix_core_ib_vote;
 
 	avg_bw /= kms->num_paths;
 
@@ -287,12 +271,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
+	if (kms->perf.fix_core_clk_rate)
 		return kms->perf.fix_core_clk_rate;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
-		return kms->perf.max_core_clk_rate;
-
 	clk_rate = 0;
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
@@ -402,54 +383,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 #ifdef CONFIG_DEBUG_FS
 
-static ssize_t _dpu_core_perf_mode_write(struct file *file,
-		    const char __user *user_buf, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
-	u32 perf_mode = 0;
-	int ret;
-
-	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
-	if (ret)
-		return ret;
-
-	if (perf_mode >= DPU_PERF_MODE_MAX)
-		return -EINVAL;
-
-	if (perf_mode == DPU_PERF_MODE_FIXED) {
-		DRM_INFO("fix performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
-		/* run the driver with max clk and BW vote */
-		DRM_INFO("minimum performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
-		/* reset the perf tune params to 0 */
-		DRM_INFO("normal performance mode\n");
-	}
-	perf->perf_tune.mode = perf_mode;
-
-	return count;
-}
-
-static ssize_t _dpu_core_perf_mode_read(struct file *file,
-			char __user *buff, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
-	int len;
-	char buf[128];
-
-	len = scnprintf(buf, sizeof(buf),
-			"mode %d\n",
-			perf->perf_tune.mode);
-
-	return simple_read_from_buffer(buff, count, ppos, buf, len);
-}
-
-static const struct file_operations dpu_core_perf_mode_fops = {
-	.open = simple_open,
-	.read = _dpu_core_perf_mode_read,
-	.write = _dpu_core_perf_mode_write,
-};
-
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
@@ -473,8 +406,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)&perf->perf_cfg->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_dram_ib);
-	debugfs_create_file("perf_mode", 0600, entry,
-			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
 	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 4186977390bd..5a3d18ca9555 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -24,20 +24,11 @@ struct dpu_core_perf_params {
 	u64 core_clk_rate;
 };
 
-/**
- * struct dpu_core_perf_tune - definition of performance tuning control
- * @mode: performance mode
- */
-struct dpu_core_perf_tune {
-	u32 mode;
-};
-
 /**
  * struct dpu_core_perf - definition of core performance context
  * @perf_cfg: Platform-specific performance configuration
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
- * @perf_tune: debug control for performance tuning
  * @enable_bw_release: debug control for bandwidth release
  * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
  * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
@@ -47,7 +38,6 @@ struct dpu_core_perf {
 	const struct dpu_perf_cfg *perf_cfg;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
-	struct dpu_core_perf_tune perf_tune;
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u64 fix_core_ib_vote;

-- 
2.39.2


