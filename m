Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDED3EA965
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 19:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235447AbhHLRX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 13:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235256AbhHLRX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 13:23:56 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE757C0613D9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 10:23:30 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id b7so336578iob.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JRwzKSay2n+yQfmhBPOFfDNxmLPMQg6PC0lXLvxAvL8=;
        b=Bh074U0YkS72TlAp7BoXqHTJFFM+Kpvlod9cHdGDbEvZxvD/WDOg3Uc8bwHw0XuXHR
         gR6QY2KTEoTvpqCgEQpyiOdXq/Y0PNq6zEbZywP4dsfckhwXLli67gfBLkr1fxY8sSCu
         ZZY3+cfWMnUPqp74qIF2TVpKDoMx3ryHreSAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JRwzKSay2n+yQfmhBPOFfDNxmLPMQg6PC0lXLvxAvL8=;
        b=QOfpxrsO6GOHk/1nbn/23YoPm6Jv6lbR3PvHKiD14tWID1XwJE6si6xbZC+LaE+bGk
         /tfOkDqauTqiPuC3LugSYWBYHQfjNiZVzpOn7m86H6qj2+hVDs9roT2LWBU0p0Nb+aeA
         rQ5LYhoxaWqmugV2Glyka7UTak0EvfXyj6GN9yy3DZlt2YMcMvEd1HkKecBZl0huWaiH
         nau9VO2nUDqGeajmxqEfqJVcrUXyP9kytPCkLvFVlIR+aCZfIzmwry1UsIlzxJ8YRASP
         bzhbYmKaDHKQiPpIqthCl2U97pW8rxJaeueC9RjoUJY7EoTTwhD6v6h/dIwk87MSqyrM
         QdyA==
X-Gm-Message-State: AOAM533LJ8gyIztfN50f1j3Fcq8W+FnQ8qC+mkkTRj6Tcnp3hV6Ja8dl
        x0bs0ELf5tXHeA5dU2uhAnAuS7w+Oehxkg==
X-Google-Smtp-Source: ABdhPJwtam5js2gwzt8UyWtUaIzcQvrJlgPl4y1xxqB1uDjaABwyLSref+/dsAY3tft7ek21RexP/g==
X-Received: by 2002:a02:970d:: with SMTP id x13mr4689213jai.57.1628789008836;
        Thu, 12 Aug 2021 10:23:28 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id d9sm1934232ilu.9.2021.08.12.10.23.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 10:23:27 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id j18so7776753ile.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 10:23:27 -0700 (PDT)
X-Received: by 2002:a92:d84f:: with SMTP id h15mr3825806ilq.12.1628789006912;
 Thu, 12 Aug 2021 10:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com> <20210811235253.924867-4-robdclark@gmail.com>
In-Reply-To: <20210811235253.924867-4-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Aug 2021 10:23:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U__Ge_6MkvxmcOQe49Q7NG94Bi3T2xNNiec-NF9J8tJg@mail.gmail.com>
Message-ID: <CAD=FV=U__Ge_6MkvxmcOQe49Q7NG94Bi3T2xNNiec-NF9J8tJg@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> For the brave new world of bridges not creating their own connectors, we
> need to implement the max clock limitation via bridge->mode_valid()
> instead of connector->mode_valid().
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)

This looks good to me. I'll plan to land this together with the next
patch into drm-misc-next sometime next week unless someone beats me to
it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
