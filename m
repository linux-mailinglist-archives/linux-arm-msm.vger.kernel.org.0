Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48A84FA9FA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 19:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242924AbiDIRrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Apr 2022 13:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242923AbiDIRrk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Apr 2022 13:47:40 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686CB34BA5
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Apr 2022 10:45:32 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id d10so13545043edj.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Apr 2022 10:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3zBO5CD9UX+IT76AzELaMXNAgkmYrYDhrgj6xL0L14E=;
        b=TSb58y9YqPpVFRPdbIEQK+gFoprP+Jdfjo+Oykg41m3A9z2nrKlZs/ekYbK5nRpGSS
         bUkuKaTAs8k6TonxGtfYxjzXGuQIFnGPF6g60bTV7A0yiUIz21MeyFIBKpBNE/NhLslv
         IHm1fpMxvixQjFjxx/AFx2C+7JWeevZxgmIhIR/OFbFTLgohUvVRWGvW8+IAbhJtQSYi
         7fP0VW8m/P7Vg2sZZm8nR7QFzM20Jp4TjZRViRFD+7I5qrzzSuUN9SYsUoXTCV2V9UTB
         AH9byGAWbNcp+57iQ8jcHM5GOxq9yBSkSniyaTO7XpiMjpmT+jMpmOStwsH8uMQV63iz
         nzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3zBO5CD9UX+IT76AzELaMXNAgkmYrYDhrgj6xL0L14E=;
        b=tOcDERtimExOVc7bLw3A9bAhmwsqtEifGQYQ8nsFeEspEg7+VhsJZHnnoD4pWsMx31
         DcUZXreemLPGC+nK+HG783fTIG35/sdHRNs9NrFejyl3DQGJQpghnh69KNZ5SdMu8vqn
         TNM9kVRkZ5gwa5q6Qflbhn3ih3iX+6DrVbpkLC6oOOZbFIs6qQdZeoaOiPzsEbLeJ+Jw
         6658d3y7F7OwaW0YnD0PumqUk91ppYrsjx1mM/W+V09PH3lDQgkji8dVIS7s2kbTmAPN
         Hi1ktRNDAUE2JX1eE4LLqKnXZxrMAY20ceTKxnRekHtWIbZjNQhVG6KgZPTlFTyVuxXk
         xeVA==
X-Gm-Message-State: AOAM531kJn0cjBU3hpUybCF/uxd5oZwIwewv0mXHAP83IyJizL1UuFsx
        4Y+FiQKWfwKoq7IfWEka23uIgGKnadJK1Jey+YI=
X-Google-Smtp-Source: ABdhPJyPeErwbdDr92uL/Pq3ty2CewQvMwmQpNfy2FUbFVBaK6JTwqCspZ6zZptxqIZ/DpezXq01fduO9SGvQv9I4E0=
X-Received: by 2002:a05:6402:2794:b0:419:2ed8:f36e with SMTP id
 b20-20020a056402279400b004192ed8f36emr25167817ede.44.1649526330798; Sat, 09
 Apr 2022 10:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220408211230.601475-1-olvaffe@gmail.com> <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
In-Reply-To: <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Sat, 9 Apr 2022 10:45:19 -0700
Message-ID: <CAPaKu7Tk3PjuzmbaVOrQbTXMZAg95frV+n4pQb76StSLoRt8gA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     freedreno@lists.freedesktop.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
Why is it considered deprecated?  trace_dma_fence_{emit,signaled} are
useful to visualize fence timelines.  I am actually less sure about
how trace_dma_fence_{init,destroy} are used.

Is it because trace_dma_fence_init is called automatically, and is
good enough most of the time?

>
> We do have a case in the GPU scheduler where it makes sense to distinct
> between init and emit, but it doesn't really matter for drivers.
virtio also has a case where init and emit can be far apart, when the
host cannot process commands fast enough and there is no space in
virtqueue.

>
> So I'm not sure if it's a good idea to add that here.
>
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
