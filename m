Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD3D4B1672
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 20:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344042AbiBJTg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 14:36:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344043AbiBJTgu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 14:36:50 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1504110C
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 11:36:50 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id k25so17801506ejp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 11:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ptZVq5/OACdzoIInBegUu3n6cJuM6ROH0MFWfN4fC5g=;
        b=Al1lumb+Ruq7QDmYAV8g8apKYzEOgUKvXOn2emwFsnhX+LXgtj8ehfg/7Y6wT1YbqO
         sKIJSw2bIeGaA7TlIBdnUR45BjlCt8zWpjm5EVBmcESOVF/8+jnewYuF+4Ae44kc/20k
         KKXxCAI6kHw6F2P/kOKZZu6RSYD49LFuYQnoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ptZVq5/OACdzoIInBegUu3n6cJuM6ROH0MFWfN4fC5g=;
        b=haZo6L96vYfypW6KXsgJQvJ82+8/7nzWtw/r0oeTkh6y46LBvXv28Q0kYyadnzpO97
         7kplgx2OCEMqhRtZrZkgJh+E4gCZOPfkrWtbZlCUkmW21/OSSnS2kdjZHyHkGvu6kxgX
         PsVnoIDeWdfzKgVELZL05uRARy25v6qWuFTOSTioBlW9OvSUJ4hpZ5KmV/ClhviHvhQb
         1K1BM1t36EQOfNdq0pr1tyJpxdvxJrvwYQDUHTCCqC9pe01SIlIUwUPOrtskp7UXMoyO
         xPfn1kTTsBpGZEQHCMmgKnLGtQhHd2t7OCMdiIc5ostaLvoi86xvrmN9ME3u+AQbVWA4
         UJrQ==
X-Gm-Message-State: AOAM531eKifP1QGc++ZztzTXGIGDzhQ/kVlnNrxbdCs2mHBjjXyDlDyK
        bfnZPNReob3Y87dRB3ySUoKlxl0cov4z8A==
X-Google-Smtp-Source: ABdhPJyB9cRKPdu50RE5Y8SEgeQQxKw1bn8Crvouhu3etSye5pqGOmzoyBA/92cs17wA8XHxFzXwbQ==
X-Received: by 2002:a17:907:a40c:: with SMTP id sg12mr7711373ejc.147.1644521809377;
        Thu, 10 Feb 2022 11:36:49 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id r1sm6208189ejh.52.2022.02.10.11.36.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 11:36:48 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id h6so11374518wrb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 11:36:48 -0800 (PST)
X-Received: by 2002:adf:dc08:: with SMTP id t8mr7614168wri.40.1644521808015;
 Thu, 10 Feb 2022 11:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20220208155204.630966-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20220208155204.630966-1-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Thu, 10 Feb 2022 14:36:35 -0500
X-Gmail-Original-Message-ID: <CAMfZQbw6j_ojbCur3S3D6iJ+RLbDcbE_px1ADMyE8HAuehUp_Q@mail.gmail.com>
Message-ID: <CAMfZQbw6j_ojbCur3S3D6iJ+RLbDcbE_px1ADMyE8HAuehUp_Q@mail.gmail.com>
Subject: Re: [PATCH] venus: venc: Fix h264 8x8 transform control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 8, 2022 at 10:52 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> During encoder driver open controls are initialized via a call
> to v4l2_ctrl_handler_setup which returns EINVAL error for
> V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM v4l2 control. The control
> default value is disabled and because of firmware limitations
> 8x8 transform cannot be disabled for the supported HIGH and
> CONSTRAINED_HIGH profiles.
>
> To fix the issue change the control default value to enabled
> (this is fine because the firmware enables 8x8 transform for
> high and constrained_high profiles by default). Also, correct
> the checking of profile ids in s_ctrl from hfi to v4l2 ids.
>
> Fixes: bfee75f73c37 ("media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c       | 4 ++--
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 84bafc3118cc..adea4c3b8c20 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -662,8 +662,8 @@ static int venc_set_properties(struct venus_inst *inst)
>
>                 ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>                 h264_transform.enable_type = 0;
> -               if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
> -                   ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)
> +               if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
> +                   ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>                         h264_transform.enable_type = ctr->h264_8x8_transform;
>
>                 ret = hfi_session_set_property(inst, ptype, &h264_transform);
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 1ada42df314d..ea5805e71c14 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -320,8 +320,8 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ctr->intra_refresh_period = ctrl->val;
>                 break;
>         case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
> -               if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH &&
> -                   ctr->profile.h264 != HFI_H264_PROFILE_CONSTRAINED_HIGH)
> +               if (ctr->profile.h264 != V4L2_MPEG_VIDEO_H264_PROFILE_HIGH &&
> +                   ctr->profile.h264 != V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>                         return -EINVAL;
>
>                 /*
> @@ -457,7 +457,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>                           V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
>
>         v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> -                         V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 0);
> +                         V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 1);
>
>         v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>                           V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
> --
> 2.25.1
>
Tested-by: Fritz Koenig <frkoenig@chromium.org>
Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
