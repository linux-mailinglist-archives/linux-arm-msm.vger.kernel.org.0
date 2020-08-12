Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813CF242646
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 09:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgHLHsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 03:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgHLHsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 03:48:36 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F4EC061787
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 00:48:36 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ha11so702219pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=KTY6E9EVfwxFH+lp08OJJUX8o/dr7fQk6J9HS9nxRwY=;
        b=gn7CZkOIuJMixVe5myVVYtKh5wsKgw6Mw+WtgHfkq5KlXq1Ln1ESbPEmGn4I+X8nJ9
         CxMGPviFfFrv845Y7n9PK5Z6trl2ilu4AXYiqDsG0B04oeZa2BmUuzZPYO0qK/B1wEzq
         8TEdb8x4RwuN/VFK/BdkPcXFANFgWy4pip1kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=KTY6E9EVfwxFH+lp08OJJUX8o/dr7fQk6J9HS9nxRwY=;
        b=KSx5CiVgU4EQd7n9wlX0T9R7eKpDlngtfj+OCMXrhKE7bB/qKsAfFI+taBX+U7reXK
         YFMnvdCgjiKtX9FXKd/cjxQFhwZwDMVgyGyv6EQKQXI+NENIbiXLQIApSHZQHvp39K+S
         DLPe1nEaaXcTShvSFjRjezQ5IgYDGTo7wJN1D4AnRV8QVv2vkgGbpcAh5T2dwVDB2cFP
         A9wOLo7iBMYa9Mqch8G4StwF3lkx0mpdwibF1dko6qvVAaY/tv7DXatmrDnCfH6SryzH
         5qKQptHIsnd5vRNBPG0tQxTAYLH4tyvgTGUj/2xaKj3WGpBn2CMphJBgXSB9aPR9ffnt
         CYFg==
X-Gm-Message-State: AOAM533zYaWNADlYdT4Nc5iLFFd6Ujm7XvGiJUwfaqFsZUTcKvprXy23
        vDg7T4vt5liV8dw2Xkmr+spy4Q==
X-Google-Smtp-Source: ABdhPJyBNVIoMx8Ma9eHKhz3wNMn1SBVaH1raAIR0TwJJcuk/Vk0TdyfJh9F2JGhY4IIPPJoEbhJTA==
X-Received: by 2002:a17:90a:33f0:: with SMTP id n103mr4811111pjb.62.1597218515931;
        Wed, 12 Aug 2020 00:48:35 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id bv17sm1145396pjb.0.2020.08.12.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:48:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4038aa8b67405c89e4917791f147e8fa@codeaurora.org>
References: <4038aa8b67405c89e4917791f147e8fa@codeaurora.org>
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: Add 51.2MHz frequency support
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     gregkh@linuxfoundation.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
To:     skakit@codeaurora.org
Date:   Wed, 12 Aug 2020 00:48:34 -0700
Message-ID: <159721851426.1360974.10266552276322834162@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting skakit@codeaurora.org (2020-08-11 22:44:22)
> Hi Stephen,
>=20
> On 2020-05-31 00:39, Stephen Boyd wrote:
> > Quoting satya priya (2020-05-29 03:14:42)
> >> To support BT use case over UART at baud rate of 3.2 Mbps,
> >> we need SE clocks to run at 51.2MHz frequency. Previously this
> >> frequency was not available in clk src, so, we were requesting
> >> for 102.4 MHz and dividing it internally by 2 to get 51.2MHz.
> >>=20
> >> As now 51.2MHz frequency is made available in clk src,
> >> adding this frequency to UART frequency table.
> >>=20
> >> We will save significant amount of power, if 51.2 is used
> >> because it belongs to LowSVS range whereas 102.4 fall into
> >> Nominal category.
> >>=20
> >> Signed-off-by: satya priya <skakit@codeaurora.org>
> >=20
> > Great commit text! Maybe point to the commit that adds it to the
> > frequency table in the gcc clk driver instead of the patchwork link.
> >=20
> >> ---
> >>=20
> >> Note: This depend on clk patch=20
> >> https://patchwork.kernel.org/patch/11554073/
> >>=20
> >>  drivers/tty/serial/qcom_geni_serial.c | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>=20
> >> diff --git a/drivers/tty/serial/qcom_geni_serial.c=20
> >> b/drivers/tty/serial/qcom_geni_serial.c
> >> index 6119090..168e1c0 100644
> >> --- a/drivers/tty/serial/qcom_geni_serial.c
> >> +++ b/drivers/tty/serial/qcom_geni_serial.c
> >> @@ -141,9 +141,10 @@ static void qcom_geni_serial_stop_rx(struct=20
> >> uart_port *uport);
> >>  static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool =

