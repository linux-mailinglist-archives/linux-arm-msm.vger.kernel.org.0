Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88E32C783A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Nov 2020 07:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgK2GNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Nov 2020 01:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgK2GNG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Nov 2020 01:13:06 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A247C0613D2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:12:20 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id d17so12432488ejy.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c9wTU9wEjbp/1E7ua+WrSBOxafo4H65ItS3T6AdDsh0=;
        b=NvfhufPwbp7lWu4WJTjA8zzjpv3w+MZoTm0bkSEA8Lb8cf8YdESE+z8JUFBlAa16UW
         NimLjX46+ZPY6EYZbXx26ptvIa5ZuYuugki9pGiGGMVIW/ZIpXPGoUJJQwBdQfRQ5SFc
         VSceKLtDdUKsPWCFBuZ1wEXsQXXeSQ4FsyNKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c9wTU9wEjbp/1E7ua+WrSBOxafo4H65ItS3T6AdDsh0=;
        b=Ek/fAmrm3oR5yfDY75nY3Zu3ndHGmWxRjTnD2/z/OlZb+ELkbhOy8rv8EEej3wCvAz
         ZusdWs/UQ/IksomUwbSrOn3mcDDdW+Rv1VOwedamle+XNHvK8cJLBHJn77KB9MzOwtYU
         zc4xxxpTR3v8xoni4XriZzrD3eu0Xp+fGXlCwN+kGcLTbMXG9oCS5lTwgqCadx8fkUq/
         fpkhEpvwrKccyQA9Fn9CRcTYmj9kTVrTPvnSl+8/0uKDRnBF+MlwZ1qq3J1eG2aMdcYK
         v4eT42ilksTc5WrGkflEa0Qsxxo2rQ4SGZ401QJcWrcO4jW/ajv1RUMQ6rEQ7ljDnMSx
         z+LQ==
X-Gm-Message-State: AOAM533im0lq4/rsD/U+pskIKIMWr5WJrNNJf4eIYAFpc2r2G3aomUi5
        AYZfAVXwfRD4zYsRNHoEiTFKZeachyNUqA==
X-Google-Smtp-Source: ABdhPJyBp2sJ6Ftvlqa/LJ51UuP7h6ZCjfAchi6FxcI94XhsUcvLlb5Qb9UhGeyOcTBctZXgksKGNQ==
X-Received: by 2002:a17:906:6b86:: with SMTP id l6mr15447038ejr.524.1606630338691;
        Sat, 28 Nov 2020 22:12:18 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id n22sm7328479edr.11.2020.11.28.22.12.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 22:12:18 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id k10so5448810wmi.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:12:17 -0800 (PST)
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr754444wmd.39.1606630337573;
 Sat, 28 Nov 2020 22:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-7-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-7-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sat, 28 Nov 2020 22:12:05 -0800
X-Gmail-Original-Message-ID: <CAMfZQbzWgOvwupXyuzSbn8dWrbgyDEt2mV-SJLwxUkWGXWs7sQ@mail.gmail.com>
Message-ID: <CAMfZQbzWgOvwupXyuzSbn8dWrbgyDEt2mV-SJLwxUkWGXWs7sQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] venus: venc: add handling for VIDIOC_ENCODER_CMD
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> From: Dikshita Agarwal <dikshita@codeaurora.org>
>
> Add handling for below commands in encoder:
> 1. V4L2_ENC_CMD_STOP
> 2. V4L2_ENC_CMD_START
>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 77 +++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 99bfabf90bd2..7512e4a16270 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -507,6 +507,59 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>         return 0;
>  }
>
> +static int venc_encoder_cmd(struct file *file, void *fh,
> +                           struct v4l2_encoder_cmd *ec)
> +{
> +       struct venus_inst *inst = to_inst(file);
> +       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
> +       struct hfi_frame_data fdata = {0};
> +       int ret = 0;
> +
> +       ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
> +       if (ret < 0)
> +               return ret;
> +
> +       mutex_lock(&inst->lock);
> +
> +       if (!vb2_is_streaming(&m2m_ctx->cap_q_ctx.q) ||
> +           !vb2_is_streaming(&m2m_ctx->out_q_ctx.q))
> +               goto unlock;
> +
> +       if (m2m_ctx->is_draining) {
> +               ret = -EBUSY;
> +               goto unlock;
> +       }
> +
> +       if (ec->cmd == V4L2_ENC_CMD_STOP) {
> +               if (v4l2_m2m_has_stopped(m2m_ctx)) {
> +                       ret = 0;
> +                       goto unlock;
> +               }
> +
> +               m2m_ctx->is_draining = true;
> +
> +               fdata.buffer_type = HFI_BUFFER_INPUT;
> +               fdata.flags |= HFI_BUFFERFLAG_EOS;
> +               fdata.device_addr = 0;
> +               fdata.clnt_data = (u32)-1;
> +
> +               ret = hfi_session_process_buf(inst, &fdata);
> +               if (ret)
> +                       goto unlock;
> +       }
> +
> +       if (ec->cmd == V4L2_ENC_CMD_START && v4l2_m2m_has_stopped(m2m_ctx)) {
> +               vb2_clear_last_buffer_dequeued(&m2m_ctx->cap_q_ctx.q);
> +               inst->m2m_ctx->has_stopped = false;
> +               venus_helper_process_initial_out_bufs(inst);
> +               venus_helper_process_initial_cap_bufs(inst);
> +       }
> +
> +unlock:
> +       mutex_unlock(&inst->lock);
> +       return ret;
> +}
> +
>  static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>         .vidioc_querycap = venc_querycap,
>         .vidioc_enum_fmt_vid_cap = venc_enum_fmt,
> @@ -534,6 +587,8 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>         .vidioc_enum_frameintervals = venc_enum_frameintervals,
>         .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +       .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
> +       .vidioc_encoder_cmd = venc_encoder_cmd,
>  };
>
>  static int venc_set_properties(struct venus_inst *inst)
> @@ -946,9 +1001,22 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>  {
>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>
>         mutex_lock(&inst->lock);
> -       venus_helper_vb2_buf_queue(vb);
> +
> +       v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> +
> +       if (!(inst->streamon_out && inst->streamon_cap))
> +               goto unlock;
> +
> +       if (v4l2_m2m_has_stopped(m2m_ctx))
> +               goto unlock;
> +
> +       venus_helper_process_buf(vb);
> +
> +unlock:
>         mutex_unlock(&inst->lock);
>  }
>
> @@ -968,6 +1036,7 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
>         struct vb2_v4l2_buffer *vbuf;
>         struct vb2_buffer *vb;
>         unsigned int type;
> +       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>
>         if (buf_type == HFI_BUFFER_INPUT)
>                 type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> @@ -986,6 +1055,12 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
>                 vb->planes[0].data_offset = data_offset;
>                 vb->timestamp = timestamp_us * NSEC_PER_USEC;
>                 vbuf->sequence = inst->sequence_cap++;
> +
> +               if ((!bytesused && m2m_ctx->is_draining) ||
> +                   (vbuf->flags & V4L2_BUF_FLAG_LAST)) {
> +                       vbuf->flags |= V4L2_BUF_FLAG_LAST;
> +                       v4l2_m2m_mark_stopped(inst->m2m_ctx);
> +               }
>         } else {
>                 vbuf->sequence = inst->sequence_out++;
>         }
> --
> 2.17.1
>

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
