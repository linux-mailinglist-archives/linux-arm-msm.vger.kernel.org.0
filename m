Return-Path: <linux-arm-msm+bounces-44949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77474A0FE4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 02:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83E0216892D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 01:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA22C1FA147;
	Tue, 14 Jan 2025 01:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YgQLqRFB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC241EB2E;
	Tue, 14 Jan 2025 01:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736819543; cv=none; b=CKhHIAFWt8J9x6KgZ+lxrnye7YCCCtMYkS+WGvJz9OlxHyUmF1nWHPHzlraw/weU8rMwo39hh8Usu/S7t4/ihHwMFzF6HDiicbxeLOD9yN7tsSZWHEGdlxcjdvYUnH0wujcmwOYo2MsYKji57fJxpu+1CKUSNIQsM789nd8Z9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736819543; c=relaxed/simple;
	bh=3CCevYT+/bbbRH5gglOO94RRhrdLIoEsNiEuUDoFDAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R07i+zL5idq22VAHSNpyp6+w6Y4ZXIMCL6YyKZclBuFBNzpfJQmhBSLjUZS0HedppWigyuehJk7dNcUscs7Vzq0YcuvWBpE+mmzuSnVmATXDl4hhCJs+jKaBOtwqbpcpH1P341Eebmr9hWEM3UB0X26EeBmhmiz13vifYfWKjmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YgQLqRFB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DErXaX021602;
	Tue, 14 Jan 2025 01:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpVAiiC29GD6GRICsgtfevCjVsE+CyffzHyHWhR0W2E=; b=YgQLqRFBKBU/UvMR
	HvFLlqkfO8mSF+2Vj73niBQAo3BqnVEsSIsOFdFNgL9mYHC8yZhp6q+zjyvYV3xs
	fvn50iJOmg7nd8OZR94if+ESUwoh0qFzQ3M/DyXeCtDmf7ijz9FJYIIviNcPP97H
	B1+3XT4cJVtMVFI3VHqpefIr9iV6KmWc/+LxAvR1wSuDXKkrytaKBjrOI+d13/VZ
	xmJ4yWuJm/EYXzEKBjHeakpbY8GJCWCGPv5ixlhzkGKOwnIqtB/wMnlGSlo71LaW
	I7gGAmLwc3E9+h9w9mR+thv7WuC/tRmjQfjHT/UbZ1gPmJy5Gu9/bTlBZCaewQi9
	9gaHyA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44550ahcv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 01:52:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E1q1lx005840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 01:52:01 GMT
Received: from [10.253.75.207] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 17:51:46 -0800
Message-ID: <482e62d3-d1c6-460d-8371-9c46f0ff09bf@quicinc.com>
Date: Tue, 14 Jan 2025 09:51:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable swap
 on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <df1e2fbd-7fae-4910-9908-10fdb78e4299@kernel.org>
 <e2625cfd-128c-4b56-a1c5-c0256db5c486@quicinc.com>
 <0d2ebb1c-be69-45ca-8a66-4e4a8ca59513@kernel.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <0d2ebb1c-be69-45ca-8a66-4e4a8ca59513@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: baoGFiavzHlsv08ViAduGfEuLlVpWf_s
X-Proofpoint-GUID: baoGFiavzHlsv08ViAduGfEuLlVpWf_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140013



On 2025-01-13 19:26, Krzysztof Kozlowski wrote:
> On 08/01/2025 11:33, Yijie Yang wrote:
>>
>>
>> On 2024-12-27 15:03, Krzysztof Kozlowski wrote:
>>> On 26/12/2024 03:29, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2024-12-25 19:37, Krzysztof Kozlowski wrote:
>>>>> On 25/12/2024 11:04, Yijie Yang wrote:
>>>>>
>>>>>>     static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>>>     {
>>>>>> -	struct device_node *np = pdev->dev.of_node;
>>>>>> +	struct device_node *np = pdev->dev.of_node, *root;
>>>>>>     	const struct ethqos_emac_driver_data *data;
>>>>>>     	struct plat_stmmacenet_data *plat_dat;
>>>>>>     	struct stmmac_resources stmmac_res;
>>>>>> @@ -810,6 +805,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>>>     	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>>>     	if (ret)
>>>>>>     		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>>>> +
>>>>>> +	root = of_find_node_by_path("/");
>>>>>> +	if (root && of_device_is_compatible(root, "qcom,sa8540p-ride"))
>>>>>
>>>>>
>>>>> Nope, your drivers are not supposed to poke root compatibles. Drop and
>>>>> fix your driver to behave correctly for all existing devices.
>>>>>
>>>>
>>>> Since this change introduces a new flag in the DTS, we must maintain ABI
>>>> compatibility with the kernel. The new flag is specific to the board, so
>>>
>>> It's not, I don't see it specific to the board in the bindings.
>>
>> I'm sorry for the confusion. This feature is not board-specific but
>> rather a tunable option. All RGMII boards can choose whether to enable
>> this bit in the DTS, so there are no restrictions in the binding.
> 
> If it is not specific to the board, I don't see why this cannot be
> implied by compatible.
> 

Whether this bit should be enabled should be determined on a per-board 
basis, but it should be available for all RGMII-type boards. It should 
be left to the users to decide whether to enable this bit in the DTS 
file, rather than controlling its existence in the binding file, 
shouldn't it?

>>
>>>
>>>> I need to ensure root nodes are matched to allow older boards to
>>>> continue functioning as before. I'm happy to adopt that approach if
>>>> there are any more elegant solutions.
>>>
>>> I don't think you understood the problem. Why you are not handling this
>>> for my board, sa8775p-rideX and sa8225-pre-ride-yellow-shrimp?
>>>
>>
>> This feature is specifically for RGMII boards. The driver won't enable
> 
> So board specific?

It is 'phy-mode' specific, to be more precise.

> 
>> this bit if the DTS doesn't specify it. To handle compatibility, we need
> 
> Do not describe us how drivers and DTS work. We all know.

Sure, I will take care of it.

> 
>> to identify legacy RGMII boards with MAC versions greater or equal to 3
>> which require this bit to be enabled.
>> According to my knowledge, the SA8775P is of the SGMII type.
> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


