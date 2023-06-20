Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B113736B1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjFTLh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjFTLh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:37:57 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F28C170A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:37:51 -0700 (PDT)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl [82.72.63.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 51FEA1F87B;
        Tue, 20 Jun 2023 13:37:47 +0200 (CEST)
Date:   Tue, 20 Jun 2023 13:37:45 +0200
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
Subject: Re: [PATCH] drm/msm/dsi: Document DSC related pclk_rate and hdisplay
 calculations
Message-ID: <cqivx6g3xwsjyy7b3qyrlq4ojbx3alybdopm5gtx26xzs34nfc@kiktrnlxj3x2>
References: <20230616094152.495723-1-dmitry.baryshkov@linaro.org>
 <h2u5wsfbfpz7qivmxl3t37xen452zxt76uheonkwcihytfmb3l@axiy5bmwf4ma>
 <677b74dc-e0f5-22e9-2b21-a7272c661b6e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677b74dc-e0f5-22e9-2b21-a7272c661b6e@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-19 23:57:22, Dmitry Baryshkov wrote:
> On 16/06/2023 15:25, Marijn Suijten wrote:
> > On 2023-06-16 12:41:52, Dmitry Baryshkov wrote:
> >> Provide actual documentation for the pclk and hdisplay calculations in
> >> the case of DSC compression being used.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++++++++++++++++--
> >>   1 file changed, 33 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 3f6dfb4f9d5a..72c377c9c7be 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -528,6 +528,21 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
> >>   	clk_disable_unprepare(msm_host->byte_clk);
> >>   }
> >>   
> >> +/*
> >> + * Adjust the pclk rate by calculating a new hdisplay proportional to
> > 
> > Make this a kerneldoc with:
> 
> Ack
> 
> > 
> >      /**
> >       * dsi_adjust_pclk_for_compression() - Adjust ...
> > 
> >> + * the compression ratio such that:
> >> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
> >> + *
> >> + * Porches do not need to be adjusted:
> >> + * - For the VIDEO mode they are not compressed by DSC and are passed as is.
> > 
> > as-is
> 
> Cambridge dictionary gives this "as is", without dash.

I think you are right, it depends on whether this compound adjective
comes before or after (in this case after) the verb it modifies, and it
shouldn't be hyphenated if it comes after [1].

[1]: https://ell.stackexchange.com/questions/24014/as-it-is-and-as-is-as-as-a-conjunction-and-a-pronoun#comment45615_24105

> > Though this was never tested nor confirmed by QUIC, but we can assume it
> > is the case for now?
> > 
> >> + * - For the CMD mode the are no actual porches. Instead they represent the
> > 
> > the are no -> these are not
> > 
> > they currently* represent.  
> 
> Ack
> 
> > Let's make sure that folks read the FIXME
> > below by perhaps rewording it right into this entry?
> 
> I kept it separately, so that the FIXME can be removed once CMD handling 
> is reworked.
> 
> > 
> >> + *   overhead to the image data transfer. As such, they are calculated for the
> >> + *   final mode parameters (after the compression) and are not to be adjusted
> >> + *   too.
> >> + *
> >> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
> >> + *  refresh rate and data overhead as a starting point of the calculations.
> >> + */
> >>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
> >>   		const struct drm_dsc_config *dsc)
> >>   {
> >> @@ -926,8 +941,24 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   		if (ret)
> >>   			return;
> >>   
> >> -		/* Divide the display by 3 but keep back/font porch and
> >> -		 * pulse width same
> >> +		/*
> >> +		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is

Following your comment below, this should then also be "3 compressed
pixels"?

> >> +		 * not used, a single pixel is transferred at each pulse, no
> >> +		 * matter what bpp or pixel format is used. In case of DSC
> >> +		 * compression this results (due to data alignment
> >> +		 * requirements) in a transfer of 3 compressed pixel per pclk
> > 
> > 3 compressed bytes*, not pixels.
> 
> No, that's the point. With 6bpp one can think that 4 pixels would fit, 
> but they don't.

But that is not what Jessica was doing in the function that adjusts the
pclk **based on the bpp ratio** rather than this fixed factor relating
to the number of pixels you are bringing up here.  All this time the
code, discussion, and code-comments are contradictory and it makes it
impossible to understand.

And likewise, if we have bpp=10 or bpp=12, what will happen to pclk and
hdisplay?

(It makes sense from how DSC is implemented, processing groups of 3
 pixels at a time)

 In any case, then it is the plural pixels* not "3 compressed pixel".

> >> +		 * cycle.
> >> +		 *
> >> +		 * If widebus is enabled, bus width is extended to 6 bytes.
> >> +		 * This way the DPU can transfer 6 compressed pixels with bpp
> > 
> > pixels -> bytes?
> 
> Same comment, no.
> 
> > 
> >> +		 * less or equal to 8 or 3 compressed pyxels in case bpp is
> > 
> > pixels*... bytes?
> > 
> > And I will ask this **again**: does this mean we can halve pclk?
> 
> My guess would be no, since all other data transfers are not scaled by 
> wide bus.

Is the fact that we *don't scale it yet* definitive for saying that we
shouldn't?

- Marijn
