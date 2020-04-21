Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686B01B3394
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 01:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgDUXmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 19:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgDUXmX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 19:42:23 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4BBC061BD3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 16:42:22 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id y19so67488qvv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 16:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=19iG/yACSonzsO8vO7FObgRGDUOJ9AtxmYB1RErPuPs=;
        b=HkvRfb0MpfG0U053mY7Zd3gM4fIa2kscD5ve2SvXPYgzqUVt0yazshg3s0shuP+ZSB
         LMk50VfUGfC3YXvi/pkqj9pdgFTEwmOabdP6aBax/zReF7ptRSzXEmgMxqYmzphj3HLH
         8REtqIQshVqE/ELzxW/Xts627H4ASkUzzkqqKcVe4lhWTqjUJQAmky0Qns7xPozSOJoA
         qnFqm0PlXwyg6hPb2EMBbBQOfSsRGxLQjW6McZI8ddvbSD6x5SMq90dvyAZRhAHxqU2j
         s6bGm0zjbXg0NOHWN0Ve23mEd0A4thbVj2s2rgkAc3w/MqXygX9ajB4zjlGP/u5VGGXU
         7+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=19iG/yACSonzsO8vO7FObgRGDUOJ9AtxmYB1RErPuPs=;
        b=YgyYKN8oN2SQiGA5Vkn6YDiH02dr97XoRQNwBR8bV0uPdfM1EDdPee2VnAYPV6/2Rg
         +Hq8kY0ZBCNxtOfygl8HNXf2CwInALic/3aI7JxIKWLwrhgd3JEFU2uAebxPOhVjWNPL
         pzWcNkHFhbe57jQBSGwTRkwZrvQzm37qYJB5Vix8lbDuuyxxB5ccgRwrxRpVbDvAXBBl
         TSAv2Y091gcDrFnQBG3Gf5ZKExotUnw0ou0NlW7mwZLog5zcsplL+TLteOFUAqrSvnlI
         okQ37cjCBqIN60jMy82WmfyuQUfjHfrxccUJcB/WSomNcD+5+oQJJvrSwIn+2WFsmFHU
         HG+g==
X-Gm-Message-State: AGi0PuaNqFFMhXpudLo73cFtqieEuMGmKJtJU02t8VUfs8hKdgMeM1Gb
        +zhMplxgzdwQebK9IkmRkBdTZQ==
X-Google-Smtp-Source: APiQypJ7xLpgA2fs5jFQEvaVnw4vhUqESLQXOCvR6dP5UKkaD9KJId/bfRKC+1ZG0jQztDpyaY0p0w==
X-Received: by 2002:a0c:a225:: with SMTP id f34mr22425301qva.179.1587512542003;
        Tue, 21 Apr 2020 16:42:22 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 16:42:21 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 9/9] drm/msm/a6xx: update a6xx_hw_init for A640 and A650
Date:   Tue, 21 Apr 2020 19:41:27 -0400
Message-Id: <20200421234127.27965-10-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421234127.27965-1-jonathan@marek.ca>
References: <20200421234127.27965-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adreno 640 and 650 GPUs need some registers set differently.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h | 14 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 56 ++++++++++++++++++++++-----
 2 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index ed78fee2a262..47840b73cdda 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1047,6 +1047,8 @@ enum a6xx_tex_type {
 
 #define REG_A6XX_CP_MISC_CNTL					0x00000840
 
+#define REG_A6XX_CP_APRIV_CNTL					0x00000844
+
 #define REG_A6XX_CP_ROQ_THRESHOLDS_1				0x000008c1
 
 #define REG_A6XX_CP_ROQ_THRESHOLDS_2				0x000008c2
@@ -1764,6 +1766,8 @@ static inline uint32_t A6XX_CP_PROTECT_REG_MASK_LEN(uint32_t val)
 
 #define REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL			0x00000010
 
+#define REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL			0x00000011
+
 #define REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL			0x0000001f
 
 #define REG_A6XX_RBBM_INT_CLEAR_CMD				0x00000037
@@ -2418,6 +2422,16 @@ static inline uint32_t A6XX_UCHE_CLIENT_PF_PERFSEL(uint32_t val)
 
 #define REG_A6XX_TPL1_NC_MODE_CNTL				0x0000b604
 
+#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0			0x0000b608
+
+#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1			0x0000b609
+
+#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2			0x0000b60a
+
+#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3			0x0000b60b
+
+#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4			0x0000b60c
+
 #define REG_A6XX_TPL1_PERFCTR_TP_SEL_0				0x0000b610
 
 #define REG_A6XX_TPL1_PERFCTR_TP_SEL_1				0x0000b611
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a860d4970e10..e1eb34fa3a99 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -414,7 +414,17 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 		a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
-	gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
+	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
+		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
+		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
+		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
+		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
+	} else {
+		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
+	}
+
 	if (adreno_is_a630(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
 
@@ -429,25 +439,35 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0xfffff000);
 	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
 
-	/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
-	gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
-		REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
+	if (!adreno_is_a650(adreno_gpu)) {
+		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
+		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
+			REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
 
-	gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX_LO,
-		REG_A6XX_UCHE_GMEM_RANGE_MAX_HI,
-		0x00100000 + adreno_gpu->gmem - 1);
+		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX_LO,
+			REG_A6XX_UCHE_GMEM_RANGE_MAX_HI,
+			0x00100000 + adreno_gpu->gmem - 1);
+	}
 
 	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
 	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 
-	gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
+	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
+	else
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
 	gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
 
 	/* Setting the mem pool size */
 	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
 	/* Setting the primFifo thresholds default values */
-	gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, (0x300 << 11));
+	if (adreno_is_a650(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300000);
+	else if (adreno_is_a640(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200000);
+	else
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, (0x300 << 11));
 
 	/* Set the AHB default slave response to "ERROR" */
 	gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
@@ -471,6 +491,19 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
 
+	/* Set weights for bicubic filtering */
+	if (adreno_is_a650(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
+			0x3fe05ff4);
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
+			0x3fa0ebee);
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
+			0x3f5193ed);
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+			0x3f0243f0);
+	}
+
 	/* Protect registers from the CP */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, 0x00000003);
 
@@ -508,6 +541,11 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 			A6XX_PROTECT_RDONLY(0x980, 0x4));
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(25), A6XX_PROTECT_RW(0xa630, 0x0));
 
+	if (adreno_is_a650(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_CP_APRIV_CNTL,
+			(1 << 6) | (1 << 5) | (1 << 3) | (1 << 2) | (1 << 1));
+	}
+
 	/* Enable interrupts */
 	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_INT_MASK);
 
-- 
2.26.1

