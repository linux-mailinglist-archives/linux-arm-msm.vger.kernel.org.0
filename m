Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E4D767654
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 21:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbjG1TaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 15:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjG1TaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 15:30:10 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3940D2701
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 12:30:09 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d066d72eb12so3441712276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690572608; x=1691177408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i6evbpmMDRBzawlsxlhOXtIwN0WcdqEt1J3AYsgsj0c=;
        b=gA/PPyByF+jM0afGt/9Us4WhAjPEDZEK6EDvYKFteUFZfEpukQIvv0IEcviznA7yRt
         g5fcFV2wcx50aqebbxAZDWXSmDF2SuXDjlMqT8Dx1jXcTNNtvkYSjlGcL8QyHb4EyLoj
         RBKyNk6S57/hwJbtrY+9OgV0N7UHoWNsAD3tVW4Y1d2a+pV95PMOuZBcOVrLbQG6r2xx
         d4OSXtxj8nCJXz2FVXrwhnHB3qeFl7NQRhCjNzD6XU7kaoEsxvRWxyv1vq0deqStFbhU
         0sRqpJO1MkP43blzL7R01XS5qH3Sswb46EWNKPEhMZIJlOl4T/q5XEygLZL2LKgwUAIx
         4aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690572608; x=1691177408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6evbpmMDRBzawlsxlhOXtIwN0WcdqEt1J3AYsgsj0c=;
        b=Qla/tq1TrG74/UFvhGb20RTEWooAd4iuktqGQbGAqoR1D1Zvi9lcGTJysf+ISsrBac
         o0hbGqY8inHxP3uvLrVp2xjBguN5EZXPxLx3hCbBaTKSGfQouZfamiSZqXRulg20Q4Ch
         ewU99l4wTkfH6a52ZsFATJ5AiQAW7Ot5EWMANLr6oOWdcc6m1yK0WKhk4CyaBopcQeeF
         k1E4M62QGBhGZ6WkB0c4qfYGY0GWzk/0CMQ61ZKl1emDRFIfMK90VqmruR/NOnuvtgl1
         6B96c2XVE9jNd1vpOo6ntFWI031xtdA2GxBo1iEHGwIeFnvicaSfw4rSp0BxtM+978uy
         wPoQ==
X-Gm-Message-State: ABy/qLZR/9Y0GVRdLRILjd9DudIfbJGfmB7dQ7feyhL0Vqv6VBt016wP
        72NWMnAEnO9ip9J/VKlLtEtLsLPOw9iP4hu2IV85Cq+4yeDS154X
X-Google-Smtp-Source: APBJJlFkcVjfs4mJhG7uYobs7WEJHWgcXgtb39VUBNzdURL0/o0FxJY2O9UG2mlQeWGlOQ6i/6NXyUlN1UqOZ+E9NBs=
X-Received: by 2002:a25:26c6:0:b0:d05:2616:3363 with SMTP id
 m189-20020a2526c6000000b00d0526163363mr3148059ybm.26.1690572608035; Fri, 28
 Jul 2023 12:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-6-dmitry.baryshkov@linaro.org> <4e35dabb-640e-8de6-d98a-619b2f80cfb6@quicinc.com>
 <CAA8EJpoYc5M7GpTAUggjDhs+UQ8GcFcW7Y7xNs_zrNNN3Th-7A@mail.gmail.com>
 <81e527a4-f394-1bb5-769f-8b1f3eb01f40@quicinc.com> <ddb70b1e-57bb-a72f-018a-75da62cedb3a@linaro.org>
 <e9f9c27d-e3a1-0e47-6fc0-27d3755b853c@quicinc.com>
In-Reply-To: <e9f9c27d-e3a1-0e47-6fc0-27d3755b853c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 28 Jul 2023 22:29:57 +0300
Message-ID: <CAA8EJpqw0P6Kx+7qCpEY+iuOke_g4_FXYSCG8VaDzPshsAkBBw@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm/dpu: use MDSS data for programming SSPP
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
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

