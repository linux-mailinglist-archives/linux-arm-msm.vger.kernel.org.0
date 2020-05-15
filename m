Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48ECE1D5BEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 23:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgEOVtb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 17:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728138AbgEOVta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 17:49:30 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A2BC05BD09;
        Fri, 15 May 2020 14:49:30 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o10so3441274ejn.10;
        Fri, 15 May 2020 14:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hpbnK4RqqNcZZa0YjQ9eRujRX3tECBLfwP3DAbNQUT4=;
        b=bC2YW/FwplFbWLCWambsxkLu8KVFHwMsi1FN0fqeZ4jIEGGBPIiMvZqCgJ6EZ7Y82x
         Vy7G9gP6FqSXY7LqWVvfnyF+SGCn21icOVYZbO1W2hMni8j+idsw+8iQbKPkVcdUrzvu
         028oAle2Y8JwqirTv16Tu/ipfj++/9KrNVwLeXyNACfxLzjNi+DWyr/D51yR8V1iRJl8
         4K0S9MuYLaQQxXnIahvlLDvctVnxLrK9GD3PFzA+P0W3e0H3x8Do0zgx/Rw+91wxRhIp
         c3scnsELejcLjPZjEmG+iinUuk1JgNL9VTtkcwUbB8/E23j4cymDCoS7lLdMrgGUoUBU
         zU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hpbnK4RqqNcZZa0YjQ9eRujRX3tECBLfwP3DAbNQUT4=;
        b=IIWUWXYfNnJh4OYu0s5RB/KFssE0At247HdjVPneFiLyryO7Ly9pGupcpslQ7Smb22
         YxZdJKCRoCE55LyznoEeXHid8Hs0spKSpb3jKO7E6jQAjDc3ujbrurIYUV/XqowbxfAu
         17QK5ulDPnIyTVrcGFVqvPJ+xJ4onPP5fHScQ6JR7UUlrnrAz/N4rNqgNPui26EuoeG/
         6zjOyEmuNs1uoA0sRSZj2yn1X8AN0fsicQIurc3rHGHkRbQh0bJCv4fI5BPjZFcIyi1m
         qWyCqCbxWpYM0jyPaAljZEgBWF3Y1au/5XlIYSQdO20sr5jFsTk+ONBMR5wKTV4aJbEx
         62rw==
X-Gm-Message-State: AOAM533thX8VKu5jYks7H4sC8c3qMLM8vEdUMvgDXXi6v0JnUsh/aAxQ
        stUTaNWxD7ax3iKfDVzKK0Uwb4ex7wmSYorYqbM=
X-Google-Smtp-Source: ABdhPJxcOwuGB+qvjzbZYGfKzm25WDG8YmHx8jHmhDT9TWZ/bEKwEi5IfEnAbBzkagwaGEu5tLe0BjDXT69eoxYbszA=
X-Received: by 2002:a17:906:29d3:: with SMTP id y19mr4804200eje.258.1589579369030;
 Fri, 15 May 2020 14:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
In-Reply-To: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 15 May 2020 14:49:48 -0700
Message-ID: <CAF6AEGs0qpzgGW8rYdmFqKW=QBbRxxzCWjO0LXsbm6hA0AJNyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock choice
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 4, 2020 at 9:32 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> If the rate in our table is _equal_ to the rate we want then it's OK
> to pick it.  It doesn't need to be greater than the one we want.
>
> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6ad688b320ae..be000b0ca56b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -475,7 +475,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
>                                    1000 * pdata->dp_lanes * DP_CLK_FUDGE_DEN);
>
>         for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
> -               if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
> +               if (ti_sn_bridge_dp_rate_lut[i] >= dp_rate_mhz)
>                         break;
>
>         return i;
> --
> 2.26.2.526.g744177e7f7-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
