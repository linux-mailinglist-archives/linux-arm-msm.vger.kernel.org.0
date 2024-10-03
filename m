Return-Path: <linux-arm-msm+bounces-33042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819C98F593
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 19:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89946B22964
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 17:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246DA1A726F;
	Thu,  3 Oct 2024 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ku2IpwA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755038DD1;
	Thu,  3 Oct 2024 17:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727977856; cv=none; b=SVVG0Tm5ky+3RNZ2JO/NVeHYe11AOfExfRYbNLeJZDlXeiYDoXw5Z5PpS/JRtY7HJ/dewoiNoKxEIIfq6lEWc7OkhkHMV/cbL8WbZV/ngnPI9Y2djOgxWNVU7/r9C1MKuHwCVbQtzzHkT9l9zIhgIcv1cWCpaAhdLnibyp9+zUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727977856; c=relaxed/simple;
	bh=iBjBdCHs/bUGkLTkj1v6dw8uVbnsQmaNTfp+18EilCk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=kNpXMG2YS+ba+tKLuLntCbWLBQpgY/VvIimyxRUlMiROqEua8kbsuTcNCmStKqr4pb7UlyEbhrKKYWCjDXu89LQGY4QOC0vrfhLsmbJ4SLMIUnlS5FAnpaTib7nViiATK1XDnRvuelYhEavW8X1tRiebxs0g1ZNhdlrnvdR7FGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ku2IpwA9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4939P9QU027121;
	Thu, 3 Oct 2024 17:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/m6ITiyDI+jHHJWGVWTFNKipC/rPlkCVT9+CxXpVPY=; b=ku2IpwA9X5S5jJMi
	EIMaxL/Ngultpxf6OXwBNpZxvdq/ARTAUlPJan9LW4One+a1kkjxUeXupPd2E+u+
	Cz0RQene8yfqaCstcViPSlyPoTpENuEMHHMKGU4ekWw1EKI36ZGou4I6Yh6zMe0M
	q9pyWhkM6TEAb+KpTOI4091q7EdxDz43OKuRHDyQDU+wInpW5m3mExebln4sflE7
	OJL1Z7WiQwSfGU0PIs+EgY3KYi+hz8vcw7IKbW560Tps6ZaB1qJX+ntUOWS+Vc03
	Y8oIwzxTnpm2OQeq1yOgV4X4BtP8P4CHXjmU8RG76teUgjF7780Rx38U6n52tVRW
	H9Si1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vuf6m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 17:50:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 493HoHv2003035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Oct 2024 17:50:17 GMT
Received: from [10.216.62.135] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Oct 2024
 10:50:07 -0700
Message-ID: <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
Date: Thu, 3 Oct 2024 23:20:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
To: Andrew Lunn <andrew@lunn.ch>
CC: <netdev@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Russell King <linux@armlinux.org.uk>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vsmuthu@qti.qualcomm.com>,
        <arastogi@qti.qualcomm.com>, <linchen@qti.qualcomm.com>,
        <john@phrozen.org>, Luo Jie
	<quic_luoj@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Suruchi
 Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
        "Lei Wei (QUIC)"
	<quic_leiwei@quicinc.com>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
Content-Language: en-US
In-Reply-To: <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m22k9veSjcq9AoPsDcDpcIC8gQp9KhwG
X-Proofpoint-ORIG-GUID: m22k9veSjcq9AoPsDcDpcIC8gQp9KhwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410030127



On 10/3/2024 2:58 AM, Andrew Lunn wrote:
> On Thu, Oct 03, 2024 at 02:07:10AM +0530, Kiran Kumar C.S.K wrote:
>> Hello netdev,
>>
>> We are planning to publish driver patches for adding Ethernet support
>> for Qualcomm's IPQ9574 SoC, and looking for some advice on the approach
>> to follow. There are two new drivers (described below) split across four
>> patch series, totaling to 40 patches. These two drivers depend on a
>> couple of clock controller drivers which are currently in review with
>> the community.
>>
>> Support is currently being added only for IPQ9574 SoC. However the
>> drivers are written for the Qualcomm PPE (packet process engine)
>> architecture, and are easily extendable for additional IPQ SoC (Ex:
>> IPQ5332) that belong to the same network architecture family.
>>
>> Given the number of patches for IPQ9574, we were wondering whether it is
>> preferred to publish the four series together, since having all the code
>> available could help clarify the inter-workings of the code. Or whether
>> it is preferred to publish the patches sequentially, depending on the
>> review progress?
> 
> Sequentially. You are likely to learn about working with mainline code
> from the first patch series, which will allow you to improve the
> following series before posting them.
> 

