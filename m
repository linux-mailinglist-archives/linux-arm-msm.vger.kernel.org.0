Return-Path: <linux-arm-msm+bounces-890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224C7EEFE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2D171F26590
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBDD1865A;
	Fri, 17 Nov 2023 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RaSlQJ4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD2385;
	Fri, 17 Nov 2023 02:16:04 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH9b98J025794;
	Fri, 17 Nov 2023 10:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5cKcmiXRyWqcSrnZNV5uxcqTjwzGW9zilSiurwKvu5w=;
 b=RaSlQJ4KsmgP6U4M8kPrL8ZFHPRL8zTL98o8W7cYxVKXwqpKM4bp+jku88WuugXoGOsM
 OG/szis8bQuNpFWsvO5IV5yehpV6oNdvlHYTTLR1hFtPghKPpvWC3Zscu6CINXzIo6oH
 hy0f1M0WGEA4+z+tIbIFOBdHfYBlGvgSWI5CnLysc8AoUS8FlFvd3UxtTkDPTd4y2xev
 B/jvN6hkTj4QQiT5g+5AgOXLAK4Zx5NBu0SKrdH4xvrfDGcP9fPMPqGd/hPvgQhbazjZ
 mbyir2AXY8uEnBm3QreR/pstrEb1Mbft8GNHZCUsRs/pZ8YtgQGF7mjrKfNU6AaSwcTw 0Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue5per2k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:15:46 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHAFkp3007021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:15:46 GMT
Received: from [10.253.8.81] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 02:15:41 -0800
Message-ID: <c1233090-b77d-43b7-9419-74f904cfae07@quicinc.com>
Date: Fri, 17 Nov 2023 18:15:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] net: mdio: ipq4019: add qca8084 configurations
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
CC: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-9-quic_luoj@quicinc.com>
 <a1954855-f82d-434b-afd1-aa05c7a1b39b@lunn.ch>
 <2ca3c6eb-93da-4e44-aa6b-c426b8baecb9@quicinc.com>
 <be36ecb8-8bd7-4756-927e-fa5f266510da@lunn.ch>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <be36ecb8-8bd7-4756-927e-fa5f266510da@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2dw2gS6QUg8AWgRyYjJ25oQg8Luqo6Nx
X-Proofpoint-ORIG-GUID: 2dw2gS6QUg8AWgRyYjJ25oQg8Luqo6Nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_08,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=596 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170075



On 11/17/2023 1:12 AM, Andrew Lunn wrote:
> On Thu, Nov 16, 2023 at 06:47:08PM +0800, Jie Luo wrote:
>>
>>
>> On 11/16/2023 12:20 AM, Andrew Lunn wrote:
>>> On Wed, Nov 15, 2023 at 11:25:14AM +0800, Luo Jie wrote:
>>>> The PHY & PCS clocks need to be enabled and the reset
>>>> sequence needs to be completed to make qca8084 PHY
>>>> probeable by MDIO bus.
>>>
>>> Is all this guaranteed to be the same between different boards? Can
>>> the board be wired differently and need a different configuration?
>>>
>>>       Andrew
>>
>> Hi Andrew,
>> This configuration sequence is specified to the qca8084 chip,
>> not related with the platform(such as ipq5332).
>>
>> All these configured registers are located in qca8084 chip, we need
>> to complete these configurations to make MDIO bus being able to
>> scan the qca8084 PHY(PHY registers can be accessed).
> 
> So nothing here has anything to do with the actual PHYs on the bus?
> The only clock exposed here is MDC, and that runs at the standard
> 2.5MHz? All the clock tree configuration is completely internal to the
> SOC?
> 
> What we don't want is some hard coded configuration which only works
> for one specific reference design.
> 
> 	Andrew

These configured registers are related with PHYs, which is located in
the qca8084 PHY chip, qca8084 PHY chip includes the GCC register that
is not from the SOC(ipq5332), is a internal part of qca8084 PHY.

qca8084 PHY works on 6.25MHZ and other clock rates below 6.25MHZ.

will move these clock configurations using the clock APIs into the PHY
probe function in the next patch set, since it is the internal configs
of qca8084 PHY.

