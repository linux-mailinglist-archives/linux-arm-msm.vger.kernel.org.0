Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1425DDF2E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 18:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfJUQY5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 12:24:57 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45576 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbfJUQY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 12:24:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id y72so8717162pfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q/traTAzUCkMoaq6gCxr6p0QNW1dzGwjW0hCS/Ckn1Y=;
        b=edd0nwuTBmd/YbwPiwvl4aTbWbu2IiLCjnRcCWXN5zWWTLFjuz+J1P06T8W09JiyIO
         YCzUZYfLqAp/FtUd5CC2qr8ecBiutE64OK1pi7nHxsXTkfhdGJA4fcFGWVQT0+vNsdn6
         lEP36KhXDY877zqGLUhx1BbPJBtRZ4p/aFWZ2g+98yca3UOuQTbojC5VxYXuDNhoJHfa
         IQiWw7qfe45q+rGOn+t9oiXPZuWskJIGjWbpQ3lahHuPfs+bNBIwXUXnA3Nau5QjU2cY
         tJrOYelb+1Yojksra2akGeD3qarhMi4rvDhC7fDrgdHhxaMt52Bz90B1uGkglqt050Ko
         mHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q/traTAzUCkMoaq6gCxr6p0QNW1dzGwjW0hCS/Ckn1Y=;
        b=CRxfie2Flgvmp69KmcwuJJB5AuYpoYsQcgFhj/st52+V1vryTUuePfjkfHlBUefVzv
         pFBwXAB4Jvz1QfIgirpiDmlYH//HjR+H6anHRQhEqNqETimRRHf6VRGfw94MguxR5Osk
         z1GC0ptNIBkW4v1l3KplfRmDYu/7ztDwAbv2JidRTYNNyCzHhXeQL5VpbT2wvJjidZOH
         C3iDAeeI4L3xCi6Gr1zW3ejpfD3E0nvTF2ep9zO3m60cBXf8NxyO6EuIvO15iYt7B8rA
         Zs8nv/MpM0QIY41oQzpwzby6LLdGWGjeCBnXJEZTHLnF9IwK06xa0oYk0qewBc5g/y+Q
         kMpQ==
X-Gm-Message-State: APjAAAXLAcWT9Bx5rvK6EFpVMNrwOcIZ4QLiU6Nl58WH9bwjAD/Zp4t2
        wFFQEy0q8Ld0TfRc8no09OM1ng==
X-Google-Smtp-Source: APXvYqwADvFpQj9Hwz44alQIvmrEfjbMOc3EqzFpa+C8H+uyNKvvFbsztZdImX96dzLDDaKRI6UBRw==
X-Received: by 2002:a65:4c03:: with SMTP id u3mr26669120pgq.440.1571675095108;
        Mon, 21 Oct 2019 09:24:55 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d5sm15042362pjw.31.2019.10.21.09.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 09:24:54 -0700 (PDT)
Date:   Mon, 21 Oct 2019 09:24:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jslaby@suse.com, MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tty: serial: msm_serial: Fix flow control
Message-ID: <20191021162452.GB1204@tuxbook-pro>
References: <20191019210616.41199-1-jeffrey.l.hugo@gmail.com>
 <20191020062816.GE1669@tuxbook-pro>
 <CAOCk7NpvXb3zBAM1DQng3sQWgWXc5AP2vo=i+gX0mQtA2W7QWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NpvXb3zBAM1DQng3sQWgWXc5AP2vo=i+gX0mQtA2W7QWg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Oct 08:19 PDT 2019, Jeffrey Hugo wrote:

