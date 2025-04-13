Return-Path: <linux-arm-msm+bounces-54139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F761A873EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 23:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCA267A48BF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 21:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F481EA7CD;
	Sun, 13 Apr 2025 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="oyJpRXa5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501871F2BA1;
	Sun, 13 Apr 2025 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744578393; cv=none; b=bx6Y7r2cY9dZJXWzhGj6R2ZMDbfv8benVKQAHSd/Gt5kF2oD5qk9qQvNXgIyYJdOl1TV8lkp9yOE9ciZHQe58lfyPLYLhSuvLfmRcaUfp9Cq06gwnMWpoFlckiSDEo0tfvb+CgYOb6J70tJiZ+Q6s2vFrgwpvTa+k5dE5bS70Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744578393; c=relaxed/simple;
	bh=ky6uEwEVaaRF63TooAO5N5RZuD2eDPPyKFX4jMigyls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7fsyx3emKf2IKuxoki1tWMaLxnJZPTAcqn3xHmuNEv4O+G7ZZslD+Z72quHzF3EkNT7KRFy5pCet59sMr84CXEnBmV3bfeUGg7gMDXm0p0CSf37vkB0zJzAFA1TqhQN9tfi9LUpLG01Ed2tnGSPnDR/pUORPL/vkD6XRtZScck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=oyJpRXa5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w8CUEKu0j9gFTq9op+uSbKNLjrJ99roV2aNWqSdvKwg=; b=oyJpRXa5ZcqD9ltwl/vAki/htn
	VKWouhUhHmYuWVVcApFrVcQCCj0F3yj8NctnS9olrFrIg8FCgAk4MbNmNT2juS4Rz+Y+S/7AvPnBu
	G8SZqticmjJt10Hw1dgb3oBtPsfLnoIEjAJY/At/vKEjomS2vf19Rut95y1Cnz7SBCbY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44X2-0096H4-Gf; Sun, 13 Apr 2025 23:06:24 +0200
Date: Sun, 13 Apr 2025 23:06:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/4] net: stmmac: qcom-ethqos: remove
 ethqos->speed
Message-ID: <1446b6f5-b0e9-48b9-aa49-8e5f7065529c@lunn.ch>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
 <E1u3bYQ-000EcK-9K@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bYQ-000EcK-9K@rmk-PC.armlinux.org.uk>

On Sat, Apr 12, 2025 at 03:09:54PM +0100, Russell King (Oracle) wrote:
> Rather than ethqos_fix_mac_speed() storing the speed in struct
> qcom_ethqos and then functions that are only called from here reading
> that speed, pass the speed to the called functions instead.
> 
> This removes all readers of this struct member, which then allows the
> removal of the two places that set its value and the struct member.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

