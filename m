Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10DAC70CDD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 00:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjEVWZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 18:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbjEVWYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 18:24:52 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95988E
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:24:37 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 758D03ED94;
        Tue, 23 May 2023 00:24:35 +0200 (CEST)
Date:   Tue, 23 May 2023 00:24:34 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
Message-ID: <m6usbg7kwvtf73t3sitsl7vglkotqnqdvdg5eq56wzwrjfvosz@e3fh4jc7sejx>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-2-dmitry.baryshkov@linaro.org>
 <tc35qb4qkzoanna5mqiibdfv5ascdm2wtcalbspr4u64nwkc3v@itowzdap5vjq>
 <bf4f2183-dba2-d8c6-2ad5-2c0dcee7810e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf4f2183-dba2-d8c6-2ad5-2c0dcee7810e@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-23 01:01:50, Dmitry Baryshkov wrote:
> On 23/05/2023 00:56, Marijn Suijten wrote:
> > Title suggestion: s/globally/on non-TE/DSI (INTF) blocks
> > 
> > On 2023-05-23 00:45:22, Dmitry Baryshkov wrote:
> >> Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
> >> INTF_SC7280_MASK) results in this bit (and corrsponding operations)
> >> being enabled for all interfaces, even the ones which do not have TE
> >> block. Move this bit setting to INTF_DSI_TE(), so that it is only
> >> enabled for those INTF blocks which have TE support.
> >>
> >> Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
> >> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > We've always been setting flags globally but I guess it makes sense to
> > not only restrict this flag to DPU >= 5.0.0 but also just the few
> > hardware blocks that actually have these in their *enlarged* register
> > space (and have the interrupt).
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index 1dee5ba2b312..162141cb5c83 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -101,7 +101,6 @@
> >>   
> >>   #define INTF_SC7180_MASK \
> >>   	(BIT(DPU_INTF_INPUT_CTRL) | \
> >> -	 BIT(DPU_INTF_TE) | \
> >>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
> >>   	 BIT(DPU_DATA_HCTL_EN))
> >>   
> >> @@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
> >>   	{\
> >>   	.name = _name, .id = _id, \
> >>   	.base = _base, .len = _len, \
> >> -	.features = _features, \
> >> +	.features = _features | BIT(DPU_INTF_TE), \
> > 
> > Now that we're more broadly switching to this pattern, should we do the
> > same for PP_BLK() with and without TE block?  That way we can also
> > forcefully initialize intr_rdptr=-1 similar to what I did for
> > intr_tear_rd_ptr in INTF_BLK() (vs INTF_BLK_DSI_TE) here, instead of
> > having the -1's floating around the catalog when I added them in commit
> > 7952f5180eb3e ("drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0
> > pingpong config").
> 
> If we are going to expand the macros, then hiding -1 probably doesn't 
> make sense as it will reappear soon.
> 
> Probably it makes sense to do another thing (which would play better 
> with the expanded macros): increase IRQ indices by 1, making 'NO IRQ' 
> equal to 0 instead of -1. This way all non-existing interrupts can be 
> omitted during macros expansion. WDYT?

I'm fine explicitly setting it to -1 to clarify it is missing.  On the
other hand, default struct initialization might accidentally initialize
it to the first interrupt on MDP_SSPP_TOP0_INTR (when users forget to
write the member), where it makes sense to start at 1 instead.  Need to
think about this for a bit.
(The forced number of arguments is an advantage of the macro, even if we
 now have too many numeric constants to know which field it sets)

- Marijn

> > - Marijn
> > 
> >>   	.type = _type, \
> >>   	.controller_id = _ctrl_id, \
> >>   	.prog_fetch_lines_worst_case = _progfetch, \
> >> -- 
> >> 2.39.2
> >>
> 
> -- 
> With best wishes
> Dmitry
> 
