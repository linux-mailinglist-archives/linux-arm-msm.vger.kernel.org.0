Return-Path: <linux-arm-msm+bounces-94557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eECYDugyommU0wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 01:12:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F651BF5B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 01:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 082813045029
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 00:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02BA6A33B;
	Sat, 28 Feb 2026 00:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XlYnerF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00DD3BB44;
	Sat, 28 Feb 2026 00:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237507; cv=none; b=p/ct6diHmAdjDAa4AjtEYXtobepUGCS9DIQ6EbZDQMGypvbsrtjgMT2+n8NJuCLivhn4b2wRdlD2c2QT/ShABDOD3l8Fd+egOUksiU3Ko4ziTUWDqaZpfiibmfRkMTakpRQTgikxqjadIr9ikpHLl/81JH5cO4CaCR9uiL9i0go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237507; c=relaxed/simple;
	bh=VUKGXTJ10ovocXd1o+uaQ8y3MY6Z5p2+y8a1Ilec9fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3juFjARl8Dj2YE866iCBZI1AM4N7X3l5z6Eq3ZSIrTxm+X8y91bKiMpz4RLYalsX9KAq+E9tvPYmZ0QLMymyBA6+GNYij9+0PQWcbWLrc8kNvzOz0Jbtryj8qG4paJ9yvj17NuPPc/yLjbtWnhC2Z8hbFsfiUGarCXOAYyrdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XlYnerF5; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GZdE3v1uM6dshlMijAz4RF1iw09aYz2wg0tBwp/dyGA=; b=XlYnerF5xK1Ql3eFDyGif3TCY2
	lfIAnzkBeHR3C7xAuoMd0iZlod2dCvxiH0kDHYgoxRbb2hPiQ3d8W5ER859VOyBAYAdOKf8cs7NTJ
	Me1GZrqatduWjJVAio3hJRolyvfJkQ1VfGuyFKnzC+O8Oc6LT/vjJKxMaB4RRiqSvur17Yb4LN0zC
	cHIzkBRkf5Qx+kZfdWnscVzDOZ0bu03U2P11u82Yp8thQpexjjSWxx5Z9xzRop9apWv+tyit5ihu3
	/xNEh60H0vH8sU1tfSghfrBv+Ucx5M9JQu8IYeO30o5BJ+YGyycDBvbLTvApaoifmtps/5GKE8BKb
	dQDPhLoQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46012)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vw7vj-000000001Rv-3OlC;
	Sat, 28 Feb 2026 00:11:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vw7ve-000000003WJ-2CMn;
	Sat, 28 Feb 2026 00:11:30 +0000
Date: Sat, 28 Feb 2026 00:11:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
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
	TAGGED_FROM(0.00)[bounces-94557-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.758];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shell.armlinux.org.uk:mid,armlinux.org.uk:url]
X-Rspamd-Queue-Id: D6F651BF5B5
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:07:16PM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC. This is replaced with phy_set_mode_ext().
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> Mohd has tested this series, but it would be great to get acks/reviews
> from the generic PHY maintainers.

So, PW says "changes requested" - please let me know what changes have
been requested.

The AI review for patch 7 says:

  This commit fixes a bug but lacks a Fixes: tag. The commit modifies
  behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
  .set_mode() and .validate() methods") by making phy_power_on() call
  qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
  making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
  before attempting calibration.

  Should this commit include:

  Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")

which is _wrong_, this isn't a bug fix.

So, in light of AI review being incorrect, my comment about re-sending
due to the AI review is no longer relevant, and no changes are required.
The only thing that's necessary is to have Vinod's ack added to patches
4, 5, 6 and 7, as he gave them against the very first posting of these
on Wednesday. This is despite waiting the required 24h before sending
the first resend.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

