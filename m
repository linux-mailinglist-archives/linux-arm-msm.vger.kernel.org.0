Return-Path: <linux-arm-msm+bounces-112272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 97SCK9qGKGooFwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 23:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843966445C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 23:34:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=mfqFmqt+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112272-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112272-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D76D302F985
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 21:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AB441168B;
	Tue,  9 Jun 2026 21:31:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B4915C14F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 21:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040715; cv=none; b=XohmzyQcnDz1Iyte1xY8uPG+lQUFSZqaMK21+PHBAPQqCzWhz8MWtO3jl22DSf9Nbwyuw327sFyLLsYo/zIr8XCJyqAlsvPart9PM5dOFc4XvtSWFP3A5UwPX3sNb6ArBlB1rlqEyvzNS2501SO20PgqokH6SABhGX9lQVunJyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040715; c=relaxed/simple;
	bh=u02KRuZlQFzGkv6nJNfx75RixQFD4xM54PRC9sX+TeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GzQW8jsZXIggs/LmRbWdRyUiXwC98uZ5DPpTqLxUEw7Qix8wLPtP/ugDKNqYv6DnkdSqsGS6YFXbvI0iRcfv55Bk7C+l4YPyQ8FiyYRxfbdvAM/RouI4/m5IHHR0Tr/7unIfWN4oV0fT+QTWeQNB8RdhirEEJj2w9Qn8LfAccy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=mfqFmqt+; arc=none smtp.client-ip=209.85.167.178
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-48611addcfbso2497716b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781040712; x=1781645512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGjz6oXrvv0vYyL9h564g5u9rOXsQ9Yj+tb2sJWaYA0=;
        b=mfqFmqt+WJx8NSYfElhOBMTg++c3r8Yq+qOtPE6j+Rp39nGafXgFVejdw+XX6c1G8Y
         WtGm1CHAjgdwVPbNMbusNhxrPEgqJ8ftBfI1CDBJrDXH58mf1cQs3T3t56ngL+brvLLL
         mDkoPrurq+wWZP9/d3whgV2TL2M9jI29yrLoMadcZACt5Jkj7gMG0WC2DmIrIOQ1lWJ4
         C84XQsZVeKsgRr9YkfYO+eZ6f41JO+z9W/2xJUO0ziqf9pp4rDolAUM9CN+pWjUre6Ew
         KJLk2jUKoV5kpdOXgZjpUwWgg+0QmjaoZ/mmlgLndXknfUAZwyoJGFNJ8tQSbUdtBZ4z
         v8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040712; x=1781645512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGjz6oXrvv0vYyL9h564g5u9rOXsQ9Yj+tb2sJWaYA0=;
        b=PfoeF+2Ihx74Wip5cnaktULKAGEKY3NLDKm/mxFZhj7Arc6cFZvh9VXF32RP64/91N
         Ku7ZH3H1+Ncq6x1PQPxN/uwurBw6+WErB86Z+RvDiSCiWoToNbUc3uhKbIHGmI8fGL7f
         9Y/QTF2RvPIt4e4uYoreAVZxoBiWeaGRoSp6VLXxn7hNvjQw4lJ2QCD7nTOW6D6OxX7Z
         1UxaqL1LomaPAp80UD0hwRarYkfY0YNUAfhNqClHZpkdd+zntt9MvsPZLZKpwFsNkuMX
         h4YWfwOnrT5ePvhNbDvxuafxD6eOA7ooIVFxnvC6W0TfO4BY7E5/PKIP8z0zKqvuUkKm
         GlSA==
X-Forwarded-Encrypted: i=1; AFNElJ/bhUGWrU2Xe0yJ3NMKMfrHhjbokTuj/WpBzwBO8cGnWTs2vI6AG34XXMQDHMjz9pZKi90GuzxgMIYYVFwh@vger.kernel.org
X-Gm-Message-State: AOJu0YzAF7kDiI6Yd9/RCSeUtSRKaNOUmWC+IcZ1NfmW2y8FORmWMBZ5
	QCP7TUnXY8LtaE2RDVLPuI4BItaIT/wdL7xMBbgOMr75EIW0C+R/YOpWGQ3qDOCJSCk=
X-Gm-Gg: Acq92OFvqKpRJdO2Pht8OzqBURZ2iy962brCqVbVAtBRdAenm/hAQ127nbUb/Covjdv
	E4ZkaYQGBmpHtUYJcvIfQIuus8o9yyAz0Q23lVvXxNJeK6nyj2mr5r4fd3RfgPw7R2BXr/Comcq
	ihT2EuLTwBH2GjKg1WmK6w/mu3qSx46wlZj4zeL9JetEqSeGcRcNAQh5l1+/wih51PnA9vsiF/h
	B1ju1YnodMQ6HlfU4eS0e+J6CjvenKyJdHwu1ZM3toZ7L5qSEBTibJlInwGD/GBEqksSbOEw8xf
	6oHUy9yBvZIqw194p9PrpNuKMssDU1XRjbkV3KageeWxglNJWcf0riotA+9B0N6B4r4KWVrsUMw
	QFOUEvf3uJZ07loOxUw5E0xmbHlFWVNJrDbjKU6tAvh+UzwM6T4gwCHGRrIkTglzxeRGrXwsHmM
	S8n0p2OqTd8+B2fnLV7kuqNPjc21yyEuN0oQ==
X-Received: by 2002:a05:6808:191e:b0:47b:bd7b:10e5 with SMTP id 5614622812f47-4868db2d9eamr11794474b6e.3.1781040712262;
        Tue, 09 Jun 2026 14:31:52 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm17024127b6e.4.2026.06.09.14.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 14:31:51 -0700 (PDT)
