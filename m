Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D614734865B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 02:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCYBVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 21:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235507AbhCYBVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 21:21:13 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C91BC061763;
        Wed, 24 Mar 2021 18:20:49 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x26so374526pfn.0;
        Wed, 24 Mar 2021 18:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jvtHjsud/eM8BNoD46gfeLSLPrxRYWFWJgTEw76kwZE=;
        b=heyt2LSrQop8eSn+OWytP9J9XRU5yVkQNgnO4rgolg7d1Dd6Ng2YDGalVIYWrF03/o
         vanw1HyX7rjg9QFtCUE6bFAd7RoMLx0FUo3GxVQaNtofKzXQRgGtkl5/dYoUVO2L2p7o
         760JX+pBjX3CqH5sCfiNju/ltPw9Q84KEbWDDnJgfUBLrCKR03UCWYTU8v+FqHQMsFcH
         CC40b8AFPHXfarT4U7I0/Q+bVkc+ZhVfmaY8cZuzoiK9F9VNt6QZ0uM3s5CzxW4fWBVP
         f2bg11+ew1haET4l/pBYTEBpVj3KLmwHOh6xl/5zM0siFZXxKp0fLC+mnvxgBGsFts1s
         0Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jvtHjsud/eM8BNoD46gfeLSLPrxRYWFWJgTEw76kwZE=;
        b=uAnsiHN+/D7YObiFQVQeuLlto1HpACp1cgwaqshoWhrHzj9ysNtT6bHmcqNTkyeEHO
         MAr/9M0JBUDSF1xDAYW4GYROutcZ/evFd6Yn4CI9Rpcxc9RBvBU5YPX7RBFq+sP6bu6J
         fFZktejEcUF8PBACbFe7P/OfTM1iJmOFQ9uZ9W8ufeIjFKHmclCRWxnqb/fw2JgkbzQX
         pIEBp4KAnGddHbUKAWFd1qseo6dd0fc1BYZg5HbVQ8bYbUlJOMXCjGsT10kZhAgQ+60c
         ULXcKvsLWkFOEFZ6lf/xeniowBCWXN4qg221rnbCC2k4VlSW7gD5+q45DD3YzY3aolHT
         GW+Q==
X-Gm-Message-State: AOAM530mAZ1zUARweaRbOgzBn9Mt+9JAbuU336jvVa2Ox48qFHdV4KHY
        OUlijjkifYNvjbit6jvsMvw=
X-Google-Smtp-Source: ABdhPJwIVevPtK6crQOEjQ+xBQahy7onoSNQlgYFzsPUBQrKZduUNsy4TN/GmLA7EKTII0kZ+wGrkw==
X-Received: by 2002:a05:6a00:2a3:b029:1f2:f7f0:adf0 with SMTP id q3-20020a056a0002a3b02901f2f7f0adf0mr5506830pfs.33.1616635248965;
        Wed, 24 Mar 2021 18:20:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id 25sm3756923pfh.199.2021.03.24.18.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 18:20:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Add param for userspace to query suspend count
Date:   Wed, 24 Mar 2021 18:23:53 -0700
Message-Id: <20210325012358.1759770-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210325012358.1759770-1-robdclark@gmail.com>
References: <20210325012358.1759770-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Performance counts, and ALWAYS_ON counters used for capturing GPU
timestamps, lose their state across suspend/resume cycles.  Userspace
tooling for performance monitoring needs to be aware of this.  For
example, after a suspend userspace needs to recalibrate it's offset
between CPU and GPU time.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 drivers/gpu/drm/msm/msm_drv.c           | 1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 2 ++
 drivers/gpu/drm/msm/msm_gpu.h           | 2 ++
 include/uapi/drm/msm_drm.h              | 1 +
 5 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f09175698827..e473b7c9ff7f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -280,6 +280,9 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
 	case MSM_PARAM_FAULTS:
 		*value = gpu->global_faults;
 		return 0;
+	case MSM_PARAM_SUSPENDS:
+		*value = gpu->suspend_count;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b29e439eb299..4f9fa0189a07 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -39,6 +39,7 @@
  *           GEM object's debug name
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
  * - 1.6.0 - Syncobj support
+ * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
  */
 #define MSM_VERSION_MAJOR	1
 #define MSM_VERSION_MINOR	6
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 7bdb01f202f4..ab888d83b887 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -256,6 +256,8 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	gpu->suspend_count++;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d7cd02cd2109..18baf935e143 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -152,6 +152,8 @@ struct msm_gpu {
 		ktime_t time;
 	} devfreq;
 
+	uint32_t suspend_count;
+
 	struct msm_gpu_state *crashstate;
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index a6c1f3eb2623..5596d7c37f9e 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -76,6 +76,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_NR_RINGS   0x07
 #define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
 #define MSM_PARAM_FAULTS     0x09
+#define MSM_PARAM_SUSPENDS   0x0a
 
 struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
-- 
2.29.2

