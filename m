Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9848330BFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 11:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfEaJqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 05:46:54 -0400
Received: from onstation.org ([52.200.56.107]:51350 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbfEaJqc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 05:46:32 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 0A4BB45087;
        Fri, 31 May 2019 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559295991;
        bh=khceW3oTDnZuJ9pCQ9vj4791T1g33OkiuYlCSUfX8j0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cmkYbBTl/UKUQ9orp1TlisQmqA+INlPv1u7NEMek2qgo2vUe+eoSaZafx4it1+KuN
         rs9EHcIADyUERvSQI1OkEwNU0ILrrEtm1/OM152c/KM0QrrCzqCQ2xE1uY8eZo+Nlc
         n28P7b4v5O+dPfwhkszVxukIDoKfETYyIfev66yA=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org, jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 2/6] drm/msm: add support for per-CRTC max_vblank_count on mdp5
Date:   Fri, 31 May 2019 05:46:15 -0400
Message-Id: <20190531094619.31704-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mdp5 drm/kms driver currently does not work on command-mode DSI
panels due to 'vblank wait timed out' errors. This causes a latency
of seconds, or tens of seconds in some cases, before content is shown
on the panel. This hardware does not have the something that we can use
as a frame counter available when running in command mode, so we need to
fall back to using timestamps by setting the max_vblank_count to zero.
This can be done on a per-CRTC basis, so the convert mdp5 to use
drm_crtc_set_max_vblank_count().

This change was tested on a LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 16 +++++++++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  2 +-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index c3751c95b452..6fde1097844f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -450,6 +450,18 @@ static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
 	mdp5_crtc->enabled = false;
 }
 
+static void mdp5_crtc_vblank_on(struct drm_crtc *crtc)
+{
+	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
+	struct mdp5_interface *intf = mdp5_cstate->pipeline.intf;
+	u32 count;
+
+	count = intf->mode == MDP5_INTF_DSI_MODE_COMMAND ? 0 : 0xffffffff;
+	drm_crtc_set_max_vblank_count(crtc, count);
+
+	drm_crtc_vblank_on(crtc);
+}
+
 static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_state)
 {
@@ -486,7 +498,7 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
 	}
 
 	/* Restore vblank irq handling after power is enabled */
-	drm_crtc_vblank_on(crtc);
+	mdp5_crtc_vblank_on(crtc);
 
 	mdp5_crtc_mode_set_nofb(crtc);
 
@@ -1039,6 +1051,8 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc)
 		mdp5_crtc_destroy_state(crtc, crtc->state);
 
 	__drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
+
+	drm_crtc_vblank_reset(crtc);
 }
 
 static const struct drm_crtc_funcs mdp5_crtc_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 97179bec8902..fcb0b0455abe 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -750,7 +750,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	dev->driver->get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos;
 	dev->driver->get_scanout_position = mdp5_get_scanoutpos;
 	dev->driver->get_vblank_counter = mdp5_get_vblank_counter;
-	dev->max_vblank_count = 0xffffffff;
+	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
 	return kms;
-- 
2.20.1

