Return-Path: <linux-arm-msm+bounces-37453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E39C3A3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82580B20B83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 08:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCC816A930;
	Mon, 11 Nov 2024 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rdxcxwr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA13A8F7;
	Mon, 11 Nov 2024 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731315322; cv=none; b=QUtPKqAulYZbjTHqV/twDV6YXO6cpuGed7DJYbSfd/e9LyX6bkNjItawA7O8uB4nPiVWJr86nvoioyxfKH/UevWI5KjbZPz+ieOcSAAeYVVE3BsaiyzDv9PCIbz7xSqwWuXmMB56fb0NsjgdWaa+zXL67vQw4TtOBJkhbEnl2/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731315322; c=relaxed/simple;
	bh=x7IlPwxPkGmp/hr8l2CGnxFQG2qSW+jnBIMkJfPJW1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J3udxA6MVhSGxnjPBZdI5WALgCSbwTC8Cplacdn0LEGERPWMtOKXTHBx8BubVVyFzH++hKdTJwf7/YAYXa1QSJ/tW2c4TR/RColBJeFYWExGi7a7c4zFxf2biGV+UPM+KEzveTryWXuzUpX+WwiqgXYO5xFe/2pt5t1/rvrFH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rdxcxwr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAM03lV029830;
	Mon, 11 Nov 2024 08:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwncJfMNZTZgF5BtQGwSCtCg3ZfB4IiJbm4zx0JwVV4=; b=Rdxcxwr8hR6svK4M
	l8il/J9RQJzEmQhU93JkQznhdjgkiJF6KODTAhoUUSJzcAlokwUekcHt9J2HQW+u
	nANT7zQqq5dwGioZoYe5OpSRMdlPSJk/Lm2/8QXBTMydvfGeoidR89vzPsdW29Zq
	X1zZO3E4ERQeu3WYGsB0wS1MJCULtHkZYxRO7n19vYZrYn2q4CJlHltl6yBFF9TJ
	OZR1DjM+9B4MUY1yQl3VHUeSidHagAf8dlrdIjHm2pDROZdRBdRi2Xhcq1d1cU2B
	sFKyFPGlHlUzY1Nw68f+4trCdwPnveVWiBAIv/mCd7Qf7W9caNOa1kZT79lCxPjk
	gE5TCg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0wjuk8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:55:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AB8tFHx001603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:55:15 GMT
Received: from [10.216.36.177] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 00:55:12 -0800
Message-ID: <f5ad350d-5d73-4382-9253-bfd9a5798047@quicinc.com>
Date: Mon, 11 Nov 2024 14:25:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs615: Add QUPv3 configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20241011103346.22925-1-quic_vdadhani@quicinc.com>
 <15238992-4ede-4b85-9947-391baaa4c8a9@oss.qualcomm.com>
 <332f7a0a-d9df-49bd-81d5-cc04c50183b9@quicinc.com>
 <1d374609-8448-43dc-9eec-2407669ae925@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <1d374609-8448-43dc-9eec-2407669ae925@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G93-nIU63HqJwYIllUDTwGWMaKg2804w
X-Proofpoint-ORIG-GUID: G93-nIU63HqJwYIllUDTwGWMaKg2804w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411110075



On 10/28/2024 6:38 PM, Konrad Dybcio wrote:
> On 28.10.2024 12:19 PM, Viken Dadhaniya wrote:
>>
>>
>> On 10/26/2024 1:10 AM, Konrad Dybcio wrote:
>>> On 11.10.2024 12:33 PM, Viken Dadhaniya wrote:
>>>> Add DT support for QUPv3 Serial Engines.
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +    qup_opp_table: opp-table-qup {
>>>> +        compatible = "operating-points-v2";
>>>
>>> opp-shared;
>>
>> Added in v2.
>>
>>>
>>>> +
>>>> +        opp-75000000 {
>>>> +            opp-hz = /bits/ 64 <75000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs>;
>>>> +        };
>>>> +
>>>> +        opp-100000000 {
>>>> +            opp-hz = /bits/ 64 <100000000>;
>>>> +            required-opps = <&rpmhpd_opp_svs>;
>>>> +        };
>>>> +
>>>> +        opp-128000000 {
>>>> +            opp-hz = /bits/ 64 <128000000>;
>>>> +            required-opps = <&rpmhpd_opp_nom>;
>>>> +        };
>>>> +    };
>>>> +
>>>>        psci {
>>>>            compatible = "arm,psci-1.0";
>>>>            method = "smc";
>>>> @@ -392,6 +427,24 @@
>>>>                #size-cells = <1>;
>>>>            };
>>>>    +        gpi_dma0: qcom,gpi-dma@800000  {
>>>> +            compatible = "qcom,sdm845-gpi-dma";
>>>
>>> You must define a new compatible for qcs615, sdm845 is used as a fallback
>>> (so that we don't have to add new driver entries). You will however need
>>> to submit a separate dt-bindings change.
>>
>> We have added sdm845 in compatible due to below comment in driver file
>>
>> File: https://github.com/torvalds/linux/blob/81983758430957d9a5cb3333fe324fd70cf63e7e/drivers/dma/qcom/gpi.c#L2284
>>
>>    /*
>>     * Do not grow the list for compatible devices. Instead use
>>     * qcom,sdm845-gpi-dma (for ee_offset = 0x0) or qcom,sm6350-gpi-dma
>>     * (for ee_offset = 0x10000).
>>     */
>>
>> Do we still require new compatible for qcs615 ?
> 
> The comment concerns the driver side. All devicetree compatible strings
> present in the tree must be documented in Documentation/devicetree/bindings/
> which is where you should add your one as well.
> 

Thanks, Pushed separate patch for GPI documentation patch.
https://lore.kernel.org/all/w66ki7lwrqol24iptikn7ccna25ujqoywjena5ulekf6vynxny@dylbj2r34h7l/T/


>>
>>>
>>>> +            reg = <0x0 0x800000 0x0 0x60000>;
>>>> +            #dma-cells = <3>;
>>>> +            interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
>>>> +            dma-channels = <8>;
>>>> +            dma-channel-mask = <0xf>;
>>>> +            iommus = <&apps_smmu 0xd6 0x0>;
>>>> +            status = "disabled";
>>>
>>> Any reason?
>>
>> By default, we are disabling all nodes. In the target-specific file, we will update them based on the required use case.
>>
>>>
>>>> +        };
>>>> +
>>>>            qupv3_id_0: geniqup@8c0000 {
>>>>                compatible = "qcom,geni-se-qup";
>>>>                reg = <0x0 0x8c0000 0x0 0x6000>;
>>>> @@ -400,6 +453,7 @@
>>>>                     <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>>>>                clock-names = "m-ahb",
>>>>                          "s-ahb";
>>>> +            iommus = <&apps_smmu 0xc3 0x0>;
>>>
>>> This looks like a separate fix
>>
>> One QUP and UART (console) related change has been added as part of the base DTSI. Now, we are adding all remaining QUP and I2C/SPI/UART configurations with IOMMUs and other properties.
>>
>> Is there any specific reason to make this a separate fix?
> 
> Did this work properly before?

Earlier, we verified the console UART use case, and it worked.

> 
> Konrad

