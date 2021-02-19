Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E840331F8FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 13:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhBSME6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 07:04:58 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56239 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231190AbhBSMC4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 07:02:56 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id B57C658018A;
        Fri, 19 Feb 2021 07:01:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 19 Feb 2021 07:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
        sIDsFI/uR6XN2etdjT1Ju6jt64IDwaJl5giMWD4uzJk=; b=gmVWaGk5JKwFuCH5
        gmoMxw2bcnVEEywijWTPNU2LZJBGgUkKIJNk+NDz3Vjg3n/vQh61+06SsOSW70Fp
        nmgfiWCFSpIV/4ZL8NyAphTiraDRdIB5PrAtzI1OaBZJXGkA8+S7lmLJiTUFp0iy
        RLopz4ou/YBUctVFcTl+yPKxe3cRmbujgfV5/3z9dj8PNOAD+YR0ir8eHtaiXQ9l
        R5c6XubQFU+b/dPk/9GhfZL00bP/thd2QjQM71S6ewzSvBTyGNHOL96+8O1pz8pU
        Moi+DTj50jz29OiiXBvZ0++I2Etphg5+qJ8cjhUOO8bgWhhclF1UYO31PtXsWsdC
        NUSVog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=sIDsFI/uR6XN2etdjT1Ju6jt64IDwaJl5giMWD4uz
        Jk=; b=R0QPGk/vWgf4h2zIDyptGQZPxZbeAn0+EiPXwGu2wHg8mhuFVc4fKNqTt
        V6Y10/ncuCZAD3uMwd2SxrUHpvyXlWbJGcdgUmmbSce03OGELflfVvoIHHo2Ze+r
        0eTWyVlLaiePfVNjsRLnpQhW2UwFtOgc5iC4zJ3L9C1rIIopCesIy37jlqOvBhql
        e7GOhNT+hes+kdC8WhKJUlQchrpQO+C4qMk4oG1hJgwaMvwoxk0Xp60XaeE4tnMu
        d9kjKfkkECYsg6DYGkKwYfH8rzdK9EYrtg/oRs5YPYGrWKaHPrhcrqVHeb3UMOA0
        6OXHDM8KAcRNsTvnxLTEp0760Yw7Q==
X-ME-Sender: <xms:gqgvYKMSOUZOQX5HGHE1cBGo4VYmCEvoZrS_57CVlYf3TvqUey_6rw>
    <xme:gqgvYJrP_kP3Kznvu7fuEg0GqmMWGYRDBhp0KBqnzI6GAzH2yrVe5JnqNE-NZIs1H
    9M3FEOrxsiWUJE67P4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepffegueefvdevvdduieegieeigeeigeevveekhfdtgeevieejtddvgfejleel
    jedunecuffhomhgrihhnpehshihnohhpshihshdrtghomhenucfkphepledtrdekledrie
    ekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gqgvYPeUrxdZOZVClam5MkIqc9VHKYHGVZI0bnjdR45HmSUI8HHAWA>
    <xmx:gqgvYPS2ma1n62iESErQqsnuunjr1tG_Bce9XHWrWPTX6RJp-I9eow>
    <xmx:gqgvYIZ5nLmrudgMRBY-x-eZXIpeSA2ZF6KWPm6_dN5QuzCbEZC3VA>
    <xmx:g6gvYFlbaZckaX6qyr5vXDvbuQmd_gyqp6SCdF9axI_wNVWXBJ4iRw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 136091080064;
        Fri, 19 Feb 2021 07:01:06 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
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
        Marek Vasut <marex@denx.de>, Tomi Valkeinen <tomba@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Hans de Goede <hdegoede@redhat.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 10/11] drm: Use state helper instead of the plane state pointer
Date:   Fri, 19 Feb 2021 13:00:30 +0100
Message-Id: <20210219120032.260676-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219120032.260676-1-maxime@cerno.tech>
References: <20210219120032.260676-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many drivers reference the plane->state pointer in order to get the
current plane state in their atomic_update or atomic_disable hooks,
which would be the new plane state in the global atomic state since
_swap_state happened when those hooks are run.

