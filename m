Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C62EE4E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 17:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbfKDQl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 11:41:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:35352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728322AbfKDQl1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 11:41:27 -0500
Received: from localhost (host6-102.lan-isdn.imaginet.fr [195.68.6.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ADDB20663;
        Mon,  4 Nov 2019 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572885686;
        bh=/Rvgp2d7W+mkkoTIM0LPd9nYN7M9Kdt2YVgFzxeEai4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OssM3MIm+0cTRCds0C8iQVCssXHvZZ+3MscLziQ7QRPsXuv4czERjfsfy1EVKmDKV
         k6INEG6f0eFbvqmN4AAhE1jjA58kOsJyxIN1lsw8CHFWIj4Ca0fkjYawsJG0dEkBDc
         aTfCcvws6ejEvXDGjVhW9/lZ9m8QHChEPbR/9OII=
Date:   Mon, 4 Nov 2019 17:41:23 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, jslaby@suse.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix flow control
Message-ID: <20191104164123.GA2256087@kroah.com>
References: <20191021154616.25457-1-jeffrey.l.hugo@gmail.com>
 <20191027055528.GJ5514@hector.lan>
 <CAOCk7Nptm=Cz17FFKKvsgVxXRgJ-m9zK4RKysqhjb4cwPweSXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Nptm=Cz17FFKKvsgVxXRgJ-m9zK4RKysqhjb4cwPweSXg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 03, 2019 at 02:51:17PM -0700, Jeffrey Hugo wrote:
> On Sat, Oct 26, 2019 at 11:55 PM Andy Gross <agross@kernel.org> wrote:
> >
> > On Mon, Oct 21, 2019 at 08:46:16AM -0700, Jeffrey Hugo wrote:
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
> > > Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> >
> > Reviewed-by: Andy Gross <agross@kernel.org>
> >
> > Greg, can you pick this one up?
> >
> > Thanks,
> > Andy
> 
> Greg, will this be queued for 5.5?

Yes, catching up now...
