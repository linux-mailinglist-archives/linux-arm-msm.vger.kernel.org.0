Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0902FF0A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 17:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387453AbhAUQjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 11:39:33 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:36967 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388117AbhAUQiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 11:38:16 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 98719580533;
        Thu, 21 Jan 2021 11:35:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 21 Jan 2021 11:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=uriJ+i0n5ySzM
        PCuYBrNQ2vuA9ufMe8usxIm794lues=; b=qKFJL0Sl7X/1LDtqOS4Xh19xqGPWm
        1xQ6YU9Hi2ogzOTNbxld5Jz65PA+KvH7HA32oZhT3NP1xUAp+9OZwbjpIVxmeAOB
        o+bRNS3skNlUDYfi+BGQLD5kzU3ioJLXgMtJVQRO5U0cixHqxGMfbVNhumdxc7S4
        RiGdTAX0lFjlEi95B6eJGnlZbaxBzvTSox43BwWPYE4mFj6+i98vsevEH59yP8WH
        HoSw3ZEny94HLSZpS4n45wzL7lUS25eouma7WJHjTwctds5hMaGlDtUZPvtt8Njv
        ajKFrZkeF9YZy10cRcnqVqsu1OMbfzpNRCnNBfe8B1dEzHY1w1Kw7GSOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=uriJ+i0n5ySzMPCuYBrNQ2vuA9ufMe8usxIm794lues=; b=PlejBiAi
        DRSSoXAxb8P1J1BeA4mBp11BlqVDCT+x3KbRoePyKsqWT+J9Rv0nexCfyDPqjUe4
        k4yj2Y6mZu6DZAZGctz094/SaGSnZSy7JteL/IhvR9aVbCr/wD6xSB9yO4qzcWJH
        AOpz7VOGNGWXKYIVXqHGiUpaEmpXY4XrzLuXh+IeQBH9YvoSNhtUoNat22yV87fB
        FP2myr5+x51Mhs7iT6PaXqyHfqT87X593kUlDmr7UFxhQWD29AzHG08AYl5lMEzH
        gdwILyrnuirFdt0JtA52J8OQuZahH26eHGnCurNJx0ldSRi2Q6SzcQ6R4kLAO848
        whWEqQwW/LSxgw==
X-ME-Sender: <xms:aq0JYMtTt1ct79i64rRQJbCLY86cGrqi62GgnoB8OFIMnkP_22TfkQ>
    <xme:aq0JYB5qPqBNABWt8TuRE_fKL-qDnGIehb7E79wDYBJWlxt-s37xxbgkb4KhagEOU
    3aBCEk08i7Im8NlFvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aq0JYIOSfwnP6srkO7otNGMYluXqIzCht2jhalc-k5LtAYUvXXJZ9A>
    <xmx:aq0JYPviLLpmj-PWQThiT2k3kvuRCdw6FDENGe6OlhPbPS4VJBvWAA>
    <xmx:aq0JYLZFnhF4GxFnPstYRDI4FJAzbVuugc-_0ju4nJ8CtqjHWeRBlw>
    <xmx:ba0JYCU38F3GVOA0DpjVGC_nlObRmVLpRZh36lSO8DLxqKZJXMlRUw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 30B1D108005C;
        Thu, 21 Jan 2021 11:35:54 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        John Stultz <john.stultz@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomba@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Hans de Goede <hdegoede@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v2 05/11] drm: Use the state pointer directly in planes atomic_check
Date:   Thu, 21 Jan 2021 17:35:30 +0100
Message-Id: <20210121163537.1466118-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121163537.1466118-1-maxime@cerno.tech>
References: <20210121163537.1466118-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that atomic_check takes the global atomic state as a parameter, we
don't need to go through the pointer in the plane state.

This was done using the following coccinelle script:

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

static struct drm_plane_helper_funcs helpers = {
	...,
	.atomic_check = func,
	...,
};

@@
identifier plane_atomic_func.func;
identifier plane, state;
identifier plane_state;
@@

  func(struct drm_plane *plane, struct drm_atomic_state *state) {
  ...
- struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
  <... when != plane_state
- plane_state->state
+ state
  ...>
 }

