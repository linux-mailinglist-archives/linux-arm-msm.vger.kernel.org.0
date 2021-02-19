Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B773731F8E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 13:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhBSMCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 07:02:36 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:37777 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230489AbhBSMBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 07:01:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 618985803A8;
        Fri, 19 Feb 2021 07:00:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 19 Feb 2021 07:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=wmcJw79XHvocI
        ZuyQCxDLYMomsdPgQjxjGbmG4eEhm0=; b=FU77xTVS7rLa9mBgPtX0wxVjPerQB
        ZfOjxs5FkXqHGLPJSo0BFoyBzNtAwHV5FxB6lcdr7w4TXmCGCcfiF3FSnMhfhcft
        OaYXvCzXe5LGTejfWv0S2e1UVDCdr3G5zl5g72l3TSrtGCc20wIrWGvU6Bh/LsHI
        bRWPrRn6AJ2QRgVYlgQG4ffL5Gsh7QfDKR65dDQPaoJX2FQKmV8GCJ+jzk8LLwfk
        Yw8zEfXc4ba4s12b70lF4NtOLy8AG1IkZoqoHSJZIbeVxHUE1Z5x+QOHsdcr6wrw
        fR0FdmiiUQppzRtQH7E4cigoMNELYiZUxnR+H8wDm1VoEop2KQEFbeLbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=wmcJw79XHvocIZuyQCxDLYMomsdPgQjxjGbmG4eEhm0=; b=qvRLsdNc
        U82+im/tOtvRUupUipeNSUtblOfbW2SD0/Ne71LNiFfJTuags4LyU4jNAPtvwFbV
        s7t88xNJkdOhNaoSa9CUjY0c4VJFe6ZSaWRbRf0EUoncNVM+0oaqUuKSCL63z31t
        NNxKb5Fr4T7XnK1bAC6IiNJRbbQQyIRkrqcN0cW/TF/E5sQm7Zs9cH2LnjmnrweJ
        UucFCfgZ8DW0ymHkEDwXn4xccLteDhzEFpzUfAaXnBqCK+HV816eKcFAaFiC6TPM
        Yss79ss+NXXPYVzXpfn3v18poU0HnuJnp6hFt1aZbBRsCiyTg66Mu+RPKFylDMoG
        hcT6FS0eXE1wvw==
X-ME-Sender: <xms:bagvYJkxs-hN5iB_XmjAxtILMekHP6rsuDZj5Rk7s9-5uRNRXs4cYQ>
    <xme:bagvYHv2cmg5kHovqv9pUXWspmwDXDO6G1563qxsA_xwmOdjOjnoZ9KChoEkINCIa
    KG8VShUapEfbCN7v0I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bagvYAcUPYfTblwtwSdt3CRzt_gonaRO790UrkU9LMKsK-CjBYfyUw>
    <xmx:bagvYLamMC_sWL2mDkY8qcVlDoQvq_BDSW2QVSwcVq4OHWjf_boFOw>
    <xmx:bagvYFyyM-5vcnTVgUFmxvdtjbiV-rNA93sk_BSKomZLRUbUns8yIw>
    <xmx:bqgvYKiGMs2b3ttcVzT3VpOUiusQWmh76h4M90lAPCMvlvTCTw3U0A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 39FA91080067;
        Fri, 19 Feb 2021 07:00:45 -0500 (EST)
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
        Marek Vasut <marex@denx.de>, Ben Skeggs <bskeggs@redhat.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Hans de Goede <hdegoede@redhat.com>,
        Eric Anholt <eric@anholt.net>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 04/11] drm/atomic: Pass the full state to planes atomic_check
Date:   Fri, 19 Feb 2021 13:00:24 +0100
Message-Id: <20210219120032.260676-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219120032.260676-1-maxime@cerno.tech>
References: <20210219120032.260676-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current atomic helpers have either their object state being passed as
an argument or the full atomic state.

The former is the pattern that was done at first, before switching to the
latter for new hooks or when it was needed.

Let's convert all the remaining helpers to provide a consistent
interface, starting with the planes atomic_check.

The conversion was done using the coccinelle script below plus some
manual changes for vmwgfx, built tested on all the drivers.

