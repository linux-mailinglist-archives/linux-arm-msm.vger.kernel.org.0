Return-Path: <linux-arm-msm+bounces-73600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725DB57FE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 17:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE61917DB34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36065324B01;
	Mon, 15 Sep 2025 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YYqp37zG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372F3002A3;
	Mon, 15 Sep 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757948734; cv=none; b=RIE2qhu3brfnROoSg681XemR1avqbq/6bDCpkFyccTxg3fqxKvOyKagUGE9v3aWztPPDaHV1vqrztM1p5DPbRQVORJo+/qldf9mJ/idW97T6xplXAJWrGIBy9AtZxSDVPVc3PCIJylYk1lzcqrlyEKVq4lhVW4qsVvBKZcr7ZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757948734; c=relaxed/simple;
	bh=w0s2maRJZi0UqeWTQCVBZNhrrkfzUlPYYZXsvdm8q8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVRCvnpTShWnf5oKs/sWGeSfDO1+g6yUlqdBOpBDWWOT3nKY6K1qMrougbnIxPTZiUwdS9kbGyE0p8SGdu8Upv2n7kHOPYBKNRYzzz5zVHzUxHITtOqTI6weoAtgGq0lZ5CLFUijT3SiXKjoYDRsZqoqHbaLaZnBp3FZE5oWAnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YYqp37zG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xe7u5tvgDH0CK0bkZaqdRRKDytwilgWXJlrm+/4ALFE=; b=YYqp37zGxlcRPmgC5ED5PXE9q0
	MPFrYOw8XxYa38rqpODQc9Il1eZfmr2ycKLzAnMPoaSxGXDDDRhb2vMJW6Ht3I8Hx5QZsfyEhS0+w
	wY2OLOLFxn0VLFT13ZBGXcTa6yXPVC2qbFTp0AwPQfW47Vjce32ya6i0Du99z3mtbxGg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyAlb-008SLX-Hk; Mon, 15 Sep 2025 17:05:19 +0200
Date: Mon, 15 Sep 2025 17:05:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-arm-msm@vger.kernel.org,
	Marek Beh__n <kabel@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/7] net: phy: add phy_interface_copy()
Message-ID: <21bcd91c-fd13-4a47-80b3-68c19f5b142b@lunn.ch>
References: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
 <E1uy9J3-00000005jID-1Gce@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uy9J3-00000005jID-1Gce@rmk-PC.armlinux.org.uk>

On Mon, Sep 15, 2025 at 02:31:45PM +0100, Russell King (Oracle) wrote:
> Add a helper for copying PHY interface bitmasks. This will be used by
> the SFP bus code, which will then be moved to phylink in the subsequent
> patches.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

