Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB2F2B1C83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 14:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgKMNvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 08:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbgKMNuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:24 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BFEC0617A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:23 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a65so8578344wme.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d6lq2kh1bZp3yhcGfeiEHDwnp2cd/bsKGg4wlUbbQco=;
        b=liXP1wPmh8wR4oCpiWLxjCT2ucLqXmhJW9hBhLmCuS2Dw+DxXfaS3Nhq+rOb69vSw+
         wua+tblw52CIqa1EEgbkMfUTv51OsuRqFGxnMUXf/FVRJ69Fj1YlCvRUwqIrCAeY8SyV
         jGDkpGrlt2UsQKML1I6Ztdj0/Y9sZxdmmU4WiYIcOWDf6w8QYcKvAe3ryVMgC5LhnkXS
         iImRStUf1I50U6tw56MEwasDaAirLNzUTDRUImy927MNB6VA4og5IOp6C8B2QNO6W1df
         H5FEfc9/OqdcuKLM4Q6qAg4JRSq9mPJgH/Utrlt7d48G7wN+snqKZX1pVytc3fzlrp2a
         XFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d6lq2kh1bZp3yhcGfeiEHDwnp2cd/bsKGg4wlUbbQco=;
        b=ivSl491wzs3ew1l/Q5g+b+y+6na5F5BTT3wgN7ieQR+AYeR4Hoecrmp6+wnsn4B4ph
         VOZw+shA9A/VK7rPAR9mW95lr0PcM5Udz22+qT4DroUN+agrZyPhWlwG11myIibnnm2k
         TjiMlQ3cWE8GW0YreL19cFMtA7jXSz2HwFi8zfaA0+sQfqvThkXF/ViKkTkh1Nprul3w
         dGfdXdtfqOXlRBbLHUcpbxeE58riC/sXBlq/eV4rI+UmYuQ4KqPm1YOkyRPvYpfpHkaE
         mOL4EJF6IRVTf0RBfhPBkF6rP3d2Tpy/GO7EjV1ofllddpKi3yGsEXo1wLHNhLtD2sYN
         gmBA==
X-Gm-Message-State: AOAM532BnSnG0TPgX5V1wHn4kfODebXgClZRLiP7tOf92P8234e4Dqnh
        zzrSXNA7G5cSztW17nT68J6Ugg==
X-Google-Smtp-Source: ABdhPJwPa1pit579Xq6kQ/E4Sbx3I4WTKhrO1w9SYQ9TNstqb4RqB6CPSGlqJPfhNK+IoC4qO99TVg==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr2663287wmc.186.1605275421972;
        Fri, 13 Nov 2020 05:50:21 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:21 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 32/40] drm/msm/disp/mdp5/mdp5_crtc: Make local function 'mdp5_crtc_setup_pipeline()' static
Date:   Fri, 13 Nov 2020 13:49:30 +0000
Message-Id: <20201113134938.4004947-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:581:5: warning: no previous prototype for ‘mdp5_crtc_setup_pipeline’ [-Wmissing-prototypes]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 79dd56faf3de0..0c8f9f88301fa 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -578,9 +578,9 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
 	mdp5_crtc->enabled = true;
 }
 
-int mdp5_crtc_setup_pipeline(struct drm_crtc *crtc,
-			     struct drm_crtc_state *new_crtc_state,
-			     bool need_right_mixer)
+static int mdp5_crtc_setup_pipeline(struct drm_crtc *crtc,
+				    struct drm_crtc_state *new_crtc_state,
+				    bool need_right_mixer)
 {
 	struct mdp5_crtc_state *mdp5_cstate =
 			to_mdp5_crtc_state(new_crtc_state);
-- 
2.25.1

