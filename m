Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80174FE908
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 21:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343971AbiDLTpD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 15:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241692AbiDLTop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 15:44:45 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC9E2DFC
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:40:41 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id e8-20020a17090a118800b001cb13402ea2so4140919pja.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KcAH7mF9eHpU+lzQ0ZOVf7kLghMZDIfYqzoC1pN6kTM=;
        b=lvdmYsNPUPYWEsyu97OOGiswPuqEO5+U6hmLz19+U3z1EhfM40k+q3vdyFLwSVjxYq
         HyuqZIKnAZNpXj1GgNiUIwAGq/wXIDrmKGdOeUgMmLGSLnsCIuw5tP/vgQDv+CVY5c9K
         PdTW8Fc/CJKDbvFX7+TUPjQOlYkFKnMMGTVOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KcAH7mF9eHpU+lzQ0ZOVf7kLghMZDIfYqzoC1pN6kTM=;
        b=yTle66w/rkisRyLk8/aDG99U4k7Od0J7Kz8W5Nztr17rOOjKLaJy3Pv1yUON6BbiGR
         fzA/0ZctBqef2ff+C+2ycbZQW1dWBqc3FVWQrnaoYH/0+hVPOuFMVQ7fgIfPDizgd5Hu
         VtOMSi3KVy8KMS1oYF5Bn+xAMTyy3JKUlgzSA1bF3KAm37OLVJ0TXNKRx73fqfEKZMb5
         ixEP3uEKiRsF/SCTwa5SAB9vkXubRpBHfmMd+gKuF8kz+qK0lP/SIPf0Y8VsGL1TpQDM
         vDkLBdTqjznbdixabyBnL2oZOXmW8dBQD5bic+BqWaSb6obSloNOSg+96uYH3MoVxryn
         lbyQ==
X-Gm-Message-State: AOAM531Fj2/OYYxytjXWQXQIbao7/h29+V9TOcm14J095xnVkrpphwJ0
        MjX2aA6LO1Qosjzb0AiDyjaS+dq+Q8uveYgmxKfi5rLcBi7+RQ==
X-Google-Smtp-Source: ABdhPJySFUINMJMixO8zjYrN5d3dPQurR2XuF6FeIqDtLCfyJ3PnvHW2g+hJC7Fln34M7qkAWjkWthog0cz8f1w8sAY=
X-Received: by 2002:a17:903:1248:b0:151:9708:d586 with SMTP id
 u8-20020a170903124800b001519708d586mr39321437plh.15.1649792440697; Tue, 12
 Apr 2022 12:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220408211230.601475-1-olvaffe@gmail.com> <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
In-Reply-To: <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 12 Apr 2022 12:41:40 -0700
Message-ID: <CAJs_Fx6ehFu4Fzvo93XCN+7yufU0NQCshreDniRk37V4f6fmPA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Chia-I Wu <olvaffe@gmail.com>, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Apr 9, 2022 at 7:33 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 08.04.22 um 23:12 schrieb Chia-I Wu:
> > In practice, trace_dma_fence_init is good enough and almost no driver
> > calls trace_dma_fence_emit.  But this is still more correct in theory.
>
> Well, the reason why basically no driver is calling this is because it
> is pretty much deprecated.
>
> We do have a case in the GPU scheduler where it makes sense to distinct
> between init and emit, but it doesn't really matter for drivers.
>
> So I'm not sure if it's a good idea to add that here.

visualization can't easily differentiate between drivers/timelines
where the split matters and ones where it doesn't..  IMO it is better
to just have the extra trace even in the cases where it comes at the
same time as the init trace

BR,
-R

> Regards,
> Christian.
>
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > Cc: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index faf0c242874e..a82193f41ea2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/string_helpers.h>
> >   #include <linux/devcoredump.h>
> >   #include <linux/sched/task.h>
> > +#include <trace/events/dma_fence.h>
> >
> >   /*
> >    * Power Management:
> > @@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm=
_gem_submit *submit)
> >       gpu->active_submits++;
> >       mutex_unlock(&gpu->active_lock);
> >
> > +     trace_dma_fence_emit(submit->hw_fence);
> >       gpu->funcs->submit(gpu, submit);
> >       gpu->cur_ctx_seqno =3D submit->queue->ctx->seqno;
> >
>
