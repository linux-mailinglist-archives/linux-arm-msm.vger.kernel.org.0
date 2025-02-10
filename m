Return-Path: <linux-arm-msm+bounces-47462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49905A2F642
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F92A1884576
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD26925B66C;
	Mon, 10 Feb 2025 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLJQE7ms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387D325B663
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210472; cv=none; b=s2t1Os+ZKoMiGQ0ZjR2ufR8OQxJMfluIA/9SnjejT6FtwUDUhLLoRMyL38gfRKe3eHQ55Y9qf27YqgS7yk6onCfTVEaDZMMhYi+6HFVgB6zXPbUsPdeHBzzht+8isVLmSg7xmw2NiBnGDTszYIAxmD/M60zbgyaaZmuEj/JOjYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210472; c=relaxed/simple;
	bh=bXKPEZV4wENG737JGPA+HkpmUFoh6MHiuktEhTC6J9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPA0r2r5gL5gMib0f2IccYkBng6s+oCJbOPJwV8QrDPCOKxUKAKs6sO+kWj7VZdqoIBNKT80S5i0gn4fcqb8ZhQeDMarz/gjeU8XKiyWhW13t2YKxa1h8rehMS2fMUTTI1BP6i4v2CfyAsosBAGsn+FvkG3AopVN4QuiuPJlAhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLJQE7ms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9VodJ008261
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRIgquMblxmiFtLWE8uSlg81ZeJdWHIECgta1ooGHZE=; b=FLJQE7msxiBv8Q2e
	4t0V7pAIGLQlOUGGIjezyRn6OOlV+w4kLff7G3L8ZGX8rXTcXLdtL1TR//N1n2R0
	RpdnZD6WhU+UkqjL+zw6qbvllZ0vZnsZ/VD9AwWjShj0quKK6MncNf8tqECZ4Gjl
	ebG6NURd4oveqz0xbJlPiFv+K23YlJRRDZgS4EzEXIbV8zCpjkW7A4RKFoV4+yay
	j8vN8dT3ZVzDPDDmygbIzb8nU0A7laM7V6IcGdbURUfM0BUZq7ja9v6Kpjv+jXkt
	9DDR+Vv9zxfPUEW4WY5J2ObSXNISHdofzxfR6oJZ+bcmj4RYb+VtsZGzKu/gibVJ
	R3ic4w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh1cud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:01:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e456cecdddso1318576d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 10:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210469; x=1739815269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRIgquMblxmiFtLWE8uSlg81ZeJdWHIECgta1ooGHZE=;
        b=AzlCimDjRKqTbklpEvaefSRdcJq9oGhDoszUFSqqifqjML1vgnGQX8RzhjoX8Ru713
         Ye94vr1ZEyKyhnaR9DYsqzorqLDnuSUsWk9C9J8kR0LFpvFuTucjuLSQ4k2728niEJtH
         /7lF5MPhC1C54svkb9MNqWZMDYaocXVTSbR3qsUld1Fs53lWGaXSeLdCEODz8dH99QlI
         lyD2uP3PiHP9OngA2sGElsfN5kWfkshCGhrV+VcBRrcLSN+kySwyE9WZJeEPmrUAGy3K
         rcINUnpPYgWwOKNJ12EDXQvMI+Q8GiXfKg8jSMOT0TBSzb3PDovd8xhVFyePTIt/tjog
         JkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6mvljjBD9SeeR7eq+sTp3VdeCEKST8GMVPT7hIxOc6w3U6k7BDuXBpKXlRCFEvwnxUgBe3psmlXWC//jC@vger.kernel.org
X-Gm-Message-State: AOJu0YweQ93XbtLfDdBzjYjMyKDJPgpSWEiyLzq1V5ugXuCEqItGpTnM
	xOes0CrpYo8XM02pn3lrryJ3mN8/Xy7Tfw+gSnwUX9Zk1vVDAFxQ0RDKtvxv2Va1LpGAG5BiGvp
	iWVXerRt+ZnHlaWMqy1kQAo7rUkP0tUTqYYAOSeOHw4jFwVqdRsJ527Kydt7FTx3m
