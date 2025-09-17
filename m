Return-Path: <linux-arm-msm+bounces-73869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6132B7C4E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 437DE174561
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CDD2F39A6;
	Wed, 17 Sep 2025 07:20:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FC52F261E;
	Wed, 17 Sep 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093642; cv=none; b=cqxkK9c6s7nTrfit6agTRRenYdd3qtcEg3OFkfcaoZ0mtC8CQCFypVYIPI4+18sp06hUyImNZVDMnkpEDiZL9URNIxkEZvfVsXFtasCOaVINg0VRNe8/cm61QD0Y84YN7HGCVOgdQ69vIqcVRYr0TPb0jnLOksm7a9QWCZf70as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093642; c=relaxed/simple;
	bh=g3SlfpfcJCTkZfloKRDW2xWOuldW3Mvx2X3fYkZP400=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqrVPKomJur1XqEMxV1cCP4SCNWu60UM+XOWOqElLNVa1N3d7PTUr3s+oY89LkIgstDwEKd+B5GAAwRIY3J3znJxyoNgSBC0gm7cd5t9B931NBR+yfwpBtLhiia8TUvvotHeRPyGx2N1lgnj3foMnQMDA4eJ9DQUWEI1zeBrZlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRVBQ0Hznz9sxx;
	Wed, 17 Sep 2025 09:04:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZIbjDChrYYG; Wed, 17 Sep 2025 09:04:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRVBP5pb8z9sxw;
	Wed, 17 Sep 2025 09:04:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 999778B766;
	Wed, 17 Sep 2025 09:04:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gxsBtFU2AHJ4; Wed, 17 Sep 2025 09:04:29 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EF6C8B763;
	Wed, 17 Sep 2025 09:04:28 +0200 (CEST)
Message-ID: <90b61871-21d9-4442-ba1d-cdf102dae1c8@csgroup.eu>
Date: Wed, 17 Sep 2025 09:04:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 00/18] net: phy: Introduce PHY ports
 representation
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:25, Maxime Chevallier a écrit :
> Hi everyone,
> 
> Here is a V12 for the phy_port work, aiming at representing the
> connectors and outputs of PHY devices.
> 
> Last round was 16 patches, and now 18, if needed I can split some
> patches out such as the 2 phylink ones.
> 
> this V12 address the SFP interface selection for PHY driver SFPs, as
> commented by Russell on v10.
> 
> This and Rob's review on the dp83822 patch are the only changes.

