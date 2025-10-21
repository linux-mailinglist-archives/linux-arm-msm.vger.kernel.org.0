Return-Path: <linux-arm-msm+bounces-78102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55913BF5309
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F40BA3A4316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 08:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A04E2F0C6C;
	Tue, 21 Oct 2025 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jylajQiN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100A02F0678;
	Tue, 21 Oct 2025 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034182; cv=none; b=p7LQRB0RUaZnn8lka7Qa9mTNyumFC2K3quBMexKvjLbs4isYqYgfpgB7f+FRnDrbi4NiqyCKAKkPKJeEnH19JebIWBmV5pEH4J/x0kWWkAz+Im33DSUw//EOSmYogI4vY3xNNP3jc6Cfzf9NkrGA00MPBz79mU5+o4rwhMfjglE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034182; c=relaxed/simple;
	bh=2RdxWgIsanqm/sfNnjLv7GBwDmpGRLZbb1yuEaSRVlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lK5PIBwHUq8tDFDcxQZo0qANdBchlgTClTjBRrIdn8HLczzEGt3iyeFBKp5MqOyNHLOpQ/UIWXbr0byUOBOSUy0pUvRJccp675kZUd+GhhA2a8Lo79++lBfIbn7TiqhpAMeMzVS+MwxXcvU1bG0VCTV7PAviqxlQTzm2JyGCErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jylajQiN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF5A94E4123D;
	Tue, 21 Oct 2025 08:09:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9610860680;
	Tue, 21 Oct 2025 08:09:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66C00102F23E8;
	Tue, 21 Oct 2025 10:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761034169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uaJdoHn0NXDruimCAXmm8uA1Fs0q8Xm1i44RzkSnJK0=;
	b=jylajQiNswkpvpiLrpRh5lrXTaTqojw5jEJqLhUpL/ZqFUrnBRcvcO934JwKAlNNYApAXd
	Sa6UwGEwL9e7y7wlca6U8b/EFgTvmvkMJVHolpYSLiKOPISIh+A1ls3iURh15zFbPzjOu+
	XPZYQBSdnp9dDMWl/ocXovDmJw7NSZe/lsy3KhCehdtTUqhpdUsOf48DKEO5LRmS4EiS5V
	AxxsyDVpFYgG13bX5wjCFfPkuhjz12m7mTIg3OtJtfr4P4eDUthaIBQP4U1m2l7Irn8T/4
	4dNS7GVGHbn9Ynvqgg2jAHkA+XFZjHhCzL/OG2wBsHsoHbLo5zwAWywiJObqZQ==
Message-ID: <29322269-6d27-48da-a58b-1d2053369833@bootlin.com>
Date: Tue, 21 Oct 2025 10:09:19 +0200
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

Hi Jakub,

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

I can definitely be there to discuss this, thanks for organizing this.

Maxime