On Fri, 28 Jul 2023 at 22:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/27/2023 8:26 AM, Dmitry Baryshkov wrote:
> > On 27/07/2023 18:24, Abhinav Kumar wrote:
> >>
> >>
> >> On 7/27/2023 1:39 AM, Dmitry Baryshkov wrote:
> >>> On Thu, 27 Jul 2023 at 02:20, Abhinav Kumar
> >>> <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> >>>>> Switch to using data from MDSS driver to program the SSPP fetch and
> >>>>> UBWC
> >>>>> configuration.
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++-------
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  7 +++++--
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
> >>>>>    6 files changed, 36 insertions(+), 11 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>>>> index cf70a9bd1034..bfd82c2921af 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>>>> @@ -8,6 +8,8 @@
> >>>>>    #include "dpu_hw_sspp.h"
> >>>>>    #include "dpu_kms.h"
> >>>>>
> >>>>> +#include "msm_mdss.h"
> >>>>> +
> >>>>>    #include <drm/drm_file.h>
> >>>>>
> >>>>>    #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
> >>>>> @@ -308,26 +310,26 @@ static void dpu_hw_sspp_setup_format(struct
> >>>>> dpu_sw_pipe *pipe,
> >>>>>                DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> >>>>>                        DPU_FETCH_CONFIG_RESET_VALUE |
> >>>>>                        ctx->ubwc->highest_bank_bit << 18);
> >>>>
> >>>> Does this needs to be protected with if ctx->ubwc check?
> >>>
> >>> Yes... And it should have been already.
> >>>
> >>>>
> >>>>> -             switch (ctx->ubwc->ubwc_version) {
> >>>>> -             case DPU_HW_UBWC_VER_10:
> >>>>> +             switch (ctx->ubwc->ubwc_enc_version) {
> >>>>> +             case UBWC_1_0:
> >>>>
> >>>> The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
> >>>> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in
> >>>> the
> >>>> catalog for the encoder version in the first place? Because looking at
> >>>> the registers UBWC_x_x is the correct value.
> >>>>
> >>>> If we cannot find the reason why, it should be noted in the commit text
> >>>> that the values we are using did change.
> >>>
> >>> Huh? This is just an enum. It isn't a part of uABI, nor it is written
> >>> to the hardware.
> >>>
> >>
> >> The reason is that, this switch case is moving from comparing one set
> >> of values to totally different ones. So atleast that should be noted.
> >>
> >> First thing that struck me was this point because the enums UBWC_x_x
> >> and DPU_HW_UBWC_VER_xx dont match.
> >>
> >
> > Do you have any proposed text in mind?
> >
>
> I was doing some checking about this. The issue was that when this enum
> was made, it missed using the SDE_HW_UBWC_VER macro
>
>
> 75 enum {
> 76      DPU_HW_UBWC_VER_10 = 0x100,
> 77      DPU_HW_UBWC_VER_20 = 0x200,
> 78      DPU_HW_UBWC_VER_30 = 0x300,
> 79      DPU_HW_UBWC_VER_40 = 0x400,
> 80 };
> 81
>
> so something like this:
>
> 183  */
> 184 enum {
> 185     SDE_HW_UBWC_VER_10 = SDE_HW_UBWC_VER(0x100),
> 186     SDE_HW_UBWC_VER_20 = SDE_HW_UBWC_VER(0x200),
> 187     SDE_HW_UBWC_VER_30 = SDE_HW_UBWC_VER(0x300),
> 188     SDE_HW_UBWC_VER_40 = SDE_HW_UBWC_VER(0x400),
> 189     SDE_HW_UBWC_VER_43 = SDE_HW_UBWC_VER(0x431),
> 190 };
>
> This macro handles that conversion under the hood.
>
> So I would write something like this
>
> "This also corrects the usage of UBWC version which was incorrect from
> the beginning because of the enum storing the DPU_HW_UBWC_*** missed out
> the conversion to the full UBWC version"

I don't like the word 'correcting', as it makes one think there was an
issue beforehand. There were no real issues. So I'll try to cook
something up for the next iteration.



-- 
With best wishes
Dmitry
