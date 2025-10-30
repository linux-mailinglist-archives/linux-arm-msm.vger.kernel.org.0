Return-Path: <linux-arm-msm+bounces-79702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EDDC20D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F1794E18F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E58329C57;
	Thu, 30 Oct 2025 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zPEnt6Gx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D7223DEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837139; cv=none; b=l7QgdUF+7/klS+miXDpFEZu8QyzDsLmKi1kjGVNe3+FV9dOOUNBK3FPKimknHFshVZ0Lf/qFFgiS3X4qekt+4vJoOMq5ayrR+EXwBaySuEtiy5o+RWcQS6UMOBkwCleDiP9+auPX73edlwe5cGS1V3955u6IPWU44QPMLCrxf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837139; c=relaxed/simple;
	bh=3G4lqWMc1AkeEiG7YXtkyeLXQgjioYuAuLZXFGLYomI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EseC9Qha1N2Swynlz6d9J61LtnxAiTFk2OePXMRjn4akSYXnE6hVevZuzTCPujDJiejeWsQl1wpscB89nK6ZS9TyLc89x191lgVh3N3F0TmEKKRPtWwqKrFD3vIXjiIXRgRIFq0yA3OkYEfmCATdFT0UdQEA1ZYjeLAwN9YF1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zPEnt6Gx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E134DC0DAB7;
	Thu, 30 Oct 2025 15:11:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EBB56068C;
	Thu, 30 Oct 2025 15:12:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BF5311808B5F;
	Thu, 30 Oct 2025 16:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761837133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=75eS/O8ZNC1UyL0u+tQ9cvsjlhk53nqQlsjqo1BsDyw=;
	b=zPEnt6Gx1T/+JmQGIi5Xj8VnqeU74tUBVaqL8GRS7d3W8tKP0TTb6IU1r8GFexIH/5C9Oi
	iZwXrcaZT1t2s4qvNWb8BVcpaWlfxmLO7ukREzj1VqSLNovoXOD5YMSPSjexGNKf9hY8ch
	B8kWX23mTs7ilbHAtUEH5W2ZX4vG1f1vS2xoOq4kZXGBz9J4iow0UTEyngIyMSWZs0pM4i
	l0qR6gJKaIpeXC5uawriwcpGUGgDjPQiCMiKsZJehkUiJ6m2/FCUQkcWT7WIS7IJ4k4rVi
	XoWtn5XwfsAMARi4HB8jNYujGm3YuHy8SnKfzBuulNK2Wd74LYMmxVQv0SzZ8w==
Message-ID: <fd961879-bf35-44a6-a043-4a335e6fdb70@bootlin.com>
Date: Thu, 30 Oct 2025 16:12:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the
 ethernet-connector description
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
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
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-2-maxime.chevallier@bootlin.com>
 <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
 <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
 <7a611937-a2af-4780-9b88-cf9f282f88b3@bootlin.com>
 <b8561c97-483f-4f43-897c-4bc3a4b916b4@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <b8561c97-483f-4f43-897c-4bc3a4b916b4@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 30/10/2025 16:01, Andrew Lunn wrote:
>> So that being said, an option could be to only focus on pairs, only
>> for medium = BaseT, and ditch the "lanes" terminology, at least when
>> it comes to the DT bindings.
>>
>> Does that sound good ?
> 
> That sounds reasonable.
> 
> In the binding, maybe try to express that we might in the future
> extend it. You can do that with conditionals. medium is required.  If
> medium = BaseT then pairs is required. That leaves it open, e.g. in
> the future we could add medium = BaseKS, and require that has lanes.

Thanks Andrew :) I'll update that then !

Maxime

