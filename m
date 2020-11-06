Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56DAD2A8D1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 03:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgKFCpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 21:45:25 -0500
Received: from m176115.mail.qiye.163.com ([59.111.176.115]:53155 "EHLO
        m176115.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKFCpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 21:45:25 -0500
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by m176115.mail.qiye.163.com (Hmail) with ESMTPA id 3826B6668AC;
        Fri,  6 Nov 2020 10:45:21 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Wang Qing <wangqing@vivo.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Use IS_ERR() instead of IS_ERR_OR_NULL()
Date:   Fri,  6 Nov 2020 10:45:12 +0800
Message-Id: <1604630714-6163-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZH09NSEhCGU4aSh5OVkpNS09NSEtMSUpMQk5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxg6OTo4Nz8sSh0qPElDETQc
        NTMKCTZVSlVKTUtPTUhLTElJSU9IVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFJTUtJNwY+
X-HM-Tid: 0a759b71b4889373kuws3826b6668ac
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dev_pm_opp_find_freq_exact never return null but ERR_PTR(),so we
should use IS_ERR() to clarify and avoid compilation warnings.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8c81a89..6247397 100755
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -851,7 +851,7 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
 
 	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
-	if (IS_ERR_OR_NULL(gpu_opp))
+	if (IS_ERR(gpu_opp))
 		return;
 
 	gmu->freq = 0; /* so a6xx_gmu_set_freq() doesn't exit early */
@@ -865,7 +865,7 @@ static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
 
 	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
-	if (IS_ERR_OR_NULL(gpu_opp))
+	if (IS_ERR(gpu_opp))
 		return;
 
 	dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
-- 
2.7.4

