Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4325D912
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 02:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfGCAds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 20:33:48 -0400
Received: from mail-qk1-f175.google.com ([209.85.222.175]:45543 "EHLO
        mail-qk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbfGCAds (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 20:33:48 -0400
Received: by mail-qk1-f175.google.com with SMTP id s22so363317qkj.12;
        Tue, 02 Jul 2019 17:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f88teEGjW0nN2FOE42nXfLv5A25XcE0eqQQ8ZnR07JU=;
        b=Ll0agao4aIAnYcVNBBJOi+jd2NnL7QD8TFl2aymNrYa8HK9DfMy3v495p9gROFHA/u
         tBjVOgT8daPT5d2w7eD0aIAJcOnV2Rm0aXDybT+G8nVx45y3yWG9lhFLBDmME6FqEjta
         Ijtfff8L3j7Mg5evQw8L84tr7CfFcwbnR7f3OrWMYv8cO2+3YB5og9XSOe+WXbhBmh0X
         zMnRegRXhZdqaIRGzM4fRFZzs3v+M9wwYnC0urB7YLmpETZ8ohPdGl9Q9vwZkX3eIeTH
         GDEss+h6oeE5WZoM2Or2mJg/DW82eGWfRdwgsyXaTb+yeU+DW8GtpUyBE2U19ecsdLAX
         3X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f88teEGjW0nN2FOE42nXfLv5A25XcE0eqQQ8ZnR07JU=;
        b=dkO8Oj1OO0+YaSFpUegTNolee5yulUY5/cVjPbgRPtMqn2pSeQgsPQLhqOZ4bZUlux
         jkzftMq913vFCIsMGpyibgCG+sa/xrnaAo+QrHvPkVrzIoMYo/+utm/Qj2C78oWoSDWz
         gp/j6RezdSqSYXelxp9U3I45oaQ4T0aEBmh+9KfLuGHPjvkC8ONFFvrsjHRySl8szcv6
         JL7q7Af5uxCrjC0IEl2l9CrJbY3l2RTOLI79lNZ2krzXWENmv5OiuV8ClfzKK41NSRhL
         n9QN9/GI0yvfvlB883Nek3eBBOA8NvojxYjwbPjTZSIPNWnbhxyM5DOjYxdp1Mevfp50
         yU8Q==
X-Gm-Message-State: APjAAAU7yd4BEcENQkH7qVDcnrOIDdQUW2OiCJtwD3a9S7SeCB5Sdqcu
        9Cki7Fl1iq8MRUheZRU7uZ46MZPJn0+xbQ==
X-Google-Smtp-Source: APXvYqwAlzApaqBBZtvqYr3CR/RH/kfQMFwRY/ZWxa5i4JJUxMfatKd6fTCEHxCx0jSEgts8E1Dq7w==
X-Received: by 2002:a37:a882:: with SMTP id r124mr27068226qke.398.1562099242989;
        Tue, 02 Jul 2019 13:27:22 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id r17sm10510qtf.26.2019.07.02.13.27.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 13:27:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Cc:     aarch64-laptops@lists.linaro.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Daniel Mack <daniel@zonque.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/msm: mark devices where iommu is managed by driver
Date:   Tue,  2 Jul 2019 13:26:19 -0700
Message-Id: <20190702202631.32148-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202631.32148-1-robdclark@gmail.com>
References: <20190702202631.32148-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 1 +
 drivers/gpu/drm/msm/msm_drv.c              | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index b907245d3d96..d9ac8c4cd866 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -441,6 +441,7 @@ static struct platform_driver adreno_driver = {
 		.name = "adreno",
 		.of_match_table = dt_match,
 		.pm = &adreno_pm_ops,
+		.driver_manages_iommu = true,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 39378ace57a6..001fa7986f31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1127,6 +1127,7 @@ static struct platform_driver dpu_driver = {
 		.name = "msm_dpu",
 		.of_match_table = dpu_dt_match,
 		.pm = &dpu_pm_ops,
+		.driver_manages_iommu = true,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 97179bec8902..2a1b8709d0dc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -1100,6 +1100,7 @@ static struct platform_driver mdp5_driver = {
 		.name = "msm_mdp",
 		.of_match_table = mdp5_dt_match,
 		.pm = &mdp5_pm_ops,
+		.driver_manages_iommu = true,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 31deb87abfc6..16094b8c5418 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1352,6 +1352,7 @@ static struct platform_driver msm_platform_driver = {
 		.name   = "msm",
 		.of_match_table = dt_match,
 		.pm     = &msm_pm_ops,
+		.driver_manages_iommu = true,
 	},
 };
 
-- 
2.20.1