For the series:

Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> 
> As a remainder, a few important notes :
> 
>   - This is only a first phase. It instantiates the port, and leverage
>     that to make the MAC <-> PHY <-> SFP usecase simpler.
> 
>   - Next phase will deal with controlling the port state, as well as the
>     netlink uAPI for that.
> 
>   - The end-goal is to enable support for complex port MUX. This
>     preliminary work focuses on PHY-driven ports, but this will be
>     extended to support muxing at the MII level (Multi-phy, or compo PHY
>     + SFP as found on Turris Omnia for example).
> 
>   - The naming is definitely not set in stone. I named that "phy_port",
>     but this may convey the false sense that this is phylib-specific.
>     Even the word "port" is not that great, as it already has several
>     different meanings in the net world (switch port, devlink port,
>     etc.). I used the term "connector" in the binding.
> 
> A bit of history on that work :
> 
> The end goal that I personnaly want to achieve is :
> 
>              + PHY - RJ45
>              |
>   MAC - MUX -+ PHY - RJ45
> 
> After many discussions here on netdev@, but also at netdevconf[1] and
> LPC[2], there appears to be several analoguous designs that exist out
> there.
> 
> [1] : https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fnetdevconf.info%2F0x17%2Fsessions%2Ftalk%2Fimproving-multi-phy-and-multi-port-interfaces.html&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284299867339%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=C6z%2FdAn5cHGllo%2FJVkqwMPEgkd%2BWyb7m1hUceaLzqLQ%3D&reserved=0
> [2] : https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flpc.events%2Fevent%2F18%2Fcontributions%2F1964%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284299889461%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=9NQmsDcOZa286wbUux%2FdCrI3fGUzYs4o%2FjscGN2zcdg%3D&reserved=0 (video isn't the
> right one)
> 
> Take the MAchiatobin, it has 2 interfaces that looks like this :
> 
>   MAC - PHY -+ RJ45
>              |
> 	    + SFP - Whatever the module does
> 
> Now, looking at the Turris Omnia, we have :
> 
> 
>   MAC - MUX -+ PHY - RJ45
>              |
> 	    + SFP - Whatever the module does
> 
> We can find more example of this kind of designs, the common part is
> that we expose multiple front-facing media ports. This is what this
> current work aims at supporting. As of right now, it does'nt add any
> support for muxing, but this will come later on.
> 
> This first phase focuses on phy-driven ports only, but there are already
> quite some challenges already. For one, we can't really autodetect how
> many ports are sitting behind a PHY. That's why this series introduces a
> new binding. Describing ports in DT should however be a last-resort
> thing when we need to clear some ambiguity about the PHY media-side.
> 
> The only use-cases that we have today for multi-port PHYs are combo PHYs
> that drive both a Copper port and an SFP (the Macchiatobin case). This
> in itself is challenging and this series only addresses part of this
> support, by registering a phy_port for the PHY <-> SFP connection. The
> SFP module should in the end be considered as a port as well, but that's
> not yet the case.
> 
> However, because now PHYs can register phy_ports for every media-side
> interface they have, they can register the capabilities of their ports,
> which allows making the PHY-driver SFP case much more generic.
> 
> Let me know what you think, I'm all in for discussions :)
> 
> Regards,
> 
> Changes in V12:
>   - Moved some of phylink's internal helpers to phy_caps for reuse in
>     phylib
>   - Fixed SFP interface selection
>   - Added Rob's review and changes in patch 6
> 
> Changes in V11:
>   - The ti,fiber-mode property was deprecated in favor of the
>     ethernet-connector binding
>   - The .attach_port was split into an MDI and an MII version
>   - I added the warning back in the AR8031 PHY driver
>   - There is now an init-time check on the number of lanes associated to
>     every linkmode, making sure the number of lanes is above or equal to
>     the minimum required
>   - Various typos were fixed all around
>   - We no longer use sfp_select_interface() for SFP interface validation
> 
> Changes in V10:
>   - Rebase on net-next
>   - Fix a typo reported by Köry
>   - Aggregate all reviews
>   - Fix the conflict on the qcom driver
> 
> Changes in V9:
>   - Removed maxItems and items from the connector binding
>   - Fixed a typo in the binding
> 
> Changes in V8:
>   - Added maxItems on the connector media binding
>   - Made sure we parse a single medium
>   - Added a missing bitwise macro
> 
> Changes in V7:
>   - Move ethtool_medium_get_supported to phy_caps
>   - support combo-ports, each with a given set of supported modes
>   - Introduce the notion of 'not-described' ports
> 
> Changes in V6:
> 
>   - Fixed kdoc on patch 3
>   - Addressed a missing port-ops registration for the Marvell 88x2222
>     driver
>   - Addressed a warning reported by Simon on the DP83822 when building
>     without CONFIG_OF_MDIO
> 
> Changes in V5 :
> 
>   - renamed the bindings to use the term "connector" instead of "port"
>   - Rebased, and fixed some issues reported on the 83822 driver
>   - Use phy_caps
> 
> Changes in V4 :
> 
>   - Introduced a kernel doc
>   - Reworked the mediums definitions in patch 2
>   - QCA807x now uses the generic SFP support
>   - Fixed some implementation bugs to build the support list based on the
>     interfaces supported on a port
> 
> V11:https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250814135832.174911-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284299905361%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=LWQCStSMzSc7DF0qVAuRm4DHd7NAutmdVOmDRgtwan8%3D&reserved=0
> V10: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250722121623.609732-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284299928854%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=YFI3Wgp4q14jtVSPIGTJUPpzErznptDT018xJhMMOP0%3D&reserved=0
> V9: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250717073020.154010-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284299944865%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=8iqRMpTrIErypHiKgEGz5Lhg%2BuYgpQc32ivkYIm1LsM%3D&reserved=0
> V8: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250710134533.596123-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284299960533%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=W%2B54fu5zioR1JpIPOGPDFFnRlwLvG0S9ZsUDAV0RxEM%3D&reserved=0
> v7: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250630143315.250879-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284299976028%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=bzctaCFpijcod4VEx2dXDP6%2Flg5bd6hEkw0mKcMut84%3D&reserved=0
> V6: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250507135331.76021-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284299991595%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=pIQgF0ApV1207diKRjfUC%2BgPGd2EqVGwCSjc%2BvuFPtw%3D&reserved=0
> V5: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250425141511.182537-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284300007423%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=SfRaJsV3K4M0JXHKulU881Pa7odw6uuW4wAXXRHRhSw%3D&reserved=0
> V4: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250213101606.1154014-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284300024626%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ekANNoVX6KMVPkE00%2F7BKATnVk3tHyhjvYULlKJSIcw%3D&reserved=0
> V3: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250207223634.600218-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284300040453%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=rcoPmWiyQeQOjIyhLdr0dwncTrXOLQyzQvqASE3NUHY%3D&reserved=0
> RFC V2: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20250122174252.82730-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284300056403%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=UMXGhRV%2FMDaHi%2FV9%2BWAZKIniGX%2Bi9%2Bdz%2B3OSrusm7JQ%3D&reserved=0
> RFC V1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20241220201506.2791940-1-maxime.chevallier%40bootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbecf734ee0f1436ece2508ddefb55559%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638930284300075545%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=pkoqOiokIDN2YLhcixRyucwWHNvRWuC1NEVcZ1s26BU%3D&reserved=0
> 
> Maxime
> 
> Maxime Chevallier (18):
>    dt-bindings: net: Introduce the ethernet-connector description
>    net: ethtool: common: Indicate that BaseT works on up to 4 lanes
>    net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
>    net: phy: Introduce PHY ports representation
>    net: phy: dp83822: Add support for phy_port representation
>    dt-bindings: net: dp83822: Deprecate ti,fiber-mode
>    net: phy: Create a phy_port for PHY-driven SFPs
>    net: phylink: Move phylink_interface_max_speed to phy_caps
>    net: phylink: Move sfp interface selection and filtering to phy_caps
>    net: phy: Introduce generic SFP handling for PHY drivers
>    net: phy: marvell-88x2222: Support SFP through phy_port interface
>    net: phy: marvell: Support SFP through phy_port interface
>    net: phy: marvell10g: Support SFP through phy_port
>    net: phy: at803x: Support SFP through phy_port interface
>    net: phy: qca807x: Support SFP through phy_port interface
>    net: phy: Only rely on phy_port for PHY-driven SFP
>    net: phy: dp83822: Add SFP support through the phy_port interface
>    Documentation: networking: Document the phy_port infrastructure
> 
>   .../bindings/net/ethernet-connector.yaml      |  45 +++
>   .../devicetree/bindings/net/ethernet-phy.yaml |  18 +
>   .../devicetree/bindings/net/ti,dp83822.yaml   |  10 +-
>   Documentation/networking/index.rst            |   1 +
>   Documentation/networking/phy-port.rst         | 111 ++++++
>   MAINTAINERS                                   |   3 +
>   drivers/net/phy/Makefile                      |   2 +-
>   drivers/net/phy/dp83822.c                     |  79 +++--
>   drivers/net/phy/marvell-88x2222.c             |  95 ++---
>   drivers/net/phy/marvell.c                     |  94 ++---
>   drivers/net/phy/marvell10g.c                  |  54 +--
>   drivers/net/phy/phy-caps.h                    |  12 +
>   drivers/net/phy/phy-core.c                    |   6 +
>   drivers/net/phy/phy_caps.c                    | 216 +++++++++++
>   drivers/net/phy/phy_device.c                  | 334 +++++++++++++++++-
>   drivers/net/phy/phy_port.c                    | 194 ++++++++++
>   drivers/net/phy/phylink.c                     | 157 +-------
>   drivers/net/phy/qcom/at803x.c                 |  78 ++--
>   drivers/net/phy/qcom/qca807x.c                |  73 ++--
>   include/linux/ethtool.h                       |  44 ++-
>   include/linux/phy.h                           |  63 +++-
>   include/linux/phy_port.h                      |  99 ++++++
>   include/uapi/linux/ethtool.h                  |  20 ++
>   net/ethtool/common.c                          | 267 ++++++++------
>   24 files changed, 1541 insertions(+), 534 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
>   create mode 100644 Documentation/networking/phy-port.rst
>   create mode 100644 drivers/net/phy/phy_port.c
>   create mode 100644 include/linux/phy_port.h
> 


