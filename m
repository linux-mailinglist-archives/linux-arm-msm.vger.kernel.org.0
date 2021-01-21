Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801132FE92B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 12:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730362AbhAULrG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 06:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730217AbhAULVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 06:21:34 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AAAC0617B0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:19:18 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id n7so1172827pgg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lxCu1KRXdVN3L+OkUbo1cLFCc74qHBWwsGsHoVvYmGQ=;
        b=a87cJbhAisItlTCiddZHPHEtszqt8a4bVO1biv2X4xyyxixy0vT9T72gtaa3iyj1/S
         0BYSnHb7hnb7XQ1rwlEu5cBS3rWsXlBuzJ4FCOmHrteZ986iw9RUbu7t7crDd55rb+q0
         KYQl0KVBN5AykV+JO3HcTaywDinFAvXk5RBBj+bYE7h3h/GJhlpuhndjXEI073NQmGYd
         F8sCiXjYnLCSEiHzao8Cj5NEiGNRRhnEQY8ln7F6+OXeYTrLLExrly2aWRCNqMuVgIyM
         o+ZW521aJNq2QMtttfOcvWZ9gEK/aMtc7HonSr2L7N/XYDiInAo5mzdEK+TIZbY9C/Xa
         SMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxCu1KRXdVN3L+OkUbo1cLFCc74qHBWwsGsHoVvYmGQ=;
        b=dOchwD75EafGAIv7//CKYwRyDZsJtsA680MWlRyOscFL8MZgOUS4WnCZbO+md6rZe5
         Q1sSiygKUinVJonZKnag46Z8KQpW1Ai/mFqLzCABZw/IpxSMyS3TVnMWlc8YF80Nj0Sp
         hMLUGpbzveNQbP2VW/hK+t2fDpc8RjOuS14Gkp7Brobs0a+RD6gAzbj4/v8kV6g6HNA8
         XJDhy5fe1AwPBx+gqQmPKHmc8yGmHOgY14qshDG5AhUq+P+dTFfK04ecpH9PKZV/F+af
         iaBb3NAAXQb8xJg4Qaz5uAF4vLHBxSrePGUVrBWGzWa1dtHV8t14/5jxTBFFch5AqQhs
         FwNg==
X-Gm-Message-State: AOAM530RwDO6WL6ZUvpnfFLWctYMCwi9URI7YS6TDleysG3Z2cwEaKUt
        CtqP6VxX7mMrPzHcm7IF+QSuSw==
X-Google-Smtp-Source: ABdhPJxRoJPh+zCGLlNXEzcomeslehl5ItANfOXfCWt+o9vxW4dTT0mgqMj6QlfqpWP4MwpTT0cTAw==
X-Received: by 2002:a65:4083:: with SMTP id t3mr14089089pgp.150.1611227958549;
        Thu, 21 Jan 2021 03:19:18 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id f36sm6098298pjk.52.2021.01.21.03.19.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2021 03:19:17 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 12/13] drm: msm: Migrate to dev_pm_opp_set_opp()
Date:   Thu, 21 Jan 2021 16:47:52 +0530
Message-Id: <8d10f850eead0e91b1a0e20bd2ae449f4f4f8bb3.1611227342.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1611227342.git.viresh.kumar@linaro.org>
References: <cover.1611227342.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dev_pm_opp_set_bw() is getting removed and dev_pm_opp_set_opp() should
be used instead. Migrate to the new API.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e6703ae98760..05e0ef58fe32 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -134,7 +134,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 
 	if (!gmu->legacy) {
 		a6xx_hfi_set_freq(gmu, perf_index);
-		dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
+		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 		pm_runtime_put(gmu->dev);
 		return;
 	}
@@ -158,7 +158,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 	if (ret)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
 
-	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 	pm_runtime_put(gmu->dev);
 }
 
@@ -866,7 +866,7 @@ static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	if (IS_ERR_OR_NULL(gpu_opp))
 		return;
 
-	dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, gpu_opp);
 	dev_pm_opp_put(gpu_opp);
 }
 
@@ -1072,7 +1072,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 		a6xx_gmu_shutdown(gmu);
 
 	/* Remove the bus vote */
-	dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
 
 	/*
 	 * Make sure the GX domain is off before turning off the GMU (CX)
-- 
2.25.0.rc1.19.g042ed3e048af

