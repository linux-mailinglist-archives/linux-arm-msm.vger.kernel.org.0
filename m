Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB35E2E85FD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Jan 2021 01:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbhABAOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jan 2021 19:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbhABAOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jan 2021 19:14:20 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88804C0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jan 2021 16:13:40 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id p5so10468575qvs.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jan 2021 16:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h6hPVw3Y9ffaDd/wr9BylZbRramsxfRldta5Gez13JA=;
        b=B1dc7LyG1pSw348YgWSBck9yQARBdAnVve3BxcWHMxlG5EZ9S2QEU+wcumJf4gqXgW
         tqD6UmQWmGfq5te+1mQOjsGrgXMKksSStm/BvPfdpQH6VJbNThxp1rcWhibHY2BHcc9h
         CSnHy+3/1tSEFthafMpb8gCI8rM2C2MUrPyTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h6hPVw3Y9ffaDd/wr9BylZbRramsxfRldta5Gez13JA=;
        b=YhX1n55SxKleYQnM1Z0wpONhhjVsmAG/jpg+ny9KX2QMMHQ1bGBG12ykdkNiep0SSk
         Q7zIyqf+aUhjsTqbflyM7CPRnsfGE1vvjSD0Ayk6YbTRYzi0ZOk1gSBfLkKJ+xu8dXsY
         oAbIGtMxw5U+GUCsTma/hVTBPQO6Tw2M+LSROSxzQmpUCaoUOeLY7FjiUAEOfitg+C6n
         xiOp1dKPBkJZ2YYDPhYYlfrHYQSoIoU/bIrv38RAdHD5nNtlVUkf56+/xPFfuu3hf5xX
         PJuBQNK9ZWduZyejAr93cMFcAXHhk0yifFOKIFvWNlbDSV4GlbXQcZ0lIftdWYiERj2a
         17Qw==
X-Gm-Message-State: AOAM533hijPBAjseCKmnWA23OFECJJuULaX89FXYTZdh3o9c1g/r/PNF
        vC9TS+lDUe+pjO+2/LNCRIm6UO/7ZMrkIQ==
X-Google-Smtp-Source: ABdhPJwmsP5Za/jIScSY8fGZ+ew180FkOCl4p3HuhdAdfqf9DHJTo6Zjpx+zUbzaCZfwUY+mWtbAiA==
X-Received: by 2002:a0c:fd64:: with SMTP id k4mr36771131qvs.3.1609546419209;
        Fri, 01 Jan 2021 16:13:39 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id x20sm32907325qkj.18.2021.01.01.16.13.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jan 2021 16:13:38 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id x2so20577211ybt.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jan 2021 16:13:37 -0800 (PST)
X-Received: by 2002:a25:68cc:: with SMTP id d195mr83519466ybc.424.1609546417341;
 Fri, 01 Jan 2021 16:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-8-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-8-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 1 Jan 2021 16:13:25 -0800
X-Gmail-Original-Message-ID: <CAMfZQbzxBdND1VxRJ_P+V7X6f5noZ7bdAjOJHjLfVmQHbBQoLg@mail.gmail.com>
Message-ID: <CAMfZQbzxBdND1VxRJ_P+V7X6f5noZ7bdAjOJHjLfVmQHbBQoLg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] venus: venc: Handle reset encoder state
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

How should we resolve this patch in relation to the "venus: venc: Init
the session only once in queue_setup" [1] patch?

"venus: venc: Init the session only once in queue_setup" comes after
and reworks |venc_start_streaming| substantially.  This patch
implements |venc_stop_streaming|, but maybe that is not needed with
the newer patch?  Can this one just be dropped, or does it need
rework?

-Fritz

[1]: https://lore.kernel.org/patchwork/patch/1349416/

