Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754A7F8D31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 11:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKLKtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 05:49:07 -0500
Received: from onstation.org ([52.200.56.107]:48212 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbfKLKtH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 05:49:07 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 50CD63E994;
        Tue, 12 Nov 2019 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573555746;
        bh=56ifQmgIzk3QXd4ORBHCD/aXCQu1OaqK5LRDM7xRI0s=;
        h=From:To:Cc:Subject:Date:From;
        b=dWQQ90/o3DxsIwd6loRXS354139AX5Nqm5dr5Wlf342PS5ZdeV40xWKrb1AX1emWj
         vQidP1SbtQaohvBFo+ZiVZAbbbRstbVrK+LDNH3oreZ9w8bnYByy4gAuGvX4bM0QNS
         CBW2SxH0TXfba7EY8xTgeh86q6Yd1pYfvGuRO6d4=
From:   Brian Masney <masneyb@onstation.org>
To:     jeffrey.l.hugo@gmail.com, robdclark@chromium.org,
        robdclark@gmail.com
Cc:     freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        sean@poorly.run
Subject: [PATCH] drm/msm/mdp5: enable autocommit
Date:   Tue, 12 Nov 2019 05:48:54 -0500
Message-Id: <20191112104854.20850-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
support"), command-mode panels began throwing the following errors:

    msm fd900000.mdss: pp done time out, lm=0

Let's fix this by enabling the autorefresh feature that's available in
the MDP starting at version 1.0. This will cause the MDP to
automatically send a frame to the panel every time the panel invokes
the TE signal, which will trigger the PP_DONE IRQ. This requires not
sending a START signal for command-mode panels.

This fixes the error and gives us a counter for command-mode panels that
we can use to implement async commit support for the MDP5 in a follow up
patch.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 15 ++++++++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c  |  9 +--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 05cc04f729d6..539348cb6331 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -456,6 +456,7 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
+	struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct device *dev = &mdp5_kms->pdev->dev;
 
@@ -493,9 +494,21 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->err);
 
-	if (mdp5_cstate->cmd_mode)
+	if (mdp5_cstate->cmd_mode) {
 		mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->pp_done);
 
+		/*
+		 * Enable autorefresh so we get regular ping/pong IRQs.
+		 * - Bit 31 is the enable bit
+		 * - Bits 0-15 represent the frame count, specifically how many
+		 *   TE events before the MDP sends a frame.
+		 */
+		mdp5_write(mdp5_kms,
+			   REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp),
+			   BIT(31) | BIT(0));
+		crtc_flush_all(crtc);
+	}
+
 	mdp5_crtc->enabled = true;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b..aee295abada3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -187,14 +187,7 @@ static bool start_signal_needed(struct mdp5_ctl *ctl,
 	if (!ctl->encoder_enabled)
 		return false;
 
-	switch (intf->type) {
-	case INTF_WB:
-		return true;
-	case INTF_DSI:
-		return intf->mode == MDP5_INTF_DSI_MODE_COMMAND;
-	default:
-		return false;
-	}
+	return intf->type == INTF_WB;
 }
 
 /*
-- 
2.21.0

