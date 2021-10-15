Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0D542FE91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 01:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239010AbhJOXN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 19:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238986AbhJOXN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 19:13:26 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31226C061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 16:11:19 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so3971765otr.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HUmZDgtmuXy7pQJ38Tzw5qxbkrp4xNejQK3lDNZjLFg=;
        b=vkr6f/Hnqm9g23KalLp7H/Lvpczy/LuFqXn7egw6IF25H2KapElTrVg3Oqh1ajaUZY
         ulzMIZfZog772rpAe5L1W7zbyXfyvIJ+b8YfW/EWJ/n7Ono02IFwDP58Tl7GGuhp3RNn
         a/IUG0Fj6kytSJpwHC6E9t/JWfxDXMxBV5F3XYTdPqwAWsIsIor7koJ8WK5B5Pv3jmSU
         rOOEO8VcI2OecCLlM/twc+zcaPYuWkg+Q9q13hisWtswSTJK5QRvsD7VxwS6nNUcSIgB
         pipXe5b7SwCtu69ZrAhp/LhgXR6gPTNVPqedmym1S5l34I4IvmgPInmbyuYxoH28qvkF
         O1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HUmZDgtmuXy7pQJ38Tzw5qxbkrp4xNejQK3lDNZjLFg=;
        b=RxXJzpEFaXsRZ033jkgw0IPRunRwPjt3+vWJOjJ8uH+/bXXJgM3Fu7Dajaq2g7+lJW
         1qcti3ClxJI2/L0XJYjdRnUbvh+DENb8I4k5wB+M4cdoenXLkvM8+YtFNV4AmdUqBf2M
         d7pb5iUHSUaAjo5tF7d7XbBZDx64BGGXiD4igxrvcrjYITAscidn98Hq2Lsw19zfgLnf
         2ko/39CeSVScc0Kz06v3VeB6yjcHFaGa/f6D15Is3FArhpkGk6Bc8nTMUSIgmLUqnmoD
         19PZ66rup0JxU2+gHAJGKgq3d3044s4BGX0wS9mCRORMxgHImcYxwaK+J7sWZB1855Al
         3CUA==
X-Gm-Message-State: AOAM53149UkbpWH2qZ08jF5xfzeatj3g6Om970PlFp4Ja62Vb5vq6cIX
        vmWhcIyJ5KujovjYF0vanshjoEGRXUjCDg==
X-Google-Smtp-Source: ABdhPJzF/3yWadmmoHsXojqWAjiA8AD4RF0snFNDRgkCZDIdsm7bW/taSm0djFzOBF5ICbjuMjL3OA==
X-Received: by 2002:a9d:a61:: with SMTP id 88mr10612502otg.152.1634339478519;
        Fri, 15 Oct 2021 16:11:18 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 103sm1527969otj.44.2021.10.15.16.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:11:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: Only create debugfs for PRIMARY minor
Date:   Fri, 15 Oct 2021 16:13:07 -0700
Message-Id: <20211015231307.1784165-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_kms_debugfs_init() and hence dp_debug_get() gets invoked for each
minor being registered. But dp_debug_get() will allocate a new struct
dp_debug for each call and this will be associated as dp->debug.

As such dp_debug will create debugfs files in both the PRIMARY and the
RENDER minor's debugfs directory, but only the last reference will be
remembered.

The only use of this reference today is in the cleanup path in
dp_display_deinit_sub_modules() and the dp_debug_private object does
outlive the debugfs entries in either case, so there doesn't seem to be
any adverse effects of this, but per the code the current behavior is
unexpected, so change it to only create dp_debug for the PRIMARY minor.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3aa67c53dbc0..06773b58bb60 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -10,6 +10,7 @@
 #include <linux/component.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
+#include <drm/drm_file.h>
 #include <drm/drm_panel.h>
 
 #include "msm_drv.h"
@@ -1463,6 +1464,10 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 	dev = &dp->pdev->dev;
 
+	/* Only create one set of debugfs per DP instance */
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return;
+
 	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
 					dp->link, dp->dp_display.connector,
 					minor);
-- 
2.29.2

