Return-Path: <linux-arm-msm+bounces-73871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A8DB7CDAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66EA172353
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8452F7454;
	Wed, 17 Sep 2025 07:20:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9611F099C;
	Wed, 17 Sep 2025 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093653; cv=none; b=QgQoV4HY0HKUu5FfcpqXmIT9MKKMbb4RxsF14Cxv7z55h5/s1IvKGsGfwMy3snk1mDD5mPsOTIh0qg13793siY2ySLuZkQQALgNBIyBxhYGnTBXfcSVT2NSPDhJokM9JM5KdvWHiBBl7arBzS9Rohzvjk0KUqRuZmosSmFtcp2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093653; c=relaxed/simple;
	bh=T7exeBmULLWJga5OH37VIX/fG1+uHZkVbo/pMfIxDCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9z3vnv3JgwWLd4d8KUQznGSDlNr5JqijdWGGnfb2XkoGvV8EBLNFKAXzuvlTWPuXajSffsrx+eFq0nMDweCIbCPsahh7Iy8Nz5/eb+cE6paso6W/aaIYqm40Y1g2zEEBqPxgafiJhVQUB6kPynUJcXzaLtTsDu3BJerjS1FLFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV5W1bycz9sxf;
	Wed, 17 Sep 2025 09:00:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11XSx90_uVxX; Wed, 17 Sep 2025 09:00:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV5W0cBKz9sxd;
	Wed, 17 Sep 2025 09:00:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D2F708B766;
	Wed, 17 Sep 2025 09:00:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fs-jRcZF6hG5; Wed, 17 Sep 2025 09:00:14 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BAFE8B763;
	Wed, 17 Sep 2025 09:00:13 +0200 (CEST)
Message-ID: <c7b767f3-168e-41dd-8c72-3d40f766c018@csgroup.eu>
Date: Wed, 17 Sep 2025 09:00:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 06/18] dt-bindings: net: dp83822: Deprecate
 ti,fiber-mode
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
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
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
 <20250909152617.119554-7-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-7-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> The newly added ethernet-connector binding allows describing an Ethernet
> connector with greater precision, and in a more generic manner, than
> ti,fiber-mode. Deprecate this property.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   Documentation/devicetree/bindings/net/ti,dp83822.yaml | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> index 28a0bddb9af9..dc6c50413a67 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> @@ -47,6 +47,9 @@ properties:
>          is disabled.
>          In fiber mode, auto-negotiation is disabled and the PHY can only work in
>          100base-fx (full and half duplex) modes.
> +       This property is deprecated, for details please refer to
> +       Documentation/devicetree/bindings/net/ethernet-connector.yaml
> +    deprecated: true
>   
>     rx-internal-delay-ps:
>       description: |
> @@ -141,7 +144,12 @@ examples:
>           tx-internal-delay-ps = <1>;
>           ti,gpio2-clk-out = "xi";
>           mac-termination-ohms = <43>;
> +        mdi {
> +          connector-0 {
> +            lanes = <1>;
> +            media = "BaseF";
> +          };
> +        };
>         };
>       };
> -
>   ...


