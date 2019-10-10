Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D19D3019
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 20:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfJJSSE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 14:18:04 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:36541 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfJJSSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 14:18:03 -0400
Received: by mail-yw1-f68.google.com with SMTP id x64so2521163ywg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I3NYY2QPFYsrCHTKk5YmsfIPZArib3V6JUbjM+pfbtk=;
        b=Pm7yW+Mlg8HU+zV5SUUYNHDjOvAKZ1fA3D1kZr0I20jfIJ5rXh7hg2VRVeR2WCgKhK
         G9hQeneR5KwXOwrRSb2fEDoAc/etxWRvyhPanSJk4ZQCq81q3w9Z9IzZkroaMsQUSuIA
         z1PARH9axbw/cdU78pIIsPdYGYega3Pk5wL9PvDKdmsAaLDUlsw5K2wqs/6nmmRUHHe/
         K5Rhz+qsTQ0aaSqpIOLcDb0eBmZVleFf1fM2lTUMLSvg9L0gKIUYG5wJHoJEHW2KuQ/0
         c/Y1o2qcJUbkfglW/N/gh8a0tNdgCPY7soKbleJeRN/57kTiaPn/S7Chk6/SPV1Unn0X
         /+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3NYY2QPFYsrCHTKk5YmsfIPZArib3V6JUbjM+pfbtk=;
        b=i3J0RD/uvlP9lziwcsBgoPymk4DaSN3S7Sit+Aq8ZWv3IbYzDgbhHiD+7czMUoE+GR
         Ltd2VYE2gx1efvnFWeesXFwvU6x6ieNqnstvv8/mHBjW6QFRtI+nlClFUpP5EKZDpQxc
         CcK3JyWJbxr0fn+EaI97gtYSbcwyEudak0QDAWH4UJZvnGs31mUhZSvsHjUjdcWaQn/o
         C2wX+pR/E+fd/9oyJpVYiqX13d+hoHfugsUXPk5iV6ECDrm8jCDu/NdcdYUd+Mjm/GZf
         e1tNrux3snIsYYTR/n4QpnvTpDRWafJlIq8twml1dYxrv37Zq1naAURvHBEW2SmwueWA
         bgPw==
X-Gm-Message-State: APjAAAV8CSdXb8YlcL1jfKYCSWkwbzLDMgi5Loq4w+mlmSYwEttauuaa
        71Df/30OHlpcDXJPkbMd5yc9Og==
X-Google-Smtp-Source: APXvYqwWkZ/j2WUxUMUi7rtAQr9RIGT9e9QFfEaeBR3++xYI0pkcWkRXA/IBRy8ly+roicnd6RA+vg==
X-Received: by 2002:a81:35cc:: with SMTP id c195mr8670868ywa.412.1570731482895;
        Thu, 10 Oct 2019 11:18:02 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id p199sm1528659ywe.1.2019.10.10.11.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 11:18:02 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm: Sanitize the modeset_is_locked checks in dpu
Date:   Thu, 10 Oct 2019 14:17:44 -0400
Message-Id: <20191010181801.186069-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
In-Reply-To: <CAKMK7uF2HsM5WrC5j_WNXWDjkXTyK5tP2DuoRt78FeaL5791QA@mail.gmail.com>
References: <CAKMK7uF2HsM5WrC5j_WNXWDjkXTyK5tP2DuoRt78FeaL5791QA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

As Daniel mentions in his email [1], non-blocking commits don't hold the
modeset locks, so we can safely access state as long as these functions
are in the commit path. So remove the WARN_ON in dpu_kms_encoder_enable.

In dpu_crtc_get_intf_mode, things are a bit more complicated. So keep
the WARN_ON, but add a comment explaining the situation and hope someone
comes along and fixes the issue.

[1]- https://lists.freedesktop.org/archives/dri-devel/2019-October/239441.html

Link to v1: https://patchwork.freedesktop.org/patch/msgid/20191010151351.126735-1-sean@poorly.run

Changes in v2:
- Restored the WARN_ON in get_intf_mode and added a clarifying comment (Daniel)

Fixes: 1dfdb0e107db ("drm/msm: dpu: Add modeset lock checks where applicable")
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Rob Clark <robdclark@chromium.org>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Partially-Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0b9dc042d2e22..f197dce545761 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -271,6 +271,15 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 		return INTF_MODE_NONE;
 	}
 
+	/*
+	 * TODO: This function is called from dpu debugfs and as part of atomic
+	 * check. When called from debugfs, the crtc->mutex must be held to
+	 * read crtc->state. However reading crtc->state from atomic check isn't
+	 * allowed (unless you have a good reason, a big comment, and a deep
+	 * understanding of how the atomic/modeset locks work (<- and this is
+	 * probably not possible)). So we'll keep the WARN_ON here for now, but
+	 * really we need to figure out a better way to track our operating mode
+	 */
 	WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
 
 	/* TODO: Returns the first INTF_MODE, could there be multiple values? */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index b1645ad83a1e1..6c92f0fbeac98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -316,7 +316,6 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder)
 	if (funcs && funcs->commit)
 		funcs->commit(encoder);
 
-	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 	drm_for_each_crtc(crtc, dev) {
 		if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
 			continue;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

