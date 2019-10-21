Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 722AADF122
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 17:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfJUPT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 11:19:59 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:38719 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfJUPT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 11:19:59 -0400
Received: by mail-il1-f194.google.com with SMTP id y5so12354750ilb.5;
        Mon, 21 Oct 2019 08:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xLL1nfViFXwf0+HwQK45ez+OrC2Byurm1xesO5A4nM4=;
        b=sJUTMuk44mxHc3/Wn/RyybUNxbnVUiSb8MwC55wMO5kKb+AeXBTfYBVbY3tV6ek3ea
         2qY8JvVnVwxeEnru7hY4DySpMHx2u0sL4gaq1Cip3OtAv1QD4jhJOsf0nJMqWNaKtmyp
         IhjtPbGCzBJfNI2tK3bCCVY2drCyjYAcH4aat0rjI8QjSp75Q8yWYeTSovJLuv0i6YYn
         2lrs5NGanGtaA3BPkXR/Dk9yzss/CdiD0FApa2QY1ywzvLOomaU2SIW/dkqBUcNYczGc
         5Zw7QQPsrkibcLQvDq1lU+AT0GwzcwNZXRXAZzYEJkZMBC0DSR+RzaLigJf0aHfdPF5O
         5Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xLL1nfViFXwf0+HwQK45ez+OrC2Byurm1xesO5A4nM4=;
        b=tyaqaSWFF2FdxqmylLDB5GznOrWL6HHZq7rivchZhemheKYaJ5jszvN9fEzKbTZX+t
         GTYyEAc1jqbVVQ3pi87FXRs3Mmu7Jwr5dF9HT7U/ZlVqSb+YnrgNznXn2bwE/nxbFSu8
         3teDlEr3HKSqpNpGB45CMVRRmASLAuRpvNut8oKZpaK0bzTKBulBvfcjqMm6jRVwqeIH
         OQveh8kAfiHqZiL90KKtxFM+QRp91bO4q4uSTsLKGvtMN31zZ6AF7Uf1kd83hz/0pLhI
         7MvqAejRJJf4W/McmhcU8fh+jVe3PJm4J/MLp55LJRSqH65co8GBATMyZvhIm8UIpv8B
         wG8g==
X-Gm-Message-State: APjAAAVXWo1hzeJ+KIagjGHEzdZ0qkbbxJlRUfbku4WFWaSvSiQxfskZ
        RxEeBy1kmIxOO9ZzUfPyXhA+qtQVRewqaKaLOVOAug==
X-Google-Smtp-Source: APXvYqziZ1lgVHlpifILbY1zB7ipIQCb3zhLo1MSYbA47FVGtC8RXqYUvdhlht6pMel3T3WWGEZCSEFfMyrKl3OGTWc=
X-Received: by 2002:a92:1d51:: with SMTP id d78mr4143077ild.166.1571671198082;
 Mon, 21 Oct 2019 08:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191019210616.41199-1-jeffrey.l.hugo@gmail.com> <20191020062816.GE1669@tuxbook-pro>
