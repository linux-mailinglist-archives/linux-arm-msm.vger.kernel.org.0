Return-Path: <linux-arm-msm+bounces-94016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCLLFNxQnmmNUgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 02:31:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD1918ED91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 02:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AD83307204E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 01:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DDD24A05D;
	Wed, 25 Feb 2026 01:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bdz8JTGr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC722579E;
	Wed, 25 Feb 2026 01:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771983018; cv=none; b=t2iXlqgJnHpHYWGHHQhiDi4kpLFwsDlyR+h24bRKFiz0j1KQH6zsLblwhO2tv6JHRUgdIQIE+UizTWAyXxANlWzlnfZqsIFX6/HbHolhPtf+M76pPapXhh+Zea21iRKaVhtSYt1r0lE4lHeZCeimH2yv/dbwU6YfickSnt+ZaZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771983018; c=relaxed/simple;
	bh=aST5qqLMoSIy2p8gi3LQpFwSGk8TlO+UcitqSOx0rLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Haful3DHtPCKcCmDiHJUrpH7e/OWOJqsv2Xnavw/uSv+uMSFRKJo2pBxliTl4yYwXi4G2K6Z/ZUInvQihwVjk6A04LYAA9Jy6cMRG8lTGPuIFqSAsJwg2BhCaV8iDxh2zri1sZdM1AEfINgP8QJnJtKrrMfAlPns2kV6eEOJXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bdz8JTGr; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ufDQ0fUtWsvfQhbjJOQTgw5KO2seGIzv7CfmCQnwbl4=; b=bdz8JTGrtOd6HiHj9Y+MNZFHuO
	KW3GozSU8occtDOwywyv+A/zkYXKCfGSx2eDoDaTO5WLbAFrqaO5xMZaAddvGE8goqEtFQS7Tprp8
	/oLuogpyyiWApdP4Ws3RoTXPvNfLDZeAuMVrWKY0bRLbIneT1GCqnzt1JcqJ2R8930m+S7mm/EyyL
	06UrcKGkM2k56QNKbrIh+lQ+AII/rj0DGgDA/RLr/EuEWqpcyUtnDcXKPoLwkkaXxid4TgpMbCLiS
	zhCncimJpHZy8CnqEVBNrVaQnTX20Oaj3Gh3XlneACqJ+ASGNnBQ3cJe1WtHeSbRJ+o+4hyltiw1R
	oBWn4Iqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45494)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vv3j4-000000005rx-20ko;
	Wed, 25 Feb 2026 01:30:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vv3iz-000000000SO-1u9Q;
	Wed, 25 Feb 2026 01:30:01 +0000
Date: Wed, 25 Feb 2026 01:30:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 08/10] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <aZ5QmRjp_78ZT_Az@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
 <E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
 <20260224171052.27bebff0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224171052.27bebff0@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94016-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3CD1918ED91
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:10:52PM -0800, Jakub Kicinski wrote:
> On Mon, 23 Feb 2026 09:34:51 +0000 Russell King (Oracle) wrote:
> >  	switch (speed) {
> >  	case SPEED_2500:
> > -		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> > -			      RGMII_IO_MACRO_CONFIG2);
> > -		ethqos_set_serdes_speed(ethqos, SPEED_2500);
> > -		ethqos_pcs_set_inband(priv, false);
> > -		break;
> >  	case SPEED_1000:
> >  		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >  			      RGMII_IO_MACRO_CONFIG2);
> > -		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> > -		ethqos_pcs_set_inband(priv, true);
> 
> Not clear to me why rgmii_setmask() goes away in the 2.5G case?
> Just checking it's intentional..

It doesn't. The code ends up as:

	switch (speed) {
	case SPEED_2500:
	case SPEED_1000:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;

rather than being:

	switch (speed) {
	case SPEED_2500:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;
	case SPEED_1000:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;

which is needless duplication.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

