Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F296C74424
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 05:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfGYDxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 23:53:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43453 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbfGYDxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 23:53:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so15844873pld.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2019 20:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=y5mWEC7ogDY2PSdGXYMgqGEgddaBMGRrx0o4VSfwM/o=;
        b=YPWRGW5VmHNWo6GsrY3FzBl3NteVrMAlJZDe3aI5Qbe6y5GoO5iz1P+VoDpS114xir
         lnJQbc5weUseSt46orAnRfhtgU/fGYHAaJncUp0dU254Ien57uasz/8B2c8/2K/U8r0/
         SI6MS2x4qfFMTOZPT7DKM7mt3pqN0cBUoUDHoh/iM+ZC4NvBGXbCfcjt4Ksn8UYlfBB6
         e2HareCP+ntG+5Swk2Js+HaoQIKrGB7BK1KzTohZT6t55ozmluarZfKGJc0HAiaYXvBp
         EyZKEFpF0pr4jklKhXLmUMatasZm31V6OXaGTsCTUIv/F9V4mjXTBBTA+SUwlovdfdvU
         3U1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y5mWEC7ogDY2PSdGXYMgqGEgddaBMGRrx0o4VSfwM/o=;
        b=elYrMHa9zW3DdVdvxqOecD0isMGpx5dx384gxcF5S8u5YwqTJm0P20kQTTAmzf6Jqi
         4jP+fNckAT9Bo2UVmCQTuWha3SaspIAJqCw8oYob/lEnkBc/efsrsAUmAS636g/d0qe9
         qA8peCGNOiZNgHKQ+uKzGzJwiyxrycawoH2FH54Srl3zxD71vniwgb5NnTo5CvP0OIEK
         VgZQPwAynLwRLL0vaali4BLMDOgiE87Xtb/qPJYi2kchDRnjrEekt5nObiUzkx/YS8yd
         pHuHJNhEgtJgx8dVs7cA26jQeOzC1NgCRR7kCGhhxLfF2DQ9YwSa+WsrWaMucAtELivJ
         yRMg==
X-Gm-Message-State: APjAAAWl1SSAVCnGkPxMKntS7/yd+A41zsiyhYjSEIWKYxZpSPD2q0ww
        irMdt1zE/ks1CNuflAAmbso=
X-Google-Smtp-Source: APXvYqx9hemuW6yfJrdLe/W9cnYSkxCvTtjqmGP/oGqHMbl2olfl8tXQReuCOEwOZAZOQSmHSy68kw==
X-Received: by 2002:a17:902:296a:: with SMTP id g97mr87272714plb.115.1564026785497;
        Wed, 24 Jul 2019 20:53:05 -0700 (PDT)
Received: from huyue2.ccdomain.com ([218.189.10.173])
        by smtp.gmail.com with ESMTPSA id 11sm49035787pfw.33.2019.07.24.20.53.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 20:53:04 -0700 (PDT)
From:   Yue Hu <zbestahu@gmail.com>
To:     airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
        sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, cw00.choi@samsung.com,
        myungjoo.ham@samsung.com, huyue2@yulong.com, zhangwen@yulong.com
Subject: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND constant
Date:   Thu, 25 Jul 2019 11:52:39 +0800
Message-Id: <20190725035239.1192-1-zbestahu@gmail.com>
X-Mailer: git-send-email 2.17.1.windows.2
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Yue Hu <huyue2@yulong.com>

Since governor name is defined by DEVFREQ framework internally, use the
macro definition instead of using the name directly.

Signed-off-by: Yue Hu <huyue2@yulong.com>
---
 drivers/gpu/drm/msm/msm_gpu.c               | 3 ++-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4edb874..f7308d6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -95,7 +95,8 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	 */
 
 	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
-			&msm_devfreq_profile, "simple_ondemand", NULL);
+			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
+			NULL);
 
 	if (IS_ERR(gpu->devfreq.devfreq)) {
 		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index db79853..a7c18bc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -157,7 +157,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	dev_pm_opp_put(opp);
 
 	pfdev->devfreq.devfreq = devm_devfreq_add_device(&pfdev->pdev->dev,
-			&panfrost_devfreq_profile, "simple_ondemand", NULL);
+			&panfrost_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
+			NULL);
 	if (IS_ERR(pfdev->devfreq.devfreq)) {
 		DRM_DEV_ERROR(&pfdev->pdev->dev, "Couldn't initialize GPU devfreq\n");
 		ret = PTR_ERR(pfdev->devfreq.devfreq);
-- 
1.9.1

