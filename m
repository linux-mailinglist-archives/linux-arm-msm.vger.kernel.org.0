Return-Path: <linux-arm-msm+bounces-93994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAL+K1eonWmgQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:32:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F3187B93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18FB631A41DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA68C39C65E;
	Tue, 24 Feb 2026 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="plDhhVVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6F396B8E;
	Tue, 24 Feb 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939529; cv=none; b=eMytBCCAvpheNr/IL3y4Brlct1GeYklVOJBzEMmDd9U1hcXvlrLqCxAzOL1g7mHsAJFJvso3ulb6AuZagfm9YEjB6k+QzUznDxMU8FkrhBexXJupOnPcgpyHwaGhR2OoP/OUWIBXS5OwsxrtrHsJkEHTaTUpaeLabV4m6e0Uh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939529; c=relaxed/simple;
	bh=Fd9buA8hd1MpbK8NwClydRsXgWzmjUVRoIb9Jt0q+c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdvpUB46q8koh5FOdKo7oo80kXJ1l2dzMmAngaMXkyMQj3RXFnIB//RJWXGdCivgyWGNdviFMoek0044bK6sp3zKfwOVoYYF9QURfLIM2pMoOVd52og66EGOyizcUXrAhkH+FumfaSs1EBw+VVYCVKsqTO/e5dXzRX1lP8CHzgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=plDhhVVb; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L1jpiQ8THLDqRtoaEXu/fuXezfN+f17gE1m89GkKEOs=; b=plDhhVVbc6DSxhd4zZqeTFOTgU
	ZL1e6WrSDNHojmnxL+aDUlAw03T0J7QWeBQFQ1AkMN/fROWFIi6X5XS9AMqaQTcwW8dKPIFndispB
	pJPeNZ9+U2ypOffCdWe91ROpx1UM+cHj39DkL9a0whhUSenQAM85pAD9WlZf8+fGvsYtHNTre3aPg
	1HWEkBjZTPMHBWA0yuodfNkkI29SKwWBruTzWaU23+ZKucsGt/e43yfte56su7Zog3hMJP7STqXi9
	dNwUcAmmEc7bauLHiAtfsdIG6FBG9IuXt+4FTrnPrIJm49+zk+bRiQJK/6gaqDffDkh66f6phAu0S
	6WJs9fZQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46252)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vusPj-000000005IC-0uSE;
	Tue, 24 Feb 2026 13:25:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vusPh-000000008Oz-2SF5;
	Tue, 24 Feb 2026 13:25:21 +0000
Date: Tue, 24 Feb 2026 13:25:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next] MAINTAINERS: Update maintainer entry for
 QUALCOMM ETHQOS ETHERNET DRIVER
Message-ID: <aZ2mwRvjgHIc6Wbu@shell.armlinux.org.uk>
References: <20260224-qcom_ethqos_maintainer-v1-1-24e02701ea52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qcom_ethqos_maintainer-v1-1-24e02701ea52@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93994-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,armlinux.org.uk:url,armlinux.org.uk:email,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 071F3187B93
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:58:47PM +0530, Mohd Ayaan Anwar wrote:
> Replace Vinod Koul with Mohd Ayaan Anwar as the maintainer of the
> QUALCOMM ETHQOS ETHERNET DRIVER. Vinod confirmed he is no longer
> active in this area and agreed to be removed.
> 
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