In-Reply-To: <20191020062816.GE1669@tuxbook-pro>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 21 Oct 2019 09:19:47 -0600
Message-ID: <CAOCk7NpvXb3zBAM1DQng3sQWgWXc5AP2vo=i+gX0mQtA2W7QWg@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: msm_serial: Fix flow control
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jslaby@suse.com, MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 20, 2019 at 12:28 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 19 Oct 14:06 PDT 2019, Jeffrey Hugo wrote:
>
> > hci_qca interfaces to the wcn3990 via a uart_dm on the msm8998 mtp and
> > Lenovo Miix 630 laptop.  As part of initializing the wcn3990, hci_qca
> > disables flow, configures the uart baudrate, and then reenables flow - at
> > which point an event is expected to be received over the uart from the
> > wcn3990.  It is observed that this event comes after the baudrate change
> > but before hci_qca re-enables flow. This is unexpected, and is a result of
> > msm_reset() being broken.
> >
> > According to the uart_dm hardware documentation, it is recommended that
> > automatic hardware flow control be enabled by setting RX_RDY_CTL.  Auto
> > hw flow control will manage RFR based on the configured watermark.  When
> > there is space to receive data, the hw will assert RFR.  When the watermark
> > is hit, the hw will de-assert RFR.
> >
> > The hardware documentation indicates that RFR can me manually managed via
> > CR when RX_RDY_CTL is not set.  SET_RFR asserts RFR, and RESET_RFR
> > de-asserts RFR.
> >
> > msm_reset() is broken because after resetting the hardware, it
> > unconditionally asserts RFR via SET_RFR.  This enables flow regardless of
> > the current configuration, and would undo a previous flow disable
> > operation.  It should instead de-assert RFR via RESET_RFR to block flow
> > until the hardware is reconfigured.  msm_serial should rely on the client
> > to specify that flow should be enabled, either via mctrl() or the termios
> > structure, and only assert RFR in response to those triggers.
> >
>
> I traced msm_reset() and msm_set_mctrl() and I get the following:
>        swapper/0-1     [000] d..1     3.091726: msm_set_mctrl: msm_set_mctrl() reset rfr
>        swapper/0-1     [000] d..1     3.117046: msm_set_mctrl: msm_set_mctrl() reset rfr
>        swapper/0-1     [000] d..1     3.125484: msm_set_termios: msm_reset() set rfr
>        swapper/0-1     [003] d..1     4.491430: msm_set_termios: msm_reset() set rfr
>        swapper/0-1     [003] d..1     4.491733: msm_set_mctrl: msm_set_mctrl() auto rfr
>            login-313   [001] d..1    78.010785: msm_set_mctrl: msm_set_mctrl() reset rfr
>            login-313   [001] d..1    78.011007: msm_set_termios: msm_reset() set rfr
>            login-313   [001] d..1    78.011021: msm_set_mctrl: msm_set_mctrl() auto rfr
>            login-313   [001] d..1    78.063330: msm_set_termios: msm_reset() set rfr
>            login-313   [001] d..1    78.063641: msm_set_termios: msm_reset() set rfr
>
> So while your change does make sense for BT, wouldn't this mean that
> with your patch and a 4-pin UART for the console I would end this dance
> with receive flow blocked?

No.  I don't think it occurred to you to consider how RX_RDY_CTL
factors into this.  RX_RDY_CTL allows the hardware to enable flow when
the hardware determines it is able to receive data.  RX_RDY_CTL gets
set in mctrl, and set_termios - essentially when the uart client has
indicated flow can be enabled.

Even though the console is a 2 wire console on msm8998, the driver
will go through the same flow.  I verified that RX_RDY_CTL is set on
the console uart after boot, so we won't end up with flow blocked.

However, this does bring up another issue.  RX_RDY_CTL doesn't get
unset in msm_reset.  RESET_RX will disable the rx path in the
hardware, and prevent RX_RDY_CTL from being active, but the rx path is
enabled in set_baud_rate() before RX_RDY_CTL can be masked out in
set_termios, so there may be a small window where flow can
inadvertently enabled.  I'll spin a v2 that also unsets RX_RDY_CTL in
msm_reset().

>
> Regards,
> Bjorn
>
> > Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/tty/serial/msm_serial.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> > index 3657a24913fc..aedabf7646f1 100644
> > --- a/drivers/tty/serial/msm_serial.c
> > +++ b/drivers/tty/serial/msm_serial.c
> > @@ -987,7 +987,7 @@ static void msm_reset(struct uart_port *port)
> >       msm_write(port, UART_CR_CMD_RESET_ERR, UART_CR);
> >       msm_write(port, UART_CR_CMD_RESET_BREAK_INT, UART_CR);
> >       msm_write(port, UART_CR_CMD_RESET_CTS, UART_CR);
> > -     msm_write(port, UART_CR_CMD_SET_RFR, UART_CR);
> > +     msm_write(port, UART_CR_CMD_RESET_RFR, UART_CR);
> >
> >       /* Disable DM modes */
> >       if (msm_port->is_uartdm)
> > --
> > 2.17.1
> >
