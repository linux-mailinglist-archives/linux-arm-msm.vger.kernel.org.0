Return-Path: <linux-arm-msm+bounces-54140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44788A873EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 23:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 167CB3A5F3E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 21:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F24E1EB5D6;
	Sun, 13 Apr 2025 21:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ecINfJ5b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA221DDC12;
	Sun, 13 Apr 2025 21:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744578431; cv=none; b=qlodfuF3L5BMWtN/qR2ND4UGYndkxghdQN+HEY1V9r3NLBrfqFp78zKXqqpRO5qq/zDotzYtRP7sKUqojv3qgLsUCLkcHaO4QDEGFaZuMSXr8SXgwpldqMIVN/8QuLbMhbOLEq2gMOJpUCkBeXtXAWRnfL/AJLuH8E2wVfWVqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744578431; c=relaxed/simple;
	bh=ls92MVt3CG2npMqUf+Yz4xV9Lqf4zqWkXHffk5hOZOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgdunWrycDfoMoLOKZb3e7W+3iRZKjIWlbebM0ekDef9oeeI6Kt1/jblU5aKCYNVQ90FIPWQFB3E43xO7y6ErKgMG2gfqydiXt5MNbZUff/X0w+n4v7X+X7DZzNG3CrdbWM8OPeX1i0dP/htNb7X9jdjPGnqlO/ffLQfFwbyWIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ecINfJ5b; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qQG/qStLXCsqU38nmhmmU53qbrVK+NDUOCOBGWWUSOU=; b=ecINfJ5bledrEuMO7ZLWdKoykV
	K7xSkbNQhrQ1U4ODl9FLlrwoqffgV0zEPgePT2Ldaf/jjvFXKo1DwSgVk9et1x54Do7/hMT92Pq/7
	rYMGPJuIbeUaa9LQbmxnwpeAiggv056/QUXbqJyzTQOKLDKy3IL6erZi98dUNYZSP9AY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44Xf-0096I6-7R; Sun, 13 Apr 2025 23:07:03 +0200
Date: Sun, 13 Apr 2025 23:07:03 +0200
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
Subject: Re: [PATCH net-next 3/4] net: stmmac: qcom-ethqos: remove
 unnecessary setting max_speed
Message-ID: <2474c83c-d12a-4187-a1d2-a56232d1b7c0@lunn.ch>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
 <E1u3bYV-000EcQ-Cv@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bYV-000EcQ-Cv@rmk-PC.armlinux.org.uk>

On Sat, Apr 12, 2025 at 03:09:59PM +0100, Russell King (Oracle) wrote:
> Phylink will already limit the MAC speed according to the interface,
> so if 2500BASE-X is selected, the maximum speed will be 2.5G. It is,
> therefore, not necessary to set a speed limit. Remove setting
> plat_dat->max_speed from this glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

