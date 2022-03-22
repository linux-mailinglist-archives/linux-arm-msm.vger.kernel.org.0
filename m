Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1C64E44D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Mar 2022 18:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239454AbiCVRSY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Mar 2022 13:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238233AbiCVRSY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Mar 2022 13:18:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CD56FA0A;
        Tue, 22 Mar 2022 10:16:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 002E36148C;
        Tue, 22 Mar 2022 17:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE791C340EC;
        Tue, 22 Mar 2022 17:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647969415;
        bh=R0FjRnlWn0CYefCmkkvFDs/ZDJZEsHt1WDcB2QF+9NU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X+kF6VxLOPpSX1sF2iWKvt6bvtuzEUBnUgWD0T+7PN6sje9YiKOPtnZBvsU4t5h23
         qxB6PKuC9Avk7iE7LPE3TDlwKpJyiJpgsY1MfdudEJ5NXWAgEqmbkWNBvFOOnC9y4M
         eNfSa1vKiHHM+HSBez2pZ2LVtcmBRHXnycbE9jDuA9kcwL9SmEoHZiuP1Z2EJOrGoR
         E75gWGTTcLqOa9ErD+pTRK7sUdClDfa52beKefCKP/u2cv/3qDi5/FXj8pP+XGMhUr
         9yakwrnx4MJlqMGXarjnGWaZ0i1lxnfMTFub8LVYnXFWK3s2uCYc8i7rPXXdqcdz1a
         TSF90Eh1XYoag==
Date:   Tue, 22 Mar 2022 22:46:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 12/13] drm/msm/dsi: Add support for DSC
 configuration
Message-ID: <YjoEgpAZAwM8hWEa@matsya>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-13-vkoul@kernel.org>
 <20211211000315.pavmcc7cc73ilb6l@SoMainline.org>
 <Yg4t/G3tgcmkswHg@matsya>
 <20220217151142.sbp6wslxbxeohsgf@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217151142.sbp6wslxbxeohsgf@SoMainline.org>
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-02-22, 16:11, Marijn Suijten wrote:
> Hi Vinod,
> 
> Thanks for taking time to go through this review, please find some
> clarifications below.
> 
> On 2022-02-17 16:44:04, Vinod Koul wrote:
> > Hi Marijn,
> > 
> > On 11-12-21, 01:03, Marijn Suijten wrote:
> > 
> > > > +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
> > > > +				  int pic_width, int pic_height)
> > > 
> > > This function - adopted from downstream - does not seem to perform a
> > > whole lot, especially without the modulo checks against the slice size.
> > > Perhaps it can be inlined?
> > 
> > Most of the code here is :)
> > 
> > This was split from downstream code to check and update dimension. We
> > can inline this, or should we leave that to compiler. I am not a very
> > big fan of inlining...
> 
> It doesn't seem beneficial to code readability to have this function,
> which is only called just once and also has the same struct members read
> in a `DBG()` directly, abstracted away to a function.  Not really
> concerned about generated code/performance FWIW.
> 
> Also note that the caller isn't checking the `-EINVAL` result...

I have made this void inline.

> > > 
> > > > +{
> > > > +	if (!dsc || !pic_width || !pic_height) {
> > > > +		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", pic_width, pic_height);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	dsc->drm->pic_width = pic_width;
> > > > +	dsc->drm->pic_height = pic_height;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > > >  {
> > > >  	struct drm_display_mode *mode = msm_host->mode;
> > > > @@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > > >  		hdisplay /= 2;
> > > >  	}
> > > >  
> > > > +	if (msm_host->dsc) {
> > > > +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> > > > +
> > > > +		/* update dsc params with timing params */
> > > > +		dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
> 
> That is, the result code here should be checked (or function inlined).

This function return void, so no point in checking

> > > > +
> > > > +		/* we do the calculations for dsc parameters here so that
> > > > +		 * panel can use these parameters
> > > > +		 */
> > > > +		dsi_populate_dsc_params(dsc);
> > > > +
> > > > +		/* Divide the display by 3 but keep back/font porch and
> > > > +		 * pulse width same
> > > > +		 */
> > > 
> > > A more general nit on the comments in this patch series: it is
> > > appreciated if comments explain the rationale rather than - or in
> > > addition to - merely paraphrasing the code that follows.
> > 
> > Yes it might be the case here, but in this case I wanted to explicitly
> > point out hat we need to divide display by 3...
> 
> The main point here is justifying _why_ there's a division by 3 for the
> active portion of the signal, I presume that's the compression ratio
> (having not read into the DSC compression standard yet at all)?

I have updated this comment

> > > > +		if (msm_host->dsc) {
> > > > +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> > > > +			u32 reg, reg_ctrl, reg_ctrl2;
> > > > +			u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
> > > > +
> > > > +			reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> > > > +			reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
> > > 
> > > Shouldn't old values be masked out first, before writing new bits or
> > > values below?  The video-mode variant doesn't read back old register
> > > values.
> > 
> > This follows downstream where the registers are read, modified and
> > written back
> 
> Are you sure about this?  The register values are never cleared, meaning
> that only bits get added through the `|=` below but never unset - unless
> downstream clears these registers elsewhere before ending up in (their
> equivalent of) dsi_timing_setup.

I have modified video mode to write and not read now. For command mode
all bits are set to some value so no need to mask old values for that

> Thanks.  I forgot to mention: there seem to be a lot of similarities
> between the video and commandmode computations, can those possibly be
> factored out of the if-else to save on duplication and accidental
> mismatches like these?

Thanks, this was a good suggestion and am happy to report that I have
incorporated this and indeed code looks better

-- 
~Vinod
