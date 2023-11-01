Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2EC17DE764
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Nov 2023 22:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbjKAVXU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Nov 2023 17:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbjKAVXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Nov 2023 17:23:20 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61F5110
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Nov 2023 14:23:14 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a7b91faf40so3541097b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Nov 2023 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698873794; x=1699478594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dl8c3BIAaS/88zFuuBV/4w/NPgrIAjvlzC9LRsB8+m8=;
        b=KojkTlwj6dGcdLt5fuaR0E9Vy+xICUcGBpTokGikWEw81TFCdy3OnkqrPpvMndrE+k
         cutG2D9vXp5vSZ1Gx1UvTfYwLnWWjbFrdBiu6iMNMMDh9n85iwx+A4MeHICqaYrPb8io
         SGAwFsCNq1K4PMYRBRKHKtAF4tFrQ5aERDOSejIYZ6IwXa+UMxcDd9ZFHWVlMqIYG1ZX
         E2FMUgS64mT/9FVSXPrlxGGI7GlhA2M8teEBvGH9LRidjDyF8gbxZ48X7N0J4z5ZC0Mt
         GHoBgfSoYknJ9srrBSNQEFZ/VCPhuYD5XNQI2fS0M1S8lsEeAwDbKnTIltT56S+OMkb/
         Rgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698873794; x=1699478594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dl8c3BIAaS/88zFuuBV/4w/NPgrIAjvlzC9LRsB8+m8=;
        b=hm5sLz//ZcjUuau8IjZqoNQbpsw50q9Jadt/Pd/u9Qpq/OWosDYMHhrTz0XXRTR0c3
         Kcs1KR3lL6Ok4c1LxjmYRQhgPuXEt6DH2Hb55KFAhz/d3VhyduPFhyseosTrrWdrBiBz
         +CnQoFaoVYj2SGRKHSOlVjElsxHt6pHKfB90dnK/5+meD+ezsHecUF68fsY14Vm27nH0
         CpBNHqqxmrrk4lTkIPthGj+o6yF45Tfk0+6NLBpDMt5mWmPGQ1ghOYMSbhAELjdv/Vw3
         zRFKZv0u/E1NDPS+rXnPubG4joZmxWhuYr3paqv3P+Db8nlFjkQHJdPEkt34xhFiCLIt
         BB9A==
X-Gm-Message-State: AOJu0Yw3wQw34aUCHdAGav9eIdaYu1sfW+SIuUP5BwyWGXuaUBV1AhIs
        vKAzlUFX3uBUU0EW9bB9fCFsmxa5NTdkhM68I3GdDw==
X-Google-Smtp-Source: AGHT+IGmaCpH2gD9y+L9dyOZhN2BCEE0JHEsYRG7D0m17qUZkwGbvzFd57ZlO9+haSpM7c/X3W8c0/L7TAlbRrWUTps=
X-Received: by 2002:a81:a789:0:b0:5a9:27c8:edbc with SMTP id
 e131-20020a81a789000000b005a927c8edbcmr14862501ywh.28.1698873793758; Wed, 01
 Nov 2023 14:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-10-dmitry.baryshkov@linaro.org> <c2f7733b-bfa3-a8a6-6909-5da26cd513af@quicinc.com>
 <CAA8EJpr35LgyfNOcwiE0FgGR-CfS6b996HZk0tnQrVpOX99aRg@mail.gmail.com>
 <6d25aaec-58ef-6f66-d2f8-d351ab703d05@quicinc.com> <CAA8EJprX=8w7WDb8YF3Tf5bmkeym024oESSeoBtq5OU25CtcgQ@mail.gmail.com>
 <167ab91e-7194-0cb9-e2d8-2bbb83098e75@quicinc.com>
In-Reply-To: <167ab91e-7194-0cb9-e2d8-2bbb83098e75@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 1 Nov 2023 23:23:02 +0200
Message-ID: <CAA8EJpoZMYQKsPiiwNv7v-72L9nOcN2Jc4dkdmTQyzB9trYgag@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3,
 QSEED3LITE, QSEED4
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