> On Sun, Oct 20, 2019 at 12:28 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Sat 19 Oct 14:06 PDT 2019, Jeffrey Hugo wrote:
> >
> > > hci_qca interfaces to the wcn3990 via a uart_dm on the msm8998 mtp and
> > > Lenovo Miix 630 laptop.  As part of initializing the wcn3990, hci_qca
> > > disables flow, configures the uart baudrate, and then reenables flow - at
> > > which point an event is expected to be received over the uart from the
> > > wcn3990.  It is observed that this event comes after the baudrate change
> > > but before hci_qca re-enables flow. This is unexpected, and is a result of
> > > msm_reset() being broken.
> > >
> > > According to the uart_dm hardware documentation, it is recommended that
> > > automatic hardware flow control be enabled by setting RX_RDY_CTL.  Auto
> > > hw flow control will manage RFR based on the configured watermark.  When
> > > there is space to receive data, the hw will assert RFR.  When the watermark
> > > is hit, the hw will de-assert RFR.
> > >
> > > The hardware documentation indicates that RFR can me manually managed via
> > > CR when RX_RDY_CTL is not set.  SET_RFR asserts RFR, and RESET_RFR
> > > de-asserts RFR.
> > >
> > > msm_reset() is broken because after resetting the hardware, it
> > > unconditionally asserts RFR via SET_RFR.  This enables flow regardless of
> > > the current configuration, and would undo a previous flow disable
> > > operation.  It should instead de-assert RFR via RESET_RFR to block flow
> > > until the hardware is reconfigured.  msm_serial should rely on the client
> > > to specify that flow should be enabled, either via mctrl() or the termios
> > > structure, and only assert RFR in response to those triggers.
> > >
> >
> > I traced msm_reset() and msm_set_mctrl() and I get the following:
> >        swapper/0-1     [000] d..1     3.091726: msm_set_mctrl: msm_set_mctrl() reset rfr
> >        swapper/0-1     [000] d..1     3.117046: msm_set_mctrl: msm_set_mctrl() reset rfr
> >        swapper/0-1     [000] d..1     3.125484: msm_set_termios: msm_reset() set rfr
> >        swapper/0-1     [003] d..1     4.491430: msm_set_termios: msm_reset() set rfr
> >        swapper/0-1     [003] d..1     4.491733: msm_set_mctrl: msm_set_mctrl() auto rfr
> >            login-313   [001] d..1    78.010785: msm_set_mctrl: msm_set_mctrl() reset rfr
> >            login-313   [001] d..1    78.011007: msm_set_termios: msm_reset() set rfr
> >            login-313   [001] d..1    78.011021: msm_set_mctrl: msm_set_mctrl() auto rfr
> >            login-313   [001] d..1    78.063330: msm_set_termios: msm_reset() set rfr
> >            login-313   [001] d..1    78.063641: msm_set_termios: msm_reset() set rfr
> >
> > So while your change does make sense for BT, wouldn't this mean that
> > with your patch and a 4-pin UART for the console I would end this dance
> > with receive flow blocked?
> 
> No.  I don't think it occurred to you to consider how RX_RDY_CTL
> factors into this.  RX_RDY_CTL allows the hardware to enable flow when
> the hardware determines it is able to receive data.  RX_RDY_CTL gets
> set in mctrl, and set_termios - essentially when the uart client has
> indicated flow can be enabled.
> 

I see, so per above trace when login does it's rfr toggling RX_RDY_CTL
is already set (and will be maintained), so we'll allow flow at each
part of the process.

> Even though the console is a 2 wire console on msm8998, the driver
> will go through the same flow.  I verified that RX_RDY_CTL is set on
> the console uart after boot, so we won't end up with flow blocked.
> 
> However, this does bring up another issue.  RX_RDY_CTL doesn't get
> unset in msm_reset.  RESET_RX will disable the rx path in the
> hardware, and prevent RX_RDY_CTL from being active, but the rx path is
> enabled in set_baud_rate() before RX_RDY_CTL can be masked out in
> set_termios, so there may be a small window where flow can
> inadvertently enabled.  I'll spin a v2 that also unsets RX_RDY_CTL in
> msm_reset().
> 

Yes, that sounds reasonable. And for the console case the difference
will be that we deassert RFR while the serial is being reset and
reconfigured; which sounds like the right thing to do.

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > > Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> > >  drivers/tty/serial/msm_serial.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> > > index 3657a24913fc..aedabf7646f1 100644
> > > --- a/drivers/tty/serial/msm_serial.c
> > > +++ b/drivers/tty/serial/msm_serial.c
> > > @@ -987,7 +987,7 @@ static void msm_reset(struct uart_port *port)
> > >       msm_write(port, UART_CR_CMD_RESET_ERR, UART_CR);
> > >       msm_write(port, UART_CR_CMD_RESET_BREAK_INT, UART_CR);
> > >       msm_write(port, UART_CR_CMD_RESET_CTS, UART_CR);
> > > -     msm_write(port, UART_CR_CMD_SET_RFR, UART_CR);
> > > +     msm_write(port, UART_CR_CMD_RESET_RFR, UART_CR);
> > >
> > >       /* Disable DM modes */
> > >       if (msm_port->is_uartdm)
> > > --
> > > 2.17.1
> > >
