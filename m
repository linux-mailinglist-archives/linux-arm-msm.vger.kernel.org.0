Return-Path: <linux-arm-msm+bounces-44342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079EA0582F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 11:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360F916571B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 10:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9F51F8686;
	Wed,  8 Jan 2025 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HYxfjrgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDDA1F0E33;
	Wed,  8 Jan 2025 10:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736332452; cv=none; b=eEexqWMFYrhB7B8qJ+UtAG4QoXRTsBPHjDru5ioJ/j23K2Et24a/DXfO30hU8tXgDUiBr1guvhsZPtfECbbU/JDvfDg9fYw/zAj/by8mVwvSE7Hq6X7dz87+Hf1N0IcMVg2W+dLg48xYVR65syKcG1Ia0/HrCffyXC5lYVL8xww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736332452; c=relaxed/simple;
	bh=QqRkCrwAsLtdCDlwu2XazVGiReDLd7w5pFcT+11cgLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TufK0DL/rtw03CKoIq4SOHXzT7JB2TWZiaZBQWktyTxVagUaDEQqlbc1kU7YWczjhY6pfIWMNkFrrgi7VhjU5oyLamWWriSSNMzk8Gs5N5cy+2fQSCct8lu30kAg0cyrFZNtKw4DE8+o/CK1GNe7oSsoDEPPB5dgycmosSPMoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HYxfjrgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50891kAI017545;
	Wed, 8 Jan 2025 10:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kG9qrZwpk0ax9wVZjX4lH5f2FuZkvP3RDUkvgXroGJE=; b=HYxfjrgJ53l3ReJf
	83QupBRRBi9lFGStxCv48jdTqmaLVDO7plLyE7a0l1g3klx+YKh/wtKBlgPZbVIE
	u1AYjZHz3PWyTIBTMPaEpjcN5stwNnx2G6PzqhkY/kmrcYK0eKWo+TM7emLSpHoB
	TOl/vjA3W8ee2Rlojv8TO8qc9+03ldBS7cQD5Ogr+nY1x+JBfZJUt3xIHgfk4ewb
	t4UvZvn1RD9Lwl5GgMjdAway7LHEqqqwoFcKG3SlIv3jctt/m+ZvlOAnfpb5b/YG
	+LiBQTuIUqtnG25apStMHbkNGOZRvwSJGIqngP6a1Io7N53HpOvtKydUI3yDk7/X
	iva6/Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441hx8gx0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:33:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508AXkWw001823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 10:33:46 GMT
Received: from [10.253.35.161] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 02:33:39 -0800
Message-ID: <e2625cfd-128c-4b56-a1c5-c0256db5c486@quicinc.com>
Date: Wed, 8 Jan 2025 18:33:36 +0800
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
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <df1e2fbd-7fae-4910-9908-10fdb78e4299@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V64a_pnh8TcazOpIFs5G79f_apEyOLVY
X-Proofpoint-ORIG-GUID: V64a_pnh8TcazOpIFs5G79f_apEyOLVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080085



On 2024-12-27 15:03, Krzysztof Kozlowski wrote:
> On 26/12/2024 03:29, Yijie Yang wrote:
>>
>>
>> On 2024-12-25 19:37, Krzysztof Kozlowski wrote:
>>> On 25/12/2024 11:04, Yijie Yang wrote:
>>>
>>>>    static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>    {
>>>> -	struct device_node *np = pdev->dev.of_node;
>>>> +	struct device_node *np = pdev->dev.of_node, *root;
>>>>    	const struct ethqos_emac_driver_data *data;
>>>>    	struct plat_stmmacenet_data *plat_dat;
>>>>    	struct stmmac_resources stmmac_res;
>>>> @@ -810,6 +805,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>    	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>    	if (ret)
>>>>    		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>> +
>>>> +	root = of_find_node_by_path("/");
>>>> +	if (root && of_device_is_compatible(root, "qcom,sa8540p-ride"))
>>>
>>>
>>> Nope, your drivers are not supposed to poke root compatibles. Drop and
>>> fix your driver to behave correctly for all existing devices.
>>>
>>
>> Since this change introduces a new flag in the DTS, we must maintain ABI
>> compatibility with the kernel. The new flag is specific to the board, so
> 
> It's not, I don't see it specific to the board in the bindings.

I'm sorry for the confusion. This feature is not board-specific but 
rather a tunable option. All RGMII boards can choose whether to enable 
this bit in the DTS, so there are no restrictions in the binding.

> 
>> I need to ensure root nodes are matched to allow older boards to
>> continue functioning as before. I'm happy to adopt that approach if
>> there are any more elegant solutions.
> 
> I don't think you understood the problem. Why you are not handling this
> for my board, sa8775p-rideX and sa8225-pre-ride-yellow-shrimp?
> 

This feature is specifically for RGMII boards. The driver won't enable 
this bit if the DTS doesn't specify it. To handle compatibility, we need 
to identify legacy RGMII boards with MAC versions greater or equal to 3 
which require this bit to be enabled.
According to my knowledge, the SA8775P is of the SGMII type.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