On Wed, 1 Nov 2023 at 21:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/1/2023 12:39 PM, Dmitry Baryshkov wrote:
> > On Wed, 1 Nov 2023 at 20:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 10/31/2023 1:19 AM, Dmitry Baryshkov wrote:
> >>> On Mon, 30 Oct 2023 at 22:24, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> >>>>> Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
> >>>>> are all related to different versions of the same HW scaling block.
> >>>>> Corresponding driver parts use scaler_blk.version to identify the
> >>>>> correct way to program the hardware. In order to simplify the driver
> >>>>> codepath, merge these three feature bits.
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
> >>>>>     4 files changed, 6 insertions(+), 16 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>> index 32c396abf877..eb867c8123d7 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>> @@ -31,10 +31,10 @@
> >>>>>         (VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> >>>>>
> >>>>>     #define VIG_SC7180_MASK \
> >>>>> -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
> >>>>> +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> >>>>>
> >>>>>     #define VIG_SM6125_MASK \
> >>>>> -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
> >>>>> +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> >>>>>
> >>>>
> >>>> This merging is coming at a cost of inaccuracy. We are marking sc7180
> >>>> and sm6125 as scaler_qseed3. But they are not. Let me know what you
> >>>> think of below idea instead.
> >>>>
> >>>>>     #define VIG_SC7180_MASK_SDMA \
> >>>>>         (VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>> index fc5027b0123a..ba262b3f0bdc 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>> @@ -51,9 +51,7 @@ enum {
> >>>>>     /**
> >>>>>      * SSPP sub-blocks/features
> >>>>>      * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> >>>>> - * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
> >>>>> - * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
> >>>>> - * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
> >>>>> + * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
> >>>>>      * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
> >>>>>      * @DPU_SSPP_CSC,            Support of Color space converion
> >>>>>      * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
> >>>>> @@ -72,8 +70,6 @@ enum {
> >>>>>     enum {
> >>>>>         DPU_SSPP_SCALER_QSEED2 = 0x1,
> >>>>>         DPU_SSPP_SCALER_QSEED3,
> >>>>> -     DPU_SSPP_SCALER_QSEED3LITE,
> >>>>> -     DPU_SSPP_SCALER_QSEED4,
> >>>>>         DPU_SSPP_SCALER_RGB,
> >>>>>         DPU_SSPP_CSC,
> >>>>>         DPU_SSPP_CSC_10BIT,
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>>>> index 7e9c87088e17..d1b70cf72eef 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>>>> @@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
> >>>>>                 test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> >>>>>                 c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> >>>>>
> >>>>> -     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
> >>>>> -                     test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
> >>>>> -                     test_bit(DPU_SSPP_SCALER_QSEED4, &features))
> >>>>> +     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
> >>>>>                 c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
> >>>>
> >>>> Can we just do sblk->scaler_blk.version >= 0x3000 instead of this
> >>>> merging? That way you can still drop those enums without inaccuracy.
> >>>
> >>> No. QSEED3 from sdm845 has version 1.3, msm8998, sdm660 and sdm630
> >>> have version 1.2.
> >>>
> >>
> >> Ah got it.
> >>
> >> HW versioning is getting harder to generalize with the example you have
> >> given. In my opinion, in that case lets keep these enums intact because
> >> we dont have any other way of knowing the Qseed version otherwise and in
> >> terms of LOC, we are not really saving so much in this change.
> >>
> >> In the prev change I agreed because along with the name and the version,
> >> we could still interpret the version but with compressing the enums into
> >> just QSEED3, this becomes very confusing. So now, in the future if we
> >> have QSEED5 HW, we will have to change this anyway as its LUT
> >> programming can change. So we need this distinction.
> >
> > I'm trying to eliminate them, because they cause more confusion than
> > the bonuses.
> > Currently we have QSEED3  / 3LITE / 4, which are somewhat compatible.
> >
> > We are aiming to support QSEED2 and RGB, which are incompatible with
> > the QSEED3/3lite/4 family programming sequence. So they get their own
> > feature bits (DPU_SSPP_SCALER_QSEED2 and DPU_SSPP_SCALER_RGB).
> >
> > QSEED5-to-be will either be compatible with QSEED3 (and thus can fall
> > into the same bucket) or it will be a different kind of scaler (and
> > will get its own feature).
> >
> > I'm not a fan of DPU_SSPP_SCALER_QSEED3LITE/QSEED4 and I'd like to
> > remove those two bits for the following reasons:
> > - We already encode this info into the scaler version. How should
> > driver behave it it has e.g. version 3.1, but DPU_SSPP_SCALER_QSEED3?
> > Or vice versa: version 1.2 but QSEED4 feature bit? Having a single
> > QSEED3 removes this issue.
> > - Adding QSEED5-compatible-with-QSEED3 requires changing several
> > places which deal with the feature bits and the per-version setup
> > sequence. This seems like an overkill. It is easy to miss one of the
> > places and thus end up with the half-supported scaler
> >
> > I admit, it might not be ideal to use QSEED3 for all scaler versions.
> > I'm open to suggestions on the better name for this feature bit. But I
> > have no doubts that there should be a single feature bit for all
> > QSEED3/3LITE/4 scalers.
> >
>
> hmmm, the concern i had was that from the version the driver doesnt seem
> to know which qseed it is as you rightly pointed out in your earlier
> response with the examples of sdm845, msm8998 etc.
>
> It needs this feature bit to know which qseed version it is to use the
> correct scaler function. If you remove the other two places below, this
> will be the only one left right?
>
> I was thinking of solving this problem with something like
> QSEED3_3LITE_4 but then this is not scalable if QSEED5 is also a variant
> of QSEED3.
>
> After we remove below 2 places, are there more places where we test
> these feature bits?

Hmm, true, this is the only place enumerating them.

> One thing we can perhaps do is move all this feature bit handling to one
> function like dpu_scaler_is_qseed3_compatible() and move these feature
> bits there. That way you will have only one place to change for all the
> code.

What about renaming QSEED3 to QSEED3_COMPATIBLE then? This would leave
us with RGB, QSEED2, QSEED3_COMPATIBLE. The QSEED5-to-be will either
be added as a new entry (and a new scaler function) or it will fall
into the QSEED3_COMPATIBLE bucket.

I'd really like to remove any chance of confusion between QSEEDn and
the scaler_block.version. I think we already had that wrong in several
catalog entries, so let's not walk twice into the same water.

> >> The below two changes seem fine and that way we are eliminating the
> >> usages of the enum and we will end up with only one place using this.
> >>
> >>
> >>>>
> >>>>>
> >>>>>         if (test_bit(DPU_SSPP_CDP, &features))
> >>>>> @@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
> >>>>>                         cfg->len,
> >>>>>                         kms);
> >>>>>
> >>>>> -     if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> >>>>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> >>>>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> >>>>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> >>>>> +     if (sblk->scaler_blk.len)
> >>>>
> >>>> This part seems fine.
> >>>>
> >>>>>                 dpu_debugfs_create_regset32("scaler_blk", 0400,
> >>>>>                                 debugfs_root,
> >>>>>                                 sblk->scaler_blk.base + cfg->base,
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>>>> index 43135894263c..ba3ee4ba25b3 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>>>> @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
> >>>>>                         scale_cfg->src_height[i] /= chroma_subsmpl_v;
> >>>>>                 }
> >>>>>
> >>>>> -             if (pipe_hw->cap->features &
> >>>>> -                     BIT(DPU_SSPP_SCALER_QSEED4)) {
> >>>>> +             if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
> >>>> This is fine too.
> >>>>>                         scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
> >>>>>                         scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> >>>>>                 } else {
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
