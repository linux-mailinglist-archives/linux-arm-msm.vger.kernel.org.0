Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAC72A34F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 21:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgKBUNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 15:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgKBUMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 15:12:41 -0500
X-Greylist: delayed 595 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 02 Nov 2020 12:12:40 PST
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F057FC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 12:12:40 -0800 (PST)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E34CA3E7B1;
        Mon,  2 Nov 2020 21:02:41 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     robdclark@gmail.com
Cc:     konrad.dybcio@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Eric Anholt <eric@anholt.net>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: a5xx: Make preemption reset case reentrant
Date:   Mon,  2 Nov 2020 21:02:25 +0100
Message-Id: <20201102200227.8876-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

nr_rings is reset to 1, but when this function is called for a second
(and third!) time nr_rings > 1 is false, thus the else case is entered
to set up a buffer for the RPTR shadow and consequently written to
RB_RPTR_ADDR, hanging platforms without WHERE_AM_I firmware support.

Restructure the condition in such a way that shadow buffer setup only
ever happens when has_whereami is true; otherwise preemption is only
finalized when the number of ring buffers has not been reset to 1 yet.

Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index d6804a802355..9a202a7da131 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -755,12 +755,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_CP_RB_CNTL,
 		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
 
-	/* Disable preemption if WHERE_AM_I isn't available */
-	if (!a5xx_gpu->has_whereami && gpu->nr_rings > 1) {
-		a5xx_preempt_fini(gpu);
-		gpu->nr_rings = 1;
-	} else {
-		/* Create a privileged buffer for the RPTR shadow */
+	/* Create a privileged buffer for the RPTR shadow */
+	if (a5xx_gpu->has_whereami) {
 		if (!a5xx_gpu->shadow_bo) {
 			a5xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
 				sizeof(u32) * gpu->nr_rings,
@@ -774,6 +770,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
 			REG_A5XX_CP_RB_RPTR_ADDR_HI, shadowptr(a5xx_gpu, gpu->rb[0]));
+	} else if (gpu->nr_rings > 1) {
+		/* Disable preemption if WHERE_AM_I isn't available */
+		a5xx_preempt_fini(gpu);
+		gpu->nr_rings = 1;
 	}
 
 	a5xx_preempt_hw_init(gpu);
-- 
2.29.2

