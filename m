Return-Path: <linux-arm-msm+bounces-54138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0AA873E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 23:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2E13A5D5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 21:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FE11E5711;
	Sun, 13 Apr 2025 21:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="JIyuLOWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8561E480;
	Sun, 13 Apr 2025 21:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744578324; cv=none; b=nFnhxNR27OfWBN+M4GY/4RnJLflNyFbMZ+jlVUJiJz9usATe3AIo4wMITMMYrWLR3ModXnDUxOYGyFOtMEYl08bdUa1+gAhVO7kixoFQb+PBl5xJoWygXlfdNA4ipR26kdTvf034JfrRPfG4XvuOfMCjFtGo4EdjbIBr3VnbSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744578324; c=relaxed/simple;
	bh=hy/UFrWtoogD/Yn7Ipi0o//7DSl5Jqr2ox67DohbRBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jwp0Sl2yVw+rUKu/Kgw1bk4d6mhYIoGidN1pgzvoOAfBqQTq8OXcQSWbTdIdqAiYl4cSGJ3nCOOHyWqew5lAfC/RgJCbcLwDlm4T6vuvN/c8MTQu13ZiZ068OISGo4j9W4uOoOc7cOcoqhPvjbO5vKoqjgbJIAk2jaA5zMYa5Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=JIyuLOWH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=d9HlBoO1uVo+EoWEjV74MOdLnBJFasfD8Z72q+y3gtk=; b=JIyuLOWHSshda/Ut2H8eI2plkn
	Ajpn8XkWiQAWTcHGNbtINRT998Ta74wWyWPPlZVjhyFSoMSJroqzT1BZCDjNN5dbGLJLnZniDWr7Q
	dzik3j40YEwG3/BD2YpQv4dNh55EOetRp2+WlgV5tLn6/ckeetQzA4hEu+AovLCoYtVA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44Vs-0096Fm-76; Sun, 13 Apr 2025 23:05:12 +0200
Date: Sun, 13 Apr 2025 23:05:12 +0200
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
Subject: Re: [PATCH net-next 1/4] net: stmmac: qcom-ethqos: set serdes speed
 using serdes_speed
Message-ID: <d50d1c98-6077-4c92-a3d3-7c3cb9cab0c8@lunn.ch>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
 <E1u3bYL-000EcE-5c@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bYL-000EcE-5c@rmk-PC.armlinux.org.uk>

On Sat, Apr 12, 2025 at 03:09:49PM +0100, Russell King (Oracle) wrote:
> ethqos->serdes_speed represents the current speed the serdes was
> configured for, which should be the same as ethqos->speed. Since we
> wish to remove ethqos->speed to simplify the code, switch to using the
> serdes_speed instead.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

