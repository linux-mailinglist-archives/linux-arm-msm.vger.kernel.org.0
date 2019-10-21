Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B66DF706
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 22:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbfJUUva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 16:51:30 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44529 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728914AbfJUUv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 16:51:29 -0400
Received: by mail-pl1-f193.google.com with SMTP id q15so7208827pll.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 13:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S5KlEma+Te0JRIP8bw41KAfW+1DzZQZbAgKyidpuY/k=;
        b=n8sEDm9Ud2OM3iG03bSHy7mXXfIJCx5q1ExBCF2mgcCNUJRxPywDCLiidpw2NTr5j4
         IHh9+x5r/rQe3jT8e/NaJkc1ZgN8OThUm7oiBkeEjbP1Tv1jPpgNF7lwP7w3bCXrqpHF
         c7yfxLE+jer8Ss9LLPLLfqc4asJTqeB/QgkME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S5KlEma+Te0JRIP8bw41KAfW+1DzZQZbAgKyidpuY/k=;
        b=CA1lw69d0nlRb9XWNlP7geAS0fjSqG6wikqy1cCudpw+IhxZrGN+ugBknWarS+TDX8
         ppAHsLa25DRrWQf5AKP2Iclg/0pMWaxCIk5aA16Qhg0eu10IbQ3IjXvQ6NcFGydugtBI
         g7i/6Oc0H7g3cNsEwuBQi39jT4LpUgJmeG/4skdncOgOmJNLyCb511z2NUrC8kSsuoR7
         snbGSc3SZF63GYnyoQWI2J2q5sE1OWRUY49N9W5+asHPLyaIJFZlTRdBqSBZoGPhnGJh
         OldnBvkYq+fjtPpzkpI/orDHWEjwmI5qyVb1f22o5vAq8N3DS3/C1foS78fy/atKnewB
         7Oag==
X-Gm-Message-State: APjAAAVoHDEsxfQfbSTktahyfenis9FzA+Q0JGOzDXp9b8+p6m/1dUz0
        mLaYYVjrszIdwgiEohmLGCu29Q==
X-Google-Smtp-Source: APXvYqwfmG6hfHfwTv2A6q1gev8HkkkIp06vHVx91/hxmM2GEz9z3Imng3gRp2v6Hlm26ZuPv2Ubgw==
X-Received: by 2002:a17:902:6b05:: with SMTP id o5mr26537601plk.33.1571691088730;
        Mon, 21 Oct 2019 13:51:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 22sm16628246pfo.131.2019.10.21.13.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 13:51:28 -0700 (PDT)
Date:   Mon, 21 Oct 2019 13:51:27 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998: Fixup uart3 gpio config
 for bluetooth
Message-ID: <20191021205127.GH20212@google.com>
References: <20191021161921.31825-1-jeffrey.l.hugo@gmail.com>
 <20191021195851.GG20212@google.com>
 <CAOCk7NpkStP7MNAPtEPZwe=otZAKFa7YAc-A=+_ad4yy6O_RVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOCk7NpkStP7MNAPtEPZwe=otZAKFa7YAc-A=+_ad4yy6O_RVQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 02:28:46PM -0600, Jeffrey Hugo wrote:
> On Mon, Oct 21, 2019 at 1:58 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > On Mon, Oct 21, 2019 at 09:19:21AM -0700, Jeffrey Hugo wrote:
> > > It turns out that the wcn3990 can float the gpio lines during bootup, etc
> > > which will result in the uart core thinking there is incoming data.  This
> > > results in the bluetooth stack getting garbage.  By applying a bias to
> > > match what wcn3990 would drive, the issue is corrected.
> > >
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> > >
> > > v2:
> > > -split out pinctrl config by pin
> > >
> > >  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 22 ++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     | 22 ++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/msm8998-pins.dtsi    | 25 ++++++++++++++++---
> > >  3 files changed, 65 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> > > index 38a1c2ba5e83..8c9a3e0f3843 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> > > @@ -37,6 +37,28 @@
> > >       };
> > >  };
> > >
> > > +&blsp1_uart3_on {
> > > +     rx {
> > > +             /delete-property/ bias-disable;
> > > +             /*
> > > +              * Configure a pull-up on 45 (RX). This is needed to
> > > +              * avoid garbage data when the TX pin of the Bluetooth
> > > +              * module is in tri-state (module powered off or not
> > > +              * driving the signal yet).
> > > +              */
> > > +             bias-pull-up;
> > > +     };
> > > +
> > > +     cts {
> > > +             /delete-property/ bias-disable;
> > > +             /*
> > > +              * Configure a pull-down on 47 (CTS) to match the pull
> > > +              * of the Bluetooth module.
> > > +              */
> > > +             bias-pull-down;
> > > +     };
> > > +};
> > > +
> > >  &qusb2phy {
> > >       status = "okay";
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > index 8adb4969baec..74c14f50b0f6 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > @@ -37,6 +37,28 @@
> > >       };
> > >  };
> > >
> > > +&blsp1_uart3_on {
> > > +     rx {
> > > +             /delete-property/ bias-disable;
> > > +             /*
> > > +              * Configure a pull-up on 45 (RX). This is needed to
> > > +              * avoid garbage data when the TX pin of the Bluetooth
> > > +              * module is in tri-state (module powered off or not
> > > +              * driving the signal yet).
> > > +              */
> > > +             bias-pull-up;
> > > +     };
> > > +
> > > +     cts {
> > > +             /delete-property/ bias-disable;
> > > +             /*
> > > +              * Configure a pull-down on 47 (CTS) to match the pull
> > > +              * of the Bluetooth module.
> > > +              */
> > > +             bias-pull-down;
> > > +     };
> > > +};
> > > +
> > >  &blsp2_uart1 {
> > >       status = "okay";
> > >  };
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> > > index e32d3ab395ea..7c222cbf19d9 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> > > @@ -77,13 +77,30 @@
> > >       };
> > >
> > >       blsp1_uart3_on: blsp1_uart3_on {
> > > -             mux {
> > > -                     pins = "gpio45", "gpio46", "gpio47", "gpio48";
> > > +             tx {
> > > +                     pins = "gpio45";
> > >                       function = "blsp_uart3_a";
> > > +                     drive-strength = <2>;
> >
> > Should the drive-strength really be configured in the .dtsi
> > of the SoC? I think of it as a board specific property, since it
> > depends on what is on the other end of the UART.
> 
> I'm mostly waiting to see what Bjorn would like, but I see some value
> in providing decent, sane defaults to work with to start.  The
> documentation I see indicates that the uart function isn't expected to
> exceed a 2mA sink/source drive.

Ok, if it's a requirement of the UART function it seems reasonable to
configure it as default.

> >
> > > +                     bias-disable;
> >
> > This seems reasonable since the SoC drives the TX pin.
> >
> > >               };
> > >
> > > -             config {
> > > -                     pins = "gpio45", "gpio46", "gpio47", "gpio48";
> > > +             rx {
> > > +                     pins = "gpio46";
> > > +                     function = "blsp_uart3_a";
> > > +                     drive-strength = <2>;
> >
> > 'drive-strength' shouldn't be needed for an input pin
> 
> The hardware always configures a drive strength, its also indicates
> how much the SoC is willing to sink.

Thanks, I wasn't aware that the drive-strength also applies to the sink.
