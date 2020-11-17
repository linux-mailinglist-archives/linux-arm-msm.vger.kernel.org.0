Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C002B6E22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 20:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgKQTKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 14:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgKQTKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 14:10:16 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711AFC0613CF;
        Tue, 17 Nov 2020 11:10:15 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id 11so21732631qkd.5;
        Tue, 17 Nov 2020 11:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TsBR4O6UFEDrBC3QEJ/nwbEoFCyB4eIoHpr56aXTsfk=;
        b=GsvzR040TtBZt1H2pzpGYgQK2JtDqfB170AbwaLlW+/0pGI3hATIsEF7HnogecNQLH
         +w7b4JBP8pifT4qUqvSzWRSQE7a1TeaLhUnQyih5MWdQSXh+FzDExXiUctair2ei64S4
         6eidSqCulIZZozacI6mRr1tOyllLWR1LxGw9Lbe7zkrvpSaLo1oOtSpPLlcSxAv30sSz
         XL+0ZR9icp+zW2LnEYGnGP3TxHZymPBZqDHy6ww7YglssMgENMT5kCaWf9vyqs48QhEW
         HUgyi2NrsNSEHo6/w0Oex63MiWwexSO/C89mOPaO3cGb7trZZGcP5V5zU9Qw8NGu96R5
         DZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TsBR4O6UFEDrBC3QEJ/nwbEoFCyB4eIoHpr56aXTsfk=;
        b=DGqNybK09UPzh64q6XwogbMq2TQ6UT7Y+Tkb5IQOyMXgqnJCRBu/L+/kqEhIkpXSwF
         Q19u/Hn90piGgNPxiEE7FOvdxmmBUU3DERBgJ5rwmyUUrDr8Ge+/wxeE+35tZfT1gmlY
         gUSAM15WFMBgIYQR2oowbGdjoDvzHRfnwWfJjyVqsFVx89ixEnCEGkZcHpW9QFp9Oz9Z
         y05jy95O+Qt0PsKKPvp43Z243yMdwxUKZGV8DOgx2I4AHcyEXr7NVDvHathxHPMOZIMs
         53WzgK/+Og8BbNvpgO8ae6wWpTx5snX9TVGi6WXC+Hszfxd/P596S9n3ni8qNBK4K9oI
         Sjww==
X-Gm-Message-State: AOAM530x5ZGr1tKCXKyPRJRsw2gjQntacHOSE6VRrHONFBxW+BatC1QS
        4SrlKYU3kSVWa0IDphuuHKoUwPUC7xsfJHlwmcU=
X-Google-Smtp-Source: ABdhPJzr9HEwhoFCr9J6s5kAvFafaPoiG6qZ5glXIl+9IjEDCsUFwc4mr85AqIDxG83t8w6FX2QhVHKw3Z9NyBWqxxU=
X-Received: by 2002:a37:5156:: with SMTP id f83mr1061398qkb.197.1605640214468;
 Tue, 17 Nov 2020 11:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20201116174112.1833368-1-lee.jones@linaro.org> <20201116174112.1833368-18-lee.jones@linaro.org>
In-Reply-To: <20201116174112.1833368-18-lee.jones@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 17 Nov 2020 11:12:01 -0800
Message-ID: <CAF6AEGs-6vYd1ytMToPfC+sd8yVuAptMGhFSXA9LG+L1X5HwhQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 17/42] drm/msm/disp/mdp5/mdp5_ctl: Demote
 non-conformant kernel-doc headers
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 16, 2020 at 9:41 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Very little attempt has been made to document these functions.
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Thanks, this one I'll try to replace with actual doc fixes, but I'll
pick up the rest (and possibly this one if I run out of time) in
msm-next for v5.11 as soon as I switch back to my kernel hat (next day
or two)

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> index 030279d7b64b7..b5c40f9773629 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> @@ -213,10 +213,10 @@ static void send_start_signal(struct mdp5_ctl *ctl)
>         spin_unlock_irqrestore(&ctl->hw_lock, flags);
>  }
>
> -/**
> +/*
>   * mdp5_ctl_set_encoder_state() - set the encoder state
>   *
> - * @enable: true, when encoder is ready for data streaming; false, otherwise.
> + * @enabled: true, when encoder is ready for data streaming; false, otherwise.
>   *
>   * Note:
>   * This encoder state is needed to trigger START signal (data path kickoff).
> @@ -507,7 +507,7 @@ static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
>         }
>  }
>
> -/**
> +/*
>   * mdp5_ctl_commit() - Register Flush
>   *
>   * The flush register is used to indicate several registers are all
> --
> 2.25.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
