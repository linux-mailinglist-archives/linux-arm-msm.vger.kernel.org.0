Return-Path: <linux-arm-msm+bounces-71477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF96B3F3D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD91484D37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDE3205E25;
	Tue,  2 Sep 2025 04:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lP3cr/C5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E7022301;
	Tue,  2 Sep 2025 04:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788142; cv=none; b=fjgdmhTG4STgR00BP833Qs+0HReDLEy1rqGWC1S4WV43qjir5fhlvQhM81iID9SnxaF9TFAIdd6GOxY7j8UYR3/EUanvRV9foi41akFTsF+ELgKf//P4ErBIEdgY5Kp+WgLd/fDSfT86RYJQclBwOPHRgvSF5pg9yELEmXPKYF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788142; c=relaxed/simple;
	bh=rI7sjxxwycfC7pS/4GOnS0bhnDJDQu4k5LP/FweJy1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwqiXvDXuHAfN5lGSasRd/0OzEIWp9bQ1P3XAe+X2zsiO8gYrh+WxW7DHX42Ug98jjrgg4GOsdVuEpbpu5b/ImHKS3CqqKcjU17t4ST5lRY/4Rv6s81B0Xi17Zkpc82sx0GeIlTVwpyxPeksCcpcy8ZeXQBfz6945s3Y+Dz//Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lP3cr/C5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200DBC4CEED;
	Tue,  2 Sep 2025 04:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756788141;
	bh=rI7sjxxwycfC7pS/4GOnS0bhnDJDQu4k5LP/FweJy1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lP3cr/C5iULrTajLJMfwGEArRBqaXoN/zVPlo6H+iCQlazjf5VEYJRH7IkQjOR1Ru
	 xGa6XbxbMdbh8uen5MBRmTJgSFo7ifv+UUhqjb+EdSbipWXxgld4iQ13nLo7t4tJhc
	 fHkL5L+ottflYLyH6J+ODJH9UL6uwCWDNqbL7edc=
Date: Tue, 2 Sep 2025 06:42:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Koen Vandeputte <koen.vandeputte@citymesh.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, jirislaby@kernel.org,
	neil.armstrong@linaro.org, stephan.gerhold@linaro.org,
	Robert Marko <robimarko@gmail.com>
Subject: Re: Crash in msm serial on kernel 6.12
Message-ID: <2025090256-waffle-sip-f1fc@gregkh>
References: <CAPh3n81TECn_LRKrsKS4qS3-CQsVTf8LSSiCdn+uNYdnO7h9AQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPh3n81TECn_LRKrsKS4qS3-CQsVTf8LSSiCdn+uNYdnO7h9AQ@mail.gmail.com>

On Mon, Sep 01, 2025 at 04:40:42PM +0200, Koen Vandeputte wrote:
> Hi all,
> 
> I just updated my ipq4019 boards on OpenWRT from kernel 6.6 to 6.12.
> 
> When using the serial port (/dev/ttyMSM1) I notice that it keeps
> crashing while using that port.
> 
> Going through the commit history, I noticed that not much changed at
> all compared to kernel 6.6:
> 
> f6ae572683d4 serial: msm: Configure correct working mode before
> starting earlycon
> f70f95b485d7 serial: msm: check dma_map_sg() return value properly
> 1788cf6a91d9 tty: serial: switch from circ_buf to kfifo
> f8fef2fa419f tty: msm_serial: use dmaengine_prep_slave_sg()
> 4e5788c0993c serial: msm: Use uart_prepare_sysrq_char().
> 173ebdedcd84 serial: msm: Use OPP table for DVFS support
> a63e5a49d596 serial: msm: Convert to platform remove callback returning void
> 6cbd979080c7 serial: msm: Use port lock wrappers
> 
> As the crash indicates, it has got something to do with DMA transfers,
> which was altered in these 3 commits:
> 
> f70f95b485d7 serial: msm: check dma_map_sg() return value properly
> 1788cf6a91d9 tty: serial: switch from circ_buf to kfifo
> f8fef2fa419f tty: msm_serial: use dmaengine_prep_slave_sg()
> 
> 
> file:  ./drivers/tty/serial/msm_serial.c
> crashing function: msm_start_rx_dma()

Can you do 'git bisect' to track down the offending commit?  And what
about 6.16?

thanks,

greg k-h

