Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D62D4DB32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 22:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfFTUZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 16:25:54 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:52163 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbfFTUZx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 16:25:53 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id E808A20021;
        Thu, 20 Jun 2019 22:25:43 +0200 (CEST)
Date:   Thu, 20 Jun 2019 22:25:42 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Ville Syrjala <ville.syrjala@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 1/2] drm: Pretty print mode flags
Message-ID: <20190620202542.GA12106@ravnborg.org>
References: <20190620185049.8974-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190620185049.8974-1-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
        a=PHq6YzTAAAAA:8 a=IpJZQVW2AAAA:8 a=pGLkceISAAAA:8 a=sozttTNsAAAA:8
        a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8 a=8b9GpE9nAAAA:8 a=JfrnYn6hAAAA:8
        a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=D7w3X7Iln0mF8MUCZl0A:9
        a=on3ZYwNNgxJVYIY-:21 a=_m1eqBLaFCl2ildt:21 a=wPNLvfGTeEIA:10
        a=ZKzU8r6zoKMcqsNulkmm:22 a=IawgGOuG5U0WyFbmm1f5:22
        a=aeg5Gbbo78KNqacMgKqU:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=cvBusfyB2V15izCimMoJ:22 a=T3LWEMljR5ZiDmsYVIUa:22
        a=1CNFftbPRP8L7MoqJWF3:22 a=AjGcO6oz07-iQ99wixmX:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ville.

On Thu, Jun 20, 2019 at 09:50:48PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Decode the mode flags when printing the modeline so that I
> no longer have to decode the hex number myself.
You are extending the current way to print mode flags,
but I would anyway like to point out a different approach.

When I need to print a fourcc code it is as simple as:

