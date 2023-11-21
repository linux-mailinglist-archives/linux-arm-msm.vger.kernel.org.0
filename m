Return-Path: <linux-arm-msm+bounces-1329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4B7F2A63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52FC4281733
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 10:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B78046521;
	Tue, 21 Nov 2023 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jh/aqU1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D4AC1;
	Tue, 21 Nov 2023 02:29:14 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALA99hV009701;
	Tue, 21 Nov 2023 10:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=d3laBOY3VBa/FKo6wvUDPd9NbPmzQBMNTTTgijWw53Q=;
 b=Jh/aqU1YxpkX6X0hwK7EuvHYGlewXCD+1fdpk4TriHDnowU5IINaqfcd9HwXsdKLQQqG
 IzCbWXP+tj/JMd175+8ukga13e203LkF2bWcnDVYliQy2vwRyZJp/wdKjVFQ7JJnXDoY
 gEAhXTJ3Dyumsjqvf/SKdfn180tPmNj51ya1KZhE+L+sgMfe9k55gLQ4XKjTFCEhn2V5
 X068esLtEfMgD3yvrQuGkAa3p56lsnjxH8V9n/WPWOddIDg8qNDOGOiFdKUjEX1nRamF
 hrQN3QoQxrm4EORY3X74ayoE5LdOVEgI8y3Ll7xkrSvVkTffUCdzhQwvLZqwe0h+qKzB Dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugr85rcr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 10:29:01 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALAT0VN026093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 10:29:00 GMT
Received: from [10.253.72.26] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 Nov
 2023 02:28:56 -0800
Message-ID: <9acace07-d758-4d5d-8321-de75ee53355d@quicinc.com>
Date: Tue, 21 Nov 2023 18:28:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] net: mdio: ipq4019: Enable the clocks for ipq5332
 platform
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-3-quic_luoj@quicinc.com>
 <10dc0fff-fc00-4c1f-97cf-30c5e5e8f983@linaro.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <10dc0fff-fc00-4c1f-97cf-30c5e5e8f983@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YjbUSm6vdQOT78gkogteKn3mp-3fs216
X-Proofpoint-ORIG-GUID: YjbUSm6vdQOT78gkogteKn3mp-3fs216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_03,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210081



On 11/20/2023 10:22 PM, Konrad Dybcio wrote:
> On 15.11.2023 04:25, Luo Jie wrote:
>> For the platform ipq5332, the related GCC clocks need to be enabled
>> to make the GPIO reset of the MDIO slave devices taking effect.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> [...]
> 
>>   static int ipq4019_mdio_wait_busy(struct mii_bus *bus)
>> @@ -212,6 +231,38 @@ static int ipq_mdio_reset(struct mii_bus *bus)
>>   	u32 val;
>>   	int ret;
>>   
>> +	/* For the platform ipq5332, there are two uniphy available to connect the
>> +	 * ethernet devices, the uniphy gcc clock should be enabled for resetting
>> +	 * the connected device such as qca8386 switch or qca8081 PHY effectively.
>> +	 */
>> +	if (of_device_is_compatible(bus->parent->of_node, "qcom,ipq5332-mdio")) {
> Would that not also be taken care of in the phy driver?
> 
> Konrad

Hi Konrad,
These clocks are the SOC clocks that is not related to the PHY type.
no matter what kind of PHY is connected, we also need to configure
these clocks.

