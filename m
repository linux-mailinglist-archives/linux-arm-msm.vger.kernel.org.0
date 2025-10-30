Return-Path: <linux-arm-msm+bounces-79682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38118C1FF30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 13:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612834212A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3224F346E7F;
	Thu, 30 Oct 2025 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tdCXrFYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491FE32AAC4;
	Thu, 30 Oct 2025 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761826411; cv=none; b=lIt6jAV/6rjbTH1gFsSEN++8guZfsdKHy9L/FYy3XAtFeVa+anGDEIQIN/PW4Ujq5CFqgGKFxDCSUJ4Vh/uuqSlQsk/tHMZ4QjQCj3Yc+uqNExgikPGIuSHnVvM35+wWgXH1SrPvvS5e0qrtf3+A2fLIO1k5wCZ3gmWesszInOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761826411; c=relaxed/simple;
	bh=r0GsdgpOlPQqXxZgyvmGY0gQlsQLNBQBYb/ilChYfco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D278VcAITr5fUUKSFXYBZ5s7oAwbxzSkH21Ip8c1IpuzdwMlRHxScAh6KNDlmlLIEKpBzHArVxCYCSKEf+0UOvaIHwJDREz44Srcx/qq5bdyeKMD/BiWbNht2w8aOdT25olRHGsaLxzIHoGoKaX/Oo9TxiQpHv5Elsg9gAgSRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tdCXrFYw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 66FC01A176D;
	Thu, 30 Oct 2025 12:13:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38FFC6068C;
	Thu, 30 Oct 2025 12:13:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96D2B118089E2;
	Thu, 30 Oct 2025 13:13:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761826404; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UmUXgbht16t5LuR1Ifebp4Dn4lQy5nFML5F0cJ2OBYE=;
	b=tdCXrFYwcN46AbuyaR6dJXjGjxEyCuzDx70EpsPcezrhhuC3G1nY0aAj6KMzcubsdbMhSu
	gwZyg+yxGUdcX2Q5LPBpoqScgTZKq9MEVE/TV3OyoIdG299sEUMdhZpGmyDRzv/pnqA11o
	9QqzHfwnkSavf6oHSSWRsclBJR83MFOyIcO6afZjWx3ipsFHAfasdvQYAa+pD+l9FlmAno
	oNdlWNhb+Us3rAZctc5X7e+R7RLUDP8Eoean2x3RKKCDWB6zHDbcC9aPXri2YzY+HOY8za
	7lSIt3ZUiaPkSwooCRnDq1/CT0srkt2WD0L19ta/1cSnVGehs3lqXaqM4SiIZg==
Message-ID: <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
Date: Thu, 30 Oct 2025 13:13:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the
 ethernet-connector description
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
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
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251013143146.364919-2-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

> @@ -313,5 +324,12 @@ examples:
>                      default-state = "keep";
>                  };
>              };
> +            /* Fast Ethernet port, with only 2 pairs wired */
> +            mdi {
> +                connector-0 {
> +                    lanes = <2>;
> +                    media = "BaseT";
> +                };
> +            };
>          };
>      };

As Andrew suggest clearly differentiating "lanes" and "pairs", do we
want this difference to also affect the binding ?

I still think "lanes" makes some level of sense here, but at least
the doc will need updating.

Andrew what do you think ?

Maxime