> >> drop);
> >>=20
> >>  static const unsigned long root_freq[] =3D {7372800, 14745600,=20
> >> 19200000, 29491200,
> >> -                                       32000000, 48000000, 64000000, =

> >> 80000000,
> >> -                                       96000000, 100000000,=20
> >> 102400000,
> >> -                                       112000000, 120000000,=20
> >> 128000000};
> >> +                                       32000000, 48000000, 51200000, =

> >> 64000000,
> >> +                                       80000000, 96000000, 100000000,
> >> +                                       102400000, 112000000,=20
> >> 120000000,
> >> +                                       128000000};
> >=20
> > Will this break sdm845? That clk frequency table hasn't been updated to
> > add 51.2 MHz.
>=20
> No, as the sampling rate in sdm845 is 32, we will not be requesting 51.2 =

> over there.

Ok.

>=20
> >=20
> > Furthermore, it would be nice to get rid of this table and use
> > clk_round_rate() to find a frequency that will work with the requested
> > baud rate. Can we do that instead? That would make it work regardless=20
> > of
> > what the clk driver supports for the particular SoC. Presumably we can
> > just call clk_round_rate() and then make sure it is evenly divisible by
> > the requested rate and then it will be mostly the same as before.
>=20
> Okay.
>=20
> >=20
> > Or if we need to we can keep multiplying the rate 10 or 20 times and
> > test with clk_round_rate() each time and then give up if we don't find =

> > a
> > frequency that will work. The divider value looks like it is 12 bits
> > wide so there are 4095 possible dividers. If we need to loop through=20
> > all
> > possible dividers then it may make sense to register a clk in this
> > driver and have it call divider_round_rate() to find the closest rate=20
> > to
> > the desired rate. That would avoid reinventing a bunch of code that we
> > already have to implement clk dividers.
> >=20
>=20
> If i understand correctly, clk_round_rate gives the nearest possible=20
> value to the desired clk rate, but i am not very clear about=20
> divider_round_rate API, is it an alternate method to get nearest clk=20
> rate? Also it has few parameters like prate, clk_hw etc which we are not =

> sure of. For now we are planning to post the change for clk_round_rate=20
> API.

The clk_round_rate() API is to tell a consumer what rate they'll get on
a clk if they call clk_set_rate() with the same arguments that they pass
to clk_round_rate(). If this driver implemented a clk provider for
itself then it could hook into the clk_set_rate() and clk_round_rate()
logic and turn whatever 'desired_clk' it is that's passed in into the
rate rounding code that is implemented here.

The idea is that instead of hard coding the frequency table in this
driver, this driver implements a clk_hw for itself. Then that clk_hw
clk_ops implementation asks the parent clk (i.e. the one this driver is
currently clk_get()ing during probe) what frequency it can support if it
uses 'desired_clk * 2' or 'desired_clk * 3', up to how ever many divider
possibilities this uart hardware has. Then when the clk_op
implementation figures out the best rate that the gcc clk can provide it
tells the CCF that the parent rate will be prate =3D desired_clk * N and
then uses N as the divider that this driver controls.

This way everything is generic and we don't have to copy/paste tables
from one place to another. Does it make sense?

>=20
> > And one more thing, I see that this driver doesn't use DFS. Instead it
> > relies on the clk_set_rate() call to change the qup clk frequency. We
> > could support DFS by adding a driver specific member to struct
> > clk_rate_request that can be used to communicate back extra info to the
> > child clk. The idea is that the DFS clk (the qup uart one) can round=20
> > the
> > rate and jam in the DFS index that corresponds to the rate into the new
> > member. Then the clk implemented in this serial driver can stash away
> > that index into some table that maps frequency of parent to DFS index
> > and then look up the DFS index during clk_set_rate() based on the=20
> > parent
> > rate the clk_op is called with to program the DFS value in the uart
> > registers in addition to the divider.
> >=20
> okay will look into this.
>=20
> > ---8<---
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c
> > b/drivers/tty/serial/qcom_geni_serial.c
> > index 6119090ce045..7d147be997e5 100644

Whoa this looks familiar! :)
