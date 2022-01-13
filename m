Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6E248D2AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jan 2022 08:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbiAMHNM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 02:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiAMHNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 02:13:12 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4CAC061751
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 23:13:11 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id f17so6048180qtf.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 23:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8M7DHNqIGb8T38MhtK9zvNv2bpY/lvWtx3YDXV9Tj8I=;
        b=qIohtgfLM8Muy/S/qrETPOgzJmX+T5sA52nuKD/xxF+ot3vn2MIoZBE68IfKR1a+45
         TyXpS/HG+q56nfitHBfuPmvvx0Mu8UwbVEMk4evAy7/yUat4phet2r+zUyk3JgQ4dw7Z
         u5bu/qzWNCTZQuqY8ty/ufTcD2i59VwX/+iJ72rzYOD1jSDUc7mTWBe93TdLyPe9QlGg
         iGig5sX3ELfg2m707GTjJV1ib2bewI/C9ydgL9UPMRr6Y39CEnHy++ZbY0n2tqnne3yP
         +K37pfg+jPJsjwJ8A8IxbGnR1MGqgrpgG1vwZjzKI95/TO/0ha/lBkzZ/sk2jWZmBe1w
         ByjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8M7DHNqIGb8T38MhtK9zvNv2bpY/lvWtx3YDXV9Tj8I=;
        b=3AaAARtaZYKQHTFNw7VTFlVaiSJaMbIjO78MG6vHGpTh/lyUXRVvpYpZCPTpTd7Vqy
         oPSb16VEBW0c8E/d4z3xX2TYP44JXI1oekEonx2o8wuovURqIszMFbdw6tExreO8Hjws
         NFw08exJZqVyvp7z34JKxah7pn8JRP1y2BFE+s5++zFoi3dZNQh7SDJthsb+J6e0maQe
         KKH4ItUJZffSEEzVnbKZvA2iuP0k6kqh7FBDOYD2VUA7iz90fU4k9yVM/aZOeotF19GI
         Rgve8vaQpEIvPO5QiRyQzphJqHT4rMtoAKykqCy87dXTWUvdmbTDZpJM/b6Sz39zSHMv
         4W3A==
X-Gm-Message-State: AOAM530uCQLnraaMc9ivp2S/W4oL63hLrINQY8x0mmFNAuDpWPeyA8y1
        XBz5/yg4wSaykAMBysQnJHazMavDSR2tiHeTswsCEA==
X-Google-Smtp-Source: ABdhPJx1y+5qzqGkdufL1lymNEVHc7WenfzCCuu3h0YYxZ5tyyugQGLAy7qBvf0pJG+6kg1ogk/QxcaYNvPlUCDNeXE=
X-Received: by 2002:a05:622a:1883:: with SMTP id v3mr2520046qtc.682.1642057991028;
 Wed, 12 Jan 2022 23:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20220112030115.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
 <20220112030115.3.I86c32730e08cba9e5c83f02ec17885124d45fa56@changeid> <CAF6AEGuJxdrYM5XXt6sUGmjossqZTRzwQ6Y8qYsnfCYDvGQurw@mail.gmail.com>
In-Reply-To: <CAF6AEGuJxdrYM5XXt6sUGmjossqZTRzwQ6Y8qYsnfCYDvGQurw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 13 Jan 2022 10:13:00 +0300
Message-ID: <CAA8EJpokgiUbqj9BOF52a9QjJK53PinNHfxy_6nbNq53JnO2Og@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/adreno: Expose speedbin to userspace
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Jan 2022 at 00:19, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jan 11, 2022 at 1:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > Expose speedbin through MSM_PARAM_CHIP_ID parameter to help userspace
> > identify the sku.
> >
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index f33cfa4..e970e6a 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -242,10 +242,11 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
> >                 *value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
> >                 return 0;
> >         case MSM_PARAM_CHIP_ID:
> > -               *value = adreno_gpu->rev.patchid |
> > -                               (adreno_gpu->rev.minor << 8) |
> > -                               (adreno_gpu->rev.major << 16) |
> > -                               (adreno_gpu->rev.core << 24);
> > +               *value = (uint64_t) adreno_gpu->rev.patchid |
> > +                               (uint64_t) (adreno_gpu->rev.minor << 8) |
> > +                               (uint64_t) (adreno_gpu->rev.major << 16) |
> > +                               (uint64_t) (adreno_gpu->rev.core << 24) |
> > +                               (((uint64_t) adreno_gpu->rev.sku) << 32);
>
> How about this instead, so we are only changing the behavior for
> new/unreleased devices:
>
> *value = adreno_gpu->rev.patchid |
> (adreno_gpu->rev.minor << 8) |
> (adreno_gpu->rev.major << 16) |
> (adreno_gpu->rev.core << 24);
> if (!adreno_gpu->info->revn)
> *value |= (((uint64_t) adreno_gpu->rev.sku) << 32);
>
> (sorry about the butchered indentation.. somehow gmail has become
> antagonistic about pasting code)

I assume that you would like to keep userspace compat for older chips.
thus the if.
Maybe we should introduce MSM_PARAM_CHIP_ID_SKU instead (and gradually
make userspace switch to it)?

>
> BR,
> -R
>
> >                 return 0;
> >         case MSM_PARAM_MAX_FREQ:
> >                 *value = adreno_gpu->base.fast_rate;
> > --
> > 2.7.4
> >



-- 
With best wishes
Dmitry
