Return-Path: <linux-arm-msm+bounces-47501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D68BA30001
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 02:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043AA3A3CF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 01:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD39194141;
	Tue, 11 Feb 2025 01:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NC6uAbMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918C0158538;
	Tue, 11 Feb 2025 01:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236875; cv=none; b=qkYjHFraI8ZZoQC02H/1+puSVDCeQXL67VLVC4wBsvQsVBx3G9X9eE7p2TRzbqc/8AcMWdopZnH+mpaexGL3dTdTPge22KCBtGWeqH8xYPj+roYVcVjGd8bfbbSf2b3wiYgHj8m71Fk/b56w59YJUWKCbFnqI8E3K3SXurqi7R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236875; c=relaxed/simple;
	bh=iURoQpV90d9Rs//Ogmq+bSJCz4CRlpfHqq0YxSnxuec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hWEwAP9qZWLbvZemsEp31QK9z6i9QMvN4bhIgPHqOCUsel5Ok6AgnEB0bsoYf1iEth445knH8bglo7nr8mU6+/LZll9dpFcC5fMH8gTSbpUPMUStjstFTx/W0j7BYa93gw7I7HR2eb0zG5m5wxe/J3Z03BEkknLrFUv2ogKzD5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NC6uAbMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AKuNiO031300;
	Tue, 11 Feb 2025 01:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lgxx79rg+zY8ZhEl6UOYRyZEbwvUp3kyXUYU+30FnDM=; b=NC6uAbMK2VkWajXR
	578zpcNbOhxTXpIOOQ/5c9+i54PQ3KlmV8F1EVNixJdcfzn0kDkPJGMqzYU+hwpP
	7q+V0vSXWqEETvQqkI93bNb7pkC7ANgorZ6FF6tis8nqy/4H8JksO+n3JdPbAVu8
	rtr59FceO3umtR+JW7GVATGyFuy0MyJ4i1hBoTg6B4d1fVKhAHqbcJSZsf1HdG57
	wQPT4JLakhExqrBYZKlo+LvE0HjlwnjB57fZN8ShVBTTPlRa4apPGf43hJbkd/zh
	R4BMbKnHe10PWMZLrXJIt1s1eGWwr9Gms1vAPXJiAjXeEN/RRaTNDfLRvz1niPkm
	JdIkgg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0ese5cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 01:20:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B1KTEG030819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 01:20:29 GMT
Received: from [10.253.11.86] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 17:20:23 -0800
Message-ID: <80762356-f827-4a78-9ccf-dbe644248667@quicinc.com>
Date: Tue, 11 Feb 2025 09:20:18 +0800
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
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
 <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JmCXu3hZE9gZMZDOFI493sN8LmLBXd38
X-Proofpoint-ORIG-GUID: JmCXu3hZE9gZMZDOFI493sN8LmLBXd38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110005



On 2025-02-11 02:01, Konrad Dybcio wrote:
> On 10.02.2025 4:09 AM, Yijie Yang wrote:
>>
>>
>> On 2025-01-27 18:49, Konrad Dybcio wrote:
>>> On 22.01.2025 10:48 AM, Krzysztof Kozlowski wrote:
>>>> On 22/01/2025 09:56, Yijie Yang wrote:
>>>>>
>>>>>
>>>>> On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
>>>>>> On 21/01/2025 08:54, Yijie Yang wrote:
>>>>>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>>>>>> the PHY, which is completely opposite to the suggestion of the Linux
>>>>>>> kernel.
>>>>>>
>>>>>>
>>>>>> How does the Linux kernel suggest it?
>>>>>>
>>>>>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>>>>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>>>>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>>>>>> the definition.
>>>>>>> To address the ABI compatibility issue between the kernel and DTS caused by
>>>>>>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>>>>>>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>>>>>>> phy-mode.
>>>>>>>
>>>>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>>> ---
>>>>>>>     .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>>>>>>     1 file changed, 13 insertions(+), 5 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>>>>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>>>>>>     static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>>>>>>     {
>>>>>>>         struct device *dev = &ethqos->pdev->dev;
>>>>>>> -    int phase_shift;
>>>>>>> +    int phase_shift = 0;
>>>>>>>         int loopback;
>>>>>>>            /* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>>>>>>> -    if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>>>>>>> -        ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>>>>>>> -        phase_shift = 0;
>>>>>>> -    else
>>>>>>> +    if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>>>>>>             phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>>>>>>            /* Disable loopback mode */
>>>>>>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>>>>         ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>>>>         if (ret)
>>>>>>>             return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>>>>> +
>>>>>>> +    root = of_find_node_by_path("/");
>>>>>>> +    if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
>>>>>>
>>>>>>
>>>>>> First, just check if machine is compatible, don't open code it.
>>>>>>
>>>>>> Second, drivers should really, really not rely on the machine. I don't
>>>>>> think how this resolves ABI break for other users at all.
>>>>>
>>>>> As detailed in the commit description, some boards mistakenly use the
>>>>> 'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and
>>>>
>>>> That's a kind of an ABI now, assuming it worked fine.
>>>
>>> I'm inclined to think it's better to drop compatibility given we're talking
>>> about rather obscure boards here.
>>>
>>> $ rg 'mode.*=.*"rgmii"' arch/arm64/boot/dts/qcom -l
>>>
>>> arch/arm64/boot/dts/qcom/sa8155p-adp.dts
>>> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
>>>
>>> QCS404 seems to have zero interest from anyone (and has been considered
>>> for removal upstream..).
>>>
>>> The ADP doesn't see much traction either, last time around someone found
>>> a boot breaking issue months after it was committed.
>>
>> But what about the out-of-tree boards that Andrew mentioned? We need to ensure we don't break them, right?
> 
> No. What's not on the list, doesn't exist

Okay, I understand.

> 
> Konrad

-- 
Best Regards,
Yijie


