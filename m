Return-Path: <linux-arm-msm+bounces-111447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id An9/AQT1Imr4fgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 18:10:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB1649A2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 18:10:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VRmTccUp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111447-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111447-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33E9F300C252
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FCE3EB7E8;
	Fri,  5 Jun 2026 16:00:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51643D5C06;
	Fri,  5 Jun 2026 15:59:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675200; cv=none; b=qPaw8KAHOUa8hvurvAMuKogxXkdNo52Dwl5Q9NdmKToaojGnzMOeVRr/HBJCuhDlOqsIjgcpDBOAP5gLXGFOhmcZSiC6Pw38yqAg47OdFOnJ5TPrUxYinIu/a54CvwoVagrBIIN4n7TKLcELaDbdcr1ToSEueNpHv7jJgcUdjME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675200; c=relaxed/simple;
	bh=yCAGbq/6JlyTZp4QI10TckEayK0yDn1kPsMjsDABZF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/xP3qwl3yrnMJEVjdmOX1v4ANHsA539y82rXu3qia59vQSqL7WQ2Uta9KZ6r7/HYXJx0Div6kgkaDnK7nCsfJQtUgGnC0z9WWa/Yo3m3Hat90LNeG80P/fj+FyI1eet2xB7tRsE4SHgV0W3ml3PJBswbKX4AyiFUHmTviEGkXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRmTccUp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3551F00893;
	Fri,  5 Jun 2026 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780675197;
	bh=ObS4SJI1Hi4ANlAVGEHF39GV4a6SL8/PZg5/oxRIZLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VRmTccUpapuDZg1/Vo2DsF06NMWmciMkNXi/GgmSGq3xx93DqVQHxLpPk4g/WCV2U
	 EspohMbt6QuyOFDYwEftJjiC9mwsZYm1zh5s3g/Pc0pFxvQflbAmZYMIfLguDRvKZC
	 KdVcyQGeu6j+/RCkux/B2CP/JSz/gX06GALj81XaV4nmYmdQipIGfMFSPlPS2e5WQ0
	 jGfhtTpvcey86tuJk/JvHD4lta2OBBcHqx41l52ANQtq+cMXyqSwl8vTarHNdfJnc7
	 /N4o+bCi3Menj58/hh6WGqLKKa6Vyd9sI7jNHJtDqvCvram8JzqRLePprdObZ7zYEB
	 BZ3vvnXgLpOAA==
Date: Fri, 5 Jun 2026 10:59:56 -0500
From: Rob Herring <robh@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: net: ethernet-phy: increase max
 clock count to two
Message-ID: <20260605155956.GA3788055-robh@kernel.org>
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-1-f232d9ca0966@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-ipq5018-gephy-clocks-v3-1-f232d9ca0966@outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111447-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79BB1649A2B

On Fri, Jun 05, 2026 at 04:41:26PM +0400, George Moussalem wrote:
> The clocks property has a restriction to maximum one.
> Yet, some PHYs may require more than 1 clock such as the IPQ5018 PHY
> which requires two clocks for RX and TX. As such, increase maxItems to
> two.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> Commit 350b7a258f20 introduced the clocks property with a restriction to
> maximum 1 to the main ethernet-phy.yaml binding for Realtek to add an
> optional external clock source. This is restrictive to all PHY bindings,
> as some PHYs may require more than 1 clock such as the IPQ5018 PHY which
> requires 2 clocks (for RX and TX).
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

