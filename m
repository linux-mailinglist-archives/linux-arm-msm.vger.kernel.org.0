Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580B738941C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 18:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355410AbhESQwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 12:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355411AbhESQwx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 12:52:53 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1ABC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 09:51:32 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id a2so13351955qkh.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVSvKu+uF44UhP5igvEj8imLggEUIgId1rVB9sDvdoc=;
        b=VVV4obMZk/I97g6wXYoHuI42S/L6dNximTaEXL7kvSJxnHL1s55v9BgtUGcDq78Qyg
         hhXwLlw9i1HfzGYRrJ8iZQ3gI4b+uNq3Ku9gwylNuLQztXeG7Vwy0LHTBPGmonKI1Z2+
         qLT/kEwSPxGCTtpL4ZZ0liITxb5ZC4dBTlVxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVSvKu+uF44UhP5igvEj8imLggEUIgId1rVB9sDvdoc=;
        b=XSh3QP+yWKrFouJ16qOTyLrL/C274PHMlI9VWwMQU/r4G1ducY8MWUDWaQMTVqu/Kh
         KsZkDtLDXEPmolH5FfxhTp/QwXjEA5pLs+2Dobx6JQoi1WOD5aBZIsXTgCM/do9LbhTX
         LOcE2z6Zgt507CYGJIxf7EMvBL5qTVQsLBFfA7H29yGVmQ7xO6SsVeogN7r/Yy29eJ57
         Rg9qTj/BjasrsIFrUIl5yh0slViJa5H31p6VnY2zWt68h/Plz2bjuP5trg1rBjGyLqYq
         6f+YjMl27c7+Q4VjZBMjvegiYcGEI758Id1BeHD4jRZGR9axbXJULVf/HMDtn2e/FsfR
         0FNw==
X-Gm-Message-State: AOAM530LY58z+Qpej33Hjw4hnwpLQ1rT0WaA29JTlONVfrPdX2sURE6m
        Cj9gebMhbl/NIEUfraFIlOd1/wJA/6BwHw==
X-Google-Smtp-Source: ABdhPJzpdTOlWN0KI8jlcrtFtMbGZ/8LwmMUF4782lwAEdhfEOkScSKWVflrWtNMeZRK2Y8doV1N2A==
X-Received: by 2002:a05:620a:22f3:: with SMTP id p19mr252562qki.281.1621443091701;
        Wed, 19 May 2021 09:51:31 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id g18sm162701qke.37.2021.05.19.09.51.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 09:51:31 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id r8so18945776ybb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 09:51:31 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr636416ybp.476.1621443090636;
 Wed, 19 May 2021 09:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210518154509.602137-1-stanimir.varbanov@linaro.org> <20210518154509.602137-2-stanimir.varbanov@linaro.org>
In-Reply-To: <20210518154509.602137-2-stanimir.varbanov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 19 May 2021 09:51:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJZ3=YMcqFLeoXnYh6=fPDzAe_4yAxehSafLGOC31ogQ@mail.gmail.com>
Message-ID: <CAD=FV=WJZ3=YMcqFLeoXnYh6=fPDzAe_4yAxehSafLGOC31ogQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] venus: venc: Use pmruntime autosuspend
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 18, 2021 at 8:46 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Migrate encoder to use pm-runtime autosuspend APIs.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 104 +++++++++++++++++++++--
>  1 file changed, 96 insertions(+), 8 deletions(-)

Not a full review but I happened to skim by this patch and it caught
my attention...


> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 4a7291f934b6..a7a858f03ba3 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -536,6 +536,64 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>  };
>
> +static int venc_pm_get(struct venus_inst *inst)
> +{
> +       struct venus_core *core = inst->core;
> +       struct device *dev = core->dev_enc;
> +       int ret;
> +
> +       mutex_lock(&core->pm_lock);
> +       ret = pm_runtime_get_sync(dev);
> +       mutex_unlock(&core->pm_lock);

Why do you need a mutex around this?

> +
> +       return ret < 0 ? ret : 0;

Odd but true: if pm_runtime_get_sync() returns an error you still need
to put. If your code below isn't going to do this then you should
handle it here?

> +}
> +
> +static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
> +{
> +       struct venus_core *core = inst->core;
> +       struct device *dev = core->dev_enc;
> +       int ret;
> +
> +       mutex_lock(&core->pm_lock);
> +
> +       if (autosuspend)
> +               ret = pm_runtime_put_autosuspend(dev);
> +       else
> +               ret = pm_runtime_put_sync(dev);
> +
> +       mutex_unlock(&core->pm_lock);
> +
> +       return ret < 0 ? ret : 0;
> +}
> +
> +static int venc_pm_get_put(struct venus_inst *inst)
> +{
> +       struct venus_core *core = inst->core;
> +       struct device *dev = core->dev_enc;
> +       int ret = 0;
> +
> +       mutex_lock(&core->pm_lock);
> +
> +       if (pm_runtime_suspended(dev)) {
> +               ret = pm_runtime_get_sync(dev);
> +               if (ret < 0)
> +                       goto error;

If pm_runtime_get_sync() returns an error you still need to put.


> +
> +               ret = pm_runtime_put_autosuspend(dev);
> +       }
> +
> +error:
> +       mutex_unlock(&core->pm_lock);
> +
> +       return ret < 0 ? ret : 0;
> +}

What is the purpose of "get_put"? It feels like using it would be racy to me.