Use the drm_atomic_get_new_plane_state helper to get that state to make it
more obvious.

This was made using the coccinelle script below:

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

(
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_disable = func,
	...,
 };
|
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_update = func,
	...,
 };
)

@ adds_new_state @
identifier plane_atomic_func.func;
identifier plane, state;
identifier new_state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state)
 {
 	...
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
	...
 }

@ include depends on adds_new_state @
@@

 #include <drm/drm_atomic.h>

@ no_include depends on !include && adds_new_state @
@@

+ #include <drm/drm_atomic.h>
  #include <drm/...>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c               | 4 +++-
 drivers/gpu/drm/arm/hdlcd_crtc.c                | 3 ++-
 drivers/gpu/drm/arm/malidp_planes.c             | 3 ++-
 drivers/gpu/drm/armada/armada_overlay.c         | 3 ++-
 drivers/gpu/drm/armada/armada_plane.c           | 3 ++-
 drivers/gpu/drm/ast/ast_mode.c                  | 6 ++++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 3 ++-
 drivers/gpu/drm/exynos/exynos_drm_plane.c       | 3 ++-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c     | 3 ++-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c  | 3 ++-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 3 ++-
 drivers/gpu/drm/imx/dcss/dcss-plane.c           | 3 ++-
 drivers/gpu/drm/imx/ipuv3-plane.c               | 3 ++-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c       | 3 ++-
 drivers/gpu/drm/ingenic/ingenic-ipu.c           | 3 ++-
 drivers/gpu/drm/kmb/kmb_plane.c                 | 3 ++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c        | 6 ++++--
 drivers/gpu/drm/meson/meson_overlay.c           | 3 ++-
 drivers/gpu/drm/meson/meson_plane.c             | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c       | 3 ++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c      | 4 +++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c      | 3 ++-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c               | 3 ++-
 drivers/gpu/drm/omapdrm/omap_plane.c            | 6 ++++--
 drivers/gpu/drm/qxl/qxl_display.c               | 6 ++++--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c         | 3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 3 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     | 3 ++-
 drivers/gpu/drm/sti/sti_cursor.c                | 3 ++-
 drivers/gpu/drm/sti/sti_gdp.c                   | 3 ++-
 drivers/gpu/drm/sti/sti_hqvdp.c                 | 3 ++-
 drivers/gpu/drm/stm/ltdc.c                      | 3 ++-
 drivers/gpu/drm/sun4i/sun4i_layer.c             | 3 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c          | 3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c          | 3 ++-
 drivers/gpu/drm/tegra/dc.c                      | 6 ++++--
 drivers/gpu/drm/tegra/hub.c                     | 3 ++-
 drivers/gpu/drm/tidss/tidss_plane.c             | 3 ++-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c           | 3 ++-
 drivers/gpu/drm/vboxvideo/vbox_mode.c           | 6 ++++--
 drivers/gpu/drm/vkms/vkms_plane.c               | 3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c             | 3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c            | 3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c            | 3 ++-
 drivers/gpu/drm/xlnx/zynqmp_disp.c              | 3 ++-
 drivers/gpu/drm/zte/zx_plane.c                  | 6 ++++--
 46 files changed, 108 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index b185452d5542..7016f9cfe30d 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
  */
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -147,7 +148,8 @@ static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
 static void arc_pgu_plane_atomic_update(struct drm_plane *plane,
 					struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_plane_state = plane->state;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_cma_object *gem;
 
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 2500bf189420..7adb065169e9 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -262,7 +262,8 @@ static int hdlcd_plane_atomic_check(struct drm_plane *plane,
 static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_plane_state = plane->state;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct hdlcd_drm_private *hdlcd;
 	u32 dest_h;
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 1cb207bb8dcd..ddbba67f0283 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -797,7 +797,8 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 									   plane);
 	struct malidp_plane *mp;
 	struct malidp_plane_state *ms = to_malidp_plane_state(plane->state);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	u16 pixel_alpha = new_state->pixel_blend_mode;
 	u8 plane_alpha = new_state->alpha >> 8;
 	u32 src_w, src_h, dest_w, dest_h, val;
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 393e4ea841f9..d3e3e5fdc390 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -70,7 +70,8 @@ static void armada_drm_overlay_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct armada_crtc *dcrtc;
 	struct armada_regs *regs;
 	unsigned int idx;
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index 31d312d7ceef..40209e49f34a 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -165,7 +165,8 @@ static void armada_drm_primary_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct armada_crtc *dcrtc;
 	struct armada_regs *regs;
 	u32 cfg, cfg_mask, val;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 61815eeb5157..36d9575aa27b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -575,7 +575,8 @@ ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct drm_device *dev = plane->dev;
 	struct ast_private *ast = to_ast_private(dev);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_gem_vram_object *gbo;
 	s64 gpu_addr;
 	struct drm_framebuffer *fb = new_state->fb;
@@ -797,7 +798,8 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 2c6d71faa268..a077d93c78d7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -733,7 +733,8 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
 static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 					    struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_s = p->state;
+	struct drm_plane_state *new_s = drm_atomic_get_new_plane_state(state,
+								       p);
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
 	struct atmel_hlcdc_plane_state *hstate =
 			drm_plane_state_to_atmel_hlcdc_plane_state(new_s);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index c0f733e6ed9e..ee99ab19f717 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -254,7 +254,8 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 static void exynos_plane_atomic_update(struct drm_plane *plane,
 				       struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+								           plane);
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(new_state->crtc);
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index d9efa6d1b2d4..8fe953d6e0a9 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -80,7 +80,8 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 
 {
 	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_framebuffer *fb = plane->state->fb;
 	struct drm_gem_cma_object *gem;
 	unsigned int alpha = DCU_LAYER_AB_NONE, bpp;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 4f643fbc68fb..fa8da0ef707e 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -101,7 +101,8 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 static void hibmc_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	u32 reg;
 	s64 gpu_addr = 0;
 	u32 line_l;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 834fd101c3ba..6dcf9ec05eec 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -806,7 +806,8 @@ static int ade_plane_atomic_check(struct drm_plane *plane,
 static void ade_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct kirin_plane *kplane = to_kirin_plane(plane);
 
 	ade_update_channel(kplane, new_state->fb, new_state->crtc_x,
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index d6bc9fb71756..ba297e108b43 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -268,7 +268,8 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = new_state->fb;
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 7b0714061849..d9d71f3748e9 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -544,7 +544,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
 	struct ipu_plane *ipu_plane = to_ipu_plane(plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct ipu_plane_state *ipu_state = to_ipu_plane_state(new_state);
 	struct drm_crtc_state *crtc_state = new_state->crtc->state;
 	struct drm_framebuffer *fb = new_state->fb;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 85c371d105e5..6d38eca052f7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -544,7 +544,8 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
-	struct drm_plane_state *newstate = plane->state;
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
+									  plane);
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
 	unsigned int width, height, cpp, offset;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 7716bb211d7e..1e1c7dd3997a 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -285,7 +285,8 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
-	struct drm_plane_state *newstate = plane->state;
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
+									  plane);
 	const struct drm_format_info *finfo;
 	u32 ctrl, stride = 0, coef_index = 0, format = 0;
 	bool needs_modeset, upscaling_w, upscaling_h;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index f837962474b1..d5b6195856d1 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -282,7 +282,8 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
 										 plane);
-	struct drm_plane_state *new_plane_state = plane->state;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb;
 	struct kmb_drm_private *kmb;
 	unsigned int width;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 7f876b6c9615..a6efbc38db27 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -175,7 +175,8 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 static void mtk_plane_atomic_disable(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
 	mtk_plane_state->pending.enable = false;
 	wmb(); /* Make sure the above parameter is set before update */
@@ -185,7 +186,8 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 static void mtk_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_framebuffer *fb = new_state->fb;
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 4b12a53e27c8..a820bf9b1075 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -471,7 +471,8 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					struct drm_atomic_state *state)
 {
 	struct meson_overlay *meson_overlay = to_meson_overlay(plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct meson_drm *priv = meson_overlay->priv;
 	struct drm_gem_cma_object *gem;
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 78bd3e9be3bf..f7fa37ac51cf 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -133,7 +133,8 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
 	struct meson_plane *meson_plane = to_meson_plane(plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_rect dest = drm_plane_state_dest(new_state);
 	struct meson_drm *priv = meson_plane->priv;
 	struct drm_framebuffer *fb = new_state->fb;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 31071f9e21d7..e8ce72fe54a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1244,7 +1244,8 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 				struct drm_atomic_state *state)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 
 	pdpu->is_error = false;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 5d78bce980a7..9aecca919f24 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 
@@ -114,7 +115,8 @@ static int mdp4_plane_atomic_check(struct drm_plane *plane,
 static void mdp4_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	int ret;
 
 	ret = mdp4_plane_mode_set(plane,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 4dc82a0c12e9..8c9f2f492178 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -428,7 +428,8 @@ static int mdp5_plane_atomic_check(struct drm_plane *plane,
 static void mdp5_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 
 	DBG("%s: update", plane->name);
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 980b567043ba..c7c0b21f541f 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -435,7 +435,8 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(state,
 									    plane);
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
-	struct drm_plane_state *new_pstate = plane->state;
+	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
+									    plane);
 	dma_addr_t paddr;
 	u32 ctrl;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index d7c735dba3e1..801da917507d 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -44,7 +44,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 {
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct omap_overlay_info info;
 	int ret;
 
@@ -89,7 +90,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 static void omap_plane_atomic_disable(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index acde4b39bc9d..e1d7c2f2a8b9 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -528,7 +528,8 @@ static int qxl_primary_apply_cursor(struct drm_plane *plane)
 static void qxl_primary_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct qxl_device *qdev = to_qxl(plane->dev);
 	struct qxl_bo *bo = gem_to_qxl_bo(new_state->fb->obj[0]);
 	struct qxl_bo *primary;
@@ -581,7 +582,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_device *dev = plane->dev;
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_framebuffer *fb = new_state->fb;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 50f7247b51fa..f9b8fa2082e8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -622,7 +622,8 @@ static void rcar_du_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 								           plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+								           plane);
 	struct rcar_du_plane *rplane = to_rcar_plane(plane);
 	struct rcar_du_plane_state *old_rstate;
 	struct rcar_du_plane_state *new_rstate;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 19fd424d1208..aa068b0d1315 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -281,7 +281,8 @@ static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 								           plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+								           plane);
 	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
 	struct rcar_du_crtc *crtc = to_rcar_crtc(old_state->crtc);
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index e0e2510bdaac..60f03e9899ae 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -880,7 +880,8 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index 217f456067c2..1d6051b4f6fe 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -258,7 +258,8 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
 static void sti_cursor_atomic_update(struct drm_plane *drm_plane,
 				     struct drm_atomic_state *state)
 {
-	struct drm_plane_state *newstate = drm_plane->state;
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
+									  drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_cursor *cursor = to_sti_cursor(plane);
 	struct drm_crtc *crtc = newstate->crtc;
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index eee17c6914a6..d1a35d97bc45 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -703,7 +703,8 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 {
 	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
 									  drm_plane);
-	struct drm_plane_state *newstate = drm_plane->state;
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
+									  drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_gdp *gdp = to_sti_gdp(plane);
 	struct drm_crtc *crtc = newstate->crtc;
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index f317c9aad9c5..edbb99f53de1 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1113,7 +1113,8 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 {
 	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
 									  drm_plane);
-	struct drm_plane_state *newstate = drm_plane->state;
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
+									  drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_hqvdp *hqvdp = to_sti_hqvdp(plane);
 	struct drm_crtc *crtc = newstate->crtc;
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 62b6e4f9788c..c0bacbd73302 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -778,7 +778,8 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
 	struct ltdc_device *ldev = plane_to_ltdc(plane);
-	struct drm_plane_state *newstate = plane->state;
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
+									  plane);
 	struct drm_framebuffer *fb = newstate->fb;
 	u32 lofs = plane->index * LAY_OFS;
 	u32 x0 = newstate->crtc_x;
diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index 3e985abdfef8..95f8cbae62d3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -86,7 +86,8 @@ static void sun4i_backend_layer_atomic_disable(struct drm_plane *plane,
 static void sun4i_backend_layer_atomic_update(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct sun4i_layer_state *layer_state = state_to_sun4i_layer_state(new_state);
 	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
 	struct sun4i_backend *backend = layer->backend;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 07ef63531266..2dbf28448a8d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -306,7 +306,8 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
 	unsigned int old_zpos = old_state->normalized_zpos;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4326bb9019cc..d0d16f40ebef 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -410,7 +410,8 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
 	unsigned int old_zpos = old_state->normalized_zpos;
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index c393db21c21a..455d449191ab 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -710,7 +710,8 @@ static void tegra_plane_atomic_disable(struct drm_plane *plane,
 static void tegra_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct tegra_plane *p = to_tegra_plane(plane);
@@ -870,7 +871,8 @@ static int tegra_cursor_atomic_check(struct drm_plane *plane,
 static void tegra_cursor_atomic_update(struct drm_plane *plane,
 				       struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
 	u32 value = CURSOR_CLIP_DISPLAY;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b264c9729d94..8118007cb6d7 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -429,7 +429,8 @@ static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
 static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 					     struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
 	unsigned int zpos = new_state->normalized_zpos;
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index b0a4aff56095..875d678ae372 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -110,7 +110,8 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
 	struct drm_device *ddev = plane->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	u32 hw_videoport;
 	int ret;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index c7c27f577432..74a5c8832229 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -78,7 +78,8 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 static void tilcdc_plane_atomic_update(struct drm_plane *plane,
 				       struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 
 	if (!new_state->crtc)
 		return;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 07fd7826b6a2..964381d55fc1 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -275,7 +275,8 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
 static void vbox_primary_atomic_update(struct drm_plane *plane,
 				       struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct vbox_private *vbox = to_vbox_dev(fb->dev);
@@ -387,7 +388,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct vbox_private *vbox =
 		container_of(plane->dev, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(new_state->crtc);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d0056fab01eb..835559b6ec16 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -94,7 +94,8 @@ static const struct drm_plane_funcs vkms_plane_funcs = {
 static void vkms_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct vkms_plane_state *vkms_plane_state;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct vkms_composer *composer;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index dd8696fe7943..87e0b303d900 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -288,7 +288,8 @@ vmw_ldu_primary_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct vmw_private *dev_priv;
 	struct vmw_legacy_display_unit *ldu;
 	struct vmw_framebuffer *vfb;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 05f3111164d8..962e685f5d04 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -734,7 +734,8 @@ vmw_sou_primary_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 								           plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+								           plane);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_pending_vblank_event *event = NULL;
 	struct vmw_fence_obj *fence = NULL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 7d4f62834ec4..def3919d60f9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1584,7 +1584,8 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 								           plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+								           plane);
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct vmw_screen_target_display_unit *stdu;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 56b1b855cfe9..64d02787a986 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1183,7 +1183,8 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 								           plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+								           plane);
 	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
 	bool format_changed = false;
 
diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
index fc2ac2672f1c..93bcca428e35 100644
--- a/drivers/gpu/drm/zte/zx_plane.c
+++ b/drivers/gpu/drm/zte/zx_plane.c
@@ -184,7 +184,8 @@ static void zx_vl_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
 	struct zx_plane *zplane = to_zx_plane(plane);
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_rect *src = &new_state->src;
 	struct drm_rect *dst = &new_state->dst;
@@ -355,7 +356,8 @@ static void zx_gl_rsz_setup(struct zx_plane *zplane, u32 src_w, u32 src_h,
 static void zx_gl_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct zx_plane *zplane = to_zx_plane(plane);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_cma_object *cma_obj;
-- 
2.29.2