On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Redesign the encoder driver to be compliant with stateful encoder
> spec - specifically adds handling of Reset state.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 155 ++++++++++++++++++-----
>  1 file changed, 122 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 7512e4a16270..f1ae89d45a54 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -907,6 +907,54 @@ static int venc_queue_setup(struct vb2_queue *q,
>         return ret;
>  }
>
> +static void venc_release_session(struct venus_inst *inst)
> +{
> +       int ret, abort = 0;
> +
> +       mutex_lock(&inst->lock);
> +
> +       ret = hfi_session_deinit(inst);
> +       abort = (ret && ret != -EINVAL) ? 1 : 0;
> +
> +       if (inst->session_error)
> +               abort = 1;
> +
> +       if (abort)
> +               hfi_session_abort(inst);
> +
> +       venus_pm_load_scale(inst);
> +       INIT_LIST_HEAD(&inst->registeredbufs);
> +       mutex_unlock(&inst->lock);
> +
> +       venus_pm_release_core(inst);
> +}
> +
> +static int venc_buf_init(struct vb2_buffer *vb)
> +{
> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +
> +       inst->buf_count++;
> +
> +       return venus_helper_vb2_buf_init(vb);
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
> +}
> +
>  static int venc_verify_conf(struct venus_inst *inst)
>  {
>         enum hfi_version ver = inst->core->res->hfi_version;
> @@ -938,49 +986,57 @@ static int venc_verify_conf(struct venus_inst *inst)
>  static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  {
>         struct venus_inst *inst = vb2_get_drv_priv(q);
> +       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>         int ret;
>
>         mutex_lock(&inst->lock);
>
> -       if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +       v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
> +
> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>                 inst->streamon_out = 1;
>         else
>                 inst->streamon_cap = 1;
>
> -       if (!(inst->streamon_out & inst->streamon_cap)) {
> -               mutex_unlock(&inst->lock);
> -               return 0;
> -       }
> +       if (inst->streamon_out && inst->streamon_cap &&
> +           inst->state == INST_UNINIT) {
> +               venus_helper_init_instance(inst);
>
> -       venus_helper_init_instance(inst);
> +               inst->sequence_cap = 0;
> +               inst->sequence_out = 0;
>
> -       inst->sequence_cap = 0;
> -       inst->sequence_out = 0;
> +               ret = venc_init_session(inst);
> +               if (ret)
> +                       goto bufs_done;
>
> -       ret = venc_init_session(inst);
> -       if (ret)
> -               goto bufs_done;
> +               ret = venus_pm_acquire_core(inst);
> +               if (ret)
> +                       goto deinit_sess;
>
> -       ret = venus_pm_acquire_core(inst);
> -       if (ret)
> -               goto deinit_sess;
> +               ret = venc_verify_conf(inst);
> +               if (ret)
> +                       goto deinit_sess;
>
> -       ret = venc_set_properties(inst);
> -       if (ret)
> -               goto deinit_sess;
> +               ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
> +                                               inst->num_output_bufs, 0);
> +               if (ret)
> +                       goto deinit_sess;
>
> -       ret = venc_verify_conf(inst);
> -       if (ret)
> -               goto deinit_sess;
> +               ret = venus_helper_vb2_start_streaming(inst);
> +               if (ret)
> +                       goto deinit_sess;
>
> -       ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
> -                                       inst->num_output_bufs, 0);
> -       if (ret)
> -               goto deinit_sess;
> +               venus_helper_process_initial_out_bufs(inst);
> +               venus_helper_process_initial_cap_bufs(inst);
> +       } else if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->streamon_cap &&
> +                  inst->streamon_out) {
> +               ret = venus_helper_vb2_start_streaming(inst);
> +               if (ret)
> +                       goto bufs_done;
>
> -       ret = venus_helper_vb2_start_streaming(inst);
> -       if (ret)
> -               goto deinit_sess;
> +               venus_helper_process_initial_out_bufs(inst);
> +               venus_helper_process_initial_cap_bufs(inst);
> +       }
>
>         mutex_unlock(&inst->lock);
>
> @@ -990,15 +1046,43 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>         hfi_session_deinit(inst);
>  bufs_done:
>         venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
> -       if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>                 inst->streamon_out = 0;
>         else
>                 inst->streamon_cap = 0;
> +
>         mutex_unlock(&inst->lock);
>         return ret;
>  }
>
> -static void venc_vb2_buf_queue(struct vb2_buffer *vb)
> +static void venc_stop_streaming(struct vb2_queue *q)
> +{
> +       struct venus_inst *inst = vb2_get_drv_priv(q);
> +       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
> +       int ret = -EINVAL;
> +
> +       mutex_lock(&inst->lock);
> +
> +       v4l2_m2m_clear_state(m2m_ctx);
> +
> +       if (V4L2_TYPE_IS_CAPTURE(q->type)) {
> +               ret = hfi_session_stop(inst);
> +               ret |= hfi_session_unload_res(inst);
> +               ret |= venus_helper_unregister_bufs(inst);
> +               ret |= venus_helper_intbufs_free(inst);
> +       }
> +
> +       venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +
> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
> +               inst->streamon_out = 0;
> +       else
> +               inst->streamon_cap = 0;
> +
> +       mutex_unlock(&inst->lock);
> +}
> +
> +static void venc_buf_queue(struct vb2_buffer *vb)
>  {
>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>         struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> @@ -1022,11 +1106,12 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>
>  static const struct vb2_ops venc_vb2_ops = {
>         .queue_setup = venc_queue_setup,
> -       .buf_init = venus_helper_vb2_buf_init,
> +       .buf_init = venc_buf_init,
> +       .buf_cleanup = venc_buf_cleanup,
>         .buf_prepare = venus_helper_vb2_buf_prepare,
>         .start_streaming = venc_start_streaming,
> -       .stop_streaming = venus_helper_vb2_stop_streaming,
> -       .buf_queue = venc_vb2_buf_queue,
> +       .stop_streaming = venc_stop_streaming,
> +       .buf_queue = venc_buf_queue,
>  };
>
>  static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
> @@ -1084,8 +1169,12 @@ static const struct hfi_inst_ops venc_hfi_ops = {
>         .event_notify = venc_event_notify,
>  };
>
> +static void venc_m2m_device_run(void *priv)
> +{
> +}
> +
>  static const struct v4l2_m2m_ops venc_m2m_ops = {
> -       .device_run = venus_helper_m2m_device_run,
> +       .device_run = venc_m2m_device_run,
>         .job_abort = venus_helper_m2m_job_abort,
>  };
>
> --
> 2.17.1
>
