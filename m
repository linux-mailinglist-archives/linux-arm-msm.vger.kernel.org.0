Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753A5393A48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 02:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233597AbhE1AdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 20:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbhE1AdE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 20:33:04 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D788EC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 17:31:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x38so2711241lfa.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 17:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nACOEvpFPcdmw/HFjZn82A0S5koii2HQf8n4dSZ8kUc=;
        b=He9atcVUlHOl31CBA9dnNly8sJj3fpy0sjqip4IgivvZiMY6nJj6LKbRS8c4oqRw7w
         xtlA6u58J+k4wpgTjwAiRfSihTmKOQCh3ku8VwR1DE06L0BRvlY6APIjntzcq4rsW4QU
         UNdrYzJTU3pPlsnt5W6uZiuAJs0sjALtd/niqUs8SdPeatLGMZPWCSLM9wlQ5aAbqWxj
         P3buPWbFsHpW/vgtLuLZS1kSUt53VNiXAsvWZs5LEmECxQ0Z2IToJDsSMbafQ0us34wq
         jQW0gC4Ypn/kYPw7f2anjK5Rkio4nslpi8CehAmR+HZWbpGLAd2DFDO/MBjo7bYA/u87
         AjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nACOEvpFPcdmw/HFjZn82A0S5koii2HQf8n4dSZ8kUc=;
        b=g4eRYQDgOkgJ1daV9C6lnzje3Nb1JloFul9MMDqy8M3kgA6O4oHGEb863uFeLG+t0d
         7pOWqdGlOnEYtdqgz0zltee6vqcec9rwbuRZ1ExBbGQE2Fwo2IVSdeJr4wHCnuYv0F46
         15ljeg12Io4FwcBM+15Q3bV7k7RNru4rHihal+0XjXRldKvC/XQ5/ozihqaS+gBaK4U2
         hV1iphi0CEkMwlaYPVLLooXVa6z+apQoSeKDAiMoPJsAvlnFjFnz7Torv8Reu+FFveKZ
         hZt7EX34/mWzBHpZ6auLqzLTm+YTQkPrrKthTerHAg2dyNS1+C8i676nmQJ0x0w0w+7x
         nMOg==
X-Gm-Message-State: AOAM5312VG/CAqnFKrulKJ8KWJeKRjVncgzAJHamqQYliPBg8RmM/zeJ
        8CacscbMKW/MfEihHEaNXM9WdvTGdYh4NR9nZGKA3w==
X-Google-Smtp-Source: ABdhPJzyNmeLKVoRU1NdOgocbRYiFNBbVgmN0igEpSoGd2uCo/A6lb/ej5LtKxFNhraw8Pjt1blGen8fCMiOv26hz4k=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr3909543lfp.649.1622161887248;
 Thu, 27 May 2021 17:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org> <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
In-Reply-To: <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 02:31:16 +0200
Message-ID: <CACRpkdYxAtD09cgVFd=_rusdVcr5LGF=z=mzG-22enhtRK+NBQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] dt-bindings: drm/aux-bus: Add an example
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 25, 2021 at 2:02 AM Douglas Anderson <dianders@chromium.org> wrote:

> Now that we have an eDP controller that lists aux-bus, we can safely
> add an example to the aux-bus bindings.
>
> NOTE: this example is just a copy of the one in the 'ti-sn65dsi86'
> one. It feels useful to have the example in both places simply because
> it's important to document the interaction between the two bindings in
> both places.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks good.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