@@
identifier plane, plane_state;
symbol state;
@@

 struct drm_plane_helper_funcs {
 	...
	int (*atomic_check)(struct drm_plane *plane,
-			    struct drm_plane_state *plane_state);
+			    struct drm_atomic_state *state);
	...
}

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

static const struct drm_plane_helper_funcs helpers = {
	...,
 	.atomic_check = func,
	...,
};

@@
struct drm_plane_helper_funcs *FUNCS;
identifier f;
identifier dev;
identifier plane, plane_state, state;
@@

 f(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	<+...
-	FUNCS->atomic_check(plane, plane_state)
+	FUNCS->atomic_check(plane, state)
 	...+>
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
identifier plane, new_plane_state;
@@

 func(struct drm_plane *plane,
-     struct drm_plane_state *new_plane_state
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Rewording and removal of a coccinelle rule suggested by Laurent
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +++-
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 4 +++-
 drivers/gpu/drm/arm/hdlcd_crtc.c                  | 4 +++-
 drivers/gpu/drm/arm/malidp_planes.c               | 4 +++-
 drivers/gpu/drm/armada/armada_plane.c             | 4 +++-
 drivers/gpu/drm/armada/armada_plane.h             | 2 +-
 drivers/gpu/drm/ast/ast_mode.c                    | 8 ++++++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 3 ++-
 drivers/gpu/drm/drm_atomic_helper.c               | 2 +-
 drivers/gpu/drm/drm_simple_kms_helper.c           | 4 +++-
 drivers/gpu/drm/exynos/exynos_drm_plane.c         | 4 +++-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c       | 5 ++++-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 4 +++-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c   | 4 +++-
 drivers/gpu/drm/imx/dcss/dcss-plane.c             | 4 +++-
 drivers/gpu/drm/imx/ipuv3-plane.c                 | 4 +++-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c         | 4 +++-
 drivers/gpu/drm/ingenic/ingenic-ipu.c             | 4 +++-
 drivers/gpu/drm/kmb/kmb_plane.c                   | 4 +++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c          | 4 +++-
 drivers/gpu/drm/meson/meson_overlay.c             | 4 +++-
 drivers/gpu/drm/meson/meson_plane.c               | 4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c         | 5 ++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c        | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c        | 4 +++-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                 | 4 +++-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c           | 5 ++++-
 drivers/gpu/drm/omapdrm/omap_plane.c              | 4 +++-
 drivers/gpu/drm/qxl/qxl_display.c                 | 4 +++-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c           | 4 +++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c             | 5 ++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c       | 4 +++-
 drivers/gpu/drm/sti/sti_cursor.c                  | 4 +++-
 drivers/gpu/drm/sti/sti_gdp.c                     | 4 +++-
 drivers/gpu/drm/sti/sti_hqvdp.c                   | 4 +++-
 drivers/gpu/drm/stm/ltdc.c                        | 4 +++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c            | 4 +++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c            | 4 +++-
 drivers/gpu/drm/tegra/dc.c                        | 8 ++++++--
 drivers/gpu/drm/tegra/hub.c                       | 4 +++-
 drivers/gpu/drm/tidss/tidss_plane.c               | 4 +++-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c             | 4 +++-
 drivers/gpu/drm/vboxvideo/vbox_mode.c             | 8 ++++++--
 drivers/gpu/drm/vc4/vc4_plane.c                   | 4 +++-
 drivers/gpu/drm/virtio/virtgpu_plane.c            | 4 +++-
 drivers/gpu/drm/vkms/vkms_plane.c                 | 4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c               | 8 ++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h               | 4 ++--
 drivers/gpu/drm/xlnx/zynqmp_disp.c                | 4 +++-
 drivers/gpu/drm/zte/zx_plane.c                    | 8 ++++++--
 include/drm/drm_modeset_helper_vtables.h          | 7 +++----
 51 files changed, 164 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 906fa4ae25c9..1cdff048b0c0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6432,8 +6432,10 @@ static int dm_plane_helper_check_state(struct drm_plane_state *state,
 }
 
 static int dm_plane_atomic_check(struct drm_plane *plane,
-				 struct drm_plane_state *new_plane_state)
+				 struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct amdgpu_device *adev = drm_to_adev(plane->dev);
 	struct dc *dc = adev->dm.dc;
 	struct dm_plane_state *dm_plane_state;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 00fd83cbe565..96a6fe95a4e7 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -69,8 +69,10 @@ komeda_plane_init_data_flow(struct drm_plane_state *st,
  */
 static int
 komeda_plane_atomic_check(struct drm_plane *plane,
-			  struct drm_plane_state *new_plane_state)
+			  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct komeda_plane *kplane = to_kplane(plane);
 	struct komeda_plane_state *kplane_st = to_kplane_st(new_plane_state);
 	struct komeda_layer *layer = kplane->layer;
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index d5a79a4aa996..9da9d0581ce9 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -229,8 +229,10 @@ static const struct drm_crtc_helper_funcs hdlcd_crtc_helper_funcs = {
 };
 
 static int hdlcd_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *new_plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	int i;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index e64367f55c70..c94c4a96db68 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -502,8 +502,10 @@ static void malidp_de_prefetch_settings(struct malidp_plane *mp,
 }
 
 static int malidp_de_plane_check(struct drm_plane *plane,
-				 struct drm_plane_state *new_plane_state)
+				 struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct malidp_plane *mp = to_malidp_plane(plane);
 	struct malidp_plane_state *ms = to_malidp_plane_state(new_plane_state);
 	bool rotated = new_plane_state->rotation & MALIDP_ROTATED_MASK;
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index 27f83b07c8eb..b1266c588102 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -106,8 +106,10 @@ void armada_drm_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 int armada_drm_plane_atomic_check(struct drm_plane *plane,
-	struct drm_plane_state *new_plane_state)
+	struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct armada_plane_state *st = to_armada_plane_state(new_plane_state);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/armada/armada_plane.h b/drivers/gpu/drm/armada/armada_plane.h
index 2707ec781941..51dab8d8da22 100644
--- a/drivers/gpu/drm/armada/armada_plane.h
+++ b/drivers/gpu/drm/armada/armada_plane.h
@@ -26,7 +26,7 @@ int armada_drm_plane_prepare_fb(struct drm_plane *plane,
 void armada_drm_plane_cleanup_fb(struct drm_plane *plane,
 	struct drm_plane_state *old_state);
 int armada_drm_plane_atomic_check(struct drm_plane *plane,
-	struct drm_plane_state *state);
+	struct drm_atomic_state *state);
 void armada_plane_reset(struct drm_plane *plane);
 struct drm_plane_state *armada_plane_duplicate_state(struct drm_plane *plane);
 void armada_plane_destroy_state(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 2665d3d570f9..cb8650142f13 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -536,8 +536,10 @@ static const uint32_t ast_primary_plane_formats[] = {
 };
 
 static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						 struct drm_plane_state *new_plane_state)
+						 struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc_state *crtc_state;
 	struct ast_crtc_state *ast_crtc_state;
 	int ret;
@@ -756,8 +758,10 @@ static const uint32_t ast_cursor_plane_formats[] = {
 };
 
 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
-						struct drm_plane_state *new_plane_state)
+						struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc_state *crtc_state;
 	int ret;
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index c62e930bccad..445105e75a97 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -593,8 +593,9 @@ atmel_hlcdc_plane_update_disc_area(struct atmel_hlcdc_plane *plane,
 }
 
 static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
-					  struct drm_plane_state *s)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *s = drm_atomic_get_new_plane_state(state, p);
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
 	struct atmel_hlcdc_plane_state *hstate =
 				drm_plane_state_to_atmel_hlcdc_plane_state(s);
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index bd0bb74437c7..c06bd5f43e61 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -902,7 +902,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 		if (!funcs || !funcs->atomic_check)
 			continue;
 
-		ret = funcs->atomic_check(plane, new_plane_state);
+		ret = funcs->atomic_check(plane, state);
 		if (ret) {
 			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] atomic driver check failed\n",
 					 plane->base.id, plane->name);
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 89675d4b7b6c..a43e34e04d6b 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -177,8 +177,10 @@ static const struct drm_crtc_funcs drm_simple_kms_crtc_funcs = {
 };
 
 static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
