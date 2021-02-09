Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4BA314CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 11:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhBIKYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 05:24:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhBIKWA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 05:22:00 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEC9C061786
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 02:21:20 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id m144so1602300qke.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 02:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JFbbId4eV6SwnEvOsCaL5vUkhULlMluOIteiiOj1FEE=;
        b=XwIg55VMJkq4l/LyseacXXOX0cge6N+JMEM7Fo12LlGaOxr84kvLlvmcYSW9BKOY/g
         GgzjQxV9dpOu299U27lqodUfqH6itfK4DZVKRat94hqDl/za11RUpm7R2Qy0pcxRDiFV
         4XbSJE6NEgqOQdBD9YP51v9Z/S3pETrwDzl2rBThHLd5kskPD255FPn/hWBt17XaYk6g
         HXCMVAaVyP3nCZBUST3Zl9eURBeu23dUg4XXvjmc4ftzCkQCRRBrDr0DfkwLVsWY4uJ2
         aMhjPe1oWbvQ0RDOihjCrcF3GtqPrM1fFcuGtL5RGvPxX7I0qwFb9YAAHofZ4asjBUqY
         dW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JFbbId4eV6SwnEvOsCaL5vUkhULlMluOIteiiOj1FEE=;
        b=HoIZt43HLHV97JZL85jzAgemawP70m/rkJTD+wAa3vJBMWTYttUZSOMq1BszyTkqTU
         P2p/0bVZT7h88c8/bpzNidvI3GKsf067eKuEBq7asBrobebSbjA11rlcA2BfHT4Ekeqr
         pVgjG5EMvLXd5m5dgMme4LOO9Nx1kgQwjk4YGnrsFpDITrlo/nWvvObUYcG9idhr0u6T
         kz46sSkJOp8PtvYfOq92qH2Y4EMyt9Ne+PW5cyrPBVK0DwU8WHzPCxdtFJiEr0fciRXZ
         VndrQpOQuW+ZBL/VllnxoTOEcHuu8hoB01pwzkFPRYF4vTASUJ9pG7EttT/FPS+ZIm0Z
         sgQA==
X-Gm-Message-State: AOAM531Zb5QxE6ukD9csrtXPjEURx3+xjhsrJ9Eowsvuutr6cIYH1DGt
        C2rooM4NHS1CHUXRrLgUNYf4Gk893RoUj5s2lonu7g==
X-Google-Smtp-Source: ABdhPJxETDB1AAqo99mNu3ZA/IGnxQ3PDw3Rf6fL61udAdiYNWOh7z9nHMR7AoL7EQ87AjwgwJ/Ez1FPPpQ5bKjJze8=
X-Received: by 2002:a05:620a:ec2:: with SMTP id x2mr20968257qkm.138.1612866079663;
 Tue, 09 Feb 2021 02:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
 <YBx+LcgrbyUKpYig@builder.lan> <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
 <YByQizVTnj2uTNt2@builder.lan> <CAD=FV=UYmv-PH-m4T6RcuW1JuQ-fCZ2Lg6gCCUJ5xquT1NP1jA@mail.gmail.com>
 <YB122qwCSdQka5jw@builder.lan> <CAD=FV=UY_AFRrAY0tef5jP698LEng6oN652LcX3B4nG=aWh0gA@mail.gmail.com>
 <YCF9PKJl0HZrKBz1@builder.lan>
