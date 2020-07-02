Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7348212154
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 12:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgGBKcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 06:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgGBKcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 06:32:02 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798E4C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 03:32:02 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id k7so13642874vso.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 03:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SxebolldoXIY07hiP/fBq2bV8EcWEeEf+lOF/qw89Cc=;
        b=re8VOrqxLFYqfzLqLrwM603/8Yv8jQJVF8hwvWbp8Rn1vhMj7MBa2m4+tuxhVgb/qG
         218MDG6HHuK6J3ayf3tXJuUs+zkv9ZsUx9D5XX6a0zBUAbAaorN7KExH4psa1oUvKhbK
         +VopOgZucpODThIr4p6qZ51kLPErDuptb9c0p9Xafs3O9Bl741j/k94pWmlCIvH0S/iX
         lDPvfo4CW+Np/cXaWwBCi/6lFdqXL+6ENU8h85MEMhoKvFzXhkr0D2nR+YIZc3rfnrgm
         9MP6z4wCBu4Kr7XYRFOlGq8aERz5hy6LjT7aeJmR8cYw+DEqEqS36Kv0HS9oY0zhvbxM
         W8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SxebolldoXIY07hiP/fBq2bV8EcWEeEf+lOF/qw89Cc=;
        b=Jx+t64+1nXTKa7npxW9l6CqQSXz45S+bQzqPNZhuFUNxBfIaQ5mI/HzqKylkbwuYmU
         P7pMyteJzKfrHR2DlYO4TzuBTX55vM3JJBEXnfFQJFWmWC6WRqPgU+AL6TcAjel0rDZy
         5kE4gwF+kBUGgJvnB1W4uIYkLIwoNsukUVciA/yIVDTKVD9RIM/VpnFyPuZb6uUrGVex
         gWZnVrozzzz6cUupTWjtRkIn+P8Ae+Ute/zhzOKzLT5GfDEgBuJb2oyz3UPO0dBwZFrm
         wcYKkqTaGNaVlwDZn4UYvBgYEX0Sq/upQ16UpF0svhjBfbmXLf9CU6OFC15QUF6K1d7n
         iCSw==
X-Gm-Message-State: AOAM531PH8Aaa1pHw2vMu9/Yz9Wsj46vWAGUjOjnXBZgqHu+v0tcRccq
        hRP6hKl1J/CupEv+4flOEdvt5DRWH5v/HR75d1rAnQ==
X-Google-Smtp-Source: ABdhPJwdbwsyVyU+ccN+b0j3aRMcv1lilU0Aa1R9bCfApn2B9JkpZsMeLAjtXFfG7zuCCgOd6p5HOsSMNTUAsu5j9Tw=
X-Received: by 2002:a67:c009:: with SMTP id v9mr11539095vsi.182.1593685921227;
 Thu, 02 Jul 2020 03:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org>
 <1593682763-31368-5-git-send-email-loic.poulain@linaro.org> <CAHLCerMra_a1CKRC=tZmC2OLEvp_AOdOqxSDf7QzDZC8fOjR9A@mail.gmail.com>
In-Reply-To: <CAHLCerMra_a1CKRC=tZmC2OLEvp_AOdOqxSDf7QzDZC8fOjR9A@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 2 Jul 2020 16:01:50 +0530
Message-ID: <CAHLCerN+fHzmgyjms8mJX3ZTxT-v+BuQj+VyGfBVUDC4jiMrcw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arch: arm64: dts: msm8996: Add opp and thermal
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 2, 2020 at 3:31 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> On Thu, Jul 2, 2020 at 3:04 PM Loic Poulain <loic.poulain@linaro.org> wrote:
> >

> > +
> >         thermal-zones {
> >                 cpu0-thermal {
> >                         polling-delay-passive = <250>;
> > @@ -2180,18 +2429,33 @@
> >                         thermal-sensors = <&tsens0 3>;
> >
> >                         trips {
> > -                               cpu0_alert0: trip-point@0 {
> > +                               cpu_alert0: cpu_alert0 {
>
> Please use the node name pattern we're using in some of the other dtsi
> filenames for consistency. See sdm845.dtsi for an example.
>
> This also fixes dtsi warnings about address units, I suspect. So the
> name change may be a separate patch just to fix the warnings, if you
> want.

Turns out I did fix these names and the change got merge in the 5.8
merge window. What version of the kernel are these patches against?

> >                                         temperature = <75000>;
> >                                         hysteresis = <2000>;
> > +                                       type = "active";
