Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532A53138BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 17:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbhBHQBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 11:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbhBHP7f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 10:59:35 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DFCC061786
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 07:58:55 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id c1so10660445qtc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 07:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ar5a9upAWqd9rstoJ9nPmfXVeGzQci2wgcFqCPGRHlw=;
        b=GUWgI4+zWgYnuvHHDFChzTNagH4BB968l0eubfbPvFgOVqi8BeBxWGQSyTDnx0iPMw
         i8FqLLBeAuh5hZi8K1NOsNhf2uvXGGY8AQ9fktIBsneKbyldnAA1fxUh8LLQjCVxEn2y
         gKyX4W63cF0TobLp4ybOpswS+CoidqC9VsHpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ar5a9upAWqd9rstoJ9nPmfXVeGzQci2wgcFqCPGRHlw=;
        b=CVxYg40jjhoWHDnpg5QwZeA+dTemkBBTDunHnDOaCUdswi7uJ4hAOHLir5kqHj+6Xq
         7+OFed6BwOeS7UY0OFlQzOewwr5BtzlZOL+r3gttP1VP4Rnm5oF2e42jvE0U0GUGUTGt
         IU+FZIzdVpYYHAV44BrGu0JPvg+xAKmLALkIHczdRfr2KSRR3rtXp16SV38ayhbR61PP
         KyvDGvXPqUSKOlf73wkMpI4WMWo+1484LmKuI4M6AkGDzW8ubtcnNnGcQe6fc1WWELxT
         MQjdGigt01uYXiQA8PLu/+CsxmVy1lhvz+wteECgMy0LJSXS1FvCuvTe4okM9pB/ah1b
         8MYg==
X-Gm-Message-State: AOAM532LLXBWTlj1be6HPNQRmF+3qKIYsJZwrU9zwQ7hOtOzO2ynaDeK
        Che8XJSHB7KwQ2RX8CYjnhO6YUfLSuvxFQ==
X-Google-Smtp-Source: ABdhPJzsk87I/aRdna1A/4IMA2GMyssiC5mAJc9vG+/HaVEB+6Ojt5qM+GcMJpU831xGJL/Qt/FHMw==
X-Received: by 2002:aed:38a2:: with SMTP id k31mr16143757qte.187.1612799934013;
        Mon, 08 Feb 2021 07:58:54 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id i23sm2588884qtq.42.2021.02.08.07.58.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 07:58:52 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id e132so15031480ybh.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 07:58:52 -0800 (PST)
X-Received: by 2002:a25:4fc3:: with SMTP id d186mr24413774ybb.343.1612799932352;
 Mon, 08 Feb 2021 07:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
 <YBx+LcgrbyUKpYig@builder.lan> <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
 <YByQizVTnj2uTNt2@builder.lan> <CAD=FV=UYmv-PH-m4T6RcuW1JuQ-fCZ2Lg6gCCUJ5xquT1NP1jA@mail.gmail.com>
 <YB122qwCSdQka5jw@builder.lan>
In-Reply-To: <YB122qwCSdQka5jw@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 8 Feb 2021 07:58:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UY_AFRrAY0tef5jP698LEng6oN652LcX3B4nG=aWh0gA@mail.gmail.com>
Message-ID: <CAD=FV=UY_AFRrAY0tef5jP698LEng6oN652LcX3B4nG=aWh0gA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Feb 5, 2021 at 8:48 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 05 Feb 09:00 CST 2021, Doug Anderson wrote:
>
> > Hi,
> >
> > On Thu, Feb 4, 2021 at 4:25 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > > > > +                             mux {
> > > > >
> > > > > Rather than splitting the properties in {mux, cs, config} I think it
> > > > > makes more sense to split them in {spi, cs} or something like that.
> > > >
> > > > In general pinconf doesn't belong in the SoC dts file.  If there's no
> > > > reason to change it seems like this should match what sc7180 did.
> > > >
> > >
> > > Right, but I still would prefer the pinctrl state to be split by
> > > function/pins, rather than pinmux vs pinconf. That way it's natural to
> > > add pinconf properties to the various functional parts (i.e. bias or
> > > drive-strength for the spi pins vs cs).
> > >
> > > Do you have any concerns with this?
> >
> > I read this a few times and I'm not exactly sure what you're
> > proposing.  Can you provide an example of what you want it to look
> > like in this case?
> >
>
> Today in most cases we group pinctrl properties by being a "conf" of a
> "mux" property, so we end up with:
>
> the_state: spi-state {
>         all-the-mux-properties {
>                 pins = "gpio40", gpio41", "gpio42", "gpio43";
>                 function = qup14";
>         };
>
>         repeat-pins-and-add-all-conf-properties {
>                 pins = "gpio40", gpio41", "gpio42", "gpio43";
>                 drive-strength = <6>;
>                 bias-disable;
>         };
> };
>
> This made sense to me after implementing the driver, there's muxing to
> be done and there's electrical configuration to configure.
>
> But what's actually trying to describe is a hardware state; i.e. that
> miso, mosi, clk and cs should be acting in a particular fashion.
>
> In particular this lends itself useful when the hardware state consists
> of different functions, a good example being the Bluetooth UART, or in
> the SPI-with-separate-GPIO:
>
> the_state: spi-state {
>         miso-mosi-clk {
>                 pins = "gpio40", gpio41", "gpio42"
>                 function = qup14";
>                 drive-strength = <6>;
>                 bias-disable;
>         };
>
>         cs {
>                 pins = "gpio43";
>                 function = "gpio";
>                 drive-strength = <6>;
>                 bias-disable;
>         };
> };
>
>
> For the case of uniform configuration across the state we've come to
> sprinkle a few different synonyms for "pinconf" and "pinmux" in the
> state nodes. But a few years ago someone updated the state parser to
> handle cases either directly in the state or in subnodes. So we can
> avoid these boilerplate nodes with a simple:
>
> the_state: spi-state {
>         pins = "gpio40", gpio41", "gpio42", "gpio43";
>         function = qup14";
>         drive-strength = <6>;
>         bias-disable;
> };

OK, this makes sense to me.  I always felt like the extra "pinconf" /
"pinmux" made things awkward.  I guess someone should try to convert
some SoC dtsi fully over so we can see how it looks?  In this case I
think you'd have something like this, right?

SoC dtsi:

tlmm: pinctrl@... {
  qup_spi0_data_clk: qup-spi0-data-clk {
    pins = "gpio28", "gpio29", "gpio30";
    function = "qup0";
  };

  qup_spi0_cs: qup-spi0-cs {
    pins = "gpio31";
    function = "qup0";
  };

  qup_spi0_cs_gpio: qup-spi0-cs-gpio {
    pins = "gpio31";
    function = "gpio";
  };
};

Board dts:

&spi0 {
  pinctrl-0 = <&qup_spi0_data_clk>, &<qup_spi0_cs_gpio>;
};

&qup_spi0_data_clk {
  drive-strength = <6>;
  bias-disable;
};

&qup_spi0_cs_gpio {
  drive-strength = <6>;
  bias-disable;
};