@@
identifier plane_atomic_func.func;
identifier plane, state;
identifier plane_state;
@@

  func(struct drm_plane *plane, struct drm_atomic_state *state) {
  ...
  struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
  <...
- plane_state->state
+ state
  ...>
 }

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Fixed the formatting in zynqmp_disp
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 2 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c                  | 2 +-
 drivers/gpu/drm/armada/armada_plane.c             | 4 ++--
 drivers/gpu/drm/ast/ast_mode.c                    | 4 ++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 2 +-
 drivers/gpu/drm/drm_simple_kms_helper.c           | 2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c   | 2 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c             | 2 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                 | 2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c         | 2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c             | 2 +-
 drivers/gpu/drm/kmb/kmb_plane.c                   | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c          | 2 +-
 drivers/gpu/drm/meson/meson_overlay.c             | 2 +-
 drivers/gpu/drm/meson/meson_plane.c               | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c         | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c        | 2 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                 | 2 +-
 drivers/gpu/drm/omapdrm/omap_plane.c              | 2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c       | 2 +-
 drivers/gpu/drm/sti/sti_cursor.c                  | 2 +-
 drivers/gpu/drm/sti/sti_gdp.c                     | 2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                   | 2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c            | 2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c            | 2 +-
 drivers/gpu/drm/tidss/tidss_plane.c               | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c             | 2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c             | 8 ++++----
 drivers/gpu/drm/virtio/virtgpu_plane.c            | 2 +-
 drivers/gpu/drm/vkms/vkms_plane.c                 | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c               | 2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                | 3 +--
 drivers/gpu/drm/zte/zx_plane.c                    | 4 ++--
 35 files changed, 41 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dc340adba098..63284fe2bc22 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6452,7 +6452,7 @@ static int dm_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	new_crtc_state =
-		drm_atomic_get_new_crtc_state(new_plane_state->state,
+		drm_atomic_get_new_crtc_state(state,
 					      new_plane_state->crtc);
 	if (!new_crtc_state)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 2b67b6b9a6b5..4cc4800f0ae5 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -86,7 +86,7 @@ komeda_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc || !new_plane_state->fb)
 		return 0;
 
