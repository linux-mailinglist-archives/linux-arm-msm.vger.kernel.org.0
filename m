Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1955167CE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 22:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241074AbiEAUod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 16:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238355AbiEAUoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 16:44:32 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4220AE79
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 13:41:05 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B54E03ED82;
        Sun,  1 May 2022 22:41:03 +0200 (CEST)
Date:   Sun, 1 May 2022 22:41:02 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Message-ID: <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-04-30 22:28:42, Dmitry Baryshkov wrote:
> On 30/04/2022 21:58, Marijn Suijten wrote:
> > On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
> >> The downstream uses read-modify-write for updating command mode
> >> compression registers. Let's follow this approach. This also fixes the
> >> following warning:
> >>
> >> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I pointed this out in review multiple times, so you'll obviously get my:
> 
> I think I might have also pointed this out once (and then forgot to 
> check that the issue was fixed by Vinod).
> 
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > (But are you sure there's nothing else to clear in the 1st CTRL
> > register, only the lowest 16 bits?  That should mean `reg` never
> > contains anything in 0xffff0000)
> 
> Judging from the downstream the upper half conains the same fields, but 
> used for other virtual channel. I didn't research what's the difference 
> yet. All the dtsi files that I have here at hand use 
> 'qcom,mdss-dsi-virtual-channel-id = <0>;'

As replied to Abhinav I'm simply asking whether we should be strict
and add `reg & 0xffff` to prevent accidentally writing the top 16 bits,
which are stream 1.  It doesn't seem like the current code can hit that
though, with all the macros using masks internally already; but it's
still a little scary since we're assuming the registers for VIDEO are
identical to CMD (as mentioned in the reply to Abhinav: I wonder if it's
possible to declare a a pair of bitfields as a single layout in the XML,
and reuse that across CMD's stream 0/1 and the VIDEO register).

> > However, this seems to indicate that the DSC patch series has been
> > approved and merged somehow??
> 
> Pending inclusion, yes. If Vinod missed or ignored any other review 
> points, please excuse Abhinav and me not noticing that.

Vinod replied to most of the comments so I'll double-check if they were
applied in the way requested.  Note that I don't always post a full
review up-front if it gets too noisy: I'll simply start out with the
most glaring issues and go in more detail in further revisions to
prevent drowning everyone in comments.

> Can you please take a look at the latest revision posted, if there are 
> any other missing points. Let's decide if there are grave issues or we 
> can work them through.

Thanks, I'll queue that up this week.  One of my thus-far-unaddressed
issues with the patches which can't be addressed in hindsight is the
relatively lackluster commit messages: most happen to be repeating the
title in a slightly different way without any additional clarification,
which doesn't fit the upstream spirit at all.
I understand that the reference manuals can't be quoted nor am I asking
to, but a little more insight in the process and details of each patch
goes a very long way.  Explain how certain calculations work or came to
be, link to public sources detailing the protocol, explain design
decisions or document how to use/test the feature and describe possible
limitations.
I usually link contributors to [1], but it's a bit of an odd read at
times.

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

In any case, given that you've already sent this patch and another three
patches [2] fixing/cleaning up the series tells me it's far from ready.
Most of this should just be handled - or have been handled - in review
and amended?

[2]: https://lore.kernel.org/linux-arm-msm/20220501151220.3999164-1-dmitry.baryshkov@linaro.org/T/#t

I'll look through v14 again this week and let you know.

- Marijn

> > 
> >> ---
> >>
> >> Changes since v1:
> >>   - Fix c&p error and apply mask clear to reg_ctrl2 instead of reg_ctrl
> >>     (Abhinav)
> >>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index c983698d1384..a95d5df52653 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -961,10 +961,13 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
> >>   		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> >>   		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
> >>   
> >> +		reg_ctrl &= ~0xffff;
> >>   		reg_ctrl |= reg;
> >> +
> >> +		reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
> >>   		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
> >>   
> >> -		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
> >> +		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
> >>   		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
> >>   	} else {
> >>   		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
> >> -- 
> >> 2.35.1
> >>
> 
> 
> -- 
> With best wishes
> Dmitry
