Return-Path: <linux-arm-msm+bounces-57407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9943DAB0E2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 11:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AACC3A5AF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C2E274FCF;
	Fri,  9 May 2025 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H4xvfpS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DCE2749EC;
	Fri,  9 May 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781521; cv=none; b=myL66+arJlGlIpK1dHdecxzWaGms2VRiFz6jT7D8VdtlbA6IzoXrr+eSOlSvrZ1DkJAgrRNtOJK+XHyG18Uwa4dF/WFoXjNwtyJ00+E4BgKhh4pmVXNQ4+0NKbYsXvQ4xvTY1B0fVtszGNgq3/vMIMc+D2Zuql4mTZXcoUeZkeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781521; c=relaxed/simple;
	bh=r6AyoO4jM+4/G7CsUbGRmd/cmBg0WG9BKGrxNSbN2nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=STlfCyrLGmG+t9zVR1/0ztImILEikE7TGbtDW8Cpemj0LX/RlxSudpWRUgIIpU6dEUCEZ8j/ZSr9WmHOXDcorPHyVJkyXTrzU0BjO+QqjJMTuKgaCuzna1GIPx59xh4ZPtBPeSnEmIzZ87Hr0NjTHqrCCrKx9ysJ/Omo7NCeTKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H4xvfpS1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5498kiYu013054;
	Fri, 9 May 2025 09:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSUZkrk+gU0muWy6QiHsRn3FzS/UezpX2nUffPV+MkM=; b=H4xvfpS1FjXoSrJ4
	/mctbo0cTpZCa5VKVGbnTvaYkgfD4KkMasHTn6jwG5MjG7jqfp1EKXAqtxcIV15N
	P8LmDWxh5I24WxheENwrxjBHIhsFAxT2+Dysse1ia2abXWy8EkLlKqE5W2QD42t3
	FLFJ6PgExZncBHQUJzRlm3n7AUUE7p51nTwgXp9bLq+KhHRohd2lMgDRqQS5fOAy
	S9C7cPN1VUMn1R750bo1K0t+zpEyLlnHhAcVSjsxdc/nhX6YUjJwLtEu2fGX01HS
	zPekECfTNAIiRfh4fnIOVc61s0BWCDrRlnG2op8KvcDJjfWPklfAORfpHgE75//c
	pYSkQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52u8cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 09:05:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54995GdN018495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 09:05:16 GMT
Received: from [10.216.47.65] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 02:05:12 -0700
Message-ID: <73cc2db3-8692-4da7-8cfb-29c2450a706d@quicinc.com>
Date: Fri, 9 May 2025 14:35:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sa8775p: Add default pin
 configurations for QUP SEs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_msavaliy@quicinc.com>,
        <quic_anupkulk@quicinc.com>
References: <20250429173334.303003-1-quic_vdadhani@quicinc.com>
 <xvmk4paonzafxm5aesu67ggkwpdak2ughhi35wap45rjtuplsk@xe52pvnudsbp>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <xvmk4paonzafxm5aesu67ggkwpdak2ughhi35wap45rjtuplsk@xe52pvnudsbp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4NyBTYWx0ZWRfX4zzvydsRplEs
 pqJfMeMaWHQ8ZW70HNUbCjB8do/CShgETaiuOPns8KgolxJRVSgmMe+8Tfg2h4XGzs/z71xPryR
 WtCT2p2yG46G+abJcVHQSd8NfN6mgIvoE/oMm9ZKQ8wK099iPnnNDPP9/zXF9w8rta91P/4MSiU
 btRkG2cEM5df2FUO2pWTdxAsbMhuqqVX1iVyL4QdqY4WefvSd23HVFJNNP7oAhfDq/5ZXyOSUtg
 UP88r7Qj6jw7hUh+2S5465QDL+xCOUMRebizpbAzbBKPcVqodIBCy+pubx7glB4B4qwOxc/6AS8
 KmON2hyMM6NtUrWtZGSbAa7e/hWL/lGSSOIbp5LtjMr47YsaHCqznKxLxiLoi5aHAv/v2z9DhvM
 h0SFCqUMK0yo3KO7gSgPaeT52OFR+lbg+EyqqswRTWfFeLak1wmTVt5PeXJjE7zB44EEm8Gt
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681dc54d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KtguLzq4JQKON55N9fIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rb27hl35HjopbzTLVNaDzE77O7gZnewt
X-Proofpoint-GUID: rb27hl35HjopbzTLVNaDzE77O7gZnewt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=841 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090087