{
	struct drm_format_name_buf fbuf;

	printk("My format: %s\n", drm_get_format_name(format, &fbuf);
}

This way to handle this feels more straightforward
than the current approach used for modes.

Maybe bikeshedding, as your mileage may vary.

A middle ground could be to introduce a struct for the buf so we know
the callers do it right.

Most of the code would be the same, but all call sites would need to be
updated.
What do you think?

	Sam


> 
> To do this neatly I made the caller provide a temporary
> on stack buffer where we can produce the results. I choce 64
> bytes as a reasonable size for this. The worst case I think
> is > 100 bytes but that kind of mode would be nonsense anyway
> so I figured correct decoding isn't as important in such
> cases.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/armada/armada_crtc.c          |   3 +-
>  drivers/gpu/drm/drm_atomic.c                  |   3 +-
>  drivers/gpu/drm/drm_modes.c                   | 116 +++++++++++++++++-
>  drivers/gpu/drm/i915/i915_debugfs.c           |   3 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c         |   3 +-
>  drivers/gpu/drm/meson/meson_venc.c            |   4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   3 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   3 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  |   3 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |   3 +-
>  .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |   4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   3 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |   3 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c         |   3 +-
>  drivers/gpu/drm/msm/edp/edp_bridge.c          |   3 +-
>  drivers/gpu/drm/omapdrm/omap_connector.c      |   5 +-
>  drivers/gpu/drm/omapdrm/omap_crtc.c           |   3 +-
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c  |   3 +-
>  drivers/gpu/drm/sti/sti_crtc.c                |   3 +-
>  include/drm/drm_modes.h                       |  14 ++-
>  20 files changed, 165 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
> index ba4a3fab7745..ce9335682bd2 100644
> --- a/drivers/gpu/drm/armada/armada_crtc.c
> +++ b/drivers/gpu/drm/armada/armada_crtc.c
> @@ -262,6 +262,7 @@ static void armada_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	unsigned long flags;
>  	unsigned i;
>  	bool interlaced = !!(adj->flags & DRM_MODE_FLAG_INTERLACE);
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	i = 0;
>  	rm = adj->crtc_hsync_start - adj->crtc_hdisplay;
> @@ -270,7 +271,7 @@ static void armada_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	tm = adj->crtc_vtotal - adj->crtc_vsync_end;
>  
>  	DRM_DEBUG_KMS("[CRTC:%d:%s] mode " DRM_MODE_FMT "\n",
> -		      crtc->base.id, crtc->name, DRM_MODE_ARG(adj));
> +		      crtc->base.id, crtc->name, DRM_MODE_ARG(adj, buf));
>  	DRM_DEBUG_KMS("lm %d rm %d tm %d bm %d\n", lm, rm, tm, bm);
>  
>  	/* Now compute the divider for real */
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 419381abbdd1..81caf91fbd72 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -380,6 +380,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
>  		const struct drm_crtc_state *state)
>  {
>  	struct drm_crtc *crtc = state->crtc;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	drm_printf(p, "crtc[%u]: %s\n", crtc->base.id, crtc->name);
>  	drm_printf(p, "\tenable=%d\n", state->enable);
> @@ -393,7 +394,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
>  	drm_printf(p, "\tplane_mask=%x\n", state->plane_mask);
>  	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
>  	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
> -	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
> +	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode, buf));
>  
>  	if (crtc->funcs->atomic_print_state)
>  		crtc->funcs->atomic_print_state(p, state);
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 57e6408288c8..3d15c600295a 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -45,6 +45,118 @@
>  
>  #include "drm_crtc_internal.h"
>  
> +static char *snprint_cont(char *buf, int *len,
> +			  const char *str, bool last)
> +{
> +	int r;
> +
> +	r = snprintf(buf, *len, "%s%s", str, last ? "" : ",");
> +	if (r >= *len)
> +		return buf;
> +
> +	*len -= r;
> +	buf += r;
> +
> +	return buf;
> +}
> +
> +#define MODE_STR(x) { .name = #x, .flag = DRM_MODE_FLAG_ ## x, }
> +
> +static const struct {
> +	const char *name;
> +	u32 flag;
> +} mode_flags[] = {
> +	MODE_STR(PHSYNC),
> +	MODE_STR(NHSYNC),
> +	MODE_STR(PVSYNC),
> +	MODE_STR(NVSYNC),
> +	MODE_STR(INTERLACE),
> +	MODE_STR(CSYNC),
> +	MODE_STR(PCSYNC),
> +	MODE_STR(NCSYNC),
> +	MODE_STR(DBLSCAN),
> +	MODE_STR(HSKEW),
> +	MODE_STR(DBLCLK),
> +	MODE_STR(CLKDIV2),
> +};
> +
> +#undef MODE_STR
> +#define MODE_STR(x) [DRM_MODE_FLAG_3D_ ## x >> 14] = #x
> +
> +static const char * const stereo_flags[] = {
> +	MODE_STR(NONE),
> +	MODE_STR(FRAME_PACKING),
> +	MODE_STR(FIELD_ALTERNATIVE),
> +	MODE_STR(LINE_ALTERNATIVE),
> +	MODE_STR(SIDE_BY_SIDE_FULL),
> +	MODE_STR(L_DEPTH),
> +	MODE_STR(L_DEPTH_GFX_GFX_DEPTH),
> +	MODE_STR(TOP_AND_BOTTOM),
> +	MODE_STR(SIDE_BY_SIDE_HALF),
> +};
> +
> +#undef MODE_STR
> +#define MODE_STR(x) [DRM_MODE_FLAG_PIC_AR_ ## x >> 19] = #x
> +
> +static const char * const aspect_flags[] = {
> +	MODE_STR(NONE),
> +	MODE_STR(4_3),
> +	MODE_STR(16_9),
> +	MODE_STR(64_27),
> +	MODE_STR(256_135),
> +};
> +
> +#undef MODE_STR
> +
> +const char *drm_get_mode_flags_name(char *buf, int len, u32 flags)
> +{
> +	char *ptr = buf;
> +	int i;
> +
> +	if (len == 0)
> +		return buf;
> +
> +	buf[0] = '\0';
> +
> +	if (flags & DRM_MODE_FLAG_3D_MASK) {
> +		int stereo = (flags & DRM_MODE_FLAG_3D_MASK) >> 14;
> +
> +		if (stereo < ARRAY_SIZE(stereo_flags)) {
> +			flags &= ~DRM_MODE_FLAG_3D_MASK;
> +			ptr = snprint_cont(ptr, &len,
> +					   stereo_flags[stereo], !flags);
> +		}
> +	}
> +
> +	if (flags & DRM_MODE_FLAG_PIC_AR_MASK) {
> +		int aspect = (flags & DRM_MODE_FLAG_PIC_AR_MASK) >> 19;
> +
> +		if (aspect < ARRAY_SIZE(aspect_flags)) {
> +			flags &= ~DRM_MODE_FLAG_PIC_AR_MASK;
> +			ptr = snprint_cont(ptr, &len,
> +					   aspect_flags[aspect], !flags);
> +		}
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(mode_flags); i++) {
> +		u32 flag = mode_flags[i].flag;
> +
> +		if ((flags & flag) == 0)
> +			continue;
> +
> +		flags &= ~flag;
> +
> +		ptr = snprint_cont(ptr, &len,
> +				   mode_flags[i].name, !flags);
> +	}
> +
> +	if (flags)
> +		ptr = snprint_cont(ptr, &len, "?", true);
> +
> +	return buf;
> +}
> +EXPORT_SYMBOL(drm_get_mode_flags_name);
> +
>  /**
>   * drm_mode_debug_printmodeline - print a mode to dmesg
>   * @mode: mode to print
> @@ -53,7 +165,9 @@
>   */
>  void drm_mode_debug_printmodeline(const struct drm_display_mode *mode)
>  {
> -	DRM_DEBUG_KMS("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> +
> +	DRM_DEBUG_KMS("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode, buf));
>  }
>  EXPORT_SYMBOL(drm_mode_debug_printmodeline);
>  
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 62cf34db9280..18a3ff8e1461 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -2539,12 +2539,13 @@ static int i915_dmc_info(struct seq_file *m, void *unused)
>  static void intel_seq_print_mode(struct seq_file *m, int tabs,
>  				 struct drm_display_mode *mode)
>  {
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  	int i;
>  
>  	for (i = 0; i < tabs; i++)
>  		seq_putc(m, '\t');
>  
> -	seq_printf(m, DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> +	seq_printf(m, DRM_MODE_FMT "\n", DRM_MODE_ARG(mode, buf));
>  }
>  
>  static void intel_encoder_info(struct seq_file *m,
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index df3f9ddd2234..30e53a043ba6 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -610,13 +610,14 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>  		   const struct drm_display_mode *mode)
>  {
>  	struct meson_drm *priv = connector->dev->dev_private;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  	unsigned int vclk_freq;
>  	unsigned int venc_freq;
>  	unsigned int hdmi_freq;
>  	int vic = drm_match_cea_mode(mode);
>  	enum drm_mode_status status;
>  
> -	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> +	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode, buf));
>  
>  	/* If sink max TMDS clock, we reject the mode */
>  	if (connector->display_info.max_tmds_clock &&
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 7b7a0d8d737c..09acbc06f9f3 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -987,9 +987,11 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
>  	if (meson_venc_hdmi_supported_vic(vic)) {
>  		vmode = meson_venc_hdmi_get_vic_vmode(vic);
>  		if (!vmode) {
> +			char buf[DRM_MODE_FLAGS_BUF_LEN];
> +
>  			dev_err(priv->dev, "%s: Fatal Error, unsupported mode "
>  				DRM_MODE_FMT "\n", __func__,
> -				DRM_MODE_ARG(mode));
> +				DRM_MODE_ARG(mode, buf));
>  			return;
>  		}
>  	} else {
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> index 0cfd4c06b610..f68d9f74b0e4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -238,6 +238,7 @@ static void mdp4_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	enum mdp4_dma dma = mdp4_crtc->dma;
>  	int ovlp = mdp4_crtc->ovlp;
>  	struct drm_display_mode *mode;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	if (WARN_ON(!crtc->state))
>  		return;
> @@ -245,7 +246,7 @@ static void mdp4_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	mode = &crtc->state->adjusted_mode;
>  
>  	DBG("%s: set mode: " DRM_MODE_FMT,
> -			mdp4_crtc->name, DRM_MODE_ARG(mode));
> +	    mdp4_crtc->name, DRM_MODE_ARG(mode, buf));
>  
>  	mdp4_write(mdp4_kms, REG_MDP4_DMA_SRC_SIZE(dma),
>  			MDP4_DMA_SRC_SIZE_WIDTH(mode->hdisplay) |
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> index caa39b4621e3..2e0dca4d2484 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> @@ -55,10 +55,11 @@ static void mdp4_dsi_encoder_mode_set(struct drm_encoder *encoder,
>  	uint32_t dsi_hsync_skew, vsync_period, vsync_len, ctrl_pol;
>  	uint32_t display_v_start, display_v_end;
>  	uint32_t hsync_start_x, hsync_end_x;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	mode = adjusted_mode;
>  
> -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
>  
>  	ctrl_pol = 0;
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> index 259d51971401..e88ac070a672 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> @@ -101,10 +101,11 @@ static void mdp4_dtv_encoder_mode_set(struct drm_encoder *encoder,
>  	uint32_t dtv_hsync_skew, vsync_period, vsync_len, ctrl_pol;
>  	uint32_t display_v_start, display_v_end;
>  	uint32_t hsync_start_x, hsync_end_x;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	mode = adjusted_mode;
>  
> -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
>  
>  	mdp4_dtv_encoder->pixclock = mode->clock * 1000;
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> index df6f9803a1d7..99bdae9c945b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> @@ -270,10 +270,11 @@ static void mdp4_lcdc_encoder_mode_set(struct drm_encoder *encoder,
>  	uint32_t lcdc_hsync_skew, vsync_period, vsync_len, ctrl_pol;
>  	uint32_t display_v_start, display_v_end;
>  	uint32_t hsync_start_x, hsync_end_x;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	mode = adjusted_mode;
>  
> -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
>  
>  	mdp4_lcdc_encoder->pixclock = mode->clock * 1000;
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> index eeef41fcd4e1..6bffbebee8bb 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> @@ -124,9 +124,11 @@ void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
>  			       struct drm_display_mode *mode,
>  			       struct drm_display_mode *adjusted_mode)
>  {
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> +
>  	mode = adjusted_mode;
>  
> -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
>  	pingpong_tearcheck_setup(encoder, mode);
>  	mdp5_crtc_set_pipeline(encoder->crtc);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index c3751c95b452..888a25d1da8b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -378,13 +378,14 @@ static void mdp5_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	u32 mixer_width, val;
>  	unsigned long flags;
>  	struct drm_display_mode *mode;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	if (WARN_ON(!crtc->state))
>  		return;
>  
>  	mode = &crtc->state->adjusted_mode;
>  
> -	DBG("%s: set mode: " DRM_MODE_FMT, crtc->name, DRM_MODE_ARG(mode));
> +	DBG("%s: set mode: " DRM_MODE_FMT, crtc->name, DRM_MODE_ARG(mode, buf));
>  
>  	mixer_width = mode->hdisplay;
>  	if (r_mixer)
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> index 820a62c40063..809118bb6965 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> @@ -115,10 +115,11 @@ static void mdp5_vid_encoder_mode_set(struct drm_encoder *encoder,
>  	uint32_t hsync_start_x, hsync_end_x;
>  	uint32_t format = 0x2100;
>  	unsigned long flags;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	mode = adjusted_mode;
>  
> -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
>  
>  	ctrl_pol = 0;
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index ec6cb0f7f206..1bf2f503b84b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -527,8 +527,9 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>  	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
>  	struct mipi_dsi_host *host = msm_dsi->host;
>  	bool is_dual_dsi = IS_DUAL_DSI();
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
> -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
>  
>  	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
>  		return;
> diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp/edp_bridge.c
> index 2950bba4aca9..0844345862ef 100644
> --- a/drivers/gpu/drm/msm/edp/edp_bridge.c
> +++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
> @@ -51,8 +51,9 @@ static void edp_bridge_mode_set(struct drm_bridge *bridge,
>  	struct drm_connector *connector;
>  	struct edp_bridge *edp_bridge = to_edp_bridge(bridge);
>  	struct msm_edp *edp = edp_bridge->edp;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
> -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
>  
>  	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
>  		if ((connector->encoder != NULL) &&
> diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
> index 5967283934e1..4ce29288c70e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_connector.c
> +++ b/drivers/gpu/drm/omapdrm/omap_connector.c
> @@ -276,6 +276,7 @@ static enum drm_mode_status omap_connector_mode_valid(struct drm_connector *conn
>  	struct omap_connector *omap_connector = to_omap_connector(connector);
>  	struct drm_display_mode new_mode = { { 0 } };
>  	enum drm_mode_status status;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	status = omap_connector_mode_fixup(omap_connector->output, mode,
>  					   &new_mode);
> @@ -288,8 +289,8 @@ static enum drm_mode_status omap_connector_mode_valid(struct drm_connector *conn
>  
>  done:
>  	DBG("connector: mode %s: " DRM_MODE_FMT,
> -			(status == MODE_OK) ? "valid" : "invalid",
> -			DRM_MODE_ARG(mode));
> +	    (status == MODE_OK) ? "valid" : "invalid",
> +	    DRM_MODE_ARG(mode, buf));
>  
>  	return status;
>  }
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index d61215494617..221459d6abe9 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -553,9 +553,10 @@ static void omap_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  {
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
>  	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	DBG("%s: set mode: " DRM_MODE_FMT,
> -	    omap_crtc->name, DRM_MODE_ARG(mode));
> +	    omap_crtc->name, DRM_MODE_ARG(mode, buf));
>  
>  	drm_display_mode_to_videomode(mode, &omap_crtc->vm);
>  }
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index 3c15764f0c03..468ebdca94f4 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -126,12 +126,13 @@ static int rb070d30_panel_get_modes(struct drm_panel *panel)
>  	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
>  	struct drm_display_mode *mode;
>  	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	mode = drm_mode_duplicate(panel->drm, &default_mode);
>  	if (!mode) {
>  		DRM_DEV_ERROR(&ctx->dsi->dev,
>  			      "Failed to add mode " DRM_MODE_FMT "\n",
> -			      DRM_MODE_ARG(&default_mode));
> +			      DRM_MODE_ARG(&default_mode, buf));
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
> index dc64fbfc4e61..bc9602f519d7 100644
> --- a/drivers/gpu/drm/sti/sti_crtc.c
> +++ b/drivers/gpu/drm/sti/sti_crtc.c
> @@ -54,11 +54,12 @@ sti_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode)
>  	struct sti_compositor *compo = dev_get_drvdata(dev);
>  	struct clk *compo_clk, *pix_clk;
>  	int rate = mode->clock * 1000;
> +	char buf[DRM_MODE_FLAGS_BUF_LEN];
>  
>  	DRM_DEBUG_KMS("CRTC:%d (%s) mode: (%s)\n",
>  		      crtc->base.id, sti_mixer_to_str(mixer), mode->name);
>  
> -	DRM_DEBUG_KMS(DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> +	DRM_DEBUG_KMS(DRM_MODE_FMT "\n", DRM_MODE_ARG(mode, buf));
>  
>  	if (mixer->id == STI_MIXER_MAIN) {
>  		compo_clk = compo->clk_compo_main;
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index 083f16747369..3962dbf82100 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -428,20 +428,27 @@ struct drm_display_mode {
>  	struct list_head export_head;
>  };
>  
> +/**
> + * DRM_MODE_FLAGS_BUF_LEN - reasonable size for the buffer passed to DRM_MODE_ARG()
> + */
> +#define DRM_MODE_FLAGS_BUF_LEN 64
> +
>  /**
>   * DRM_MODE_FMT - printf string for &struct drm_display_mode
>   */
> -#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x"
> +#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x %s"
>  
>  /**
>   * DRM_MODE_ARG - printf arguments for &struct drm_display_mode
>   * @m: display mode
> + * @b: buffer for temporary string
>   */
> -#define DRM_MODE_ARG(m) \
> +#define DRM_MODE_ARG(m, b) \
>  	(m)->name, (m)->vrefresh, (m)->clock, \
>  	(m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
>  	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
> -	(m)->type, (m)->flags
> +	(m)->type, (m)->flags, \
> +	drm_get_mode_flags_name(b, sizeof(b), (m)->flags)
>  
>  #define obj_to_mode(x) container_of(x, struct drm_display_mode, base)
>  
> @@ -542,5 +549,6 @@ drm_mode_parse_command_line_for_connector(const char *mode_option,
>  struct drm_display_mode *
>  drm_mode_create_from_cmdline_mode(struct drm_device *dev,
>  				  struct drm_cmdline_mode *cmd);
> +const char *drm_get_mode_flags_name(char *buf, int len, u32 flags);
>  
>  #endif /* __DRM_MODES_H__ */
> -- 
> 2.21.0