OK, thanks.

>>          +---------+
>>          |  48MHZ  |
>>          +----+----+
>>               |(clock)
>>               v
>>          +----+----+
>>   +------| CMN PLL |
>>   |      +----+----+
>>   |           |(clock)
>>   |           v
>>   |      +----+----+           +----+----+  clock   +----+----+
>>   |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
>>   |  |   +----+----+           +----+----+          +----+----+
>>   |  |        |(clock & reset)      |(clock & reset)
>>   |  |        v                     v
>>   |  |   +-----------------------------+----------+----------+---------+
>>   |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
>>   |  |   |       | SCH |               +----------+          +---------+
>>   |  |   |       +-----+                      |               |        |
>>   |  |   |  +------+   +------+            +-------------------+       |
>>   |  |   |  |  BM  |   |  QM  |            | L2/L3 Switch Core |       |
>>   |  |   |  +------+   +------+            +-------------------+       |
>>   |  |   |                                   |                         |
>>   |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
>>   |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
>>   |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
>>   |  |   |     |         |         |         |         |         |     |
>>   |  |   +-----+---------+---------+---------+---------+---------+-----+
>>   |  |         |         |         |         |         |         |
>>   |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
>>   +--+---->|             PCS0                    | |  PCS1 | | PCS2  |
>>   | clock  +---+---------+---------+---------+---+ +---+---+ +---+---+
>>   |            |         |         |         |         |         |
>>   |        +---+---------+---------+---------+---+ +---+---+ +---+---+
>>   | clock  +----------------+                    | |       | |       |
>>   +------->|Clock Controller|   4-port Eth PHY   | | PHY4  | | PHY5  |
>>            +----------------+--------------------+ +-------+ +-------+
>>
>>
>> 1.1 PPE: Internal blocks overview
>> =================================
>>
>> The Switch core
>> ---------------
>> It has maximum 8 ports, comprising 6 GMAC ports and two DMA interfaces
>> (for Ethernet DMA and EIP security processor) on the IPQ9574.
> 
> How are packets from the host directed to a specific egress port? Is
> there bits in the DMA descriptor of the EDMA? Or is there an
> additional header in the fields? This will determine if you are
> writing a DSA switch driver, or a pure switchdev driver. 

The DMA descriptor carries the information on the destination port.
There is no additional header required in the packet.

> 
>> GMAC/xGMAC
>> ----------
>> There are 6 GMAC and 6 XGMAC in IPQ9574. Depending on the board ethernet
>> configuration, either GMAC or XGMAC is selected by the PPE driver to
>> interface with the PCS. The PPE driver initializes and manages these
>> GMACs, and registers one netdevice per GMAC.
> 
> That suggests you are doing a pure switchdev driver.
> 

Agree that switchdev is the right model for this device. We were
planning to enable base Ethernet functionality using regular
(non-switchdev) netdevice representation for the ports initially,
without offload support. As the next step, L2/VLAN offload support using
switchdev will be enabled on top. Hope this phased approach is fine.

>> 2. List of patch series and dependencies
>> ========================================
>>
>> Clock drivers (currently in review)
>> ===================================
>> 1) CMN PLL driver patch series:
>> 	Currently in review with community.
>> 	https://lore.kernel.org/linux-arm-msm/20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com/
>>
>>
>> 2) NSS clock controller (NSSCC) driver patch series
>> 	Currently in review with community.
>> 	https://lore.kernel.org/linux-arm-msm/20240626143302.810632-1-quic_devipriy@quicinc.com/
>>
>>
>> Networking drivers (to be posted for review next week)
>> ======================================================
>>
>> The following patch series are planned to be pushed for the PPE and PCS
>> drivers, to support ethernet function. These patch series are listed
>> below in dependency order.
>>
>> 3) PCS driver patch series:
>>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
>>         be enabled in drivers/net/pcs/
>> 	Dependent on NSS CC patch series (2).
> 
> I assume this dependency is pure at runtime? So the code will build
> without the NSS CC patch series?

The MII Rx/Tx clocks are supplied from the NSS clock controller to the
PCS's MII channels. To represent this in the DTS, the PCS node in the
DTS is configured with the MII Rx/Tx clock that it consumes, using
macros for clocks which are exported from the NSS CC driver in a header
file. So, there will be a compile-time dependency for the dtbindings/DTS
on the NSS CC patch series. We will clearly call out this dependency in
the cover letter of the PCS driver. Hope that this approach is ok.

> 
> This should be a good way to start, PCS drivers are typically nice and
> simple.
> 

Sure, thanks for the inputs.

> 	Andrew

