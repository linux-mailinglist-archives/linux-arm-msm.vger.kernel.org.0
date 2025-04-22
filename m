Return-Path: <linux-arm-msm+bounces-54930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3694A96727
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8176C3BAC4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDCC2777E5;
	Tue, 22 Apr 2025 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EOuKw/Og"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405F2777E1;
	Tue, 22 Apr 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745320886; cv=none; b=Bmo6wcqp4isXT9qYigbAdz0qJ/mNeVNWZ1y+XEG3u6lrul/fFvAwZolr2B3tQyMxhXanupBFd74gwY5ApLJ3h3ojP/W/IVJjanwW8o/56Ws6cvahinr8J1oBh248KHzLzofBKxoQ0PugqEtegkz23lcn13MeF4kCUIf31aoAbLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745320886; c=relaxed/simple;
	bh=nmR4TdV4+M08iCOThs59/0QH8E7V51DggdtN2U37lq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=brB/rZfflCcGIt6rFdZkJVHjBgwdDOJZGoV7P3EiHrXdAZlqQgxjKwZMxwC+aJtXcOOw50K4fRvMH/JwMV5xLvf7GTXrpHZVRSYN2FW0KSXl3gNEOyyxz48+4H345kNEpRNadfPlRAGStplDqC28K9z3I5V/15hTvzNiNkJvyVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EOuKw/Og; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OlZa006174;
	Tue, 22 Apr 2025 11:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4nBCRh0WFy4RUD4NZmrTdHCdTJnYmLhpp2J6H/klno=; b=EOuKw/OgGQVVRJBt
	lfBnVRBq/o/K4/CPggde60dMSZBY9jtHWTwI+1geBtVVPvXXF9O4MGTo7/JPb5ol
	e2NfLwL0Z+KgcwkQh/QoTKKyBuhHie3LGntDNdS10THN9WVg7afaSMKoHnKpPdGb
	rYQiWWLCkZCYzb/vvhZTdmQ8Jzw97XG48feOEa82HFmcHBE/SV/W95Hp11U1Gwxs
	e759pkf2qsxRUDW4SfgA1aFBHR5AVByTmP/4/3wLrLPbXiVnbz59HG/1LJoUu45V
	DtZPNpmbKmNHkv4QHdicaYfTgcsUFhw2DkyH2pFOfaCX3d7nYJQAlczu4UOKOS84
	eAm4JQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jf8xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 11:21:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MBLJkr013888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 11:21:19 GMT
Received: from [10.50.21.133] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 04:21:15 -0700
Message-ID: <ed284074-d12a-497d-b8c3-de913bcffb6a@quicinc.com>
Date: Tue, 22 Apr 2025 16:51:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: qcom: sa8775p: Add default pin
 configurations for QUP SEs
To: Bjorn Andersson <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250416101411.1444248-1-quic_vdadhani@quicinc.com>
 <pxywhhhtraaykx32z7aifyd63gxydwrf4byuanv4zbfeqhk2fx@h6lyn7btyrtz>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <pxywhhhtraaykx32z7aifyd63gxydwrf4byuanv4zbfeqhk2fx@h6lyn7btyrtz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=68077bb0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=_55ISlHlL2tq_TlyrwIA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vS9HXyPTtFfcn-WsfgnPcCH88VJzi26w
X-Proofpoint-ORIG-GUID: vS9HXyPTtFfcn-WsfgnPcCH88VJzi26w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220086



On 4/20/2025 10:40 PM, Bjorn Andersson wrote:
> On Wed, Apr 16, 2025 at 03:44:11PM +0530, Viken Dadhaniya wrote:
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
>> v1 -> v2:
>>
>> - Drop drive-strength and bias property from soc dtsi.
>> - Update commit log.
>>
>> v1 Link: https://lore.kernel.org/lkml/20250225154136.3052757-1-quic_vdadhani@quicinc.com/
>> ---
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |   7 -
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 750 +++++++++++++++++++++
>>   2 files changed, 750 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 967913169539..17c3f662d14b 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -712,11 +712,6 @@ ethernet0_mdio: ethernet0-mdio-pins {
>>   		};
>>   	};
>>   
>> -	qup_uart10_default: qup-uart10-state {
>> -		pins = "gpio46", "gpio47";
>> -		function = "qup1_se3";
>> -	};
>> -
>>   	qup_spi16_default: qup-spi16-state {
>>   		pins = "gpio86", "gpio87", "gpio88", "gpio89";
>>   		function = "qup2_se2";
>> @@ -917,8 +912,6 @@ &remoteproc_gpdsp1 {
>>   
>>   &uart10 {
>>   	compatible = "qcom,geni-debug-uart";
>> -	pinctrl-0 = <&qup_uart10_default>;
>> -	pinctrl-names = "default";
>>   	status = "okay";
>>   };
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> [..]
>> +			qup_spi16_default: qup-spi16-state {
>> +				pins = "gpio86", "gpio87", "gpio88", "gpio89";
>> +				function = "qup2_se2";
>> +			};
> 
> Now we have qup_spi16_default in both sa8775p-ride.dtsi and sa8775p.dtsi
> 
> I presume you forgot to clean that up?

Sure will update in next patch.

> 
> 
> PS. I don't know why the word "RESEND" is present in $subject. Why was
> this resent?
> 

Hi Bjorn,

I apologize, but I'm not entirely sure if there has been any approval or 
if the patch will be accepted. Since it's been over three weeks, I 
thought it might be a good idea to resend it.

I apologize for any confusion caused by resending the patch.

> Regards,
> Bjorn

