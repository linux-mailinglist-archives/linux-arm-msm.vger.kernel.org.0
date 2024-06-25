Return-Path: <linux-arm-msm+bounces-24113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55C916AC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDEF328BDE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CC6170825;
	Tue, 25 Jun 2024 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1Cx91a6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20AF16EBF3;
	Tue, 25 Jun 2024 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326429; cv=none; b=BUizyJJphZvkdfyoCMCv3R63RVyB4dmyD+M+zifYujqpXrvvgwuxRZFxYiKQrL0gGhVCucX0VprFN3nywv/IxIGXj65pHzABNa6p2gAwSxBBZWMh9djnxUEMgZUrfILPpS2AK8Y0hB3rO2Mr6+3go28qlMA5ptFxxhL3nNOrAww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326429; c=relaxed/simple;
	bh=B9p+xj8WkV5gF2jbO0kCXf4FZuZEXTqiO02bHf2cNys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiJv1+SYK36l4pbMEytCJrB9vBHZk5n81As31d4J2oOiPUGCEJv0VP6EQk6uBRoSyOrnbGRVqiE1lhyTu9r92dBGXKR+0F6HrQ3/T20rG7IfxMXOcmdj/EgVfKgFTyOsrNcb0PyGrb5oL5TRrPzowZHyKEiqe8kucRi8dgjpoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1Cx91a6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA07C4AF07;
	Tue, 25 Jun 2024 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719326429;
	bh=B9p+xj8WkV5gF2jbO0kCXf4FZuZEXTqiO02bHf2cNys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1Cx91a6SX8BZC+5EolSHcI2xhRca4IfRWNkvM+csGeSBMjciNq04eGhrGe7qvc4x
	 UtsWE2AjRTojXL9xM1O//bnrnAuSGBQ/vAV5Hh8k1upVDWSzrTgAiSMF+uCautkzEF
	 C6ydb4gAMOyHeBTKj28Th2HoHxD1rWrGPDubku6kVpKGStapgsdJgYJ5uu8BcAcjWB
	 zzwnBtdfKV7xSaE+d4hp6t0eKYooju3Xl0lFpAmRKiKwJWaB3MlpLw7u4MX3sqYo4d
	 4gq69HNwMnJTieFmzcAaflHBhUxvLDTv0ZzpuU6wB7GrnMKmeCed24IGzPTxWj0z96
	 fTMdkgm4Jp56A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sM7LY-000000004WG-3hZC;
	Tue, 25 Jun 2024 16:40:37 +0200
Date: Tue, 25 Jun 2024 16:40:36 +0200
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
Message-ID: <ZnrW5EcGKGYzS8qf@hovoldconsulting.com>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <20240624133135.7445-2-johan+linaro@kernel.org>
 <CAD=FV=VZXnnbwTNc6dSqZvyCUc0=Wjg9mvBYsA1FJK3xR6bDEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VZXnnbwTNc6dSqZvyCUc0=Wjg9mvBYsA1FJK3xR6bDEg@mail.gmail.com>

On Mon, Jun 24, 2024 at 10:39:07AM -0700, Doug Anderson wrote:
> On Mon, Jun 24, 2024 at 6:31 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > The Qualcomm GENI serial driver does not handle buffer flushing and used
> > to print garbage characters when the circular buffer was cleared. Since
> > commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo") this
> > instead results in a lockup due to qcom_geni_serial_send_chunk_fifo()
> > spinning indefinitely in the interrupt handler.
> >
> > This is easily triggered by interrupting a command such as dmesg in a
> > serial console but can also happen when stopping a serial getty on
> > reboot.
> >
> > Fix the immediate issue by printing NUL characters until the current TX
> > command has been completed.
> >
> > Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
> > Reported-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I don't love this, though it's better than a hard lockup. I will note
> that it doesn't exactly restore the old behavior which would have
> (most likely) continued to output data that had previously been in the
> FIFO but that had been cancelled.

Ah, yes, you're right. I went back and compared with 6.9 and the effect
was indeed (often) that the machine felt sluggish when you hit ctrl-c to
interrupt something like dmesg and the driver would continue to print up
to 4k characters after that (e.g. 350 ms at 115200).

The idea here was to fix the lockup regression separately and then have
the third patch address the buffer flush failure, which could also be
backported without depending on the kfifo conversion.

But running with this series since yesterday, I realise there are still
some unresolved interaction with the console code, which can now trigger
a soft (instead of hard) lockup on reboot...

> ...actually, if we're looking for a short term fix that mimics the old
> behavior more closely, what would you think about having a
> driver-local buffer that we fill when we kick off the transfer. Then
> the data can't go away from underneath us. It's an extra copy, but
> it's just a memory-to-memory copy which is much faster than the MMIO
> copy we'll eventually need to do anyway... This local buffer would
> essentially act as a larger FIFO.

The idea did cross my mind, three levels of fifo...

> You could choose the local buffer size to balance being able to cancel
> quickly vs. using the FIFO efficiently.

Yeah, perhaps adding a smaller driver kfifo would work, but not sure how
clean it would be to implement.

Johan

