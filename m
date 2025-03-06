Return-Path: <linux-arm-msm+bounces-50472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81419A54603
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 10:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9749189236B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0C320897A;
	Thu,  6 Mar 2025 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jzTEclTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA531F95A;
	Thu,  6 Mar 2025 09:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741252414; cv=none; b=gLLQEX6zMWsVxWvCTE9YOnX7RX9b8ZGMc810JQh7si9ASuzh90aS9lGIzfjVcH1T4fPRiqBCu4YKvAncwiCr/a1zxCbuG/n13Zok+7+9JZo0hes7xoPmxhQgmL/4urZBBHvBa7SChR14u/LSoYgGQddF1h6gmC4kqUO5Qlm/wFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741252414; c=relaxed/simple;
	bh=zTJousXSwdKvohQTZPKFTrsuH6nGK4IIBoybGjYPNrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZNSz3DWUSxh5/5xVmBCf1MgiTWA/TJb1IM9mAFyZTKDNSdIX2H2pQbXDV7kwfHXWE59jQnMsZVwTAzuYOYY6vzJxyPYe6MIlgQquKzMZXTqqNje86wn1Kub3mxk2krp5CkcmW/inhj6iLNJ2lZiE1VernNzLBev8mT68mmhL1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jzTEclTz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5266tV2A030836;
	Thu, 6 Mar 2025 09:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u95RgYwfxOedz67PnaEFwP7N9hCqyiwH6JKwM6csGIg=; b=jzTEclTzyzMk876f
	FmMKCiHtrviSBu8cQbUg5/cLDNHKFYC72MNljZC/8I19FLK1b2XNxDkzSgdJr5p1
	ONP5gJCdZu/TINfcyMTrAYKRG7TV3KbrgubAD3SAfdCL8rWSshc1BsaBoFkS3e/n
	L2EUD1cCNtZRmoOzVq/jIciZ6cokQ9LpK8/vbKrj0kLBeXbD3CefGTIXk/fVy1yq
	+cmjvu6TXTL7Cf7J5QIiYFRdkty79MlFQeHt8KQhwvFRNgM3E1ua8AuzsnKRsy74
	rBDboRMGh58qSOfzZaXTZ32jTr8wPGFva7VmhTJyrxseVc8UJ+bj7KstnhUrbjfB
	1QecTw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456uy0a1xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 09:13:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5269D0D4015823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 09:13:00 GMT
Received: from [10.235.5.28] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 01:12:54 -0800
Message-ID: <bab2a500-f507-4ff6-bf69-753718a5f9a5@quicinc.com>
Date: Thu, 6 Mar 2025 17:12:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Andrew
 Lunn" <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
 <20250211195934.47943371@kernel.org> <Z6x1xD0krK0_eycB@shell.armlinux.org.uk>
 <71a69eb6-9e24-48ab-8301-93ec3ff43cc7@quicinc.com>
 <Z8HGnop3ONe5mDGk@shell.armlinux.org.uk>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <Z8HGnop3ONe5mDGk@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Pq5pbxM3 c=1 sm=1 tr=0 ts=67c9671d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=HUK4jp44M_l0HevavwsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GSW7CwCD_IJtJcaBrJG3m-zEVaX4ziE8
X-Proofpoint-GUID: GSW7CwCD_IJtJcaBrJG3m-zEVaX4ziE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060069



