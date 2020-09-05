Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3DD25E9FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbgIEUEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgIEUEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:04:11 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6EFC061244;
        Sat,  5 Sep 2020 13:04:11 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y6so224775plt.9;
        Sat, 05 Sep 2020 13:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eBuEDGfYTy5PPn1RDxCycEVRZJaKkkv9eSmYF9/QNHA=;
        b=rBj7GWccfosFE5ZBxHIGrVT0r+K4byI3/hnMfzfkdhsP6dHgrnWuatoE2Hcu7egNBN
         h48KLqcTSVasryom6dH1s1FsCm7iVkSfNO5vxZ24cjYQukx8Rpw0AhWlHnw5qtymJCDK
         xyhsJ63y+KWEcozt1vkTgde5z8ha20eAV2xWI/GdqdGcD26kwh2Dzmv3NL4uxcU3OA9X
         BzEcSbi/GINB8iau0JS5h8q+00AELGfirlHFP6u6q0FJORf1fToSiXMSROk0DoLPblam
         zCpkMoPjbkHSs3rSmkVoM/8nn1REWd32/nW7NKiY1NEuTnI13gcJ8L6WnEsegmWrQQTE
         7FVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eBuEDGfYTy5PPn1RDxCycEVRZJaKkkv9eSmYF9/QNHA=;
        b=eqlc3k8fzjRXOmFvVnWx1BNlz6HC3+Nkuevfb3+CK/a9NOIp47ewNFxG0L31BmlxpR
         aFFP5UgEjPpxdJxalK+7QGIJ9WyXxZ1v1f402HFsCW35uV/wSZMpbnxdS6fh5AZ8yF+1
         lH8OLSBS8ZyoPZW5uGmEYONntJhZTQwvVUhj1IUQ6JMxX2gdkgU+QwFW+7C9Y4s8PL9t
         ckjvffq5QNCPMQQQC1xHvrOgw7Y86e6pz3+Dr6FsVC5cvtwRd/Ye4T2OdVkfomt1bZD1
         qfgaYxXx7o9weT+MBRlr79MnJhKM2QBuqInT1apcuyaIkfGF+/jeu0TvWwSrn7cjwRdg
         BrzQ==
X-Gm-Message-State: AOAM532/LxvKR0iFjLs5gp3a4fkxKfPHNn2NGMq35+fCA4ueIyz5QHug
        IR37Ekz7TLSk7o/N84tfldSWmH4AUEXPrL6oy1k=
X-Google-Smtp-Source: ABdhPJzbfLaU/Mp1zLSe6ZuOihRa4QPrTK7zg3slAeaOAvr6/R99b+0gyQAeENp1hLMOVDs8q3JHEw==
X-Received: by 2002:a17:90a:e545:: with SMTP id ei5mr5624951pjb.45.1599336250560;
        Sat, 05 Sep 2020 13:04:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u3sm8034863pjn.29.2020.09.05.13.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:04:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v17 04/20] drm/msm: Set adreno_smmu as gpu's drvdata
Date:   Sat,  5 Sep 2020 13:04:10 -0700
Message-Id: <20200905200454.240929-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
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
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
index 4c67aedc5c33..144dd63e747e 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -892,7 +892,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->gpu_cx = NULL;
 
 	gpu->pdev = pdev;
-	platform_set_drvdata(pdev, gpu);
+	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
 	msm_devfreq_init(gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index da1ae2263047..1f65aec57a8f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -7,6 +7,7 @@
 #ifndef __MSM_GPU_H__
 #define __MSM_GPU_H__
 
+#include <linux/adreno-smmu-priv.h>
 #include <linux/clk.h>
 #include <linux/interconnect.h>
 #include <linux/pm_opp.h>
@@ -74,6 +75,8 @@ struct msm_gpu {
 	struct platform_device *pdev;
 	const struct msm_gpu_funcs *funcs;
 
+	struct adreno_smmu_priv adreno_smmu;
+
 	/* performance counters (hw & sw): */
 	spinlock_t perf_lock;
 	bool perfcntr_active;
@@ -146,7 +149,8 @@ struct msm_gpu {
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
 {
-	return dev_get_drvdata(dev);
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
+	return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
 }
 
 /* It turns out that all targets use the same ringbuffer size */
-- 
2.26.2

