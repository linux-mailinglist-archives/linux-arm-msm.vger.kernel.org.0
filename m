Return-Path: <linux-arm-msm+bounces-57872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40AAB70B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C79F17D036
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5051DF27C;
	Wed, 14 May 2025 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bvXBsqf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1C1D7E4A;
	Wed, 14 May 2025 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238695; cv=none; b=BCJbPUdMJ+ZfD+CgR7EvHcurPyVFgvE4qkrEYh09LN9u+fZN5lZDfQdDDxaDM5YzKIz9pKn4BAPJrKbn85d3W/JhEVPsIhU1GhPKr7aocsfuhrlFskHdTBoDW0fGTsnLIttaGIH2yqZhP0azdVhQg03RYfYkpXODlMI0lRrE4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238695; c=relaxed/simple;
	bh=4ImxY/ECzVsiIFSg52uPQTlwUlbgjp+oNKrk9sWYZMU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=Ver2Buk9+h+X4JlX+fNCJ500WG8rAUgjfV1a7daIVPakE/LQ7YGIfQyez+AwIFZAbpqV8lsaBppvK90pqE/FH0IxJlwmR1oEfdI43M3ZrqzmAoluvPHIZ8OglssC0ys1hvhyLB9vLSs9J5jkhCl03vJ/+5F+2zFjS42Dj029zZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bvXBsqf0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvi0015147;
	Wed, 14 May 2025 16:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4TZ95Czu2LXiut5B5OmN/luSewVQgmhmwFUhuwQ1MA=; b=bvXBsqf0rxb4YNvv
	2IfsM2cLQ7HmorgUdhl4q9nv/Xh1GByFlnBI7JByY8QYrQCprF7sjYi78JkUp1Er
	Nme0zGTX7h9U4115mJRYE+mg1j8vaeg6CovW9XwzqqtyuevYKMtO6MX5Ya04AmBi
	/NxBL22bRvt7bHvqsThDTvsQ62iDZ+Qz9SZpYPgK9muxlPSgzx0ygJrmKbPJODWy
	g/OuwnPSfCgROfTLGKlu4W+lwMKSzv7TLnzGBNaQZE+FKfAjT6T9KjnvhWF6DfoB
	Ld36c+P79g8u/t0or3SiwK+6gJdFiUAd87bDLRfRh3bdBE+skAkzhU7K+jF7dzfb
	/2V6xQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr370f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 16:04:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EG4GPX014775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 16:04:16 GMT
Received: from [10.253.10.1] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 09:04:11 -0700
Message-ID: <c6a78dd6-763c-41a0-8a6e-2e81723412be@quicinc.com>
Date: Thu, 15 May 2025 00:03:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Lei Wei <quic_leiwei@quicinc.com>
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
To: <mr.nuke.me@gmail.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
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
 <0c1a0dbd-fd24-40d7-bec9-c81583be1081@gmail.com>
Content-Language: en-US
In-Reply-To: <0c1a0dbd-fd24-40d7-bec9-c81583be1081@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: W6uLmkjD5taDTbsPnoYRFs5XbnFi_MgM
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824bf02 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=FdSGMDbd993SkDHxMvMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: W6uLmkjD5taDTbsPnoYRFs5XbnFi_MgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE0MyBTYWx0ZWRfX+aQmYd1UQz8D
 rxbBbkMSTx+zbWYMPdOMREiffzzXVSCsd62kz0xIJ56z5E47IihBj3OexvkS+gHc6W7sCeXo9Hr
 /J5hWQahQ8QTBAlit9xqtCxSsoyt0l0BFCHgF6erX1OvcR/cWvyZs4GqQ3avSJkPuw466WAmxMm
 pONoZQGt+S9jckCCxaz7EYLlUlnEvgo3z7kuDmhSEh9YSpJ+EW8bfKgPQXmR6lk6bp4vqYvcPsy
 gJfEeG4h/kIWQ2ck0SgDQc0wTzT2NQ3rRCDIimb9y6QkhA4eAibIy8QcDri9Dg9QPHvUVIaYDn/
 XKltQ70N1PK46CEkjbFjmJLkqo/0K+f0Ji2Y3jM8Zq+BJiv0AOC/lUBv3y48eDqvysZAhr/+JfY
 71dMq3MvwD8sbst/4Cru8DMhiYtd+5WgxfRNfmOQbkfz7WClvHPvvM/JQvDpg1qAcrF8T1lN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140143



