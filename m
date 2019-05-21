Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1905725634
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbfEUQyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:54:36 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46886 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbfEUQyg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:54:36 -0400
Received: by mail-qt1-f195.google.com with SMTP id z19so21244232qtz.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YX1lqQKoAdMEkXm9fJ7ay6mt/s4Fthe/P9FKBQsotPA=;
        b=HfRUsH30j8bXOUQb7Dj+WNScabJk0n5VYqokSX6HSXVxAA6C/9LFtd1QTG2rS9uMUf
         kY7XYJXxrUtZlyvN4tHCD/ld0eNIKMwqriNP9YGiik5s9Dbr0mQNUOh98RfiDI1/uCfi
         qNblANZU4QtkDhsxHLCX1wbgIolSCBTxfeHZ2wWr9RakCIE9RynEpy0kASPqSkVc/IDm
         FH0rOxQ5pt5tsVKz00HO8jnIhChnWv6FfWIIEHJuCaaNsIVQurdpWWLxhIfpnSTIMKs6
         UoYjLCQ0nM0yPdAs2WvqSLYKm0PYBmyS9vuUcL63G26AS7ex6w8XG54tOp6nR6wSChWn
         9dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YX1lqQKoAdMEkXm9fJ7ay6mt/s4Fthe/P9FKBQsotPA=;
        b=OH6a/e/C4nxzfBDXusCXcSN12E9pNdoUkKUZHSnG/QMDN+37ek4DCLMQr3d+StrCea
         h3zO3VuxgfPr4bzh7vOL5wf7koUYQKK4zhciD2o0PEw/kk1iSJeV/J3grr1DwGckTEsG
         c0KeyaYgmjVZYAWALLW3yc2BFd/3xX2NDXXIBgTzi8kf9aCDzeTV1G4yg2yhrTI3R3S3
         hEN565D70inwOJvsDNTYMQPmRBqCMRhU2afNeOFfurqEh3FLZHPkF+qlWg1oq6h+QYi4
         jp2CfRY9W0SJfR6UzdZCNM8ZasPXgwEL3Pj5gDtrCQajAo6xsSkzGT0waqvEB7Hp2Xku
         N/7w==
X-Gm-Message-State: APjAAAW1Jc9Qan9HksIcZN9cdt4aEygm5XFPYMNly0/3CD1ybJaIRrYf
        RIguunGEawDWj1i5BG72ZB4deQ==
X-Google-Smtp-Source: APXvYqyn3PDcDAV3VtVntCLGUTk34w3mGeiDPU2bayID9L/15EXdZ1OMsMblyWHbE8SXaz0tJepwzQ==
X-Received: by 2002:a0c:ad1c:: with SMTP id u28mr23319436qvc.87.1558457675228;
        Tue, 21 May 2019 09:54:35 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id z29sm10777828qkg.19.2019.05.21.09.54.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:54:34 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: Avoid freeing gmu resources multiple times
Date:   Tue, 21 May 2019 12:54:20 -0400
Message-Id: <20190521165433.2895-1-sean@poorly.run>
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

