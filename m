Return-Path: <linux-arm-msm+bounces-25256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7792737B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 11:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA32AB210AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 09:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511DA1AB515;
	Thu,  4 Jul 2024 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGzONv9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7AD18FC81;
	Thu,  4 Jul 2024 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720087143; cv=none; b=MSW0VHEGIDHRE8si+RTB4EzIssCsUhLyjfFy3J5qbL0UI+Z7YDiNaIu7oQmTuR6psGc7X1c7Ergj4nP7glYFvM6rh0MftslnuHeG1J8q0w11gr2PVOkIG3wCqNTCqyLDSSRqgXgbTcsvp7kGRdeW8Qi7ZalrhaOYKpd7dYvaBxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720087143; c=relaxed/simple;
	bh=qwr0HlQT+E3A2hy1BA/HWVICCAADse5XNZIpsoHJffU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mX3xkLKnBA1nt5E3L6RUJHphp43tZEBzyggkGAhaja5sZsARTMOrEnEC3P5ZlBhC8FhogV4TOJjHri2pHly0BIRo3Wio82WXgis8Wy/qj8RwkSVzIc5Txwni+1hNZkbn17GC5SCdf8+uKXD+H5lS7jxn8Eswu+Ut/yxCYpaP1nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGzONv9m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB81C3277B;
	Thu,  4 Jul 2024 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720087142;
	bh=qwr0HlQT+E3A2hy1BA/HWVICCAADse5XNZIpsoHJffU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGzONv9m4mYXt24+d067cOIRY3kEXZWZE+UrGj8RfjMB7mu8B68bEj5Q+zfS6QhKp
	 lFXxg3kOqVAwM6O8k5G2E0i4J0Z/Qjm6f8Ep312Wy74HrzLeiLJgW9VQfmJizA59J3
	 v6H9U/Z2HNTrkO1PtvkaMJGD7eWWEvV6k6ey31dz4SX7ynl4m4PM7CSAEBjJLzTH5P
	 mimkOxbXCg8UbyvnQ7vrTF93vI3kuyEhdg3ULjRgd+5U3ppMpDNYC3pDo3wIiZFIY1
	 aR8sZE2GSwsuNj2OZfh3kF3/gygUk2mspCjA0mnDEISdrg566irxQipw3VmRKbGm9T
	 rEaBH9VsIMZLw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sPJEz-000000007iG-28dB;
	Thu, 04 Jul 2024 11:59:02 +0200
Date: Thu, 4 Jul 2024 11:59:01 +0200
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
Message-ID: <ZoZyZcVyLvI9t4fH@hovoldconsulting.com>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <20240624133135.7445-2-johan+linaro@kernel.org>
 <CAD=FV=VZXnnbwTNc6dSqZvyCUc0=Wjg9mvBYsA1FJK3xR6bDEg@mail.gmail.com>
 <ZnrW5EcGKGYzS8qf@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnrW5EcGKGYzS8qf@hovoldconsulting.com>

On Tue, Jun 25, 2024 at 04:40:36PM +0200, Johan Hovold wrote:
> On Mon, Jun 24, 2024 at 10:39:07AM -0700, Doug Anderson wrote:
> > On Mon, Jun 24, 2024 at 6:31 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> > >
> > > The Qualcomm GENI serial driver does not handle buffer flushing and used
> > > to print garbage characters when the circular buffer was cleared. Since
> > > commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo") this
> > > instead results in a lockup due to qcom_geni_serial_send_chunk_fifo()
> > > spinning indefinitely in the interrupt handler.
> > >
> > > This is easily triggered by interrupting a command such as dmesg in a
> > > serial console but can also happen when stopping a serial getty on
> > > reboot.
> > >
> > > Fix the immediate issue by printing NUL characters until the current TX
> > > command has been completed.

> > I don't love this, though it's better than a hard lockup. I will note
> > that it doesn't exactly restore the old behavior which would have
> > (most likely) continued to output data that had previously been in the
> > FIFO but that had been cancelled.
> 
> Ah, yes, you're right. I went back and compared with 6.9 and the effect
> was indeed (often) that the machine felt sluggish when you hit ctrl-c to
> interrupt something like dmesg and the driver would continue to print up
> to 4k characters after that (e.g. 350 ms at 115200).
> 
> The idea here was to fix the lockup regression separately and then have
> the third patch address the buffer flush failure, which could also be
> backported without depending on the kfifo conversion.
> 
> But running with this series since yesterday, I realise there are still
> some unresolved interaction with the console code, which can now trigger
> a soft (instead of hard) lockup on reboot...

I've reworked my series to avoid the remaining lockup, which was due to
v1 not handling some cases where cancelling a command left stale data in
the fifo.

I've also reordered the patches to avoid printing NUL characters as an
intermediate fix.

Johan