In-Reply-To: <YCF9PKJl0HZrKBz1@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 Feb 2021 13:21:06 +0300
Message-ID: <CAA8EJpre32RQiDhjTgbdnmKGmPP57==MuNAxYp4kdVrRNtgtHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 8 Feb 2021 at 21:04, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Mon 08 Feb 09:58 CST 2021, Doug Anderson wrote:
>
> > Hi,
> >
> > On Fri, Feb 5, 2021 at 8:48 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Fri 05 Feb 09:00 CST 2021, Doug Anderson wrote:
> > >
> > > > Hi,
> > > >
> > > > On Thu, Feb 4, 2021 at 4:25 PM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > > > > +                             mux {
> > > > > > >
> > > > > > > Rather than splitting the properties in {mux, cs, config} I think it
> > > > > > > makes more sense to split them in {spi, cs} or something like that.
> > > > > >
> > > > > > In general pinconf doesn't belong in the SoC dts file.  If there's no
> > > > > > reason to change it seems like this should match what sc7180 did.
> > > > > >
> > > > >
> > > > > Right, but I still would prefer the pinctrl state to be split by
> > > > > function/pins, rather than pinmux vs pinconf. That way it's natural to
> > > > > add pinconf properties to the various functional parts (i.e. bias or
> > > > > drive-strength for the spi pins vs cs).
> > > > >
> > > > > Do you have any concerns with this?
> > > >
> > > > I read this a few times and I'm not exactly sure what you're
> > > > proposing.  Can you provide an example of what you want it to look
> > > > like in this case?
> > > >
> > >
> > > Today in most cases we group pinctrl properties by being a "conf" of a
> > > "mux" property, so we end up with:
> > >
> > > the_state: spi-state {
> > >         all-the-mux-properties {
> > >                 pins = "gpio40", gpio41", "gpio42", "gpio43";
> > >                 function = qup14";
> > >         };
> > >
> > >         repeat-pins-and-add-all-conf-properties {
> > >                 pins = "gpio40", gpio41", "gpio42", "gpio43";
> > >                 drive-strength = <6>;
> > >                 bias-disable;
> > >         };
> > > };
> > >
> > > This made sense to me after implementing the driver, there's muxing to
> > > be done and there's electrical configuration to configure.
> > >
> > > But what's actually trying to describe is a hardware state; i.e. that
> > > miso, mosi, clk and cs should be acting in a particular fashion.
> > >
> > > In particular this lends itself useful when the hardware state consists
> > > of different functions, a good example being the Bluetooth UART, or in
> > > the SPI-with-separate-GPIO:
> > >
> > > the_state: spi-state {
> > >         miso-mosi-clk {
> > >                 pins = "gpio40", gpio41", "gpio42"
> > >                 function = qup14";
> > >                 drive-strength = <6>;
> > >                 bias-disable;
> > >         };
> > >
> > >         cs {
> > >                 pins = "gpio43";
> > >                 function = "gpio";
> > >                 drive-strength = <6>;
> > >                 bias-disable;
> > >         };
> > > };
> > >
> > >
> > > For the case of uniform configuration across the state we've come to
> > > sprinkle a few different synonyms for "pinconf" and "pinmux" in the
> > > state nodes. But a few years ago someone updated the state parser to
> > > handle cases either directly in the state or in subnodes. So we can
> > > avoid these boilerplate nodes with a simple:
> > >
> > > the_state: spi-state {
> > >         pins = "gpio40", gpio41", "gpio42", "gpio43";
> > >         function = qup14";
> > >         drive-strength = <6>;
> > >         bias-disable;
> > > };
> >
> > OK, this makes sense to me.  I always felt like the extra "pinconf" /
> > "pinmux" made things awkward.
>
> I'm happy to hear that :)
>
> > I guess someone should try to convert some SoC dtsi fully over so we
> > can see how it looks?
>
> Sounds good. I feel fairly confident, so let's pick SM8250 and aim to
> land this patch in the "new" form.

OK. As a starting bit I will convert SPI pinctrl for now with the rest
of pins to follow.

>
> > In this case I think you'd have something like this, right?
> >
> > SoC dtsi:
> >
> > tlmm: pinctrl@... {
> >   qup_spi0_data_clk: qup-spi0-data-clk {
> >     pins = "gpio28", "gpio29", "gpio30";
> >     function = "qup0";
> >   };
> >
> >   qup_spi0_cs: qup-spi0-cs {
> >     pins = "gpio31";
> >     function = "qup0";
> >   };
> >
> >   qup_spi0_cs_gpio: qup-spi0-cs-gpio {
> >     pins = "gpio31";
> >     function = "gpio";
> >   };
> > };
> >
> > Board dts:
> >
> > &spi0 {
> >   pinctrl-0 = <&qup_spi0_data_clk>, &<qup_spi0_cs_gpio>;
> > };
> >
> > &qup_spi0_data_clk {
> >   drive-strength = <6>;
> >   bias-disable;
> > };
> >
> > &qup_spi0_cs_gpio {
> >   drive-strength = <6>;
> >   bias-disable;
> > };
>
> Correct. And providing a common state for the 3 non-cs pins and using
> the pinctrl-0 to select which kind of cs we want looks even better.
>
> Regards,
> Bjorn



-- 
With best wishes
Dmitry
