Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 717C274406
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 05:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389721AbfGYDg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 23:36:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37170 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389704AbfGYDg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 23:36:56 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so21974728pfa.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2019 20:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=y5mWEC7ogDY2PSdGXYMgqGEgddaBMGRrx0o4VSfwM/o=;
        b=RcA73rrAO55/gHOoxqi1LmtF8yacHdzQxlT+GcVs1ZywSerBvoobvmtsYWDMQHbJg1
         Skf0DzxVYolaM3PcWKODtiF2pShPT38EAc0cbTX/n/Xi/r3ChwvPW/RYHO4/I36MuuWJ
         F7KJEG8l/9Sn+2txeQX6frkSvWrX/kRnqW9BdGJN0M0tRDW2CVW+KxcBzO8O69NIepCb
         aRw4QlDfGH3z7kjFOuuNQaQVwAPyORRPJ+Pp49zt7qvIscVkTSapPOE9wL1jjXkuWSdI
         Js48Fx9ID+B8NYSy90cPWyoUyJvkAeba+FhJZI1Zy0M3yL5/2IuINFVuYn3R56eSbtPx
         YbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y5mWEC7ogDY2PSdGXYMgqGEgddaBMGRrx0o4VSfwM/o=;
        b=UqK69OQ3qIUAcM8R03V2pTiKQENtr6UKoIOK97i6gHyszVNWtNtvblCoAC4l8/JPRV
         IQTdyRts9O866/EXu/RZd/+iG7cdrbLX7elfiEPT+azjL6KHXA/4bOP5zt8KuzqeL0Zn
         nxyBAZ/iFyoOlXcjHgyAKtDK9rNnMlmxJlS80dprCkex1Jny4eXWM37o5PqX8+71G59R
         WzoDJexB8Zmo4ynVyiwQvYtMB4sYC2eQE82ekt+wT8hhEJGbFtzHokUdcHGIgT0RVvf+
         mA7Qs7jcRuqXtmSdOw/J4LuDicdwlEgqwEcfHJnNnj29CB1s+bAv0qn1a+dxSsdYej+B
         8Biw==
X-Gm-Message-State: APjAAAWVQHXnuO0amPxfIK6ML48Jf9jpUL3PRcKpUmnqug/WpyLEDaaI
        h6WtMC+VsOJ2niaJ8+2Cjzk=
X-Google-Smtp-Source: APXvYqwXGIrEshHJ/620ZjKabG/Vz5HjLWHyUhFB8umegovRT8FYTgXZAD3421HaW/F6oWwFLORuZQ==
X-Received: by 2002:a63:520f:: with SMTP id g15mr80162152pgb.28.1564025816100;
        Wed, 24 Jul 2019 20:36:56 -0700 (PDT)
Received: from huyue2.ccdomain.com ([218.189.10.173])
        by smtp.gmail.com with ESMTPSA id a1sm2056528pgh.61.2019.07.24.20.36.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 20:36:55 -0700 (PDT)
From:   Yue Hu <zbestahu@gmail.com>
To:     airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
        sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, huyue2@yulong.com,
        zhangwen@yulong.com
Subject: [PATCH] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND constant
Date:   Thu, 25 Jul 2019 11:36:15 +0800
Message-Id: <20190725033615.11388-1-zbestahu@gmail.com>
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

