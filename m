Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAE274702E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 13:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjGDLw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 07:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjGDLw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 07:52:26 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A2EAF
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 04:52:24 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-be49ca27e1fso6059940276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 04:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688471543; x=1691063543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2zZUsNxEO8W5BrVp3ttVh4FhVCcFwHiBUECIJfdtg+8=;
        b=q8no0c+om45qRmj9VwnPj/EDKVv+jIOYzfXQBpOHkfOFfWd9K+H/MZjTqF78Ch5xa6
         w0LinXA7jBy2xW6y34gYsGmp2O3/DW1QhngkMSllQey/OwN1CNWm4UvlneB4boTnZzl8
         sEJd+PSEl+DpLYJX1wjFmrYbyxjiRkUYGYkjb/5VPj+pHEqgRpfBiPhafw4xhoBSqoKT
         BIcAlEshBBrmdp64EICvUA9eezxcpno811KmdGomdnMjq0ZJoJnJ03kwP+yEJZ3hbsz4
         XJeBOdoTuhBLik4pND0uf0gDlSGttxNmWJh/7ePZ+e+d+o2bdMmDjsnFyqBIASGQK7YP
         5kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688471543; x=1691063543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zZUsNxEO8W5BrVp3ttVh4FhVCcFwHiBUECIJfdtg+8=;
        b=L1j102CC5nQ/TZ6LbMtUdlsOZz8swJG78T6fDSZif0YNN1oPNic5pTLZHCK2+TQUdw
         iEQzll9XG8+DgEG7C4JMb3p4lyDcLho6ioiAcw23fMyabFYy2OZ+vBGokCTYP7A8z0a8
         aQc9qBVWvwsIcp+/SrmxicMlhJV9MwkZszeUv3Gwe1oA7PCxdD0R2ytuk81SnTvFbR2r
         xva2fpz4fwCfmgpetpc4vdUZBO0zjc1AfwAgg0JxIBXQVrA8K6ZMekr7m++GIlhJwMLX
         sSuTF/cJcg985qVAaNzYCOkwqWHxzMxPbQEdux0mNDYEATu+kPA3MKhTSsz66mXjiPR0
         E3gw==
X-Gm-Message-State: ABy/qLYtUD6VGsUcvMxdCcdU1JC/F9s2cTyeBUW1shFAX/3mbcicuc6O
        TIH0l7izgoKDN+EtYFOX8HQ44+9CJdYRuMVMKa/tpA==
X-Google-Smtp-Source: APBJJlEGJz7XXswIBp3yKVRenGx4pLHSTSUM32fVZ0/EF1KYhxxc7/LcWGhcmBXtEclVlS3g1nr+UI4/uHcVBBPQggc=
X-Received: by 2002:a25:ab92:0:b0:c5f:3df2:d26f with SMTP id
 v18-20020a25ab92000000b00c5f3df2d26fmr453097ybi.43.1688471543629; Tue, 04 Jul
 2023 04:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org> <0aafbba0-52dd-96d9-94a6-0452996e1eba@quicinc.com>
 <974a294c-d85d-a79f-5b83-bbbac12ff7a2@linaro.org> <50855184-1fbf-8e36-f0eb-a46be70b1eca@quicinc.com>
 <CAA8EJprQLpRNHShWWWZeSyKx3erat3Q7WUXhVV1pYp9UtQEgng@mail.gmail.com>
In-Reply-To: <CAA8EJprQLpRNHShWWWZeSyKx3erat3Q7WUXhVV1pYp9UtQEgng@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 14:52:12 +0300
Message-ID: <CAA8EJpqysGpZzEs1QGDec9Jian6gDy+SG6a_VormPF_cdq47hA@mail.gmail.com>
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

On Tue, 4 Jul 2023 at 13:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 4 Jul 2023 at 07:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 7/3/2023 7:20 PM, Dmitry Baryshkov wrote:
> > > On 03/07/2023 05:01, Abhinav Kumar wrote:
> > >>
> > >>
> > >> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
> > >>> There is always a single MDP TOP block. Drop the mdp_count field and
> > >>> stop declaring dpu_mdp_cfg instances as arrays.
> > >>>
> > >>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>> ---
> > >>
> > >> The change drops mdp_count and stops using the array which is fine and
> > >> I will support that.
> > >>
> > >> But looking at the pattern I saw while using core_revision, both
> > >> DPU_MDP_VSYNC_SEL and DPU_MDP_AUDIO_SELECT can also be dropped from
> > >> the catalog in favor of using core_revision.
> > >>
> > >> Hence for that, I request you not to stop passing dpu_mdss_cfg to
> > >> dpu_hw_mdptop_init as that has the necessary information of
> > >> core_revision.
> > >
> > > Sure, I'll restore it. Please note, however, that it might be better to
> > > pass struct dpu_caps instead of the full struct dpu_mdss_cfg.
> > >
> >
> > Thanks for restoring.
> >
> > Can you pls explain this better? dpu_core_rev is part of dpu_mdss_cfg,
> > so dpu_caps wont be enough for this one.
>
> Oh, true. For some reason I thought that version is a part of dpu_caps.

And after additional thought. Maybe it would be better to add a
separate struct dpu_mdss_version and pass it to the hw block init
functions?

>
> >
> > >>
> > >>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 +---
> > >>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 +---
> > >>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
> > >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 38 +++----------------
> > >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 ++--
> > >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
> > >>>   19 files changed, 41 insertions(+), 115 deletions(-)
> > >
>
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
