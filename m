Return-Path: <linux-arm-msm+bounces-32285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F269844CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA02FB26AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC1D1ABED0;
	Tue, 24 Sep 2024 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDQSfeeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFAA1ABEAF;
	Tue, 24 Sep 2024 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177458; cv=none; b=ARbqdhFtx20Cp7YvVxyhvT0Wmax8yWLgTyJPIcofYZdiHcCnkizGXr+dKHuYpCcuB7+WCwewtpcwv0kdKpdnIdotQ0SacHbxM6eDU9tJHJ1dCmmN1NLbR0UIfqeBF+dFSP9tUELptG0UZzUEnAxKJZIfP6VbYlYEK3ehA5AhVNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177458; c=relaxed/simple;
	bh=hkIxVGWeKmryC2eLYVINRVq4p3WNWoRnKE3ce5L9CRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCfeDx6eYpAllfJoz4kFUnQl0acvMnPkIynVal+yWPnlHQDfULJZBTvrFbUIden2ZWMMTE6h6gaK9X9a9dKKK9d+Sb8UrRXiiiVr4BGwQ52UK9Sg3+8B/uTT9+lVki2eQozOuItLoum/N+iZz2w/Oz96q6jyx1ih7fNq7pZuQgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDQSfeeA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c44e1cde53so6865559a12.0;
        Tue, 24 Sep 2024 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177455; x=1727782255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lXuDq8mG8Oox8ReUlOYfBHI57TTAdm6VM/42FD3opk=;
        b=EDQSfeeA7qpgp/rgLcmmSPPkdJ5GdVmZ6Q2DNcgufl54PqboVlqtXuad44PRu45EYM
         gfq/dqK/j3TBfeY72hHM8RjO8g7PMWouTmRfve2DECFzhQBSzi5GgoyYvdzueNJ+j4ZC
         wkHiHajvcyt/qibd7sVc8MgCK68aYfJ3WeCeQyLh0foGktzw+qOefThi1CGOfComXAkU
         YY0MoAxtQ7M2SuuwASGP67S/pPtwfb4Aw4wG2MjKSanKonCO5mlSFBDs6WnWI9sKr/MQ
         RIPCVlILTvmLGAhjZirObJodu83miqD65o0e3ZPo6arVW5EbB0+s4uC/uIK/sdwOvaqu
         J+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177455; x=1727782255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lXuDq8mG8Oox8ReUlOYfBHI57TTAdm6VM/42FD3opk=;
        b=BA+5gPO9f+wXqyDGKmAxOJBFMjnTHFuxjJWfo3u7yxtDBOBctCHCc6c1BM0T0bVHZP
         cUP+lpGjUXNvKvMqIx2q6INMZf+JRdKm1H53MnprwkExhu2PVu+PqxylfLUmGhjZEYuC
         IIT+YfGHHDY+GZgJE5VgTL+UE+xMU4M0q4ekmlrLtMF1DrN0hDL1INKm6g5dpZ2fux+5
         6NNlvJMZeCpixzlZLBWBtEDwCJ7dqO0PQOUqdosekZHuolx3AhyNF5dxqcQJXjYmrP0J
         CTaVpFTpPcHLvHquOIk5dag5qJWJ5JV3DY9VWq/CwsCfIXcCxDuSX9+2LgC6u2M/NK7k
         G7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdkVjrxXUmSnh64qkpB1CmBGO7GeamC1b/dgUoACxxq4JnhBVDHNnKoOfsx9TEhl5BUMzzJcuZdm9IA4aE@vger.kernel.org, AJvYcCWiEWBy16EisHIYLCQXcKX3lzOnUI4/EykiyItXGNydojpUCOhUgRv4PFBgpwaz/x1EbRxPe0mnE2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNczA+OnT+PFr+zxM4nYIxsVHkxF6mj1Uo5sabTRA/I+UO/VmW
	22b3oMlCx5BdZz912KgecvuttshwwpDn3fOygPbq1MStD+mpkMtVvzhmGIIg
X-Google-Smtp-Source: AGHT+IGu8AttCAIBHfv1YZLNJdKkGKNVsZjY6wH+lgr+bfXwxH+gFnbtz84q2ql3MMebddfRAKG26g==
X-Received: by 2002:a17:907:d3e7:b0:a8d:250a:52a8 with SMTP id a640c23a62f3a-a90d4fdef2dmr1569419366b.3.1727177454688;
        Tue, 24 Sep 2024 04:30:54 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:54 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:44 +0200
Subject: [PATCH v5 09/11] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-9-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=3416;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=hkIxVGWeKmryC2eLYVINRVq4p3WNWoRnKE3ce5L9CRg=;
 b=Vi0qPyqWGnrGlNn+hFPyJvdZHwCxpOKUhTamx90KhXi066loDgG9kVNR4wqG1ZaEzkxQBEsg0
 FL7cRelkg/hCed0Zzokcufmgj6lKbaQMN0/+7JfuNwQ1GVMAy4c7e3L
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Some userspace changes are necessary so add a flag for userspace to
advertise support for preemption when creating the submitqueue.

When this flag is not set preemption will not be allowed in the middle
of the submitted IBs therefore mantaining compatibility with older
userspace.

The flag is rejected if preemption is not supported on the target, this
allows userspace to know whether preemption is supported.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
 include/uapi/drm/msm_drm.h            |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 736f475d696f1133c9e55d16aa80e73fd46cb835..edbcb6d229ba614be910ee70e75731538116e4a4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -430,8 +430,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x101); /* IFPC disable */
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00d); /* IB1LIST start */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00d); /* IB1LIST start */
+	}
 
 	/* Submit the commands */
 	for (i = 0; i < submit->nr_cmds; i++) {
@@ -462,8 +464,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			update_shadow_rptr(gpu, ring);
 	}
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00e); /* IB1LIST end */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00e); /* IB1LIST end */
+	}
 
 	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_end));
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 0e803125a325aa67639406ef413aaeb6a9f08cee..9b3ffca3f3b471f509918edd4a2fdb0f80dfeb06 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -170,6 +170,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
+	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings == 1)
+		return -EINVAL;
+
 	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
 	if (ret)
 		return ret;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f738614a3e229e1017fe4f2ab61cd98bdf..f37858db34e602ce8b92dceccb60d4b6bdcda877 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
  * backwards compatibility as a "default" submitqueue
  */
 
-#define MSM_SUBMITQUEUE_FLAGS (0)
+#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_FLAGS		    ( \
+		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		0)
 
 /*
  * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,

-- 
2.46.1


