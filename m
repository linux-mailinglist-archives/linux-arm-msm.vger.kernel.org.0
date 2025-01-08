Return-Path: <linux-arm-msm+bounces-44336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EA0A05736
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 10:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D134C7A174F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 09:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3781D932F;
	Wed,  8 Jan 2025 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HgmGUnVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F1156F3F;
	Wed,  8 Jan 2025 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329388; cv=none; b=cSbmriW6tpOI/QFapnk6Xd6GqBexwMEP+3nCgF9QJkPyX8jSm70zczC8+BMR4LXitUQs8AWaRqO0rIiqnEEtW+f+ZsdWbyK5xdozCBb2xv53x2GMsioE6odfggCQ9TbXjdW796gVBp/wUcdcg8Z+cTTOGynwb6niP1V5z85lydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329388; c=relaxed/simple;
	bh=27Wi/ioyqkeBKgglqlzrOBuNeT/IA7PHZ6rndp8yNpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JAdx3RjwSjG/qfCqsKZOZxiGFXgtqrvWUzYb7u8DNzZAzF8BGnfplgEk408pijdjg5lB+ETJmlkI/L9gmw9BlXtET5CsVWsAbkLW7ZhzG0MzDTNe16VIimWdq8tmUt2AAJ7tyYLBzuPDIut+nTm9jTwIibY6+718+cP1lnEmPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HgmGUnVr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089AvcF010610;
	Wed, 8 Jan 2025 09:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jP2UVcYe43DrsnUl3Ch2ueDEccTyGDvlbJ9rlGh+p0I=; b=HgmGUnVr2aATS1Me
	r+hwiVOHh7VfpTzPu1IuBNkweTByuEqtIMlIhVSiOEK/K2wRAdXaj7JOlT+dCj04
	DNRcXixb+0Cya1PR9X1SSiPh2J354trIauOE6f02hZ7/GSfM08BSpa5oBkx2ArJJ
	bUAnBTXc/f6siB6UAiTUyoQgsdvA8lXG0GxMxM7+xABCPX7rAo2VcwOPlj/Yg1CI
	Uqkg+vZXAUZ6jrbrMawPQKZ0C1JyCv0MWjVuaLcS2ZHYkEpf0lfBcFNbEoN3X81a
	8xFq5QvQX60QRTEmlSAWQ0v7m07WAtstKjm4T3e10sIWdcekqpBueTsQtJ0K9x+7
	UPaRyw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441pgnr2nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 09:42:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5089gjTL004331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 09:42:45 GMT
Received: from [10.253.35.161] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 01:42:39 -0800
Message-ID: <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
Date: Wed, 8 Jan 2025 17:42:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable swap
 on qcs615
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pqYADZSimNJLSAOnC9od8e9uOx41DZJZ
X-Proofpoint-ORIG-GUID: pqYADZSimNJLSAOnC9od8e9uOx41DZJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=891
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080079



On 2024-12-27 01:21, Andrew Lunn wrote:
> On Thu, Dec 26, 2024 at 10:29:45AM +0800, Yijie Yang wrote:
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
>> compatibility with the kernel. The new flag is specific to the board, so I
>> need to ensure root nodes are matched to allow older boards to continue
>> functioning as before. I'm happy to adopt that approach if there are any
>> more elegant solutions.
> 
> Why is it specific to this board? Does the board have a PHY which is
> broken and requires this property? What we are missing are the details
> needed to help you get to the correct way to solve the problem you are
> facing.
> 

Let me clarify why this bit is necessary and why it's board-specific. 
The RX programming swap bit can introduce a time delay of half a clock 
cycle. This bit, along with the clock delay adjustment functionality, is 
implemented by a module called 'IO Macro.' This is a Qualcomm-specific 
hardware design located between the MAC and PHY in the SoC, serving the 
RGMII interface. The bit works in conjunction with delay adjustment to 
meet the sampling requirements. The sampling of RX data is also handled 
by this module.

During the board design stage, the RGMII requirements may not have been 
strictly followed, leading to uncertainty in the relationship between 
the clock and data waveforms when they reach the IO Macro. This means 
the time delay introduced by the PC board may not be zero. Therefore, 
it's necessary for software developers to tune both the RX programming 
swap bit and the delay to ensure correct sampling.

> 	Andrew
> 

-- 
Best Regards,
Yijie


