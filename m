Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7C151B572
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 03:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbiEEB7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 21:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236517AbiEEB7d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 21:59:33 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890473878F
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 18:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651715755; x=1683251755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IvNrUCQoVha9VJ29n1DumUXaf15DUs3puLErsozaFps=;
  b=uevg7Gji0z2rCSm31pL2M+MrxuMxMWd4jOXJw8J3+wJkX/We8jiZWCTW
   TMBS56WkHjJ5xMN8TfiHAytA8VnaAFJZCsSqOsDSJ8VrK+TFMR7TpuHkm
   OdXnO7M+ZDxC1UH+TD8exVAJSGUdnKO/kJgqeXQv1YrDJASOxbD/C59fG
   A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 May 2022 18:55:55 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 18:55:54 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 18:55:54 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm/mdp5: Return error code in mdp5_pipe_release when deadlock is detected
Date:   Wed, 4 May 2022 18:55:28 -0700
Message-ID: <20220505015528.344-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mdp5_get_global_state runs the risk of hitting a -EDEADLK when acquiring
the modeset lock, but currently mdp5_pipe_release doesn't check for if
an error is returned. Because of this, there is a possibility of
mdp5_pipe_release hitting a NULL dereference error.

To avoid this, let's have mdp5_pipe_release check if
mdp5_get_global_state returns an error and propogate that error.

Changes since v1:
- Separated declaration and initialization of *new_state to avoid
  compiler warning
- Fixed some spelling mistakes in commit message

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
index ba6695963aa6..97887a2be082 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
@@ -119,18 +119,23 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 	return 0;
 }
 
-void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
+int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
 {
 	struct msm_drm_private *priv = s->dev->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_global_state *state = mdp5_get_global_state(s);
-	struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
+	struct mdp5_hw_pipe_state *new_state;
 
 	if (!hwpipe)
-		return;
+		return -EINVAL;
+
+	if (IS_ERR(state))
+		return PTR_ERR(state);
+
+	new_state = &state->hwpipe;
 
 	if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
-		return;
+		return -EINVAL;
 
 	DBG("%s: release from plane %s", hwpipe->name,
 		new_state->hwpipe_to_plane[hwpipe->idx]->name);
@@ -141,6 +146,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
 	}
 
 	new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
+
+	return 0;
 }
 
 void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
index 9b26d0761bd4..cca67938cab2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
@@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 		     uint32_t caps, uint32_t blkcfg,
 		     struct mdp5_hw_pipe **hwpipe,
 		     struct mdp5_hw_pipe **r_hwpipe);
-void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
+int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
 
 struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
 		uint32_t reg_offset, uint32_t caps);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 228b22830970..979458482841 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 				mdp5_state->r_hwpipe = NULL;
 
 
-			mdp5_pipe_release(state->state, old_hwpipe);
-			mdp5_pipe_release(state->state, old_right_hwpipe);
+			ret = mdp5_pipe_release(state->state, old_hwpipe);
+			if (ret)
+				return ret;
+
+			ret = mdp5_pipe_release(state->state, old_right_hwpipe);
+			if (ret)
+				return ret;
+
 		}
 	} else {
-		mdp5_pipe_release(state->state, mdp5_state->hwpipe);
-		mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
+		ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
+		if (ret)
+			return ret;
+
+		ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
+		if (ret)
+			return ret;
+
 		mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
 	}
 
-- 
2.35.1

