Return-Path: <linux-arm-msm+bounces-46227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00FA1D4CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B329D7A2AE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538191FDE24;
	Mon, 27 Jan 2025 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGMMxiyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF581D540
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737974982; cv=none; b=L8P7935WrPsD+PinxLS+VsNE/Bqa3AQllPHbVWsC1kpREDT+XCSB8A7MpPznV8vS/mCZX4wgJOUzWx9lkHxK37YLqNCrml+YDhWvukaNUbDdxydMaihEdG31EXbg/40fYUW4Fn1jG/n/Z+KYm/bfrnDugQ6JqSddX1dUYyPmAcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737974982; c=relaxed/simple;
	bh=xM40sLL6xyjfQcLpAX6AKDWuBZKYNh3BFNPCLLBGnbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1xiKnKezOozJamYeosMs+TqJkmauFbPvG1WLjSRf2tDc3j+KkbifWOfgukcEudDF7/qfLlJk8Y1lq/fOB+Ls7/mxS9f1k4OoPdbf9P4JyQ8zi0mn7SrBvHqtF9k3kTvK0gTI0Hixyw7Y/1idqA/iezwrRrQ9y+IAzAQGNpJMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGMMxiyM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R2o4Mx031830
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adphgYyuraDm+8q9lCcomTmDXgUPSbCBsDgLoCmq7bo=; b=VGMMxiyMJDS7AYWD
	AlCnYoJbFAIFUk65rKWCAY+7bByO4bXUeaqOnoZL2bzpFvKg8vmk10CU3mC9oc3T
	ti2DZr0p2bEtLkwPTeSTdw0WFVew+jrWNZZtRL70+l2UsB5Fmpj58YOCJXsJuCuK
	bflkB/K8472Ffn8Dowr/9yAQ89BeyczFtGUYmbYZDPCE0YmqFv2m85gVCCyh2YLb
	m9MNIuKqcO/jRlymGXiaLp8E7OXR8DdfxZMUduhfzouxQEXwfni7FpXTWR2i5AuU
	nwMwxxAMVl7Nwb7cXR037lq/+ihqKo7ZJGKrHuRqbFSD8H+kLOl/RL6H53jV4B5A
	2Ui51w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dwg0s36c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:49:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679d6f9587so6558541cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974978; x=1738579778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adphgYyuraDm+8q9lCcomTmDXgUPSbCBsDgLoCmq7bo=;
        b=Ce2SaEPLpeWziojh8ARWVFEAwGeS3ygdXOfCDPN0Ag8/cIcz/sTIfXWB9jrytXNIof
         NYAwvIYSFf6JMasmNjNJwt0lJSjyG5dZgVPwVkUSG84m/nl3EQd69BfAZiubN972Yc9t
         wGsZdSga7ONJcSJLu9Pk31kJMnDi/TUuXhQYXHzcOo8t96Tf/EmDZENPbRIsrZBqJ5uA
         +DMW/5kXFQtMOCe60WLo18druuYy3NU9SowW3Jtx9n55CUKW3nzCW9gfpz9CEntddfIE
         uVMrpYC09tnvVeFeajFC/P2LlO12BpAQDvKMbEis3wCVS1mup5+uMWtsd7uAV7ePyQyp
         EaCw==
X-Forwarded-Encrypted: i=1; AJvYcCUbrblcNIcqi6KQke6IzVJ53JUZJxFib0XKsZRHe/PVGV4Afc5mXGHNr3IbiCw2FZtmC2IOSbAXrmjCJAHF@vger.kernel.org
X-Gm-Message-State: AOJu0YwAvPWZjD5nJGt9zgmQFtnR8qrcR/fiD+GzdvRqjV+bEjNuCOrO
	D9lNOwqZezV6BKZYOPUzqtyjT/k3IyORdiPvQtMDEL3cojz/fVN4vXY3Z7UngF4jdp06fcpAeZu
	eYruAVjH7i5/3yyj3aK7Vhd/HgxeipYtRaOasRkcj7aoxFhy+LtejSzo1sk5qpAwy
