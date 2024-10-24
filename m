Return-Path: <linux-arm-msm+bounces-35684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17989AE67C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4AD51C250F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA7C1F6679;
	Thu, 24 Oct 2024 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mqNEzRNA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAF71EC012;
	Thu, 24 Oct 2024 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776381; cv=none; b=sHP9IzEofRaJNkrUTwAjXBZbegYt/RgOU4iw9X44Ptn6HqJu3AQCS7bxwEq47w+9CZr9BVutw0UmX8vo7iz74QaLcs9nsvYwxUzTSjB1CwxPWvQtA5DstTHmMMo/nBHVS3z9z4tD3E4ppTcTorFQ0Dn6azsfZ+7egaOhlp85j4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776381; c=relaxed/simple;
	bh=0tls3eGOr1d6ACH2zu/yvzcAsZUIwQyO8rlVmljl+5U=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:CC:
	 In-Reply-To:Content-Type; b=Zp+BOubpFAkJOFD2SxmoA26/zOYq4j6WSizDSM9+jIi3z1wHhifVnUyHksgQhMIqfN1KccXxglcRXi2CZGMrQ/w0FlV/vJXcwod1j7NVmIFLEmfF3hyu1uwRVc6JTP8YDeHs0p3EsuV/l6VhdbRinj4YZBhsRltmr4w76RXr6sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mqNEzRNA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAFMvf027445;
	Thu, 24 Oct 2024 13:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I7RK5WYlfvj4gbXTMQ+TD923FalvRwp02PWzUc+gprs=; b=mqNEzRNAbT4TvVYy
	d/roNlhOLQFBcON9Z0JKJy9qb0or9Yc7aWOWS+f9ftsC+7v6htletI15/cIRr2uj
	s8EpEy6b7uZ6bvI7oYVU42059OngWWQiO6KnbMaJ6yqIp6Oh01iHDJxb0Bo3vrW7
	W+vAEuz4UqF3ynaNSmr78d5zN/tpQe/mXMZonVc5+zIXvh2gn0vPRwbEC46gubcx
	ZnNu9MWrY4bdosHAtxRHSDYSVGpGq5p8giBHzXRsB17kC3C4KmapvU7ZrRgO4fh9
	Ot+zqvfaxCW7H4VKzUYdtWWiiXiorsR/bo7M6HWIcKUBWfPsCGcAuvQF8Iv+dXaM
	95p9QA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41wqhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:25:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODPqXD010676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:25:52 GMT
Received: from [10.50.41.186] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 06:25:45 -0700
Message-ID: <641f830e-8d21-4bc0-abe2-59e2c4d29b92@quicinc.com>
Date: Thu, 24 Oct 2024 18:55:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv_6mf3uYcqtHC2j@shell.armlinux.org.uk>
 <ba1bf2a6-76b7-4e82-b192-86de9a8b8012@quicinc.com>
 <7b5227fc-0114-40be-ba5d-7616cebb4bf9@lunn.ch>
Content-Language: en-US
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacob Keller
	<jacob.e.keller@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vsmuthu@qti.qualcomm.com>,
        <arastogi@qti.qualcomm.com>, <linchen@qti.qualcomm.com>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
        "Lei Wei (QUIC)"
	<quic_leiwei@quicinc.com>
In-Reply-To: <7b5227fc-0114-40be-ba5d-7616cebb4bf9@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MPx0gafbH9Rl4DwypXNRnvMgvRnCsQDT
X-Proofpoint-ORIG-GUID: MPx0gafbH9Rl4DwypXNRnvMgvRnCsQDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

