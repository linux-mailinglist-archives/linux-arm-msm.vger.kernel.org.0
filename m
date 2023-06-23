Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843E973B147
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 09:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjFWH0k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 03:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjFWH0j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 03:26:39 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5B010DB
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 00:26:36 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9993D3EFD3;
        Fri, 23 Jun 2023 09:26:34 +0200 (CEST)
Date:   Fri, 23 Jun 2023 09:26:33 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Message-ID: <eqdu44xcd6qdrmxcdr44dfcliydz6q4oombghjg6ptlcbxf22v@uhqnhnlv6gxi>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
 <b632e52d-7b86-9f5a-913a-aace26d9a039@linaro.org>
 <c2f632e7-8302-a77f-fc61-ccda3b5a8aac@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2f632e7-8302-a77f-fc61-ccda3b5a8aac@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-22 17:32:17, Abhinav Kumar wrote:
> 
> 
> On 6/22/2023 5:17 PM, Dmitry Baryshkov wrote:
> > On 23/06/2023 03:14, Abhinav Kumar wrote:
> >>
> >>
> >> On 6/19/2023 2:06 PM, Dmitry Baryshkov wrote:
> >>> Provide actual documentation for the pclk and hdisplay calculations in
> >>> the case of DSC compression being used.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>
> >>> Changes since v1:
> >>> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
> >>> - Added a pointer from dsi_timing_setup() docs to
> >>>    dsi_adjust_pclk_for_compression() (Marijn)
> >>> - Fixed two typo (Marijn)
> >>>
> >>> ---
> >>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
> >>>   1 file changed, 38 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
> >>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>> index 3f6dfb4f9d5a..a8a31c3dd168 100644
> >>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host 
> >>> *msm_host)
> >>>       clk_disable_unprepare(msm_host->byte_clk);
> >>>   }
> >>> +/**
> >>> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for 
> >>> compression case
> >>> + * @mode: the selected mode for the DSI output
> >>> + * @dsc: DRM DSC configuration for this DSI output
> >>> + *
> >>> + * Adjust the pclk rate by calculating a new hdisplay proportional to
> >>> + * the compression ratio such that:
> >>> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
> >>> + *
> >>> + * Porches do not need to be adjusted:
> >>> + * - For the VIDEO mode they are not compressed by DSC and are 
> >>> passed as is.
> >>> + * - For the CMD mode there are no actual porches. Instead these fields
> >>> + *   currently represent the overhead to the image data transfer. As 
> >>> such, they
> >>> + *   are calculated for the final mode parameters (after the 
> >>> compression) and
> >>> + *   are not to be adjusted too.
> >>> + *
> >>> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to 
> >>> use
> >>> + *  refresh rate and data overhead as a starting point of the 
> >>> calculations.
> >>> + */
> >>>   static unsigned long dsi_adjust_pclk_for_compression(const struct 
> >>> drm_display_mode *mode,
> >>>           const struct drm_dsc_config *dsc)
> >>
> >> I am fine with this part of the doc.
> >>
> >>>   {
> >>> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host 
> >>> *msm_host, bool is_bonded_dsi)
> >>>           if (ret)
> >>>               return;
> >>> -        /* Divide the display by 3 but keep back/font porch and
> >>> -         * pulse width same
> >>> +        /*
> >>> +         * DPU sends 3 bytes per pclk cycle to DSI. If compression is
> >>> +         * not used, a single pixel is transferred at each pulse, no
> >>> +         * matter what bpp or pixel format is used. In case of DSC
> >>> +         * compression this results (due to data alignment
> >>> +         * requirements) in a transfer of 3 compressed pixel per pclk
> >>> +         * cycle.
> >>> +         *
> >>
> >> I dont want to talk about data alignment nor formats and I will not 
> >> ack any references to those.
> >>
> >> I would like to keep this simple and say that DPU sends 3 bytes of 
> >> compressed data / pclk (6 with widebus enabled) and all this math is 
> >> doing is that its calculating number of bytes and diving it by 3 OR 6 
> >> with widebus to calculate the pclk cycles. Thats it.
> > 
> > This makes it unclear, why do we simply by 3 rather than doing * dsc_bpp 
> > / 24.  My description might be inaccurate as I don't have hw docs at 
> > hand, but simple description is not enough.
> > 
> 
> Why is it unclear? With compression, we are saying we process at 3 
> compressed bytes / pclk and this math is accurately giving the pclk cycles.
> 
> You are once again trying to arrive at 3 with compression factor in mind 
> by calculating target_bpp / src_bpp.
> 
> I am saying that its independent of that. Whenever we do compression 
> rate is 3 bytes of compressed data (and 6 with widebus) irrespective of 
> what your dsc_bpp was.

Abhinav, this is exactly what the confusion the pclk series is about.
There it was said (and committed to mainline now!) that pclk is based on
the compression factor of target_bpp / src_bpp.  Now you are saying
there is a fixed number of bytes sent by the (wide)bus between DPU-DSC
and DSI.

Is pclk used for more purposes besides just ticking for the data
transfer between DPU and DSI?

- Marijn
