Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E94E925537
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbfEUQOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:14:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58948 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbfEUQOc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:14:32 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 19088611CF; Tue, 21 May 2019 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455271;
        bh=InvGDxgPTCcUkHbRKTYeQI7IV+iw8V8b8P4fscHa9hU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l3A8zLpF1pjzNQ9ayMq2k0CHRDj7PGCmWcbzGsHwsxQYhfquRXt81cJeJBh37/YOD
         auKRQSiuIdaKRkJAhCPku/PMRuL8hTHYagohY+Xopx9mZmZC8xnf1pAi4ovMBdJHI1
         q3kBPRncfVvV4n0mWaaf05+tc8HA5jSV04YWR8rM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 60FA76141D;
        Tue, 21 May 2019 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455258;
        bh=InvGDxgPTCcUkHbRKTYeQI7IV+iw8V8b8P4fscHa9hU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=USxml1cFYuyAi0WA8NIolqwyyDN1icihVZyjrOSALF/3iIJbVVWPTePugVv7Hl7Yn
         pe6ufZZ7EH2PTyLWfHR+lFSXCW1N1cJhNT2h80EfDJPjOfQlYgYzboyrDJ8LP+ePc6
         gcDyFo8Ri0jFiArioVbnlEh7uJzI3OmORMk3RZEU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60FA76141D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, Wen Yang <wen.yang99@zte.com.cn>,
        Kees Cook <keescook@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 06/15] drm/msm/adreno: Enable 64 bit mode by default on a5xx and a6xx targets
Date:   Tue, 21 May 2019 10:13:54 -0600
Message-Id: <1558455243-32746-7-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
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
index e74dce4..0b0dcd7 100644
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

