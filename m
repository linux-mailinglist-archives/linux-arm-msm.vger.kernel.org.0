Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C91C765DB84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 18:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbjADRsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 12:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239803AbjADRse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 12:48:34 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758371A818
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 09:48:29 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id j206so37428515ybj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 09:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h6ernteAwaoJavQln9yDUlEHLQyyCv6s+N2K/1h5NJc=;
        b=c8T0coN2VqEx+gs0ROuXhPs7kCS4obyZ/UI06gKIGvD0Ihja5IGREFjVP+Xxd98hZj
         JmN6Hn34JL/q+Xe5Chb4rHZLYeJKTGtGlwWMd5x8kJy8znBPKE6/o5tJ2P9UAXTSSgnK
         MtzmlTkj/kIwQNIChRWNpZlXaR43D3nX6jpSSo5VuCbxd3//AF2ac8LKvsJKTEs4ot09
         LLNkYJuein+LHqM/4NmAVGNItnrA3aVURF2hHR0cB7punrzIHp1y8EDj1LJdZQ7uQNcu
         zvLexEulaVLFfNrInPdeLZZaK9a/1BABQAZqTJfRnANh7asjBt/H+PsBVOddTmRPWC86
         0uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6ernteAwaoJavQln9yDUlEHLQyyCv6s+N2K/1h5NJc=;
        b=IVs5v7bWFyN81EzS1YzUu+b+m3ilfSCMSkDIVvKc9JwGJCD6YixHbJdBR60lfVeaDL
         AOjsElz0KZkE+uTPx6ufq4PK34/LhjLEjCjvbA0CW3ItJX3QX8FINBi28baBkczyIX9x
         vITmIhGfLHcaCnCGcdSR5pT0thtRWNEhmJWXq7pyyr03Zjgs0WRWth/upTX9vZ5L0Gre
         PDDocg6eEqHMYQ/gHFrSIlwPHUAZHsozWbf8GabPrnDxos9HrifHRMmRkTqTXqGks5o3
         Cv4rkO7nsJvLKk46xxY4Rnn85XLNoceVZ8aHeTHG2g3ozmsLl+eq6UrxKPxc8GN/2R12
         a0sg==
X-Gm-Message-State: AFqh2kpaq4SL3JOJ2X8klNrcrZWm0E7ySMMz3mklEn1jqlMAczedftGg
        LlV5MWaRNQjLPDcELKAR9wQwY3wuyN8bddODAPl2HA==
X-Google-Smtp-Source: AMrXdXuACj2NxKuibRwSdOimb0397QQRnaQeVI/kN9TdsBU3F52F+lvf5NW7TBxyVHHjkeuwiN4WM5G/dxrKKeA1TIs=
X-Received: by 2002:a25:606:0:b0:709:9335:236e with SMTP id
 6-20020a250606000000b007099335236emr4325601ybg.288.1672854508646; Wed, 04 Jan
 2023 09:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
 <96ccae6f-3788-e030-480f-7aa2478ca560@linaro.org> <de3860ba-40f9-cdd5-097c-e015f6b19255@linaro.org>
In-Reply-To: <de3860ba-40f9-cdd5-097c-e015f6b19255@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 4 Jan 2023 19:48:17 +0200
Message-ID: <CAA8EJpoi8QFpvR0qWpNpenZKzEZAQpwp3gNpGd3RwHovgC+Odw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dpu: add support for SM8550
To:     neil.armstrong@linaro.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 4 Jan 2023 at 12:08, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 04/01/2023 10:45, Dmitry Baryshkov wrote:
> > On 04/01/2023 11:08, Neil Armstrong wrote:
> >> Add definitions for the display hardware used on Qualcomm SM8550
> >> platform.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 197 +++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
> >>   4 files changed, 201 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index b4ca123d8e69..adf5e25269dc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>
> <snip>
>
> >> @@ -776,6 +821,45 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
> >>       },
> >>   };
> >> +static const struct dpu_ctl_cfg sm8550_ctl[] = {
> >> +    {
> >> +    .name = "ctl_0", .id = CTL_0,
> >> +    .base = 0x15000, .len = 0x290,?
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
> >
> > CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY) ?
>
> Indeed DPU_CTL_VM_CFG is missing, will switch to that.
>
> >
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >> +    },
> >> +    {
> >> +    .name = "ctl_1", .id = CTL_1,
> >> +    .base = 0x16000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >> +    },
> >> +    {
> >> +    .name = "ctl_2", .id = CTL_2,
> >> +    .base = 0x17000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> >
> > CTL_SC7280_MASK?
>
> Ack
>
> >
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >> +    },
> >> +    {
> >> +    .name = "ctl_3", .id = CTL_3,
> >> +    .base = 0x18000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >> +    },
> >> +    {
> >> +    .name = "ctl_4", .id = CTL_4,
> >> +    .base = 0x19000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >> +    },
> >> +    {
> >> +    .name = "ctl_5", .id = CTL_5,
> >> +    .base = 0x1a000, .len = 0x290,
> >> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> >> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> >> +    },
> >> +};
> >> +
> >>   static const struct dpu_ctl_cfg sc7280_ctl[] = {
> >>       {
> >>       .name = "ctl_0", .id = CTL_0,
>
> <snip>
>
> >> @@ -1268,6 +1386,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
> >>       .len = 0x20, .version = 0x20000},
> >>   };
> >> +#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> >> +    {\
> >> +    .name = _name, .id = _id, \
> >> +    .base = _base, .len = 0, \
> >
> > len = 0 looks incorrect. Any particular reason why can't we use plain PP_BLK here?
>
> The TE block has been moved to the DSI INTF blocks since SM8350 I think, or earlier.

I think, 8150. Marijn has been working on adding support for INTF-based TE.

> This removes the DPU_PINGPONG_DITHER feature used downstream to enable the PP TE callbacks.
> Since there's only the DIPHER sub-block remaining, this is why I set len to 0.

I went on with some research. Usually PP len is 0xd4. However it seems
since 8350 (since the change of DSC block) the PP size should be 0x0),
despite dowsnstream DTs having sde-pp-size=0xd4 for sm8350 and sm8450
(or 0x4 for neo, DPU 9.1.0).
So, it looks like you are correct here (and we should fix 8350/8450
patches instead).

>
> >
> >> +    .features = BIT(DPU_PINGPONG_DITHER), \
> >> +    .merge_3d = _merge_3d, \
> >> +    .sblk = &_sblk, \
> >> +    .intr_done = _done, \
> >> +    .intr_rdptr = _rdptr, \
> >> +    }
> >>   #define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> >>       {\
> >>       .name = _name, .id = _id, \
>
> <snip>
>


-- 
With best wishes
Dmitry
