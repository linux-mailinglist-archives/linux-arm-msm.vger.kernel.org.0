Return-Path: <linux-arm-msm+bounces-33699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C64996CD8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 15:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA75B1C21AA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 13:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90464199FA4;
	Wed,  9 Oct 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3DvLrwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732317C220;
	Wed,  9 Oct 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482122; cv=none; b=mIv18/yCrI/QcQ74Eh4kezwNJ2iKHrM2rV2ZUXp3rodNtXsWISMPCxqG5Tr/FoOqJH07s1E37S88+c6Z0+us8xVc3vScEFNqauYNU3Pwg65skzXFCgPFfc40gUyBWk0ltGGvDLw6v7OOTLF/QtyRSmnzLckNkYlreufCGIm1KOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482122; c=relaxed/simple;
	bh=W5mZ+lQsEIIxs0TPUpj4vctd0nBepzjEDVoahNZU1ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUOxmoDULpX1FjHKMcS5Iey5Z7uqx9i/nYbiZfIJxJN2L9SBhb4yS/GlazQyZePwX0Q+8nP0n8m1yD3yW9DhC0sfcMcum+70bAeq+DP8BkIL12pS23xrvSCSLH5Gxl0uYZwA928kpzefWLKQlozwlhLGCURiMP1oHs8OvGx1qV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3DvLrwr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F22C4CEC3;
	Wed,  9 Oct 2024 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728482122;
	bh=W5mZ+lQsEIIxs0TPUpj4vctd0nBepzjEDVoahNZU1ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3DvLrwr2bMSVVGcMJPMhLJM3IUgCPhvZ3XD5Z96aiGiaZm6ig1yPEGlTNuel3Nop
	 YptOYWplu0oZoiGQAucl1hr3hKUAGuoxBgI3AjZofIpYRjoXiq1La8kHONYuX9j10J
	 DRV6VxzhzpNzPL/qwo3iwzEMRRaDpz8khxfd7Wu2/A1LHp54noExkPIUC0rNK5itGU
	 formmo0lf2AcftUhiuZoC7xZsMBQNPKDxVj6KG8zZ9RgrJtPh5LxBAiUxHyHpddC0G
	 3V3Abs3wtfz8e8VBRD2k4vyESiyOfrHDQiyo0cCqT2dtJRsL1xbtYvA2iMP3C6XyIN
	 29zi4HIRqKUTg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syX9x-000000003R4-1iAY;
	Wed, 09 Oct 2024 15:55:25 +0200
Date: Wed, 9 Oct 2024 15:55:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org,
	Aniket Randive <quic_arandive@quicinc.com>
Subject: Re: [PATCH v2 1/7] serial: qcom-geni: fix premature receiver enable
Message-ID: <ZwaLTRHKXXhq6Qiu@hovoldconsulting.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-2-johan+linaro@kernel.org>
 <CAD=FV=V31VFVoTWstVUnC_qDBmaUCb5Xv7pyUxUto7mquR5U4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=V31VFVoTWstVUnC_qDBmaUCb5Xv7pyUxUto7mquR5U4Q@mail.gmail.com>

On Thu, Oct 03, 2024 at 11:29:58AM -0700, Doug Anderson wrote:
> On Tue, Oct 1, 2024 at 5:51 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > The receiver should not be enabled until the port is opened so drop the
> > bogus call to start rx from the setup code which is shared with the
> > console implementation.
> >
> > This was added for some confused implementation of hibernation support,
> > but the receiver must not be started unconditionally as the port may not
> > have been open when hibernating the system.
> 
> Could you provide a motivation for your patch in the description? Is
> patch needed for something (perhaps a future patch in the series)? Is
> it fixing a bug? Does it save power? Is the call harmless but cleaner
> to get rid of?

I was trying to bring some order to this driver so that the receiver is
enabled when the port is opened and disabled when it is closed again as
expected, and get rid of the random calls added in places where they do
not belong (e.g., as Bjorn also mentioned, why was the call to start rx
added in the port setup code if it was needed for hibernation?).

Data "received" over the wire before opening the port should not be
processed, but it also turns out that enabling the receiver before the
port is opened can confuse the firmware and break the "stale" rx timer
handling so that data is only forwarded in chunks of 12 bytes instead of
when each char is received.

> > Fixes: 35781d8356a2 ("tty: serial: qcom-geni-serial: Add support for Hibernation feature")
> > Cc: stable@vger.kernel.org      # 6.2
> > Cc: Aniket Randive <quic_arandive@quicinc.com>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 6f0db310cf69..9ea6bd09e665 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -1152,7 +1152,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
> >                                false, true, true);
> >         geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
> >         geni_se_select_mode(&port->se, port->dev_data->mode);
> > -       qcom_geni_serial_start_rx(uport);
> 
> FWIW, I found at least one thing that's broken by your patch. If you
> enable kgdb (but _not_ "kgdboc_earlycon") and then add "kgdbwait" to
> the kernel command line parameters then things will be broken after
> your patch. You'll drop into the debugger but can't interact with it.
> The "kgdboc_earlycon" path handles this because of
> "qcom_geni_serial_enable_early_read()" but it doesn't seem like
> there's anything that handles it for normal kgdb. If you drop in the
> debugger later it'll probably work if you've got an "agetty" running
> because that'll enable the RX path.

Ok, so the kgdb has started relying on this call since d8851a96ba25
("tty: serial: qcom-geni-serial: Add a poll_init() function"). Thanks
for pointing that out.

The polled console code should not be calling the port setup code
unconditionally anyway so I'll fix this up as well in v3.

Johan

