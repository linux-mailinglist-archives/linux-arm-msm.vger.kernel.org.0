Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64F02FF0E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 17:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387818AbhAUQsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 11:48:32 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:58599 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387970AbhAUQg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 11:36:56 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4557158053F;
        Thu, 21 Jan 2021 11:35:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 21 Jan 2021 11:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=u6qmZQ3TqPtoD
        ImN0YR9CJdNLlRc7hNvw652XTlpNhc=; b=LxpWpLwFIMz21/nEX1D68JyNOnMBZ
        zh6m6D/E3j9Jm5Wo2gPqmbyiEOhQrG3wgqnhrVrJY+2hXGxKKZtQlv1J3II8+guq
        YlPo7yK2Xfkm8/Z0XLYpVVyU4uHZtrJC0WadooI7AiOAC3Hn4hr5PnVu7Z8G1y96
        PRmVOc59oZqgJTHbi//Gt+SPTYiTsmX4TuKtAxkd2elpsh462d0n0bDIONxTYgx0
        RDithrfPOcdOzV8hZfXgGfB8CuLFH6DmEkwuHpGBSqd2UiU1JH7JFhwfhcgV34pO
        yNWiRJHDLCPFVWPmOJA/GawXEHG5LFSj8yZoOAiYMRm8f8AaUdljrVCAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=u6qmZQ3TqPtoDImN0YR9CJdNLlRc7hNvw652XTlpNhc=; b=WqcK88s7
        VvKpS+UmzW5BWg5ACqusMLvsk1USv73DNDvgc6cpu8Eo2+yD0e4XYz0qWYgzUTQA
        tqsbUciKD6wk4/uzkSzvueMn57RZqEY3u/RCX6nsm6GCJCIwn9UW5tFma/pvtAvx
        Vs1VHkJwmBsTvz57lYD5isN52b+ghOXS9ejOS+wdLIFXQN5gvTW+MHC5/XXDygaN
        g1KpP5dHUjSjtND6Dg9LbA6rcFWHWBaON/5X8Ncd2D0CLKjNubi/qOehiQarY9Lz
        LesqMNV9pzLjIPVjY6BIVrhiflBhZHqN6Crm+qtIiHrohx3LHmrr0nDW+EMS2Q9m
        Li1IwNhCUTqQLQ==
X-ME-Sender: <xms:bK0JYNW62dvB17sPyem23MOYtOCEoGdMuc435dDh6wQXV9bg6_exsg>
    <xme:bK0JYNIpCsp4mkFa_QGHIX9ZnNmn012Uu93x8QAHzmCGv-eVRsb_OKZg6SYhK9-7y
    OZS_LB47LvZLlwIdr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bK0JYNsN-rM_nZSGUf7HSB-puqZ_zKARAM9kR-bhDPCXOa2YPM_nhw>
    <xmx:bK0JYC0orzolHreBNwlutXEUv_xqNZ6S5VXnHBfERZawiA3FWqkHcw>
    <xmx:bK0JYFMa5KwpLC0GESyM8SVDFIDwVIzGhdbQGz10VBQxvV6qpChkTQ>
    <xmx:bK0JYOQ7208ip6JZb3FB44OFBax9PWtydIyLJNA_E4NfNO2stQYnfA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 071C0108005B;
        Thu, 21 Jan 2021 11:35:55 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 06/11] drm: Use state helper instead of plane state pointer in atomic_check
Date:   Thu, 21 Jan 2021 17:35:31 +0100
Message-Id: <20210121163537.1466118-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121163537.1466118-1-maxime@cerno.tech>
References: <20210121163537.1466118-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many drivers reference the plane->state pointer in order to get the
current plane state in their atomic_check hook, which would be the old
plane state in the global atomic state since _swap_state hasn't happened
when atomic_check is run.

Use the drm_atomic_get_old_plane_state helper to get that state to make
it more obvious.

This was made using the coccinelle script below:

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

static struct drm_plane_helper_funcs helpers = {
	...,
	.atomic_check = func,
	...,
};

@ replaces_old_state @
identifier plane_atomic_func.func;
identifier plane, state, plane_state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state) {
 	...
-	struct drm_plane_state *plane_state = plane->state;
+	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
 	...
 }

@@
identifier plane_atomic_func.func;
identifier plane, state, plane_state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state) {
 	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
 	...
-	plane->state
+	plane_state
 	...
 }

@ adds_old_state @
identifier plane_atomic_func.func;
identifier plane, state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state) {
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	...
-	plane->state
+	old_plane_state
 	...
 }

@ include depends on adds_old_state || replaces_old_state @
@@

 #include <drm/drm_atomic.h>

@ no_include depends on !include && (adds_old_state || replaces_old_state) @
@@

+ #include <drm/drm_atomic.h>
  #include <drm/...>

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/imx/ipuv3-plane.c          | 3 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 4 +++-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c      | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index b5f6123850bb..6484592e3f86 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -341,7 +341,8 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
-	struct drm_plane_state *old_state = plane->state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_crtc_state *crtc_state;
 	struct device *dev = plane->dev->dev;
 	struct drm_framebuffer *fb = new_state->fb;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 4aac6217a5ad..6ce6ce09fecc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -406,12 +406,14 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 static int mdp5_plane_atomic_check(struct drm_plane *plane,
 				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
+										 plane);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 
-	crtc = new_plane_state->crtc ? new_plane_state->crtc : plane->state->crtc;
+	crtc = new_plane_state->crtc ? new_plane_state->crtc : old_plane_state->crtc;
 	if (!crtc)
 		return 0;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index ebdd42dcaf82..c86258132432 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -26,7 +26,8 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_crtc_state *crtc_state;
-	struct drm_plane_state *old_state = plane->state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	unsigned int pitch;
 
 	if (!new_state->crtc)
-- 
2.29.2

