Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A44499A7D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 08:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404399AbfHWGwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 02:52:18 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33170 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404369AbfHWGwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 02:52:17 -0400
Received: by mail-lj1-f194.google.com with SMTP id z17so7885906ljz.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2019 23:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5vut+/7GfWn6npImvF9Rc3EcWl6Bwqxpc3Tm/7byaQ=;
        b=MVIXR6k8i6ZWuPASEFHHR9F0nPCzK0eVjc8PYz7FptLy2OJujuacqW6lgWGhwQySFz
         3QAySOWoE9nAwQwl1xLEODlrOsAyBMu2u04vibbBBVpvxgU2d/d9lFgSf123gf2E114D
         /jPW1MjyPfCGwgmewUy7qWtuRuFl0ZdoBgJUXWuNSSUvkanykJHAMib9ZE1FHuoQnZgx
         XzaapAMFiJGaBP/N7hmC43ow43jjVG9Li0erAVdh6tyQNjy9HmQDLOQfs/eqEiCTGeze
         cBBi02p/e6U/e0HvajIHRSQG3k6yQHhDjihSPwrKZVq8gfHYtJswFQUJzcr833qCT5/D
         N/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5vut+/7GfWn6npImvF9Rc3EcWl6Bwqxpc3Tm/7byaQ=;
        b=EX9mQLqgFuSBF221n7QXBzcztiiisM5ZIJQ0C1Zx4GG5rIBDc1YQ4gpcd6AKHwwCKQ
         +/u7Vqo0HzRLsE5OBSI0QLQZVWAP73pLpBcBA327poJMu9iea9+Ii0jqgrQF6Ja3B7Mg
         hYYq8Udecb0GZyWOSx12T1JMaG+Cnop42umCY2kDHpq11aZzYFzbPHKQu5LFKiQCWpLz
         No1IKfYM0UpUNxCFi/DG+AhySl1o6Sw/WT+a3jDjO24ohc3u9Ir5l9xM2BsRfpNTyYTM
         xVf1KebcQIn6AWXLKCtFXzzLaJGBVP+etpiZhl97PgkdrKfHwsCHXn0rvxdlfYB9Y2dA
         ca4w==
X-Gm-Message-State: APjAAAWP9gM+aT0LdO+Tn4PIvPgyW+U5aXOwUGEfZE7RKFogNdUmfrgY
        1wuoa3An8eW80Rc0j9Rg5gzr9BPxkOJDHOo1+0VpXHItbGg=
X-Google-Smtp-Source: APXvYqyEKzwPdx0ZjJjocJJunKwmjsRZdIowtZKK6Batd8JU0Y56aba6StNeDVmOZui0Y27K+B6WJCN6um5Z3JBIC5I=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr1814316ljg.62.1566543135677;
 Thu, 22 Aug 2019 23:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org> <1565707585-5359-2-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1565707585-5359-2-git-send-email-jcrouse@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 08:52:04 +0200
Message-ID: <CACRpkdbtPo9dr7E2hZ4=fEWTXappWTaypKJyd9M2jz0tYu7HXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: Add DRM_MSM to defconfigs with ARCH_QCOM
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Olof Johansson <olof@lixom.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        Frank Rowand <frank.rowand@sony.com>,
        Tony Lindgren <tony@atomide.com>,
        Anson Huang <Anson.Huang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 13, 2019 at 4:46 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:

> Now that CONFIG_DRM_MSM is no longer default 'y' add it as a module to all
> ARCH_QCOM enabled defconfigs to restore the previous expected build
> behavior.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose Andy will pick this up?

Yours,
Linus Walleij
