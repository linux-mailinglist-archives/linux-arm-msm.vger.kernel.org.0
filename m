Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B890C38F460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 22:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhEXUa4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 16:30:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30772 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232770AbhEXUaz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 16:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621888167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aM5BlbcF5ShA/EMmaqQOt8kM02ccUq9Nt6SsMiIbryc=;
        b=YngQRAK9dNw5rzZm4JKGZTdyAXhnVzgwpnodLfoyqTAdxcpguKEAiOBr0KsiIuoFMVf4G9
        iAgHjHn3zgNZcRm8azBeUMQ2KD05ntPnc4iy8wHySsrCtmQavP7tfL/C6L3jTNagtbXmqh
        5F7qcje8Xi7jHrfGNSqV5J5S99G/ow0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-EeZlZK6CMq-m_SYl-jd84Q-1; Mon, 24 May 2021 16:29:25 -0400
X-MC-Unique: EeZlZK6CMq-m_SYl-jd84Q-1
Received: by mail-qk1-f200.google.com with SMTP id b203-20020a3767d40000b02903a6207bfef5so11951121qkc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 13:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=aM5BlbcF5ShA/EMmaqQOt8kM02ccUq9Nt6SsMiIbryc=;
        b=FVLGw8HQXmQew3etuE120rR/gYBEL//avddNzdpD4v7tw52Gp7IcBn3URnAtvmMvKe
         rFhYn7m9f+fnEWQpg0wSLAmVP7RUNZYR8oMR43vKxyOelmyAWi0wNyhvcDtF/c4n5g9o
         Uy/stwxYkcAkHAC3aFN+Sumw6HRIPTtqcp4v9CljugJSI1TKTzRspmFF4QRjb8qw0ZvX
         eLKJ0ciHAAOORALiZOd5dPqUMuIhdWJvxM9b1y9SXmzh1fFlaLdyHcXt8hJYXoFBWZl+
         bfkpqHih13OpT3X32ZAiyfeGW4dt5ZQgX/ODef/OfcW5N/rbNYV4f982mdSbC1JW1tfR
         HecA==
X-Gm-Message-State: AOAM532NqD9LVVII1T4RyGlQGkxIjoOoP169bBceKxno2VwJMUtRDABr
        BytJl+PH5LT6i8O9I9qzkPh/8fxMdM2NyVYQ99IAG3T9UBUkxvZ7sFLUFeRPlxVrlGwAbroth2Y
        AK5Q/aXAfkcQ5ROkqqOoTgP/olw==
X-Received: by 2002:ac8:594a:: with SMTP id 10mr27755389qtz.293.1621888165117;
        Mon, 24 May 2021 13:29:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydFmC/nU4sjsnnU0eNnpKjJNtYwE0t39aBuiF0Lqkl7LWb5yxJqiBw5WLqUzup4nSZcLwzPQ==
X-Received: by 2002:ac8:594a:: with SMTP id 10mr27755365qtz.293.1621888164914;
        Mon, 24 May 2021 13:29:24 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id p10sm11665950qkg.74.2021.05.24.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 13:29:24 -0700 (PDT)
Message-ID: <b0e6b0957716c9bc65e22ed989a73f050522e375.camel@redhat.com>
Subject: Re: [PATCH v7 08/10] drm/bridge: ti-sn65dsi86: Add support for the
 DP AUX bus
From:   Lyude Paul <lyude@redhat.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, robdclark@chromium.org,
        Steev Klimaszewski <steev@kali.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Date:   Mon, 24 May 2021 16:29:22 -0400
In-Reply-To: <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
References: <20210517200907.1459182-1-dianders@chromium.org>
         <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For 7 and 8:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2021-05-17 at 13:09 -0700, Douglas Anderson wrote:
> We want to provide our panel with access to the DP AUX channel. The
> way to do this is to let our panel be a child of ours using the fancy
> new DP AUX bus support.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v7:
> - Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.
> 
>  drivers/gpu/drm/bridge/Kconfig        |  1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index d25e900f07ef..294d0bdd4cbe 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -280,6 +280,7 @@ config DRM_TI_SN65DSI86
>         select DRM_PANEL
>         select DRM_MIPI_DSI
>         select AUXILIARY_BUS
> +       select DRM_DP_AUX_BUS
>         help
>           Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>  
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 42a55d13864b..a59497f7e504 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -23,6 +23,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_dp_aux_bus.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
> @@ -1446,19 +1447,27 @@ static int ti_sn_aux_probe(struct auxiliary_device
> *adev,
>         pdata->aux.transfer = ti_sn_aux_transfer;
>         drm_dp_aux_init(&pdata->aux);
>  
> +       ret = devm_of_dp_aux_populate_ep_devices(&pdata->aux);
> +       if (ret)
> +               goto err;
> +
>         /*
>          * The eDP to MIPI bridge parts don't work until the AUX channel is
>          * setup so we don't add it in the main driver probe, we add it now.
>          */
>         ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux,
> "bridge");
>  
> +       if (ret)
> +               goto err;
> +
> +       return 0;
> +err:
>         /*
>          * Clear of_node on any errors. Really this only matters if the
> error
>          * is -EPROBE_DEFER to avoid (again) keep pinctrl from claiming when
>          * it tries the probe again, but it shouldn't hurt on any error.
>          */
> -       if (ret)
> -               adev->dev.of_node = NULL;
> +       adev->dev.of_node = NULL;
>  
>         return ret;
>  }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

