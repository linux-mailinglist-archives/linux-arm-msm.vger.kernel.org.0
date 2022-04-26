Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 016B951078E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 20:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350732AbiDZSyR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 14:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241389AbiDZSyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 14:54:17 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212011552AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 11:51:06 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id g20so23485327edw.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GkmNodYDyZUcz4YqIXf6ci2yKdLfUJ1K8RvbtcksxtI=;
        b=nWD8L0RJewhH68Onfn+aiqn4+KcLlkLvMd1+6I28XcPIMW3nBbpk0C6dPb8XjzORB9
         jfovb01ckqVKZDPXg7G4M6AVXUs3Gr3H5wEmtWEesAS40PwQcYUjdsRPSuY3oYbMsFs1
         fxLRBIBbCtWnNp5HcG5jfqqKj1KdWw5hnMsUdDEGgyL2MRCEQvD5+Z/JnxcYtffTq21h
         0/RPv44/mlItIRwqan/zxLqqjyIauoumymvJ8yKmlpFYVEzchtkL6sWuEk5B8WniXq8Z
         jc1EjTES1Kk41qY/IvcORkam+c1YKFGbHhXVFG4/ufYwgMZNA4dBAqKR5mKBbZAsNGWU
         m4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GkmNodYDyZUcz4YqIXf6ci2yKdLfUJ1K8RvbtcksxtI=;
        b=0p/kVt6vIVVWjqD76MILE8Hwn+wypQLIe+fmezpDjUazlLBsSdCRVVy73LzuJPMTAH
         6cjbO/IknrV3NNBbNKIvSjMTwqT+8OizzRCgcWdv1dDXAnkN6+Q5dX4+m2bWnwey2b+1
         KozrSOB/MsJslAfUqn1x/EZQxIWK7RkG0i1BYIvgfqkzEuoTxuUXxDDnLavzK/MQhopq
         zVqBa6G6fX5P6CMOvGCF261yow5w27e79LB//RCzZkBjEWsEamtvMwM+zn4YZGQfZIeS
         fQMp8cCSUS6C/9NxCfuPBrvsDqM2ZSU5d84Da5G+de1lVJ2FwR9EUnDKb1gueldUDyem
         EOxA==
X-Gm-Message-State: AOAM531qdElq77758kU8H6sjrvq1aurb3GwsUh0H7VQ0nKLgSUk0r1vB
        iBCV1NM3Jb0m8LIDIWtnjXnrZZwwdzrbwPuiZAo=
X-Google-Smtp-Source: ABdhPJzUy8Ha8Oqg4UtSdQ3h4LbKei+S5LBoDpgNV7vX8CqwIIrTbl+tiXmMo1sn5c986WVpKrvNLkjzRm/iK610RpM=
X-Received: by 2002:a50:ee11:0:b0:425:b5b3:a48d with SMTP id
 g17-20020a50ee11000000b00425b5b3a48dmr26284610eds.246.1650999064517; Tue, 26
 Apr 2022 11:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com> <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com> <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com> <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
 <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com> <CAPaKu7Rny7pxsPA+cnow0d6PAD2YCb+b+j1_Di5gziyOVNLaYQ@mail.gmail.com>
 <c32bf2de-0e48-e3b7-98ae-0bcd46933465@amd.com>
In-Reply-To: <c32bf2de-0e48-e3b7-98ae-0bcd46933465@amd.com>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Tue, 26 Apr 2022 11:50:52 -0700
Message-ID: <CAPaKu7T2hTFnsSSdFvQRuGefhZHVmGO9KXKpO8Y_ZcLbe75rpA@mail.gmail.com>
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

On Tue, Apr 26, 2022 at 11:02 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 19:40 schrieb Chia-I Wu:
> > [SNIP]
> >>>> Well I just send a patch to completely remove the trace point.
> >>>>
> >>>> As I said it absolutely doesn't make sense to use this for
> >>>> visualization, that's what the trace_dma_fence_init trace point is g=
ood for.
> > I am a bit confused by this.  _emit and _signaled are a great way to
> > see how many fences are pending from cpu's point of view.  How does
> > _emit make no sense and _init is good instead?
>
> We had exactly that confusion now multiple times and it's one of the
> main reasons why I want to remove the _emit trace point.
>
> See the when you want to know how many fences are pending you need to
> watch out for init/destroy and *NOT* emit.
>
> The reason is that in the special case where emit makes sense (e.g. the
> GPU scheduler fences) emit comes later than init, but pending on the CPU
> and taking up resources are all fences and not just the one emitted to
> the hardware.
I am more interested in pending on the GPU.

>
> On the other hand when you want to measure how much time each operation
> took on the hardware you need to take a look at the differences of the
> signal events on each timeline.
_signaled alone is not enough when the GPU is not always busy.  After
the last pending fence signals but before the following _init/_emit,
nothing is pending.

For all drivers except virtio-gpu, _init and "ring head update" always
happen close enough that I can see why _emit is redundant.  But I like
having _emit as a generic tracepoint for timelines where _init and
_emit can be apart, instead of requiring a special case tracepoint for
each special case timeline.

>
> So there isn't really any use case for the emit trace point, except when
> you want to figure out how much latency the scheduler introduce. Then
> you want to take a look at init and emit, but that isn't really that
> interesting for performance analyses.
>
> Regards,
> Christian.
>
