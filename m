Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA4B284A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 19:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731115AbfEWRQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 13:16:56 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33249 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730924AbfEWRQ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 13:16:56 -0400
Received: by mail-qt1-f194.google.com with SMTP id z5so1295769qtb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVyySMQJl3gBMSC8bbpoLt1NhD1HgNiXu8ozFZBZ59E=;
        b=cEtmouNiutaoR3NwHaVYVUSLIb4Nun+cTeOsHerD0b9/E1jcOmLsCyjmpFNoqLG3+n
         cbUHD9VNJmHfzX/3zwdApXoJQv1T2++xVpOGcdknLIV5argkPmRby4Uwyx7jxHT2SnBe
         OXBS4ZVv36rR4yyIowM0jEog4c/U05sowWYLmFKV2yU9h7T6rXeTBjSZZzQhy3mgJN6K
         ljPAyEnEkcLNT7ScllQvRQUEvDoh1o604AZ05MiTl1ybQ6eKQpHnRJP3jtTAsUG1Gf0c
         OBcTZoOeKSq8XVcVLHbWyz4E4J2Wo2uuF3+azMlSmGrgWEGBXwqbieYa9U3PuMHJcihl
         SdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVyySMQJl3gBMSC8bbpoLt1NhD1HgNiXu8ozFZBZ59E=;
        b=gkd7cwdfo4NqXy4GwhGUWyMlDfGecFU/v3fnNT+jJKUyy3f1E/Xi84Pi5scO8hzKXo
         4XMLgI7fLf9M9kzBJSzGCyEyMdtvpal1FY2v/d32gW0cycEvPZfTU0cllfItcfmFLHsU
         lL4Rj4X7Twf0jrgp1NHEToi+V9n/DP0XnX2UJDGSY+ED3qNOUjVA2guTROAjSxWHKzGa
         GQS2FSDvj8gW1SwPR4kvqqucWq7lLTiLp/fOf1T9cJTVB6rVHl3c38Nunsfn8KTg2Jrw
         ErWMfj6eUdVF7oDyEe1QNoOH5Z1EH8ZssWwcWGEbmFUmobCUIOPicfsbMMHSfsqNQlW2
         XudA==
X-Gm-Message-State: APjAAAXGAUt+7xnwxX5xyhUofYSRpe6hV1BplfI7uO1a3GIecZpLwqPq
        fggy4fqQKzO7YKH+pdYbeTHMQQ==
X-Google-Smtp-Source: APXvYqx9L4yMF7KYPCpYv00QYxVIIjD4u5i22XRmGgtco4zLN/t6HQ9AhX/fqHgLqrbqiVeUTh9KLA==
X-Received: by 2002:a0c:be87:: with SMTP id n7mr41100426qvi.65.1558631815491;
        Thu, 23 May 2019 10:16:55 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.16.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 10:16:54 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/6] drm/msm/a6xx: Avoid freeing gmu resources multiple times
Date:   Thu, 23 May 2019 13:16:40 -0400
Message-Id: <20190523171653.138678-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

The driver checks for gmu->mmio as a sign that the device has been
initialized, however there are failures in probe below the mmio init.
If one of those is hit, mmio will be non-null but freed.

In that case, a6xx_gmu_probe will return an error to a6xx_gpu_init which
will in turn call a6xx_gmu_remove which checks gmu->mmio and tries to free
resources for a second time. This causes a great boom.

Fix this by adding an initialized member to gmu which is set on
successful probe and cleared on removal.

Changes in v2:
- None

Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 +++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 38e2cfa9cec7..aa84edb25d91 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -74,7 +74,7 @@ bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu)
 	u32 val;
 
 	/* This can be called from gpu state code so make sure GMU is valid */
-	if (IS_ERR_OR_NULL(gmu->mmio))
+	if (!gmu->initialized)
 		return false;
 
 	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
@@ -90,7 +90,7 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 	u32 val;
 
 	/* This can be called from gpu state code so make sure GMU is valid */
-	if (IS_ERR_OR_NULL(gmu->mmio))
+	if (!gmu->initialized)
 		return false;
 
 	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
@@ -695,7 +695,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	int status, ret;
 
-	if (WARN(!gmu->mmio, "The GMU is not set up yet\n"))
+	if (WARN(!gmu->initialized, "The GMU is not set up yet\n"))
 		return 0;
 
 	gmu->hung = false;
@@ -765,7 +765,7 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu)
 {
 	u32 reg;
 
-	if (!gmu->mmio)
+	if (!gmu->initialized)
 		return true;
 
 	reg = gmu_read(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS);
@@ -1227,7 +1227,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 
-	if (IS_ERR_OR_NULL(gmu->mmio))
+	if (!gmu->initialized)
 		return;
 
 	a6xx_gmu_stop(a6xx_gpu);
@@ -1245,6 +1245,8 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	iommu_detach_device(gmu->domain, gmu->dev);
 
 	iommu_domain_free(gmu->domain);
+
+	gmu->initialized = false;
 }
 
 int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
@@ -1309,6 +1311,8 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Set up the HFI queues */
 	a6xx_hfi_init(gmu);
 
+	gmu->initialized = true;
+
 	return 0;
 err:
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index bedd8e6a63aa..39a26dd63674 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -75,6 +75,7 @@ struct a6xx_gmu {
 
 	struct a6xx_hfi_queue queues[2];
 
+	bool initialized;
 	bool hung;
 };
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

