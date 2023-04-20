Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E75C6E9E84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 00:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbjDTWBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 18:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbjDTWBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 18:01:44 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94AFE5265
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:01:38 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8AA41204BD;
        Fri, 21 Apr 2023 00:01:36 +0200 (CEST)
Date:   Fri, 21 Apr 2023 00:01:35 +0200
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
Subject: Re: [PATCH] drm/msm/dpu: drop the regdma configuration
Message-ID: <5p4ospar4woaefr76x5rv6f5mgj76mzkuqihjdrngmntulaiwi@pe5sa75avguz>
References: <20230420200742.1200531-1-dmitry.baryshkov@linaro.org>
 <75d7qx65ksvzgwb7xdkn26krqyih3ipi4hjyvw5mvgfsafvjnu@zauwifqiirk4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75d7qx65ksvzgwb7xdkn26krqyih3ipi4hjyvw5mvgfsafvjnu@zauwifqiirk4>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Whoops, looks like I wrongly lost all the cc's when importing b4-am's
mbx file which is just a patch with a few but not all email headers.
Cc'ing everyone on this occasion with my review.

On 2023-04-20 23:33:07, Marijn Suijten wrote:
> On 2023-04-20 23:07:42, Dmitry Baryshkov wrote:
> > The regdma is currently not used by the current driver. We have no way
> 
> Nit: 2x current
> 
> > to practically verify that the regdma is described correctly. Drop it
> > now.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Do we need to keep the `regdma` range that is `ioremap`ed in
> `dpu_kms.c`?  Only msm8998-dpu allows it in the bindings anyway.
> 
> > ---
> >  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  2 -
> >  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  2 -
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 40 -------------------
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 18 ---------
> >  12 files changed, 78 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > index 2b3ae84057df..aa923fb2ebcb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > @@ -195,8 +195,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
> >  	.intf = msm8998_intf,
> >  	.vbif_count = ARRAY_SIZE(msm8998_vbif),
> >  	.vbif = msm8998_vbif,
> > -	.reg_dma_count = 0,
> > -	.perf = &msm8998_perf_data,
> 
> Don't think you intended to remove the perf data?  There's no dma_cfg
> member because the count is zero.

- Marijn
