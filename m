Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37617680FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 20:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjG2Sbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 14:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG2Sbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 14:31:45 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B4A12D
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 11:31:39 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 83F1E3F261;
        Sat, 29 Jul 2023 20:31:37 +0200 (CEST)
Date:   Sat, 29 Jul 2023 20:31:36 +0200
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
Subject: Re: [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE operations only when
 supported by HW
Message-ID: <sul276fwfmniat5dlkdj4rlw3dxjmqrg254iteblwbdlhwfxmg@4orla7ystkp4>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
 <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-29 02:59:32, Dmitry Baryshkov wrote:
> On 27/07/2023 23:03, Marijn Suijten wrote:
> > On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
> >> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> >> Rather than checking for the flag, check for the presense of the
> >> corresponding interrupt line.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > That's a smart use of the interrupt field.  I both like it, and I do
> > not.  While we didn't do any validation for consistency previously, this
> > means we now have multiple ways of controlling available "features":
> > 
> > - Feature flags on hardware blocks;
> > - Presence of certain IRQs;
> > - DPU core revision.
> 
> I hesitated here too. For INTF it is clear that there is no other good 
> way to check for the TE feature. For PP we can just check for the DPU 
> revision.

For both we could additionally check the DPU revision, and for INTF we
could check for TYPE_DSI.  Both would aid in extra validation, if we
require the IRQ to be present or absent under these conditions.

It might also help to document this, either here and on the respective
struct fields so that catalog implementers know when they should supply
or leave out an IRQ?

- Marijn

> > Maybe that is more confusing to follow?  Regardless of that I'm
> > convinced that this patch does what it's supposed to and gets rid of
> > some ambiguity.  Maybe a comment above the IF explaining the "PP TE"
> > feature could alleviate the above concerns thoo.  Hence:
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> index 9298c166b213..912a3bdf8ad4 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
> >>   	c->idx = cfg->id;
> >>   	c->caps = cfg;
> >>   
> >> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
> >> +	if (cfg->intr_rdptr) {
> >>   		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> >>   		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
> >>   		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> >> -- 
> >> 2.39.2
> >>
> 
> -- 
> With best wishes
> Dmitry
> 
