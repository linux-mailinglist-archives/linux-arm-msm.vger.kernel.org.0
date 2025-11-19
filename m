Return-Path: <linux-arm-msm+bounces-82499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA4C6EF53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3B4BF354139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 13:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664582652AC;
	Wed, 19 Nov 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0gmiVh8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EE1233707
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559120; cv=none; b=rBJqzNqVmibQ6x2KmSUnR/7MKcDFp5aZLDM/WZEmpQfUysuiojm0ZTsLCXWk/Y+OWZ1jWUXxhDoeJlrDsXhEPuHxFdT64BFnHeSAeI9brQgaglAQGrodKT1wBdXwarOTDT993SQb7D6ZZaL+GyLYJhCusLVrcHe2KHVlczj5JVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559120; c=relaxed/simple;
	bh=L7hBarKPUmNpwYtkBk5JgY9whmoD/B5fYafhItwPHVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAx2IhKCCMIaA1QIggomYYactbWimFvYX/oRyGWGypTAcxb05gJ2MecG8HOnowpzbSUG0nbGAELHksHxDsdggMu4YE5VzpJ0LtcKcZT9B0EoNLZJ6Nw6fFTIGjAbXjyPvJCOXp4lEG3BLuj1kMAS1WttXrAcJtozakwrNCG1MbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0gmiVh8U; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 22197C11188;
	Wed, 19 Nov 2025 13:31:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 592C060699;
	Wed, 19 Nov 2025 13:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19C3F103719E1;
	Wed, 19 Nov 2025 14:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763559115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=vaS3ZdSbPQezkjUn3kY0l8sOg9ANCiNcfd7cBBiSjJs=;
	b=0gmiVh8UaCRT7zY9SiDcEvIiKuAsdvMVd7SaAZy19TBxbHoFKHeT4joUfdqGlfkHEil3KE
	YDrSOX3Rlayrdt9Ue6VF60cfxajoF6LxefKpc+V0PtL9SmPDDW9b8hVZX11rzm1iLptLuF
	cq2GRnN2gMZ2n3A0uDTV5C7E2228RMhpPNZaksuRzTvg/fHy+V9y5pUpgZol80MCyPBjtI
	9svpCUDUrKFNBgW1SR54P9+Lb+t/6KFWt0x0sZ5j/utytcogyr2Z7lAwJb2DIrszSdrOF0
	n6yNVdk8Bjvp0sOiQ4AWVlkPxE4ZOGNkTNiU4JSzSN3JadYqTpqzyqqIImMDJA==
Message-ID: <2013f0f9-d1fc-46b9-b068-438cb19954b6@bootlin.com>
Date: Wed, 19 Nov 2025 14:31:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 15/15] Documentation: networking: Document
 the phy_port infrastructure
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-16-maxime.chevallier@bootlin.com>
 <20251118191759.28d14e32@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251118191759.28d14e32@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 19/11/2025 04:17, Jakub Kicinski wrote:
> On Thu, 13 Nov 2025 09:14:17 +0100 Maxime Chevallier wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9281,6 +9281,7 @@ F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>>  F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>  F:	Documentation/devicetree/bindings/net/mdio*
>>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> +F:	Documentation/networking/phy-port.rst
> 
> I think you should add a MAINTAINERS entry like the one we have for
> NETWORKING [ETHTOOL PHY TOPOLOGY] no? Please include some keyword matches
> on the relevant driver-facing APIs if you can:)

I'm fine with this, I'll add that for next iteration.

Thank you for the round of reviews,

Maxime

