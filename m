Return-Path: <linux-arm-msm+bounces-736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 180C17EC99E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 18:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77AF5B20BB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70311381A5;
	Wed, 15 Nov 2023 17:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DABC18E;
	Wed, 15 Nov 2023 09:23:52 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 09CA93F8F8;
	Wed, 15 Nov 2023 18:23:47 +0100 (CET)
Date: Wed, 15 Nov 2023 18:23:46 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
	Doug Anderson <dianders@chromium.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm/msm/dsi: fix DSC for the bonded DSI case
Message-ID: <74ou4xly7pjnsqbavvt2iuonvpgioznriq2vgbccprn5uagkhm@ntq6sq7ywelv>
References: <20231114174218.19765-1-jonathan@marek.ca>
 <20231114174218.19765-4-jonathan@marek.ca>
 <eanx45rnasj7lu3r2tfhtg4qkqkcidd6zctsz6ci6jlklu4fgi@3nf73w2ka4li>
 <a9712ef1-5f60-b127-a276-9e437d95914f@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9712ef1-5f60-b127-a276-9e437d95914f@marek.ca>

On 2023-11-14 14:00:19, Jonathan Marek wrote:
> On 11/14/23 1:28 PM, Marijn Suijten wrote:
> > On what hardware have you been testing this?  Dmitry and I have a stack of
> > patches to resolve support for Active CTL programming on newer hardware (DPU
> > 5.0+ IIRC), where a single CTL is responsible for programming multiple INTF and
> > DSC blocks as used in bonded DSI.
> > 
> 
> I am also using DPU 6+ but I won't be posting patches for DPU to support 
> this as I am not using the upstream DPU codebase.

Oh that is an odd situation!  At least glad to hear we aren't completely
duplicating our efforts :)

> > On 2023-11-14 12:42:16, Jonathan Marek wrote:
> >> For the bonded DSI case, DSC pic_width and timing calculations should use
> >> the width of a single panel instead of the total combined width.
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c    | 20 +++++++++++---------
> >>   drivers/gpu/drm/msm/dsi/dsi_manager.c |  2 +-
> >>   3 files changed, 14 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> >> index 28379b1af63f..3a641e69447c 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> >> @@ -93,7 +93,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
> >>   int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
> >>   				  const struct drm_display_mode *mode);
> >>   enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> >> -					    const struct drm_display_mode *mode);
> >> +					    const struct drm_display_mode *mode,
> >> +					    bool is_bonded_dsi);
> >>   unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
> >>   int msm_dsi_host_register(struct mipi_dsi_host *host);
> >>   void msm_dsi_host_unregister(struct mipi_dsi_host *host);
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 7284346ab787..a6286eb9d006 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -938,8 +938,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   			       mode->hdisplay, mode->vdisplay);
> >>   			return;
> >>   		}
> >> -
> >> -		dsc->pic_width = mode->hdisplay;
> >> +		dsc->pic_width = hdisplay;
> > 
> > In my testing and debugging on CMDmode panels downstream this value/register
> > was always programmed to the _full_ width of the bonded panel.  Is that maybe
> > different for video mode?
> > 
> 
> downstream dual DSI panel timings are specified for a single panel 
> ("qcom,mdss-dsi-panel-width" is for a single panel, not both panels)

_dual panels_?  In my case I have a "single panel" that is driven by two
"bonded" DSI hosts, just to achieve enough bandwidth.

Indeed my downstream DTS has qcom,mdss-dsi-panel-width set to half the total
panel width, but I recall seeing the full width in the register dump.  I'll scan
through my logs and see if I can back this up.

> >>   		dsc->pic_height = mode->vdisplay;
> >>   		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> >>   
> >> @@ -950,6 +949,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   		if (ret)
> >>   			return;
> >>   
> >> +		if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> >> +			dsi_update_dsc_timing(msm_host, false, hdisplay);
> >> +		else
> >> +			dsi_update_dsc_timing(msm_host, true, hdisplay);

Another thought: it's probably clearer to write:

	bool is_cmd_mode = msm_host->mode_flags & MIPI_DSI_MODE_VIDEO;
	dsi_update_dsc_timing(msm_host, is_cmd_mode, hdisplay);

> >> +
> > 
> > Such cleanups (which appear unrelated) should probably be posted as separate
> > patches.
> > 
> > - Marijn
> > 
> 
> Its not unrelated, dsi_update_dsc_timing call is moved up so it can use 
> the single-panel "hdisplay" value before it gets adjusted for DSC.

This reply was mostly expected after not looking at the original code folded in
the diff, and pretty much solidifies my point: it's a hidden semantical change
that's not immediately obvious from reading the patch, and why I'd like to see
this split up in a few smaller patches.

> >>   		/* Divide the display by 3 but keep back/font porch and
> >>   		 * pulse width same
> >>   		 */
> >> @@ -966,9 +970,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   	}
> >>   
> >>   	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> >> -		if (msm_host->dsc)
> >> -			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
> >> -
> >>   		dsi_write(msm_host, REG_DSI_ACTIVE_H,
> >>   			DSI_ACTIVE_H_START(ha_start) |
> >>   			DSI_ACTIVE_H_END(ha_end));
> >> @@ -987,9 +988,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
> >>   			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
> >>   	} else {		/* command mode */
> >> -		if (msm_host->dsc)
> >> -			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
> >> -
> >>   		/* image data and 1 byte write_memory_start cmd */
> >>   		if (!msm_host->dsc)
> >>   			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;

Regarding another patch: cmdmode calculates and uses word count here, but video
mode does it as part of timing calculations?

- Marijn

> >> @@ -2487,7 +2485,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
> >>   }
> >>   
> >>   enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> >> -					    const struct drm_display_mode *mode)
> >> +					    const struct drm_display_mode *mode,
> >> +					    bool is_bonded_dsi)
> >>   {
> >>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> >>   	struct drm_dsc_config *dsc = msm_host->dsc;
> >> @@ -2497,6 +2496,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> >>   	if (!msm_host->dsc)
> >>   		return MODE_OK;
> >>   
> >> +	if (is_bonded_dsi)
> >> +		pic_width = mode->hdisplay / 2;
> >> +
> >>   	if (pic_width % dsc->slice_width) {
> >>   		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
> >>   		       pic_width, dsc->slice_width);
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> >> index 896f369fdd53..2ca1a7ca3659 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> >> @@ -455,7 +455,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
> >>   			return MODE_ERROR;
> >>   	}
> >>   
> >> -	return msm_dsi_host_check_dsc(host, mode);
> >> +	return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
> >>   }
> >>   
> >>   static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
> >> -- 
> >> 2.26.1
> >>

