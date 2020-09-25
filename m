Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDBE2792C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 22:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgIYU4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 16:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgIYU4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 16:56:12 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785A3C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 13:56:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lo4so464008ejb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ln/na7/qnWvF6dKKBZBvNo59RWL2+7IcVO9uS/RNFZ8=;
        b=iKie1V+tvcVyQuqfE4WQdCxzYbXhY7etZPsfwaGvN/SGilfmMrqKaq+Jwde5MhVhYL
         PatFJw1D9j9NZHdM371ewnyJvHgnz0Wj019YJz6Ec/Z/Pw4BMV1bBYty2cYOf/xzuSjg
         MvuR80FHP81gG8k0tGUxeEnZkqrdjxJ8GFhFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ln/na7/qnWvF6dKKBZBvNo59RWL2+7IcVO9uS/RNFZ8=;
        b=VIhF8OssLvZYEWVAKc1WOaezB3ld3B5fZSk4t0MVVN5OdEOmgcUXsiO+KRD1JO7yuz
         jniztHcgl+NKVXPRFstuE398PWGcqVI204OOLOn8/qtWl86Q508o7eBtjSaQg7CyATtz
         U463ahAUBRknEU/Q/Fcc1621aWgM1F+QUbqh0ODH8KH9mMlfcRuvj8irIkOEv35jsjTT
         /4ODOyl9JStEWKRcPJdMHmLA8isDmjZA38Je1cplYBN73MCnRn8buKOx8UhCLkwAAn1G
         MTx8dHgUhqGxhYcIg/FSbn1IBoP4/03M10gyZhtWvNwywz1q9PehVKOZ32vYcxiJKkAp
         f+Kw==
X-Gm-Message-State: AOAM530160vDsMYuqoVqktRvXpA5WC57CRVwVpVkA2LCHmlEKWkrrzqF
        +jpS7QmAa53pJjHwg5ddDabDNp5I/RqCIw==
X-Google-Smtp-Source: ABdhPJwR0u8VaqZnzEuO36q+3WLmPKuxBCT2SjQqh5brI/DrddahKsGP77Fa/KtEFOq+rJAcoRLMiA==
X-Received: by 2002:a17:906:cf9d:: with SMTP id um29mr4578912ejb.74.1601067370855;
        Fri, 25 Sep 2020 13:56:10 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a5sm2718670edb.9.2020.09.25.13.56.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 13:56:10 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id e2so536596wme.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 13:56:09 -0700 (PDT)
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr391963wme.127.1601067369520;
 Fri, 25 Sep 2020 13:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org> <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
In-Reply-To: <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 25 Sep 2020 22:55:55 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
Message-ID: <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and G_SELECTION
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dikshita, Stanimir,

On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
<dikshita@codeaurora.org> wrote:
>
> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>
> - return correct width and height for G_SELECTION
> - if requested rectangle wxh doesn't match with capture port wxh
>   adjust the rectangle to supported wxh.
>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 7d2aaa8..a2cc12d 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>         switch (s->target) {
>         case V4L2_SEL_TGT_CROP_DEFAULT:
>         case V4L2_SEL_TGT_CROP_BOUNDS:
> -               s->r.width = inst->width;
> -               s->r.height = inst->height;
> -               break;
> -       case V4L2_SEL_TGT_CROP:
>                 s->r.width = inst->out_width;
>                 s->r.height = inst->out_height;
>                 break;
> +       case V4L2_SEL_TGT_CROP:
> +               s->r.width = inst->width;
> +               s->r.height = inst->height;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>
>         switch (s->target) {
>         case V4L2_SEL_TGT_CROP:
> -               if (s->r.width != inst->out_width ||
> -                   s->r.height != inst->out_height ||
> -                   s->r.top != 0 || s->r.left != 0)
> -                       return -EINVAL;
> +               if (s->r.width != inst->width ||
> +                   s->r.height != inst->height ||
> +                   s->r.top != 0 || s->r.left != 0) {
> +                       s->r.top = 0;
> +                       s->r.left = 0;
> +                       s->r.width = inst->width;
> +                       s->r.height = inst->height;

What's the point of exposing the selection API if no selection can
actually be done?

Best regards,
Tomasz
