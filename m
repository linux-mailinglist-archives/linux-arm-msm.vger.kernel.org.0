Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763BD31F8D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 13:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhBSMBv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 07:01:51 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45503 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230398AbhBSMBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 07:01:45 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id AF14F580397;
        Fri, 19 Feb 2021 07:00:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 19 Feb 2021 07:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=5Tbpk8lLe0abZZOtTtYNztvodP
        XTjdzL6GgPnDfiZi0=; b=OXBHDwzZ3CTVOHKBL2dI9NWQi21AOMcV6x/JaX9U2g
        eTeKnsmX7PkRpxVm2GQcjNv5v9FTi2fC6XDYgywOkXsJ1iCxYJbz4kvm2KTjIosr
        hTb/9lUOaCohO3JXU/TSwWQ2t1xxlh3EGqOxXLTMxEuF0pdKZHHQtyTGw2CK+r2q
        NNXL01KLYS+maORXoNg01ZmcVk3EuBCW7inh3b/iT5RmTgCQSt+QCFfT0FeF5DBY
        Uz3i1SGa+j+M/Fc0hUYmixhC3dV2/yxlCtxKiw/j7YvAtB8ClPuAnCQDHbmv/CuW
        hwmh+tFa1MtK32+89b3CX376Ia7RcharxFtxySpGfpLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5Tbpk8lLe0abZZOtT
        tYNztvodPXTjdzL6GgPnDfiZi0=; b=IojNK/d/MWgs99XNTlLZTA8a5ESi5Hk/4
        MG5F0UMBHwsDDT2Fwl5qL5DFUCF2pMBwlBlO9+GV5rbmR37QP45zI3v/CSokiONw
        FzaOJCdHH+hXSFkp0P8eOE+VzsyqOaSg1f63sH5B9xrr6UosT5+cnj/waqOMLjcS
        NQMgvNMtEqVP5MPE3unyG9Yd9RHRDAyFqmZQ97XdvUE3EqveD8kioCldMAgQdeSQ
        d3YUdmS4wXx+NsKwLWEaFAXZVG3Smvz6r0hACme9W0hCwtp9S60IB18cchU+3n6/
        labvZuD2El+m4FCeeMxSNAToVBTGRa2hx9YTZhB3RNmemspBoO5Sw==
X-ME-Sender: <xms:YqgvYPDmkBsIuKgNrDzklOHUEkNQPvGfQ3zPg5DwRxMHDPeuJHu3Dw>
    <xme:YqgvYHhfkG1XsPwSL44DXG-9jC8zNdcCEUbl0ezaR8ZKF_h3p9vGA0rC52w35HgpD
    G2m7e8hOXvi_EQAZV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
    ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YqgvYD_3U9ex-97m3XSZngbSId_BC8AEIgSsDVAE7-Tt8b7G70OO_w>
    <xmx:YqgvYD_VG1AlwkZGZlQbMi8zmqsjJw2SzDZKkQOEK7yCMW5YJ5xuvg>
    <xmx:YqgvYMBSLxfJ2cvqIaBcj41VZu3JMGSBMfnbvOT9llS6Kvfp0kp9ZQ>
    <xmx:ZagvYItoMY0fH7jG_XGnBHUO4qNe9I4NbDtiXyF4iac0l6n_LrPXrw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6C067240066;
        Fri, 19 Feb 2021 07:00:34 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Eric Anholt <eric@anholt.net>, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 01/11] drm/atomic: Pass the full state to planes async atomic check and update
Date:   Fri, 19 Feb 2021 13:00:21 +0100
Message-Id: <20210219120032.260676-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current atomic helpers have either their object state being passed as
an argument or the full atomic state.

The former is the pattern that was done at first, before switching to the
latter for new hooks or when it was needed.

Let's start convert all the remaining helpers to provide a consistent
interface, starting with the planes atomic_async_check and
atomic_async_update.

The conversion was done using the coccinelle script below, built tested on
all the drivers.

@@
identifier plane, plane_state;
symbol state;
@@

 struct drm_plane_helper_funcs {
 	...
	int (*atomic_async_check)(struct drm_plane *plane,
-				  struct drm_plane_state *plane_state);
+				  struct drm_atomic_state *state);
	...
 }

