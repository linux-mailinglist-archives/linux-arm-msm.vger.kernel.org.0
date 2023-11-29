Return-Path: <linux-arm-msm+bounces-2387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D53BC7FD2DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E384D282E47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7835715EA3;
	Wed, 29 Nov 2023 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vVla0Ao5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9F1171D;
	Wed, 29 Nov 2023 01:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GkiV3Yxh9yW7+tSda6S0fOmUrfZQDwNF4HZzW/LWK2U=; b=vVla0Ao5AFogSGekOYR75lUYB+
	Wz72kQOv5TKzViyr1vPrtOyNZ7tZgJPhxg9LOWKD3w8loc1ijDV22n4sBBI6A/vRpKIkULdg/3EQi
	um7nNW462hKx/C1aXwY7DfllsXqTP9FGcJhylcCsmssUjwDWwXAp3qJkHUOfswLLrLZWH0rc0UAN5
	VwgxQOu2j7MnQU5FuXfajq6Xz8TncxEOa+VmYrV4KRsS3k1gO0jkCngx5DR4uqh8yexyo0Ol4gdMw
	tQx8pnME4bEfD3ZXTu48xRiqlVng8ERKjWo1oi92LJ2YrWCDYBpL1Pug32141DgSIfWi/dp4W3iKk
	jciHtp9g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45320)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r8Gyl-0008V6-2r;
	Wed, 29 Nov 2023 09:35:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r8Gyn-0003rd-IZ; Wed, 29 Nov 2023 09:35:37 +0000
Date: Wed, 29 Nov 2023 09:35:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 06/14] net: phy: at803x: move at8031 specific
 data out of generic at803x_priv
Message-ID: <ZWcF6b/Py2gMmwmZ@shell.armlinux.org.uk>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-7-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129021219.20914-7-ansuelsmth@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 29, 2023 at 03:12:11AM +0100, Christian Marangi wrote:
> Rework everything related to specific at8031 function to specific
> function and allocate the 2 bool, is_1000basex and is_fiber and the
> regulator structs to a dedicated qca8031_data struct.
> 
> This is needed to keep at803x functions more generic and detach them
> from specific check of at8031/33 PHY.
> 
> Out of all the reworked functions, only config_aneg required some code
> duplication with how the mdix config is handled.
> 
> This also reduces the generic at803x_priv struct by removing variables
> only used by at8031 PHY.

You are changing the order that register writes happen, e.g. for the
set_wol() method. at803x_set_wol() very clearly does stuff like
configuring the ethernet MAC address _before_ enabling WoL, and that
can fail. Your new code enables WoL and then calls at803x_set_wol().
If at803x_set_wol() fails (e.g. because of an invalid MAC address)
you leave WoL enabled. This is a change of behaviour.

I haven't checked anything else, but given the above, I think you
need to think more about how you make this change, and check
whether there are any other similar issues.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

