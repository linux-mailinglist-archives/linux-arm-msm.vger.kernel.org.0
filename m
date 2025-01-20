Return-Path: <linux-arm-msm+bounces-45586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C436BA16C27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 13:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1CB2161AEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 12:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0651DFDA3;
	Mon, 20 Jan 2025 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AeS3BQW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E591DFD85;
	Mon, 20 Jan 2025 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737375264; cv=none; b=TN0Vfc5fTPnRZf8bw9Df1RduHsjkS37CC8bjxY5mKlDR45TDrXSjuMBZX+Q5AXbp9u+WhRqv71d+1l0wdhRJOZ88XhJdHJVcwkGYsQJxt3adhxMV3xtb2OIwvmTGTA+Rr0Se3VWysWpS0vSPQXFasxp16AAiyUM4XGMrPtkTZ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737375264; c=relaxed/simple;
	bh=BHeJn3raiuG0W/dL2c8Dln16JNDQHSZU6dQqdGU7Kq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bX612jlBnGsQGsY53chzaa+A5H9r2zsvCx7Dl20xF+XQvs7ppvFAH+uPhF9QJzbpi0v7qIFpUYMjymn4VkQkosjXSq6ltt+t+o++rBMGpH5M4U/LM6sMWOxwN5+nRuPG7hhyQSumjS/5x+U5CvgseUhUrEyeWtgLLaFILiu2sLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AeS3BQW9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6gwT5007181;
	Mon, 20 Jan 2025 12:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqOcLXFNyxbatMhbygLBGDAfknLwFIGZHDdPOoF02RU=; b=AeS3BQW9FIa8P4UH
	vKbZz54NIWmSTQgt1FeL6MEO//UlIkMrrupc13mUMOcs7O+N6PgpcIaXt9nFLDAY
	d8CioXmwENwCo8qOS2GHQrhFWYwi/y+XTGXt/dSU4bhSfNv/D2r9U6UvvO+k0gsw
	SpLyK5oW6JTHGygjUqNwUeXRcFWuqhrH8cE6aXBYfKmBpZup0eraEaPKlHwneP4V
	JVGcqvNE2OH/WPYSsLl/51F6+Y6Z/wLdjg44mqpgW0doQxlL0ASp0M1tMrJMh+FX
	sLjnGeXyud18ImLVX+po0zkOZxZuwXbIBWcF17Vce/tDdQx2SayPNCsRsCccVEb+
	13IbpA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hfb0sp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:13:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KCDMQk004489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:13:22 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 04:13:18 -0800
Message-ID: <872d2183-b255-4d4d-b7e6-acdaa2737172@quicinc.com>
Date: Mon, 20 Jan 2025 20:13:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ARM: dts: msm: Use Operation Points V2 for UFS on
 SM8650
To: <neil.armstrong@linaro.org>, <quic_cang@quicinc.com>, <bvanassche@acm.org>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-scsi@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-9-quic_ziqichen@quicinc.com>
 <e61d05d3-eb9d-4b58-8a56-43263c58f513@linaro.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <e61d05d3-eb9d-4b58-8a56-43263c58f513@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jlIZSnZDJJzSsoLowBa7tyTVKTzTn2wJ
X-Proofpoint-ORIG-GUID: jlIZSnZDJJzSsoLowBa7tyTVKTzTn2wJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200101


On 1/16/2025 5:24 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 16/01/2025 10:11, Ziqi Chen wrote:
>> Use Operation Points V2 for UFS on SM8650 so that multi-level
>> clock/gear scaling can be possible.
> 
> 
> I've already sent a similar one at 
> https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-10-eaa8b10e2af7@linaro.org/
> 
> Neil
> 

Hi Neil,

Thank you for reminder , I will withdraw this patch in next version.

- Ziqi

>>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 51 +++++++++++++++++++++++-----
>>   1 file changed, 43 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 01ac3769ffa6..5466f1217f64 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -2557,18 +2557,11 @@ ufs_mem_hc: ufs@1d84000 {
>>                         "tx_lane0_sync_clk",
>>                         "rx_lane0_sync_clk",
>>                         "rx_lane1_sync_clk";
>> -            freq-table-hz = <100000000 403000000>,
>> -                    <0 0>,
>> -                    <0 0>,
>> -                    <100000000 403000000>,
>> -                    <100000000 403000000>,
>> -                    <0 0>,
>> -                    <0 0>,
>> -                    <0 0>;
>>               resets = <&gcc GCC_UFS_PHY_BCR>;
>>               reset-names = "rst";
>> +            operating-points-v2 = <&ufs_opp_table>;
>>               interconnects = <&aggre1_noc MASTER_UFS_MEM 
>> QCOM_ICC_TAG_ALWAYS
>>                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>                       <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> @@ -2590,6 +2583,48 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>               #reset-cells = <1>;
>>               status = "disabled";
>> +
>> +            ufs_opp_table: opp-table {
>> +                       compatible = "operating-points-v2";
>> +                       // LOW_SVS
>> +                       opp-100000000 {
>> +                               opp-hz = /bits/ 64 <100000000>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <100000000>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>;
>> +                               required-opps = <&rpmhpd_opp_low_svs>;
>> +                       };
>> +
>> +                       // SVS
>> +                       opp-201500000 {
>> +                               opp-hz = /bits/ 64 <201500000>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <201500000>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>;
>> +                               required-opps = <&rpmhpd_opp_svs>;
>> +                       };
>> +
>> +                       // NOM/TURBO
>> +                       opp-403000000 {
>> +                               opp-hz = /bits/ 64 <403000000>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <403000000>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>,
>> +                                       /bits/ 64 <0>;
>> +                               required-opps = <&rpmhpd_opp_nom>;
>> +                       };
>> +               };
>>           };
>>           ice: crypto@1d88000 {
> 