@@
identifier plane, plane_state;
symbol state;
@@
 struct drm_plane_helper_funcs {
 	...
	void (*atomic_async_update)(struct drm_plane *plane,
-				    struct drm_plane_state *plane_state);
+				    struct drm_atomic_state *state);
	...
 }

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

(
 static const struct drm_plane_helper_funcs helpers = {
	...,
 	.atomic_async_check = func,
	...,
 };
|
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_async_update = func,
 	...,
 };
)

@@
struct drm_plane_helper_funcs *FUNCS;
identifier f;
identifier dev;
identifier plane, plane_state, state;
@@

 f(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	<+...
-	FUNCS->atomic_async_check(plane, plane_state)
+	FUNCS->atomic_async_check(plane, state)
 	...+>
 }

@@
struct drm_plane_helper_funcs *FUNCS;
identifier f;
identifier dev;
identifier plane, plane_state, state;
@@

 f(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	<+...
-	FUNCS->atomic_async_update(plane, plane_state)
+	FUNCS->atomic_async_update(plane, state)
 	...+>
 }

@@
identifier mtk_plane_atomic_async_update;
identifier plane;
symbol new_state, state;
expression e;
@@

  void mtk_plane_atomic_async_update(struct drm_plane *plane, struct drm_plane_state *new_state)
{
  ...
- struct mtk_plane_state *state = e;
+ struct mtk_plane_state *new_plane_state = e;
  <+...
-       state
+       new_plane_state
  ...+>
  }

@@
identifier plane_atomic_func.func;
identifier plane;
symbol state;
@@

 func(struct drm_plane *plane,
-    struct drm_plane_state *state)
+    struct drm_plane_state *new_plane_state)
 {
	<...
-	state
+	new_plane_state
	...>
 }

@ ignores_new_state @
identifier plane_atomic_func.func;
identifier plane, new_plane_state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *new_plane_state)
 {
	... when != new_plane_state
 }

@ adds_new_state depends on plane_atomic_func && !ignores_new_state @
identifier plane_atomic_func.func;
identifier plane, new_plane_state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *new_plane_state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
 	...
 }

@ depends on plane_atomic_func @
identifier plane_atomic_func.func;
identifier plane, plane_state;
@@

 func(struct drm_plane *plane,
-     struct drm_plane_state *plane_state
+     struct drm_atomic_state *state
     )
 { ... }

@ include depends on adds_new_state @
@@

 #include <drm/drm_atomic.h>

@ no_include depends on !include && adds_new_state @
@@

+ #include <drm/drm_atomic.h>
  #include <drm/...>

