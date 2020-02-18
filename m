Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDAC5162F93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 20:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgBRTOl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 14:14:41 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:43542 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgBRTOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 14:14:41 -0500
Received: by mail-yb1-f194.google.com with SMTP id b141so11025609ybg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1qbRzATD5sutq255fFLobWusPpsD5IFD+RDlh/TSP+8=;
        b=fiWhYhgk4RtwbMq3KgO6gqJ2qrLgUGu7m+wU2iXAKzo20Rhwm6g1Op9pLPveUsreKx
         Oe2ojtXrLbpSbzVGc5Olv1G81NlmsoBWaM+WODjhQ6m1UvLufgf9Sf6SVXIU35fbYKVo
         MWwY3KEfyoPgIxosNupieMeUQtcwzsSWFffNzW0MpiTJEIeD4uYJ17s0bZOCijRKsVR0
         zQipaWpECsphgF2VH1q/5M7tLzynZsQsgr3YT2vAfNMBvzdiNT6kfg0Y3Doe/mK/h4+s
         5la2+xesRXuj/xohkDHnqPeuEY3FCb7tgNw/jlNvtkluZa12kzeKNU5MxzRXzRYIOuTP
         STqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1qbRzATD5sutq255fFLobWusPpsD5IFD+RDlh/TSP+8=;
        b=jxIJ1UNL0x0CIgvIOsN2t9WDjGpYKEc9l2b6nCKjfbLjfu/zxtIwEEAh4y7pvcgyKC
         ybg2hLpxjDKlr1In14kyAPm2zOmnjZ8fh35foogw7ptAyIMTWZjvgN+gnnf4qUuN/1SS
         Oon5duEv5rJeudPMdYOQSkF/uVvAuFbWv4rXUbtUkeZwL695M8uDwl7bn0ex5kd3X1Sd
         MP4s85PBcH7WZWp9JI91ZqjL3vy286WOKNvlL3yeQkCMYFrRNyZFT84xmne29o/mAwqQ
         t/yV+Odm5ZRq+R7l4/h+J4OpR1dKz8EsrnEW/iAqptsH1rqTkLtdSwf59e+LJYjZanPF
         TcWw==
X-Gm-Message-State: APjAAAV3gcYTYL76hShO6QLhqtAwNdA9KEw/zKmS+83oR5iSpU3n7ce4
        499z/43+kx4S5XQSL8LAjL8JMLX8TkFytqOR2yg6
X-Google-Smtp-Source: APXvYqzpS0jkMP8BPPQQdEQn15MFM3qm6i8U6VUqn84Rd/lSlr+NzyFYGes7UtJnf5ax1Li9ysJHS/H/w4nYlDEPDjE=
X-Received: by 2002:a25:d48b:: with SMTP id m133mr19705282ybf.499.1582053279851;
 Tue, 18 Feb 2020 11:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20200218184220.139656-1-jkardatzke@google.com>
In-Reply-To: <20200218184220.139656-1-jkardatzke@google.com>
From:   Jeffrey Kardatzke <jkardatzke@google.com>
Date:   Tue, 18 Feb 2020 11:14:28 -0800
Message-ID: <CA+ddPcOMpiHU=2bumCe93NzLe-uO04TnhCS+5CDDU4GyLXYCNA@mail.gmail.com>
Subject: Re: [PATCH v3] media: venus: add support for selection rectangles
To:     linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Malathi Gottam <mgottam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(again, sorry for duplicate to some people, didn't know the plain text
email rule before)
There were a few comments made when this patch was originally posted
that were not addressed.  I left the patch as it last stood, except
for removing the unused variables.

The outstanding comments were:
1. In venc_init_session, it is only using the inst->width/height
rectangles and not the inst->out_width/out_height rectangles. So there
was a question about whether the OUTUPT rectangle should be set to
out_width/out_height. I'm looking for feedback here as I'm not
familiar enough with this driver code yet.
2. We should return EBUSY if the selection rectangles are changed
after we are initialized (I will update it to do this)
3. Support for non-zero top/left parameters. I'm suspicious that the
HFI_INDEX_EXTRADATA_INPUT_CROP property is what should be used for
that, but it's not currently used anywhere. Does anybody have details
on if that's what it's for?


On Tue, Feb 18, 2020 at 10:42 AM Jeffrey Kardatzke
<jkardatzke@google.com> wrote:
>
> From: Malathi Gottam <>
>
> Handles target type crop by setting the new active rectangle
> to hardware. The new rectangle should be within YUV size.
>
> This was taken from: https://lkml.org/lkml/2018/11/9/899
>
> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 453edf966d4f..73b3181eed9a 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -479,10 +479,26 @@ venc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
>
>         switch (s->target) {
>         case V4L2_SEL_TGT_CROP:
> -               if (s->r.width != inst->out_width ||
> -                   s->r.height != inst->out_height ||
> -                   s->r.top != 0 || s->r.left != 0)
> -                       return -EINVAL;
> +               if (s->r.left != 0) {
> +                       s->r.width += s->r.left;
> +                       s->r.left = 0;
> +               }
> +
> +               if (s->r.top != 0) {
> +                       s->r.height += s->r.top;
> +                       s->r.top = 0;
> +               }
> +
> +               if (s->r.width > inst->width)
> +                       s->r.width = inst->width;
> +               else
> +                       inst->width = s->r.width;
> +
> +               if (s->r.height > inst->height)
> +                       s->r.height = inst->height;
> +               else
> +                       inst->height = s->r.height;
> +
>                 break;
>         default:
>                 return -EINVAL;
> --
> 2.25.0.265.gbab2e86ba0-goog
>
