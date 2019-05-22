Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286FE2692D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 19:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729509AbfEVRg7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 13:36:59 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41370 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbfEVRg7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 13:36:59 -0400
Received: by mail-qt1-f194.google.com with SMTP id y22so3362889qtn.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2019 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AYiSIlwY7eZx42yq/yFRXslZFh/MVGXyDo26yWSMo7o=;
        b=SrBINLg3y8oOnNpUKbA1YuWFLyA6h+N1Egt2ZPDFCv7VISdUgDKm1XBjTrTHNZWfPm
         C9cjC/OXMJ9fC2GoGz4FZtTr+fWOe+IRKfLhTK5CJnAX7DAzXA+V8v0U57PCvrC5lr4y
         67EXllxIoOz0nX4jPmsGjXiYyqjiyPiY8cMJFNcywvBcfqBrPlQgDcWkoJbGW198Xc6y
         LfhSbk/uEaOOOxEnPKsi3MBbLploSMuBsLE/3L9OtdoIspbQdZB7rqzQYpBi8AyIQfn0
         ImmsiMLq/3i1FP7fpX5sH1Z+EO/WvjFDX7VaN7qKR9h4je3dKiI+HSVoJnC0x85sbWvK
         J4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AYiSIlwY7eZx42yq/yFRXslZFh/MVGXyDo26yWSMo7o=;
        b=SsePk/uxF46V1ROx8TGUCcjvlz/TUs3VLY7/L8qPWiz/Df4syv1Yc95hsZ0xoKsbJf
         H0R95KYjnl8adMcyRCrIxGZRTBgIklvtncBTzdMbP28a/yjfeB3V1DBqoVWObIcihG9k
         YdM9jedrncX7ptu2yIEKzPeew/Dbyo0vc9pzKWBm7s0M3LNO0xhoZoITFM2o3u3AL64U
         tr6EnUxPSZQwrdW8ZU2EyV4cNkcMPL+qqkO5Ik2J4fxnnAlnYtzE5qRNthwmv4+jRwsp
         hxeYtFuzi1fpF4qVzA9JE+C3ByB7WaMFPmQFeSKjxFANaz/P20vhQVYvPQsRjOFhfxJN
         QkrQ==
X-Gm-Message-State: APjAAAXm8Fp7sCtCeYfoV7n4LJLoUfvtdwHb6o2e1scK2R3S3ISsDhRd
        7yaEutAgtpJWRmulZ5RuRxQPb6LnoOA=
X-Google-Smtp-Source: APXvYqySVLc8RxuM7HtrdaGFkR54894hlH1Xqo/SCO3BahDCmgyit80hoTs+BawDDwCys8EWkW7NLw==
X-Received: by 2002:ac8:8fd:: with SMTP id y58mr77023926qth.375.1558546618411;
        Wed, 22 May 2019 10:36:58 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.36.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 10:36:57 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Subject: [RESEND PATCH 1/5] drm/msm/a6xx: Avoid freeing gmu resources multiple times
Date:   Wed, 22 May 2019 13:36:40 -0400
Message-Id: <20190522173656.162006-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
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

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---

Resending as part of the set since some later patches depend on it

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

