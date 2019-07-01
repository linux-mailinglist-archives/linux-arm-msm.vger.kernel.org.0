Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284965C3FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 21:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfGATzX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 15:55:23 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38547 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfGATzX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 15:55:23 -0400
Received: by mail-ed1-f65.google.com with SMTP id r12so24974958edo.5;
        Mon, 01 Jul 2019 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aDvBdz4CIhUwGc+WxUTMAssQu59DUKrshXV4PJF0Vqo=;
        b=U9nn1Kg5IOugwawL1Z7TRIycorfaFuo8YkKcLYXI8vSjK0RBsXQUXEaWn2POhWqroI
         5ba+6tR7izhRX8RE1nPTzlKMBGmcSGLyLzTDZneyOzk9wJNv04HC1Jv0jYtZTh8m0Eg1
         wbbYzRLKsxGX56VZhlzAKMJSw3SpqR3dzl0pBWNeGtohgc+g8lMql84ZmlSYTdq9OhQi
         seQQbAmYn0XgUX64pl2k7tGpBtPQwT08SMkLZm5SjcIRLk6qlXKFFulJqrF38P7xywlG
         e3JFe8zOpwYgr8EtnvmVuMs0P6U/pcNbv6WBtfdzQW/eKUKqDyva8Zb91ru3ewVtFPxC
         sEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aDvBdz4CIhUwGc+WxUTMAssQu59DUKrshXV4PJF0Vqo=;
        b=Q1GrPdmx+n2JTQrqevsA5UKBCh7VrbYjeRkEb5DL0GlsguaUQqiujWTS0wkFAYTY1H
         3R+QjrUQuMg9dt2qa6gfPehAVmgfIeVMVMntkYZp4mC16jpwhGV0s4RvWkkVmWOVDodo
         7aMC6e4My7/jRN8Y9uGrchivzxCX0pIvu139tjirYy5EshfIYW2eGqBPmuQwa+sbV93f
         +U8QtJkrmmAped6ie/D/VAFDkapU70oOA6YzVDzhYhzrIM+0Ym9pnI5AxS3D6Wl0ZkZq
         MAAZuCjQPdj7Kk5RcUaLrZ49ug+D5TTFhCmKO5ciABzgNbUziuLurjnUfRWula9IiJ3o
         769g==
X-Gm-Message-State: APjAAAX4V+ZYGeC3W5SfeOaA20IhZVXuvwi6l0GeF4K1SPmbEplN7SpJ
        zmYcZP5gqbuvAMTv41WTei6+SCsGGJD4350qXE4=
X-Google-Smtp-Source: APXvYqxRkskgrX6ttwwTzfZWxYIUz7bV7uQgkLArcijalzyyJWLD/+AWOAPLPdaO2F7CFX7FQozjAXt7BLsZ79S0Xj8=
X-Received: by 2002:a50:9468:: with SMTP id q37mr31076816eda.163.1562010921237;
 Mon, 01 Jul 2019 12:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190701174120.15551-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190701174120.15551-1-jeffrey.l.hugo@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 1 Jul 2019 12:55:05 -0700
Message-ID: <CAF6AEGsGRcuk3xnWG8KspW4wzG38o-Xg8tybnND9Lb24PWP5dw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use eariler mixers when possible
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 1, 2019 at 10:41 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> When assigning a mixer, we will iterate through the entire list looking for
> a suitable match.  This results in selecting the last match.  We should
> stop at the first match, since lower numbered mixers will typically have
> more capabilities, and are likely to be what the bootloader used, if we
> are looking to reuse the bootloader config in future.

I think for matching bootloader config, we need to read it out of the
hw and do it the hard way, rather than making assumptions.

For picking hwpipe for a plane, I made an effort to pick the available
hwpipe w/ the *least* capabilities that fit the requirements (ie.
scaling/yuv/etc) in order to leave the more capable hwpipe available
for future use.  Not sure if same approach would make sense for
mixers?  But not sure if picking something that bootloader probably
also would have picked is a great argument.

I do have some (now ancient) code from db410/mdp5 to read out he hw
state.. I *think* that might have post-dated dynamically picking
mixers.  (The older mdp5 on db410c also had to deal with figuring out
SMP block config, iirc.. thankfully newer mdp5 doesn't have to deal
with that.)

BR,
-R

>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> index 954db683ae44..1638042ad974 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> @@ -96,6 +96,17 @@ int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
>                  */
>                 if (!(*mixer) || cur->caps & MDP_LM_CAP_PAIR)
>                         *mixer = cur;
> +
> +               /*
> +                * We have everything we could want, exit early.
> +                * We have a valid mixer, that mixer pairs with another if we
> +                * need that ability in future, and we have a right mixer if
> +                * needed.
> +                * Later LMs could be less optimal
> +                */
> +               if (*mixer && (*mixer)->caps & MDP_LM_CAP_PAIR &&
> +                   ((r_mixer && *r_mixer) || !r_mixer))
> +                       break;
>         }
>
>         if (!(*mixer))
> --
> 2.17.1
>
