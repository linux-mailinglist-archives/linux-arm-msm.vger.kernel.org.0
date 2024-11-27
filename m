Return-Path: <linux-arm-msm+bounces-39249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 307EE9DA213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 07:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B2B8B21096
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 06:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F411313D61B;
	Wed, 27 Nov 2024 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hJV9E977"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCBA1448E4;
	Wed, 27 Nov 2024 06:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732688254; cv=none; b=eIBWRp1MjEcwbKvP0aT5q3Qtfrz8awlxd6u65Whz0xg/Iq7ct48SOJEEpxYiUVMHs924u5DnE++FZ7ZNrSoM86WJYl+rm5OZptu8fYHi/yGHVKHrb0hP9vFxRHQL+jnt5qrEM4Efgg4b2sl+LnYI9Vnp10n2XV0lhxxkgI/Xf8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732688254; c=relaxed/simple;
	bh=Gca62i0AjdqoFCbRGDM+X6M70u9eZwv1tl4Adbr7SRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y4GVVAikt+6+8X40yAdT1V2E4u7d2poShvv0h334PO0SE2/uLBlYwXs2cNl8PdW8v5GCeYypCPoMwNM3oposG45wGsolNopyIyY7yxRjOI5MtReO3pv1yq1I1O/76ajFj6cC4420n/vH70d1RnjWJ89ZEJG6ASjc+R0DqhCjjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hJV9E977; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQLCnm5006390;
	Wed, 27 Nov 2024 06:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kJ+ah1xZyNSAIa72rUUxzocL2Mhdk9ssDqxG+1kq1E=; b=hJV9E977/ytglPTK
	BxkLCub3v0TvICdq0sATx0Id6F+IYjQflomp9CBXZH7Jpqb0imWZc9cFeZeswVLN
	LwDbOFAbvaDlKkm8faqV5Jq0+5sbNMBW+NL68qyEsvCkmSEKkG9VkON9K1IXua4C
	o6p8VfJh68hujEJwqZozWffq08fQvkjnJylDGBCOfcVHfUj9MVJWwlX1F6yBhrvT
	ckM/j7b4uXbKXzkIOIa3AzhlGCayvsC+POBiJlOd5eB59n2Sl4aTZQhj+1fRZqDI
	tdPH11vItURMVhrQuK1nW4ydUe3fJ57I8Tl5erqmqQwSrr2yd6rHAM5hgzoU8jFW
	YOH1EQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435p22s62b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 06:17:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR6HQ1o023402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 06:17:26 GMT
Received: from [10.253.38.8] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 22:17:22 -0800
Message-ID: <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
Date: Wed, 27 Nov 2024 14:17:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Andrew Lunn <andrew@lunn.ch>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HhbIFxhMMPgVhvF4t_HlqSzzqmvLcNZ8
X-Proofpoint-GUID: HhbIFxhMMPgVhvF4t_HlqSzzqmvLcNZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270051



On 2024-11-22 21:19, Andrew Lunn wrote:
>>>>>    +&ethernet {
>>>>> +    status = "okay";
>>>>> +
>>>>> +    pinctrl-0 = <&ethernet_defaults>;
>>>>> +    pinctrl-names = "default";
>>>>> +
>>>>> +    phy-handle = <&rgmii_phy>;
>>>>> +    phy-mode = "rgmii";
>>>>
>>>> That is unusual. Does the board have extra long clock lines?
>>>
>>> Do you mean to imply that using RGMII mode is unusual? While the EMAC controller supports various modes, due to hardware design limitations, only RGMII mode can be effectively implemented.
>>
>> Is that a board-specific issue, or something that concerns the SoC itself?
> 
> Lots of developers gets this wrong.... Searching the mainline list for
> patchs getting it wrong and the explanation i have given in the past
> might help.
> 
> The usual setting here is 'rgmmii-id', which means something needs to
> insert a 2ns delay on the clock lines. This is not always true, a very
> small number of boards use extra long clock likes on the PCB to add
> the needed 2ns delay.
> 
> Now, if 'rgmii' does work, it means something else is broken
> somewhere. I will let you find out what.

The 'rgmii' does function correctly, but it does not necessarily mean 
that a time delay is required at the board level. The EPHY can also 
compensate for the time skew.

> 
>>>>> +    max-speed = <1000>;
>>>>
>>>> Why do you have this property? It is normally used to slow the MAC
>>>> down because of issues at higher speeds.
>>>
>>> According to the databoot, the EMAC in RGMII mode can support speeds of up to 1Gbps.
>>
>> I believe the question Andrew is asking is "how is that effectively
>> different from the default setting (omitting the property)?"
> 
> Correct. If there are no issues at higher speeds, you don't need
> this. phylib will ask the PHY what it is capable of, and limit the
> negotiated speeds to its capabilities. Occasionally you do see an
> RGMII PHY connected to a MII MAC, because a RGMII PHY is cheaper...
> 
> 	Andrew

It does unnecessary, I will remove it.

-- 
Best Regards,
Yijie


