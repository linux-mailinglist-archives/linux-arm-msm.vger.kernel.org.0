Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2346A2C9597
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 04:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgLADKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 22:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbgLADKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 22:10:15 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4D2C0613D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 19:09:35 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s27so1021704lfp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 19:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDVDschaWntS/kjfsZJ9z/QW9d+XVa+aVBHR0hnauGw=;
        b=fBNr0Q5OPvuxwwpF9TzfNL6A+pR2mQumhRxGCZCKfpiLtO9ON5hunyXeH9oM9iH7O0
         zCgJ+jBzM4mkTvQpr4eSGt2jAjCwxo51S/tA3NRnsXquzbypfU4nx+KP0fqFju2qu5G+
         /YjoV/XGzegWMUUOSYHi+TDndkfisTwjStUZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDVDschaWntS/kjfsZJ9z/QW9d+XVa+aVBHR0hnauGw=;
        b=Usz3wrXmUNa+JJy0rXOJ7fb1lgwhOJl0Fu0AGYfm7vVxDE8Ayi1zHCjKQ9mvYQBIoC
         nhM3Unq1mT1crYIa/ntkxSJbO/OKYT7N4zUomgOD3grPjl1eW9oj2TysIutMuj6pkTNl
         t3+FjE7U2A9On/lV28Ykjx6aKfrppe3gJ1utjMITobJBDsIEv5KdnHzkfN3TZfVc0vmB
         ux9k/djTddqdsC8RVJ47WgK7nefi0syNG+svLdXvFFo9vBbEl9waBFrSBLOxhv9Lnlkx
         sOcOE6WHiOFDYZGRmgocrwI3VkEA1O2O25GolmdUfg0dA4dR8eVCNDxvsPBQ04vw0WFe
         k+sQ==
X-Gm-Message-State: AOAM532Hao3pCPoMO/JB/jEL6zuPYuZYKuBGOTQT7XxQp4bFe8/Cmvvx
        vdNo9teamv997ecCrkyY/1gK6KXxvwyv56AW
X-Google-Smtp-Source: ABdhPJyjg4xn+CbZ9qXGEVpQr3smEMYUNjfuWhWcrmL2e6flHiFrfRrNU/dr4Yr+dCW8NKoVMdUlog==
X-Received: by 2002:ac2:4578:: with SMTP id k24mr268092lfm.502.1606792173074;
        Mon, 30 Nov 2020 19:09:33 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id f20sm50401lfk.230.2020.11.30.19.09.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 19:09:32 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id q8so286281ljc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 19:09:31 -0800 (PST)
X-Received: by 2002:a2e:8115:: with SMTP id d21mr280666ljg.379.1606792171335;
 Mon, 30 Nov 2020 19:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20201128063629.1830702-1-frkoenig@chromium.org>
In-Reply-To: <20201128063629.1830702-1-frkoenig@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 1 Dec 2020 12:09:19 +0900
X-Gmail-Original-Message-ID: <CAPBb6MX8aiZ3q1CTuHTK+68UmOzmm03ruJcHREu+XBd3jCKCbg@mail.gmail.com>
Message-ID: <CAPBb6MX8aiZ3q1CTuHTK+68UmOzmm03ruJcHREu+XBd3jCKCbg@mail.gmail.com>
Subject: Re: [PATCH] venus: vdec: Handle DRC after drain
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 28, 2020 at 3:40 PM Fritz Koenig <frkoenig@chromium.org> wrote:
>
> If the DRC is near the end of the stream the client
> may send a V4L2_DEC_CMD_STOP before the DRC occurs.
> V4L2_DEC_CMD_STOP puts the driver into the
> VENUS_DEC_STATE_DRAIN state.  DRC must be aware so
> that after the DRC event the state can be restored
> correctly.
>
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
>
> ---
>
> This is an attempt to fix the logic for when a DRC occurs
> after the driver is in VENUS_DEC_STATE_DRAIN state.  This
> works for me, but I'm not sure if I covered all the cases.
> Specifically I'm not sure if I reset |drain_active| in all
> the right places.
>
>  drivers/media/platform/qcom/venus/core.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c | 19 +++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 2b0899bf5b05f..1680c936c06fb 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -406,6 +406,7 @@ struct venus_inst {
>         unsigned int core_acquired: 1;
>         unsigned int bit_depth;
>         bool next_buf_last;
> +       bool drain_active;
>  };
>
>  #define IS_V1(core)    ((core)->res->hfi_version == HFI_VERSION_1XX)
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 5671cf3458a68..7edbefbd75210 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -523,8 +523,10 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>
>                 ret = hfi_session_process_buf(inst, &fdata);
>
> -               if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING)
> +               if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
>                         inst->codec_state = VENUS_DEC_STATE_DRAIN;
> +                       inst->drain_active = true;
> +               }
>         }
>
>  unlock:
> @@ -976,10 +978,14 @@ static int vdec_start_capture(struct venus_inst *inst)
>
>         inst->codec_state = VENUS_DEC_STATE_DECODING;
>
> +       if (inst->drain_active)
> +               inst->codec_state = VENUS_DEC_STATE_DRAIN;
> +
>         inst->streamon_cap = 1;
>         inst->sequence_cap = 0;
>         inst->reconfig = false;
>         inst->next_buf_last = false;
> +       inst->drain_active = false;
>
>         return 0;
>
> @@ -1105,6 +1111,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
>                 /* fallthrough */
>         case VENUS_DEC_STATE_DRAIN:
>                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
> +               inst->drain_active = false;
>                 /* fallthrough */
>         case VENUS_DEC_STATE_SEEK:
>                 vdec_cancel_dst_buffers(inst);
> @@ -1304,8 +1311,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>
>                         v4l2_event_queue_fh(&inst->fh, &ev);
>
> -                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN) {
> +                               inst->drain_active = false;
>                                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
> +                       }
>                 }
>
>                 if (!bytesused)
> @@ -1429,11 +1438,17 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
>         case EVT_SYS_EVENT_CHANGE:
>                 switch (data->event_type) {
>                 case HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES:
> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +                               inst->codec_state = VENUS_DEC_STATE_DECODING;
>                         vdec_event_change(inst, data, true);
>                         break;
>                 case HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES:
> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +                               inst->codec_state = VENUS_DEC_STATE_DECODING;
>                         vdec_event_change(inst, data, false);
>                         break;
> +               // TODO(fritz) : does HFI_EVENT_RELEASE_BUFFER_REFERENCE also need to
> +               // change the codec_state to VENUS_DEC_STATE_DECODING?

I don't think it does, but Stanimir can confirm probably. In any case
we should remove this TODO in the next version. :)

>                 case HFI_EVENT_RELEASE_BUFFER_REFERENCE:
>                         venus_helper_release_buf_ref(inst, data->tag);
>                         break;
> --
> 2.29.2.454.gaff20da3a2-goog
>
