Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273482C3792
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 04:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgKYDN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 22:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgKYDN6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 22:13:58 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA682C061A4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 19:13:57 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id t6so1034270lfl.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 19:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ysd39sL59vWxn88DsaTCAx9qkWuB5Qt0Fwsya+HXsDg=;
        b=Snd231rj7hC01uO8wYhpl81Hr3v0uOm83AACN8G8ordUgLhcXb7v6whzogOdcvsvyE
         7dgtcGo5YVe2vYNZqnb4tDuPnSBa0B1shocKkBkwtX/ssO41e49GneChLi3m679rGfiv
         ZHnRvQ1gKhNIrLMoBy9+5OK9GUxW9mO0b2g/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ysd39sL59vWxn88DsaTCAx9qkWuB5Qt0Fwsya+HXsDg=;
        b=e9+f9u5RjVTuf0sWHzlrnzDOj7S3NeuRGlYZ/5Bx4iMwz8ReVagqkkOD3d+c1F5lp9
         7o1a3fB/z7Lk20r8/xov5tbu8jZqpXW6xv0Lqvsj+fn5U7gOyj5wNyJziOxfLVHg4xET
         LtzE7D0C6OHu02Vbp3b1ddGrSuYxJyRBi9xIOLJ4B0u5lytomQ5A/C3sqEmIGVq2xr+y
         8RQ2hgCeXBYn5J/lUMVKe5Uc22B4VrOPqYOCXOaaOwa75kpBUqmx2HanetqVmIpcYcfZ
         BIzWkYXrm7bZW+TdHMBF4Po3AJM6Ma+2cWQ/8iYM6wm0mmxOBXoVn3TVPwU08VTk1b30
         tV5A==
X-Gm-Message-State: AOAM53261Cd1vvrMwJnw6CY81IuubIRSaRML86ZPk5IRW40lZK19/zuf
        +0EJn/JA4nMRtzlanOBg8iUYhroI44keiw==
X-Google-Smtp-Source: ABdhPJzX5AfnX3e8g2LWT8DoNy5lfltAGYwN1FJoDEZzy1sE4eN0r8F5GZQnCUod49MvsUZXe34pJg==
X-Received: by 2002:a19:ca49:: with SMTP id h9mr453130lfj.602.1606274035457;
        Tue, 24 Nov 2020 19:13:55 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id i4sm91812lfl.131.2020.11.24.19.13.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 19:13:55 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id u19so1071486lfr.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 19:13:54 -0800 (PST)
X-Received: by 2002:a05:6512:5d7:: with SMTP id o23mr480237lfo.272.1606274033807;
 Tue, 24 Nov 2020 19:13:53 -0800 (PST)
MIME-Version: 1.0
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org> <20201120001037.10032-2-stanimir.varbanov@linaro.org>
In-Reply-To: <20201120001037.10032-2-stanimir.varbanov@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 25 Nov 2020 12:13:43 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUU2tKUarrdPennSQ0NVnOUp+jwS3DN3Qye-wiq-aT5_Q@mail.gmail.com>
Message-ID: <CAPBb6MUU2tKUarrdPennSQ0NVnOUp+jwS3DN3Qye-wiq-aT5_Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] venus: venc: Init the session only once in queue_setup
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stan,

On Fri, Nov 20, 2020 at 9:12 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Init the hfi session only once in queue_setup and also cover that
> with inst->lock.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 98 ++++++++++++++++++------
>  1 file changed, 73 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 4ecf78e30b59..3a2e449663d8 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -725,8 +725,10 @@ static int venc_init_session(struct venus_inst *inst)
>         int ret;
>
>         ret = hfi_session_init(inst, inst->fmt_cap->pixfmt);
> -       if (ret)
> -               return ret;
> +       if (ret == -EINVAL)
> +               return 0;

Why is it safe to ignore EINVAL here?