Message-ID: <e5c0fc2a-dcf0-4165-b2dc-d16c6cbe92df@riscstar.com>
Date: Tue, 9 Jun 2026 16:31:48 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/14] dt-bindings: net: toshiba,tc9654-dwmac:
 add TC9564 Ethernet bridge
To: Rob Herring <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-11-elder@riscstar.com>
 <20260605144032.GA3659201-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260605144032.GA3659201-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112272-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@kernel.org,m:netdev@vg
 er.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,riscstar-com.20251104.gappssmtp.com:dkim,riscstar.com:email,riscstar.com:mid,riscstar.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1843966445C

On 6/5/26 9:40 AM, Rob Herring wrote:
> On Thu, Jun 04, 2026 at 08:00:17PM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
>> bridges.
>>
>> The TC9564 contains a PCIe switch with one upstream and three downstream
>> PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
>> endpoint, and that endpoint implements two PCIe functions.  Each internal
>> PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
>> operation.
>>
>> The TC9564 also implements an embedded GPIO controller, which exposes
>> 10 lines externally.  Some platforms use these GPIO lines, so this
>> GPIO controller is managed by a separate driver.  Other embedded
>> peripherals (like a microcontroller, SRAM, and UART) are currently
>> unused.
>>
>> The GPIO controller is managed by registers accessed via MMIO on an
>> internal PCIe function's registers.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>> new file mode 100644
>> index 0000000000000..6e7a63dfcf86a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>> @@ -0,0 +1,120 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/toshiba,tc9564-dwmac.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description: |
>> +  The Toshiba TC9564 (and more generally, TC956x) incorporates a PCIe
>> +  gen 3 switch with one upstream and three downstream ports.  The first
>> +  two downstream ports are exposed externally, while the third is used
>> +  by an internal PCIe endpoint.  The PCIe endpoint implements two PCIe
>> +  functions, and attached to each of these is a 10 Gbps capable Synopsys
>> +  Ethernet controller.
>> +
>> +  The TC956x additionally implements other internal IP blocks, and in
>> +  particular it implements a GPIO controller.  Ten of the 35 GPIO lines
>> +  implemented are exposed externally and are usable by the platform.
>> +  It is platform-dependent whether the GPIO function must be exposed,
>> +  and if it is, PCIe function 0 supplies it.
>> +
>> +              ----------------------------------
>> +              |              Host              |
>> +              ------+...+----------+........+---
>> +                    |i2c|          |  PCIe  |
>> +    ----------------+...+----------+........+------
>> +    | TC956x        |I2C|          |upstream|     |
>> +    |               -----        --+--------+---  |
>> +    |  -----  ------  -------    | PCIe switch |  |
>> +    |  |SPI|  |GPIO|  |reset|    |             |  |
>> +    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
>> +    |                 -------    ---++--++--++--  |
>> +    |  -----  ------     downstream//    \\  \\   |  downstream
>> +    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
>> +    |  -----  ------   //PCIe port 3       \\     |
>> +    |                  ||                   \======= downstream
>> +    |  ----+-----------++-----------+----         |  PCIe port 2
>> +    |  | M | internal PCIe endpoint | M |         |
>> +    |  | S |------------------------| S |  ------ |
>> +    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
>> +    |  | G |function 0|  |function 1| G |  ------ |
> 
> I don't see nodes for these PCI functions. Boot this platform with
> CONFIG_PCI_DYNAMIC_OF_NODES enabled and use the resulting DT node
> structure. Anything else is wrong. This will give you the DTS:
> 
> dtc -O dts /proc/device-tree
> 
> The ethernet nodes should be just these PCI function nodes. You need to
> make the DWMAC PCI driver (stmmac_pci.c) bind to those 2 PCI devices.
> And really, a DT node for them should be completely optional (unless
> there's some power on ctrl needed).
> 
> Everything else like SPI, GPIO, UART, etc. should be under the PCIe
> switch upstream node in a pci-ep-bus.

I unfortunately hadn't looked closely enough at pci-ep-bus
before.  It really looks like what we should use.  It's a
simple bus, and we'll use platform drivers and compatible
strings to match the devices on the bus.

I'll work toward converting things over to use this model.

> 
> 
>> +    |  | E |----++----|  |----++----| E |         |
>> +    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
>> +    --------+.......+------+.....+-----------------
>> +            |USXGMII|      |SGMII|
>> +          --+.......+--  --+.....+--
>> +          |  ARQ113C  |  | QEP8121 |
>> +          |    PHY    |  |   PHY   |
>> +          -------------  -----------
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
>> +
>> +  gpio:
>> +    type: object
>> +    description: Embedded GPIO controller
>> +    $ref: /schemas/gpio/gpio.yaml#
> 
> gpio.yaml alone does not define a GPIO controller. How many #gpio-cells
> needs to be defined.
> 
> Is there no address associated with the controller?
> 
>> +
>> +  ethernet:
>> +    type: object
>> +    description: XGMAC Ethernet controller
>> +    $ref: /schemas/net/ethernet-controller.yaml#
>> +    properties:
>> +      mdio:
>> +        $ref: snps,dwmac.yaml#/properties/mdio
> 
> Either all of snps,dwmac.yaml should apply or none of it. Generally, we
> only reference whole schema files (OF graph being a notable exception).

OK.

> 
>> +    required:
>> +      - mdio
>> +
>> +required:
>> +  - compatible
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-device.yaml#
>> +  - $ref: /schemas/pci/pci-bus-common.yaml#
> 
> These 2 are just pci-pci-bridge.yaml.

OK.

					-Alex

> 
> Rob