X-Gm-Gg: ASbGnctQvroWyqfbXyb+ViXHSRNHZsaLMJcBqcl5sncE3kTfgWoH34fUhyY22HgCPTk
	P4XDxtJsKqJRDeqsFLoNWANZGR0/9z6ZxcQ8+UP+T6g+kv+rfkTL+Wa4WfF2IhYH3HjmnpG1D1A
	rjbIWMtFRedhQkAsiYKcLe4lpyatSq2Sxowdk0pjuPX7qNQC6Wpc92qfr61Tie3pA78fdisvnr2
	SPSwA4W+FegvAMqVrD7XaRocSkQDx0afZ2GSv+TStZWF10Yv4DKnKxd8hyjvEjKOlR3LReBeCwU
	SIw5msGdfHfgCt/P6XQRIWFYHLBXeP6l4IaIxhGC0KLANxlQ+kSB3aX7K1Y=
X-Received: by 2002:ac8:57d1:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-47167b066cbmr77016781cf.14.1739210469200;
        Mon, 10 Feb 2025 10:01:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjNHMrPdlFQI52pflImfeJmycM/6sYmtEApuonTlMDTKaYLqKa6DC/5hsEpJ2wVSAK4BNHWA==
X-Received: by 2002:ac8:57d1:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-47167b066cbmr77016271cf.14.1739210468350;
        Mon, 10 Feb 2025 10:01:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b77d58bdsm351070566b.130.2025.02.10.10.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:01:07 -0800 (PST)
Message-ID: <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:01:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f6crKXcTxHFDc-ZPR9uPK2JiYRLvXn9H
X-Proofpoint-GUID: f6crKXcTxHFDc-ZPR9uPK2JiYRLvXn9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100147

On 10.02.2025 4:09 AM, Yijie Yang wrote:
> 
> 
> On 2025-01-27 18:49, Konrad Dybcio wrote:
>> On 22.01.2025 10:48 AM, Krzysztof Kozlowski wrote:
>>> On 22/01/2025 09:56, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
>>>>> On 21/01/2025 08:54, Yijie Yang wrote:
>>>>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>>>>> the PHY, which is completely opposite to the suggestion of the Linux
>>>>>> kernel.
>>>>>
>>>>>
>>>>> How does the Linux kernel suggest it?
>>>>>
>>>>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>>>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>>>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>>>>> the definition.
>>>>>> To address the ABI compatibility issue between the kernel and DTS caused by
>>>>>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>>>>>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>>>>>> phy-mode.
>>>>>>
>>>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>> ---
>>>>>>    .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>>>>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>>>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>>>>>    static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>>>>>    {
>>>>>>        struct device *dev = &ethqos->pdev->dev;
>>>>>> -    int phase_shift;
>>>>>> +    int phase_shift = 0;
>>>>>>        int loopback;
>>>>>>           /* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>>>>>> -    if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>>>>>> -        ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>>>>>> -        phase_shift = 0;
>>>>>> -    else
>>>>>> +    if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>>>>>            phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>>>>>           /* Disable loopback mode */
>>>>>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>>>        ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>>>        if (ret)
>>>>>>            return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>>>> +
>>>>>> +    root = of_find_node_by_path("/");
>>>>>> +    if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
>>>>>
>>>>>
>>>>> First, just check if machine is compatible, don't open code it.
>>>>>
>>>>> Second, drivers should really, really not rely on the machine. I don't
>>>>> think how this resolves ABI break for other users at all.
>>>>
>>>> As detailed in the commit description, some boards mistakenly use the
>>>> 'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and
>>>
>>> That's a kind of an ABI now, assuming it worked fine.
>>
>> I'm inclined to think it's better to drop compatibility given we're talking
>> about rather obscure boards here.
>>
>> $ rg 'mode.*=.*"rgmii"' arch/arm64/boot/dts/qcom -l
>>
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dts
>> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
>>
>> QCS404 seems to have zero interest from anyone (and has been considered
>> for removal upstream..).
>>
>> The ADP doesn't see much traction either, last time around someone found
>> a boot breaking issue months after it was committed.
> 
> But what about the out-of-tree boards that Andrew mentioned? We need to ensure we don't break them, right?

No. What's not on the list, doesn't exist

Konrad

