Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F256EDC53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Apr 2023 09:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbjDYHQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 03:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbjDYHQ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 03:16:27 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6D89001
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 00:16:24 -0700 (PDT)
Received: from SoMainline.org (unknown [89.205.225.90])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 297F31F6C4;
        Tue, 25 Apr 2023 09:16:21 +0200 (CEST)
Date:   Tue, 25 Apr 2023 09:16:19 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Pass catalog pointers directly from
 RM instead of IDs
Message-ID: <r2tndjr5jbjtrwwti6l3ag7562e53nqx2uk6vz6fx43yc7sncl@eypc37r2ey3j>
References: <20230418-dpu-drop-useless-for-lookup-v2-0-acb08e82ef19@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v2-3-acb08e82ef19@somainline.org>
 <50d22e0c-84b3-0678-eb06-30fb66fd24cf@quicinc.com>
 <ymq4kstme55dm3j5kr6trevnwdelhjq7e7m4yky6zcbnf7auid@66l7inxz4oq2>
 <CAA8EJprYQUFER6x1+ucHX_Ze2uqWc6xoEaYDdJ1s0jgZjPJ0QQ@mail.gmail.com>
 <c809476f-74bc-0399-08f9-1bf26e7170fa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c809476f-74bc-0399-08f9-1bf26e7170fa@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-24 16:23:17, Abhinav Kumar wrote:
> 
> 
> On 4/24/2023 3:54 PM, Dmitry Baryshkov wrote:
> > On Tue, 25 Apr 2023 at 01:03, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> >>
> >> On 2023-04-21 16:25:15, Abhinav Kumar wrote:
> >>>
> >>>
> >>> On 4/21/2023 1:53 PM, Marijn Suijten wrote:
> >>>> The Resource Manager already iterates over all available blocks from the
> >>>> catalog, only to pass their ID to a dpu_hw_xxx_init() function which
> >>>> uses an _xxx_offset() helper to search for and find the exact same
> >>>> catalog pointer again to initialize the block with, fallible error
> >>>> handling and all.
> >>>>
> >>>> Instead, pass const pointers to the catalog entries directly to these
> >>>> _init functions and drop the for loops entirely, saving on both
> >>>> readability complexity and unnecessary cycles at boot.
> >>>>
> >>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> Overall, a nice cleanup!
> >>>
> >>> One comment below.
> >>>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 37 +++++----------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 14 ++++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 32 +++---------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h        | 11 +++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 38 ++++-----------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h       | 12 +++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +-
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 40 ++++++-----------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       | 12 +++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 38 ++++-----------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h         | 10 +++---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 33 +++----------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 14 ++++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 33 +++----------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 39 ++++------------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       | 12 +++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++----------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++---------------
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 11 +++----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
> >>>>    23 files changed, 139 insertions(+), 375 deletions(-)
> >>>>
> >>>
> >>> <snipped>
> >>>
> >>>> -struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
> >>>> -           void __iomem *addr,
> >>>> -           const struct dpu_mdss_cfg *m)
> >>>> +struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> >>>> +           void __iomem *addr)
> >>>>    {
> >>>>      struct dpu_hw_intf *c;
> >>>> -   const struct dpu_intf_cfg *cfg;
> >>>> +
> >>>> +   if (cfg->type == INTF_NONE) {
> >>>> +           pr_err("Cannot create interface hw object for INTF_NONE type\n");
> >>>> +           return ERR_PTR(-EINVAL);
> >>>> +   }
> >>>
> >>> The caller of dpu_hw_intf_init which is the RM already has protection
> >>> for INTF_NONE, see below
> >>>
> >>>           for (i = 0; i < cat->intf_count; i++) {
> >>>                   struct dpu_hw_intf *hw;
> >>>                   const struct dpu_intf_cfg *intf = &cat->intf[i];
> >>>
> >>>                   if (intf->type == INTF_NONE) {
> >>>                           DPU_DEBUG("skip intf %d with type none\n", i);
> >>>                           continue;
> >>>                   }
> >>>                   if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
> >>>                           DPU_ERROR("skip intf %d with invalid id\n",
> >>> intf->id);
> >>>                           continue;
> >>>                   }
> >>>                   hw = dpu_hw_intf_init(intf->id, mmio, cat);
> >>>
> >>> So this part can be dropped.
> >>
> >> I mainly intended to keep original validation where _intf_offset would
> >> skip INTF_NONE, and error out.  RM init is hence expected to filter out
> >> INTF_NONE instead of running into that `-EINVAL`, which I maintained
> >> here.
> >>
> >> If you think there won't be another caller of dpu_hw_intf_init, and that
> >> such validation is hence excessive, I can remove it in a followup v3.
> > 
> > I'd prefer to see the checks at dpu_rm to be dropped.
> > dpu_hw_intf_init() (and other dpu_hw_foo_init() functions) should be
> > self-contained. If they can not init HW block (e.g. because the index
> > is out of the boundaries), they should return an error.
> > 
> 
> They already do that today because even without this it will call into 
> _intf_offset() and that will bail out for INTF_NONE.
> 
> I feel this is a duplicated check because the caller with the loop needs 
> to validate the index before passing it to dpu_hw_intf_init() otherwise 
> the loop will get broken at the first return of the error and rest of 
> the blocks will also not be initialized.

To both: keep in mind that the range-checks we want to remove from
dpu_rm_init validate the ID (index?) of a block.  This check is for the
*TYPE* of an INTF block, to skip it gracefully if no hardware is mapped
there.  As per the first patch of this series SM6115/QCM2290 only have a
DSI interface which always sits at ID 1, and ID 0 has its TYPE set to
INTF_NONE and is skipped.

Hence we _should_ keep the graceful TYPE check in dpu_rm_init() to skip
calling this function _and assigning it to the rm->hw_intf array_.  But
I can remove the second TYPE check here in dpu_hw_intf_init() if you
prefer.

- Marijn