On 2/28/2025 10:22 PM, Russell King (Oracle) wrote:
> On Wed, Feb 19, 2025 at 06:46:57PM +0800, Lei Wei wrote:
>>> 2) there's yet another open coded "_get" function for getting the
>>> PCS given a DT node which is different from every other "_get"
>>> function - this one checks the parent DT node has an appropriate
>>> compatible whereas others don't. The whole poliferation of "_get"
>>> methods that are specific to each PCS still needs solving, and I
>>> still have the big question around what happens when the PCS driver
>>> gets unbound - and whether that causes the kernel to oops. I'm also
>>> not a fan of "look up the struct device and then get its driver data".
>>> There is *no* locking over accessing the driver data.
>>
>> The PCS device in IPQ9574 chipset is built into the SoC chip and is not
>> pluggable. Also, the PCS driver module is not unloadable until the MAC
>> driver that depends on it is unloaded. Therefore, marking the driver
>> '.suppress_bind_attrs = true' to disable user unbind action may be good
>> enough to cover all possible scenarios of device going away for IPQ9574 PCS
>> driver.
> 
> What I am concerned about is the proliferation of these various PCS
> specific "_get" methods. Where the PCS is looked up by firmware
> reference, we should have a common way to do that, rather than all
> these PCS specific ways.
> 
> I did start work on that, but I just haven't had the time to take it
> forward. This is about as far as I'd got:
> 
> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> index 4f7920618b90..0b670fee0757 100644
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -1,6 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for Linux PCS drivers
>   
> +obj-$(CONFIG_PHYLINK)		+= pcs-core.o
> +
>   pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
>   				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
>   
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 976e569feb70..1c5492dab00e 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -2483,6 +2483,15 @@ void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
>   }
>   EXPORT_SYMBOL_GPL(phylink_pcs_change);
>   
> +/**
> + * phylink_pcs_remove() - notify phylink that a PCS is going away
> + * @pcs: PCS that is going away
> + */
> +void phylink_pcs_remove(struct phylink_pcs *pcs)
> +{
> +	
> +}
> +
>   static irqreturn_t phylink_link_handler(int irq, void *data)
>   {
>   	struct phylink *pl = data;
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 071ed4683c8c..1e6b7ce0fa7a 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -1,6 +1,7 @@
>   #ifndef NETDEV_PCS_H
>   #define NETDEV_PCS_H
>   
> +#include <linux/list.h>
>   #include <linux/phy.h>
>   #include <linux/spinlock.h>
>   #include <linux/workqueue.h>
> @@ -435,9 +436,11 @@ int mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
>   #endif
>   
>   struct phylink_pcs_ops;
> +struct pcs_lookup;
>   
>   /**
>    * struct phylink_pcs - PHYLINK PCS instance
> + * @lookup: private member for PCS core management
>    * @supported_interfaces: describing which PHY_INTERFACE_MODE_xxx
>    *                        are supported by this PCS.
>    * @ops: a pointer to the &struct phylink_pcs_ops structure
> @@ -455,6 +458,7 @@ struct phylink_pcs_ops;
>    * the PCS driver.
>    */
>   struct phylink_pcs {
> +	struct pcs_lookup *lookup;
>   	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
>   	const struct phylink_pcs_ops *ops;
>   	struct phylink *phylink;
> @@ -692,6 +696,7 @@ int phylink_set_fixed_link(struct phylink *,
>   
>   void phylink_mac_change(struct phylink *, bool up);
>   void phylink_pcs_change(struct phylink_pcs *, bool up);
> +void phylink_pcs_remove(struct phylink_pcs *);
>   
>   int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
>   
> @@ -790,4 +795,11 @@ void phylink_mii_c45_pcs_get_state(struct mdio_device *pcs,
>   
>   void phylink_decode_usxgmii_word(struct phylink_link_state *state,
>   				 uint16_t lpa);
> +
> +/* PCS lookup */
> +struct phylink_pcs *pcs_find(void *id);
> +void pcs_remove(struct phylink_pcs *pcs);
> +int pcs_add(struct phylink_pcs *pcs, void *id);
> +int devm_pcs_add(struct device *dev, struct phylink_pcs *pcs, void *id);
> +
>   #endif
> 
> The idea is that you add the device using whatever identifier you decide
> (the pointer value is what's matched). For example, a fwnode. You can
> then find it using pcs_find().
> 
> If it returns NULL, then it's not (yet) registered - if you know that it
> should exist (e.g. because the fwnode is marked as available) then you
> can return -EPROBE_DEFER or fail.
> 
> There is a hook present so phylink can do something on PCS removal -
> that's still to be implemented with this. I envision keeping a list
> of phylink instances, and walking that list to discover if any phylink
> instances are currently using the PCS. If they are, then we can take
> the link down.
> 

Thanks for sharing the details about this, the approach looks correct.

Can you suggest whether we can go ahead with the current version of the 
IPQ PCS driver, and update the driver later to use the common way, once 
the infrastructure method is supported? Else (preferably) if the patch 
for your change can be posted, I can modify the IPQ PCS driver patch to 
use the common method and rebase on top of your patch. Please suggest.

>> I would like to clarify on the hardware supported configurations for the
>> UNIPHY PCS hardware instances. [Note: There are three instances of 'UNIPHY
>> PCS' in IPQ9574. However we take the example here for PCS0]
>>
>> UNIPHY PCS0 --> pcs0_mii0..pcs0_mii4 (5 PCS MII channels maximum).
>> Possible combinations: QSGMII (4x 1 SGMII)
>> 			PSGMII (5 x 1 SGMII),
>> 			SGMII (1 x 1 SGMII)
>> 			USXGMII (1 x 1 USXGMII)
>> 	
>> As we can see above, different PCS channels in a 'UNIPHY' PCS block working
>> in different PHY interface modes is not supported by the hardware. So, it
>> might not be necessary to detect that conflict. If the interface mode
>> changes from one to another, the same interface mode is applicable to all
>> the PCS channels that are associated with the UNIPHY PCS block.
>>
>> Below is an example of a DTS configuration which depicts one board
>> configuration where one 'UNIPHY' (PCS0) is connected with a QCA8075 Quad
>> PHY, it has 4 MII channels enabled and connected with 4 PPE MAC ports, and
>> all the PCS MII channels are in QSGMII mode. For the 'UNIPHY' connected with
>> single SGMII or USXGMII PHY (PCS1), only one MII channel is enabled and
>> connected with one PPE MAC port.
>>
>> PHY:
>> &mdio {
>> 	ethernet-phy-package@0 {
>>                  compatible = "qcom,qca8075-package";
>>                  #address-cells = <1>;
>>                  #size-cells = <0>;
>>                  reg = <0x10>;
>>                  qcom,package-mode = "qsgmii";
>>
>>                  phy0: ethernet-phy@10 {
>>                          reg = <0x10>;
>>                  };
>>
>>                  phy1: ethernet-phy@11 {
>>                          reg = <0x11>;
>>                  };
>>
>>                  phy2: ethernet-phy@12 {
>>                          reg = <0x12>;
>>                  };
>>
>>                  phy3: ethernet-phy@13 {
>>                          reg = <0x13>;
>>                  };
>> 	};
>> 	phy4: ethernet-phy@8 {
>>                  compatible ="ethernet-phy-ieee802.3-c45";
>>                  reg = <8>;
>>          };
>> }
>>
>> PCS:
>> pcs0: ethernet-pcs@7a00000 {
>> 	......
>> 	pcs0_mii0: pcs-mii@0 {
>> 		reg = <0>;
>> 		status = "enabled";
>> 	};
>>
>> 	......
>>
>> 	pcs0_mii3: pcs-mii@3 {
>> 		reg = <3>;
>> 		status = "enabled";
>> 	};
>> };
> 
> Given that this is a package of several PCS which have a global mode, I
> think it would be a good idea to have a property like
> "qcom,package-mode" which defines which of the four modes should be used
> for all PCS.
> 
> Then the PCS driver initialises supported_interfaces for each of these
> PCS to only contain that mode, thereby ensuring that unsupported
> dissimilar modes can't be selected or the mode unexpectedly changed.
> 

OK, I will add the "qcom,package-mode" property to restrict the 
supported_interfaces for each of the MII PCS instances.

