Return-Path: <linux-arm-msm+bounces-23274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90990F6B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3666A1F2304E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FE815887D;
	Wed, 19 Jun 2024 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="aByW9sSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F13B157E9F;
	Wed, 19 Jun 2024 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718824201; cv=none; b=fmDHZO4uDl5+Ni8JPi7peN+FB9uoSEQIyCFG9T3B6kl6gyeEk3LQPOXC1mo1qM2KTLzFuWAl7+Cijl9oB4XUeSQwZS6bQBLAU/Wm1VLsgmgTdx7oRrHiKJjguMu9ZakGp7MLCYRWQ7VIF6mssYt9cB55yER4PpnBcmZZ0uKFir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718824201; c=relaxed/simple;
	bh=NdMdRSIZaqRkPqRkBKfM+32Ib6ThEAu5KVWXqnYiJN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBx2na/sXWHHYpTwYcRCJDRrkfAWO2N+ySNEo8oG76703MBdDI2/RCf1WdAYvenH3H9S4/RTqVxHG9acEIW2FzHv5Zu7HetlebBzftc4JkT9UBIsCbTXqjl1G7nz8nHtqKrPLXDwOPNwC73QIvhmcHg3cugn2+CwEvRSY3LHYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=aByW9sSs; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=y1BHomwyxqkGQREWBC2VWmqAdICZq7/C7Gu+G9jbW0A=; b=aByW9sSsM8C3mrQKa/AT6y0ACr
	jBx0kyhnZGNG6nrXxFJokvD0h6yfNdYhjKKn1vNxAHjM8kh/IKV6tA/qHLQLeVhAjOGF3kGXpwRwC
	uPwaRoD8dKuvTnKtmcruhZkLNhnRirwwUcvCkdBnXRdCFfgbFiZNkjfN/sBFeJdrIJ/I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sK0ge-000V5q-2t; Wed, 19 Jun 2024 21:09:40 +0200
Date: Wed, 19 Jun 2024 21:09:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 1/8] net: phy: add support for overclocked SGMII
Message-ID: <bedd74cb-ee1e-4f8d-86ee-021e5964f6e5@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619184550.34524-2-brgl@bgdev.pl>

On Wed, Jun 19, 2024 at 08:45:42PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The Aquantia AQR115C PHY supports the Overlocked SGMII mode. In order to
> support it in the driver, extend the PHY core with the new mode bits and
> pieces.

Here we go again....

Is this 2500BaseX but without inband signalling, since SGMII inband
signalling makes no sense at 2.5G?

	Andrew

