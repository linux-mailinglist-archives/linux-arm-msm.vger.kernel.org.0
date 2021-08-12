Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4003EA8D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 18:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbhHLQzi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 12:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233289AbhHLQzi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 12:55:38 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06F7C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 09:55:12 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id h18so7693052ilc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ajRQDl/gOVwvNbWEBhu//WfevoY6tePub/nv6KPeW3I=;
        b=aSb8j96vLHuOXO0FBSyas19kl6IAsLIMwmg3ku9T8nvfjewVuGPM33mLbilyC6rB8B
         tiQN+uh+75AyIBwHMJ2HEFtzZMiOGvWBIbRJ+QNJD9JmeqfkQ2t6nCwa69MOyn7D28MT
         srIZF9FLnI3BIgjTludpaGZhO7pBF+Wbbl2uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ajRQDl/gOVwvNbWEBhu//WfevoY6tePub/nv6KPeW3I=;
        b=BJEXxCdoiB8EpEeLX+sYRIe6ILks2u5nb4QgmSlkpgarE3oFx9jcRxagEcbgbMY+LZ
         A6OO5BCRGUWaOgpmehB9a4X4TwjFEMgFVI42onn46NoZNnNKSNjn4bkjwf7xhi7VQy4M
         kUnC2QoZeVQ6rDX18/tdhjTymRZteh+SQ365EDYcyFFo4ERK3ZZP//uLuZB0HHWt0B4R
         UdSCea2VMTSmVGSLZntqSsZULN+AtciK8+JmDCqV4wOjaXKegu4fT6fdl4ngN/JFE4AZ
         Ke2yFXGZtT5aFzPvThrs+4yKBEIGBiwqmg090TuS9LQW0jer5hfRCMLUNHHeQBzvAExb
         mWXw==
X-Gm-Message-State: AOAM532/uxfGtKy/pbAM0656Sdjn0B0jzTX/zbyaGCM/k5SdPa1agjdH
        R7rmQEu1D4EksWlIH/jxtvHuZ7NWpWfTCw==
X-Google-Smtp-Source: ABdhPJyG93JDJ44b7RamTw5FtMGCLay6PQ+HRQrnlFzOdZu7I4KLKFW6p6ea2LhxXwJ1VM2S24rAig==
X-Received: by 2002:a05:6e02:1a4f:: with SMTP id u15mr3619375ilv.251.1628787311705;
        Thu, 12 Aug 2021 09:55:11 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id o17sm1861017ilk.11.2021.08.12.09.55.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 09:55:11 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id j18so7676395ile.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 09:55:11 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr3510493ili.187.1628787310662;
 Thu, 12 Aug 2021 09:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com> <20210811235253.924867-2-robdclark@gmail.com>
In-Reply-To: <20210811235253.924867-2-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Aug 2021 09:54:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
Message-ID: <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors
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
        Jagan Teki <jagan@amarulasolutions.com>,
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
> If we created our own connector because the driver does not support the
> NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
> a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
> supported that mode) this would change nothing.
>
> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

I'm going to apply this one to drm-misc/drm-misc-next and push since
it's a fix and we're before -rc6, then I'll take a look at the later
patches in the series.

-Doug
