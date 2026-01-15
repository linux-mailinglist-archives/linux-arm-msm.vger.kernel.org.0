Return-Path: <linux-arm-msm+bounces-89245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F848D266BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BA18304268C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 17:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E144D3BF2F7;
	Thu, 15 Jan 2026 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yl7Qh0pY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73922F619D;
	Thu, 15 Jan 2026 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768497814; cv=none; b=JWKA/kYYQ+MPV8/jijUJyDt98hC7PsCtzceW1KncW4U22/NhQIgSqYFSAw6CfZihpzbmAfIeHWiWsn6QQ/5zaOMtqFebojOZ0Junim52BWRJ0aTAc3vbFD5zLljvMle2g5jSWs4J4d0OwOk8r2PJDxHwH3QV/4rsX0AaMFGEYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768497814; c=relaxed/simple;
	bh=UodKu5Nxhf/UktRjhZh/tGid3xqAy82yRTwBh2y3GKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9APF/g6cTS1wDpi5qZxDOg20FvGN+a7vTIsxhBq07D4a3doiWCGsOtoocOwdVHm4ADv2XRLf55dNMo2Dnin/1rYByeNRpUmyH/c9F+FquQ1MaB4jTrDXjSFjz9mMHXVHUk00VvXsuNAaO5YTl9o6bf12AQZMCL3L2HeH+12Tp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yl7Qh0pY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sQ7vP21dlzkkieemZjIahhU81dRaLsybz6UG5FalGMc=; b=yl7Qh0pYjwozEKS828gvwa0CFX
	ty7BCEZdeh+j9tUx/oR6XUGAw+Jayo7ZAY9j9MH8ypO0txEZ3jwhtRIbfG8GhIhZeVSB+7BOLul/W
	29OmA6cEFLKSHaqX2kbsACyBJARoYyXL8k7+UGkrXx1Gh9oKOlavAgrCZLLGEBHRojoY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vgR3y-002xkP-Ib; Thu, 15 Jan 2026 18:23:14 +0100
Date: Thu, 15 Jan 2026 18:23:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vinitha Vijayan <vinithamvijayan723@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, davem@davemloft.net,
	pabeni@redhat.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] net: phy: qcom: replace CDT poll magic numbers with
 named constants
Message-ID: <6504f3dc-4e95-4f10-b46c-4583ceb74a4a@lunn.ch>
References: <20260115165718.36809-1-vinithamvijayan723@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115165718.36809-1-vinithamvijayan723@gmail.com>

On Thu, Jan 15, 2026 at 10:27:18PM +0530, Vinitha Vijayan wrote:
> Replace hard-coded poll interval and timeout values in
> at803x_cdt_wait_for_completion() with named macros.
> 
> This improves readability

  	ret = phy_read_poll_timeout(phydev, AT803X_CDT, val,
  				    !(val & cdt_en),
 				    30000, 100000, true);

	ret = phy_read_poll_timeout(phydev, AT803X_CDT, val,
				    !(val & cdt_en),
				    AT803X_CDT_POLL_INTERVAL_US,
				    AT803X_CDT_TIMEOUT_US,
				    true);

Is it really more readable?

The point about magic values is that you cannot easily see what they
mean. With BIT(4) is hard know that that means. But all the
read_poll_timeout() functions are very similar. If you know one, you
know them all.  I know the poll interval is 30,000us and timeout
happens after 100,000us. Using macros just means i need to go find the
definition of the macro to know the timers used in this polling
method.

    Andrew

---
pw-bot: cr