@@
identifier plane_atomic_func.func;
identifier plane, state;
identifier plane_state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state) {
        ...
        struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
        <+...
-       plane_state->state
+       state
        ...+>
 }

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Updated the comment according to Thomas suggestions
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++-
 drivers/gpu/drm/drm_atomic_helper.c           |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      | 26 +++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 33 ++++++-----
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 16 ++++--
 drivers/gpu/drm/vc4/vc4_plane.c               | 56 ++++++++++---------
 include/drm/drm_modeset_helper_vtables.h      | 18 +++---
 7 files changed, 89 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6ed96633425f..63f839679a0a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6468,7 +6468,7 @@ static int dm_plane_atomic_check(struct drm_plane *plane,
 }
 
 static int dm_plane_atomic_async_check(struct drm_plane *plane,
-				       struct drm_plane_state *new_plane_state)
+				       struct drm_atomic_state *state)
 {
 	/* Only support async updates on cursor planes. */
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
@@ -6478,10 +6478,12 @@ static int dm_plane_atomic_async_check(struct drm_plane *plane,
 }
 
 static void dm_plane_atomic_async_update(struct drm_plane *plane,
-					 struct drm_plane_state *new_state)
+					 struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_plane_state *old_state =
-		drm_atomic_get_old_plane_state(new_state->state, plane);
+		drm_atomic_get_old_plane_state(state, plane);
 
 	trace_amdgpu_dm_atomic_update_cursor(new_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9fa3f97223a1..bd0bb74437c7 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1742,7 +1742,7 @@ int drm_atomic_helper_async_check(struct drm_device *dev,
 		return -EBUSY;
 	}
 
-	return funcs->atomic_async_check(plane, new_plane_state);
+	return funcs->atomic_async_check(plane, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_async_check);
 
@@ -1772,7 +1772,7 @@ void drm_atomic_helper_async_commit(struct drm_device *dev,
 		struct drm_framebuffer *old_fb = plane->state->fb;
 
 		funcs = plane->helper_private;
-		funcs->atomic_async_update(plane, plane_state);
+		funcs->atomic_async_update(plane, state);
 
 		/*
 		 * ->atomic_async_update() is supposed to update the
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 92141a19681b..30ebcfd8832f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -77,12 +77,14 @@ static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
 }
 
 static int mtk_plane_atomic_async_check(struct drm_plane *plane,
-					struct drm_plane_state *state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	if (plane != state->crtc->cursor)
+	if (plane != new_plane_state->crtc->cursor)
 		return -EINVAL;
 
 	if (!plane->state)
@@ -91,16 +93,16 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 	if (!plane->state->fb)
 		return -EINVAL;
 
-	ret = mtk_drm_crtc_plane_check(state->crtc, plane,
-				       to_mtk_plane_state(state));
+	ret = mtk_drm_crtc_plane_check(new_plane_state->crtc, plane,
+				       to_mtk_plane_state(new_plane_state));
 	if (ret)
 		return ret;
 
-	if (state->state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-								state->crtc);
+	if (state)
+		crtc_state = drm_atomic_get_existing_crtc_state(state,
+								new_plane_state->crtc);
 	else /* Special case for asynchronous cursor updates. */
-		crtc_state = state->crtc->state;
+		crtc_state = new_plane_state->crtc->state;
 
 	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
 						   DRM_PLANE_HELPER_NO_SCALING,
@@ -109,9 +111,11 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 }
 
 static void mtk_plane_atomic_async_update(struct drm_plane *plane,
-					  struct drm_plane_state *new_state)
+					  struct drm_atomic_state *state)
 {
-	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
+	struct mtk_plane_state *new_plane_state = to_mtk_plane_state(plane->state);
 
 	plane->state->crtc_x = new_state->crtc_x;
 	plane->state->crtc_y = new_state->crtc_y;
@@ -122,7 +126,7 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->src_h = new_state->src_h;
 	plane->state->src_w = new_state->src_w;
 	swap(plane->state->fb, new_state->fb);
-	state->pending.async_dirty = true;
+	new_plane_state->pending.async_dirty = true;
 
 	mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 83423092de2f..05fa8255caeb 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -5,6 +5,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
@@ -438,41 +439,43 @@ static void mdp5_plane_atomic_update(struct drm_plane *plane,
 }
 
 static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
-					 struct drm_plane_state *state)
+					 struct drm_atomic_state *state)
 {
-	struct mdp5_plane_state *mdp5_state = to_mdp5_plane_state(state);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct mdp5_plane_state *mdp5_state = to_mdp5_plane_state(new_plane_state);
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 	int ret;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-							state->crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
+							new_plane_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (!crtc_state->active)
 		return -EINVAL;
 
-	mdp5_state = to_mdp5_plane_state(state);
+	mdp5_state = to_mdp5_plane_state(new_plane_state);
 
 	/* don't use fast path if we don't have a hwpipe allocated yet */
 	if (!mdp5_state->hwpipe)
 		return -EINVAL;
 
 	/* only allow changing of position(crtc x/y or src x/y) in fast path */
-	if (plane->state->crtc != state->crtc ||
-	    plane->state->src_w != state->src_w ||
-	    plane->state->src_h != state->src_h ||
-	    plane->state->crtc_w != state->crtc_w ||
-	    plane->state->crtc_h != state->crtc_h ||
+	if (plane->state->crtc != new_plane_state->crtc ||
+	    plane->state->src_w != new_plane_state->src_w ||
+	    plane->state->src_h != new_plane_state->src_h ||
+	    plane->state->crtc_w != new_plane_state->crtc_w ||
+	    plane->state->crtc_h != new_plane_state->crtc_h ||
 	    !plane->state->fb ||
-	    plane->state->fb != state->fb)
+	    plane->state->fb != new_plane_state->fb)
 		return -EINVAL;
 
 	min_scale = FRAC_16_16(1, 8);
 	max_scale = FRAC_16_16(8, 1);
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale, max_scale,
 						  true, true);
 	if (ret)
