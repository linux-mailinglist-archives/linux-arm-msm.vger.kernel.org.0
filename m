Return-Path: <linux-arm-msm+bounces-785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D507EDF4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 12:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAAC4280D15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A0E2DF67;
	Thu, 16 Nov 2023 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LJeIhkqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FED485;
	Thu, 16 Nov 2023 03:14:37 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG7fxpb001720;
	Thu, 16 Nov 2023 11:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WG+vTW6SxUmCCV/6GleBb07NZzuJmnHKZogC3uQzSVg=;
 b=LJeIhkqjABZNoBIdh0rf0XtzpcTY+tSctWQpzGB5uay0odDBIKNlQK+IUUMSJv67Cm57
 6Az1aSIQBhwr805xVqXC5lmkSfg1W7UaQYuaNT5KJenk5fikT4vQYi4dwjyhX8fJl7oT
 K5Guqj7yopy8qfM+2RrN8Ln0ekX7dATkrZ4Z+aB0WK6r3Gp9AkiFX+B9bt8Bi7WgCYe2
 q1NRFMpuWLNFZAi3wWAYE3EjWK4e6mFx0HPKh0tkyQdbuEjvqUTpDksTbc/BcWNcO+tk
 HUH8ekI9CsRyq7YJCDWFOH/PcSQHGqcqPQFfE/ylE5M4yKh1nObaPCSW4nBHrvseMbVR 7w== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udeww8e95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 11:14:23 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGBDsN2021454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 11:13:54 GMT
Received: from [10.253.72.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 03:13:50 -0800
Message-ID: <33246b49-2579-4889-9fcb-babec5003a88@quicinc.com>
Date: Thu, 16 Nov 2023 19:13:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] net: mdio: ipq4019: Enable GPIO reset for ipq5332
 platform
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
 <20231115032515.4249-4-quic_luoj@quicinc.com>
 <e740a206-37af-49b1-a6b6-baa3c99165c0@lunn.ch>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <e740a206-37af-49b1-a6b6-baa3c99165c0@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 46NsgQtgK9drv1wuiyk85wDjaDNh9j8M
X-Proofpoint-GUID: 46NsgQtgK9drv1wuiyk85wDjaDNh9j8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160090



On 11/15/2023 11:11 PM, Andrew Lunn wrote:
> On Wed, Nov 15, 2023 at 11:25:09AM +0800, Luo Jie wrote:
>> Before doing GPIO reset on the MDIO slave devices, the common clock
>> output to MDIO slave device should be enabled, and the related GCC
>> clocks also need to be configured.
>>
>> Because of these extra configurations, the MDIO bus level GPIO and
>> PHY device level GPIO can't be leveraged.
> 
> Its not clear to me why the normal reset cannot be used. The MBIO bus
> driver can probe, setup the clocks, and then register the MDIO bus to
> the core. The core can then use the GPIO resets.
> 
> What am i missing?
> 
>       Andrew

Hi Andrew,
Looks we can leverage the MDIO bus GPIO to reset qca8084 PHY, but the
mdio bus gpio only supports one GPIO number.

Here are the reasons i put the GPIO reset here.
1. Currently one MDIO bus instance only connects one qca8084 PHY as
MDIO slave device on IPQ5332 platform, since the MDIO address
occupied by qca8084. if the other type PHY also needs to use MDIO
bus GPIO reset, then we can't cover this case.

2. Before doing the GPIO reset on qca8084, we need to enable the clock
output to qca8084 by configuring eth_ldo_rdy register, and the mdio
bus->reset is called after the mdio bus level reset.

3. program the mdio address of qca8084 PHY and the initialization
configurations needed before the registers of qca8084 can be accessed.
if we take the PHY level GPIO reset for qca8084, there is no call point
to do the initialization configurations and programing PHY address in
the MDIO driver code.

i will check the feasibility of taking the PHY level GPIO reset and do
the initial configurations in the PHY probe function.

FYI, here is the sequence to bring up qca8084.
a. enable clock output to qca8084.
b. do gpio reset of qca8084.
c. customize MDIO address and initialization configurations.
d. the PHY ID can be acquired.


Thanks,
Jie.

