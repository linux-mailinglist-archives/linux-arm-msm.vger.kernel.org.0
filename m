Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB460511F7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 20:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241680AbiD0QMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 12:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242154AbiD0QLv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 12:11:51 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543493656E4
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 09:07:46 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id p12so2011160pfn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=thh3b7rvFYMcWHBGJTfcjm7L4QV8/jt2EZrs9nTl3/s=;
        b=nHvJcRQDvgnFH2mocyoYQgZtIrbsIsmTsZ74EguoCNewAbSODSdrwqhoxexS8tR/yh
         hBYBW29wCw14+O+78B8pYxO/PeMyALOI0bQ46Nl3BgK4n56x6OF7xgpz0MHDdtlXed8M
         DM9tNwEwzP500NWVah6UGtMlwOluQHybWUawI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=thh3b7rvFYMcWHBGJTfcjm7L4QV8/jt2EZrs9nTl3/s=;
        b=AGbH+WBqevnKOy/UHwbw/vDbOr31lEFslfJaVkhNT1gpY8i9PjQvsbZagyN+n4P7ID
         LlcyzL0N4MakeoJnIkGAhl6rFQlAU9LggHEB6KCuJA5LfLhax/avHIQnh6Uy848w5/eK
         q8m15FnS+9RKkGKCRMXQuZXIMrf8PZHGcLnmY/8DCmPSBrRIhXJdWub5eQDUDbuBMcfP
         yBv19kQUsT2ovi1N9MCkvkvo/R92+iy2CU3lDWe/FyIdqsPSD5I8Iid5DqW/wYIQn8v1
         P0FyWFEgSMu3P4h/2dGjctwh5dtb1efldIdEcEB3zZUKxLNsUom1pQc6+C1TY5pwtbMG
         2KaQ==
X-Gm-Message-State: AOAM531nrV4wfBM07e79OD03S9JKyYwBHrtDbMIQLlUtXF9IiWxI6qoC
        txeWb2RBDVxC74vW7klGlf+L9meFI01qmA/VpIdIwQ==
X-Google-Smtp-Source: ABdhPJx8fm8/yx+ZjmZhEV0V49ps4Zr4PYjpyXxyQlzPoHV3JUBxQd/ptdVWyyMngsed5HIFfmLvF6S+wXinkOQR8f4=
X-Received: by 2002:a05:6a00:14c5:b0:50d:4871:3619 with SMTP id
 w5-20020a056a0014c500b0050d48713619mr13516854pfu.12.1651075637181; Wed, 27
 Apr 2022 09:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com> <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com> <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com> <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
 <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com> <CAPaKu7Rny7pxsPA+cnow0d6PAD2YCb+b+j1_Di5gziyOVNLaYQ@mail.gmail.com>
 <c32bf2de-0e48-e3b7-98ae-0bcd46933465@amd.com> <CAPaKu7T2hTFnsSSdFvQRuGefhZHVmGO9KXKpO8Y_ZcLbe75rpA@mail.gmail.com>
 <b587ca5f-eb8a-cf0c-5c07-9844c8794463@amd.com>
In-Reply-To: <b587ca5f-eb8a-cf0c-5c07-9844c8794463@amd.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Wed, 27 Apr 2022 09:07:06 -0700
Message-ID: <CAJs_Fx7Jq9VWy_Eux+hGoQTCTeKkFMQCdibY9gFQTqrvVob5fA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Chia-I Wu <olvaffe@gmail.com>, freedreno@lists.freedesktop.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 26, 2022 at 11:20 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 20:50 schrieb Chia-I Wu:
> > On Tue, Apr 26, 2022 at 11:02 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 26.04.22 um 19:40 schrieb Chia-I Wu:
> >>> [SNIP]
> >>>>>> Well I just send a patch to completely remove the trace point.
> >>>>>>
> >>>>>> As I said it absolutely doesn't make sense to use this for
> >>>>>> visualization, that's what the trace_dma_fence_init trace point is=
 good for.
> >>> I am a bit confused by this.  _emit and _signaled are a great way to
> >>> see how many fences are pending from cpu's point of view.  How does
> >>> _emit make no sense and _init is good instead?
> >> We had exactly that confusion now multiple times and it's one of the
> >> main reasons why I want to remove the _emit trace point.
> >>
> >> See the when you want to know how many fences are pending you need to
> >> watch out for init/destroy and *NOT* emit.
> >>
> >> The reason is that in the special case where emit makes sense (e.g. th=
e
> >> GPU scheduler fences) emit comes later than init, but pending on the C=
PU
> >> and taking up resources are all fences and not just the one emitted to
> >> the hardware.
> > I am more interested in pending on the GPU.
> >
> >> On the other hand when you want to measure how much time each operatio=
n
> >> took on the hardware you need to take a look at the differences of the
> >> signal events on each timeline.
> > _signaled alone is not enough when the GPU is not always busy.  After
> > the last pending fence signals but before the following _init/_emit,
> > nothing is pending.
>
> Yeah, I'm perfectly aware of that.
>
> > For all drivers except virtio-gpu, _init and "ring head update" always
> > happen close enough that I can see why _emit is redundant.  But I like
> > having _emit as a generic tracepoint for timelines where _init and
> > _emit can be apart, instead of requiring a special case tracepoint for
> > each special case timeline.
>
> And I'm certainly not going to add _emit to all drivers just because of
> that. As you said it is a special case for virtio-gpu and the GPU schedul=
er.
>
> And as I explained before the difference between _init and _emit
> shouldn't matter to your visualization. The background is that as soon
> as an dma_fence is initialized with _init it is "live" regarding the
> dependency and memory management and exactly that's what matters for the
> visualization.
>
> The latency between _init and _emit is just interesting for debugging
> the scheduler and surprisingly virtio-gpu as well, for all other use
> cases it is irrelevant.

It might actually be *more* interesting for virtio-gpu.. unless there
is some other way to link guest and host fences to see what the
potential latency of guest->host is

re: adding the tracepoint to other drivers, I'm fine with folks doing
that as needed.  Unless you have a better proposal about how to
visualize init vs emit latency, I think it's fine to have an extra
tracepoint even if it is redundant in some cases.  The visualization
tool is the customer here, we have to give it what it wants/needs.

BR,
-R

>
> Regards,
> Christian.
>
> >> So there isn't really any use case for the emit trace point, except wh=
en
> >> you want to figure out how much latency the scheduler introduce. Then
> >> you want to take a look at init and emit, but that isn't really that
> >> interesting for performance analyses.
> >>
> >> Regards,
> >> Christian.
> >>
>
