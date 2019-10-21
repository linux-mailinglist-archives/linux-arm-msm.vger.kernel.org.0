Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB0BDF6BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 22:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730243AbfJUU26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 16:28:58 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36733 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730052AbfJUU26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 16:28:58 -0400
Received: by mail-io1-f68.google.com with SMTP id b136so17586261iof.3;
        Mon, 21 Oct 2019 13:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d6Qjgw1Myl3pd7xhfYu5fxr7CWg3brKLe4OgKk4NnfI=;
        b=RHNo45MQ/BxgzvDPYbFgmQqQcFpQUif7FGVtjKTpyKjXPpYayC3Q8JjW9D1YXORoXZ
         SPxPPIAybNcp6t4yfBPL53QLmh//M/YU6H8+eTZeIrebXDsefisRECkp2O4sD0HoNMeG
         WsUFGdjac4KzMikGpbDeBt0xs2LCFT2R2Mk6sDoufmMuIWI2go3FLDID3ImKZkiaDI2o
         E/DvPSOAtrlQUXf9kYERpak1xE1c5bLZnTrwrmsIc1uRLkjVc25c/jGgwCkzuyHznDQb
         P5LlE1A0Gr9o2Igy1g1R8Qza9rMiY1Hnij76FK4pR/+4xyM5Gfe2aVxGfqgUtOXbZuKb
         KezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d6Qjgw1Myl3pd7xhfYu5fxr7CWg3brKLe4OgKk4NnfI=;
        b=eBMpq2DBN5qfffiPUDZWsmxSdC4MIjRxYm/WQORWZguJntW/V215zpPAsMgAGJj0Wf
         UDwE88OjJFArC9+d9fPb+UZrLwUm7QwNAMXPZVoV9StJBQpgEUaQkmCjnzDiRkORKP2O
         Q1wLo0ol2xEL+UBkP5I+Aj2KRepRIy4o9DQ3zToVpGkoILlbzjg/1T3sdkEHftYcpgY6
         3pYgTKqeVbtt4ym8o0UrED4S+03OapTWaJVNNbNcGIv2bKEWDvwc6BmO7c6x7mFG+TAy
         9OjaoIiZJNpPQdN7RC8R9p5vll+10n2/g+znkAlr8POuv2W/CEdZMZgiOQPD8nAEtSgk
         oucg==
X-Gm-Message-State: APjAAAVlc1u6DyNxUfHRzqBa8fdkP4RW4J9JeQBvUrNlnUpdVXHTzyc0
        eDhSslPKEeoy9Nm5yTcoxVQ+gle/1q7usYiaWd8=
X-Google-Smtp-Source: APXvYqwM2f+dfj4H/KVqp0wga3HX19bNWNB509Lqifaw3bELPmZnTFbqdANNwSujLC4aegWa8Fg/JBLjk7PqKUTaTjE=
X-Received: by 2002:a02:334e:: with SMTP id k14mr171732jak.19.1571689737526;
 Mon, 21 Oct 2019 13:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191021161921.31825-1-jeffrey.l.hugo@gmail.com> <20191021195851.GG20212@google.com>
