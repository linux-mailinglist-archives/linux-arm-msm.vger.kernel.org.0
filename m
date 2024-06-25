Return-Path: <linux-arm-msm+bounces-24114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB2916B12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE5CAB20B84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F3E16D4FC;
	Tue, 25 Jun 2024 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJSIav5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AFE11CA0;
	Tue, 25 Jun 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327228; cv=none; b=O7hpMAFp0oKtI2+NPryWDWYRUhLyc59vJYiivnbXoNCfQ9W++WU2iO8hx+kGFQxMyL3LjZjiocog+FuaXUZPrIZOsXEthHYVy1e2FKBrPJ52/6lQyMc50UVmYUtxG91T/8f0uuJyOE0Bq7x0Ok4oilMLtMWoGOyrzg3clcUq3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327228; c=relaxed/simple;
	bh=qabJPWm+MHILu6/Jx4re8Ge4P7ZupVRoClKSGqQZNOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJYAx7EqD83uIUgvWb5TtcGQgVx0h5Ri4Q6fKWUx1zZG9XQwSE0eekon4oaDmf2o7oPloZ6Dc2cERJe12eiCOTQOZKdGjo3xsNcnWqewtPvZNxWA5/obcEQDxTIv+T3tpwqDMS45uAe7HjuXIdL9WamKnxrebNncaGig7EFpgjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJSIav5s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68425C32781;
	Tue, 25 Jun 2024 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327227;
	bh=qabJPWm+MHILu6/Jx4re8Ge4P7ZupVRoClKSGqQZNOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJSIav5slwoM68N/APnxXoRRPfo5AKq1jj/FSAYEKlQZttDWoqlyGtnQaPoSiCwvj
	 2U3M2xzTmr2J7AwV8SrvtGwEJ3bm2QLdFUVaFdHM8U+6VutQ82+MSg+9IQvlmIA6i3
	 W8mDvFReOyzQNIgqrsElTfxAf8Im+sSZhF3VG3qpWKSVh4vydJ3rXvG6yGsPY1Kx0v
	 xzfsoW40qrZl2it/e5Ca8qltL7sIXGhpW3VSb7b94NN841sEOdfYqDVqD0nNkGFpSl
	 f36bG72EyCFXYbW534uuCnXaakrnXw/KQ1xE4enULCHUi50IbVceBmj+USUwAN2lyt
	 jBpPCW3Pr807A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sM7YQ-000000005T2-42Tl;
	Tue, 25 Jun 2024 16:53:55 +0200
Date: Tue, 25 Jun 2024 16:53:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] serial: qcom-geni: fix hard lockup on buffer flush
Message-ID: <ZnraAlR9QeYhd628@hovoldconsulting.com>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <20240624133135.7445-2-johan+linaro@kernel.org>
 <CAD=FV=VZXnnbwTNc6dSqZvyCUc0=Wjg9mvBYsA1FJK3xR6bDEg@mail.gmail.com>
 <CAD=FV=UwyzA614tDoq7BntW1DWmic=DOszr+iRJVafVEYrXhpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UwyzA614tDoq7BntW1DWmic=DOszr+iRJVafVEYrXhpw@mail.gmail.com>

On Mon, Jun 24, 2024 at 01:45:17PM -0700, Doug Anderson wrote:

> Also: if we're looking at quick/easy to land and just fix the hard
> lockup, I'd vote for this (I can send a real patch, though I'm about
> to go on vacation):
> 
> --
> 
> @@ -904,8 +904,8 @@ static void qcom_geni_serial_handle_tx_fifo(struct
> uart_port *uport,
>                 goto out_write_wakeup;
> 
>         if (!port->tx_remaining) {
> -               qcom_geni_serial_setup_tx(uport, pending);
> -               port->tx_remaining = pending;
> +               port->tx_remaining = min(avail, pending);
> +               qcom_geni_serial_setup_tx(uport, port->tx_remaining);
> 
>                 irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
>                 if (!(irq_en & M_TX_FIFO_WATERMARK_EN))
> 
> --
> 
> That will fix the hard lockup, is short and sweet, and also doesn't
> end up outputting NUL bytes.

Yeah, this might be a good stop gap even if performance suffers.

> I measured time with that. I've been testing with a file I created
> called "alphabet.txt" that just contains the letters A-Z repeated 3
> times followed by a "\n", over and over again. I think gmail will kill
> me with word wrapping, but basically:

> head -200 /var/alphabet.txt  | wc
>     200     200   15800
> 
> Before my patch I ran `time head -200 /var/alphabet.txt` and I got:
> 
> real    0m1.386s
> 
> After my patch I ran the same thing and got:
> 
> real    0m1.409s
> 
> So it's slower, but that's not 25% slower. I get 1.7% slower:
> 
> In [6]: (1.409 - 1.386) / 1.386 * 100
> Out[6]: 1.659451659451669
> 
> IMO that seems like a fine slowdown in order to avoid printing NUL bytes.

With my 500K dmesg file test I see a similar performance drop as with
your full series even if seems to behave slightly better (e.g. 20% drop
instead of 24%). 

Johan

