Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E5C40CE3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 22:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhIOUkq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 16:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhIOUkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 16:40:46 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A55C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 13:39:26 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id w17so3581299qta.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 13:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H84Fn7lFm82mhboBfZaDXvDO8OLx8vAai5mm15LtSck=;
        b=bxm40dBSdOV7+C8Kfmn1Pk+lmphP2jUaGJRdaCyHMS7ZSEsx5MyqJ0D+U7KjzIKbut
         MDIVwqLFf7zFNKMKiOCOqUUKALYNFpvKrjvfaL6PXKdzNT+ID+4zwbkgqncjTu9qA+SR
         0Biug/cYOSi137T2BNb2F5AZTum3lFK2iKb5cQB5EwM3a9GSsuaqrWWex4KLmjipgNQN
         VQWUx3eid1VLsZX7FYG9cXYzvtR4KaKciBKRt213SsMm9abrS+rkS/yTJWrWHJqPDyDF
         eUiMpnp1zKqkJxzUn9wz88tRSx4YGupJSarCLxloSCxsHA0N9O83N/IoPf9QWDsnnRZ6
         yhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H84Fn7lFm82mhboBfZaDXvDO8OLx8vAai5mm15LtSck=;
        b=qLtcIvj/ZW47en8IwdxBX1Tv8roOr1BgnCSGKSbCdJ1SAJ4jYDqFdIQ8RkSwpzG8iu
         w2HIDEwPp/f8eVd141SkxM5bDetA5Ou9EWdesIv+v6NqFShCH7ez2OHQDqfoQhv080En
         UPKGLN9hViBi6AfkeD0Ul7GLDqda7XXutuLti87mialjpp7MgLHL93wqa+29YqEeyMwN
         50Q4lJmOK8W5mazoPmq9ne0PaUk+PgHKU12spLXBhTRf9SSOsHU8TWGeNLaxkr9M4RQ6
         UQdgdaudujdmJDmgjC5rP3xg8ZSdQKVFHGf0SFGvlD55L+ytxGlyflF9hhJSc9KASa7d
         83sQ==
X-Gm-Message-State: AOAM533EshjmU2z/b7OBRgY5dJnL+t8p5mlSonqQYfU/a9ZXxK8KwDuo
        7QGK0jOVSs31II5gKGdc5rlbOw==
X-Google-Smtp-Source: ABdhPJyWd5G4I5a96EWMQ6pxXfznktirs46o5eNFcUrBk10T1Nr90SW76/dra1hpl3hbJwyooyMGaA==
X-Received: by 2002:ac8:7dc6:: with SMTP id c6mr1759681qte.25.1631738366022;
        Wed, 15 Sep 2021 13:39:26 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id a22sm739849qtd.56.2021.09.15.13.39.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 13:39:25 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 09/13] drm/msm/dpu: Remove useless checks in dpu_encoder
Date:   Wed, 15 Sep 2021 16:38:28 -0400
Message-Id: <20210915203834.1439-10-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

A couple more useless checks to remove in dpu_encoder.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1

Changes in v2:
-None
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

