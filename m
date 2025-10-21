Return-Path: <linux-arm-msm+bounces-78196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7891ABF744E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 17:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259E218849F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 15:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7C23431FC;
	Tue, 21 Oct 2025 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sWV0ZhOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D2C342CBF;
	Tue, 21 Oct 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761059301; cv=none; b=IiVKeZAmb6D5RSfj/Hro/BUCN9Vqej+EfoKA1xWx7Gy3tlsMp0Ky7lBVVYI+lNzvkMXB9qqDF3gN6idIR1aCzJCYW+bK5XZOB9UVIGcNakpzgo6JfGTMtt8yXf8BDxooJ7N4bYC3PtSUdyiJowE+tcGrJYZ3kUD0qVtIK7uYLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761059301; c=relaxed/simple;
	bh=IGjOUBUClndtvZGsgegWC43Da37BaC6DfKMErVwR34Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxP4z8oOn3hGLQ5AZZOGneSnkxBfji/jKXDjP2yNhC6zVg3Cjnh7yipyUWcOYJxg1iXFYQN3FtQnKsJElASd8PEj4G9bSau0nIq2gUvLkL/F5Apg+ACz18L9R9s6X86RmAx/uZqbm5Rg4qrufbHJzg/Id44Wh8b6rPrDYv1Q944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sWV0ZhOh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7A52A4E41246;
	Tue, 21 Oct 2025 15:08:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 423FE60680;
	Tue, 21 Oct 2025 15:08:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58768102F2401;
	Tue, 21 Oct 2025 17:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761059293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7SnhTdf3/ZnBb/Auo/xtgJWFGAq+ocBosOYhh6RlpME=;
	b=sWV0ZhOhrBGkxxTsVko6gsm7SFgXKpZfniXDYQ+53CvCE3bHfz1UVt9V/FoRu3uemhbpzp
	jB+jLCo/zHeHi7GnJ2VUZzLrIe6TBV78WrURJ1VwRc0uUPQ64as+OQbLKQoVQSfSgmZ2Wv
	NEvux7I9qCCmbdTowGnMeiVgVc/sLqcv1vMUXRiFIzQIw7y2vnemItpnsTUE7oh1k7QWMJ
	xGi3s/FR3fDgX4bdRPhMmRXkspskq4ULH6LiADl/zV1zQMb/1yYfNREBBPfcZU/bhQogZF
	Ek3DxRNL14OEAxh47i2QrP+RiFYWdUtv+urGqqcVAIbuOn++ipgHmo+WQhzA9Q==
Message-ID: <0e71d2b2-a08d-4ec9-b0d3-9094d3802065@bootlin.com>
Date: Tue, 21 Oct 2025 17:07:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 00/16] net: phy: Introduce PHY ports
 representation
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251020185249.32d93799@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251020185249.32d93799@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakub, Andrew, Rusell, Heiner,

On 21/10/2025 03:52, Jakub Kicinski wrote:
> On Mon, 13 Oct 2025 16:31:26 +0200 Maxime Chevallier wrote:
>> Hi everyone,
>>
>> Here is a V14 for the phy_port work, aiming at representing the
>> connectors and outputs of PHY devices.
> 
> I can't help but read the lack of replies from PHY maintainers
> here as a tacit rejection. Not entirely sure what to do here.
> Should we discuss this at the netdev call tomorrow (8:30am PT)?
> Would any PHY maintainer be willing to share their opinion?

I may have gotten my timezones wrong, but this call is in ~20 minutes,
right ?

I didn't see any annouce for this netdev call, it may be of too short
notice for the PHY folks ? I'd be happy to discuss that in any manner :)

Maxime

