Return-Path: <linux-arm-msm+bounces-93928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGibE9lZnWmlOgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:57:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F86183570
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F1F83016EEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350D3364EBF;
	Tue, 24 Feb 2026 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="nN/T9M+v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bdmc02QW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CAC364E9A;
	Tue, 24 Feb 2026 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919831; cv=none; b=V5Qbjq8CEyLRmembJb+JE8jiOIhgwUUKU2VwpoAXQx0liHJXnE9Petkp0spGX1xyzO10yBf61IBN5h24hDyxJ3fb2dG+MiEzZqk9KKsQ1Jc+fmK2SP0id1Z9lGDNeAWqReft98H/5yDs8M+j7gEljjrTKx24Cv13yJWORCGJFiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919831; c=relaxed/simple;
	bh=bTIjanl1ROwkCGJcUveHfG1+yFMvz2d0psnXVYoN1Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBBf5norpZwRWcABKdYXZ57szYTIaoGIYi2F2TtZAN3V23iyidf/PFxWmGZy7iIXtelsiqQzaQz1Hk4Il964mfZnwsomSK0Sc57LXkRsjhRapRUk0b9XYRPriSTb6N5hevw6Tsy4MlktKnUOgJbWAu+idpCZC7HsEEIuonIFmLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=nN/T9M+v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bdmc02QW; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 43A19EC0330;
	Tue, 24 Feb 2026 02:57:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 24 Feb 2026 02:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771919828; x=1772006228; bh=ldww1WlQMk
	oL/zBNyH/ndnXhb+ElXOiHG/mK0hPi1Qc=; b=nN/T9M+vmH5YqvY1M4+dtPwULO
	CPqnNKjgIsJ2ihdGyRkXskoJXQDDmxTU1S967RwRLPJf55RPZgGRYw48Z7TAK9Rp
	Rmz5xaZhz7yAIDMCXS5XdbuTQLwVrHdNNgA05yiRl4zmM0uA8V+IVZM2RcVbz1+j
	KgKwZJdBHEsyzgoWyZF2B5koy1pNgtPhhAfnHUy81nXnwyC3n77smPEbZktI7sBt
	dG/g6vMhwz4QMBysMcbFuJTt2sPcSdw0+WBUiqSUwyreI01eVfbcHR3bcWNfeqIw
	4308RgbuurCQgufA6hqQXOl7qOITn/4dGwk9Pr89eOxZUjdOUQ0+Mb0/HAeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771919828; x=1772006228; bh=ldww1WlQMkoL/zBNyH/ndnXhb+ElXOiHG/m
	K0hPi1Qc=; b=bdmc02QWewmtGwV3ILdMIAeoaK4OpigMC1Rc9l74iN0cios4jBv
	VGiZC4gUMUJkEmy5EWeqvVjwSXTsYS0ntRXCHv0XPTJoymwKAQTYRxj9bxfS8MHW
	SI9CmQgYGTjiBvJNgawmkB1DUD6nzgSOmsqAOWOyQWP5mGaV4c7ilnxFS7BIhKwT
	CA2fhdMtM7AXx6K3p5AHIIonzi6gSUhr963d7wHpF9CA0aV2JwGFU3IcLEF38WBI
	AkvvRAR8aWTdBejQPLxS+GvmaekdpkxCPnXFgwnMM1aWwxIb5TSMHya+0elUsoo3
	iFyDGwT6aO9ERBXsohQ66akUMf5my5HbUNA==
X-ME-Sender: <xms:01mdaUjUsyTtDSNTcu2odblcfhI0IeSvrnYO7oBCOZ2bO1QDJkrJjA>
    <xme:01mdaVLkqH5ynk9ohtpxRuVYvrUb672JHQ3z-fXXYQA3Cobu-lTKT3Qb5P_NbQEtp
    1RmxQP-PsXpApyTSXn3ugJBToG0kAD1ljjxSukRz2ljcYXw2_6GEozf>
X-ME-Received: <xmr:01mdabnwOwxd2iOX4HaIZzuWaPF_lZXBfhWni4owJblHsZxPfuN35BTC61xAGN4_dTY2r0ol05HSQlhcoBVyHKBXT48yC_pmXL8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeeliedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehoshhsrdhquhgrlhgtohhmmh
    drtghomhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    nhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhr
    ghdprhgtphhtthhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtph
    htthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheplhhinhhugidqphhhhieslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    gh
X-ME-Proxy: <xmx:01mdaVMzwroFnj39sRBE1ZP6UfRkYYKP8xh4Eri-FxBTqYAeWrQDsQ>
    <xmx:01mdad6NQMaFSVf9mb2Rd8rz76GSjMJ4tlkXuoBGozwzlwpcb8fqig>
    <xmx:01mdaRZ7BxuC8sAAqhK2bN_4ZkTxYTKyAMI0O68eWe3Pq1rPTI3mQw>
    <xmx:01mdaSc3918Gp60VyRKHANVNtwJYzDJlpyU_g8qNCM58BSf5NiYZVg>
    <xmx:1FmdafEQ5HQiUWC3y0T9sK-O5XRFLbybtqoG4Er5bS92OzYedtH7yOcO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 02:57:07 -0500 (EST)
Date: Tue, 24 Feb 2026 08:57:05 +0100
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: apple: atc: Make atcphy_dwc3_reset_ops variable
 static
Message-ID: <20260224075705.GA1310076@robin.jannau.net>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-93928-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[jannau.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j@jannau.net,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,jannau.net:email,jannau.net:dkim]
X-Rspamd-Queue-Id: C7F86183570
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:04:14PM +0100, Krzysztof Kozlowski wrote:
> File-scope 'atcphy_dwc3_reset_ops' is not used outside of this unit, so
> make it static to silence sparse warning:
> 
>   atc.c:2026:32: warning: symbol 'atcphy_dwc3_reset_ops' was not declared. Should it be static?
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/phy/apple/atc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index dc867f368b68..32d97226e926 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2023,7 +2023,7 @@ static int atcphy_dwc3_reset_deassert(struct reset_controller_dev *rcdev, unsign
>  	return 0;
>  }
>  
> -const struct reset_control_ops atcphy_dwc3_reset_ops = {
> +static const struct reset_control_ops atcphy_dwc3_reset_ops = {
>  	.assert = atcphy_dwc3_reset_assert,
>  	.deassert = atcphy_dwc3_reset_deassert,
>  };

Reviewed-by: Janne Grunau <j@jannau.net>

thanks

Janne

