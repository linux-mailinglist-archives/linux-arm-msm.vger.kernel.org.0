Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E82907477C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 19:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbjGDR27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 13:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjGDR26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 13:28:58 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E9C10E3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 10:28:48 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-c4e4c258ba9so3494552276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 10:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688491728; x=1691083728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjr5j18p7LKEXxbKYUJKQGvg5Rhqb0XiCKMH8xNravk=;
        b=Td2t4wx2DXLtIfS7dLitB2hxELIP9/ACSNUBY3NgdDETSKFdWpnJ3Cb/2rgBjMvsSY
         NNVVUlrs8Nitjg65EGBxZ+CTXrOt51yTn+jH8T0NONZBJp5eQWAoVbUJKy8f+aaarAzQ
         noELqTuTZPO8lupuI/jByMbxUWruE6hQNTtFxhoGOp/6Tveu6GbYx15ZtMhciUpB7JPe
         0KZVwLc1QqVHOzKk6Qy4THhE8oxIM808i4oUrqDq0L/Mg9K+eXPQVZkTE5x4nSKwrmxd
         gKb1r+KDSApjXb2VPz9GFbBPobH22oT7CMQX40wemhVa0tFL7zQmXWjcfVRBinP0WvxM
         CbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688491728; x=1691083728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rjr5j18p7LKEXxbKYUJKQGvg5Rhqb0XiCKMH8xNravk=;
        b=Er8DM6Keg8VrkU4+V5k1xd1uLkNOjbXSn4h4MNnKRkU289HNtXlgQrNEe0xMwezu4d
         hKK5AY+rtkjz7wV6hALOP0VUgOw8MzDsB8hipb95LxmtKkNx3CxRXZvC1dJPyRhHUUqx
         fIoBCWJkkX+GYCn3cRvyLo0XeeBEVLhzaI32RCWjVV1NK1GdT5Q6+cyHsbtgKccy/wXL
         zjNcDL+fx0fXLs39ZdOZtSHL4gD1GajoNPTQoFbMP/lq0woChbLbyv9ob+bzk+HFmDJW
         5DZdAEQ+rZPEN9LcvFBLHUvEo+u0QjO/JqoUYUTnXKIIu4GPErYqhlupfGK6ZNBO/5oc
         go9w==
X-Gm-Message-State: ABy/qLYh6SjehAAQxEi0cTNSqtPtEn6BnJdk2mY/4XhheSV5LKzXgyvl
        MZTbziilYgsWtN/eipiyYe87Ouzx111C1ZylQzmznQ==
X-Google-Smtp-Source: APBJJlEl2OEA3aPdrNtBWURoivz8QZynP3kOEqVKAfA9lgAIyr8FABCJ7GuIlvQfSFoPXhrV66HWwG3/SU0t3dV7NnU=
X-Received: by 2002:a25:1684:0:b0:c41:51cf:f4ed with SMTP id
 126-20020a251684000000b00c4151cff4edmr10605746ybw.32.1688491727915; Tue, 04
 Jul 2023 10:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org> <0aafbba0-52dd-96d9-94a6-0452996e1eba@quicinc.com>
 <974a294c-d85d-a79f-5b83-bbbac12ff7a2@linaro.org> <50855184-1fbf-8e36-f0eb-a46be70b1eca@quicinc.com>
 <CAA8EJprQLpRNHShWWWZeSyKx3erat3Q7WUXhVV1pYp9UtQEgng@mail.gmail.com>
 <CAA8EJpqysGpZzEs1QGDec9Jian6gDy+SG6a_VormPF_cdq47hA@mail.gmail.com> <99ec07f7-8892-9cfe-e843-c0f2d9eef658@quicinc.com>
In-Reply-To: <99ec07f7-8892-9cfe-e843-c0f2d9eef658@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 20:28:37 +0300
Message-ID: <CAA8EJprnPzQz2Nj+iA-M63YeE=esdPZs5dYrnkNEmH1wdMn-Xg@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 4 Jul 2023 at 19:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/4/2023 4:52 AM, Dmitry Baryshkov wrote:
> > On Tue, 4 Jul 2023 at 13:06, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Tue, 4 Jul 2023 at 07:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>
> >>>
> >>>
> >>> On 7/3/2023 7:20 PM, Dmitry Baryshkov wrote:
> >>>> On 03/07/2023 05:01, Abhinav Kumar wrote:
> >>>>>
> >>>>>
> >>>>> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
> >>>>>> There is always a single MDP TOP block. Drop the mdp_count field and
> >>>>>> stop declaring dpu_mdp_cfg instances as arrays.
> >>>>>>
> >>>>>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> ---
> >>>>>
> >>>>> The change drops mdp_count and stops using the array which is fine and
> >>>>> I will support that.
> >>>>>
> >>>>> But looking at the pattern I saw while using core_revision, both
> >>>>> DPU_MDP_VSYNC_SEL and DPU_MDP_AUDIO_SELECT can also be dropped from
> >>>>> the catalog in favor of using core_revision.
> >>>>>
> >>>>> Hence for that, I request you not to stop passing dpu_mdss_cfg to
> >>>>> dpu_hw_mdptop_init as that has the necessary information of
> >>>>> core_revision.
> >>>>
> >>>> Sure, I'll restore it. Please note, however, that it might be better to
> >>>> pass struct dpu_caps instead of the full struct dpu_mdss_cfg.
> >>>>
> >>>
> >>> Thanks for restoring.
> >>>
> >>> Can you pls explain this better? dpu_core_rev is part of dpu_mdss_cfg,
> >>> so dpu_caps wont be enough for this one.
> >>
> >> Oh, true. For some reason I thought that version is a part of dpu_caps.
> >
> > And after additional thought. Maybe it would be better to add a
> > separate struct dpu_mdss_version and pass it to the hw block init
> > functions?
> >
>
> I would like to see this evolve. Today, we are assuming that only the hw
> block init functions are the places we would use those.
>
>  From what I recall, the DSC over DP series needed the core_revision in
> the timing gen code somewhere.

I hope you are talking about the DPU driver here, not about the DP
driver. For the DP driver please use struct msm_dp_desc.

>
> If we see that pattern is possible once that lands, why not.
>
> Right now, I would leave it at dpu_mdss_cfg.
>
> >>
> >>>
> >>>>>
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 +---
> >>>>>>    .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 +---
> >>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
> >>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 38 +++----------------
> >>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 ++--
> >>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
> >>>>>>    19 files changed, 41 insertions(+), 115 deletions(-)
> >>>>
> >>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
> >
> >
> >



-- 
With best wishes
Dmitry
