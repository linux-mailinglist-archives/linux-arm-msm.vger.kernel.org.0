Return-Path: <linux-arm-msm+bounces-83558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0410C8DB20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA603AE9D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8A1312828;
	Thu, 27 Nov 2025 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Idmcn53Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C762E0418;
	Thu, 27 Nov 2025 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238275; cv=none; b=LZvN+GdPFBHTRz2DIi7IB8BVTO+Z5ci/QeekYO+LunpjGYqu1fmqDl19uubjL+OJxMQP7ry59AByBtLiukg84TnJYnEHOGZBYW9etcTwYoBrPapqDiOKdLzz2pZa3dQWTzrhkt8GGdvnBckS+93AYJCPydWuhMkrXmoNr6tD9UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238275; c=relaxed/simple;
	bh=2HGfB5j9YlLHgtEiJGWYzgf7NIn4w1hqog7vUncJOd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s24ZdINUHiGXJpjFXkBsD3niWQlryvvER5vujQxmIBrVDHBHr6q1s3tmCyv5JbcIWGzW9mD0ja2rSXnibrgTD4Sf+pYG+paIsgkMcMZ6poTUHTIDzCeDWPp7bn0Zo2ipaMi/0ndpThBP+tXYz+LcVer9DEXaR2RadE/6A3iB4Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Idmcn53Q; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC3B6C16A1B;
	Thu, 27 Nov 2025 10:10:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7ABC06068C;
	Thu, 27 Nov 2025 10:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 813CE102F275A;
	Thu, 27 Nov 2025 11:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764238270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3UuhlMt+xKMZUo21Zwoyz9Z0SmtmmUjCG1ylmETi6EM=;
	b=Idmcn53QlfBfCgbcymkMTd0ok7+aou9cOVD0Hlxmegy9ogCg3hnJIYpRN9wkK5QRcyAbHV
	VeYPG/lv+3K4E5atdFIx5vbbTSTWoI5Et1hxldmQI63H8ZT8ZpISh8W12V1IBP7TLjVVGx
	qNJWvt8vA5+6Yfudrvf6DeYftZrLLSevl7NARl3PS1m4wgCt61KAWPZR6qXNFJr6oteavV
	7G+SOjSoV5eqnHW7zbJ3KaFD66CejCXEUihtV8DmVuI81n4Pj0CMZ/l605ffTIDW2LssuQ
	Cuw/bB6b1tFMv9dJJfE8o2rCAeZlyeS7i+vH2tINTIS+baB12qkYubtEuxdYcg==
Message-ID: <966bb724-59bd-4f45-a2a6-89a1967a851e@bootlin.com>
Date: Thu, 27 Nov 2025 11:10:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Tariq Toukan <tariqt@nvidia.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251126190035.2a4e0558@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakub,

On 27/11/2025 04:00, Jakub Kicinski wrote:
> On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
>> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
>>
>> This v19 has no changes compared to v18, but patch 2 was rebased on top
>> of the recent 1.6T linkmodes.
>>
>> Thanks for everyone's patience and reviews on that work ! Now, the
>> usual blurb for the series description.
> 
> Hopefully we can still make v6.19, but we hooked up Claude Code review
> to patchwork this week, and it points out some legit issues here :(
> Some look transient but others are definitely legit, please look thru
> this:
> 
> https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574

Is there a canonical way to reply to these reviews ? Some are good, some
aren't.

I'll summarize what I've done in the changelog, but it skips any
potential discussions that could've been triggered by these reviews. I
guess this is a matter of letting this process stabilize :)

Anyhow I'm impressed by what it found (when correct), that's pretty nice.

Maxime



