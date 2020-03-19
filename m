Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3CC318BF39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 19:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgCSST3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 14:19:29 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46179 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCSST2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 14:19:28 -0400
Received: by mail-ed1-f68.google.com with SMTP id ca19so3880651edb.13;
        Thu, 19 Mar 2020 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VUnLPRFaXYEyBMAu2KerTyrQvIYIc8Adcw0gQEvJv1g=;
        b=lgXZcIvA+kWlIoPJziys10SY+bpa92mglfzT+MBUMHhjvOu9zbr2UUe9GFdhoqCKEx
         B2NIDVBcMACw4/h86uBHZHdkFxDKlqEO3RbQHlJdpwsvDLoLyM8g0h35hwOW0kHwRTZb
         b+b40DXCqdQgTO6FtOInYhhcpCumJvr6veMoQTtS6fqGKXuIECoUzAGrPeZPke+MO8mp
         dWjl5fe5YasL/G+bdIQlOTbWyUCjDY1j2AUthyCd7vClmH+ulbx8MjbtSHCV73KXo+FK
         46rgB5WN9EfrklB/kJOGc+zwo6/WKRKM7nyRAOVOIWkNQd8JsfRECJmTIBfutDRonDsD
         aIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VUnLPRFaXYEyBMAu2KerTyrQvIYIc8Adcw0gQEvJv1g=;
        b=gvaumCxT2/OeG9g3HQoedlgovkOHRbxwiwzksVpBe7S7sUXkT51pAVwL2PEAcs4s4M
         /pB9ifHfPyWsj2zlUexH8CYCG90geGNFvRyJI3PhOcf726C/dZ/XSSM5bBvDhWJzlHhi
         vmvD6nkYH1vetwpUFNMIoNtzxPb4LiXrXSuFOVa9tYdR+7tty8o1BoiOGuBnLZDFLAli
         e9tQOaRVizu7ub+wG+h1O5vHQARENZqAgPAnoOdqEyRlEXQcXsD62RuHssZuVauXC0vg
         Y4qQkeDm+6SUGUtD0acCtKG25PWMXnWTkl16Xkh2yRMVEF3s7AcXZbhdLI2iQlpaD/B/
         1WnA==
X-Gm-Message-State: ANhLgQ1RVWZ+kwaCMp45MwUpXUhfndp+XEwJIeUz7Vddw0L4TwwECy/i
        g3o16pz3XzKV4a+FTMC01eqLGE1Adk1kr8H3fA4=
X-Google-Smtp-Source: ADFU+vud33ZNOWzEZL7qH7qtQzJyc7BdVgN4hxJA6xo79YTL1rHt/UMu58hsnUr03cPz9Jge8sTfUNaovlby3KRdpbE=
X-Received: by 2002:a05:6402:8ca:: with SMTP id d10mr4157650edz.362.1584641965480;
 Thu, 19 Mar 2020 11:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200319043741.3338842-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200319043741.3338842-1-bjorn.andersson@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 19 Mar 2020 11:19:15 -0700
Message-ID: <CAF6AEGtvSZOp48hyrBUzqQLV6+twtuy6k6MLimz6fhC-dqWEVA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't attempt to attach HDMI bridge twice
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 18, 2020 at 9:39 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> With the introduction of '3ef2f119bd3e ("drm/msm: Use
> drm_attach_bridge() to attach a bridge to an encoder")' the HDMI bridge
> is attached both in msm_hdmi_bridge_init() and later in
> msm_hdmi_modeset_init().
>
> The second attempt fails as the bridge is already attached to the
> encoder and the whole process is aborted.
>
> So instead make msm_hdmi_bridge_init() just initialize the hdmi_bridge
> object and let msm_hdmi_modeset_init() attach it later.
>
> Fixes: 3ef2f119bd3e ("drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks, I think this should also be solved by:

https://patchwork.freedesktop.org/patch/357331/?series=74611&rev=1

BR,
-R

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 6e380db9287b..0e103ee1b730 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -271,31 +271,18 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
>  /* initialize bridge */
>  struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
>  {
> -       struct drm_bridge *bridge = NULL;
>         struct hdmi_bridge *hdmi_bridge;
> -       int ret;
> +       struct drm_bridge *bridge;
>
>         hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
>                         sizeof(*hdmi_bridge), GFP_KERNEL);
> -       if (!hdmi_bridge) {
> -               ret = -ENOMEM;
> -               goto fail;
> -       }
> +       if (!hdmi_bridge)
> +               return ERR_PTR(-ENOMEM);
>
>         hdmi_bridge->hdmi = hdmi;
>
>         bridge = &hdmi_bridge->base;
>         bridge->funcs = &msm_hdmi_bridge_funcs;
>
> -       ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, 0);
> -       if (ret)
> -               goto fail;
> -
>         return bridge;
> -
> -fail:
> -       if (bridge)
> -               msm_hdmi_bridge_destroy(bridge);
> -
> -       return ERR_PTR(ret);
>  }
> --
> 2.24.0
>
