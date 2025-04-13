Return-Path: <linux-arm-msm+bounces-54141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6246A873F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 23:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B7DF7A48E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 21:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E211A1F1908;
	Sun, 13 Apr 2025 21:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HbxVu7op"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404F51E5711;
	Sun, 13 Apr 2025 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744578477; cv=none; b=PUA442r8cMh/ACdrYZHouCTv70y0fVWDCQ+hY9Pwxs/rQuS11uIPKuhYiDAxux+CYqBTHzkzWVxPGqAQWaut7KNdTMhCNSdWvuPKFn8+fHXR1aqiIXER+X2pibubad7Yt2Y7lwgcFwxjvdeH8uxAdGS+quyJD1EDWmR/gemKe14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744578477; c=relaxed/simple;
	bh=W4M8m5TuctMEIWtjjgloWPV5ALrGcVQoDZoKjtMcero=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvxsK6FtEjzSf+11DCoEoDMMJ4luA6j9muMW0uFaaCtKhwxIDfxKnNhuc9tK51osnqPlBkzaGj6wA8mFm1hYvPcmXlvvK9/JkObvWg+X3a4jCkkrHQkpvIkg9V2TjKbHp5xvImnO7flpbZgSIhYU8PdRiFlv4CkIoe+A2W7boQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HbxVu7op; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fLQJM6ERhkCMHtQZ6mtLOBHjWODKm8YrfDgknSKdTe8=; b=HbxVu7op+iMZef01zHEWtTlLoc
	vkxskzULTOzdYdM3wl9lP+CARJK2/7DrS5W2i5jrGSIeHjt0Dy3X17vU+yeQB8bfqGtKb1AxVfnlB
	t4YcYdQaXOyEblnmu19EQSPl3MojSyjBneWn+ujnq3yAnF4N5cCxTQBt/EWfIBrjpbD0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44YP-0096JL-9z; Sun, 13 Apr 2025 23:07:49 +0200
Date: Sun, 13 Apr 2025 23:07:49 +0200
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
Subject: Re: [PATCH net-next 4/4] net: stmmac: qcom-ethqos: remove
 speed_mode_2500() method
Message-ID: <9987dc3b-8ec4-4c13-8054-73b2b52020e5@lunn.ch>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
 <E1u3bYa-000EcW-H1@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bYa-000EcW-H1@rmk-PC.armlinux.org.uk>

On Sat, Apr 12, 2025 at 03:10:04PM +0100, Russell King (Oracle) wrote:
> qcom-ethqos doesn't need to implement the speed_mode_2500() method as
> it is only setting priv->plat->phy_interface to 2500BASE-X, which is
> already a pre-condition for assigning speed_mode_2500 in
> qcom_ethqos_probe(). So, qcom_ethqos_speed_mode_2500() has no effect.
> Remove it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

