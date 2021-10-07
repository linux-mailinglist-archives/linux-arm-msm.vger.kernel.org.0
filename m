Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84968425B19
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 20:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243768AbhJGSrw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 14:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243761AbhJGSrv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 14:47:51 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39C4C061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 11:45:57 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id g125so3569563oif.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rDadMTPT7yyY7zuLSmBvIb9W4n6qJgK6CHOiJKi6wrU=;
        b=dGQk+EoGS93Xn4qHMUWC9fqgM3FVdBsK9PkC29RD2iUQAxVVP7KAoVKjv54fxqJkzN
         KJ6XZoKXFqaMjVMMXW/jvz+J9W1IqQ5VApJlrWQkwHn6KQ7MsGCQAvRSpkg4qcWbAKMa
         rUz68kF/gjv8BKru2E0qaN98F2fgjgIEGBS7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rDadMTPT7yyY7zuLSmBvIb9W4n6qJgK6CHOiJKi6wrU=;
        b=jurV5kE+Xsu5p6JvzJCmk4S2wFLfG8jH7HVlUsgyhjrytq4LJGn+JdenEnuqQjXtDH
         YiY1mezF3rbDQ8hyIEcy7Gla3PKa1G1hN2zfB3iMaWMp4i7qRQFC5aXnxo00AhRMTjlg
         MDYNqnBvE6eKP/93mC+gXdd5DiKelWS92lCHpJuKSYUHYqroztSbty+7/9LctD8Wb7/3
         S6D95+hccGuHZJILFeB0IMbTtaq0XzJDOGRdVwSQCkWAM4NMpZw7e8DbjTr3kMaF3SAY
         g1KlZp6kKQcbPlT/xWB48kcJHiL/50fETRKYh9R7AQsCM9+LB/aYtGlYrlmUXxoyYfNQ
         wCuA==
X-Gm-Message-State: AOAM533wID13ISwypMWhHZy9Ztxjhdckdz0613J3+LLBCyi4tbupONen
        kgBdi/7gYejYF5pH0fCLENBxllV0k9oqurwElE+bvQ==
X-Google-Smtp-Source: ABdhPJxBJsyd0RzB+el+45iuDcFtlkQElBx3yXG2b/lZ0Xu1oExh/Yl03jChEI82FDGbQZVvKT7JtH8AKdJBrny2ByM=
X-Received: by 2002:a05:6808:f8f:: with SMTP id o15mr12980586oiw.164.1633632357140;
 Thu, 07 Oct 2021 11:45:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:45:56 -0400
MIME-Version: 1.0
In-Reply-To: <20211007183341.3140281-1-bjorn.andersson@linaro.org>
References: <20211007183341.3140281-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 14:45:56 -0400
Message-ID: <CAE-0n53LwqpTyxrRwwEiJQVpKgS4QVNuQFz8WD1VfR=s4eHWoA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Simplify the dp_debug debugfs show function
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-07 11:33:41)
> The "dp_debug" show function allocates a buffer and piecemeal appends
> line by line, checking for buffer overflows etc.
>
> Migrate the function to seq_file, to remove all the extra book keeping
> and simplify the function.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Thanks

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dp/dp_debug.c | 161 +++++-------------------------
>  1 file changed, 24 insertions(+), 137 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f6247e80e9d..566037942343 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> -static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
> -               size_t count, loff_t *ppos)
> -{
> -       struct dp_debug_private *debug = file->private_data;
> -       char *buf;
> -       u32 len = 0, rc = 0;
> +       struct dp_debug_private *debug = seq->private;

const?

>         u64 lclk = 0;