In-Reply-To: <20191021195851.GG20212@google.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 21 Oct 2019 14:28:46 -0600
Message-ID: <CAOCk7NpkStP7MNAPtEPZwe=otZAKFa7YAc-A=+_ad4yy6O_RVQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998: Fixup uart3 gpio config for bluetooth
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 1:58 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Mon, Oct 21, 2019 at 09:19:21AM -0700, Jeffrey Hugo wrote:
> > It turns out that the wcn3990 can float the gpio lines during bootup, etc
> > which will result in the uart core thinking there is incoming data.  This
> > results in the bluetooth stack getting garbage.  By applying a bias to
> > match what wcn3990 would drive, the issue is corrected.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >
> > v2:
> > -split out pinctrl config by pin
> >
> >  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 22 ++++++++++++++++
> >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     | 22 ++++++++++++++++
> >  arch/arm64/boot/dts/qcom/msm8998-pins.dtsi    | 25 ++++++++++++++++---
> >  3 files changed, 65 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> > index 38a1c2ba5e83..8c9a3e0f3843 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> > @@ -37,6 +37,28 @@
> >       };
> >  };
> >
> > +&blsp1_uart3_on {
> > +     rx {
> > +             /delete-property/ bias-disable;
> > +             /*
> > +              * Configure a pull-up on 45 (RX). This is needed to
> > +              * avoid garbage data when the TX pin of the Bluetooth
> > +              * module is in tri-state (module powered off or not
> > +              * driving the signal yet).
> > +              */
> > +             bias-pull-up;
> > +     };
> > +
> > +     cts {
> > +             /delete-property/ bias-disable;
> > +             /*
> > +              * Configure a pull-down on 47 (CTS) to match the pull
> > +              * of the Bluetooth module.
> > +              */
> > +             bias-pull-down;
> > +     };
> > +};
> > +
> >  &qusb2phy {
> >       status = "okay";
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > index 8adb4969baec..74c14f50b0f6 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > @@ -37,6 +37,28 @@
> >       };
> >  };
> >
> > +&blsp1_uart3_on {
> > +     rx {
> > +             /delete-property/ bias-disable;
> > +             /*
> > +              * Configure a pull-up on 45 (RX). This is needed to
> > +              * avoid garbage data when the TX pin of the Bluetooth
> > +              * module is in tri-state (module powered off or not
> > +              * driving the signal yet).
> > +              */
> > +             bias-pull-up;
> > +     };
> > +
> > +     cts {
> > +             /delete-property/ bias-disable;
> > +             /*
> > +              * Configure a pull-down on 47 (CTS) to match the pull
> > +              * of the Bluetooth module.
> > +              */
> > +             bias-pull-down;
> > +     };
> > +};
> > +
> >  &blsp2_uart1 {
> >       status = "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> > index e32d3ab395ea..7c222cbf19d9 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> > @@ -77,13 +77,30 @@
> >       };
> >
> >       blsp1_uart3_on: blsp1_uart3_on {
> > -             mux {
> > -                     pins = "gpio45", "gpio46", "gpio47", "gpio48";
> > +             tx {
> > +                     pins = "gpio45";
> >                       function = "blsp_uart3_a";
> > +                     drive-strength = <2>;
>
> Should the drive-strength really be configured in the .dtsi
> of the SoC? I think of it as a board specific property, since it
> depends on what is on the other end of the UART.

I'm mostly waiting to see what Bjorn would like, but I see some value
in providing decent, sane defaults to work with to start.  The
documentation I see indicates that the uart function isn't expected to
exceed a 2mA sink/source drive.

>
> > +                     bias-disable;
>
> This seems reasonable since the SoC drives the TX pin.
>
> >               };
> >
> > -             config {
> > -                     pins = "gpio45", "gpio46", "gpio47", "gpio48";
> > +             rx {
> > +                     pins = "gpio46";
> > +                     function = "blsp_uart3_a";
> > +                     drive-strength = <2>;
>
> 'drive-strength' shouldn't be needed for an input pin

The hardware always configures a drive strength, its also indicates
how much the SoC is willing to sink.

>
> > +                     bias-disable;
>
> In case of the input pins I'm not sure if this should/needs to be in
> the .dtsi of the SoC. If it isn't really needed it would allow to
> remove the '/delete-property/ bias-disable;' entries in the board
> files.
>
> > +             };
> > +
> > +             cts {
> > +                     pins = "gpio47";
> > +                     function = "blsp_uart3_a";
> > +                     drive-strength = <2>;
>
> 'drive-strength' shouldn't be needed for an input pin
>
> > +                     bias-disable;
> > +             };
> > +
> > +             rfr {
> > +                     pins = "gpio48";
> > +                     function = "blsp_uart3_a";
> >                       drive-strength = <2>;
> >                       bias-disable;
> >               };
> > --
> > 2.17.1
> >
