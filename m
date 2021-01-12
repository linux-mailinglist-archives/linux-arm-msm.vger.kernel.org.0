Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D222F3743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 18:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391462AbhALRer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 12:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391377AbhALRer (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 12:34:47 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1E6C061786
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 09:34:07 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id f26so2603617qka.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 09:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0jjRjcy5y5g0bN5WHaiBZUIDIdTZTHlmLz4qx2gqPo8=;
        b=V606eUVnhzjsDRWQQe/O3xvnm+xCWx24X1otDy3i8V5CB38noAZO3WLITvvGP3K7RK
         /j6CCCO/7J2+g5KEGIMzQdQYFA5vBNSAHElcQ3wm5y7Up8QmC+p9sklh7a8dZHetIM5p
         kSi7Z8MzBjTgEQ7qHrulGkfDzIXo3bW8L5E9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0jjRjcy5y5g0bN5WHaiBZUIDIdTZTHlmLz4qx2gqPo8=;
        b=NtoFXBUbuzZ+weBrnsrHiMAhcoe/CXgg8V+EOqKd8Kx+GCXfkdnutVU7eXPIIJZVLm
         dsV/DToqt/n1zLyDdd+DRE+4fgcDF7Vg4t5oBvzN6KXBUseMWQPb//K2t0B4MbODIRL/
         jYCaJjCKnMk8hMjuPKEHo7Pa3MdA8CwqvGBqfVNsw78uetjY4AQ44cSeG911icGxvAlu
         BcAYJ/4VbLy1NZ68Cmidk1NnhBbSOnnzK6+UIQ/GPLed6SW82tlr3hKEbZyMVnEN4h9L
         O73aK7j+p8XhGQA6a4jWPVoU0dvN5OgkXUnDGCPQdXSdn4vswCHnlGdk+Gw1bPb/FQ/T
         Tatg==
X-Gm-Message-State: AOAM532R2GjmSM/+l2EjhlSGslkC+SaNe8KOV77muV64l1FbzbQcnSuy
        jJpvLfGECGlBTJ56AFMPzjP+rUHSEV7pWA==
X-Google-Smtp-Source: ABdhPJwURxZ7FnJ3Ab4yf6NI8V19Aq1rZrriktqkB2VhS3FjB/uIphzkdlKPnKm3ZaXNKkEf6WDcXQ==
X-Received: by 2002:ae9:f30c:: with SMTP id p12mr415002qkg.154.1610472846057;
        Tue, 12 Jan 2021 09:34:06 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id k26sm1474512qtb.41.2021.01.12.09.34.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 09:34:05 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id y128so2869822ybf.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 09:34:04 -0800 (PST)
X-Received: by 2002:a25:f54:: with SMTP id 81mr758087ybp.76.1610472844077;
 Tue, 12 Jan 2021 09:34:04 -0800 (PST)
MIME-Version: 1.0
References: <1610090618-30070-1-git-send-email-dikshita@codeaurora.org>
In-Reply-To: <1610090618-30070-1-git-send-email-dikshita@codeaurora.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Tue, 12 Jan 2021 09:33:52 -0800
X-Gmail-Original-Message-ID: <CAMfZQbyBXt2A=yRNd7j-qTTrs8VKkciEknbCLkS+H1MEh4PisQ@mail.gmail.com>
Message-ID: <CAMfZQbyBXt2A=yRNd7j-qTTrs8VKkciEknbCLkS+H1MEh4PisQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] venus: venc: set inband mode property to FW.
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 7, 2021 at 11:26 PM Dikshita Agarwal
<dikshita@codeaurora.org> wrote:
>
> set HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER to FW
> to support inband sequence header mode.
>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>
> Changes since v2:
> - fixed Null pointer dereference (Stanimir, Fritz)
> - added set property call at correct place.
> ---
>  drivers/media/platform/qcom/venus/venc.c       | 14 ++++++++++++++
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 17 ++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3a2e449..ae21a7c 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -536,6 +536,7 @@ static int venc_set_properties(struct venus_inst *inst)
>         struct hfi_idr_period idrp;
>         struct hfi_quantization quant;
>         struct hfi_quantization_range quant_range;
> +       struct hfi_enable en;
>         u32 ptype, rate_control, bitrate;
>         u32 profile, level;
>         int ret;
> @@ -655,6 +656,19 @@ static int venc_set_properties(struct venus_inst *inst)
>         if (ret)
>                 return ret;
>
> +       if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> +           inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {

nit: declare |struct hfi_enable en| in this scope

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>

> +               ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
> +               if (ctr->header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
> +                       en.enable = 0;
> +               else
> +                       en.enable = 1;
> +
> +               ret = hfi_session_set_property(inst, ptype, &en);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         if (!ctr->bitrate_peak)
>                 bitrate *= 2;
>         else
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index cf860e6..3ce02ad 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -158,6 +158,20 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
>                 ctr->header_mode = ctrl->val;
> +               mutex_lock(&inst->lock);
> +               if (inst->streamon_out && inst->streamon_cap) {
> +                       if (ctrl->val == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
> +                               en.enable = 0;
> +                       else
> +                               en.enable = 1;
> +                       ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
> +                       ret = hfi_session_set_property(inst, ptype, &en);
> +                       if (ret) {
> +                               mutex_unlock(&inst->lock);
> +                               return ret;
> +                       }
> +               }
> +               mutex_unlock(&inst->lock);
>                 break;
>         case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
>                 break;
> @@ -289,7 +303,8 @@ int venc_ctrl_init(struct venus_inst *inst)
>         v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
>                 V4L2_CID_MPEG_VIDEO_HEADER_MODE,
>                 V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> -               1 << V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +               ~((1 << V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> +               (1 << V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME)),
>                 V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE);
>
>         v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
> --
> 2.7.4
>
