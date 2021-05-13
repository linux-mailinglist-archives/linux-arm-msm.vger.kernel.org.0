Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5089737FC4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 19:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhEMRS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 13:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbhEMRSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 13:18:54 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528A6C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 10:17:43 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id l129so26212524qke.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pIW1M607WOPkqZOWdsFBBxS0va9j8xicJ5rtae11iCQ=;
        b=BHccY3sJgxRFdz6S+NEyeeyF4HopzwD9eigjs+RUkqVACm9rQp8AIeLXzT/1R9KsD8
         m2fyk3tuYmhkRlm2qf79L5R+T8UIOmMsMnZyoFKRjoUC7WxbkaD74vg/7riCDUEo54D2
         Gx10zJIt7+dYQkCKh9giOE2ht43AZ5AdDFlQhn9SUZvK9heJZZZkEW7lV6S8wlI39YUK
         +NJAqckZA+CQ7AKyKGUwMEaXKwN5W9Cx54eoMcZnB3DEjPvw77PKCSb9OR9dvP64K7ub
         iWku8iwmB7Xcwr+qE+lhyzj+eetxYSli8ebo+uol0fRhnxlyKwI5XqJNrfYk+YT0/wXl
         rG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pIW1M607WOPkqZOWdsFBBxS0va9j8xicJ5rtae11iCQ=;
        b=DrcTbRxH+of4+P9u1GTKrpT1w+X4Z8lA85ZQDRya545TY/i6/nD/YBZy2PZeT3yTlI
         Q/xQtzZsM1G7EZlazp+k+si2LRQ3RcbZLUWQKaVgq3a1ICCOeXW6N0/Pw5alV0lV0tLB
         sbbVtSO/0PpiaSNHKTyoVSX3aWD3zs5Obw7p60xD7/PhJLGOUixQyAD9cCsmSNBwtwzA
         Ud3YDRTgvielKqiD4+jnzKyzkrF/oaizLxMeUGkai7aEcPw62BkwbfsLr+F955U8JlLc
         ALStDGvQERhYwBTZLD/kMiYY1+3lLuDvo+tQH1ArnGZPb+NRWdhxC2DPZ6kGqO/+nHEL
         zCeg==
X-Gm-Message-State: AOAM532smRb2Gxv+zjgtfV5wgFjFLSLy1TIdjWbI2PLBxOK0g9dQY2nF
        jgSW+ujqmVAA+4WM2bx49F7lHw==
X-Google-Smtp-Source: ABdhPJz2OiHdtJe5Ypg5Ccbh+40n1H1MCZpQSz05gcROdbgn3/fCIcP+Cbc4M5blD7QwheBIG/BhkA==
X-Received: by 2002:a37:e12:: with SMTP id 18mr38901864qko.419.1620926262479;
        Thu, 13 May 2021 10:17:42 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 10:17:42 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/8] drm/msm/a6xx: update/fix CP_PROTECT initialization
Date:   Thu, 13 May 2021 13:13:59 -0400
Message-Id: <20210513171431.18632-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513171431.18632-1-jonathan@marek.ca>
References: <20210513171431.18632-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update CP_PROTECT register programming based on downstream.

A6XX_PROTECT_RW is renamed to A6XX_PROTECT_NORDWR to make things aligned
and also be more clear about what it does.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 143 +++++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   2 +-
 2 files changed, 109 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 45a6a0fce7d7..909e3ff08f89 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -462,6 +462,113 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
 }
 
+/* For a615, a616, a618, A619, a630, a640 and a680 */
+static const u32 a6xx_protect[] = {
+	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
+	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
+	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
+	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
+	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
+	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
+	A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
+	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
+	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
+	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
+	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
+	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
+	A6XX_PROTECT_NORDWR(0x09e70, 0x0001),
+	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
+	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
+	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
+	A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
+	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x11c00, 0x0000), /* note: infinite range */
+};
+
+/* These are for a620 and a650 */
+static const u32 a650_protect[] = {
+	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
+	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
+	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
+	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
+	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
+	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
+	A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
+	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
+	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
+	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
+	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
+	A6XX_PROTECT_NORDWR(0x08e80, 0x027f),
+	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
+	A6XX_PROTECT_NORDWR(0x09e60, 0x0011),
+	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
+	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
+	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0b608, 0x0007),
+	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
+	A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
+	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1a800, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
+	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
+	A6XX_PROTECT_NORDWR(0x1f887, 0x001b),
+	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
+};
+
+static void a6xx_set_cp_protect(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const u32 *regs = a6xx_protect;
+	unsigned i, count = ARRAY_SIZE(a6xx_protect), count_max = 32;
+
+	BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
+	BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
+
+	if (adreno_is_a650(adreno_gpu)) {
+		regs = a650_protect;
+		count = ARRAY_SIZE(a650_protect);
+		count_max = 48;
+	}
+
+	/*
+	 * Enable access protection to privileged registers, fault on an access
+	 * protect violation and select the last span to protect from the start
+	 * address all the way to the end of the register address space
+	 */
+	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
+
+	for (i = 0; i < count - 1; i++)
+		gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	/* last CP_PROTECT to have "infinite" length on the last entry */
+	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
+}
+
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -776,41 +883,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Protect registers from the CP */
-	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, 0x00000003);
-
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(0),
-		A6XX_PROTECT_RDONLY(0x600, 0x51));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(1), A6XX_PROTECT_RW(0xae50, 0x2));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(2), A6XX_PROTECT_RW(0x9624, 0x13));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(3), A6XX_PROTECT_RW(0x8630, 0x8));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(4), A6XX_PROTECT_RW(0x9e70, 0x1));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(5), A6XX_PROTECT_RW(0x9e78, 0x187));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(6), A6XX_PROTECT_RW(0xf000, 0x810));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(7),
-		A6XX_PROTECT_RDONLY(0xfc00, 0x3));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(8), A6XX_PROTECT_RW(0x50e, 0x0));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(9), A6XX_PROTECT_RDONLY(0x50f, 0x0));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(10), A6XX_PROTECT_RW(0x510, 0x0));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(11),
-		A6XX_PROTECT_RDONLY(0x0, 0x4f9));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(12),
-		A6XX_PROTECT_RDONLY(0x501, 0xa));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(13),
-		A6XX_PROTECT_RDONLY(0x511, 0x44));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(14), A6XX_PROTECT_RW(0xe00, 0xe));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(15), A6XX_PROTECT_RW(0x8e00, 0x0));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(16), A6XX_PROTECT_RW(0x8e50, 0xf));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(17), A6XX_PROTECT_RW(0xbe02, 0x0));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(18),
-		A6XX_PROTECT_RW(0xbe20, 0x11f3));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(19), A6XX_PROTECT_RW(0x800, 0x82));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(20), A6XX_PROTECT_RW(0x8a0, 0x8));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(21), A6XX_PROTECT_RW(0x8ab, 0x19));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(22), A6XX_PROTECT_RW(0x900, 0x4d));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(23), A6XX_PROTECT_RW(0x98d, 0x76));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(24),
-			A6XX_PROTECT_RDONLY(0x980, 0x4));
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(25), A6XX_PROTECT_RW(0xa630, 0x0));
+	a6xx_set_cp_protect(gpu);
 
 	/* Enable expanded apriv for targets that support it */
 	if (gpu->hw_apriv) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ce0610c5256f..bb544dfe5737 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -44,7 +44,7 @@ struct a6xx_gpu {
  * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
  * registers starting at _reg.
  */
-#define A6XX_PROTECT_RW(_reg, _len) \
+#define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
 	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
 
-- 
2.26.1

