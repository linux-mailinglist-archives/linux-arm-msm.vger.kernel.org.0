Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B289445CF4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352105AbhKXVmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346061AbhKXVku (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:50 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703A5C061574;
        Wed, 24 Nov 2021 13:37:40 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so6106376pja.1;
        Wed, 24 Nov 2021 13:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8cR2Y+uX8vVDrjMHw+aD7NNLHEizzFUKMzZGd0OO/tQ=;
        b=DNHqaPjtfvEq9kQLU9i+7ddrNHG+eAa6dSoHcfbT0frOtu2yHKBWuSQAC5kVp2auot
         o77TJdLzxjmR/8hGfhPiSe02pLBcxYmAVdVWmeD9kqT9JhLQmCk2HfAncbPoBcuCqTQi
         DhJ6Rr4nwg44U2DD0d4IgAroAQyqluJ9wKzpLjSiw8EhBfOGD628ruN7gsDQFehXVosA
         GPaicTyZOjXnXcXE+BKnOt5LDN9AyBLnmsWIVFWiJKIB/p2K3Zr2/XPoKyCKGw5pclMh
         QgNqUs15cYmYnoDTB/WsQF6ukX0qFa8VPFzfmfN+KFkHz5n+I+/AntqNy/i0zgTLp0vT
         db/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8cR2Y+uX8vVDrjMHw+aD7NNLHEizzFUKMzZGd0OO/tQ=;
        b=wnxoeAtGcqgVCND74tN1UhAp4IRInYC2lpvtC9+nOjRd0gdvvRZb6asnnrTtHbWr9y
         NdfPaErVdVhJpdSMjxCgOCAQNmHmLOcBfGMVq2d7q5WjexrFzfiFiMESvrcb/4gNUrif
         4lT9jZCNXJAt0uM2hxVlDTcXlRaP98ajEkMgbuU/+dsjgOBGf5TaPyGhRVZr1pVZBW+S
         Mj83oOib0juyMayQPawzVdpEcI/d00ztmpueP16e9t/xBAVdWDaWq2UYhke4UrXgo8h2
         a8k2/mLhMQJsXkTqgQ252xtgK7/WvvnVIfxXZ63tl12sauDY7JhPVsbUeuKTHBEpBxXt
         A3ug==
X-Gm-Message-State: AOAM533HPcX7FtWe7CGivbXQQdsC7oIXDGNEfVmVq/h8MIrv+jy1V1TT
        O9t3mN9RvogJgnrHOTN3Zk4=
X-Google-Smtp-Source: ABdhPJy/qt89x2ESb7NNGbAOo5VrcJZp7SdllwWJTZOxJIW11cj43KGhzdzJYYs52ELKCKLAiVT6vg==
X-Received: by 2002:a17:90b:4b89:: with SMTP id lr9mr230252pjb.49.1637789860041;
        Wed, 24 Nov 2021 13:37:40 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id o7sm536970pjf.33.2021.11.24.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:37:39 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Eric Anholt <eric@anholt.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/7] drm/msm/gpu: Add a comment in a6xx_gmu_init()
Date:   Wed, 24 Nov 2021 13:41:35 -0800
Message-Id: <20211124214151.1427022-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If you don't realize is_a650_family() also encompasses a660 family,
you'd think that the debug buffer is double allocated.  Add a comment
to make this more clear.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e1774ea342b1..3e325e2a2b1b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1531,6 +1531,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_memory;
 
+	/* Note that a650 family also includes a660 family: */
 	if (adreno_is_a650_family(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
 			SZ_16M - SZ_16K, 0x04000, "icache");
@@ -1547,6 +1548,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		if (ret)
 			goto err_memory;
 	} else {
+		BUG_ON(adreno_is_a660_family(adreno_gpu));
+
 		/* HFI v1, has sptprac */
 		gmu->legacy = true;
 
-- 
2.33.1

