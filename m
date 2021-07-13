Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FA93C7593
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 19:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhGMRRI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 13:17:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25030 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhGMRRH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 13:17:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626196457; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5ILuZ7SWoWEhdwMo5jhwP5i1sCLD6tJKUIb5xpgE1DU=; b=pTZFUT+K+R/3F2ePAN0iz9jhzPutyV1hXcD4jJ08ZpOeEIOf40W3UIQvBAhqHwqZbgfC8MwC
 o8sckVvw0QY88MBgtLQLHUD8rA5gNprx7r7ex6aF5XUbdHrkhzKxZYVbClaikRg3OexpsDyP
 6Stx6CHPgTJW6f04tY0dd82Z/2c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60edc9d3dc4628fe7ee3e171 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 17:13:55
 GMT
Sender: gracan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2484C43217; Tue, 13 Jul 2021 17:13:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-gracan-sd.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gracan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AD5CC433F1;
        Tue, 13 Jul 2021 17:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5AD5CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=gracan@codeaurora.org
From:   Grace An <gracan@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Grace An <gracan@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        pdhaval@codeaurora.org, abhinavk@codeaurora.org,
        dmitry.baryshkov@linaro.org, daniel@ffwll.ch
Subject: [RFC] drm: return int error code from mode_fixup
Date:   Tue, 13 Jul 2021 10:13:41 -0700
Message-Id: <1626196421-24595-1-git-send-email-gracan@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When CONFIG_PROVE_LOCKING is defined, the kernel randomly injects
-EDEADLK errors for all the ww_mutex. This results in
drm_atomic_get_private_obj_state randomly returning -EDEADLK.
However, the mode_fixup functions do not propagate these error
codes and return false, causing the atomic commit to fail with
-EINVAL instead of retrying.

Change encoder, crtc, and bridge mode_fixup functions to return
an int instead of a boolean to indicate success or failure. If
any of these functions fail, the mode_fixup function now returns
the provided integer error code instead of -EINVAL.

This change needs modifications across drivers, but before submitting
the entire change, we want to get feedback on this RFC.

Signed-off-by: Grace An <gracan@codeaurora.org>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 8 ++++----
 drivers/gpu/drm/drm_bridge.c             | 4 ++--
 include/drm/drm_bridge.h                 | 2 +-
 include/drm/drm_modeset_helper_vtables.h | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f2b3e28..d75f09a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -457,10 +457,10 @@ mode_fixup(struct drm_atomic_state *state)
 		} else if (funcs && funcs->mode_fixup) {
 			ret = funcs->mode_fixup(encoder, &new_crtc_state->mode,
 						&new_crtc_state->adjusted_mode);
-			if (!ret) {
+			if (ret) {
 				DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] fixup failed\n",
 						 encoder->base.id, encoder->name);
-				return -EINVAL;
+				return ret;
 			}
 		}
 	}
@@ -481,10 +481,10 @@ mode_fixup(struct drm_atomic_state *state)
 
 		ret = funcs->mode_fixup(crtc, &new_crtc_state->mode,
 					&new_crtc_state->adjusted_mode);
-		if (!ret) {
+		if (ret) {
 			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] fixup failed\n",
 					 crtc->base.id, crtc->name);
-			return -EINVAL;
+			return ret;
 		}
 	}
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0eff..3ad16b5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -736,9 +736,9 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 		if (ret)
 			return ret;
 	} else if (bridge->funcs->mode_fixup) {
-		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
+		if (bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
 					       &crtc_state->adjusted_mode))
-			return -EINVAL;
+			return ret;
 	}
 
 	return 0;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa..5d02dfc 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -153,7 +153,7 @@ struct drm_bridge_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_bridge *bridge,
+	int (*mode_fixup)(struct drm_bridge *bridge,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 	/**
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index f3a4b47..e305c97 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -184,7 +184,7 @@ struct drm_crtc_helper_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_crtc *crtc,
+	int (*mode_fixup)(struct drm_crtc *crtc,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 
@@ -599,7 +599,7 @@ struct drm_encoder_helper_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_encoder *encoder,
+	int (*mode_fixup)(struct drm_encoder *encoder,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

