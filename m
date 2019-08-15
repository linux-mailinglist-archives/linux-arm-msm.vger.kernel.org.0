Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF448E613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 10:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730869AbfHOISP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 04:18:15 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38959 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730042AbfHOISM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 04:18:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id x4so1532170ljj.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W7xfr16BH5ZJjmVp0865t1tdCv0TJfQQ8MOvl0IA0RI=;
        b=h/iE0ACwRL8YZpox9tiry6Y6F9AtQ6fulXq/U4nRshmUS5LIgMjgsMcGGCCmgSfY0J
         nglNTBQxeLzOt23t5VWv3b16qAW7RU72nYgfDHIc6rn/87aL9AlP5VRxR1gOtdNN2rzJ
         CE8Oaxl6PzFKEDehEhvT9xMnQ2BuRQKgGSacBPydzgzfPTcdrYIriDbFD0KYhisx/fYQ
         TfxHkfwUUu+WzgWKIvWBuJerhIihKrkXphGv+H3J2ktph4Au4Vf7P8one0DBq1AYscNq
         Ya5pxqW6o6aiYu+tmytDC5UQsm+gOAXmFAltlAlJRfVa6YAKIB8IWmHbMqFum5Xh0C62
         Y8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W7xfr16BH5ZJjmVp0865t1tdCv0TJfQQ8MOvl0IA0RI=;
        b=jqUdD3x/4e4cJnPyeuh8x++EEnoyIiWrElcX7niMMnKdXZq6SamwD1cn7vz9Pe8x2D
         Hg8lSC+W+DqugYeIOODDbxJT5MyowUONvN+kitvgL3Krmo22L5QRbIYGEOA8dW1/p2mH
         +qyY+75zkBvrXOuQrq/sO9FbcsCVTvGfoAsIIZY4qpCnrXa36NaqPlRfm8b4VerVDaUX
         uVkG81MH1tMtzSr+Il3jFrC88fuq4wxZj84xhXt2Y8Iuu8nyVxgIOs5Yx6SLbYYU6rsm
         s0ZomEagatJmYAE2UDxEb+2dHO55+RFutBgOO/wCvYm38QNI4jKuQJ1QHct1NMDuei8j
         awvw==
X-Gm-Message-State: APjAAAUD7MAofLfvNHsVUzCUb4VYgLhYObG/IBAwlN8Wa3h+JjZ8OGxL
        cWuVFdFbtK7WQWrKwErAorNM+y48kdsxoKwFuPw6iA==
X-Google-Smtp-Source: APXvYqwlNuGYnM4syJ7wAaplZofwwfNvfLAdOC0xu1V73tUg0jS10SDexNQ4wMU3AxJ+Dtlu9zFGYve/VAiy/marM2E=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr2044788ljo.69.1565857090860;
 Thu, 15 Aug 2019 01:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org> <20190815004854.19860-3-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-3-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:17:59 +0200
Message-ID: <CACRpkdaDHoJvoH93Amzv2gSDGbgAsF-iNLiEFA3Fuov3D4uh5Q@mail.gmail.com>
Subject: Re: [PATCH 02/11] drm/bridge: analogix-anx78xx: add new variants
To:     Brian Masney <masneyb@onstation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 15, 2019 at 2:49 AM Brian Masney <masneyb@onstation.org> wrote:

> Add support for the 7808 variant. While we're here, the of match table
> was missing support for the 7812 and 7818 variants, so add them as well.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
