Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B5969FA5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 18:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbjBVRrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 12:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjBVRrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 12:47:22 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CAB3D934
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:47:17 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bg11so8622390oib.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oXuZiVkdxXl94pWmoBOSfddctzecfqzqWUepbQog4+M=;
        b=d+XcrYZdGh9ImNucjkTcaP9Levht/SReyRHCSmQPYGN/mGIoju7vfneKS+9KQOdKXx
         oaPGlW7+z6SSca87Tr8fhNnCoCU07En/4o5zDrMill+HL20fc4JQOVZJCY7pbyFjVq8D
         hxnqNRZ6WBXzSUKZOyigcl7nQazxfn2NksxLeNVL8FfUW7R5MYfzPmTpmBXJtfOOAb24
         BoFjHOvyRQJNYysRp4sSY9KRaw2Rm5ujegKYNcpWyP5Vb+wfzUZp4tVzknvL5NNjxmTK
         CUTKy44x57pD6dFBHgFqVg6qvA5BFmYEMqvChMILPXdoOvWCz6ouLFIsP7yiA/dv+RAj
         JonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXuZiVkdxXl94pWmoBOSfddctzecfqzqWUepbQog4+M=;
        b=DTsiHCvtFIMp8387DllY3TALihNXj+oXfYMEs4M0+nDVHXDMKllr9i1wicmoLeF0T7
         sw8kPkTi4fAyEGxR3HSJvScVqje32iDXZ/MMaDDwx/8+oTcYxZ7kV+zGsXJIk6tJ8X7P
         YYFquVd+5Fa5KtiXCwReghxw1pYyqwF0gsrwCoD9mEnBlxWLfszenIDbwQrLJiA5CC6i
         kwtWCwAF14ZCEV38ragnKaFrFdN6IOk8aJmET7XjBmF+Rb4b1+m2BFpaQc8+R0crZBYa
         AAyl0Gv/xyCuuU1TwTszlCEp+OC8+h1lkQdLrb7K4tjT05LHUFoNSAoLFzewbXeZoNBP
         9Ypg==
X-Gm-Message-State: AO0yUKUDRQg9ODxim4kegQlv1aUY8hlUuIZoVafkxR0PJ+hveJJTaxny
        Y4AJ9MG/d1jCzSyfC/NElgdQm/CCHeLUpn0uBWA=
X-Google-Smtp-Source: AK7set9zfy4HxzzpDn0lFFE16Ew1ffKzEzp9s80BgsQ4DxHCqImlxUG3qI9dx3bOf7wNVB8bfJWMfs8rbYCThAo9jJQ=
X-Received: by 2002:a05:6808:16ab:b0:37d:81a9:5103 with SMTP id
 bb43-20020a05680816ab00b0037d81a95103mr1441359oib.38.1677088036803; Wed, 22
 Feb 2023 09:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org> <20230218012546.3655999-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230218012546.3655999-2-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 22 Feb 2023 09:47:05 -0800
Message-ID: <CAF6AEGsRA+sV9PpdDxpZ_eFVoV6+GJpB1tHf8190F3YNR5CMQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 17, 2023 at 5:25 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The variable ring is not used by msm_parse_deps() and
> msm_ioctl_gem_submit() and thus can be dropped.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++-------
>  drivers/gpu/drm/msm/msm_gpu_trace.h  | 10 ++++------
>  2 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index ac8ed731f76d..a539eb31042f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -550,8 +550,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
>                                             struct drm_file *file,
>                                             uint64_t in_syncobjs_addr,
>                                             uint32_t nr_in_syncobjs,
> -                                           size_t syncobj_stride,
> -                                           struct msm_ringbuffer *ring)
> +                                           size_t syncobj_stride)
>  {
>         struct drm_syncobj **syncobjs = NULL;
>         struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
> @@ -722,7 +721,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         struct msm_gem_submit *submit;
>         struct msm_gpu *gpu = priv->gpu;
>         struct msm_gpu_submitqueue *queue;
> -       struct msm_ringbuffer *ring;
>         struct msm_submit_post_dep *post_deps = NULL;
>         struct drm_syncobj **syncobjs_to_reset = NULL;
>         int out_fence_fd = -1;
> @@ -760,8 +758,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         if (!queue)
>                 return -ENOENT;
>
> -       ring = gpu->rb[queue->ring_nr];
> -
>         if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
>                 out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
>                 if (out_fence_fd < 0) {
> @@ -774,7 +770,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         if (IS_ERR(submit))
>                 return PTR_ERR(submit);
>
> -       trace_msm_gpu_submit(pid_nr(submit->pid), ring->id, submit->ident,
> +       trace_msm_gpu_submit(pid_nr(submit->pid), submit->ident,
>                 args->nr_bos, args->nr_cmds);

Please don't remove things from the tracepoint, we have userspace
tools that use the tracepoints..

Other parts look ok.

BR,
-R

>
>         ret = mutex_lock_interruptible(&queue->lock);
> @@ -803,7 +799,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>                 syncobjs_to_reset = msm_parse_deps(submit, file,
>                                                    args->in_syncobjs,
>                                                    args->nr_in_syncobjs,
> -                                                  args->syncobj_stride, ring);
> +                                                  args->syncobj_stride);
>                 if (IS_ERR(syncobjs_to_reset)) {
>                         ret = PTR_ERR(syncobjs_to_reset);
>                         goto out_unlock;
> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
> index ac40d857bc45..12ef10f1de4c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
> @@ -9,24 +9,22 @@
>  #define TRACE_INCLUDE_FILE msm_gpu_trace
>
>  TRACE_EVENT(msm_gpu_submit,
> -           TP_PROTO(pid_t pid, u32 ringid, u32 id, u32 nr_bos, u32 nr_cmds),
> -           TP_ARGS(pid, ringid, id, nr_bos, nr_cmds),
> +           TP_PROTO(pid_t pid, u32 id, u32 nr_bos, u32 nr_cmds),
> +           TP_ARGS(pid, id, nr_bos, nr_cmds),
>             TP_STRUCT__entry(
>                     __field(pid_t, pid)
>                     __field(u32, id)
> -                   __field(u32, ringid)
>                     __field(u32, nr_cmds)
>                     __field(u32, nr_bos)
>                     ),
>             TP_fast_assign(
>                     __entry->pid = pid;
>                     __entry->id = id;
> -                   __entry->ringid = ringid;
>                     __entry->nr_bos = nr_bos;
>                     __entry->nr_cmds = nr_cmds
>                     ),
> -           TP_printk("id=%d pid=%d ring=%d bos=%d cmds=%d",
> -                   __entry->id, __entry->pid, __entry->ringid,
> +           TP_printk("id=%d pid=%d bos=%d cmds=%d",
> +                   __entry->id, __entry->pid,
>                     __entry->nr_bos, __entry->nr_cmds)
>  );
>
> --
> 2.39.1
>
