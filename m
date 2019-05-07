Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A0D16B25
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 21:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbfEGTSb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 15:18:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50340 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfEGTSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 15:18:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 372EA613A6; Tue,  7 May 2019 19:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256702;
        bh=n+MGgOW7piyvsLsiVz/M/CyxjIEwd0g1M8E54rA5OVg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XG/3PAjd3WWpDHySxnHlAoJmdQ/JzF+lVfkHPu6yin5Aw/Rv6yS9jdBaY5LmfD1kn
         JPaJUAcKISSpQJqSCraF25qJCrzoPSJIA2DB8mE4+z8NG35O1dpKPjGcmCW3csir/F
         64SJASZYmCHovA74fKd+aoD3UGhkVAo7eT2BInFM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B6F861344;
        Tue,  7 May 2019 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256700;
        bh=n+MGgOW7piyvsLsiVz/M/CyxjIEwd0g1M8E54rA5OVg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eFfbIWItF/1Ia0+70Hz48u0g8rIP3oXgcQpDfC6oBcWjbpdil1uo5O6RwQwydYh07
         pQ2Kr5Ni0EQl56N1vkSl6uYx9brD+FodCxLuBgQxLs9+8dyxL/LCufzJFdjQAKO9cT
         7XaYv2nAsslmO1lik9eirL/extk5jcKdrUhW+PY8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B6F861344
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Andy Gross <andy.gross@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Mack <daniel@zonque.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/msm/adreno: Call pm_runtime_force_suspend() during unbind
Date:   Tue,  7 May 2019 13:18:11 -0600
Message-Id: <1557256691-25798-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
References: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU specific pm_suspend code assumes that the hardware is active
when the function is called, which it usually is when called as part
of pm_runtime.  But during unbind, the pm_suspend functions are called
blindly resulting in a bit of a when the hardware wasn't already
active (or booted, in the case of the GMU).

Instead of calling the pm_suspend function directly, use
pm_runtime_force_suspend() which should check the correct state of
runtime and call the functions on our behalf or skip them if they are
not needed.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 4 +---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9155daf..447706d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1230,9 +1230,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	if (IS_ERR_OR_NULL(gmu->mmio))
 		return;
 
-	a6xx_gmu_stop(a6xx_gpu);
-
-	pm_runtime_disable(gmu->dev);
+	pm_runtime_force_suspend(gmu->dev);
 
 	if (!IS_ERR(gmu->gxpd)) {
 		pm_runtime_disable(gmu->gxpd);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index b907245..3dd90df 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -351,7 +351,7 @@ static void adreno_unbind(struct device *dev, struct device *master,
 {
 	struct msm_gpu *gpu = dev_get_drvdata(dev);
 
-	gpu->funcs->pm_suspend(gpu);
+	pm_runtime_force_suspend(dev);
 	gpu->funcs->destroy(gpu);
 
 	set_gpu_pdev(dev_get_drvdata(master), NULL);
-- 
2.7.4