@@ -485,15 +488,17 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
 	 * also assign/unassign the hwpipe(s) tied to the plane. We avoid
 	 * taking the fast path for both these reasons.
 	 */
-	if (state->visible != plane->state->visible)
+	if (new_plane_state->visible != plane->state->visible)
 		return -EINVAL;
 
 	return 0;
 }
 
 static void mdp5_plane_atomic_async_update(struct drm_plane *plane,
-					   struct drm_plane_state *new_state)
+					   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_framebuffer *old_fb = plane->state->fb;
 
 	plane->state->src_x = new_state->src_x;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 8d15cabdcb02..fefeab73ca27 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1021,8 +1021,10 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 }
 
 static int vop_plane_atomic_async_check(struct drm_plane *plane,
-					struct drm_plane_state *state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
 	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
@@ -1031,7 +1033,7 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
 					DRM_PLANE_HELPER_NO_SCALING;
 	struct drm_crtc_state *crtc_state;
 
-	if (plane != state->crtc->cursor)
+	if (plane != new_plane_state->crtc->cursor)
 		return -EINVAL;
 
 	if (!plane->state)
@@ -1040,9 +1042,9 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
 	if (!plane->state->fb)
 		return -EINVAL;
 
-	if (state->state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-								state->crtc);
+	if (state)
+		crtc_state = drm_atomic_get_existing_crtc_state(state,
+								new_plane_state->crtc);
 	else /* Special case for asynchronous cursor updates. */
 		crtc_state = plane->crtc->state;
 
@@ -1052,8 +1054,10 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
 }
 
 static void vop_plane_atomic_async_update(struct drm_plane *plane,
-					  struct drm_plane_state *new_state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct vop *vop = to_vop(plane->state->crtc);
 	struct drm_framebuffer *old_fb = plane->state->fb;
 
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 6bd8260aa9f2..ff485e58d271 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1118,32 +1118,34 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 }
 
 static void vc4_plane_atomic_async_update(struct drm_plane *plane,
-					  struct drm_plane_state *state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct vc4_plane_state *vc4_state, *new_vc4_state;
 
-	swap(plane->state->fb, state->fb);
-	plane->state->crtc_x = state->crtc_x;
-	plane->state->crtc_y = state->crtc_y;
-	plane->state->crtc_w = state->crtc_w;
-	plane->state->crtc_h = state->crtc_h;
-	plane->state->src_x = state->src_x;
-	plane->state->src_y = state->src_y;
-	plane->state->src_w = state->src_w;
-	plane->state->src_h = state->src_h;
-	plane->state->src_h = state->src_h;
-	plane->state->alpha = state->alpha;
-	plane->state->pixel_blend_mode = state->pixel_blend_mode;
-	plane->state->rotation = state->rotation;
-	plane->state->zpos = state->zpos;
-	plane->state->normalized_zpos = state->normalized_zpos;
-	plane->state->color_encoding = state->color_encoding;
-	plane->state->color_range = state->color_range;
-	plane->state->src = state->src;
-	plane->state->dst = state->dst;
-	plane->state->visible = state->visible;
+	swap(plane->state->fb, new_plane_state->fb);
+	plane->state->crtc_x = new_plane_state->crtc_x;
+	plane->state->crtc_y = new_plane_state->crtc_y;
+	plane->state->crtc_w = new_plane_state->crtc_w;
+	plane->state->crtc_h = new_plane_state->crtc_h;
+	plane->state->src_x = new_plane_state->src_x;
+	plane->state->src_y = new_plane_state->src_y;
+	plane->state->src_w = new_plane_state->src_w;
+	plane->state->src_h = new_plane_state->src_h;
+	plane->state->src_h = new_plane_state->src_h;
+	plane->state->alpha = new_plane_state->alpha;
+	plane->state->pixel_blend_mode = new_plane_state->pixel_blend_mode;
+	plane->state->rotation = new_plane_state->rotation;
+	plane->state->zpos = new_plane_state->zpos;
+	plane->state->normalized_zpos = new_plane_state->normalized_zpos;
+	plane->state->color_encoding = new_plane_state->color_encoding;
+	plane->state->color_range = new_plane_state->color_range;
+	plane->state->src = new_plane_state->src;
+	plane->state->dst = new_plane_state->dst;
+	plane->state->visible = new_plane_state->visible;
 
-	new_vc4_state = to_vc4_plane_state(state);
+	new_vc4_state = to_vc4_plane_state(new_plane_state);
 	vc4_state = to_vc4_plane_state(plane->state);
 
 	vc4_state->crtc_x = new_vc4_state->crtc_x;
@@ -1187,23 +1189,25 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 }
 
 static int vc4_plane_atomic_async_check(struct drm_plane *plane,
-					struct drm_plane_state *state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct vc4_plane_state *old_vc4_state, *new_vc4_state;
 	int ret;
 	u32 i;
 
-	ret = vc4_plane_mode_set(plane, state);
+	ret = vc4_plane_mode_set(plane, new_plane_state);
 	if (ret)
 		return ret;
 
 	old_vc4_state = to_vc4_plane_state(plane->state);
-	new_vc4_state = to_vc4_plane_state(state);
+	new_vc4_state = to_vc4_plane_state(new_plane_state);
 	if (old_vc4_state->dlist_count != new_vc4_state->dlist_count ||
 	    old_vc4_state->pos0_offset != new_vc4_state->pos0_offset ||
 	    old_vc4_state->pos2_offset != new_vc4_state->pos2_offset ||
 	    old_vc4_state->ptr0_offset != new_vc4_state->ptr0_offset ||
-	    vc4_lbm_size(plane->state) != vc4_lbm_size(state))
+	    vc4_lbm_size(plane->state) != vc4_lbm_size(new_plane_state))
 		return -EINVAL;
 
 	/* Only pos0, pos2 and ptr0 DWORDS can be updated in an async update
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index eb706342861d..2b4d085da450 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1292,9 +1292,9 @@ struct drm_plane_helper_funcs {
 	/**
 	 * @atomic_async_check:
 	 *
-	 * Drivers should set this function pointer to check if the plane state
-	 * can be updated in a async fashion. Here async means "not vblank
-	 * synchronized".
+	 * Drivers should set this function pointer to check if the plane's
+	 * atomic state can be updated in a async fashion. Here async means
+	 * "not vblank synchronized".
 	 *
 	 * This hook is called by drm_atomic_async_check() to establish if a
 	 * given update can be committed asynchronously, that is, if it can
@@ -1306,7 +1306,7 @@ struct drm_plane_helper_funcs {
 	 * can not be applied in asynchronous manner.
 	 */
 	int (*atomic_async_check)(struct drm_plane *plane,
-				  struct drm_plane_state *state);
+				  struct drm_atomic_state *state);
 
 	/**
 	 * @atomic_async_update:
@@ -1322,11 +1322,9 @@ struct drm_plane_helper_funcs {
 	 * update won't happen if there is an outstanding commit modifying
 	 * the same plane.
 	 *
-	 * Note that unlike &drm_plane_helper_funcs.atomic_update this hook
-	 * takes the new &drm_plane_state as parameter. When doing async_update
-	 * drivers shouldn't replace the &drm_plane_state but update the
-	 * current one with the new plane configurations in the new
-	 * plane_state.
+	 * When doing async_update drivers shouldn't replace the
+	 * &drm_plane_state but update the current one with the new plane
+	 * configurations in the new plane_state.
 	 *
 	 * Drivers should also swap the framebuffers between current plane
 	 * state (&drm_plane.state) and new_state.
@@ -1345,7 +1343,7 @@ struct drm_plane_helper_funcs {
 	 *    for deferring if needed, until a common solution is created.
 	 */
 	void (*atomic_async_update)(struct drm_plane *plane,
-				    struct drm_plane_state *new_state);
+				    struct drm_atomic_state *state);
 };
 
 /**
-- 
2.29.2

