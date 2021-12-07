Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7CF46C4B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 21:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbhLGUhm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 15:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbhLGUhl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 15:37:41 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147D6C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 12:34:11 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id j21so236668ila.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 12:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E8JlKV57a9V9sennPSYrTCjGTKh7q+B4XLkSCRyp0vI=;
        b=OyGGu7hDrNO24qeRpn0VzEiM2XdNfaluplhUq7WJQBiujEgb4/TREnIV8iBagDU5p7
         QASEKmnW0keiTwY9shZye/JhmIPsRdveSJX8ZK1d7EgAPI3fgLsqyR+0mgRg37okek52
         BEYSA5oYOq0+9DrS+y3nspapqAJUqL3DTFuoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E8JlKV57a9V9sennPSYrTCjGTKh7q+B4XLkSCRyp0vI=;
        b=Vp6+GbM+pa2II6LoyThk3ZBHDhOBi4NXNt6oolzBEAk0pOUQ/5lrUEd5Ihpjb7GvbT
         dGZH676L3AwIvtmXDKA5f/zxGf8qUa8MMJGr28DvIT40ExENUvjcFewoxqD4+Z/uPaNX
         pqf15MSmBAihsC06MX+9Kh0PfCB61XQxqFDU5Ahc7kRyXiuMF7q3TJOvlAs8KQ4SDXO/
         J6bA7bnAlI8PD/nMrRcpi/ClIANt3RQOaZ+jUI+PWd/jOudzd6dVP8yUSYrlvt5kkssm
         e64v1t+0NEziBJ0bkyl+rlC1SfUq8o/Anf+j9Q92ugJwCgGWd+0CH5OTJJwYxYHq4RhG
         Cv0A==
X-Gm-Message-State: AOAM531GytsK1J2TQ7q+Zb9TjNJpx10N3Syki5uzWw8xKcPcWOO2OW/2
        UjDqpMsIG+9AHRBXR3g5pv75ICYWawiUxw==
X-Google-Smtp-Source: ABdhPJzOAZz1TGEtPbGFplBnWOcxFgTMBsUFQyRDFUJnfTJnVt/LEMAEgRTOomfw2rewuZ9yGy+UWw==
X-Received: by 2002:a05:6e02:b4a:: with SMTP id f10mr1494452ilu.281.1638909250389;
        Tue, 07 Dec 2021 12:34:10 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id x14sm458038ilj.87.2021.12.07.12.34.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 12:34:10 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id c3so458603iob.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 12:34:10 -0800 (PST)
X-Received: by 2002:a05:6602:2c45:: with SMTP id x5mr1821503iov.98.1638908823019;
 Tue, 07 Dec 2021 12:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20211207200906.609673-1-robdclark@gmail.com>
In-Reply-To: <20211207200906.609673-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Dec 2021 12:26:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X81r4eBPYz_v6vju8bpUJX+HWS1vUuO+oC0AJUWsnCRg@mail.gmail.com>
Message-ID: <CAD=FV=X81r4eBPYz_v6vju8bpUJX+HWS1vUuO+oC0AJUWsnCRg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sn65dsi86: defer if there is no dsi host
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 7, 2021 at 12:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Otherwise we don't get another shot at it if the bridge probes before
> the dsi host is registered.  It seems like this is what *most* (but not
> all) of the other bridges do.
>
> It looks like this was missed in the conversion to attach dsi host at
> probe time.
>
> Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 02b490671f8f..3684e12fbac3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -716,7 +716,7 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
>         host = of_find_mipi_dsi_host_by_node(pdata->host_node);
>         if (!host) {
>                 DRM_ERROR("failed to find dsi host\n");
> -               return -ENODEV;
> +               return -EPROBE_DEFER;

Can you delete the DRM_ERROR line?

Thanks!

-Doug
