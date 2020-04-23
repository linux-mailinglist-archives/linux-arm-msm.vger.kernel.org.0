Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EB51B65FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 23:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgDWVK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 17:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgDWVK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:59 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9658C09B043
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 14:10:58 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id v26so601394qto.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 14:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=19iG/yACSonzsO8vO7FObgRGDUOJ9AtxmYB1RErPuPs=;
        b=B2tF0pmRC2nQfzVjK2EZa6N8iBI0ITDQ/vF9N7y5Ves6IF8zoEsSSt/58G4bdf0y13
         5DzKee5oOE5yFPcdTR1E3/VpQbgIceEvxuAW5VgtjXaqksDCR7s4CWgvMHmqGk1SkE2w
         NvIvRNE2v7wRjhGJJpHtQFVY2G1/dQHP4jSsh/1fFWppaU+vrehMzbuEE1rlaoaOErDx
         uDxY8qDXXIsItfl9Aa3HCqnL8T2SsPIjz2WVHA3dGYIs0n1x8BbytDv9eTgUTEv9kEdi
         EwzvGJyoVTmSjFKIJvUXWRO/a5pcscJv43j49gybwr7gQ8d70swkW4kcQ/MvCPiKillm
         h7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=19iG/yACSonzsO8vO7FObgRGDUOJ9AtxmYB1RErPuPs=;
        b=Lsree+Zz5tVfUOkUXdnTx1gO1Q5HeIzfToasvZq64hjRFfUIehUFJTZxQ2MiVe7Bgi
         kNgHLFdycfTRZCRxOqtEEpVprRgbccxk3QaFQoMOJZRwwd1nyTbINu0wLIxhZLafeHTU
         +/oeSbkEMwTTec2ORi+EJDoexPbRgt6neQXBwaPcFahWlRGJO8A9PKI5wT+JpXC1rTbI
         9JrBdLNItNat3eKglq6LwXDPO5+D7lNYi96iB8MZrBatdXjA3Cf4yQvknLxM8R1gr5dQ
         YiAwRN2oMCMz/h426Dq8HK9JAnvftw3zRbFS3GG19UMEeUTJcHze7HtNCzRH6m406GGf
         ZV3w==
X-Gm-Message-State: AGi0Pua9Lg5QFIPPcfzm0UN/NkYHHI+vGmvb1LkE3RxAQxHPe+NVxHTp
        ucqOiMz7tFxbLr7YZv+IU55NLg==
X-Google-Smtp-Source: APiQypJqPGRuXdu6GPL58S20nDfuD0WZyJqqObtKVG3dSkyVZ/0pwGjAOFiDviXyfl8ly+A6xFSDug==
X-Received: by 2002:ac8:6799:: with SMTP id b25mr6188793qtp.54.1587676257958;
        Thu, 23 Apr 2020 14:10:57 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 14:10:57 -0700 (PDT)
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
Subject: [PATCH v3 9/9] drm/msm/a6xx: update a6xx_hw_init for A640 and A650
Date:   Thu, 23 Apr 2020 17:09:21 -0400
Message-Id: <20200423210946.28867-10-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
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

