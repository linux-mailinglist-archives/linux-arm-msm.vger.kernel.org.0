Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBA83DC841
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 23:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbhGaVX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Jul 2021 17:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhGaVX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Jul 2021 17:23:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D5BC06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jul 2021 14:23:50 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b6so2932422lff.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jul 2021 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UFuagbB68OTvddF9Xywx7UrDN/I21A6uFb3ydrSsaG8=;
        b=CRqwWc7QBYs7ycsAgYE5p59uP5JVARslAuqr+wmJA6jVq8VD76RE/xwkyEuczrL7y/
         qYSvp1fOFmy8Nx+lYlnUKnZLLwK9WdJ77KXwxtjV8b4TLO7LGkEQ3cqidhda96VJomgh
         P9ON+IGk+7tfgw/4t6+joWkbp0yXfGa7NORIxMegHLyEXWrHxTFf5nXnA9PVZ6LVKcC0
         tkpjQqi+m/+t5CygOoFF9YlqixGOBWaQemI5sZnwY8qSHelPfj5HAOcx+nYtkJxVp++Z
         2/Z+et95YgDXFLfI+9N5Yc57rewWnvBMlJCJSvT9uKuW7RF7Z53fakh72OQsEsypGe8M
         jOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFuagbB68OTvddF9Xywx7UrDN/I21A6uFb3ydrSsaG8=;
        b=CuALpI9fvG5qeb6yex59v3NA4LXFmi81jOUdIepSclWGO4Wd1Flk8v3LsYy98vOQAf
         jCoQKEF3NCD6LSdsXAPD0CWloMmyFwTIU/WTiUgg6MWmVtPvNAsIfWlP2d5X3wCFNST+
         0iO1uaeQ5lKXU4bf7xi1bnZfrxBbvhkY0AMUPzxBI31B02wmT2+4ejEIjwlAZUIPjLfn
         KtCgQlmqPWv+5FYHse1v4slD95fa0bzbMM/z59iqKzjjXYa5ANUYe43lmsut5B1Ac4kt
         91F3CXv+mqu2y+Sm7Mx/iKR5bKH/VwWYD/ZCuztyXjpNqku4QlaUGliyl/eaQZiRiE98
         WtJg==
X-Gm-Message-State: AOAM533iZIVqfwLCw+pt7f/Cchj8pF/7hvMUy4lRBfFjG/3K5Cuvc2hk
        v8FQx1OVQ2YacbXt73fO/oN5ylhtUrNh6zeYiU5CaQ==
X-Google-Smtp-Source: ABdhPJx7Q9x1W9R0NDVhm+5e93isK61FmR6LCKivpcqNcKWU0TYWxJ+S9YQgwYa7UlNcmN4iPwiV5tUP5zTz9VvOfOc=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr5925413lff.465.1627766628769;
 Sat, 31 Jul 2021 14:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192352.546902-1-iskren.chernev@gmail.com>
In-Reply-To: <20210723192352.546902-1-iskren.chernev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 31 Jul 2021 23:23:37 +0200
Message-ID: <CACRpkdYVX+AZWto15Buq023cPSodQuyYXr8Fq64-RP8SQ2b0bg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add Pinctrl for SM4250/6115
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 23, 2021 at 9:24 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:

> This patch adds support for the TLMM block on QCom SM4250 and SM6115, codename
> bengal. The code is taken from OnePlus repo [1]. The two platforms are
> identical so there is only one compat string.
>
> [1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

Patches applied!

Yours,
Linus Walleij