> +
> +static void venc_pm_touch(struct venus_inst *inst)
> +{
> +       pm_runtime_mark_last_busy(inst->core->dev_enc);
> +}
> +
>  static int venc_set_properties(struct venus_inst *inst)
>  {
>         struct venc_controls *ctr = &inst->controls.enc;
> @@ -891,10 +949,18 @@ static int venc_queue_setup(struct vb2_queue *q,
>                 return 0;
>         }
>
> +       ret = venc_pm_get(inst);
> +       if (ret)
> +               return ret;
> +
>         mutex_lock(&inst->lock);
>         ret = venc_init_session(inst);
>         mutex_unlock(&inst->lock);
>
> +       if (ret)
> +               goto put_power;
> +
> +       ret = venc_pm_put(inst, false);
>         if (ret)
>                 return ret;
>
> @@ -930,6 +996,9 @@ static int venc_queue_setup(struct vb2_queue *q,
>                 break;
>         }
>
> +       return ret;
> +put_power:
> +       venc_pm_put(inst, false);
>         return ret;
>  }
>
> @@ -946,6 +1015,8 @@ static void venc_release_session(struct venus_inst *inst)
>  {
>         int ret;
>
> +       venc_pm_get(inst);
> +
>         mutex_lock(&inst->lock);
>
>         ret = hfi_session_deinit(inst);
> @@ -957,6 +1028,8 @@ static void venc_release_session(struct venus_inst *inst)
>         venus_pm_load_scale(inst);
>         INIT_LIST_HEAD(&inst->registeredbufs);
>         venus_pm_release_core(inst);
> +
> +       venc_pm_put(inst, false);
>  }
>
>  static void venc_buf_cleanup(struct vb2_buffer *vb)
> @@ -1026,7 +1099,15 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>         inst->sequence_cap = 0;
>         inst->sequence_out = 0;
>
> +       ret = venc_pm_get(inst);
> +       if (ret)
> +               goto error;
> +
>         ret = venus_pm_acquire_core(inst);
> +       if (ret)
> +               goto put_power;
> +
> +       ret = venc_pm_put(inst, true);
>         if (ret)
>                 goto error;
>
> @@ -1051,6 +1132,8 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>
>         return 0;
>
> +put_power:
> +       venc_pm_put(inst, false);
>  error:
>         venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
>         if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -1065,6 +1148,8 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>  {
>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>
> +       venc_pm_get_put(inst);
> +

I don't know this code at all, but I don't understand the point of the
"get_put". Couldn't the task running this code get scheduled out for 2
seconds right after your call to venc_pm_get_put() and then it would
be just like you didn't call it?

...or maybe the device wasn't suspended but it was 10 us away from
being suspended so your "get_put" decided it didn't need to do
anything. Then you get scheduled out for 10 us and it powers off.

Maybe there's a good reason for get_put() to exist and a good reason
why it's race-free but it feels like the kind of thing that needs a
comment.


>         mutex_lock(&inst->lock);
>         venus_helper_vb2_buf_queue(vb);
>         mutex_unlock(&inst->lock);
> @@ -1088,6 +1173,8 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
>         struct vb2_buffer *vb;
>         unsigned int type;
>
> +       venc_pm_touch(inst);
> +
>         if (buf_type == HFI_BUFFER_INPUT)
>                 type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>         else
> @@ -1117,6 +1204,8 @@ static void venc_event_notify(struct venus_inst *inst, u32 event,
>  {
>         struct device *dev = inst->core->dev_enc;
>
> +       venc_pm_touch(inst);
> +
>         if (event == EVT_SESSION_ERROR) {
>                 inst->session_error = true;
>                 dev_err(dev, "enc: event session error %x\n", inst->error);
> @@ -1205,13 +1294,9 @@ static int venc_open(struct file *file)
>
>         venus_helper_init_instance(inst);
>
> -       ret = pm_runtime_get_sync(core->dev_enc);
> -       if (ret < 0)
> -               goto err_put_sync;
> -
>         ret = venc_ctrl_init(inst);
>         if (ret)
> -               goto err_put_sync;
> +               goto err_free;
>
>         ret = hfi_session_create(inst, &venc_hfi_ops);
>         if (ret)
> @@ -1250,8 +1335,7 @@ static int venc_open(struct file *file)
>         hfi_session_destroy(inst);
>  err_ctrl_deinit:
>         venc_ctrl_deinit(inst);
> -err_put_sync:
> -       pm_runtime_put_sync(core->dev_enc);
> +err_free:
>         kfree(inst);
>         return ret;
>  }
> @@ -1260,6 +1344,8 @@ static int venc_close(struct file *file)
>  {
>         struct venus_inst *inst = to_inst(file);
>
> +       venc_pm_get(inst);
> +
>         v4l2_m2m_ctx_release(inst->m2m_ctx);
>         v4l2_m2m_release(inst->m2m_dev);
>         venc_ctrl_deinit(inst);
> @@ -1268,7 +1354,7 @@ static int venc_close(struct file *file)
>         v4l2_fh_del(&inst->fh);
>         v4l2_fh_exit(&inst->fh);
>
> -       pm_runtime_put_sync(inst->core->dev_enc);
> +       venc_pm_put(inst, false);
>
>         kfree(inst);
>         return 0;
> @@ -1325,6 +1411,8 @@ static int venc_probe(struct platform_device *pdev)
>         core->dev_enc = dev;
>
>         video_set_drvdata(vdev, core);
> +       pm_runtime_set_autosuspend_delay(dev, 2000);
> +       pm_runtime_use_autosuspend(dev);
>         pm_runtime_enable(dev);

You have the same bug that I just made in another module! :-P
Specifically, the pm_runtime docs say:

> Drivers in ->remove() callback should undo the runtime PM changes done
> in ->probe(). Usually this means calling pm_runtime_disable(),
> pm_runtime_dont_use_autosuspend() etc.

-Doug
