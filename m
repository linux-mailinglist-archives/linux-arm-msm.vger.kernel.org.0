Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52CB34FA06B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 02:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiDIAI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 20:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiDIAI6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 20:08:58 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFCB3917D
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 17:06:53 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id i15so8758828qvh.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 17:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1k6iLY0Sudq6bD8a2o9/5Y9vGDy0Ty1UHyUSaVtK5/E=;
        b=WO7NRHdgsGgShWssE4KZmx5Crzkop58DmBiu2kU2evwqUpHP6keMMDLgjrAmE7XIYw
         Lri2mCKwcwFizod56jA+IOHPFJAfZv2BIm3WyFhbbT8AT0tjlJqiRi7jdfXwuvI8m11s
         dtmnr3ygIrHO6xctm07t7VE9Kw5bf1ECwzhNagMlsF1IB2YjXp1ABcTsywqgWXoTd20S
         OH08D++ttEus/iqInpw2OP1VAev8Zes+Q7FuN5Cd9cWRdjXFvdh7w6PTqqyQWfZX16CO
         e59vIdAXnHrwWsGc/x/oISNoKtG7Oe5XiQhhsPjob9ACULrXBtpBtVZR5zgK50f7Qzxj
         GMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1k6iLY0Sudq6bD8a2o9/5Y9vGDy0Ty1UHyUSaVtK5/E=;
        b=ful3bRRCmfxL0qtLiwqq/0S3eyybx/DB9hS+74LS1E9pPY1WXjPIRy88qxR0+MMLIL
         W1qQjJ/k4ycCF0Cps+zpIKKLvOD072PstwYrtsXjthjZyqpUOspFhlKjtcWDJt+prNJP
         AOCQ5ywtfrNnjvV03KI4eiRwqMsYwoYwrr7kXx1nITC6wAvxc5Tk2XWw48uvD9cLJwML
         s2UN/yT9D+aEYfPfjUUy8M93qb2ktApsQ5u0rKvn+hiDk+JgdO72mQbUgUYXBklx28uX
         tyFSY91ONjWz2i3/n67YHkz6cvm7owxjU1olL4y6GJzgIUrt2QMgad0RzmgfxohnxUyK
         yzag==
X-Gm-Message-State: AOAM530YoB/EZYVfWr8ziRYd8oiHiEJtVInH+gMlRv6nWLs2HN9pAshZ
        n5zuJ3JXm36C5xCW7eIzxpmjYIFS7ugLGba1eGyYDA==
X-Google-Smtp-Source: ABdhPJxMwBnJy1/5ajpEfEKria8ImS3O8GaTTh1+JHZ/4S7dCNM6HgIemhFd6yGo9B0iTimRK6GaefIOyjsPI7VKlcc=
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id
 dk1-20020a056214092100b00443ce3d577bmr18468477qvb.122.1649462812263; Fri, 08
 Apr 2022 17:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220408211230.601475-1-olvaffe@gmail.com>
In-Reply-To: <20220408211230.601475-1-olvaffe@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 9 Apr 2022 03:06:41 +0300
Message-ID: <CAA8EJpoMrOj6OoCjMGkSQFoc6GPGS1C=mqtoC+5Ph+vOZzntew@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To:     Chia-I Wu <olvaffe@gmail.com>
Cc:     freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 9 Apr 2022 at 00:12, Chia-I Wu <olvaffe@gmail.com> wrote:
>
> In practice, trace_dma_fence_init is good enough and almost no driver
> calls trace_dma_fence_emit.  But this is still more correct in theory.

Please mention in the commit message that the trace_dma_fence_init()
is called from dma_fence_init().
With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index faf0c242874e..a82193f41ea2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -15,6 +15,7 @@
>  #include <linux/string_helpers.h>
>  #include <linux/devcoredump.h>
>  #include <linux/sched/task.h>
> +#include <trace/events/dma_fence.h>
>
>  /*
>   * Power Management:
> @@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>         gpu->active_submits++;
>         mutex_unlock(&gpu->active_lock);
>
> +       trace_dma_fence_emit(submit->hw_fence);
>         gpu->funcs->submit(gpu, submit);
>         gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
>
> --
> 2.35.1.1178.g4f1659d476-goog
>


-- 
With best wishes
Dmitry
