Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0CB31214C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Feb 2021 05:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhBGET4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Feb 2021 23:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbhBGETl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Feb 2021 23:19:41 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A8EC061788
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Feb 2021 20:19:01 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id m12so6396380pjs.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Feb 2021 20:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZuUSwDW1QlcZo//J19uXwwWVGrMnsuuGUvOzqh+LAAY=;
        b=XbbuIvVB/Ar1MJ2wdsGeAVmm5p6lIIZF+uPoC8txf+bsyY+gXm7mABMOlXwcXtMySh
         IgKTNiebjanc1weOVklTRdteWOdNyAZnvKgBSPlksrIeCsPCJx5MfazXzP9otQ6hMPuE
         ExCwcvR0YnaeyPfBJ8uG+HlkNc8RkYzTWFUpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZuUSwDW1QlcZo//J19uXwwWVGrMnsuuGUvOzqh+LAAY=;
        b=dIiiYgr0RSTbOKuzu1m9/V+ERBB80n/rU9Pn08Bhg5sfDfozBmFWEmK2leCx6r9d0s
         RrTu9lkytV6Tym2NRLYlc7x3l6DDIlc9guvNIfhvepRc3dq9J6IsZroTiGzyLL6TJyaJ
         7WDH2rZN/+jLvXtRe9pGF+iFm6I406yD5tnK+z0Ev7U+1EjAr6fcL2GzD3cANDRbNIkj
         2oD5jtUvvuucbn1ysFhqv9230avUELSX0mzgKB5PCYceuLQnqYy0gG7khJR4qcU6IMRN
         w+E5MgVXMHXFfG+1OIkqDHZpfJPiKESBDc9AKlu5CCIpQIx071DLLSKaNb1+tSXN08M9
         q3XQ==
X-Gm-Message-State: AOAM533c06JmTC7ahyv1qVdraXuj6Eca64VeDq3qGW4ywM36aBJnS9xW
        oOi4IOijTH0lEf/ZaJxGdakiQoolJTv1Ow==
X-Google-Smtp-Source: ABdhPJzCyWtt6C/0vpNQnL1jkMGfNzMDP+aZniFfVTygDhZAtTN6sXQlhcGUh44k9O7mvq9Xen522w==
X-Received: by 2002:a17:90b:1a86:: with SMTP id ng6mr10787360pjb.113.1612671540567;
        Sat, 06 Feb 2021 20:19:00 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:2c64:7ee8:fefb:fab2])
        by smtp.gmail.com with ESMTPSA id 76sm14392262pfz.174.2021.02.06.20.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 20:18:59 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] drm/msm/dp: Add a missing semi-colon
Date:   Sat,  6 Feb 2021 20:18:58 -0800
Message-Id: <20210207041858.3317171-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A missing semicolon here causes my external display to stop working.
Indeed, missing the semicolon on the return statement leads to
dp_panel_update_tu_timings() not existing because the compiler thinks
it's part of the return statement of a void function, so it must not be
important.

  $ ./scripts/bloat-o-meter before.o after.o
  add/remove: 1/1 grow/shrink: 0/1 up/down: 7400/-7540 (-140)
  Function                                     old     new   delta
  dp_panel_update_tu_timings                     -    7400   +7400
  _dp_ctrl_calc_tu.constprop                 18024   17900    -124
  dp_panel_update_tu_timings.constprop        7416       -   -7416
  Total: Before=54440, After=54300, chg -0.26%

Add a semicolon so this function works like it used to.

Cc: Sean Paul <sean@poorly.run>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: Lee Jones <lee.jones@linaro.org>
Fixes: cc9014bf63a4 ("drm/msm/dp/dp_ctrl: Move 'tu' from the stack to the heap")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 55b7d0edffbf..95913db97616 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -631,7 +631,7 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
 
 	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
 	if (!tu)
-		return
+		return;
 
 	dp_panel_update_tu_timings(in, tu);
 

base-commit: ce5226625a694fa5a46db241ac4c77a1430e37fe
-- 
https://chromeos.dev

