Return-Path: <linux-arm-msm+bounces-73602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A7B5803E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 17:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 556A21885BBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7910312804;
	Mon, 15 Sep 2025 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="FSfMGgzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163AE2EAE3;
	Mon, 15 Sep 2025 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757949146; cv=none; b=Twd1Xo30kyX5gG0FRKHxhlHkJrNd0nOXHebhRZ3hLiw0MtylNCjwilFK7F/CJDbgr93aUWVLKC/Lv7PwJMii1AtJ8sJ8DYMKz3hmWzsbK4t/rxnt4tsBU+WLvIXmXTOldlSVZ5YxNjtOKNewZeKcbpjJ34raRnvd8ISVOPUHqDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757949146; c=relaxed/simple;
	bh=ZVFe1OPByDsFxdsAlS+8Bc9bb+p2acEgjx0UWr7lsXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nm4IyYuIzgDJAOxkFfP1RUvLoMCxMMU3P6rSpVGBdY23gvopn26DQvT7R8u71e/Kk9lQac+HD4C6r+ocp9kdgPi3evtW5PaDb8IT44J6SEdf2XitjVpHdu2jX1eNpLwCiHGSGpkwMQdKjsi/mwAPueGI4E569GEtaPMfvn4E4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=FSfMGgzU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iGakJE48OGs/Ysrbexk6wcRF4rEw9OdxXzERZzJ8nIY=; b=FSfMGgzUHciPk3h/QxWr8jHmsz
	MJoo75aq9bfYRF83br47xWj+C1lkSkwPBB2BRUjDTmpVhxp/PBudn1sjZlkOcw6q9X1KInEZr80M+
	4NnV75cNtOkMAKp51C10LEfodFAR2aRUz8+2uMgwqvMhngXHuaCleVLo9KzzWwBJe+Ws=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyAsN-008SOW-Gb; Mon, 15 Sep 2025 17:12:19 +0200
Date: Mon, 15 Sep 2025 17:12:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-arm-msm@vger.kernel.org,
	Marek Beh__n <kabel@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/7] net: sfp: pre-parse the module support
Message-ID: <54efefb7-690e-492e-9f2d-8457d6424861@lunn.ch>
References: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
 <E1uy9J8-00000005jg1-1lhL@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uy9J8-00000005jg1-1lhL@rmk-PC.armlinux.org.uk>

> +static void sfp_module_may_have_phy(struct sfp_bus *bus,
> +				    const struct sfp_eeprom_id *id)
> +{

_may_have_phy() sounds like a question, and you would expect a return
value as the answer. But that is not what this does.

Maybe sfp_module_set_may_have_phy()? 

	Andrew

