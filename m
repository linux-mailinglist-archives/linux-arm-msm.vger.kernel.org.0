Return-Path: <linux-arm-msm+bounces-73805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D9B5A41E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F0021C04D34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA1E2877E7;
	Tue, 16 Sep 2025 21:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="H6ZTbDh6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DDF276045;
	Tue, 16 Sep 2025 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758058986; cv=none; b=sP7mD/bXZkeCNUVYYphRfkKfCK1qfrJDOMKFOm+rVC746nxtuvb1ZDJDktG0iyH0GGX3DzPRhlrDX4tRK4JHqUMbFWFHq6np3zcvpmQTCD1Bbbt1YJ46RkIke1YFJJd5/dJnfe+4h2E4eUaOz9bhVvCv9yNhKgDBLplOaoJeVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758058986; c=relaxed/simple;
	bh=MiXPsf7L7852ojyfxFvPJouhhyZAjmQW87Ms+A7spPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+QsXHgCW1oAj/DwX0t+AjJgc7SdUIpqstO6dE43ET7lPki4BKtrl1IbUV354QLyGjqn1XjHSjyvZGg8XY2wZeZe1yPj03mQFxeaxvB66ArEwkf7ZHzs+HmQP7/fFuIpxxk95QrVExbolYjafPx/nAoUigA3y29EU/HWi1STpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=H6ZTbDh6; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sOFhBT4om+1Vj3WVvNgiUqXVRyHTYzIYuFWj+roWekI=; b=H6ZTbDh6Xa2zSVWSXO+2ZAM4Sl
	C6Ise7xHVLIh/S0L1YT55eN8//6A+yyKA+2Lzw//jbUT4mYyzZVgugvqt1dFWfUrvcvlBnWP2JQ/v
	+s4a1I8rGFCNXOVLG5houuP16qGUOEg/WEC+yV4RtufMWXeOH5mw8tgF+ygwwzJQP1taEri/X7nZi
	HOe/nqJB8i9YlLFxUbhSjkK8rNoAjBOted5EUJf2YHECjwiFXVpZdB8MCss/syr+2J899v8dcWpWG
	azTbqNJKWU0bVn2YawcLKHP93SVp2/09hnEqq7ZjtsqAwq0+gd2kJYZDst7yeP6xXLTDxqJIFEFhT
	yWc6LtEA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33612)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uydS0-000000006Nv-3pNB;
	Tue, 16 Sep 2025 22:43:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uydRz-0000000080u-1DYH;
	Tue, 16 Sep 2025 22:42:59 +0100
Date: Tue, 16 Sep 2025 22:42:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-arm-msm@vger.kernel.org,
	Marek Beh__n <kabel@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/7] net: sfp: pre-parse the module support
Message-ID: <aMnZ40TN68WhWcMb@shell.armlinux.org.uk>
References: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
 <E1uy9J8-00000005jg1-1lhL@rmk-PC.armlinux.org.uk>
 <54efefb7-690e-492e-9f2d-8457d6424861@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54efefb7-690e-492e-9f2d-8457d6424861@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 15, 2025 at 05:12:19PM +0200, Andrew Lunn wrote:
> > +static void sfp_module_may_have_phy(struct sfp_bus *bus,
> > +				    const struct sfp_eeprom_id *id)
> > +{
> 
> _may_have_phy() sounds like a question, and you would expect a return
> value as the answer. But that is not what this does.
> 
> Maybe sfp_module_set_may_have_phy()? 

I'll stick a parse_ in there rather than set_ so it matches all the
others which are parsing the SFP ID to obtain something.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

