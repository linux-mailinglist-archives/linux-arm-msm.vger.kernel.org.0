Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD76738FAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 21:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjFUTKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 15:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231919AbjFUTJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 15:09:57 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0051710
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 12:09:56 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E03721F67E;
        Wed, 21 Jun 2023 21:09:53 +0200 (CEST)
Date:   Wed, 21 Jun 2023 21:09:52 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Message-ID: <zof5eggzpj6utqa725uldzws2wvu5tf2t6qfi6msuu5z2queb3@5vwlz627cil3>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <6rcphtpxou2ef3z44upzfbx23ahmqc4f3eys6qreozutt7v6z6@b22a535fhpor>
 <c4dd336c-940d-16fe-9c8c-c2d31ed28792@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4dd336c-940d-16fe-9c8c-c2d31ed28792@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-20 17:27:46, Dmitry Baryshkov wrote:
> On 20/06/2023 15:05, Marijn Suijten wrote:
> > On 2023-06-20 00:06:47, Dmitry Baryshkov wrote:
> >> Provide actual documentation for the pclk and hdisplay calculations in
> >> the case of DSC compression being used.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>
> >> Changes since v1:
> >> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
> >> - Added a pointer from dsi_timing_setup() docs to
> >>    dsi_adjust_pclk_for_compression() (Marijn)
> >> - Fixed two typo (Marijn)
> >>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
> >>   1 file changed, 38 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 3f6dfb4f9d5a..a8a31c3dd168 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
> >>   	clk_disable_unprepare(msm_host->byte_clk);
> >>   }
> >>   
> >> +/**
> >> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
> >> + * @mode: the selected mode for the DSI output
> > 
> > The
> > 
> >> + * @dsc: DRM DSC configuration for this DSI output
> >> + *
> >> + * Adjust the pclk rate by calculating a new hdisplay proportional to
> >> + * the compression ratio such that:
> >> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
> > 
> > And in v1 you explained that it is _not_ about bpp...
> 
> Hmm, this bit stayed intact, so I'm slightly confused here.

It did, because no-one bothered to respond to my questions about this
BPP rate versus "pixels/bytes per pclk" inquiry.  So I just keep
repeating it every patch that touches/mentions it, until someone
replies.

>   This function is about BPP and compressed rate. dsi_timing_setup() is 
> about bytes.

The question is whether that is _correct_.  The discussion all this time
is about pclk - even for compressed mode - counting the number of
pixels, not the bpp ratio.

> >> + *
> >> + * Porches do not need to be adjusted:
> >> + * - For the VIDEO mode they are not compressed by DSC and are passed as is.
> >> + * - For the CMD mode there are no actual porches. Instead these fields
> > 
> > I feel like "For VIDEO mode" and "For CMD mode" reads more naturally, no
> > need for "the", but I don't know the grammar rule that states so.
> 
> Ack
> 
> > 
> >> + *   currently represent the overhead to the image data transfer. As such, they
> >> + *   are calculated for the final mode parameters (after the compression) and
> >> + *   are not to be adjusted too.
> >> + *
> >> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
> >> + *  refresh rate and data overhead as a starting point of the calculations.
> > 
> > Nit: well, refresh rate is already part of this calculation (that's how
> > drm_display_mode's clock member comes to be, and how drm_mode_vrefresh()
> > figures out fps after the fact).  It's all about the per-CMD transfer
> > overhead in bytes that is currently not part of the calculation.
> 
> Please correct me if I'm wrong, we start from mode->clock. Refresh rate 
> isn't even a part of struct drm_display_mode.

It is not a separate field because it is _embedded in mode->clock_ (see
how drm_mode_vrefresh() is implemented to divide ->clock by htotal and
vtotal to get the fps again), and hence already part of the values used
in this calculation.

> >> + */
> >>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
> >>   		const struct drm_dsc_config *dsc)
> >>   {
> >> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   		if (ret)
> >>   			return;
> >>   
> >> -		/* Divide the display by 3 but keep back/font porch and
> >> -		 * pulse width same
> >> +		/*
> >> +		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is
> > 
> > Should this be pixels (1 pixel), not bytes, just like in the compressed
> > scenario?
> 
> No.

So if the uncomrpessed BPP changes, pclk _also changes_?

- Marijn

> >> +		 * not used, a single pixel is transferred at each pulse, no
> >> +		 * matter what bpp or pixel format is used. In case of DSC
> >> +		 * compression this results (due to data alignment
> >> +		 * requirements) in a transfer of 3 compressed pixel per pclk
> >> +		 * cycle.
> >> +		 *
> >> +		 * If widebus is enabled, bus width is extended to 6 bytes.
> >> +		 * This way the DPU can transfer 6 compressed pixels with bpp
> >> +		 * less or equal to 8 or 3 compressed pixels in case bpp is
> >> +		 * greater than 8.
> > 
> > Okay, so one can not send more than 6 pixels even if the bpp is less
> > than 8, is what this comes down to.
> 
> Yes.
> 
> > 
> >> +		 *
> >> +		 * The back/font porch and pulse width are kept intact.  They
> >> +		 * represent timing parameters rather than actual data
> >> +		 * transfer. See the documentation of
> >> +		 * dsi_adjust_pclk_for_compression().
> > 
> > Nit: note that this is only for VIDEO mode, h_total and ha_end are
> > accurately unused in the CMDmode path below.
> > 
> > - Marijn
> > 
> >> +		 *
> >> +		 * XXX: widebus is not supported by the driver (yet).
> >>   		 */
> >>   		h_total -= hdisplay;
> >>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> >> -- 
> >> 2.39.2
> >>
> 
> -- 
> With best wishes
> Dmitry
> 