-					struct drm_plane_state *plane_state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
+									     plane);
 	struct drm_simple_display_pipe *pipe;
 	struct drm_crtc_state *crtc_state;
 	int ret;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 009a62978fbc..2c4ceb768a08 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -228,8 +228,10 @@ exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 }
 
 static int exynos_plane_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *new_plane_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_plane_state *exynos_state =
 						to_exynos_plane_state(new_plane_state);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index fc3ec6b4c732..7d2aa2cbcff6 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -7,6 +7,7 @@
 
 #include <linux/regmap.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -33,8 +34,10 @@ static int fsl_dcu_drm_plane_index(struct drm_plane *plane)
 }
 
 static int fsl_dcu_drm_plane_atomic_check(struct drm_plane *plane,
-					  struct drm_plane_state *new_plane_state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 
 	if (!new_plane_state->fb || !new_plane_state->crtc)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index d276f37d9d80..ddcf121af542 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -53,8 +53,10 @@ static const struct hibmc_dislay_pll_config hibmc_pll_table[] = {
 };
 
 static int hibmc_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *new_plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index cba99b8d9e59..fab083380ef7 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -757,8 +757,10 @@ static void ade_disable_channel(struct kirin_plane *kplane)
 }
 
 static int ade_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *new_plane_state)
