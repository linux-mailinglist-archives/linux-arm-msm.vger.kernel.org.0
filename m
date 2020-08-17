Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163402479A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgHQWC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729322AbgHQWCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:39 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869F4C061389;
        Mon, 17 Aug 2020 15:02:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id l60so8462174pjb.3;
        Mon, 17 Aug 2020 15:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QZSqosPE87e929PMVaJawJzeXi6lq5p/xdY765Ye8VY=;
        b=Xb1xHUOTotXSCyxa8jjfe45ZOkedLPRBfnNAWdc9VHQVozfEpoDsguD9Ab6aSRr3AJ
         rv51QvUf8MsSYAM9DRvg0NChRIAO0dhx6Y+TcgycrHOIlvE75qKuUqZLMUjZBsRrCMd+
         2iE+Rcgv1avwdUT6N95hNIhEUrijPn3ydjvnNdhSgZN/RbxJ/Jf7JfM/s+8MvMtNMBc8
         nqKlD9GgKav3fy5RjUVrn9Nf99rGyWxanpiAPrpjTyMfjJoifSw1BIQaa2kvWsdsGrGr
         HAUcfaeQP11X4uf14OQW4pFa63h7PG1aLNrpfaTbGhQxCzdybkwR5etaxG8DAkHzTsRu
         2vJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QZSqosPE87e929PMVaJawJzeXi6lq5p/xdY765Ye8VY=;
        b=TbFKs1L51zmS0Wv4cnyEMBQsXKc8ZlrapJRpxP+kzffGwkqpKH1UfSueMuQ3Ix9NuM
         H464Y5iMZ/uPQ1RuHSqBgXUq8rhad9Hba/ESs4o4HNPHshdACl5+bSgirycDf0K8cXk9
         JY3jKQ6Yrjo4LzA4lgSSORR/Z6bf6bo7CED30Opm42kbN5/haOHpoXgOrX81xcLPTFU1
         hXaC7HoDiElnAFKVqypq8319Q0uQfpFkJbjS/L758aP5d0X+YW3eKhPXrbBbpClq6qfT
         HsMyrVDLrJB9jjxjKfQMLTRDBDCYAxrHsqQ4GKhEz/ktzlDBP72ovV0XNptZpRyjQqi1
         FBIA==
X-Gm-Message-State: AOAM531xFZo1f52wELP44/AZ65oZeWd7QhTsxi+teWSXtA56cS2kNWQ1
        +QT/GLlBF0LigAJYjmWYbctzyOANelvSokA6
X-Google-Smtp-Source: ABdhPJyDCeI07xcIqj4wzprJJRUMrONZ1jmyklTb2+yifvryc/EFsttDdWQQr1OujvvTdZvogkxG+Q==
X-Received: by 2002:a17:902:8c8a:: with SMTP id t10mr12862831plo.112.1597701759014;
        Mon, 17 Aug 2020 15:02:39 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l22sm18701560pjy.31.2020.08.17.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:02:37 -0700 (PDT)
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
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/20] drm/msm: set adreno_smmu as gpu's drvdata
Date:   Mon, 17 Aug 2020 15:01:32 -0700
Message-Id: <20200817220238.603465-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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

