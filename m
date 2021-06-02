Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1AB3991D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 19:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhFBRnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 13:43:39 -0400
Received: from mail-qv1-f43.google.com ([209.85.219.43]:35496 "EHLO
        mail-qv1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhFBRni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 13:43:38 -0400
Received: by mail-qv1-f43.google.com with SMTP id q6so1754611qvb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xIhlm0z92BPitmZROEU2uJFBNk6dpYZfF4F1FaBapYY=;
        b=iO9qLXISBAbTfSsVm9LIh6Uibc23JdxGag8P6gnfMxtnuEWCSdlywf3+wsmbyhgL7S
         lG3V+i1Ma56WktVeOP43G1WfXkeHVlo0AW2mRU2lwfZJ6+QPxhtLNkAigOcqi1lVBHdg
         gZVZ7sRKLQFdphFpHnI3NSdpG78o5ZvrvpJt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xIhlm0z92BPitmZROEU2uJFBNk6dpYZfF4F1FaBapYY=;
        b=RanAACuDzAMKafaDWQyd5G5ApqRM1CRY621qCEtzEH8i239Pb500JhNOsDeeCUe6OZ
         8Lx+rLF7Yd/2p+YuRaeL91AOazNpK5Vw9MYtwUVTMBok4RMUrYOaPCWUsIB5vxjJ0sDe
         CSLWlZ0WEPa4NgZ85JpRrPCupvhszbKyl9yoZ96Tuua2YuPNsdbYnRJwOew8PRH/00Z0
         oN3XrH7iXcIdJth2JCWFQW6xp7CtwI+9CZ/+vhgLfny8xAcwUBN8f76Yjdt0nSsFySgm
         OE12rfDjU3ux+CX4a9iawh+gZ/gFHGw+dSo5PBn0S0ygY4hhmd1g/NsxDzKAN3CnV6dB
         kiYw==
X-Gm-Message-State: AOAM5330AkoUfp+jiOIcyX/R1aC2mkEJ3J83h5yQd9FfFvO/fVpbWlPK
        QK/VZO2UfYAZxVbYq/+FXffhybFE/wVGUQ==
X-Google-Smtp-Source: ABdhPJxINyv5ITNciE61scnCdtp5gme/FQSh849Bn9BsWtd/8NEsjnWKvsbiQMlQ04rER8DWMlgXtg==
X-Received: by 2002:ad4:4147:: with SMTP id z7mr29971751qvp.61.1622655654563;
        Wed, 02 Jun 2021 10:40:54 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id e19sm235065qtr.45.2021.06.02.10.40.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 10:40:54 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id b13so4968911ybk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 10:40:53 -0700 (PDT)
X-Received: by 2002:a25:b74d:: with SMTP id e13mr47171878ybm.372.1622655653411;
 Wed, 02 Jun 2021 10:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <1622438514-16657-1-git-send-email-mansur@codeaurora.org>
In-Reply-To: <1622438514-16657-1-git-send-email-mansur@codeaurora.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Wed, 2 Jun 2021 10:40:41 -0700
X-Gmail-Original-Message-ID: <CAMfZQbyHN14OXVH4x8SsXD0My1QzdHocMLoi++pfCTk-XbABxg@mail.gmail.com>
Message-ID: <CAMfZQbyHN14OXVH4x8SsXD0My1QzdHocMLoi++pfCTk-XbABxg@mail.gmail.com>
Subject: Re: [PATCH] venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM
 control
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 30, 2021 at 10:22 PM Mansur Alisha Shaik
<mansur@codeaurora.org> wrote:
>
> Add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control for
> H264 high profile and constrained high profile.
>
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h       |  1 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c   | 10 ++++++++++
>  drivers/media/platform/qcom/venus/hfi_helper.h |  5 +++++
>  drivers/media/platform/qcom/venus/venc.c       | 11 +++++++++++
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 12 +++++++++++-
>  5 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 745f226..103fbd8 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -235,6 +235,7 @@ struct venc_controls {
>         u32 h264_loop_filter_mode;
>         s32 h264_loop_filter_alpha;
>         s32 h264_loop_filter_beta;
> +       u32 h264_8x8_transform;
>
>         u32 hevc_i_qp;
>         u32 hevc_p_qp;
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 11a8347..61d04a5 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -1178,6 +1178,7 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
>  {
>         void *prop_data;
>
> +
>         if (!pkt || !cookie || !pdata)
>                 return -EINVAL;
>
> @@ -1227,6 +1228,15 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
>                 break;
>         }
>
> +       case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8: {
> +               struct hfi_h264_8x8x_transform *in = pdata, *tm = prop_data;
> +
> +               tm->enable_type = in->enable_type;
> +               pkt->shdr.hdr.size += sizeof(u32) + sizeof(*tm);
> +               break;
> +
> +       }
> +
>         case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
>         case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
>         case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 63cd347..81d0536 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -510,6 +510,7 @@
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES               0x2005020
>  #define HFI_PROPERTY_PARAM_VENC_H264_VUI_BITSTREAM_RESTRC      0x2005021
>  #define HFI_PROPERTY_PARAM_VENC_PRESERVE_TEXT_QUALITY          0x2005023
> +#define HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8                     0x2005025
>  #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER       0x2005026
>  #define HFI_PROPERTY_PARAM_VENC_DISABLE_RC_TIMESTAMP           0x2005027
>  #define HFI_PROPERTY_PARAM_VENC_INITIAL_QP                     0x2005028
> @@ -565,6 +566,10 @@ struct hfi_bitrate {
>         u32 layer_id;
>  };
>
> +struct hfi_h264_8x8x_transform {
> +       u32 enable_type;
> +};
> +
>  #define HFI_CAPABILITY_FRAME_WIDTH                     0x01
>  #define HFI_CAPABILITY_FRAME_HEIGHT                    0x02
>  #define HFI_CAPABILITY_MBS_PER_FRAME                   0x03
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 8dd49d4..4ecf331 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -567,6 +567,7 @@ static int venc_set_properties(struct venus_inst *inst)
>                 struct hfi_h264_vui_timing_info info;
>                 struct hfi_h264_entropy_control entropy;
>                 struct hfi_h264_db_control deblock;
> +               struct hfi_h264_8x8x_transform h264_transform;
>
>                 ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
>                 info.enable = 1;
> @@ -597,6 +598,16 @@ static int venc_set_properties(struct venus_inst *inst)
>                 ret = hfi_session_set_property(inst, ptype, &deblock);
>                 if (ret)
>                         return ret;
> +
> +               ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> +               if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
> +                       ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)
> +                       h264_transform.enable_type = ctr->h264_8x8_transform;
> +
> +               ret = hfi_session_set_property(inst, ptype, &h264_transform);
> +               if (ret)
> +                       return ret;
> +
>         }
>
>         if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 637c92f..e3ef611 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -319,6 +319,13 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>                 ctr->mastering = *ctrl->p_new.p_hdr10_mastering;
>                 break;
> +       case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
> +               if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH ||
> +                       ctr->profile.h264 != HFI_H264_PROFILE_CONSTRAINED_HIGH)

This appears to be incorrect as the comparison will always be true.  I
think it should be written as:
               if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
                       ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)
                       ctr->h264_8x8_transform = ctrl->val;

> +                       return -EINVAL;

I'm not sure -EINVAL is appropriate here.  venc_op_s_ctrl will be
called to initialize the default control values from
v4l2_ctrl_handler_setup.  If the default profile isn't high or
constrained high, the driver will fail to initialize.

> +
> +               ctr->h264_8x8_transform = ctrl->val;
> +               break;
>
>         default:
>                 return -EINVAL;
>         }
> @@ -334,7 +341,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>  {
>         int ret;
>
> -       ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 57);
> +       ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 58);
>         if (ret)
>                 return ret;
>
> @@ -438,6 +445,9 @@ int venc_ctrl_init(struct venus_inst *inst)
>                           V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
>
>         v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +               V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 0);
> +
> +       v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>                           V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
>
>         v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