+				  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index c76fce2e8cf6..0e68d295bd60 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -137,8 +137,10 @@ static bool dcss_plane_is_source_size_allowed(u16 src_w, u16 src_h, u32 pix_fmt)
 }
 
 static int dcss_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *new_plane_state)
+				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = new_plane_state->fb;
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 1873a155bb26..28571091ff1c 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -337,8 +337,10 @@ static const struct drm_plane_funcs ipu_plane_funcs = {
 };
 
 static int ipu_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *new_state)
+				  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_plane_state *old_state = plane->state;
 	struct drm_crtc_state *crtc_state;
 	struct device *dev = plane->dev->dev;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index f589923b4a5d..8232104e598f 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -359,8 +359,10 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
-					  struct drm_plane_state *new_plane_state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc = new_plane_state->crtc ?: plane->state->crtc;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 623f42d44b07..7394b0af1259 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -514,8 +514,10 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 }
 
 static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
-					  struct drm_plane_state *new_plane_state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	unsigned int num_w, denom_w, num_h, denom_h, xres, yres, max_w, max_h;
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc ?: plane->state->crtc;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 51ceaae9e7e8..909045b67b28 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -77,8 +77,10 @@ static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 }
 
 static int kmb_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *new_plane_state)
+				  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb;
 	int ret;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index cdd2f8cfb4ab..31f1cc2085c7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -141,8 +141,10 @@ static const struct drm_plane_funcs mtk_plane_funcs = {
 };
 
 static int mtk_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *new_plane_state)
+				  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc_state *crtc_state;
 	int ret;
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index a419a8c514e1..629ca303af25 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -165,8 +165,10 @@ struct meson_overlay {
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
 static int meson_overlay_atomic_check(struct drm_plane *plane,
-				      struct drm_plane_state *new_plane_state)
+				      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc_state *crtc_state;
 
 	if (!new_plane_state->crtc)
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 2c1256caf48a..f8355cb2a2e1 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -71,8 +71,10 @@ struct meson_plane {
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
 static int meson_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *new_plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc_state *crtc_state;
 
 	if (!new_plane_state->crtc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9bce72627ff0..9945d11bb6ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_file.h>
@@ -950,8 +951,10 @@ static bool dpu_plane_validate_src(struct drm_rect *src,
 }
 
 static int dpu_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *new_plane_state)
+				  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index da3cc1d8c331..f95b14ebfa8a 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -106,7 +106,7 @@ static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
 
 
 static int mdp4_plane_atomic_check(struct drm_plane *plane,
-		struct drm_plane_state *state)
+		struct drm_atomic_state *state)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index f5434a5254e0..45f7780da901 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -404,8 +404,10 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 }
 
 static int mdp5_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *new_plane_state)
+				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 3e1bb0aefb87..85b547dcf86d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -402,8 +402,10 @@ static const struct drm_encoder_funcs mxsfb_encoder_funcs = {
  */
 
 static int mxsfb_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
+									     plane);
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index f83bfc0794ab..1382ccdfe7e3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -30,6 +30,7 @@
 #include <nvhw/class/cl507e.h>
 #include <nvhw/class/clc37e.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 
