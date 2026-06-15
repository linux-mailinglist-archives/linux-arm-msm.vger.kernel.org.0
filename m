Return-Path: <linux-arm-msm+bounces-113233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ftIHjEtMGoKPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:49:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A561688890
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:49:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=iCrFXoYM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113233-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113233-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lunn.ch;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D26833010624
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01F3411661;
	Mon, 15 Jun 2026 16:49:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76739413D87;
	Mon, 15 Jun 2026 16:49:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542150; cv=none; b=Y7p/Lj2LHMtLrVNDGN9E2u0VjVxJiEW/UDzOUezBZEtrDKc3Ls+l7xXiK6AgiPshE8ymPuFYjFVe2tJyJvGRITyVFARQ6dUKonEA6Dvc2qAgEk4v9GepCSz1tRfBmlcJhsfcImVPYFjCQVjp57SDO3goJ+MoEWGc08EKgGqzvzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542150; c=relaxed/simple;
	bh=VqCsKRsvy+mxioqtQLOfn3znlkYCCyYsy9QnRBTu6do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2MBoJpFCPcuHChnyTpckMayZ+dIXpVgN43zwN6IRItVMr+FVKJEeKsWxVMcuVEIVkuNbSNKzetgcyqpgsAxnTfU7wZin2ZSPx6kY7GR+HJKcme2xiHFCmg9x83f5TpZUqEAKwohltGYhSD3lbbANASZLSRPhFe6kESFbI87EJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iCrFXoYM; arc=none smtp.client-ip=156.67.10.101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jC3QU4FZPqQg1AwNqnbDKfJyL5YE4F9tg8zVHB4z4v8=; b=iCrFXoYMz+xsVQ6gls0oFxtpMc
	jD3or/PzwT5ahterKZkNT0Npz5satnfMPG8wH1nDJtBSVmWfwMQ0gi/OJ7CSigQz8oAVDSSut07Ak
	jBgGPKYkpmLEGO4onHobglR0U5s0zscMls0GFQLmRcJbnH0goFxP2CXCDxrl7Phc9I5M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wZAUZ-007pmW-2P; Mon, 15 Jun 2026 18:48:55 +0200
Date: Mon, 15 Jun 2026 18:48:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai93X/cNWHtEQsDt@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113233-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,lunn.ch:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A561688890

On Mon, Jun 15, 2026 at 09:24:07AM +0530, Mohd Ayaan Anwar wrote:
> Hello Andrew,
> On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
> > On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
> > > When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
> > > the MAC must not add its own.  The driver currently falls through to the
> > > generic DLL initialisation path which programs it to add a delay.
> > > 
> > > Power down the DLL and set DDR bypass mode for RGMII_ID, then program
> > > the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
> > > ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
> > > 100M/10M, and remove RGMII_ID from the phase-shift suppression in
> > > ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
> > 
> > I'm curious how this works at the moment? Do no boards make use of
> > RGMII ID? Are all current boards broken?
> 
> Searching through the DTS, I found that we have two boards using "rgmii"
> (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
> "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.

So this causes problems. We cannot break existing boards, yet it would
be good to fix the current broken behaviour.

> I don't think any of these boards have extra long wires which would add
> PCB level delay. They are against the netdev definitions for "rgmii" and
> "rgmii-txid".
> 
> But the first two boards should still be working fine since the current
> driver programs the IO_MACRO to add the delay when operating in RGMII
> mode.

Which is wrong, given the current definition. No delays should be
added, by either the MAC or the PHY.

Please could you contact the Maintainers of these boards and find out
the real situation with the hardware.

It could be the best way forward is that you issue a warning when
"rgmii" is found and pass rgmii-id to the PHY. And you also change the
two boards to use rgmii-id. Lets think about the rgmii-txid case once
we better understand it.

	Andrew

