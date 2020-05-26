Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993E71E19ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 05:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388623AbgEZDZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 23:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388478AbgEZDZT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 23:25:19 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96170C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 20:25:19 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id c12so5263487qtq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 20:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icdvv+zfVuWkK4xKk9F2ehGRQ03Uhs0Am8XJGkVDSbM=;
        b=1xj6bvuoqjBpZEVkxfou8Q3ppYNrSKIhJY7OiNgLIYUxccjHMvjuj9EpmQVKOPK73O
         9Jb2a89k/uzEQDFXBYLtw96EptlnL+LfrFThRHG9pp5lseLS6WFc14MKYaPe3lQxciVh
         20bxvVGYa2weN15/fghuS1/6XBpu8c7EPOysysXbzVDm/qjkuedz3sl5apseVgy9n27A
         m0YtprD2izsLmxfaYOlDDyBN7cLUMW9ye6/SR4+L6WltPjtSodkwfDl+vBI/92bAqRl1
         n3TbLVcj2DrEI1n7/PqIgM0qn8Tu9YUzNe+m8N0QvsiI44k4OVLInLM6Vdp+saWMqPMY
         U5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icdvv+zfVuWkK4xKk9F2ehGRQ03Uhs0Am8XJGkVDSbM=;
        b=mLKW2iSq/7YZjHDhVWvesxszvzWl1JzejcXzcFj8XbPGpcK/XA4RB/ncuJeM7cP5Q4
         CIOIZjFbtQ4xmC7W+wrnhXaoT7Golk8wB++2zx45Ps6Y/mGZIGuxcQTfildCSqalO2dP
         PFtT6R4OPVkfbyJ5nElbaJPvCMBxO6kTkonW/BWOnBDFUCI5ZX+v8IZAnXLlpESycyY1
         sAMIKKi8esvbrXLw/ll8QqIhfpsHYpuSzFNiqJ3FM8zcgjEDTe2QBRTX4xmO6/XB3xKi
         BLLUsquWSQs2I+/AbpFCdToUxaJpSTEDIMRLYa7ZS1jid80DDdpMeaSXUbALRu8UlC32
         aEnw==
X-Gm-Message-State: AOAM530ANQH9+kCGgeI7eLDQczdgRdMNdF+2p3LRaCJzKT49w/p6luof
        l8MICrW3Xpt9tB3Da54D94vQxw==
X-Google-Smtp-Source: ABdhPJyZzwf65VwCV0TDaHoKmrKJSyHqssK1cp/VoAI3e786WgRYm7yHNvsC4LeGPByGfjqim7eFtg==
X-Received: by 2002:ac8:18a3:: with SMTP id s32mr31078692qtj.102.1590463518849;
        Mon, 25 May 2020 20:25:18 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id n123sm15955760qkf.23.2020.05.25.20.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 20:25:18 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: set ubwc config for A640 and A650
Date:   Mon, 25 May 2020 23:25:13 -0400
Message-Id: <20200526032514.22198-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is required for A640 and A650 to be able to share UBWC-compressed
images with other HW such as display, which expect this configuration.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 ++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6f335ae179c8..aa004a261277 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -289,6 +289,37 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? 0x8aa8aa02 : 0);
 }
 
+static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u32 lower_bit = 2;
+	u32 amsbc = 0;
+	u32 rgb565_predicator = 0;
+	u32 uavflagprd_inv = 0;
+
+	/* a618 is using the hw default values */
+	if (adreno_is_a618(adreno_gpu))
+		return;
+
+	if (adreno_is_a640(adreno_gpu))
+		amsbc = 1;
+
+	if (adreno_is_a650(adreno_gpu)) {
+		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
+		lower_bit = 3;
+		amsbc = 1;
+		rgb565_predicator = 1;
+		uavflagprd_inv = 2;
+	}
+
+	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
+		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
+		uavflagprd_inv >> 4 | lower_bit << 1);
+	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
+}
+
 static int a6xx_cp_init(struct msm_gpu *gpu)
 {
 	struct msm_ringbuffer *ring = gpu->rb[0];
@@ -478,12 +509,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Select CP0 to always count cycles */
 	gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
 
-	if (adreno_is_a630(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
-		gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
-		gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
-		gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
-	}
+	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
-- 
2.26.1

