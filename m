Return-Path: <linux-arm-msm+bounces-48780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B0A3EA6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 02:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6905B1898244
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 01:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D991BEF8A;
	Fri, 21 Feb 2025 01:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="P2Oy2ykZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF7B70807;
	Fri, 21 Feb 2025 01:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740103021; cv=none; b=LVvpslCD+bheT1AFCCbC+53o1+kpgj9UHI0cfQCRwnPqi5HsIYYtrZz/ldZG+OwmGPKxTv8cXqda6t3lO53xgBArMehdmygOObBY0FHrMGCk6qLViPoEF4uYtQsA3xWsi4kudYloVlKweOTerUPxbtUcIJ4FB8E5WygsIv+cbZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740103021; c=relaxed/simple;
	bh=kseY/QTEQYBO5b4dZDwYzJLWxOWZX7aWkfjzM3jM64M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdjAu8vTGkirdodEwvFlGz6RomIXpkiZIBdC/OGQE49LWd6aU4lWI7v7f83Nw0y+4NtdTzP/6/aCAKG7+cULjTcmRiIGGyWGd8ThV57WnAxFgWC0n71k1gPuHsRY7bdeFaXOAaJInvsYSJsDxppylgruQQU4bikVDzNd3E7V62s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=P2Oy2ykZ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9Fha4YI2mYKfCkDzRF7XHFB3HaXdJTPSTjEgrEB9aEg=; b=P2Oy2ykZbTSTVZjMFNIR3HIkBn
	hEYuAWhquN5lZc73w5QNaIkSs8R5igTQuZr6PiJeFeuUScebrk7hE527wMacTjmedfA8zskqx9hQ3
	CDXrxYdPfc0TKAXXPk44hTShyYyTE0f/d8GPUb+5PM0PRX9OeS/T26Si6m/PmAU+jx1Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tlIH6-00G9c2-ED; Fri, 21 Feb 2025 02:56:20 +0100
Date: Fri, 21 Feb 2025 02:56:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Cochran <richardcochran@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next 2/8] net: phy: move PHY package related code
 from phy.h to phy_package.c
Message-ID: <e8ced800-6ee3-4ee6-9b6c-228f04c15f41@lunn.ch>
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>

On Wed, Feb 19, 2025 at 10:03:50PM +0100, Heiner Kallweit wrote:
> Move PHY package related inline functions from phy.h to phy_package.c.
> While doing so remove locked versions phy_package_read() and
> phy_package_write() which have no user.

What combination of builtin and modules have you tried? Code like this
is often in the header because we get linker errors in some
configurations. It might be worth checking the versions of the
original patches from Christian to see if there was such issues.

	Andrew

