Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139833E9B97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 02:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhHLAZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 20:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbhHLAZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 20:25:36 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B670C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 17:25:12 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so5683102oti.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=aBF5XsmOwLOwhoJ7V4vA+C2s7+F6s8RQ06qQNUqSroI=;
        b=h+56UWETmWksgXZ6odjCSUhkS60nq9twTFk5O3iDfPkw9SlJ2Q9MC4k1YZ13wA9QSI
         cz2Pc3wlRcNYEKwZ643eM+MtGzStloEbEFNy4YhjnGGkil5U0nH2pe9f1iubEMhKDwtU
         PwWNtWc+gGsmqzXBvFg2DTN9n6mT6P+9a9T3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=aBF5XsmOwLOwhoJ7V4vA+C2s7+F6s8RQ06qQNUqSroI=;
        b=a5LQPBLj4/O5W1iWVlTth18ejeyQtJkvYTUysoX7MSXdfAbvlgXCua4zuSr7hHFrJI
         J8QXtOdT698/NGM7kfSn92tTrEGC9chyDhwYacmXprR0fMtC2pALNx37y/AJz6CoBLQy
         qYxeH5gxPDuBaiOi87Z429rQng23II0nw2a/Szxo398xc2F3wO/X7fX5vGw1qsBPlEHT
         n5V2Or1A+slrm6QtIoMkmy88/J6Dje/76G6rjq72nCiFBMmjK9HSZKEjxF1U5uJA1rjV
         X7n8PKcVQ1RCxo2li3pONMxldEnxv32Q8TeErpqefNBASzsfzK9HCEN+6/+QY0PCDuNv
         rzkA==
X-Gm-Message-State: AOAM533FC9Bd1/5Eq6vs4eKcNReAFOAczqvQK16+S6VSI82K208SFGc3
        tdh+KT/38sUt/Sboo8UzjY75ocBP5A+XD5VQ0hND9Q==
X-Google-Smtp-Source: ABdhPJx0FoYmfQ9zAKiWN4L09yMr9AcpGP2BwH3WsltDn0CSuMhuEFOx+zQVeSaXHI+pNsLrGV3maXsnDszKO/B14Ss=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr1268834oti.25.1628727911938;
 Wed, 11 Aug 2021 17:25:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 17:25:11 -0700
MIME-Version: 1.0
In-Reply-To: <20210811235253.924867-2-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com> <20210811235253.924867-2-robdclark@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 11 Aug 2021 17:25:11 -0700
Message-ID: <CAE-0n51mqTwUdT1cmL=ubcFppFZ8GwerPBWCJ2QsyRtzG9vkjw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2021-08-11 16:52:47)
> From: Rob Clark <robdclark@chromium.org>
>
> If we created our own connector because the driver does not support the
> NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
> a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
> supported that mode) this would change nothing.
>
> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Thanks for saving me the packaging effort.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
