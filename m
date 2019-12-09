Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495E61177C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 21:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfLIUwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 15:52:53 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34552 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfLIUwx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 15:52:53 -0500
Received: by mail-pg1-f193.google.com with SMTP id r11so7718619pgf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2019 12:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AvjOGQmItdmAy3vt51SLf/vsbTcB+aY7zT7fuJp4dP4=;
        b=BMWEse7d1vmm4hcRPwoeetEsOJYLiI4dgw9xLiplO0kcQPQGJTWcCySVk/dxpgEIjD
         aKuwxgkKhpRzsNinYeQ6WaeRPPQmSUj7TOmGQMOUgD+fgRMu6zW+lWsT1kEJAA8lbRZJ
         YRiyUsGtUoDgz4LdpMB563SEhOIhgoz0+7Kcc2aw6rUJp0mOgAPM5Q3WBm7i9sZsfiHW
         0sqil7OCE6YPGohvE/BdFR055EKas3ushjKPqXVqq8BjMOiavvdM0iDBkPajR8FSGpC4
         naLDsMfafXdYWwxdcVl6JR2dBsXK6xLG8XlXJaqxvUyWFtncztTKGy53J38WMbqh8i+a
         vQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AvjOGQmItdmAy3vt51SLf/vsbTcB+aY7zT7fuJp4dP4=;
        b=tQRBrXc8gwaCJTwM45uXcRmEbcShnRsqwZELmh7lR86elr+eFvEwEAM4nktao9nPXL
         OBICXlSZGzZzKEy4lA5s90d56oQkeRXsb42UB0aA6JUEzGZ3AfjDSDeMc5Vd9ENMIFLn
         +/2hYs5rtZRnNQs9iys3/dkrnN8sM1/atXEWdZnY0+7XwUf4YwCiTesQ7bAjHBEQnJoF
         3jeEiioa+lrvYMZwTI0BZGEu/cjHjbvSrmXrD4VkYc4QTNWwD4BpkOpv9pTs9X45vTbr
         T2qa+uKw7Uoi5dlUReGZ6xL4GQzLGpCG3azds1n7xO4/u4ksX1fV400O8Dx5UT6KpRvz
         mqKA==
X-Gm-Message-State: APjAAAWjR34US2wrAVlaDwU0iJm6E4nVjsvh9fG/XY4CrLwJ4yRPO/2x
        d3tUIDuizLQtXS/ONiyQN+gGFFbwiCrHv4Aa9kBUOA==
X-Google-Smtp-Source: APXvYqz8Ve5gTEe1GJWo8d+hmU7g5Xc1hhSGGDWsktmPt0CbWvIadFurW+S41A/AyyWjRjToxNxMLj9v6BgHAqXJmZU=
X-Received: by 2002:a65:590f:: with SMTP id f15mr20415804pgu.381.1575924772395;
 Mon, 09 Dec 2019 12:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20191209203230.1593-1-natechancellor@gmail.com>
In-Reply-To: <20191209203230.1593-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Dec 2019 12:52:40 -0800
Message-ID: <CAKwvOdkeCCuYDWQFHitFczFX1-R1LjWoJ2gAfLuQAqvGz0ymPg@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: mdp4: Adjust indentation in mdp4_dsi_encoder_enable
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 9, 2019 at 12:32 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c:124:3: warning:
> misleading indentation; statement is not part of the previous 'if'
> [-Wmisleading-indentation]
>          mdp4_crtc_set_config(encoder->crtc,
>          ^
> ../drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c:121:2: note:
> previous statement is here
>         if (mdp4_dsi_encoder->enabled)
>         ^
>
> This warning occurs because there is a space after the tab on this line.
> Remove it so that the indentation is consistent with the Linux kernel
> coding style and clang no longer warns.

Thanks for the cleanup. Nothing to see here, but should help us find
more interesting cases.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
(If there are other instances in drivers/gpu/drm/msm, they should be
rolled up into this commit)

>
> Fixes: 776638e73a19 ("drm/msm/dsi: Add a mdp4 encoder for DSI")
> Link: https://github.com/ClangBuiltLinux/linux/issues/792
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> index 772f0753ed38..aaf2f26f8505 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> @@ -121,7 +121,7 @@ static void mdp4_dsi_encoder_enable(struct drm_encoder *encoder)
>         if (mdp4_dsi_encoder->enabled)
>                 return;
>
> -        mdp4_crtc_set_config(encoder->crtc,
> +       mdp4_crtc_set_config(encoder->crtc,
>                         MDP4_DMA_CONFIG_PACK_ALIGN_MSB |
>                         MDP4_DMA_CONFIG_DEFLKR_EN |
>                         MDP4_DMA_CONFIG_DITHER_EN |
> --
> 2.24.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20191209203230.1593-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