> +       else if (ret)
> +               goto deinit;
>
>         ret = venus_helper_set_input_resolution(inst, inst->width,
>                                                 inst->height);
> @@ -762,17 +764,13 @@ static int venc_out_num_buffers(struct venus_inst *inst, unsigned int *num)
>         struct hfi_buffer_requirements bufreq;
>         int ret;
>
> -       ret = venc_init_session(inst);
> +       ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
>         if (ret)
>                 return ret;
>
> -       ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
> -
>         *num = bufreq.count_actual;
>
> -       hfi_session_deinit(inst);
> -
> -       return ret;
> +       return 0;
>  }
>
>  static int venc_queue_setup(struct vb2_queue *q,
> @@ -781,7 +779,7 @@ static int venc_queue_setup(struct vb2_queue *q,
>  {
>         struct venus_inst *inst = vb2_get_drv_priv(q);
>         unsigned int num, min = 4;
> -       int ret = 0;
> +       int ret;
>
>         if (*num_planes) {
>                 if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> @@ -803,6 +801,17 @@ static int venc_queue_setup(struct vb2_queue *q,
>                 return 0;
>         }
>
> +       ret = mutex_lock_interruptible(&inst->lock);
> +       if (ret)
> +               return ret;
> +
> +       ret = venc_init_session(inst);
> +
> +       mutex_unlock(&inst->lock);
> +
> +       if (ret)
> +               return ret;
> +
>         switch (q->type) {
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>                 *num_planes = inst->fmt_out->num_planes;
> @@ -838,6 +847,54 @@ static int venc_queue_setup(struct vb2_queue *q,
>         return ret;
>  }
>
> +static int venc_buf_init(struct vb2_buffer *vb)
> +{
> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +
> +       inst->buf_count++;
> +
> +       return venus_helper_vb2_buf_init(vb);
> +}
> +
> +static void venc_release_session(struct venus_inst *inst)
> +{
> +       int ret, abort = 0;
> +
> +       mutex_lock(&inst->lock);
> +
> +       ret = hfi_session_deinit(inst);
> +       abort = (ret && ret != -EINVAL) ? 1 : 0;

Here as well, I think a comment is warranted to explain why we can
ignore EINVAL.

> +
> +       if (inst->session_error)
> +               abort = 1;
> +
> +       if (abort)
> +               hfi_session_abort(inst);
> +
> +       mutex_unlock(&inst->lock);
> +
> +       venus_pm_load_scale(inst);
> +       INIT_LIST_HEAD(&inst->registeredbufs);
> +       venus_pm_release_core(inst);
> +}
> +
> +static void venc_buf_cleanup(struct vb2_buffer *vb)
> +{
> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +       struct venus_buffer *buf = to_venus_buffer(vbuf);
> +
> +       mutex_lock(&inst->lock);
> +       if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +               if (!list_empty(&inst->registeredbufs))
> +                       list_del_init(&buf->reg_list);
> +       mutex_unlock(&inst->lock);
> +
> +       inst->buf_count--;
> +       if (!inst->buf_count)
> +               venc_release_session(inst);

We are calling venc_init_session() during the queue setup but
venc_release_session() when the last buffer is cleaned up. For
symmetry, wouldn't it make sense to call venc_init_session() when the
first buffer is initialized by venc_buf_init()? Otherwise we can
potentially have a scenario where the queue is set up, but no buffer
is ever created, leading to the session never being released.

> +}
> +
>  static int venc_verify_conf(struct venus_inst *inst)
>  {
>         enum hfi_version ver = inst->core->res->hfi_version;
> @@ -888,38 +945,28 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>         inst->sequence_cap = 0;
>         inst->sequence_out = 0;
>
> -       ret = venc_init_session(inst);
> -       if (ret)
> -               goto bufs_done;
> -
>         ret = venus_pm_acquire_core(inst);
>         if (ret)
> -               goto deinit_sess;
> -
> -       ret = venc_set_properties(inst);
> -       if (ret)
> -               goto deinit_sess;
> +               goto error;
>
>         ret = venc_verify_conf(inst);
>         if (ret)
> -               goto deinit_sess;
> +               goto error;
>
>         ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
>                                         inst->num_output_bufs, 0);
>         if (ret)
> -               goto deinit_sess;
> +               goto error;
>
>         ret = venus_helper_vb2_start_streaming(inst);
>         if (ret)
> -               goto deinit_sess;
> +               goto error;
>
>         mutex_unlock(&inst->lock);
>
>         return 0;
>
> -deinit_sess:
> -       hfi_session_deinit(inst);
> -bufs_done:
> +error:
>         venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
>         if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>                 inst->streamon_out = 0;
> @@ -940,7 +987,8 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>
>  static const struct vb2_ops venc_vb2_ops = {
>         .queue_setup = venc_queue_setup,
> -       .buf_init = venus_helper_vb2_buf_init,
> +       .buf_init = venc_buf_init,
> +       .buf_cleanup = venc_buf_cleanup,
>         .buf_prepare = venus_helper_vb2_buf_prepare,
>         .start_streaming = venc_start_streaming,
>         .stop_streaming = venus_helper_vb2_stop_streaming,
> --
> 2.17.1
>
