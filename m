Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AC2313CAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbhBHSIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbhBHSF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:05:59 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA951C06178B
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 10:04:47 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id k10so12664746otl.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 10:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s0RIoB1WAQe/tEigFmwUYum/yUBo+ij598mpG26j+5M=;
        b=GefWkzc5q7nF//IW8dHNFJ6oekSNOcVbMpt/m9OyvEm1hgR3CVrWmBRplWRn7Za1kU
         JaFahqChKJudbL92hSzPX9ql68ESi6ylCBr/J3ZauuPnLCaz9QBl4E6lJkThhyoujBDM
         qMQyeK4hm7xlLtJiL43CA3u9Xnw2vU+RsnfPB8yUXq8nSTO4+zpGbUKrrWHolArYJtuK
         WNJcfNQn0/okHc4BVIU+OuHbCjZ7wNQoVxhhdp7ERkMkap6h3akrrqZSD0ra3gyWHHMF
         iWpjGr+yXneNOwLzTCModqi6CwdzNTKCarxpO94D/j/lxJultHTRyM7+fc8M1rVLc4Tt
         m9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s0RIoB1WAQe/tEigFmwUYum/yUBo+ij598mpG26j+5M=;
        b=V+C9T9dVU+nsRjtTwspfik7NA+E/KFEyRzwzKZd+amovGzydfsjycFgJQk6PNcIqOp
         qoQ/v1iLcWh3jYwW6DsZFfEyzPOBtJKkjfiZdAVXW9Z6R+Tu11NBsu2KF5c9bAeRfQ+x
         vPT1B+Mu9iFbBB3Rj46Avb+XQNQaROa4AKQkYup+5PWDTeaMLkH9/uNA7sId9W/h6yGY
         0d/gtR8aRsljFJWOGKYIfmxBvp0fIp2jPsVdJR4hofGIcp3wfK0i0nQBw/ukrGHLVqGL
         eyv0+UciAFP/AixSHsXrpWZ1uASODaI0AxUdlhUFLUAsUeJ/XFfoWoatQI/XvM3wjT2p
         ZDMg==
X-Gm-Message-State: AOAM5309bWDHRaEe/Q2Du6ON79UnuGSROC6vE1/zy35rAw82rL7kZWBD
        UeeBb/+5wk+3+nxBB+rJZipXzErQSerYTQ==
X-Google-Smtp-Source: ABdhPJzb+I/DjZSGmQeEQpz5MrORann8MfWst3vtPIDE+lx/6Piwt7SSwY+PkCGUZ8cH1vt16Q3yHw==
X-Received: by 2002:a05:6830:19e7:: with SMTP id t7mr3702796ott.211.1612807486542;
        Mon, 08 Feb 2021 10:04:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w196sm2040111oif.12.2021.02.08.10.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:04:45 -0800 (PST)
Date:   Mon, 8 Feb 2021 12:04:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
Message-ID: <YCF9PKJl0HZrKBz1@builder.lan>
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
 <YBx+LcgrbyUKpYig@builder.lan>
 <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
 <YByQizVTnj2uTNt2@builder.lan>
 <CAD=FV=UYmv-PH-m4T6RcuW1JuQ-fCZ2Lg6gCCUJ5xquT1NP1jA@mail.gmail.com>
 <YB122qwCSdQka5jw@builder.lan>
 <CAD=FV=UY_AFRrAY0tef5jP698LEng6oN652LcX3B4nG=aWh0gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UY_AFRrAY0tef5jP698LEng6oN652LcX3B4nG=aWh0gA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 08 Feb 09:58 CST 2021, Doug Anderson wrote:

> Hi,
> 
> On Fri, Feb 5, 2021 at 8:48 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Fri 05 Feb 09:00 CST 2021, Doug Anderson wrote:
> >
> > > Hi,
> > >
> > > On Thu, Feb 4, 2021 at 4:25 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > > > > +                             mux {
> > > > > >
> > > > > > Rather than splitting the properties in {mux, cs, config} I think it
> > > > > > makes more sense to split them in {spi, cs} or something like that.
> > > > >
> > > > > In general pinconf doesn't belong in the SoC dts file.  If there's no
> > > > > reason to change it seems like this should match what sc7180 did.
> > > > >
> > > >
> > > > Right, but I still would prefer the pinctrl state to be split by
> > > > function/pins, rather than pinmux vs pinconf. That way it's natural to
> > > > add pinconf properties to the various functional parts (i.e. bias or
> > > > drive-strength for the spi pins vs cs).
> > > >
> > > > Do you have any concerns with this?
> > >
> > > I read this a few times and I'm not exactly sure what you're
> > > proposing.  Can you provide an example of what you want it to look
> > > like in this case?
> > >
> >
> > Today in most cases we group pinctrl properties by being a "conf" of a
> > "mux" property, so we end up with:
> >
> > the_state: spi-state {
> >         all-the-mux-properties {
> >                 pins = "gpio40", gpio41", "gpio42", "gpio43";
> >                 function = qup14";
> >         };
> >
> >         repeat-pins-and-add-all-conf-properties {
> >                 pins = "gpio40", gpio41", "gpio42", "gpio43";
> >                 drive-strength = <6>;
> >                 bias-disable;
> >         };
> > };
> >
> > This made sense to me after implementing the driver, there's muxing to
> > be done and there's electrical configuration to configure.
> >
> > But what's actually trying to describe is a hardware state; i.e. that
> > miso, mosi, clk and cs should be acting in a particular fashion.
> >
> > In particular this lends itself useful when the hardware state consists
> > of different functions, a good example being the Bluetooth UART, or in
> > the SPI-with-separate-GPIO:
> >
> > the_state: spi-state {
> >         miso-mosi-clk {
> >                 pins = "gpio40", gpio41", "gpio42"
> >                 function = qup14";
> >                 drive-strength = <6>;
> >                 bias-disable;
> >         };
> >
> >         cs {
> >                 pins = "gpio43";
> >                 function = "gpio";
> >                 drive-strength = <6>;
> >                 bias-disable;
> >         };
> > };
> >
> >
> > For the case of uniform configuration across the state we've come to
> > sprinkle a few different synonyms for "pinconf" and "pinmux" in the
> > state nodes. But a few years ago someone updated the state parser to
> > handle cases either directly in the state or in subnodes. So we can
> > avoid these boilerplate nodes with a simple:
> >
> > the_state: spi-state {
> >         pins = "gpio40", gpio41", "gpio42", "gpio43";
> >         function = qup14";
> >         drive-strength = <6>;
> >         bias-disable;
> > };
> 
> OK, this makes sense to me.  I always felt like the extra "pinconf" /
> "pinmux" made things awkward.

I'm happy to hear that :)

> I guess someone should try to convert some SoC dtsi fully over so we
> can see how it looks?

Sounds good. I feel fairly confident, so let's pick SM8250 and aim to
land this patch in the "new" form.

> In this case I think you'd have something like this, right?
> 
> SoC dtsi:
> 
> tlmm: pinctrl@... {
>   qup_spi0_data_clk: qup-spi0-data-clk {
>     pins = "gpio28", "gpio29", "gpio30";
>     function = "qup0";
>   };
> 
>   qup_spi0_cs: qup-spi0-cs {
>     pins = "gpio31";
>     function = "qup0";
>   };
> 
>   qup_spi0_cs_gpio: qup-spi0-cs-gpio {
>     pins = "gpio31";
>     function = "gpio";
>   };
> };
> 
> Board dts:
> 
> &spi0 {
>   pinctrl-0 = <&qup_spi0_data_clk>, &<qup_spi0_cs_gpio>;
> };
> 
> &qup_spi0_data_clk {
>   drive-strength = <6>;
>   bias-disable;
> };
> 
> &qup_spi0_cs_gpio {
>   drive-strength = <6>;
>   bias-disable;
> };

Correct. And providing a common state for the 3 non-cs pins and using
the pinctrl-0 to select which kind of cs we want looks even better.

Regards,
Bjorn
