Return-Path: <linux-arm-msm+bounces-57650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D6CAB47B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 00:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A687819E1B39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 22:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2A229A9D8;
	Mon, 12 May 2025 22:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlyiSpoL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBEE29A9C5;
	Mon, 12 May 2025 22:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747090601; cv=none; b=bWaTrELqLItsTq/1Se2hw5cn7dGgxLNzKoeYQgvFWiSPViL10QEahS8xTo1tu3i+WmiQF0t4RiawtwW0gfFCs6JvVPA5AtgxlWQ0xVnIlBAJB6VJhbwry7ujVLzSuRac3defQn6rZICLO3QQtip7zhXiKRRFNw1rx5wipeGRWVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747090601; c=relaxed/simple;
	bh=1s9Vf3Fkit3adzUezvQrcVB4lHl6eD+qJRdC61oFkSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLJb6nFg4Wb+v4VaJkHDPxpocfZQLVIjXb3zbpKweVCo9edJivnSZKTlOyw8ZggmkKIIvTeso0Bm/aIzhcavvhy+Q96fdJuRwV+T5qvvmsaFh6DKwmstZO9PAz31cZ+G4kU6E2twZY9Yo+AKZiNuASurz1o/ZPqtdVqorMxxM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlyiSpoL; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72ecc30903cso2762544a34.0;
        Mon, 12 May 2025 15:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747090598; x=1747695398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQnYHyU/oLYkT3/eFqR+0DIJ/IUt+t8l37AqbBxcuEw=;
        b=nlyiSpoLsFwZFyjtnAd+BpDp8OrmJJJIV4ouGmEjuVGU6wTCUZBzaTSu7/WSEjKrx6
         I2vvDWn9cU0hlF/CvuP5kH0UhwxQ8Peuvsp26YgryZC9+VdtqIIiOwyjOw14/1h1rauX
         lOUYEhOe8N5W0nW1zcNJurY8ZJ05gsrq9B8ESkGJYoDxi36pZvhJNPfWntaY9XmmCxc2
         ItpadFfw6o3qt4hosgjGGZVTMZ8YoXMpI0jv1gyD2zah/nB+TfxAGip2JxMn9hX3qQuO
         bevKcvLVgk6g0CyHhopLAdGXEY9fS74iIsTCD0/pGCd0V4D0I9Qiij/tetqcgyLum+3l
         eurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747090598; x=1747695398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQnYHyU/oLYkT3/eFqR+0DIJ/IUt+t8l37AqbBxcuEw=;
        b=UMWOrvRkxFMlBYrUr++GLRQ/h3VExto7qpCvg6OhM3Tq6WUQW0oQwZTsGziKVK6upP
         AYtrC0J/m9UUQ5bNR7BakbWrDTIX29r4Qz7+Mfkch7P0LKZ1flcJqTffkah6+Bir+G2h
         nsx1msUIK0u/5JZFrnS03IWYYfKD8Pw7Yawy+FtbxDQO1zSUW5jTp+edCoBm/UYwd8sz
         +3h/jHXlxY9GrCxbpxQECtccO0I+eb8K1oMC++Lubm+NeJUVXoBHlX1Lx/vAcIo5oi/c
         k/m5WmANSwEz7icd0KeCiu4NrBiZ2gf00OfvX1Xl2RnKoc8mhXMSwmi2c66ELKDwhuDI
         aGDg==
X-Forwarded-Encrypted: i=1; AJvYcCVaFbIqHq3BVk9ERpamBzzJn9sNxujKJBUZEeWRkeAZZTi8XXXMbmTpQBUHR9YGNP+ibhCWhr2dj94Nop59@vger.kernel.org, AJvYcCVnLXKX9pY1/8rr11HuR9+Dywm+3e6HRWIDmi5ptOQ5VbNr9t221hQ5tPEaCiGMHvGgg6Ol8pbNqiVk@vger.kernel.org, AJvYcCWKDUHZacrMCcWsW/CCk/4hiJxmpnZBmemXApZ/0Kz+2/pLADipiypL0TbfvXd70OeJWqcCKJo3mv/qdZPZiQ==@vger.kernel.org, AJvYcCXAYD8jPI8UPnW4l6qEYGyyTqo6uXTnGtrzkbRHlXzp4QepeOAmpjlw050WHScb/euJHhxJlcEs@vger.kernel.org
X-Gm-Message-State: AOJu0YyGq2rik9zYMHQTAhXcCwl/5mKwZcuweMM8JIaX/QyGQ9Sq6DA5
	Wfm2U4Fo3+Ch9W9ChJX/1eFk6mdvMJL58SIx67h96s5pacOdql0N
