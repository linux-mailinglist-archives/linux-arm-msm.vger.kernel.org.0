Return-Path: <linux-arm-msm+bounces-73021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A656B52429
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 00:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1F31885724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 22:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A25830C350;
	Wed, 10 Sep 2025 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hYBgkz/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f227.google.com (mail-il1-f227.google.com [209.85.166.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BA22F1FFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 22:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757542777; cv=none; b=UnvfKtmkB8GEm70PjQJK4W7d14hXSqQryVyjcz5sgnDBYf0bUcObpHkQulNtZ/IPZ+xnzVLkL4QgrAzDq2xmQrQNxUMeqcnK+k/HPqOMGoTa1Lr4o4+2jcppAVSL5zCeYlCxoKNtt28lgcv6xiBW/wWrd7U2YpOwgSHf2iWCgn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757542777; c=relaxed/simple;
	bh=qryd9d3EcpC0AlezfGs+ybYlxKIarlPyMa63kBcjQPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TASXfJzDxdAMzQ8bQ4z5MaUrb4MI1/mt2ptbMbAW5lUu1wy9/tVhUMPBfyUb+XvLJWoTBWJpcje51x2ORcqPiF6z0mPdoxiv+c3+MlcCNhth6nXX1kBjuHtv8n+fMRxlymouZsLSSsCJcjntBJ7Bn6rzOUDM69qdUa/JV6oa65M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hYBgkz/q; arc=none smtp.client-ip=209.85.166.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-il1-f227.google.com with SMTP id e9e14a558f8ab-3fe48646d40so6315915ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 15:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757542775; x=1758147575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYkMluAXoUU9ziRsn/K2ST3c55WCNeely9VEl19vgTc=;
        b=B67Re1D5XJaTWTlMPacUQSe+1RQomeN1Z9ICCHq23AFFS2gnQzUNCgVIRT0QmBPOpv
         Evw0tx17v0EabLwl1tT4A3gkRLDlmGCQnIfYTqRc163jZyxIs8PFwq/prRQgG6mUXelD
         9G4lm7+73i4shvE5xZsQSSpkAT30txq5cbNPU9soemzwpXmVQkleVdD6EvSLbqCycnRg
         43eBSXnPOyxvC3UqaDbveU8HS52e463WmQ/fBrDVJtndwZPh0UTHvdpmHxpd8PYjbdjN
         Dq8mU0pMDcFAXUw54motwNT5W4jLaTmPa6Y4eRCpAdbjRctifOHea5LF9TXpw+8v+Gq9
         rY/A==
X-Forwarded-Encrypted: i=1; AJvYcCWzn6Y8DR3ZFIYlhNeDIeQXWORC0hEWdgFn7zV/slQlij7WJudMl3lF/VYgo2YnXGgQbmlxxepx3D8Vyb5K@vger.kernel.org
X-Gm-Message-State: AOJu0YzKUQc2UqNXZEQYdBTPNJp8YWneAjQM3kfxAtW+nrc0iGb5vTeT
	83m3gryLjRKtSSsCgevEXiIkwbg/C3aNqFSV0u53PX3mX/3j6lNPxG1FLniLz48nvL5mirpNGpj
	D77WF3bGgCMTPEuqpnTBGkYhh+BXlMHZtFDZYt4zZ0ldJ5ptdpwy4cHis9nnHWntGxO45pvDHcD
	GRD3wCZFk5O4ycuazSbrcfoSTf5WFTqkjxMhn/mB2rLOjc1x4/Qhat1VWu9F4CIqPKbcK4wtMcu
	ZW/vbiLO8OqyIlr5MoZ0LACBg==
X-Gm-Gg: ASbGncsubqHMXqSTVSATNsvAPqJaA+gWRaHhhKl/m6kEtDF1Bk/wfSieR7BghEAofIq
	De+yzUxSLbpqq4zJsgln/2lU9lGrzS/X+wtgLgPOP8Te0XB8C8G4yuyPw5IsQYHvOnsRo93JOMf
	l2k8VjEqJJ0eqFKEo1XKFbz2xxV97g5ZNpded4KgN7y6uJ5zn02g3Da43eeFJ/SryTfL3SNP/Mn
	1HtE+MDAJ5PJMF6w+NnwULqpZE9iVdVj+HgrugCOiObNV4K89n1WjsxnR7FwZuffKLJQ21uX5Dv
	OozKXrYlylotqbaEA2vhpIP4bVEYRpA5M5HMukpNpYYv5efPTeTjjsH4gviPznYVGJK+cnr9q0I
	BFmdLzFj7MJSvFFQtXbsttWSK0z4+55jezV9EfpeTcuCE/x2Ym4/FMUA+aBI4/uGg7HpezfASVZ
	W3QZRG
X-Google-Smtp-Source: AGHT+IGBRVrpPhTfhINKVmKMjLzOhfmAPKUNeQYrTBSVjJWmFyWNXMuKEKiNVVfMsO0l41ULZIIz+FCcX3DH
X-Received: by 2002:a05:6e02:9d:b0:3e5:8344:49ed with SMTP id e9e14a558f8ab-41be61c4d65mr19849485ab.1.1757542774863;
        Wed, 10 Sep 2025 15:19:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-10.dlp.protect.broadcom.com. [144.49.247.10])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-41c89d28cd0sm466875ab.8.2025.09.10.15.19.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:19:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e86f8f27e1so30648085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757542774; x=1758147574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DYkMluAXoUU9ziRsn/K2ST3c55WCNeely9VEl19vgTc=;
        b=hYBgkz/qJ4SVNEXbhuTCeoahZ303YQomicntRSwuzndbwenlnScgpsJ04SIg2Tyx7h
         DnWUmNhxzOR7UCZyXjBp1Rmg1Lplfncc9X8ti3cYfUotaoY5ABW4VXroUnraRuuJKPQ3
         oLtww6njyvqCM3RTg3XC6EGyspx2xukWZTbMY=
X-Forwarded-Encrypted: i=1; AJvYcCWNGFXo/h3TZejfyMRB0cfJ07nBuMI7RFhtshCCYW+M4qfjnQkbPm3enXPGJMB1v2nxeGtPTciW1YCRnQG/@vger.kernel.org
X-Received: by 2002:a05:620a:1984:b0:804:4a23:38e0 with SMTP id af79cd13be357-81ff3a4feefmr183982385a.4.1757542773827;
        Wed, 10 Sep 2025 15:19:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1984:b0:804:4a23:38e0 with SMTP id af79cd13be357-81ff3a4feefmr183977285a.4.1757542773297;
        Wed, 10 Sep 2025 15:19:33 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b59f8786fsm364672285a.29.2025.09.10.15.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:19:32 -0700 (PDT)
Message-ID: <8015ec3f-778f-43e9-b91d-fe76b814157f@broadcom.com>
Date: Wed, 10 Sep 2025 15:19:28 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next v12 00/18] net: phy: Introduce PHY ports
 representation
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
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
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/9/25 08:25, Maxime Chevallier wrote:
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
> [1] : https://netdevconf.info/0x17/sessions/talk/improving-multi-phy-and-multi-port-interfaces.html
> [2] : https://lpc.events/event/18/contributions/1964/ (video isn't the
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

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>

Tested with bcmgenet which is single MAC + PHY using phylib.

Tested with bcm_sf2 which uses phylink and has a combination of internal 
and external PHYs.
--
Florian
-- 
Florian


