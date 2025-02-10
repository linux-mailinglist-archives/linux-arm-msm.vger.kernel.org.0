Return-Path: <linux-arm-msm+bounces-47343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17D0A2E284
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 04:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005F41884342
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 03:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D031550276;
	Mon, 10 Feb 2025 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XINvUSvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A146B8;
	Mon, 10 Feb 2025 03:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739156999; cv=none; b=njLpNt/pR18IhnPA57lPD9me9mwN17lN4LiTmihUngpwt+hrOVHvgK1egAIzl84X+taHa4jt+RbqIyl1ruV7rrS4sjDBQ9Km+nobjC9F3DqPrG3XdwLtj5bNYuuqfPoOrIniNOWyVwiqL6SK2kPRbN4myox7111g2Bo2s14tsSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739156999; c=relaxed/simple;
	bh=vvVdz5hbQ96exbeAjzH3VgoKZdEKBHSULsJvPrZH1PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kgJnChLe1yAO5+Oo/XhjBBdg0E0tU+nW/xwK/h+NE9EBNjs7pB1xarsDZQz4nGWp6uoqNeGPAGnjGPUI/BsHG78sCSJ00/CGAM/qfEGpSb6ogalXGIGRiRbA4KNhYqFMhvyxb7bo8BnuU6j6t7gCT/YNRBeSFZ8GPQd0L/djGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XINvUSvz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519KIPgQ009545;
	Mon, 10 Feb 2025 03:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pyxopfq01qIFG3pHou1VqDKtq+2Cvr5wueyIRGqt7Nw=; b=XINvUSvzgJINdMlV
	8MUc1ugbYkxE+OkqobWw7X0IY806Ad3nvtCe0i8+bPU3s3HnX2x0pMmftUZRRE87
	oEQJQAsIBJzJzwyirzGeXa2hVQe0Lf3hSmv+tTVjFLzFbaI8qRKRYJN9A2ghyNdC
	rtpGHS1oLm+Y1UVahpR9DRxf9ysdYxDrN0/uLhlUt8TKQxPPGQmnuWdJByZz9e4B
	8I1iBD+u1RkMxFOOrbxD9jhqsU8kp4jMsjUm4E6WVH56U8ptCywcWhUh+53zS9LT
	MctaJhefa3fNWzcr2O3d4MIvWQgwX5PSxumJ4SH8TuXm8N3RihtxBjQGkQyeq8zq
	+ajfww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0f72x6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 03:09:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A39XJv013735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 03:09:33 GMT
Received: from [10.253.11.86] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Feb 2025
 19:09:23 -0800
Message-ID: <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
Date: Mon, 10 Feb 2025 11:09:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9UFZc4nDbCM3vzlrXRaDfvajb5-5fsgx
X-Proofpoint-ORIG-GUID: 9UFZc4nDbCM3vzlrXRaDfvajb5-5fsgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100023



On 2025-01-27 18:49, Konrad Dybcio wrote:
> On 22.01.2025 10:48 AM, Krzysztof Kozlowski wrote:
>> On 22/01/2025 09:56, Yijie Yang wrote:
>>>
>>>
>>> On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
>>>> On 21/01/2025 08:54, Yijie Yang wrote:
>>>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>>>> the PHY, which is completely opposite to the suggestion of the Linux
>>>>> kernel.
>>>>
>>>>
>>>> How does the Linux kernel suggest it?
>>>>
>>>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>>>> the definition.
>>>>> To address the ABI compatibility issue between the kernel and DTS caused by
>>>>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>>>>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>>>>> phy-mode.
>>>>>
>>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>> ---
>>>>>    .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>>>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>>>>    static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>>>>    {
>>>>>    	struct device *dev = &ethqos->pdev->dev;
>>>>> -	int phase_shift;
>>>>> +	int phase_shift = 0;
>>>>>    	int loopback;
>>>>>    
>>>>>    	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>>>>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>>>>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>>>>> -		phase_shift = 0;
>>>>> -	else
>>>>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>>>>    		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>>>>    
>>>>>    	/* Disable loopback mode */
>>>>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>>    	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>>    	if (ret)
>>>>>    		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>>> +
>>>>> +	root = of_find_node_by_path("/");
>>>>> +	if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
>>>>
>>>>
>>>> First, just check if machine is compatible, don't open code it.
>>>>
>>>> Second, drivers should really, really not rely on the machine. I don't
>>>> think how this resolves ABI break for other users at all.
>>>
>>> As detailed in the commit description, some boards mistakenly use the
>>> 'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and
>>
>> That's a kind of an ABI now, assuming it worked fine.
> 
> I'm inclined to think it's better to drop compatibility given we're talking
> about rather obscure boards here.
> 
> $ rg 'mode.*=.*"rgmii"' arch/arm64/boot/dts/qcom -l
> 
> arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
> 
> QCS404 seems to have zero interest from anyone (and has been considered
> for removal upstream..).
> 
> The ADP doesn't see much traction either, last time around someone found
> a boot breaking issue months after it was committed.

But what about the out-of-tree boards that Andrew mentioned? We need to 
ensure we don't break them, right?

> 
> Konrad

-- 
Best Regards,
Yijie


