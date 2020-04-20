Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD411B0DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 16:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgDTOEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 10:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729552AbgDTOEM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 10:04:12 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB35C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:04:11 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id w24so8442843qts.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=19iG/yACSonzsO8vO7FObgRGDUOJ9AtxmYB1RErPuPs=;
        b=V0CHeAcblkoxsNZlcLugfNlyjTr+UnWk431ep8VpgvVY/GPtWORg5yJbjNibxa0cnJ
         7JCY7SKuS1qCFqEBHY3xeWbwI+9W9Db7hzB2jqXFlysuzzCAXWAROwBK6V0W/6LsgMpo
         mnCHjhUmAQbUyPnyRSlmVC/GkqCoHr1+SXnrydAHfv7MwncD/e+TzqCPQ2nHC4jWMQv+
         UPOwnAugt7wsmTxhHt/QVRiZOhSLrUVAlGBeJo8briBj6AMivSi78xKMvz0vAIN1CVMA
         sPmHe5ik/IDHVPYX6GQTfJr98hyD+tTCFvaUdkWXt80zQf9OT+qeXy1BTmreuiIkZgfM
         YdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=19iG/yACSonzsO8vO7FObgRGDUOJ9AtxmYB1RErPuPs=;
        b=P6Ldo0VFWrB+nUJpMUnrsIEfB64mgfvt/rt/l2B5uwiis3UEffhGthEF9VrLKLebvG
         JWhPVW+pTkEUjxDAexejsi/iP5fAW+hqu2DMwtYw4kOzlNAkJTAmyFk4b8fNSmClhc2p
         JWDyGIvCUcA8MYz5fLghzRybeNaZuwQFoA0nDGl9wqTgfDArIngP3axzigJS3M4PXzSp
         V9WQXQgV7LyaH/A5ugbQHklN2GTIDc+PIJvCfDs03uhrTLV9vFrG6J8cs8aSyamh8RMu
         7aIUNjr8D7IvAu7Vc6ZuF+CPk8Ry02zDcE4os+nyIRM+HkE8sjGVAslTEgVJnj3nFzHh
         RF0g==
X-Gm-Message-State: AGi0PuaMxYTA8DXvhdLafwWyIYVnIDMiWiz8xLzb80b+zj0DvcTeZj/M
        UbM/FDVdxvl/qOK9HhF6DaDr6Q==
X-Google-Smtp-Source: APiQypJzX5iggTdUCC7BVdyDcUZ8ng4HAs6wGL1czn9J5/2tSYuOX4vyD0ndCWr9ALBFV26b/CYMxQ==
X-Received: by 2002:ac8:180f:: with SMTP id q15mr15962384qtj.42.1587391450999;
        Mon, 20 Apr 2020 07:04:10 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 07:04:10 -0700 (PDT)
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
Subject: [PATCH 9/9] drm/msm/a6xx: update a6xx_hw_init for A640 and A650
Date:   Mon, 20 Apr 2020 10:03:13 -0400
Message-Id: <20200420140313.7263-10-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
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