On 10/22/2024 7:07 PM, Andrew Lunn wrote:
>> Apologies for the delay in response. I understand that the PCS<->PHY
>> clocks may be out of the scope of PCS DT due to the reasons you mention.
>> However would like to clarify that the MII clocks referred to here, are
>> part of the connection between the MAC and PCS and not between PCS and PHY.
>>
>> Below is a diagram that shows the sub-blocks inside the 'UNIPHY' block
>> of IPQ9574 which houses the PCS and the serdes, along with the clock
>> connectivity. The MII Rx/Tx clocks are supplied from the NSS CC, to the
>> GMII channels between PCS and MAC. So, it seemed appropriate to have
>> these clocks described as part of the PCS DT node.
>>
>>               +-------+ +---------+  +-------------------------+
>>    -----------|CMN PLL| |  GCC    |  |   NSSCC (Divider)       |
>>    |25/50mhz  +----+--+ +----+----+  +--+-------+--------------+
>>    |clk            |         |          ^       |
>>    |       31.25M  |  SYS/AHB|clk  RX/TX|clk    +------------+
>>    |       ref clk |         |          |       |            |
>>    |               |         v          | MII RX|TX clk   MAC| RX/TX clk
>>    |            +--+---------+----------+-------+---+      +-+---------+
>>    |            |  |   +----------------+       |   |      | |     PPE |
>>    v            |  |   |     UNIPHY0            V   |      | V         |
>>   +-------+     |  v   |       +-----------+ (X)GMII|      |           |
>>   |       |     |  +---+---+   |           |--------|------|-- MAC0    |
>>   |       |     |  |       |   |           | (X)GMII|      |           |
>>   |  Quad |     |  |SerDes |   |  (X)PCS   |--------|------|-- MAC1    |
>>   |       +<----+  |       |   |           | (X)GMII|      |           |
>>   |(X)GPHY|     |  |       |   |           |--------|------|-- MAC2    |
>>   |       |     |  |       |   |           | (X)GMII|      |           |
>>   |       |     |  +-------+   |           |--------|------|-- MAC3    |
>>   +-------+     |              |           |        |      |           |
>>                 |              +-----------+        |      |           |
>>                 +-----------------------------------+      |           |
> 
> Thanks for the detailed diagram. That always helps get things
> straight.
> 
> Im i correct in says that MII RX|TX is identical to MAC RX|TX? These
> two clocks are used by the MAC and XPCS to clock data from one to the
> other? If they are the exact same clocks, i would suggest you use the
> same name, just to avoid confusion.
> 

Yes, these two clocks are used by MAC and PCS to clock data to one
another. The MAC Rx/Tx clocks and MII Rx/Tx clocks are different clocks
and can be enabled/disabled independently. However their parent clock is
the same and hence their rate is same at all times. For example, the
phylink ops will set the rate of MAC Rx/Tx during a link speed change,
and this same rate is effected for the MII Rx/Tx clock.

Sure for the purpose of rest of this discussion, we can refer to them as
MII Rx/Tx clocks.

I would also like to clarify that each of the '(X)PCS' blocks shown in
the diagram, includes two PCS types, a 'PCS' type that supports 1Gbps
PCS modes, and another 'XPCS' block (Synopsys) that supports 10Gbps PCS
modes. The MII Rx/Tx clocks from the NSS CC, are supplied to the xGMII
channels of both these PCS.

> Both XPCS and PPE are clock consumers, so both will have a phandle
> pointing to the NSSCC clock provider?
> 

Yes, this is correct.

>> We had one other question on the approach used in the driver for PCS
>> clocks, could you please provide your comments.
>>
>> As we can see from the above diagram, each serdes in the UNIPHY block
>> provides the clocks to the NSSCC, and the PCS block consumes the MII
>> Rx/Tx clocks. In our current design, the PCS/UNIPHY driver registers a
>> provider driver for the clocks that the serdes supplies to the NSS CC.
> 
> That sounds reasonable>
>> It also enables the MII Rx/Tx clocks which are supplied to the PCS from
>> the NSS CC. Would this be an acceptable design to have the PCS driver
>> register the clock provider driver and also consume the MII Rx/Tx
>> clocks? It may be worth noting that the serdes and PCS are part of the
>> same UNIPHY block and also share same register region.
> 
> Does the SERDES consume the MII Rx/Tx? Your diagram indicates it does
> not. 

The SERDES in the UNIPHY does not consume the MII Rx/Tx clocks. The
consumer of these clocks is the PCS block within the UNIPHY.

The SERDES only provides the source Rx/tx clocks to the NSS CC, and the
NSS CC divides this clock and supplies the per-channel MII Rx/Tx clocks
to the PCS.

> I'm just wondering if you have circular dependencies at runtime?
> 
> Where you will need to be careful is probe time vs runtime. Since you
> have circular phandles you need to first create all the clock
> providers, and only then start the clock consumers. Otherwise you
> might get into an endless EPROBE_DEFER loop.
> 

The Rx/Tx clocks sourced from the SERDES are registered as provider
clocks by the UNIPHY/PCS driver during probe time. There is no runtime
operation needed for these clocks after this.

The MII Rx/Tx clocks are enabled later when the MAC is initialized by
the network driver. The network driver calls an API exported by the PCS
driver, which creates the PCS instance and enables the MII Rx/Tx clocks.
Ideally, the PCS driver probe should have completed and provider clocks
registered, by the time the MAC is initialized (we handle the error case
in case the probe is still not complete).

> 	Andrew
> 

