Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F303FD2D60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 17:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbfJJPNx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 11:13:53 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:42781 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJPNx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 11:13:53 -0400
Received: by mail-yw1-f65.google.com with SMTP id i207so2279487ywc.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ETAqkaGrUZ6wcJiRClzdVf0p22iN64aDCNAmSQb2kI=;
        b=Dz8qx3cl6V8r5hcyRxz0ifUK4tg8h9IuwrTeWgWDOmpVOeWGYEJ7wa9PdxnX4Dh7AM
         ncXNWRlMWxinr0zh1dUv/gTHragMFEKu1nciild7GOesGLsf406xt94bqScfEvLHTjzi
         P9qTWKBYunU844KzFMIdkZL/CZ6OQ8UD76SnoC4Hq+M7WjGc9QqL9WwFkwGbIusvZmZH
         lzVTGz2n6zL/cO/DcyIYly1Tq2H0pY8j+3B40frwKZWGBKYORBW/Gt/aKZoZYKNT/77j
         rmUdrJfBhhH5SxkmNFVgRAmBsGRqcJmyqqdXRzkiHwy+pm00oGkZGwymIlmpCr5jlnUO
         SLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ETAqkaGrUZ6wcJiRClzdVf0p22iN64aDCNAmSQb2kI=;
        b=jow021OBz+ojHOlba5aNWLb8tTOFJmVX3X1+upEAxvYZ8h7fj2IpkAHv3YNQUkJZRI
         LQwErgNPJhimD5AWVWaUdIzObhoPWpbgQl77PgC4P4zVbIacZwiuT+6qC64s6i3cFdAi
         9kls1eaFKdv2t4z1DoZBe5IURwvqL54EtcrwCU0H2GDJ0xzPw21LGwEV2EY0xFET26YK
         yXSGrAV86QAcrXbA5+0/6ewtK0OUgp4ZSW1krwp4C1Swo3GZZVyinya4pTwN6eCP7uJq
         8ivGf5+3ou+g093ejyZqatdhtp2nzua5pAe+jH5OtGPumixmjnYjrB20QkgrMZbWe8gA
         xaDg==
X-Gm-Message-State: APjAAAVmrE8SfJJjAlLrxO9ecOepbYq28H/XWI81Fr7Hso4fSXTa/k2+
        fj84myAMhH7ZMoqK2K9EbnwsxA==
X-Google-Smtp-Source: APXvYqz6i78IG2fD7IiQje6iL9Cb+MroBUgJuXZPwgwWNAKs6ZG6tZzGdvSBvRsa17xsCnto2rm+VA==
X-Received: by 2002:a0d:eb01:: with SMTP id u1mr7890799ywe.116.1570720432646;
        Thu, 10 Oct 2019 08:13:52 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id l77sm1425220ywb.32.2019.10.10.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 08:13:52 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] Revert "drm/msm: dpu: Add modeset lock checks where applicable"
Date:   Thu, 10 Oct 2019 11:13:21 -0400
Message-Id: <20191010151351.126735-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 1dfdb0e107dbe6ebff3f6bbbe4aad0b5aa87bba4.

As Daniel mentions in his email [1], non-blocking commits don't hold the
modeset locks, so we can safely access state as long as these functions
are in the commit path. I'm not entirely sure if these have always been
isolated to the commit path, but they seem to be now.

[1]- https://lists.freedesktop.org/archives/dri-devel/2019-October/239441.html

Fixes: 1dfdb0e107db ("drm/msm: dpu: Add modeset lock checks where applicable")
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Rob Clark <robdclark@chromium.org>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index db6c9ccf3be26..c645dd201368b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -282,8 +282,6 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 		return INTF_MODE_NONE;
 	}
 
-	WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
-
 	/* TODO: Returns the first INTF_MODE, could there be multiple values? */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		return dpu_encoder_get_intf_mode(encoder);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e393a423d7d7a..0e68e20d19c87 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -305,7 +305,6 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder)
 	if (funcs && funcs->commit)
 		funcs->commit(encoder);
 
-	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 	drm_for_each_crtc(crtc, dev) {
 		if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
 			continue;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

