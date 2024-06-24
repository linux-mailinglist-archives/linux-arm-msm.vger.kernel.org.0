Return-Path: <linux-arm-msm+bounces-23946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D4D914A99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441A21F2324D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14C813C8E8;
	Mon, 24 Jun 2024 12:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+JtghcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29321E4AE;
	Mon, 24 Jun 2024 12:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719232978; cv=none; b=m9//ssOFl1es/t9Q3sAtXnGctxQoNWx5c+gPpP2pRGJNnPLg9CxDWxGbOoxMUHjW1I01MjAfwKpxIZdHmdIxOyRbhn0oWyJK/3yE8b3DJ8vF07dEXr7XsCtl/SebbBDn+l+AIhLBcuiWAoBDudhhN+RpAFH3GkBgrr4Tduqsuhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719232978; c=relaxed/simple;
	bh=dEpmKP/q1kMuKBTLJFT43/yjDz88ut/JqnjNCWOoxKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxTZwN3+erCYiNjpvuUFO3fxnWMXp8av2rGiRUPYCxyChWLz4zm7hgGYT7D4W3Yx9K9ioYv3Qxpz2oPYjij/DPqppnNi6UH+3kuSYfYGXUN+ldbWduyODK0zaJO1qDWU/jI9Nv8ME8hzC7XhA4tNsqLx3nxmsA2QH4xZ2D2isKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+JtghcY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ED4C32782;
	Mon, 24 Jun 2024 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719232978;
	bh=dEpmKP/q1kMuKBTLJFT43/yjDz88ut/JqnjNCWOoxKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+JtghcYZFECrw+7MgoJeP0HIxj130dUadnfFJnvfvSFf9tAR8FXUnBJTEvtuJO6/
	 FBVIl7SMAxZ4GeT4+MUOihzt/pMclE6WwItkJPKtNVG64invLZiO4zIO4P+JOr5HDO
	 YTCCJoeXlZ2Tz1eMgGyLZh7PgDbgaRehOpEgO9uj/HaJmuZNILzzmT8ZtKNPWcWBd+
	 XEXjFhPkS243/MzNLRsNFPtnyeo+hGU1I11PzNrsvUeXN1CR/Sc4R+Z7U0pIrjWbZl
	 WUXO/mnAnWRg7TXrZpx45HElX1sZqgA3XZbcH6Qz6dGEk0HtGSPEiMJihucVnTQBFD
	 yr/8KjX3AyNiw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sLj2F-0000000072h-1Coc;
	Mon, 24 Jun 2024 14:43:04 +0200
Date: Mon, 24 Jun 2024 14:43:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 8/8] serial: qcom-geni: Rework TX in FIFO mode to fix
 hangs/lockups
Message-ID: <Znlp1_F1u-70D3QQ@hovoldconsulting.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>

On Mon, Jun 10, 2024 at 03:24:26PM -0700, Douglas Anderson wrote:
> The fact that the Qualcomm GENI hardware interface is based around
> "packets" is really awkward to fit into Linux's UART design.
> Specifically, in order to send bytes you need to start up a new
> "command" saying how many bytes you want to send and then you need to
> send all those bytes. Once you've committed to sending that number of
> bytes it's very awkward to change your mind and send fewer, especially
> if you want to do so without dropping bytes on the ground.
> 
> There may be a few cases where you might want to send fewer bytes than
> you originally expected:
> 1. You might want to interrupt the transfer with something higher
>    priority, like the kernel console or kdb.
> 2. You might want to enter system suspend.
> 3. The user might have killed the program that had queued bytes for
>    sending over the UART.
> 
> Despite this awkwardness the Linux driver has still tried to send
> bytes using large transfers. Whenever the driver started a new
> transfer it would look at the number of bytes in the OS's queue and
> start a transfer for that many. The idea of using larger transfers is
> that it should be more efficient. When you're in the middle of a large
> transfer you can get interrupted when the hardware FIFO is close to
> empty and add more bytes in. Whenever you get to the end of a transfer
> you have to wait until the transfer is totally done before you can add
> more bytes and, depending on interrupt latency, that can cause the
> UART to idle a bit.

As I mentioned last week, the slowdown from this is quite noticeable
(e.g. 25% slowdown at @115200), but this may be the price we need to pay
for correctness, at least temporarily.

An alternative might be to switch to using a 16 byte fifo. This should
reduce console latency even further, and may be able avoid the idling
UART penalty by continuing to use the watermark interrupt for refilling
the FIFO.

Johan

