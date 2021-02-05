Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD36311211
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 21:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhBESc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 13:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbhBEPK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 10:10:59 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58246C06178C
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 08:48:30 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id v1so7451456ott.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 08:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yyasxHT43pHcu9V81CQ4K4cVaPX0Ip/S+kmq4LgisAE=;
        b=AcH48casW72FIOpiUzm0+HFFOTZtdAtAL71QXyWUBEr5n5YTqV1uOvGUUdCUWRLHk+
         FccNT1mhZBxO7O8cCtTPfhfAr54CNDeVENfb3KpXT2yePjCul2rHsqX8PqCcI0PT/H04
         3+fHMnkE2KHFgfBXVd63lEufIoR40aV05DjHVHC26FUaGzYmQh4NZ9nm6kkfo29W8TFZ
         sWVKNWnFfvbmc8qxy4D2Xjjw5xOOa2G1h8AHRqYT5YV2gNgJvOIBrU45ZSLWKDpVPrra
         6uKa/uOeVY85zD+TOT2lPxrlkYHYaWhaC8jwL2d3fXiHNALJWHGzNt4uYJSBt6CLcZNu
         rG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yyasxHT43pHcu9V81CQ4K4cVaPX0Ip/S+kmq4LgisAE=;
        b=Eb2nuL5SQ+onIm+mrpK1w+QaogQnlsD6yUZ+3Nzz787lvnU2T47nxr7+9BMDyboNjW
         rUFQFj1wR8k6VUbknqbqR13kWxWh6LNDQGLS0axStL/aBS+c987NCOuiNLu0pNlutV4f
         Lm+ocx1/OYQ5KzQNAfxgMLhrjwRFj7MGdQTK87b2rLCM1Z5ZoPymP5z2TrXHxay5V/HX
         g/jDvKKi4qQQRNLD7yJKBrEPfcXgrMWPj7VqNlypaeiqcsc3XZoeCMf26W34O0Su7/dx
         pxI5ZQBO7BA3uw5Xkckoa2GkuVIF7XzV2qvPvGKGDz5hHbuWpSXdjVhsi1Q+lbN/1CnZ
         XmyQ==
X-Gm-Message-State: AOAM532VFo/eUh/n3F4ucizhehfYRCH8jvCULc9unmxwn9ebxBitV6SV
        m80InQ/PgzyUyh9zb34nITPz6Q==
X-Google-Smtp-Source: ABdhPJw1J0GoAMpPmthhAw3j7fONUpMY56iTea7wBzo1YrehZ8wwnB21ssMx2S1/moPnpqhgEJod8w==
X-Received: by 2002:a05:6830:1289:: with SMTP id z9mr3993113otp.130.1612543709682;
        Fri, 05 Feb 2021 08:48:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 94sm1931740otf.41.2021.02.05.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 08:48:28 -0800 (PST)
Date:   Fri, 5 Feb 2021 10:48:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
Message-ID: <YB122qwCSdQka5jw@builder.lan>
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
 <YBx+LcgrbyUKpYig@builder.lan>
 <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
 <YByQizVTnj2uTNt2@builder.lan>
 <CAD=FV=UYmv-PH-m4T6RcuW1JuQ-fCZ2Lg6gCCUJ5xquT1NP1jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UYmv-PH-m4T6RcuW1JuQ-fCZ2Lg6gCCUJ5xquT1NP1jA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 05 Feb 09:00 CST 2021, Doug Anderson wrote:

> Hi,
> 
> On Thu, Feb 4, 2021 at 4:25 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > > > > +                             mux {
> > > >
> > > > Rather than splitting the properties in {mux, cs, config} I think it
> > > > makes more sense to split them in {spi, cs} or something like that.
> > >
> > > In general pinconf doesn't belong in the SoC dts file.  If there's no
> > > reason to change it seems like this should match what sc7180 did.
> > >
> >
> > Right, but I still would prefer the pinctrl state to be split by
> > function/pins, rather than pinmux vs pinconf. That way it's natural to
> > add pinconf properties to the various functional parts (i.e. bias or
> > drive-strength for the spi pins vs cs).
> >
> > Do you have any concerns with this?
> 
> I read this a few times and I'm not exactly sure what you're
> proposing.  Can you provide an example of what you want it to look
> like in this case?
> 

Today in most cases we group pinctrl properties by being a "conf" of a
"mux" property, so we end up with:

the_state: spi-state {
	all-the-mux-properties {
		pins = "gpio40", gpio41", "gpio42", "gpio43";
		function = qup14";
	};

	repeat-pins-and-add-all-conf-properties {
		pins = "gpio40", gpio41", "gpio42", "gpio43";
		drive-strength = <6>;
		bias-disable;
	};
};

This made sense to me after implementing the driver, there's muxing to
be done and there's electrical configuration to configure.

But what's actually trying to describe is a hardware state; i.e. that
miso, mosi, clk and cs should be acting in a particular fashion.

In particular this lends itself useful when the hardware state consists
of different functions, a good example being the Bluetooth UART, or in
the SPI-with-separate-GPIO:

the_state: spi-state {
	miso-mosi-clk {
		pins = "gpio40", gpio41", "gpio42"
		function = qup14";
		drive-strength = <6>;
		bias-disable;
	};

	cs {
		pins = "gpio43";
		function = "gpio";
		drive-strength = <6>;
		bias-disable;
	};
};


For the case of uniform configuration across the state we've come to
sprinkle a few different synonyms for "pinconf" and "pinmux" in the
state nodes. But a few years ago someone updated the state parser to
handle cases either directly in the state or in subnodes. So we can
avoid these boilerplate nodes with a simple:

the_state: spi-state {
	pins = "gpio40", gpio41", "gpio42", "gpio43";
	function = qup14";
	drive-strength = <6>;
	bias-disable;
};

Regards,
Bjorn
