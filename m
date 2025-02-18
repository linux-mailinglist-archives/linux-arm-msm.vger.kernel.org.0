Return-Path: <linux-arm-msm+bounces-48344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E5A39AC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 12:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 434D616C760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 11:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3495A234989;
	Tue, 18 Feb 2025 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PvtAQfNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F841A5BA7;
	Tue, 18 Feb 2025 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739878088; cv=none; b=At6OVHFD9K+4Ux/B6UUjKbvUHGXDkouM4eqKKs8XaCR3SgbsEcgeo89uC2TR+TOsCUYkJMAB2xHVn250AKjqbqaLD+J8TmIUPFbVNiRxqbnrgth7rTJCRBpA7xQfj9d86VmL7xZeSyrflDAlZwDpetqELb7aJCEs6JU7HsJSe40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739878088; c=relaxed/simple;
	bh=iovXbbyKWiK/0EHpRva+oRsY15LjviC8RGRvQ9oppKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RusaDebgb/aqmYrUtDQxvTLZCwp3cLhMhRaSP9M5k0px3xP40WKHnoox44ypt03PDhAFTIuqmYnQcqbPDfkDoDshyAkBikPsVz+tLFjug6l63wPkhgSS1vTVrcgNeZedcaf7ZpY5OnHhTuwAI3GceYJZy54HPC3AnFHmIjpV21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PvtAQfNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HNmHMn004131;
	Tue, 18 Feb 2025 11:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OfFu0RkbbUZXKY+wlw4vZE7RYzdrPOYjbu2BnT5c6Y=; b=PvtAQfNWI3yUvGM2
	Dd0P6GTjmPE1mlYQa5mhDKT+hFVhmIVHJCznIxxQ7RyKA82HCT46KJhK1KBadAzj
	goXnUWyyCxFQ1FaR/Yjq+TMwcg0ijMH3jsqCaGj1mM9e79AXbYyw4hpv76fQbc7F
	l/szK2KjM/PamX7SCCC6FEx5uFTYjyeTxLt4x+CuyGK0MgjJx7reZjx7uS5FxcOg
	/Xq4W/bTIA65Lrrs7qbZMUesPjnjEw2ahRApkv849l9eesvkmHh5wN3cpR0x6ITE
	lx2wXDiw6ZAwBFvhPifKxTlZjOf2k48gENOhEMEMm2PEHiA3WXzvldYoqy94dvt/
	EUNuvQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7uvmq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 11:27:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IBRPD8031473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 11:27:25 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 03:27:15 -0800
Message-ID: <25e5840d-a9c3-45fa-ae06-e18c387f1efc@quicinc.com>
Date: Tue, 18 Feb 2025 16:57:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] arm64: dts: qcom: ipq9574: Add nsscc node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <biju.das.jz@bp.renesas.com>,
        <quic_tdas@quicinc.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <ross.burton@arm.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
 <20250207073926.2735129-6-quic_mmanikan@quicinc.com>
 <ee166cf3-4486-4172-a510-bafa1624ab79@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <ee166cf3-4486-4172-a510-bafa1624ab79@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8uUAcfAcj6CylrdPtUO1K7NHTHtu96ta
X-Proofpoint-ORIG-GUID: 8uUAcfAcj6CylrdPtUO1K7NHTHtu96ta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180090



On 2/10/2025 11:47 PM, Konrad Dybcio wrote:
> On 7.02.2025 8:39 AM, Manikanta Mylavarapu wrote:
>> From: Devi Priya <quic_devipriy@quicinc.com>
>>
>> Add a node for the nss clock controller found on ipq9574 based devices.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V9:
>> 	- Rebased on linux-next tip.
>>
>>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 942290028972..29008b156a7e 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -1193,6 +1193,25 @@ pcie0: pci@28000000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		nsscc: clock-controller@39b00000 {
>> +			compatible = "qcom,ipq9574-nsscc";
>> +			reg = <0x39b00000 0x80000>;
>> +			clocks = <&xo_board_clk>,
>> +				 <&cmn_pll NSS_1200MHZ_CLK>,
>> +				 <&cmn_pll PPE_353MHZ_CLK>,
>> +				 <&gcc GPLL0_OUT_AUX>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <&gcc GCC_NSSCC_CLK>;
> 
> This last clock doesn't seem to be used in the driver - is that by design?

Hi Konrad,

Initially, was under the impression that the GCC_NSSCC_CLK will be enabled by the Ethernet driver.
However, that is incorrect and this clock is needed for accessing the NSSCC block itself. Hence restoring this.

I will enable this clock by using the PM APIs (pm_clk_add()) in next version.

Thanks & Regards,
Manikanta.

