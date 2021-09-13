Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC40409B78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 19:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344259AbhIMR7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 13:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239541AbhIMR7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 13:59:51 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5F8C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:35 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id a66so11546715qkc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M+6WaFPuJNdulE2a71MWNvhB4HPvAyDmtnLHBKmekCU=;
        b=PKMyuyd9+YkMiZsAsexpW3DBB1F7oyi/nm4F/w7UslRR542ivJ5iyxBN+WbK56b7mo
         LQ67aEy5Vx2EQZr877k1fxvFMSikgFMlYqLwLZJV3q9iC0RPq4zGvjBGjLuWKaDj8D7i
         wfsi///GS5B+pNWTH+JB5XFmDuMlpk6vMDQ+bnpIDj3ay47Mf7pz3K+ovl9IBedLuinV
         qJZEP47RH9/V91WEdeDSR5/KxkvZwrd+VhZkL9ubhg8xxyBu5ggwhBlyykt+42VnirI0
         jIa28TMnbWzrrCc7nnj1Q2J79i3U9I7+bO6Eh78elFVSNGF+3nOI3bM3CgSxm/7hd9Xi
         GERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M+6WaFPuJNdulE2a71MWNvhB4HPvAyDmtnLHBKmekCU=;
        b=KqdPzdOlk5FEMKAGklAxxJOogc4lExoVWwx7x6kM6mDCDBSB0SFWUW2BkhAq49il4c
         FrclE7eCFAJWAkLxsOjpirIqEVxA+k6OdOrbBTEy8F2+SJQB+cHTAE8t9lT7g6CyCuKL
         GUQmLdxqrMzQ3ZWuXcSELpsLDdcCc4tSGifxKtPm0aDXAfb8Iwabpua6LqGNuD3ZPGFB
         3FOsjPtAYX7VSVl+TZXJAtbq/sTnFhIzjeCaYwYejyIceiT1Hq9iah0zk6aruDDBO3qX
         CphYzorF6F5QyIIItpGBBoLHHhZEXLf0UWZ++WRA3X35o+5YQ6BfLpJkwiVMll4T33Ul
         RTsQ==
X-Gm-Message-State: AOAM533oJUdF+49kw4wtRw3b8E8J9UF5nK8YYzEOrydIdqtpe3S2EFaF
        SkzXXyimwDMw0qunx9H2q3mfUfefHTF8lg==
X-Google-Smtp-Source: ABdhPJwl+Td2WMm8W4F3OofmEcObzvIvucw3dtD/kh41IeSvVHSFPiXgVUnsjCdQKbfmKKO+iNP+8A==
X-Received: by 2002:ae9:ef96:: with SMTP id d144mr870327qkg.9.1631555914473;
        Mon, 13 Sep 2021 10:58:34 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id p123sm5989677qke.94.2021.09.13.10.58.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 10:58:34 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 09/14] drm/msm/dpu: Remove useless checks in dpu_encoder
Date:   Mon, 13 Sep 2021 13:57:40 -0400
Message-Id: <20210913175747.47456-10-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

A couple more useless checks to remove in dpu_encoder.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e9d3fa1544b..984f8a59cb73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1153,10 +1153,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -1203,14 +1199,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	int i = 0;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	} else if (!drm_enc->dev) {
-		DPU_ERROR("invalid dev\n");
-		return;
-	}
-
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

