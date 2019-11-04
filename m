Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67D93EEACB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 22:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbfKDVNc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 16:13:32 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:36848 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfKDVNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 16:13:32 -0500
Received: by mail-il1-f193.google.com with SMTP id s75so16199093ilc.3;
        Mon, 04 Nov 2019 13:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tsgaFe6O3F9HZDPQl+cHUtlR8dE5IjLELRwmms185QM=;
        b=sJvsUeQSNbKXO2BdG+AasMotpuAjdH+K0vnJm7za0BoPxlQSXSV6p51lUrAxCWNwr+
         ZDt0U8T7WAWTyQ75IWzSWjwktYTqrE+w3YbZHFBhY8Brl5f2z9wCYo71bwrecMUl8sGE
         7gE5UaR5tjpZoSEV6lEi5Hryc+V8Xzn/c60U20PSFFrpaM2F8w8glwnILvqBz7pubiyC
         lSz/NF7s8tRW3/GtVospozxFQaWr2k5VnMHC5x5WtMujW7+s/0bNyKISX6m327vi9qzh
         daErzwIh66FTCq8+bNmbIVRDyYJCGhCr8uH1KLruTSbN8Kgh2d+re1ubnUY2HSJHQyCT
         RWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tsgaFe6O3F9HZDPQl+cHUtlR8dE5IjLELRwmms185QM=;
        b=jtMpFKQNshYVC+o6xVt8XLn5MNUGchMG22b0UfUudBX398czZFNFoRt9W1z3L2y5Vc
         dKXLx8JmGKHhtL8808pwYHDYEWvI9TLa5N20qNVacmOiMPLLzv3LL1Ohb7flDmaWCjBP
         MdLqoauYzU61KgLiGl8TJWISi9sWuH+ImdP6JkmO3JB0mPRwX1BuwNFLTTgF26sAszkX
         U88LNuTq6uYiRT7nQbCEJc8GJzkYjsmlLA1oU0+aBEMh+Nh/FFPJnKIQTeCyxgPnaf9N
         IP0kz09l5//2k/TpkWoTq1tT9p8gfNpc/Gx1EdEOK2JDrcJvz15d/5mnFbffHQpfgSek
         HgPw==
X-Gm-Message-State: APjAAAXFXHl1jAQg/C1deq/ihDDDqobcsRzC+exj7vXtgF16Tp48tGe5
        Bl7gt/2hatrPlEFYbbX/nubDxgLLJAT0+V6pI5E=
X-Google-Smtp-Source: APXvYqwGkV2mIbeBE4+055q/zXhV2WkW7DMbnYN02BINozIY0Gl77rnOoBvxpA0zMFJgHX4oHsPo57TZri8QguJk2TM=
X-Received: by 2002:a05:6e02:c91:: with SMTP id b17mr8393893ile.33.1572902010136;
 Mon, 04 Nov 2019 13:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20191021154616.25457-1-jeffrey.l.hugo@gmail.com>
 <20191027055528.GJ5514@hector.lan> <CAOCk7Nptm=Cz17FFKKvsgVxXRgJ-m9zK4RKysqhjb4cwPweSXg@mail.gmail.com>
 <20191104164123.GA2256087@kroah.com>
In-Reply-To: <20191104164123.GA2256087@kroah.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 4 Nov 2019 14:13:18 -0700
Message-ID: <CAOCk7NpwTdj2qkeBYChhiq7YJ+Yz2g9-GMAx=zxgqeA=w6S9jw@mail.gmail.com>
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix flow control
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, jslaby@suse.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 4, 2019 at 9:41 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Nov 03, 2019 at 02:51:17PM -0700, Jeffrey Hugo wrote:
> > On Sat, Oct 26, 2019 at 11:55 PM Andy Gross <agross@kernel.org> wrote:
> > >
> > > On Mon, Oct 21, 2019 at 08:46:16AM -0700, Jeffrey Hugo wrote:
> > > > hci_qca interfaces to the wcn3990 via a uart_dm on the msm8998 mtp and
> > > > Lenovo Miix 630 laptop.  As part of initializing the wcn3990, hci_qca
> > > > disables flow, configures the uart baudrate, and then reenables flow - at
> > > > which point an event is expected to be received over the uart from the
> > > > wcn3990.  It is observed that this event comes after the baudrate change
> > > > but before hci_qca re-enables flow. This is unexpected, and is a result of
> > > > msm_reset() being broken.
> > > >
> > > > According to the uart_dm hardware documentation, it is recommended that
> > > > automatic hardware flow control be enabled by setting RX_RDY_CTL.  Auto
> > > > hw flow control will manage RFR based on the configured watermark.  When
> > > > there is space to receive data, the hw will assert RFR.  When the watermark
> > > > is hit, the hw will de-assert RFR.
> > > >
> > > > The hardware documentation indicates that RFR can me manually managed via
> > > > CR when RX_RDY_CTL is not set.  SET_RFR asserts RFR, and RESET_RFR
> > > > de-asserts RFR.
> > > >
> > > > msm_reset() is broken because after resetting the hardware, it
> > > > unconditionally asserts RFR via SET_RFR.  This enables flow regardless of
> > > > the current configuration, and would undo a previous flow disable
> > > > operation.  It should instead de-assert RFR via RESET_RFR to block flow
> > > > until the hardware is reconfigured.  msm_serial should rely on the client
> > > > to specify that flow should be enabled, either via mctrl() or the termios
> > > > structure, and only assert RFR in response to those triggers.
> > > >
> > > > Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> > > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > > ---
> > >
> > > Reviewed-by: Andy Gross <agross@kernel.org>
> > >
> > > Greg, can you pick this one up?
> > >
> > > Thanks,
> > > Andy
> >
> > Greg, will this be queued for 5.5?
>
> Yes, catching up now...

Excellent, thank you very much.
