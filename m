Return-Path: <linux-arm-msm+bounces-91212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONZMJ6XYe2l3IwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:01:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1BB5284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B6DD3013D7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 22:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FA635E52D;
	Thu, 29 Jan 2026 22:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FuORfFkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FD326D69;
	Thu, 29 Jan 2026 22:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769724055; cv=none; b=mjlr10czhk6Yzila4jCKCJRFpJ8Au7cywedtl2YRoDofCFP7g2Iwh65hEKt49Qjgxd2Q//J56Lakv0WkQLa9d6eYJ5JjEMV3dd+if9N+Eq4MlFANUehhHEAXD3m9sB4gfo4rAtD6dzNkTsaLfdjCHGTn4xwC9sHaTXLYuBx/VTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769724055; c=relaxed/simple;
	bh=YqNWb+uEWkjz1XXk8wLbalCffPtk4g7xZuyyJzhd2iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXaaz4PLtKg6nSOcfw4guB6naEy4HNlpRhhNgEV/5A7zHcGH20DpMLAsoFJ28YUC3hcXX/9HI7cUdsRs6S5Drew6bixbEhsam9nXOkQ4OS93EyEEmI68KdbZQ9wQ8NbRk2GgPMDDAYPigmX4BlyI/NwFpc5qwRn1x9hjbc7F+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=FuORfFkK; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5NaZq7/qOx5j3sYVWWAXyxivGGckilTrm3I0MWAebJ0=; b=FuORfFkKV0DQIUUuMAonHTBSMq
	HF2MOUM/Hc7enwPm0B5st77tQNNjf0eKU/pZo/h8uFpZk3KazeRogVT16rnuLFu4rRtaZ6WB50HuT
	oQloQVUjqsYNnVPMNueythTNsQumeeZJpD7lFjQuMi2kGPSSZ/2aqJe5xufgqTlMcawAYyslgphns
	OxxQAsBSIewVc03grwlhmNGyURyOFRkdaZLHvnAGAntQeeeLslHwVSeWeW1Nl1gP66MfK6N91OFj9
	5OB/+2cFKWTslP6LNj6Kz3pKBbMrqn4RcR2kAjhsppKEXH6aexaqY+7IKQt7qE+B8ThTjVf70J7OS
	v6U1biyg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39260)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vla4A-000000000Va-0f2c;
	Thu, 29 Jan 2026 22:00:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vla44-000000008Kd-1QMZ;
	Thu, 29 Jan 2026 22:00:36 +0000
Date: Thu, 29 Jan 2026 22:00:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXvYhM6mHE4p_B14@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
 <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
 <aXjdAZeUl2Dsu4mE@shell.armlinux.org.uk>
 <aXsLyb+x76/WaXcs@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXsLyb+x76/WaXcs@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91212-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,foss.st.com,davemloft.net,google.com,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,linaro.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shell.armlinux.org.uk:mid,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 07D1BB5284
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 12:57:05PM +0530, Mohd Ayaan Anwar wrote:
> I was thinking about the "good" sequence (i.e., the current net-next
> tree):
> 	-> phylink_up
> 	  -> mac_link_up
> 	    -> fix_mac_speed
> 	      -> SerDes configured via phy_set_speed
> 	      -> stmmac_pcs_ctrl_ane(priv, enable/disable, 0)
> 
> Please let me know if you want me to try any other experiments.
> Maybe I need to do some more testing after playing around with the
> sequence followed by this series?

Given discussion elsewhere, it seems that the generic PHY maintainers
have come to the conclusion (at my request) that the documentation is
incorrect and needs to be changed:

	Order of API calls
	==================

	The general order of calls should be::

	    [devm_][of_]phy_get()
	    phy_init()
	    phy_power_on()
	    [phy_set_mode[_ext]()]
	    ...
	    phy_power_off()
	    phy_exit()
	    [[of_]phy_put()]

Essentially, most users of generic PHY do not follow this, but call
phy_set_mode[_ext]() before phy_power_on().

This will have implications for this patch series, particularly the
serdes related changes, and will make the update to qcom-sgmii-eth
more complex (as its current phy_power_on() implementation does
very little and isn't the reverse of phy_power_off().)


In the mean time, please test patch 2 to see whether that can be
merged.

I'm going to re-order some of the patches in this series to see what
else can be merged without depending on that and without affecting
dwmac-qcom-ethqos, and thus shrinking this series.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

