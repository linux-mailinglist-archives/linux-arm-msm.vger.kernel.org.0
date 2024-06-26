Return-Path: <linux-arm-msm+bounces-24234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916DB917A56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADBFE1C23775
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 08:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7079D13541B;
	Wed, 26 Jun 2024 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlH/ljII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360601B950;
	Wed, 26 Jun 2024 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719388890; cv=none; b=bfam/VMVM2P1oPlyDWxOQNUeOyGoIFsUppvgd30QSgU2+C4vxpNzrlkf7sslMMeHm9aJ26Vt62E2Hadp3EfHCtRCJOYk17wVMNL8BOwmDBES+Cbrf0pZwRZc1uz6fMHtdAXipmRB8NICRSfIPSb8dKoSJq0GsJo019e6uU3qQA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719388890; c=relaxed/simple;
	bh=84tHsalPE7uo8CDXkU9RGW93//JKeXATdqivE96frA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0aEbyQuku6GB3jomho6ig4xgg6YEGgnMjINfQfKWdHmtcL64Qp6KaDWp26D6+4Cmg6XxYIfEAvdL7zoANjoNIHbYTETS/Hc/COYp29f4u54BeeJ/lCNLXVCUuXVgvG4KX7hjwnSWc2Ch9vesrEPn/iq5rNnuqvGCFMAUivedog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlH/ljII; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96BBC2BD10;
	Wed, 26 Jun 2024 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719388889;
	bh=84tHsalPE7uo8CDXkU9RGW93//JKeXATdqivE96frA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlH/ljIIqXWbEWx+lXMMMDBK5Wdwez+EW5y3OPvvqhqM5Th88u3X7QZ7OxSU5M4fN
	 VGHfbwNUc+XjfFMSoUiJR2bCLX35rU+mKdKQXeSM53Zn+Ou7nwi/DUgLaTMVw22gEA
	 WoqLIjmuRWCEQQJPy9VT08Z+j8S8G9ES4tF52UNw5r7zppoy7BB0cFfT/31Cy4qUFD
	 bOTsOsSGC8/4GiRV16vr8mo73DEc0yF/5vwvraU6MmEPOiKhyJchDY2HjlxHpW5ZQ5
	 +srUb8rpyS9Qmmz2N3xKLKvLRvGnASH+9kbXV2NVtmJhEVvrClpjKTmf9hL56mqBEC
	 XtIb9aRjbeumg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMNb1-0000000082r-45tM;
	Wed, 26 Jun 2024 10:01:40 +0200
Date: Wed, 26 Jun 2024 10:01:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] serial: qcom-geni: fix garbage output after buffer
 flush
Message-ID: <ZnvK420P0M7K9TiA@hovoldconsulting.com>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <20240624133135.7445-4-johan+linaro@kernel.org>
 <CAD=FV=UL2NCbxmQALjKbW4BSpf4WkM30ZHLf1eZiMqRP+s-NDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UL2NCbxmQALjKbW4BSpf4WkM30ZHLf1eZiMqRP+s-NDg@mail.gmail.com>

On Mon, Jun 24, 2024 at 03:19:33PM -0700, Doug Anderson wrote:
> On Mon, Jun 24, 2024 at 6:31 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > The Qualcomm GENI serial driver does not handle buffer flushing and
> > outputs garbage (or NUL) characters for the remainder of any active TX
> > command after the write buffer has been cleared.
> >
> > Implement the flush_buffer() callback and use it to cancel any active TX
> > command when the write buffer has been emptied.
> 
> I could be reading it wrong, but in the kernel-doc of `struct
> tty_ldisc_ops` it seems to indicate that flush_buffer() is for the
> other direction. Specifically, it says:
> 
> This function instructs the line discipline to clear its buffers of
> any input characters it may have queued to be delivered to the user
> mode process.

Yes, but this a uart op (i.e. not tty_ldisc_ops), for which the doc
states:

	Flush any write buffers, reset any DMA state and stop any
	ongoing DMA transfers.

> I guess the underlying worry I have is that there's no guarantee that
> the flush function will be called when the kfifo loses bytes. If it
> ever happens we'll fall back to writing NUL bytes out and that doesn't
> seem amazing to me. To me it feels like
> qcom_geni_serial_send_chunk_fifo() should detect this situation and
> then it should be responsible for canceling, though better (in my
> mind) is if we never initiate any big transfers if we can get away
> with that and still be performant.

The flush buffer callback is called from the uart_flush_buffer() tty
operation (again, not tty_ldisc_ops) when the FIFO is reset.

Johan

