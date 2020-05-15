Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9941D5BD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 23:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgEOVsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 17:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727814AbgEOVsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 17:48:15 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2CCC061A0C;
        Fri, 15 May 2020 14:48:14 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id s9so3490121eju.1;
        Fri, 15 May 2020 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LxeJwDOC4JESBFPEWaMDxHHvxvCUi5Rdm/ngJV7pp5o=;
        b=gv5cLZR2/19GNH1WNdqRaNYCRHAoQhvJOZeAe7DRqu0h3xx2h2zr0ED4THVChJ4Ku4
         sxIguvV6iuWWddqwgeioUP1eppq6vKl6TQ7AwHLbROQTC/sx/SZcOLKH4ZcaRvHiyGQq
         xdFxCWMeiCKtaRfZixXSoz+VWbXbS1aNle/WIZquDuuO0H1XpFJiDTlB6vNWk5MzFkab
         CKN+zBEbZAtZnAo26vP7Y5JX+cpmNf7VY0gATjEm42BdrK4WdtJg0cwB9fnAoGKGAH+J
         aUCYBt8KZ7mhNeYnU7k1ZWgSHonazOf5gpvv/gCpm0m+jTUDbpVfGEPdpsrd7AF1ivmj
         k9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LxeJwDOC4JESBFPEWaMDxHHvxvCUi5Rdm/ngJV7pp5o=;
        b=dOUM3MlQ7OYCotoXEQxnCcuDN5u8998uxAOFI4I2SGpUYu8OqJ9om4ewhkvdHM07Tt
         8H//Ilug9/TkMEPoC39mRaFQGep/uexaKeIWcd7g5muzncVUdfxMdLnp4Tql6dyJTWot
         ptAHb6id81TqkACF4f2ciACElEPsiCIf0jW4qkyPUdFL6uZpWouJMeeeEztFuTuf1RzB
         SENXXs7zAk+JodtfXsAXn96Rc4Zp/y3jclpla7sGn7032p8F/f8sSmoIwCeEh6HAhb2l
         RrlRFyyFoViO8a4e5s7vbHIlC4h+ErDXc5MdweciPtaIhNZ50654SxkGsFV0tdCr5vOp
         H/+Q==
X-Gm-Message-State: AOAM532umBtgkWc27RpgmKRqIhGPMBT9o62YB1rLhpBGPjS5HMGQc2dl
        R6PgKY+PtNMDoI9Uicmgzyvl1LXdBPgf39JoBDg=
X-Google-Smtp-Source: ABdhPJxzQ1KczziCXxwnrq+IJ8zQvE+wvGpU2ZR+A70QjLCVg9dy4aM8cJQqI/HGsL979n/RLG/86VIcDk4qIuc8GO0=
X-Received: by 2002:a17:906:2503:: with SMTP id i3mr4552438ejb.293.1589579293554;
 Fri, 15 May 2020 14:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200508163314.1.Idfa69d5d3fc9623083c0ff78572fea87dccb199c@changeid>
In-Reply-To: <20200508163314.1.Idfa69d5d3fc9623083c0ff78572fea87dccb199c@changeid>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 15 May 2020 14:48:33 -0700
Message-ID: <CAF6AEGsYshudTEyL3vk+d3wZeYLOcMTqNR+sWZhBUZUzSZ9orA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Clear old error bits before AUX transfers
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

On Fri, May 8, 2020 at 4:33 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The AUX channel transfer error bits in the status register are latched
> and need to be cleared.  Clear them before doing our transfer so we
> don't see old bits and get confused.
>
> Without this patch having a single failure would mean that all future
> transfers would look like they failed.
>
> Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6ad688b320ae..d865cc2565bc 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -827,6 +827,12 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>                                      buf[i]);
>         }
>
> +       /* Clear old status bits before start so we don't get confused */
> +       regmap_write(pdata->regmap, SN_AUX_CMD_STATUS_REG,
> +                    AUX_IRQ_STATUS_NAT_I2C_FAIL |
> +                    AUX_IRQ_STATUS_AUX_RPLY_TOUT |
> +                    AUX_IRQ_STATUS_AUX_SHORT);
> +
>         regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val | AUX_CMD_SEND);
>
>         ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
> --
> 2.26.2.645.ge9eca65c58-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
