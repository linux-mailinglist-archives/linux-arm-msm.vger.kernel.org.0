Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2783B51059D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 19:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348284AbiDZRoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 13:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353425AbiDZRoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 13:44:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC3B14035
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 10:40:52 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bv19so37559123ejb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 10:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=39WI8e9MaPtwFY3BU5vYG4JdpWLlNJ93HLnpo4B04GI=;
        b=pXvbv4zo49JQaB+hW9g4iXfuoZ9i90YISVmG2MzzVmhMh8tlRI2GlNk5DQ+toDgl5h
         lTLNDi2dpS/ggI7dmzbBWDKI/XT1Kb/MqruFpet7/8AFN7Q7trmyuCNdst6TZFXNjmS2
         T28yyjIfkO9MzeoZm/yJMEqN4tStppw/6CS9qq1ZFv79wE4Br+Z79EE+eIam3dChlK0S
         9Q6O61QC/bZNj8Donp2VqOWbSZU2QkCVMT2KeYiwU7ASJCqu6haSLhpuspRqCj1NgNex
         wQRpWamb7RFYvja0JY8+4NtDH7N0qEPNHS6TgZeko6zb4czuHkv69Za/0M8wfhZoES6+
         Oo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=39WI8e9MaPtwFY3BU5vYG4JdpWLlNJ93HLnpo4B04GI=;
        b=QW1IjRRGuIiUVQWK6atpO1rEVwG7tWqnuS4IHfD91A/3BHgtnzrFQ2/QslRRUrHC2n
         86xLiVvYmYbmsZAW98zJhVuENjlqrRD7qtrEoNcGOZlZ2K3YkqHnAT32ZCZQ620nmTGo
         dWfpOSHbgCNnVMLKgRz0QIIPZe8EfxPgS7Zp0R12wawueTbrxBnDtRi5yZfSzpnMDJJV
         un2IdiVPwZGsBklO9wR3lXgJD1glzhPEfYDu+8nE6Q1/I5ZC7PWaxMJz0t37d/xLeQix
         cMTjUdlYd3uNn3UUYUTxWKo0km8saNnu6H7/SPt2yQ2VO85dUs30B6ghB5PlbS1QczMQ
         25Qg==
X-Gm-Message-State: AOAM531FjKduvdD0vbV3A2r8Vxit4wFbTb30cWolcki2VfqK4fponQG3
        ADr5qhnGdueCVTYWHEkqz+tukWejOqjuU65FA5o=
X-Google-Smtp-Source: ABdhPJyTOt9N11WaJgYRYWkyR24Jh9AivZtJjPPrwNMZgQRcJfFlbnqNN/vLX5HRo3fMd7cs41zvVOz/axAGVu6HET4=
X-Received: by 2002:a17:907:9808:b0:6f3:89ed:279a with SMTP id
 ji8-20020a170907980800b006f389ed279amr13339749ejc.308.1650994850729; Tue, 26
 Apr 2022 10:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com> <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com> <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com> <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
 <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com>
In-Reply-To: <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Tue, 26 Apr 2022 10:40:39 -0700
Message-ID: <CAPaKu7Rny7pxsPA+cnow0d6PAD2YCb+b+j1_Di5gziyOVNLaYQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 26, 2022 at 10:20 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 19:16 schrieb Rob Clark:
> > On Tue, Apr 26, 2022 at 10:08 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 26.04.22 um 19:05 schrieb Rob Clark:
> >>> On Tue, Apr 26, 2022 at 9:42 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
> >>>>> On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote=
:
> >>>>>> In practice, trace_dma_fence_init called from dma_fence_init is go=
od
> >>>>>> enough and almost no driver calls trace_dma_fence_emit.  But drm_s=
ched
> >>>>>> and virtio both have cases where trace_dma_fence_init and
> >>>>>> trace_dma_fence_emit can be apart.  It is easier for visualization=
 tools
> >>>>>> to always use the more correct trace_dma_fence_emit when visualizi=
ng
> >>>>>> fence timelines.
> >>>>>>
> >>>>>> v2: improve commit message (Dmitry)
> >>>>>>
> >>>>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >>>>>> Cc: Rob Clark <robdclark@chromium.org>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> This has been reviewed.  Should we land it?
> >>>> No, there are still open discussions about it.
> >>> I think if it is needed for trace visualization, that is justificatio=
n
> >>> enough for me
> >>>
> >>> I don't really see otherwise how a generic trace visualization tool
> >>> like perfetto would handle the case that some fence timelines have
> >>> separate events but others do not.
> >> Well I just send a patch to completely remove the trace point.
> >>
> >> As I said it absolutely doesn't make sense to use this for
> >> visualization, that's what the trace_dma_fence_init trace point is goo=
d for.
I am a bit confused by this.  _emit and _signaled are a great way to
see how many fences are pending from cpu's point of view.  How does
_emit make no sense and _init is good instead?

Or is this just that _init is good enough most of the time?  (More below)

> >>
> >> The only use case is for debugging the GPU scheduler and we should
> >> probably introduce a separate GPU scheduler specific trace point for
> >> this instead if we should ever need it.
> > Hmm, AFAIU from Chia-I, virtgpu has a separation of init and emit..
> > OTOH if using separate events in these special cases is better, then
> > I'm ok with that and can revert this patch.  Chia-I is more familiar
> > with the visualization end of it, so I'll let him comment on whether
> > that is a workable approach.
>
> Interesting, I wasn't aware of the virtgpu separation of init and emit.
>
> But yes if there is really an use case for tracing this time stamp as
> well then we should probably have that use case specific.
>
> I just looked into the scheduler case a bit and found that even there we
> already have a different trace point for it, which is probably the
> reason why we never used trace_dma_fence_emit there.
Yeah, I am using drm_sched tracepoints in that case.
>
> So yes, there really isn't much reason I can see two have two separate
> trace points for every driver.
That sounds fair.  In any tool, it should be easy to see if a fence
timeline has _emit in addition to _init, and adapt accordingly.  We
can drop this patch.

A clarification that _emit is optional/redundant for most fence
timelines should be nicer than removing it though.

>
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> (Or, how do I check if it has landed?)
>
