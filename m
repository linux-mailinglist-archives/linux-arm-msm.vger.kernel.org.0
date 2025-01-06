Return-Path: <linux-arm-msm+bounces-43960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B24A01E04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5F0D1639F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A47B770E2;
	Mon,  6 Jan 2025 03:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0oBULbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F753D69
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132881; cv=none; b=ryuUQRAaRCcJJQYzYpOdzxJVvTTZ+wAWkI/TEFFPvadR58f6l1gK5Qfwb2+TNsSjnlkOO9O+lVZQnrJiY/Y8ybmJEz7uiCQ6tPNJ9bE2FMVOn1UR4R5MlMaEGY4/4QESoZWN4Z+vMJhIcDY3B7gxY9QeeuiJm8vxXCcpUodV8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132881; c=relaxed/simple;
	bh=8ApQQYwIW4aOZjRGxNwryHLmbasSwJB0LRH46YetCSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrgulR4zENOYdCw7GJv7qmh2jPeBt1EpiIqmiDlLM5pZH9uXffdkRiS30bjR2k3qk3YzHkRZs8JnzrQzoW8OcC0sFWYIKAizrie7i8BfHlVDya43N27IEOLAnz2H19hc2Y6THEIaXriFKrVJMFkb0q21JEyBFoLm9v7bTBqcLD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0oBULbQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e399e3310so16617869e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132878; x=1736737678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yM2i2HYStAdSWG3sjjBGG9Ljxx9LDMbO6ArSQ2Ldm5s=;
        b=x0oBULbQGx2oBw1608uEvNzmi8adqRN7uOczK9HfsMeUps0ibny7oLF43BZXxcBr21
         2N3zjN2Gsce4lcbdUlayQkwrcGNqgpLUHRIYjSshAoziQf03f4O3wLCCkwrk52QpsGc8
         onkD9pohCx29T0sPVZ/cz9JZI0+s7TCmzf3FVJ5AWmFhtPHMtvPQ4xUlwt7EuCvexuUX
         Kv4+mAsufp8opEnivV8eK7+mMwTra4/7NQYK0t1QmLtyg0Ust1U5bgTFsNynbfu36mae
         QubGJpb4QCEUQUUgtcvRM+JlFRqYjB2Bd+P3bp8uacdDZtCRLkN3kWP9/Onf4ES0qqSK
         pk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132878; x=1736737678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yM2i2HYStAdSWG3sjjBGG9Ljxx9LDMbO6ArSQ2Ldm5s=;
        b=PuNUIr0EzgnefMF17/bU2G3vuWfcERFRaHqUXE/f82SCWKYVVh1egTTAfVMcIuSSTc
         yc3D+/iljBLU5sK1pxbVN2lr8x4n92h4lHoQPjMBEHaLpO6Y0mm07bIAX9XJt/6kJquT
         lmz9kbskt9R3eiWYbFAXvkbKQ+RJbppmaxFI1jPNdVbBlF5iRfVDusCpuOvpiFIw/+ge
         5sw7G+wfOU4s7zpcTPimeJKePdZT3EfAK1CToVPT3HdrYtGTgPewa0SR5Nn4B0lyOXvU
         TCwZK9au76yychwakAQHGsCl+tEbQ/IKiYIny3F5c/NLQcFOPvE546934OJr1BVfNiwI
         7vkA==
X-Gm-Message-State: AOJu0YyCHSDKZOk5gExnC0cBfeJuvdg+4S6di12iQfTtNPhq1QChBd6V
	iQvyHnsTQv3PhXQBnZtaoIldyD/cb/e5p06C+UHIbRbzpfggZkZMOEFrSiU4R+A=
X-Gm-Gg: ASbGncs/rYuy5IYYxgblzjFsXn6OX/MQLAqhSbtbmrxCdrMMQFQKlG3Rf2ZqAcGwdpj
	fqRK7+uiiejo3nS7BILyRljo9vKxmPk7GZ9LiHdu5pmcbkt6SboNHASpeSw8Dh6+9uKPgjXUy6C
	Ykvz48aDCeFLQ+s5syYHJf8QKIgX38L3udiB8xIITiFNvYOccMiz6+JvLQo+eyNaBGk9HB5dl2w
	qCK74v1eqzcK7VpGWzCJ+jvQrOJwmGw8oyoFJajiDmrhKN10ZnTr0zxVHcSyBWN
X-Google-Smtp-Source: AGHT+IHioDxU4q4Pl3d58Vp5gu9z+6/Xod18Avh5lpeGfTJ9Hh1MCjsdaanLjqQRRYfO3hUvefwjJw==
X-Received: by 2002:a05:6512:68e:b0:540:3566:5397 with SMTP id 2adb3069b0e04-54229530300mr18509766e87.22.1736132877544;
        Sun, 05 Jan 2025 19:07:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:42 +0200
Subject: [PATCH v4 8/9] drm/msm/dpu: rework core_perf debugfs overrides
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-8-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6299;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8ApQQYwIW4aOZjRGxNwryHLmbasSwJB0LRH46YetCSU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5Mi6VClvRmq3zBh2lGjncCTcohiF8id1VY
 3G+z5EHhJiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1doBB/9tSmBOB2fTQ8UKjU94WtOgR8MaCSQI1yH2JjRw0MXFSQYgNAgrnVxeDme0r1bAkstEzmU
 OHj4o2R2ou5UZeOUXR9gv8j9YlHVOKCq+lCWDMqhhux7mhv7qzx306dvzEUeXLG/Qm2pWbLsqP5
 LF+CKjP+h2cbTosVH9n/rqKf1OA8NjdgtUMiIeG97BRIoyCZsjlcgzGOMOJe/jcfhN+rrSituot
 ssZ/ou8JhNR5Skg9r/dH/iG7Y9xHCnv6T5m1D8nmVrQ38iKcA0cn3kiYLrhwRyF6WMr1WYBsUDi
 jVYUYciUTIGtGPmX7x5DWu8jOUZqg5aVqM97IpREUAcWpFo4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Currently debugfs provides separate 'modes' to override calculated
MDP_CLK rate and interconnect bandwidth votes. Change that to allow
overriding individual values (e.g. one can override just clock or just
average bandwidth vote). The maximum values allowed for those entries by
the platform can be read from the 'max_core_ab' and 'max_core_clk_rate'
files in debugfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
 2 files changed, 9 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7ff3405c6867556a8dc776783b91f1da6c86ef3f..913eb4c01abe10c1ed84215fbbee50abd69e9317 100644
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
@@ -215,18 +201,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
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
 
@@ -275,12 +259,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
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
@@ -396,54 +377,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
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
 /**
  * dpu_core_perf_debugfs_init - initialize debugfs for core performance context
  * @dpu_kms: Pointer to the dpu_kms struct
@@ -472,8 +405,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)&perf->perf_cfg->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_dram_ib);
-	debugfs_create_file("perf_mode", 0600, entry,
-			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
 	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d..9d8516ca32d162b1e277ec88067e5c21abeb2017 100644
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
 	u32 fix_core_ib_vote;

-- 
2.39.5