X-Gm-Gg: ASbGncuJy/HoDbymSf0lrY+rv2FRhUANia3IdMrNc2K5+IzHUcaP3ee1AHgMo4q5YCt
	XHy9LEOJovdXvWUhZdKcMtZp0MJHmxyuXsiAqYESg/5ovU+MiOesaZX59S9eBnK50OzdCst9+r0
	8TJsWBVYz2wJYek7l4e3z9gBTA3NHMTMUnmlYr3D6Dx7dmpcsYG0+6PoXbYG79SLX5QLfBGSww8
	jkQ0O1x0hGfXhnbyKPHngFy19/Kz/aw964I6dqMW08ibb70bUyaWqXwGyWAiROsTSrnFsluUX7P
	YmbGCr98OQ+6FoXGPutH6FiithzejqJqpnrkAeiOHCk3NdTwjx8f09aQPm0XfTK1fVDNAP9A2Fv
	a4xT3AwKUusJh0g==
X-Google-Smtp-Source: AGHT+IE39odtp4AvZWbxjsbViiNWCTwsEhcIlK8o+5Hl0Hjx72MLayBL+nVAD4vihtkwI3e3H49Ahw==
X-Received: by 2002:a05:6830:398d:b0:72b:9965:d994 with SMTP id 46e09a7af769-73226b000camr9090654a34.23.1747090598305;
        Mon, 12 May 2025 15:56:38 -0700 (PDT)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732265cd91bsm1755336a34.50.2025.05.12.15.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 15:56:37 -0700 (PDT)
Message-ID: <0c1a0dbd-fd24-40d7-bec9-c81583be1081@gmail.com>
Date: Mon, 12 May 2025 17:56:35 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
To: Lei Wei <quic_leiwei@quicinc.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
 quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com,
 quic_luoj@quicinc.com, srinivas.kandagatla@linaro.org,
 bartosz.golaszewski@linaro.org, vsmuthu@qti.qualcomm.com, john@phrozen.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
 <20250211195934.47943371@kernel.org> <Z6x1xD0krK0_eycB@shell.armlinux.org.uk>
 <71a69eb6-9e24-48ab-8301-93ec3ff43cc7@quicinc.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <71a69eb6-9e24-48ab-8301-93ec3ff43cc7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/19/25 4:46 AM, Lei Wei wrote:
> 
> On 2/12/2025 6:19 PM, Russell King (Oracle) wrote:
>> On Tue, Feb 11, 2025 at 07:59:34PM -0800, Jakub Kicinski wrote:
>>> On Fri, 7 Feb 2025 23:53:11 +0800 Lei Wei wrote:
>>>> The 'UNIPHY' PCS block in the Qualcomm IPQ9574 SoC provides Ethernet
>>>> PCS and SerDes functions. It supports 1Gbps mode PCS and 10-Gigabit
>>>> mode PCS (XPCS) functions, and supports various interface modes for
>>>> the connectivity between the Ethernet MAC and the external PHYs/Switch.
>>>> There are three UNIPHY (PCS) instances in IPQ9574, supporting the six
>>>> Ethernet ports.
>>>>
>>>> This patch series adds base driver support for initializing the PCS,
>>>> and PCS phylink ops for managing the PCS modes/states. Support for
>>>> SGMII/QSGMII (PCS) and USXGMII (XPCS) modes is being added initially.
>>>>
>>>> The Ethernet driver which handles the MAC operations will create the
>>>> PCS instances and phylink for the MAC, by utilizing the API exported
>>>> by this driver.
>>>>
>>>> While support is being added initially for IPQ9574, the driver is
>>>> expected to be easily extendable later for other SoCs in the IPQ
>>>> family such as IPQ5332.
>>>
>>> Could someone with PHY, or even, dare I say, phylink expertise
>>> take a look here?
>>
>> I've not had the time, sorry. Looking at it now, I have lots of
>> questions over this.
>>
>> 1) clocks.
>>
>> - Patch 2 provides clocks from this driver which are exported to the
>>    NSCCC block that are then used to provide the MII clocks.
>> - Patch 3 consumes clocks from the NSCCC block for use with each PCS.
>>
>> Surely this leads to a circular dependency, where the MSCCC driver
>> can't get the clocks it needs until this driver has initialised, but
>> this driver can't get the clocks it needs for each PCS from the NSCCC
>> because the MSCCC driver needs this driver to initialise.
>>
> 
> Sorry for the delay in response. Below is a description of the 
> dependencies between the PCS/NSSCC drivers during initialization time 
> and how the clock relationships are set up. Based on this, there should 
> not any issue due to circular dependency, but please let me know if any 
> improvement is possible here given the hardware clock dependency. The 
> module loading order is as follows:
> 
> Step 1.) NSCC driver module
> Step 2.) PCS driver module
> Step 3.) Ethernet driver module
> 
> The 'UNIPHY' PCS clocks (from Serdes to NSSCC) are not needed to be 
> available at the time of registration of PCS MII clocks (NSSCC to PCS 
> MII) by the NSSCC driver (Step 1). The PCS MII clocks is registered 
> before 'UNIPHY' PCS clock is registered, since by default the parent is 
> initialized to 'xo' clock. Below is the output of clock tree on the 
> board before the PCS driver is loaded.
> 
> xo-board-clk
>      nss_cc_port1_rx_clk_src
>          nss_cc_port1_rx_div_clk_src
>              nss_cc_uniphy_port1_rx_clk
>              nss_cc_port1_rx_clk
> 
> The 'UNIPHY' PCS clock is later configured as a parent to the PCS MII 
> clock at the time when the Ethernet and PCS drivers are enabled (step3) 
> and the MAC links up. At link up time, the NSSCC driver sets the NSSCC 
> port clock rate (by configuring the divider) based on the link speed, 
> during which time the NSSCC port clock's parent is switched to 'UNIPHY' 
> PCS clock. Below is the clock tree dump after this step.
> 
> 7a00000.ethernet-pcs::rx_clk
>      nss_cc_port1_rx_clk_src
>          nss_cc_port1_rx_div_clk_src
>              nss_cc_uniphy_port1_rx_clk
>              nss_cc_port1_rx_clk
> 

