Return-Path: <linux-arm-msm+bounces-41961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE349F0975
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 328B7165B72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E841B415F;
	Fri, 13 Dec 2024 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GuERsYeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C4199947;
	Fri, 13 Dec 2024 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085844; cv=none; b=GZU7yFcTQIAnNwkSOQR3Kshh/pLcVxoysm8qsJAj3avSUmKHESDmzfqU6T9HQH8F8UL/VIYBJ6820SjKtaO0nByKWxb0y5Myoy+ICjKRWNLv6ccOoWviCrj/JbtdaKGUqJdA6Lrn8l7CJJzJuyscDM8kN6VNzP24G7+DsPANr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085844; c=relaxed/simple;
	bh=Pr68w8HLRcyR4R3SXxUHNI/cz0OLkbvyA5cDO9axV8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n6QQzrXYHdclML2RpCtNr4q09scLyAQEGxEIH/ARJ08gTxMopErx2DVFXTkRA1MOEgL+QC3dY7RMLApMDwWuD+ManPeCq6+6LXp3kp2f0LkLxFQnWbHd+HBImhHu6CG/lVT3MefoKCZkHtXdW2r7fAMHAZojiZ3ZFpY0j9Oupe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GuERsYeU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD2g9OZ000485;
	Fri, 13 Dec 2024 10:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4VIRW8LodQHYJc1txja2sDsdcbnQij1n5PaWsrKr1eU=; b=GuERsYeUwzdQYiJn
	aVBOvEN6uTErzoGB2/cAhTMICJNxThfAb2csGrlQUYh8bwrf27u2v3r1k3j6ZJPK
	Yn6fvph0h9xoditgLBhldd2u54qz+nSrKBiXiTWmbOPXEqIfxpc8pA67Sat0MTZJ
	MDF618+BEfbzC6AYbq1PtWMsu7yZ6UsVNkvXlhhvOBEonSy6y6f8Hy8QBEaqkHUJ
	MT+9SKBRTkwOFm6uzXdYxqEhpFNNWJS8f+s+TQBE2I3g5Pw4maBfA2SrlvCq73Ea
	EIToljQqRBLvCqa1On92RkgnLln4jAwYtB/b1qYaWfBH2wU654GNWax4c0/8ccUi
	UM8T6g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4gdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:30:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAUXKA018370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:30:33 GMT
Received: from [10.235.8.17] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:30:28 -0800
Message-ID: <8063460d-18ad-4e54-8232-716bad9d37c3@quicinc.com>
Date: Fri, 13 Dec 2024 18:30:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
 <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9lpEAO-uMRk-C7HonLcevXvPHCozICKQ
X-Proofpoint-ORIG-GUID: 9lpEAO-uMRk-C7HonLcevXvPHCozICKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130071



On 12/13/2024 2:33 AM, Konrad Dybcio wrote:
> On 7.11.2024 10:50 AM, Luo Jie wrote:
>> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
>> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
>> block routing channel.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> index 78f6a2e053d5..9a8692377176 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>>   	clock-mult = <1>;
>>   };
>>   
>> +/*
>> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
>> + * from WiFi output clock 48 MHZ divided by 2.
>> + */
>>   &xo_board_clk {
>> -	clock-frequency = <24000000>;
>> +	clock-div = <2>;
>> +	clock-mult = <1>;
>>   };
>>   
>>   &xo_clk {
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 8246a00a3e3e..25aed33e9358 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>>   		};
>>   
>>   		xo_board_clk: xo-board-clk {
>> -			compatible = "fixed-clock";
>> +			compatible = "fixed-factor-clock";
>> +			clocks = <&ref_48mhz_clk>;
> 
> This must be squashed with the previous patch, you can't introduce
> code and replace it immediately afterwards.
> 
> Konrad

Ok, I will update the patch series with this patch dislodged, and push
this single patch in next update. Thanks.


