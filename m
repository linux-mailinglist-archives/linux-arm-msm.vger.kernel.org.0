Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0482E6BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbfE2Uzc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:55:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57470 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfE2Uzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:55:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9554D61633; Wed, 29 May 2019 20:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163330;
        bh=B4EA6+W0bMBZWz+Img5LRozrErEZ8aBa+Kh0uCtpCTE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TcpYeA+J8rOgMttD2H3KglY6R7jLOe3K1UCH9fggHbm37SeKXGvlpRG3PHj1Amtse
         tg1kso1o1UcmG9bSW6+S996oydlPzSl+6tvffjQhBMLvh2iZCB/OcCZlkezQ6bn/Ta
         FSuHizi/9rAxav4AYWMWrNof19dPdqkHdvO7XXD8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C08B1613A7;
        Wed, 29 May 2019 20:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163326;
        bh=B4EA6+W0bMBZWz+Img5LRozrErEZ8aBa+Kh0uCtpCTE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NygVLsg7o0398FQypBvm8OZaapigH9X5AOxMFZdT6auiW/ETsNUtUV7r6kU3X2gl1
         TADVCcURJb6BUnGC1JAtZSaK8/2loVlhRuteIWQWUHegvJJCq8jrhQzgdoOJY4FRQQ
         NTh2B7FxYdeI5aTT/fi1HfujDCisLEKiFF1h3aSU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C08B1613A7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, Kees Cook <keescook@chromium.org>,
        Wen Yang <wen.yang99@zte.com.cn>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 07/16] drm/msm/adreno: Enable 64 bit mode by default on a5xx and a6xx targets
Date:   Wed, 29 May 2019 14:54:43 -0600
Message-Id: <1559163292-4792-8-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A5XX and newer GPUs can be run in either 32 or 64 bit mode. The GPU
registers and the microcode use 64 bit virtual addressing in either
case but the upper 32 bits are ignored if the GPU is in 32 bit mode.
There is no performance disadvantage to remaining in 64 bit mode even
if we are only generating 32 bit addresses so switch over now to prepare
for using addresses above 4G for targets that support them.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index e5fcefa..43a2b4a 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -642,6 +642,20 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
 	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
 
+	/* Put the GPU into 64 bit by default */
+	gpu_write(gpu, REG_A5XX_CP_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_VSC_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_GRAS_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_RB_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_PC_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_HLSQ_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_VFD_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_VPC_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_UCHE_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_SP_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_TPL1_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_ADDR_MODE_CNTL, 0x1);
+
 	ret = adreno_hw_init(gpu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1f9f4b0..be39cf0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -391,6 +391,20 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 		REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
 
+	/* Turn on 64 bit addressing for all blocks */
+	gpu_write(gpu, REG_A6XX_CP_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_VSC_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_GRAS_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_RB_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_PC_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_HLSQ_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_VFD_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_VPC_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_UCHE_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_SP_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_TPL1_ADDR_MODE_CNTL, 0x1);
+	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_ADDR_MODE_CNTL, 0x1);
+
 	/* enable hardware clockgating */
 	a6xx_set_hwcg(gpu, true);
 
-- 
2.7.4

