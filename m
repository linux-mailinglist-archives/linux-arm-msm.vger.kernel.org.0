Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF1C24434E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgHNCl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgHNCl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:41:26 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C21C061757;
        Thu, 13 Aug 2020 19:41:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t6so3705879pjr.0;
        Thu, 13 Aug 2020 19:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QZSqosPE87e929PMVaJawJzeXi6lq5p/xdY765Ye8VY=;
        b=Jl8ZKrVeqcpHE/9cX3IGbDic8c9E//iKikanBK0fNcVQf9EBq8/AaBSn+6QRY865HH
         BWUYGfGQEtSfT9iM8c6RpjadExBQYODl/u9vdD/EpQC6Dy79i82z/nYRCB6b4AFpRu0B
         cr6XBS8NIb04nkMe+3v1y0TbceUjglnNMCSXl/mWWPYI7TUE3QjSs+mHHhNq/fRFqe0w
         iOXO+mi/R7K8y51/BeVCmXkO5b+uPus2ghRhYwn0nJ2RLSaMfe6XnJkPa1Rs4b21d1RP
         oOfBPZROaxcqvs9WLwp5d3NWq74wMKBdIMieFvEZ7tlS1wIyh5tjYc5xIUrhrQ0mM7T2
         UXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QZSqosPE87e929PMVaJawJzeXi6lq5p/xdY765Ye8VY=;
        b=YZYqwFUNW9w3y8vlsMhlTc+TMn0a7TxTW+hCf1AlfDF4hV9Nxa6EBD2a0aL6AamVqD
         W3F+JlKMWY00PxmRiQj519iKQ4nIpqqC2NhYoptklPj5bKlF61RBwBvPCLxONC/8opv7
         pMHVsMRqiVwrfqWdVxwDPXzpB7EBTRE0yNQE2cJpFyB3/hC3dEjrtki5C3F11OkCwyiw
         qSD63pyk4JwPIBDqfU0bo7NAQUctSsXovdpw3/YqPKpN+AX1Sq6ASV5tz/MuHxMM9+OJ
         MsaMbsNx5rof7H9jJwnqCJ/A4D1nFK/TPG/CKNDSz+YtxoBpI+BpY6TzX2W/o7j+aXu8
         JUjw==
X-Gm-Message-State: AOAM5338EK4D/+EmnIb5bP8BVHjbx+HMeHGKFy7SxGx8mZTTcjupbz6u
        o9+uFGH4pCuTFJJqgLJB6LM=
X-Google-Smtp-Source: ABdhPJwP3zxBj8X0vl3pY8kQ3H2TddtgM2lrWQd+wxYR2/ooRvwlAKmhBCaebrrUIdkVUHf4/5pfGA==
X-Received: by 2002:a17:90b:514:: with SMTP id r20mr561556pjz.82.1597372885479;
        Thu, 13 Aug 2020 19:41:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id e3sm6691711pgu.40.2020.08.13.19.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:41:24 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Shawn Guo <shawn.guo@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/19] drm/msm: set adreno_smmu as gpu's drvdata
Date:   Thu, 13 Aug 2020 19:41:02 -0700
Message-Id: <20200814024114.1177553-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This will be populated by adreno-smmu, to provide a way for coordinating
enabling/disabling TTBR0 translation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
 drivers/gpu/drm/msm/msm_gpu.c              | 2 +-
 drivers/gpu/drm/msm/msm_gpu.h              | 6 +++++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 26664e1b30c0..58e03b20e1c7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -417,8 +417,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(gpu);
 	}
 
-	dev_set_drvdata(dev, gpu);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6aa9e04e52e7..806eb0957280 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -892,7 +892,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->gpu_cx = NULL;
 
 	gpu->pdev = pdev;
-	platform_set_drvdata(pdev, gpu);
+	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
 	msm_devfreq_init(gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 8bda7beaed4b..f91b141add75 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -7,6 +7,7 @@
 #ifndef __MSM_GPU_H__
 #define __MSM_GPU_H__
 
+#include <linux/adreno-smmu-priv.h>
 #include <linux/clk.h>
 #include <linux/interconnect.h>
 #include <linux/pm_opp.h>
@@ -73,6 +74,8 @@ struct msm_gpu {
 	struct platform_device *pdev;
 	const struct msm_gpu_funcs *funcs;
 
+	struct adreno_smmu_priv adreno_smmu;
+
 	/* performance counters (hw & sw): */
 	spinlock_t perf_lock;
 	bool perfcntr_active;
@@ -143,7 +146,8 @@ struct msm_gpu {
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
 {
-	return dev_get_drvdata(dev);
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
+	return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
 }
 
 /* It turns out that all targets use the same ringbuffer size */
-- 
2.26.2

