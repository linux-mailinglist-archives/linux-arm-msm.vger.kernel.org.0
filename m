Return-Path: <linux-arm-msm+bounces-83547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B52C8D63D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 09:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C8214E5DCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC523246ED;
	Thu, 27 Nov 2025 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ow3WjpYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731DA3233F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764233018; cv=none; b=PNSGOdYplRnO98xH3GjSZxn3r6LalOXwauZfwT6Zael4eqmXafPL1H/1of7CxYXJwDvBaO8KXpn4pCG11kePFFg5fw8xcPtwbXj0flK0w22uTNY6V+3cQwNMxFEtyiSv9YwF0fjo/hR9b5cK7b7EB1AylVR1ZZOO1q5F7+Tt8a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764233018; c=relaxed/simple;
	bh=lnI6VphI4sRWqtqle/2ZNbK8+6JfJjQ2SBCO9HiGERk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4hDzxOJOS5PMYcrzSDjVTM7sQ9kyp/4CQ64IMbQbK/abhIJ7y8p72ung71vsmdTL+e0KpnK4yP+RHmfEn3TiaQddsriIgTRR33WkLMXLXsgplnU08VzyjkHHpkkGkwNlYb0nddqMzy0CZrtDhMbYtCuYhBjrocfpHQvPXCV6yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ow3WjpYq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A77B64E41916;
	Thu, 27 Nov 2025 08:43:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76AD46068C;
	Thu, 27 Nov 2025 08:43:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 412E6102F260E;
	Thu, 27 Nov 2025 09:43:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764233012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=v7i/xAYNg7oAhrbuk/a3rHlIdqx/C0f22ZxKL6Ehfco=;
	b=Ow3WjpYqNNJp+x/vNohs+/R7Oc49tIZj7N0oOYB9+x4kBl7GjIu4WI8qw3xoCEgntcZnpk
	QElwUyJKuwMYZR9cypkMQHGBGZEmubkGy7OGF9zE9DS+eK3wArMTvmsXsAh1zD0MYoY/vM
	lgZqxqNJMGkQBCP1OfegeFJEbj+c5UnKoqu49LCU3ef0NXWVrN5oNW5nYYUoEmJk23kzJq
	bdJm50S2L3db11jQmMugY7wq4J8l440bPI0kksUqiPhfOzSlLkskHUSb89pt3Rfvqbtrln
	/5c8JwolI7gDq2gAKjLQxKPQSrKDWrTmv/OBmm3ZRwQyF7vOoLsHq3wgzVYnPA==
Message-ID: <e4bdc937-04db-421b-bbce-e71f0466672a@bootlin.com>
Date: Thu, 27 Nov 2025 09:43:23 +0100
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
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
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

Heh this is actually fairly impressive, I'll go through that :)

Maxime