On 5/13/2025 6:56 AM, mr.nuke.me@gmail.com wrote:
> On 2/19/25 4:46 AM, Lei Wei wrote:
>>
>> On 2/12/2025 6:19 PM, Russell King (Oracle) wrote:
>>> On Tue, Feb 11, 2025 at 07:59:34PM -0800, Jakub Kicinski wrote:
>>>> On Fri, 7 Feb 2025 23:53:11 +0800 Lei Wei wrote:
>>>>> The 'UNIPHY' PCS block in the Qualcomm IPQ9574 SoC provides Ethernet
>>>>> PCS and SerDes functions. It supports 1Gbps mode PCS and 10-Gigabit
>>>>> mode PCS (XPCS) functions, and supports various interface modes for
>>>>> the connectivity between the Ethernet MAC and the external PHYs/ 
>>>>> Switch.
>>>>> There are three UNIPHY (PCS) instances in IPQ9574, supporting the six
>>>>> Ethernet ports.
>>>>>
>>>>> This patch series adds base driver support for initializing the PCS,
>>>>> and PCS phylink ops for managing the PCS modes/states. Support for
>>>>> SGMII/QSGMII (PCS) and USXGMII (XPCS) modes is being added initially.
>>>>>
>>>>> The Ethernet driver which handles the MAC operations will create the
>>>>> PCS instances and phylink for the MAC, by utilizing the API exported
>>>>> by this driver.
>>>>>
>>>>> While support is being added initially for IPQ9574, the driver is
>>>>> expected to be easily extendable later for other SoCs in the IPQ
>>>>> family such as IPQ5332.
>>>>
>>>> Could someone with PHY, or even, dare I say, phylink expertise
>>>> take a look here?
>>>
>>> I've not had the time, sorry. Looking at it now, I have lots of
>>> questions over this.
>>>
>>> 1) clocks.
>>>
>>> - Patch 2 provides clocks from this driver which are exported to the
>>>    NSCCC block that are then used to provide the MII clocks.
>>> - Patch 3 consumes clocks from the NSCCC block for use with each PCS.
>>>
>>> Surely this leads to a circular dependency, where the MSCCC driver
>>> can't get the clocks it needs until this driver has initialised, but
>>> this driver can't get the clocks it needs for each PCS from the NSCCC
>>> because the MSCCC driver needs this driver to initialise.
>>>
>>
>> Sorry for the delay in response. Below is a description of the 
>> dependencies between the PCS/NSSCC drivers during initialization time 
>> and how the clock relationships are set up. Based on this, there 
>> should not any issue due to circular dependency, but please let me 
>> know if any improvement is possible here given the hardware clock 
>> dependency. The module loading order is as follows:
>>
>> Step 1.) NSCC driver module
>> Step 2.) PCS driver module
>> Step 3.) Ethernet driver module
>>
>> The 'UNIPHY' PCS clocks (from Serdes to NSSCC) are not needed to be 
>> available at the time of registration of PCS MII clocks (NSSCC to PCS 
>> MII) by the NSSCC driver (Step 1). The PCS MII clocks is registered 
>> before 'UNIPHY' PCS clock is registered, since by default the parent 
>> is initialized to 'xo' clock. Below is the output of clock tree on the 
>> board before the PCS driver is loaded.
>>
>> xo-board-clk
>>      nss_cc_port1_rx_clk_src
>>          nss_cc_port1_rx_div_clk_src
>>              nss_cc_uniphy_port1_rx_clk
>>              nss_cc_port1_rx_clk
>>
>> The 'UNIPHY' PCS clock is later configured as a parent to the PCS MII 
>> clock at the time when the Ethernet and PCS drivers are enabled 
>> (step3) and the MAC links up. At link up time, the NSSCC driver sets 
>> the NSSCC port clock rate (by configuring the divider) based on the 
>> link speed, during which time the NSSCC port clock's parent is 
>> switched to 'UNIPHY' PCS clock. Below is the clock tree dump after 
>> this step.
>>
>> 7a00000.ethernet-pcs::rx_clk
>>      nss_cc_port1_rx_clk_src
>>          nss_cc_port1_rx_div_clk_src
>>              nss_cc_uniphy_port1_rx_clk
>>              nss_cc_port1_rx_clk
>>
> 
> I tried this PCS driver, and I am seeing a circular dependency in the 
> clock init. If the clock tree is:
>      GCC -> NSSCC -> PCS(uniphy) -> NSSCC -> PCS(mii)
> 
> The way I understand it, the UNIPHY probe depends on the MII probe. If 
> MII .probe() returns -EPROBE_DEFER, then so will the UNIPHY .probe(). 
> But the MII cannot probe until the UNIPHY is done, due to the clock 
> dependency. How is it supposed to work?
> 
> The way I found to resolve this is to move the probing of the MII clocks 
> to ipq_pcs_get().
> 
> This is the kernel log that I see:
> 
> [   12.008754] platform 39b00000.clock-controller: deferred probe 
> pending: platform: supplier 7a00000.ethernet-pcs not ready
> [   12.008788] mdio_bus 90000.mdio-1:18: deferred probe pending: 
> mdio_bus: supplier 7a20000.ethernet-pcs not ready
> [   12.018704] mdio_bus 90000.mdio-1:00: deferred probe pending: 
> mdio_bus: supplier 90000.mdio-1:18 not ready
> [   12.028588] mdio_bus 90000.mdio-1:01: deferred probe pending: 
> mdio_bus: supplier 90000.mdio-1:18 not ready
> [   12.038310] mdio_bus 90000.mdio-1:02: deferred probe pending: 
> mdio_bus: supplier 90000.mdio-1:18 not ready
> [   12.047943] mdio_bus 90000.mdio-1:03: deferred probe pending: 
> mdio_bus: supplier 90000.mdio-1:18 not ready
> [   12.057579] platform 7a00000.ethernet-pcs: deferred probe pending: 
> ipq9574_pcs: Failed to get MII 0 RX clock
> [   12.067209] platform 7a20000.ethernet-pcs: deferred probe pending: 
> ipq9574_pcs: Failed to get MII 0 RX clock
> [   12.077200] platform 3a000000.qcom-ppe: deferred probe pending: 
> platform: supplier 39b00000.clock-controller not ready
> 
> 

