Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88AD36F3AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 03:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhD3B2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 21:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhD3B2s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 21:28:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03FAC06138B
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 18:27:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id h36so53559578lfv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 18:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5nYrcPFaE9JozlbdUYcBvuc3knwcBJ+KRlPBwjPg/eY=;
        b=mWr/LU95sxRmIHn3zRMbluegyGD2oe6oRt4d/eRVIdu7KE3Hz+geRyAZlmU7D5TMAP
         hBhqnVuVTVgUAhM0ZWa+OwuRT9bQbE3RnlfSljIXyeQtbRVE3csRBOvTZ2UblLcRM1QC
         xxs3hrrGH/TOp0oQcLOkEQIwojDLhahdEkZ6uo900/o8WZPZ19oj42KYditGQucez/as
         vUnwQLP3c6V6Z++gJIjubVeNlKS9+vW3LkRRxu3vS1WvzgEP3ZR5H+scAq2iwSyMhr+x
         AmUwvYqwpyzEIbU+VnqL+66wxLgWtk7TUMbBixNYKsUb9BMpCwEI2TAVauzbB6jQtiw3
         Iexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5nYrcPFaE9JozlbdUYcBvuc3knwcBJ+KRlPBwjPg/eY=;
        b=AY//bDkN1EQXTLGISOqev9+2ataFTaVVT50Sh1BOJqweUZGWMz3SPQxwpa/q86SL0q
         211ys6B5e+sGrnBNAq8V9yCdS5Kb/VkWz004o9B6XIsSyjfPsicIUwGBkWvPlkpGZk+e
         gpwLMMSs8SQnWwSnIjXokmcTTlsQaqxQPdW+N+UVbCvTvrbNOE6Zthuqaf8hIJCvsLvo
         kmtHHEoOM+gmeof0Pcvsx1QzZs4SIX1+7K750j0CtVLd7D5wSY6GaPuxe2h6v7GoqkRh
         ZAaB91buLfhCfeXQxNQOUJb1KKylpCbnPajd3Qd2drth74OvUTBcmWz5I0bODzVE5EY/
         GmkA==
X-Gm-Message-State: AOAM531dYo5RaAeU472vaRIrkbW6z65tl68aJ88tn2/dES6yC/7pDq7t
        j46gknyaTUUcwnj9EOtQzm8PqUZIxfeitBFeB7p02A==
X-Google-Smtp-Source: ABdhPJzFPmRotZN0fnw8kLXHW0mhRMJ6Y9pLJGkfe+X4ux0/23qoEes3nema+045FI+84RCCCXHVaXcNwdXLrns0we4=
X-Received: by 2002:a05:6512:149:: with SMTP id m9mr1218659lfo.157.1619746078186;
 Thu, 29 Apr 2021 18:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com> <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
In-Reply-To: <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Apr 2021 03:27:47 +0200
Message-ID: <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 30, 2021 at 3:25 AM Doug Anderson <dianders@chromium.org> wrote:

> > I think pm_runtime_disable(); need to be added there?
>
> I'm a bit confused. You're saying that I need to add
> pm_runtime_disable() to panel_simple_remove()? Doesn't this patch do
> that?

It does, sorry, too late at night :D

I was looking at the previous patch and mixed up which was the
patch and the patch to the patch...

Thanks, apply this!
Linus Walleij