On 5/3/2025 11:11 AM, Dmitry Baryshkov wrote:
> On Tue, Apr 29, 2025 at 11:03:34PM +0530, Viken Dadhaniya wrote:
>> Default pinctrl configurations for all QUP (Qualcomm Universal Peripheral)
>> Serial Engines (SEs) are missing in the SoC device tree. These
>> configurations are required by client teams when enabling any SEs as I2C,
>> SPI, or Serial protocols.
>>
>> Add default pin configurations for Serial Engines (SEs) for all supported
>> protocols, including I2C, SPI, and UART, to the sa8775p device tree.  This
>> change facilitates slave device driver clients to enable usecase with
>> minimal modifications.
>>
>> Remove duplicate pin configurations from target-specific file as same pin
>> configuration is included in the SoC device tree.
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>> v2 -> v3:
>>
>> - Remove duplicate pin configurations from target-specific file.
>>
>> v2 Link: https://lore.kernel.org/lkml/20250324151047.842648-1-quic_vdadhani@quicinc.com/
>>
>> v1 -> v2:
>>
>> - Drop drive-strength and bias property from soc dtsi.
>> - Update commit log.
>>
>> v1 Link: https://lore.kernel.org/lkml/20250225154136.3052757-1-quic_vdadhani@quicinc.com/
>> ---
>> ---
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  35 -
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 750 +++++++++++++++++++++
>>   2 files changed, 750 insertions(+), 35 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 967913169539..3b4243ef37e7 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -508,15 +508,11 @@ queue3 {
>>   
>>   &i2c11 {
>>   	clock-frequency = <400000>;
>> -	pinctrl-0 = <&qup_i2c11_default>;
>> -	pinctrl-names = "default";
>>   	status = "okay";
>>   };
>>   
>>   &i2c18 {
>>   	clock-frequency = <400000>;
>> -	pinctrl-0 = <&qup_i2c18_default>;
>> -	pinctrl-names = "default";
>>   	status = "okay";
>>   };
>>   
>> @@ -678,8 +674,6 @@ &sleep_clk {
>>   };
>>   
>>   &spi16 {
>> -	pinctrl-0 = <&qup_spi16_default>;
>> -	pinctrl-names = "default";
>>   	status = "okay";
>>   };
>>   
>> @@ -712,80 +706,53 @@ ethernet0_mdio: ethernet0-mdio-pins {
>>   		};
>>   	};
>>   
>> -	qup_uart10_default: qup-uart10-state {
>> -		pins = "gpio46", "gpio47";
>> -		function = "qup1_se3";
>> -	};
>> -
>>   	qup_spi16_default: qup-spi16-state {
>> -		pins = "gpio86", "gpio87", "gpio88", "gpio89";
>> -		function = "qup2_se2";
>>   		drive-strength = <6>;
>>   		bias-disable;
>>   	};
> 
> If you are movign parts of these pinstates to the sa8775p.dtsi, then you
> should also turn these declarations into label-based updates:
> 
> &qup_spi16_default {
> 	drive-strength = <6>;
> 	bias-disable;
> };
> 
> Otherwise the configuration is fragile: if the name gets changed, then
> two parts will not match.
> 

Sure, Updated in v4.

>>   
>>   	qup_i2c11_default: qup-i2c11-state {
>> -		pins = "gpio48", "gpio49";
>> -		function = "qup1_se4";
>>   		drive-strength = <2>;
>>   		bias-pull-up;
>>   	};
>>   
>>
> 