Hello, thanks for bringing this to our notice. Let me try to understand 
the reason for the probe failure:

The merged NSSCC DTS does not reference the PCS node directly in the 
"clocks" property. It uses a placeholder phandle '<0>' for the 
reference. Please see below patch which is merged.
https://lore.kernel.org/all/20250313110359.242491-6-quic_mmanikan@quicinc.com/

Ideally there should be no direct dependency from NSSCC to PCS driver if
we use this version of the NSSCC DTS.

Hence it seems that you may have a modified patch here, and DTS changes 
have been applied to enable all the Ethernet components including PCS 
and NSSCC, and NSSCC modified to have a direct reference to PCS? However 
even in this case, I think the driver probe should work if the drivers 
are built as modules. Can you please confirm if the NSSCC and PCS 
drivers are built-in to the kernel and not built as modules?

For the case where the drivers are built-in to kernel, and the NSSCC DTS
node has a direct reference to PCS node, we can use the below solution:
[Note that the 'UNIPHY' PCS clocks are not needed for NSSCC clocks
initialization/registration.]

     Enable 'post-init-providers' property in the NSSCC DTS node to mark
    'UNIPHY' PCS as post-initialization providers to NSSCC. This will
     ensure following probe order by the kernel:

     1.) NSSCC driver
     2.) PCS driver.

Please let me know if the above suggestion can help.

Later once the IPQ PCS driver is merged, we are planning to push the PCS 
DTS changes, along with an update of the NSSCC DTS to point to the PCS 
node and mark the "post-init-providers" property. This should work for 
all cases.

Also, in my view, it is not suitable to move PCS MII clocks get to
"ipq_pcs_get()" because the natural loading order for the drivers
is as below:

1) NSSCC driver
2) PCS driver
3) Ethernet driver.

Additionally, the community is currently working on an infrastructure to
provide a common pcs get method. (Christian and Sean Anderson has been 
working on this). Therefore, I expect "ipq_pcs_get" to be dropped in the 
future and replaced with the common pcs get method once this common 
infra is merged.

This is the post-init-providers dtschma:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/post-init-providers.yaml

> PHY:
> &mdio {
>      qca8k_nsscc: clock-controller@18 {
>          compatible = "qcom,qca8084-nsscc";
>          ...
>      };
> 
>      ethernet-phy-package@0 {
>          compatible = "qcom,qca8084-package";
>          ...
> 
>          qca8084_0: ethernet-phy@0 {
>              compatible = "ethernet-phy-id004d.d180";
>              reg = <0>;
>              clocks = <&qca8k_nsscc NSS_CC_GEPHY0_SYS_CLK>;
>              resets = <&qca8k_nsscc NSS_CC_GEPHY0_SYS_ARES>;
>          };
>          qca8084_1: ethernet-phy@1 {
>              compatible = "ethernet-phy-id004d.d180";
>              reg = <1>;
>              clocks = <&qca8k_nsscc NSS_CC_GEPHY1_SYS_CLK>;
>              resets = <&qca8k_nsscc NSS_CC_GEPHY1_SYS_ARES>;
>          };
>          qca8084_2: ethernet-phy@2 {
>              compatible = "ethernet-phy-id004d.d180";
>              reg = <2>;
>              clocks = <&qca8k_nsscc NSS_CC_GEPHY2_SYS_CLK>;
>              resets = <&qca8k_nsscc NSS_CC_GEPHY2_SYS_ARES>;
>          };
>          qca8084_3: ethernet-phy@3 {
>              compatible = "ethernet-phy-id004d.d180";
>              reg = <3>;
>              clocks = <&qca8k_nsscc NSS_CC_GEPHY3_SYS_CLK>;
>              resets = <&qca8k_nsscc NSS_CC_GEPHY3_SYS_ARES>;
>          };
>      };
> 
>      qca8081_12: ethernet-phy@12 {
>          reset-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
>          reg = <12>;
>      };
> 
> PCS:
>      pcs_uniphy0: ethernet-pcs@7a00000 {
>          compatible = "qcom,ipq9574-pcs";
>          ...
>          pcsuniphy0_ch0: pcs-mii@0 {
>              reg = <0>;
>              clocks = <&nsscc NSS_CC_UNIPHY_PORT1_RX_CLK>,
>                   <&nsscc NSS_CC_UNIPHY_PORT1_TX_CLK>;
>              clock-names = "rx",
>                        "tx";
>          };
>          ...
> 
> MAC:
>          port@1 {
>              reg = <1>;
>              phy-mode = "usxgmii";
>              managed = "in-band-status";
>              phy-handle = <&qca8084_0>;
>              pcs-handle = <&pcsuniphy0_ch0>;
>              ...
>          };

