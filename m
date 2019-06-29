Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 376635ACB9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 19:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfF2Rqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 13:46:37 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41929 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbfF2Rqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 13:46:37 -0400
Received: by mail-ed1-f67.google.com with SMTP id p15so16375507eds.8;
        Sat, 29 Jun 2019 10:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oS4u77vgav7S0otvzH8LMeZADY7EGXm5N/CxQuMHfSM=;
        b=e+6e1QTxfFgkzcdZhJunA6Ct+8ha0O1DfUbQjgsjQqjYps2ZvV5kba2ZIPGmElFafJ
         6ZkRRwzhAIJgI74zdMnptFXDGOABgiwuQ+dKf6eFGw2khIogKOm2ewQGLI+1hM4rfl1Y
         pcih2gIwTBVn5/lpQTywXclzvmomMyF72zvVKr32AVD6hw9KShCO4afyQOgakWHv3SzN
         wFU71HUBq7Sri2Or86N2o4k4SERnsbmcHEB0U6lmoe0vkxukquZ3OfAub1Ebz5/WjBMX
         bC0AaO/vseVQxG6Ut2MPs/dPFnEF7M2beW01+Bo/J1MmxKzYa2hJjppTCCuG/k3aDQki
         aw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oS4u77vgav7S0otvzH8LMeZADY7EGXm5N/CxQuMHfSM=;
        b=EnTXcvYYp62yqk634rtYjUhR1oPzA34X3d8Ou2Lt8LfUxb29r6T+cs3lg7JXcfaqDv
         hA8CfTclXeUnrTUH/+Qnub39SXY1LsXjHlHsTVSXB2Z/0u0punhEBMCsdc/SaU7Up4iX
         QENTyM25+FaMVENma/iAUglgoXeKtRRhxS711RL6rgrnaGrnQdsCgPjnLRedD4AwrfDN
         LeEaokhNo0e5Ats4Pv91+iXUr0XYrXxH44vAYmx7gMuNEPy10yk253G35V23AO4R31pz
         BiRkc5Oe7sNhQwOOKHyYhFa1XYSijGXtQlP+agRE9VEDHtPLaKx3oqNJFX98+pvqzgcw
         u53g==
X-Gm-Message-State: APjAAAX6lKhBEnmW+ajOuGZqq7LADploEoaIwKYdvxLNuVDTZg8G+kzs
        LoF4LBoMmhrDHA0dJE2uSElKsktgy4Z4L6GbRhQ=
X-Google-Smtp-Source: APXvYqxYvVZOgGBFm54TxrTpBfq0bzHSSjreYYrXi4UK5pPO6x/a3qS8QtwnZtalBDYLKjsMIZD67Pz++TiVcu+4dtc=
X-Received: by 2002:a17:906:418:: with SMTP id d24mr14904800eja.258.1561830395655;
 Sat, 29 Jun 2019 10:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190628162831.20645-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190628162831.20645-1-jeffrey.l.hugo@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 29 Jun 2019 10:46:20 -0700
Message-ID: <CAF6AEGuLvgfWYdGm-0caGbWcvzt7raCWkz_sBCxFKV99YQZmeg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Transition console to msm framebuffer
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

On Fri, Jun 28, 2019 at 9:28 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> If booting a device using EFI, efifb will likely come up and claim the
> console.  When the msm display stack finally comes up, we want the
> console to move over to the msm fb, so add support to kick out any
> firmware based framebuffers to accomplish the console transition.
>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

lgtm,

Reviewed-by: Rob Clark <robdclark@gmail.com>


> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 2429d5e6ce9f..e3836c7725a6 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -169,6 +169,9 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>         if (ret)
>                 goto fini;
>
> +       /* the fw fb could be anywhere in memory */
> +       drm_fb_helper_remove_conflicting_framebuffers(NULL, "msm", false);
> +
>         ret = drm_fb_helper_initial_config(helper, 32);
>         if (ret)
>                 goto fini;
> --
> 2.17.1
>