I tried this PCS driver, and I am seeing a circular dependency in the 
clock init. If the clock tree is:
     GCC -> NSSCC -> PCS(uniphy) -> NSSCC -> PCS(mii)

The way I understand it, the UNIPHY probe depends on the MII probe. If 
MII .probe() returns -EPROBE_DEFER, then so will the UNIPHY .probe(). 
But the MII cannot probe until the UNIPHY is done, due to the clock 
dependency. How is it supposed to work?

The way I found to resolve this is to move the probing of the MII clocks 
to ipq_pcs_get().

This is the kernel log that I see:

[   12.008754] platform 39b00000.clock-controller: deferred probe 
pending: platform: supplier 7a00000.ethernet-pcs not ready
[   12.008788] mdio_bus 90000.mdio-1:18: deferred probe pending: 
mdio_bus: supplier 7a20000.ethernet-pcs not ready
[   12.018704] mdio_bus 90000.mdio-1:00: deferred probe pending: 
mdio_bus: supplier 90000.mdio-1:18 not ready
[   12.028588] mdio_bus 90000.mdio-1:01: deferred probe pending: 
mdio_bus: supplier 90000.mdio-1:18 not ready
[   12.038310] mdio_bus 90000.mdio-1:02: deferred probe pending: 
mdio_bus: supplier 90000.mdio-1:18 not ready
[   12.047943] mdio_bus 90000.mdio-1:03: deferred probe pending: 
mdio_bus: supplier 90000.mdio-1:18 not ready
[   12.057579] platform 7a00000.ethernet-pcs: deferred probe pending: 
ipq9574_pcs: Failed to get MII 0 RX clock
[   12.067209] platform 7a20000.ethernet-pcs: deferred probe pending: 
ipq9574_pcs: Failed to get MII 0 RX clock
[   12.077200] platform 3a000000.qcom-ppe: deferred probe pending: 
platform: supplier 39b00000.clock-controller not ready


PHY:
&mdio {
	qca8k_nsscc: clock-controller@18 {
		compatible = "qcom,qca8084-nsscc";
		...
	};

	ethernet-phy-package@0 {
		compatible = "qcom,qca8084-package";
		...

		qca8084_0: ethernet-phy@0 {
			compatible = "ethernet-phy-id004d.d180";
			reg = <0>;
			clocks = <&qca8k_nsscc NSS_CC_GEPHY0_SYS_CLK>;
			resets = <&qca8k_nsscc NSS_CC_GEPHY0_SYS_ARES>;
		};
		qca8084_1: ethernet-phy@1 {
			compatible = "ethernet-phy-id004d.d180";
			reg = <1>;
			clocks = <&qca8k_nsscc NSS_CC_GEPHY1_SYS_CLK>;
			resets = <&qca8k_nsscc NSS_CC_GEPHY1_SYS_ARES>;
		};
		qca8084_2: ethernet-phy@2 {
			compatible = "ethernet-phy-id004d.d180";
			reg = <2>;
			clocks = <&qca8k_nsscc NSS_CC_GEPHY2_SYS_CLK>;
			resets = <&qca8k_nsscc NSS_CC_GEPHY2_SYS_ARES>;
		};
		qca8084_3: ethernet-phy@3 {
			compatible = "ethernet-phy-id004d.d180";
			reg = <3>;
			clocks = <&qca8k_nsscc NSS_CC_GEPHY3_SYS_CLK>;
			resets = <&qca8k_nsscc NSS_CC_GEPHY3_SYS_ARES>;
		};
	};

	qca8081_12: ethernet-phy@12 {
		reset-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
		reg = <12>;
	};

PCS:
	pcs_uniphy0: ethernet-pcs@7a00000 {
		compatible = "qcom,ipq9574-pcs";
		...
		pcsuniphy0_ch0: pcs-mii@0 {
			reg = <0>;
			clocks = <&nsscc NSS_CC_UNIPHY_PORT1_RX_CLK>,
				 <&nsscc NSS_CC_UNIPHY_PORT1_TX_CLK>;
			clock-names = "rx",
				      "tx";
		};
		...

MAC:
		port@1 {
			reg = <1>;
			phy-mode = "usxgmii";
			managed = "in-band-status";
			phy-handle = <&qca8084_0>;
			pcs-handle = <&pcsuniphy0_ch0>;
			...
		};