-	crtc_st = drm_atomic_get_crtc_state(new_plane_state->state,
+	crtc_st = drm_atomic_get_crtc_state(state,
 					    new_plane_state->crtc);
 	if (IS_ERR(crtc_st) || !crtc_st->enable) {
 		DRM_DEBUG_ATOMIC("Cannot update plane on a disabled CRTC.\n");
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 9da9d0581ce9..028ec39c8484 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -244,7 +244,7 @@ static int hdlcd_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	for_each_new_crtc_in_state(new_plane_state->state, crtc, crtc_state,
+	for_each_new_crtc_in_state(state, crtc, crtc_state,
 				   i) {
 		/* we cannot disable the plane while the CRTC is active */
 		if (!new_plane_state->fb && crtc_state->active)
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index b1266c588102..51f33c689df3 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -121,8 +121,8 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 	}
 
-	if (new_plane_state->state)
-		crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+	if (state)
+		crtc_state = drm_atomic_get_existing_crtc_state(state,
 								crtc);
 	else
 		crtc_state = crtc->state;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 3e030bdd1caf..fc39675b4c3d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -546,7 +546,7 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_new_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_new_crtc_state(state,
 						   new_plane_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
@@ -665,7 +665,7 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_new_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_new_crtc_state(state,
 						   new_plane_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 445105e75a97..a32d45bcc386 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -609,7 +609,7 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	if (!hstate->base.crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(s->state, s->crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(state, s->crtc);
 	mode = &crtc_state->adjusted_mode;
 
 	ret = drm_atomic_helper_check_plane_state(s, crtc_state,
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 8ab0b070c1c9..9a5b05b320af 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -186,7 +186,7 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
 	int ret;
 
 	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
-	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
+	crtc_state = drm_atomic_get_new_crtc_state(state,
 						   &pipe->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index ddcf121af542..3f7027e40c79 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -66,7 +66,7 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc || !fb)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 04c75ef716c1..1458893ecc52 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -782,7 +782,7 @@ static int ade_plane_atomic_check(struct drm_plane *plane,
 	if (fmt == ADE_FORMAT_UNSUPPORT)
 		return -EINVAL;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 0e68d295bd60..35a7b23060b3 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -157,7 +157,7 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
 	WARN_ON(!cma_obj);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							new_plane_state->crtc);
 
 	hdisplay = crtc_state->adjusted_mode.hdisplay;
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 28571091ff1c..b5f6123850bb 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -358,7 +358,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(new_state->state,
+		drm_atomic_get_existing_crtc_state(state,
 						   new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 8232104e598f..e6d7d0a04ddb 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -371,7 +371,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 7394b0af1259..1e1b0fe095bd 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -526,7 +526,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state, crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 909045b67b28..9a8cf2991fb4 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -100,7 +100,7 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(new_plane_state->state,
+		drm_atomic_get_existing_crtc_state(state,
 						   new_plane_state->crtc);
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 31f1cc2085c7..37489a086ca8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -160,7 +160,7 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 629ca303af25..93ba785de396 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -174,7 +174,7 @@ static int meson_overlay_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index f8355cb2a2e1..e5d05b725ed6 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -80,7 +80,7 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9945d11bb6ed..d644044a2bbb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -964,7 +964,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t min_src_size, max_linewidth;
 
 	if (new_plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(new_plane_state->state,
+		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
 	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 45f7780da901..4aac6217a5ad 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -415,7 +415,7 @@ static int mdp5_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 85b547dcf86d..18c0c0d7b4b6 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -409,7 +409,7 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	struct drm_crtc_state *crtc_state;
 
-	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
+	crtc_state = drm_atomic_get_new_crtc_state(state,
 						   &mxsfb->crtc);
 
 	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 6bd384c79324..0df1d35504ad 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -112,7 +112,7 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!new_plane_state->crtc))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							new_plane_state->crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index d96d42dfc6c7..01f6cb99e8ea 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -796,7 +796,7 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index ceb30d545ab9..e34ab8317f6d 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -198,7 +198,7 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
 	if (!crtc || !fb)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	mode = &crtc_state->mode;
 	dst_x = new_plane_state->crtc_x;
 	dst_y = new_plane_state->crtc_y;
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 63823827417c..f64eef90dc58 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -635,7 +635,7 @@ static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
 		return 0;
 
 	mixer = to_sti_mixer(crtc);
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	mode = &crtc_state->mode;
 	dst_x = new_plane_state->crtc_x;
 	dst_y = new_plane_state->crtc_y;
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index b3b10ee96bb2..c1a2450beed4 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1034,7 +1034,7 @@ static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
 	if (!crtc || !fb)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	mode = &crtc_state->mode;
 	dst_x = new_plane_state->crtc_x;
 	dst_y = new_plane_state->crtc_y;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8760e68c4da4..7bcc8c4561a6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -248,7 +248,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index cda6d3697876..b5a82930e272 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -351,7 +351,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 980b65725d66..9b531e625ec9 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -44,7 +44,7 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 	}
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index f43670aff5ad..ebdd42dcaf82 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -41,7 +41,7 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							new_state->crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 8405de133831..d60f7cb5105f 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -259,8 +259,8 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
 	struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(
-					    new_state->state, new_state->crtc);
+		crtc_state = drm_atomic_get_existing_crtc_state(state,
+								new_state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 	}
@@ -337,8 +337,8 @@ static int vbox_cursor_atomic_check(struct drm_plane *plane,
 	int ret;
 
 	if (new_state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(
-					    new_state->state, new_state->crtc);
+		crtc_state = drm_atomic_get_existing_crtc_state(state,
+								new_state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 0f4fdd8c28f9..9419aa611af9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -94,7 +94,7 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
                 return PTR_ERR(crtc_state);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 751695a76e26..2f2ab3c01bf9 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -125,7 +125,7 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 25c5a5fa90d4..a865ce1509e7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -446,7 +446,7 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
 	int ret;
 
 	if (new_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
+		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b0a3ba528718..27c0b849598b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1152,8 +1152,7 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
-					       new_plane_state->crtc);
+	crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
index 20ac29212991..1d5d35bda249 100644
--- a/drivers/gpu/drm/zte/zx_plane.c
+++ b/drivers/gpu/drm/zte/zx_plane.c
@@ -59,7 +59,7 @@ static int zx_vl_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
@@ -288,7 +288,7 @@ static int zx_gl_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(plane_state->state,
+	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
-- 
2.29.2

