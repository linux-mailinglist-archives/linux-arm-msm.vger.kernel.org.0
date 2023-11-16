Return-Path: <linux-arm-msm+bounces-789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE87EDF97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 12:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13AC31C209B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94A92E3F8;
	Thu, 16 Nov 2023 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jPxP44vK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF8E85;
	Thu, 16 Nov 2023 03:23:12 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG6hiYN025701;
	Thu, 16 Nov 2023 11:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nr7dVnii8tMkDoOj1gx+T8Uy5PROirT6JN0sOHYJu5E=;
 b=jPxP44vKTpNoRR/jT9QlXvkVnjrOO97E/DgAD4fdYgOlQDXkyZ6b9+60Lvr58Vi8EMaH
 5uz68rKWuSt58gvOapsDjPniM1M9px12bzY2BDO5XXXrH+ROUd4ldZib8Y51dygkQFip
 wZnuqfyuOm4JOpDBmX03YRsJ7tF/V79V+xeafOH5JmioWztzPBiilFHg/ww1RaJnu5Zp
 GbrvtJlQCzoLN7OPYsXvKKkJMDP1w7UB8s0Qm/0tBED7Kbtmn42VFhsLYpmMlT+0nMVJ
 7/txQCMWmeItO7pLOH6JXeg41PSYousVauP5Uc1RsHxCJsb43YtOWBZK2TQXBZjFRyuf PQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ud5fhhjdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 11:22:58 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGBMv9W031965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 11:22:57 GMT
Received: from [10.253.72.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 03:22:53 -0800
Message-ID: <d5e13129-f1a8-4659-88f8-fd5891937ef0@quicinc.com>
Date: Thu, 16 Nov 2023 19:22:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] dt-bindings: net: ipq4019-mdio: Document ipq5332
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
 <20231115032515.4249-10-quic_luoj@quicinc.com>
 <bff45329-ee11-4507-b853-0a2f2cbbe742@lunn.ch>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <bff45329-ee11-4507-b853-0a2f2cbbe742@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s4-Aj3N3nWuixEIPrJ8b5ABLNof7K7e9
X-Proofpoint-ORIG-GUID: s4-Aj3N3nWuixEIPrJ8b5ABLNof7K7e9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=678
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160091



On 11/15/2023 10:35 PM, Andrew Lunn wrote:
>> +  phy-reset-gpio:
>> +    minItems: 1
>> +    maxItems: 3
>> +    description:
>> +      GPIO used to reset the PHY, each GPIO is for resetting the connected
>> +      ethernet PHY device.
> 
> This is a PHY property, so should be in the PHY node. phylib should
> then take care of fit.

will check this and update in the next patch set.

> 
>> +
>> +  phyaddr-fixup:
>> +    description: Register address for programing MDIO address of PHY devices
> 
> Please give a better description of this and the next two properties.

these fixup flags are for customizing the MDIO address of qca8084 PHY &
PCS and doing the initialization configurations to bring up PHY.

will describe it more detail in the next patch set.

> 
>> +
>> +  pcsaddr-fixup:
>> +    description: Register address for programing MDIO address of PCS devices
>> +
>> +  mdio-clk-fixup:
>> +    description: The initialization clocks to be configured
>> +
>> +  fixup:
>> +    description: The MDIO address of PHY/PCS device to be programed
>> +        clocks:
>> +          items:
>> +            - description: MDIO clock source frequency fixed to 100MHZ
>> +            - description: UNIPHY0 AHB clock source frequency fixed to 100MHZ
>> +            - description: UNIPHY0 SYS clock source frequency fixed to 24MHZ
>> +            - description: UNIPHY1 AHB clock source frequency fixed to 100MHZ
>> +            - description: UNIPHY1 SYS clock source frequency fixed to 24MHZ
> 
> The clock frequencies is not relevent here, the driver sets that up.

OK, will remove the clock frequency values in the next patch set.

> 
>      Andrew

