Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B092F7B1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 13:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732728AbhAOM6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 07:58:46 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:58477 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732364AbhAOM6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 07:58:45 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id B71845807AE;
        Fri, 15 Jan 2021 07:57:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 15 Jan 2021 07:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=20G+8AUDU22Sj
        rSt9y/AHmfbcg6/OsfMLbojwU1KxMk=; b=GhsLhN2/szyLFn5d5Tb0XzfOyLiNb
        d+SL3mbsRnNzFfzDC2K8MD1GHi1UcnWahAFyV+aki0mvFZrrDYKidBSjE9uRNg3K
        +ELucy1OQGCMnvUwy5x/jHFO55D4FbwAc1/xSCkEgixycsT9oFjghZt5AFCsF2xy
        1o5WByvvujxz5yJ12ez1C1WwjLNbx6spS9zZUPzTs246W8Ns50f65nbZZPQdqMKo
        ocMwXdBgBheNS/3XyN16gtatLXSETq5nrUEbSoHNwH5etBxRY3fuw6TBuFmksbiz
        /pRHW6opAEVZjrHGp/5I0yD0v/6C4/oqwpAB07V2hdjDk5TQUWbzNgFdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=20G+8AUDU22SjrSt9y/AHmfbcg6/OsfMLbojwU1KxMk=; b=pOzQZXTh
        4ZbBQ7izLFNhvslsa3Vm4OoyljHVe2j7oFdETCmcW1NkWN20Z+VFrgwPLLo02N76
        76VcMWOMhKQ/5AFJKpsLGVWaD2s4xg/pzLkMOfwxMub3Q0DVdwPm4Lpa5RzvpvUc
        LcWXpUtGa9jvF21t4TOag2u4XF4na34oKfDGlRc9XFFG/dobT3N59e8CLERvpHap
        6Cmr7IPsfDVHIpZlforhTazajsxsz3ILDMWIFLql+SLsUN+f+gb08kjAJWvQZTV1
        0cjnjRL+esiyTUULBTekxk7Sm4RnvwjxYq51Tya9R+O3apYQjTxPpopcCu4LtA1Q
        01zQRjumf7bQzg==
X-ME-Sender: <xms:MJEBYEPD0l_yaSKmaPIYZNDxAjel6GF3Ef0HJCDey1rE_I-g_IKrsQ>
    <xme:MJEBYK9x5YvqZ7HIEYO9sX0fZSDZYF8dw4ACNWiaGIbOwCipVrFy9AR73h68WZ23B
    DSbfolhxWcDlF4J3cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MJEBYLT5iDt1unhJW198sPPEA-WKy99chq_L7BHmIWUX_2cdXT40tw>
    <xmx:MJEBYMt1ffhAKzrI_Q9dAmdHUm5-v5T4dUaqli8SNvk7S7PkaVHB2A>
    <xmx:MJEBYMdNp2LvnCtDBAIVO_2TJ67mVfa8JaS7bza72GYkNcKWUiTgtw>
    <xmx:MJEBYPUWWOdeWE8aBjl_Yn5z5v0QS1v4r91Qhv1Eui6LEvQD_ECZUQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 45B5B1080059;
        Fri, 15 Jan 2021 07:57:20 -0500 (EST)
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
Subject: [PATCH 06/10] drm: Use state helper instead of plane state pointer in atomic_check
Date:   Fri, 15 Jan 2021 13:56:58 +0100
Message-Id: <20210115125703.1315064-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115125703.1315064-1-maxime@cerno.tech>
References: <20210115125703.1315064-1-maxime@cerno.tech>
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
index bf8058bb8206..6b49688652f0 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -348,7 +348,8 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
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