X-Gm-Gg: ASbGncvqD+/fN0IoprFJISUwI0IMJ47EJRZRL607+Rx+0R/JLAtRYw7IHsIpQlq2mX7
	uiWw/BRCVGKJvBdYOdXNbec+f2g2IAUKE5eIoDLrI0ZWHvITs9fhe7/4Ti8oWhBMOfWa2eiHAeT
	CPmNFNOSWCDXjpW6cysKCjUaRYBYz63O6kb/7xorD0sBNWKjn17bvDQjcFgjiZ2BUtx5i5ryvBI
	wneD774nDoSE/sK3ke2j/s6GbLAczPyz1lIH8xrR75KE1tUTnU4RVkS0scGuTPi4kvEwXZH3B54
	/CaGh4oqGd4xYtVOnxsG893r+U0tDJdD4mV1qyHJlB8JoRuTMWxnVLGwhBA=
X-Received: by 2002:a05:622a:610:b0:467:6eee:1138 with SMTP id d75a77b69052e-46e4e726f1dmr121602771cf.6.1737974978607;
        Mon, 27 Jan 2025 02:49:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdnH4J6HaLZ6tC9UeTjZWaxwVuzqp/4HLK9P8eKFWexw6YCwzdP8ffhfgKmAo0wFiSbNS1AA==
X-Received: by 2002:a05:622a:610:b0:467:6eee:1138 with SMTP id d75a77b69052e-46e4e726f1dmr121602601cf.6.1737974978120;
        Mon, 27 Jan 2025 02:49:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760b6f4bsm569985266b.90.2025.01.27.02.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:49:37 -0800 (PST)
Message-ID: <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:49:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: reTqUi_SyNPZmgHDA5l6Ut1CV15X5Jjg
X-Proofpoint-ORIG-GUID: reTqUi_SyNPZmgHDA5l6Ut1CV15X5Jjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270087

On 22.01.2025 10:48 AM, Krzysztof Kozlowski wrote:
> On 22/01/2025 09:56, Yijie Yang wrote:
>>
>>
>> On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
>>> On 21/01/2025 08:54, Yijie Yang wrote:
>>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>>> the PHY, which is completely opposite to the suggestion of the Linux
>>>> kernel.
>>>
>>>
>>> How does the Linux kernel suggest it?
>>>
>>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>>> the definition.
>>>> To address the ABI compatibility issue between the kernel and DTS caused by
>>>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>>>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>>>> phy-mode.
>>>>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>>   .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>>>   {
>>>>   	struct device *dev = &ethqos->pdev->dev;
>>>> -	int phase_shift;
>>>> +	int phase_shift = 0;
>>>>   	int loopback;
>>>>   
>>>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>>>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>>>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>>>> -		phase_shift = 0;
>>>> -	else
>>>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>>>   
>>>>   	/* Disable loopback mode */
>>>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>   	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>   	if (ret)
>>>>   		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>> +
>>>> +	root = of_find_node_by_path("/");
>>>> +	if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
>>>
>>>
>>> First, just check if machine is compatible, don't open code it.
>>>
>>> Second, drivers should really, really not rely on the machine. I don't
>>> think how this resolves ABI break for other users at all.
>>
>> As detailed in the commit description, some boards mistakenly use the 
>> 'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and 
> 
> That's a kind of an ABI now, assuming it worked fine.

I'm inclined to think it's better to drop compatibility given we're talking
about rather obscure boards here.

$ rg 'mode.*=.*"rgmii"' arch/arm64/boot/dts/qcom -l

arch/arm64/boot/dts/qcom/sa8155p-adp.dts
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts

QCS404 seems to have zero interest from anyone (and has been considered
for removal upstream..).

The ADP doesn't see much traction either, last time around someone found
a boot breaking issue months after it was committed.

Konrad