@@ -435,8 +436,10 @@ nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw,
 
 static int
 nv50_wndw_atomic_check(struct drm_plane *plane,
-		       struct drm_plane_state *new_plane_state)
+		       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *armw = nv50_wndw_atom(wndw->plane.state);
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 53ad0744e048..6bd384c79324 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -99,8 +99,10 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static int omap_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *new_plane_state)
+				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc_state *crtc_state;
 
 	if (!new_plane_state->fb)
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 9b49b6c0af08..3304fdb020b2 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -463,8 +463,10 @@ static const struct drm_crtc_helper_funcs qxl_crtc_helper_funcs = {
 };
 
 static int qxl_primary_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *new_plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct qxl_device *qdev = to_qxl(plane->dev);
 	struct qxl_bo *bo;
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index b887ab8fc577..7afe7442214b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -607,8 +607,10 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
 }
 
 static int rcar_du_plane_atomic_check(struct drm_plane *plane,
-				      struct drm_plane_state *new_plane_state)
+				      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct rcar_du_plane_state *rstate = to_rcar_plane_state(new_plane_state);
 
 	return __rcar_du_plane_atomic_check(plane, new_plane_state,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f6cc1a76708a..ab82fda22b70 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -7,6 +7,7 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -265,8 +266,10 @@ static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
-					  struct drm_plane_state *new_plane_state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(new_plane_state);
 
 	return __rcar_du_plane_atomic_check(plane, new_plane_state,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 8a507917a0dc..d96d42dfc6c7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -778,8 +778,10 @@ static bool rockchip_mod_supported(struct drm_plane *plane,
 }
 
 static int vop_plane_atomic_check(struct drm_plane *plane,
-			   struct drm_plane_state *new_plane_state)
+			   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 	struct drm_framebuffer *fb = new_plane_state->fb;
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index c04c868e337f..ceb30d545ab9 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -181,8 +181,10 @@ static void sti_cursor_init(struct sti_cursor *cursor)
 }
 
 static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
-				   struct drm_plane_state *new_plane_state)
+				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_cursor *cursor = to_sti_cursor(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 4fe91ab4f191..63823827417c 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -615,8 +615,10 @@ static int sti_gdp_get_dst(struct device *dev, int dst, int src)
 }
 
 static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
-				struct drm_plane_state *new_plane_state)
+				struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_gdp *gdp = to_sti_gdp(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 5d492ac1f2dd..b3b10ee96bb2 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1017,8 +1017,10 @@ static void sti_hqvdp_start_xp70(struct sti_hqvdp *hqvdp)
 }
 
 static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
-				  struct drm_plane_state *new_plane_state)
+				  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_hqvdp *hqvdp = to_sti_hqvdp(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index dbd3994a18e1..7367a1e73d73 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -749,8 +749,10 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
  */
 
 static int ltdc_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *new_plane_state)
+				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	u32 src_w, src_h;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 19ed531c006b..b5fb50e72868 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -257,8 +257,10 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 }
 
 static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
-				       struct drm_plane_state *new_plane_state)
+				       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6074863f41c3..85c2927755a4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -361,8 +361,10 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 }
 
 static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
-				       struct drm_plane_state *new_plane_state)
+				       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 2d91956bc762..bd2ee94f6f52 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -604,8 +604,10 @@ static const u64 tegra124_modifiers[] = {
 };
 
 static int tegra_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *new_plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct tegra_plane_state *plane_state = to_tegra_plane_state(new_plane_state);
 	unsigned int supported_rotation = DRM_MODE_ROTATE_0 |
 					  DRM_MODE_REFLECT_X |
@@ -831,8 +833,10 @@ static const u32 tegra_cursor_plane_formats[] = {
 };
 
 static int tegra_cursor_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *new_plane_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct tegra_plane *tegra = to_tegra_plane(plane);
 	int err;
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8a2d359c4ff6..e5b22508e09a 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -336,8 +336,10 @@ static void tegra_dc_remove_shared_plane(struct tegra_dc *dc,
 }
 
 static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
