Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 185E8765D32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 22:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjG0UYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 16:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjG0UY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 16:24:29 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F153598
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 13:24:13 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0C2EB204BA;
        Thu, 27 Jul 2023 22:24:12 +0200 (CEST)
Date:   Thu, 27 Jul 2023 22:24:10 +0200
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
Subject: Re: [PATCH 5/7] drm/msm/dpu: drop DPU_INTF_TE feature flag
Message-ID: <xqzczgacnl76m5wsvhfbczpc54svf452azirw24dtqkrtw4ndi@gdvmmrt3u56x>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-6-dmitry.baryshkov@linaro.org>
 <bndyttm2ytf7bz2cdok4ewnd7vpv75ud4eqialpleihjs6ahr2@6ehcv3zjpkky>
 <2a38d144-3a2d-ee61-1554-ae94766b1d36@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a38d144-3a2d-ee61-1554-ae94766b1d36@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-27 23:16:22, Dmitry Baryshkov wrote:
> On 27/07/2023 23:14, Marijn Suijten wrote:
> > On 2023-07-27 19:21:02, Dmitry Baryshkov wrote:
> >> Replace the only user of the DPU_INTF_TE feature flag with the direct
> >> DPU version comparison.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
> >>   3 files changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> index 9589fe719452..60d4dd88725e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> @@ -776,8 +776,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
> >>   	phys_enc->intf_mode = INTF_MODE_CMD;
> >>   	cmd_enc->stream_sel = 0;
> >>   
> >> -	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
> >> -					 &phys_enc->hw_intf->cap->features);
> >> +	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
> >> +		phys_enc->has_intf_te = true;
> > 
> > We could also check if the INTF block has the callbacks (which it based
> > on the presence of the interrupt line in the catalog instead), but then
> > I think we might loose some extra validation which you tidied up in a
> > later patch in this series?
> 
> Almost. The logic was the following: we should be using INTF for DPU >= 
> 5.0. And if we have DPU >= 5.0 and no callbacks, it's an error.

Indeed.  Let's keep that validation just in case.

- Marijn
