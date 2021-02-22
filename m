Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54B13220A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 21:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhBVUNF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 15:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbhBVUNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 15:13:04 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85252C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 12:12:24 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id 17so5127773pli.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 12:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=/t1EkBwfx/pSH+nOvj4yfjsbFaBNJI0vLgQjwLVgsl4=;
        b=eu21+rDFYFj7UOsvEdcYCyS3xySoKOsn2qbez1BBhXeBjlZurXIjdiZyD1YSScPjmr
         a3TyZcUzqHY6vmK25aKIJjtq/QzbmHiV+le9evtj9h1DF9GY5YShBh3bcKCcznxgk6az
         kMt8M/LFYtT6lneAAPtuBeHWjQL0CSJ2p32Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=/t1EkBwfx/pSH+nOvj4yfjsbFaBNJI0vLgQjwLVgsl4=;
        b=Vn9+FrCQq2I4zFm+b5M1iRexPBe9Sc8hsOJoXCj8r3QLllEq94u9X7OxP7aHyspQgZ
         N5q4vMrDYrPL5f7+9lKztiXpTdRBsgIU3lGW2aWNJCjr72tizeUVVuAtfrRndG9RGF38
         X8j1wjbphcia/gBjG5gVqneWVT8Ix5wWmWnBxGxeSUl14bV7OIfM4QVBOkCDjr8/Jfod
         crMcDDKC8oAZ8+pzTy16MJ6Yhi7Vm8bdWZqdNCg7yxNWsz+5AHMJFuOMX7Al+5niNzoq
         qxLCoRObauKLL874uRuQhRffBhGLLNykblo+lA1z5VxEWtNP25+dd1vrHuCLrRHFCvDW
         w7wg==
X-Gm-Message-State: AOAM5312cjd0OKoE3E+ewhFW+ZDoFQVNBxawA0GN1gVQZbYIcHRrre2v
        mZOvU/HwSdPWSyY4zw8WCxg0Mw==
X-Google-Smtp-Source: ABdhPJzrM/fHZ464nADMtUVC9d4i6xvIxQQOEa/eT9bFqyCjKhWLaU9Ez0sc/2vyAdUHn8P/S2N4YQ==
X-Received: by 2002:a17:90b:1a84:: with SMTP id ng4mr9437189pjb.59.1614024743980;
        Mon, 22 Feb 2021 12:12:23 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:a878:327b:a10a:e189])
        by smtp.gmail.com with ESMTPSA id k6sm19832974pgk.36.2021.02.22.12.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:12:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210218145456.1.I1da01a075dd86e005152f993b2d5d82dd9686238@changeid>
References: <20210218145456.1.I1da01a075dd86e005152f993b2d5d82dd9686238@changeid>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Avoid glitching SPI CS at bootup on trogdor
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Mon, 22 Feb 2021 12:12:21 -0800
Message-ID: <161402474186.1254594.17467439637866262864@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-02-18 14:55:09)
> At boot time the following happens:
> 1. Device core gets ready to probe our SPI driver.
> 2. Device core applies SPI controller's "default" pinctrl.
> 3. Device core calls the SPI driver's probe() function which will
>    eventually setup the chip select GPIO as "unasserted".
>=20
> Thinking about the above, we can find:
> a) For SPI devices that the BIOS inits (Cr50 and EC), the BIOS would
>    have had them configured as "GENI" pins and not as "GPIO" pins.
> b) It turns out that our BIOS also happens to init these pins as
>    "output" (even though it doesn't need to since they're not muxed as
>    GPIO) but leaves them at the default state of "low".
> c) As soon as we apply the "default" chip select it'll switch the
>    function to GPIO and stop driving the chip select high (which is
>    how "GENI" was driving it) and start driving it low.
> d) As of commit 9378f46040be ("UPSTREAM: spi: spi-geni-qcom: Use the
>    new method of gpio CS control"), when the SPI core inits things it
>    inits the GPIO to be "deasserted".  Prior to that commit the GPIO
>    was left untouched until first use.
> e) When the first transaction happens we'll assert the chip select and
>    then deassert it after done.
>=20
> So before the commit to change us to use gpio descriptors we used to
> have a _really long_ assertion of chip select before our first
> transaction (because it got pulled down and then the first "assert"
> was a no-op).  That wasn't great but (apparently) didn't cause any
> real harm.
>=20
> After the commit to change us to use gpio descriptors we end up
> glitching the chip select line during probe.  It would go low and then
> high with no data transferred.  The other side ought to be robust
> against this, but it certainly could cause some confusion.  It's known
> to at least cause an error message on the EC console and it's believed
> that, under certain timing conditions, it could be getting the EC into
> a confused state causing the EC driver to fail to probe.
>=20
> Let's fix things to avoid the glitch.  We'll add an extra pinctrl
> entry that sets the value of the pin to output high (CS deasserted)
> before doing anything else.  We'll do this in its own pinctrl node
> that comes before the normal pinctrl entries to ensure that the order
> is correct and that this gets applied before the mux change.
>=20
> This change is in the trogdor board file rather than in the SoC dtsi
> file because chip select polarity can be different depending on what's
> hooked up and it doesn't feel worth it to spam the SoC dtsi file with
> both options.  The board file would need to pick the right one anyway.
>=20
> Fixes: cfbb97fde694 ("arm64: dts: qcom: Switch sc7180-trogdor to control =
SPI CS via GPIO")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