-					   struct drm_plane_state *new_plane_state)
+					   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct tegra_plane_state *plane_state = to_tegra_plane_state(new_plane_state);
 	struct tegra_shared_plane *tegra = to_tegra_shared_plane(plane);
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 6dab9ad89644..980b65725d66 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -20,8 +20,10 @@
 /* drm_plane_helper_funcs */
 
 static int tidss_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *new_plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_device *ddev = plane->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index 389c80a5873c..f43670aff5ad 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -21,8 +21,10 @@ static const struct drm_plane_funcs tilcdc_plane_funcs = {
 };
 
 static int tilcdc_plane_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *new_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_crtc_state *crtc_state;
 	struct drm_plane_state *old_state = plane->state;
 	unsigned int pitch;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 6e4ad966be71..7140086d8308 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -253,8 +253,10 @@ static const struct drm_crtc_funcs vbox_crtc_funcs = {
 };
 
 static int vbox_primary_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *new_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_state->crtc) {
@@ -326,8 +328,10 @@ static void vbox_primary_atomic_disable(struct drm_plane *plane,
 }
 
 static int vbox_cursor_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *new_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_crtc_state *crtc_state = NULL;
 	u32 width = new_state->crtc_w;
 	u32 height = new_state->crtc_h;
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index e4b2f537967f..b46d79efa4b0 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1040,8 +1040,10 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
  * in the CRTC's flush.
  */
 static int vc4_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *new_plane_state)
+				  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(new_plane_state);
 	int ret;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 9b2ec4db1265..0f4fdd8c28f9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -83,8 +83,10 @@ static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
 };
 
 static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
-					 struct drm_plane_state *new_plane_state)
+					 struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
 	struct drm_crtc_state *crtc_state;
 	int ret;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index eef120a573a8..751695a76e26 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -114,8 +114,10 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *new_plane_state)
+				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc_state *crtc_state;
 	bool can_position = false;
 	int ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 1b0c2e44b586..5be1e4bd8a5f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -437,8 +437,10 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
  * Returns 0 on success
  */
 int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
-				      struct drm_plane_state *new_state)
+				      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	struct drm_crtc_state *crtc_state = NULL;
 	struct drm_framebuffer *new_fb = new_state->fb;
 	int ret;
@@ -476,8 +478,10 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
  * Returns 0 on success
  */
 int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *new_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
 	int ret = 0;
 	struct drm_crtc_state *crtc_state = NULL;
 	struct vmw_surface *surface = NULL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 6267ccf54944..c5183e7eea04 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -456,9 +456,9 @@ void vmw_du_cursor_plane_destroy(struct drm_plane *plane);
 
 /* Atomic Helpers */
 int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
-				      struct drm_plane_state *state);
+				      struct drm_atomic_state *state);
 int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *state);
+				     struct drm_atomic_state *state);
 void vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state);
 int vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index ee7793d6a26e..b0a3ba528718 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1143,8 +1143,10 @@ static inline struct zynqmp_disp_layer *plane_to_layer(struct drm_plane *plane)
 
 static int
 zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
-			       struct drm_plane_state *new_plane_state)
+			       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
 	struct drm_crtc_state *crtc_state;
 
 	if (!new_plane_state->crtc)
diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
index 78d787afe594..20ac29212991 100644
--- a/drivers/gpu/drm/zte/zx_plane.c
+++ b/drivers/gpu/drm/zte/zx_plane.c
@@ -46,8 +46,10 @@ static const uint32_t vl_formats[] = {
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
 static int zx_vl_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
+									     plane);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_crtc *crtc = plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
@@ -275,8 +277,10 @@ static const struct drm_plane_helper_funcs zx_vl_plane_helper_funcs = {
 };
 
 static int zx_gl_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *plane_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
+									     plane);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_crtc *crtc = plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 2b4d085da450..484f91d772ea 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1233,9 +1233,8 @@ struct drm_plane_helper_funcs {
 	 * NOTE:
 	 *
 	 * This function is called in the check phase of an atomic update. The
-	 * driver is not allowed to change anything outside of the free-standing
-	 * state objects passed-in or assembled in the overall &drm_atomic_state
-	 * update tracking structure.
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure.
 	 *
 	 * RETURNS:
 	 *
@@ -1245,7 +1244,7 @@ struct drm_plane_helper_funcs {
 	 * deadlock.
 	 */
 	int (*atomic_check)(struct drm_plane *plane,
-			    struct drm_plane_state *state);
+			    struct drm_atomic_state *state);
 
 	/**
 	 * @atomic_update:
-- 
2.29.2

