Return-Path: <linux-arm-msm+bounces-45585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEEFA16C21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 13:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 683FE3A5318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 12:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C901DF993;
	Mon, 20 Jan 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k94ZWkm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3F1B87EE;
	Mon, 20 Jan 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737375194; cv=none; b=KRiHHF82uPHb92DVv4w8n7frmVyz6ybVT8TQ9iSvS24jCf1z5QsCtZr6S+PgKGPOkKe5J0X98WP9In1L9dzyfDI1NlBUz0ojPo2KzuReSsJr4GrxwxmJ9L9rz/SPG4sW0NekZBrmtadKSMN+mRmFKN5ObL2eyMZedCGuJ7aVpkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737375194; c=relaxed/simple;
	bh=MOjqNx/Ozrd8CYtQH7UDGAAOAZCJ7irHGJFvcfvJ7uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jFpdZI7Jvk/hT1LoLus1BFN9d63h8I7mM1rF+2uxnmPFOyJS2unKsq+1gpcBKfTFrhMeSm6OUhBdiNtjjtU1SChaPDFUuNk+Z5CQSDHMRUxLIGnD6JH0FikEbiUexV0ddFdZ53+Tcdm1DjvPavdfs4hp5VNlTAr0DxZjN08loN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k94ZWkm0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K9o4Hg026699;
	Mon, 20 Jan 2025 12:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbjnbT1XkiC4pIMy8Anvr34pscIZsdJtPm/NdQYaTlQ=; b=k94ZWkm0QVCSe+8Q
	hrc+htIo3wzKZCZt3/kkOSqTcjDjABeL5hu+oEiKmm/lqJxp+1H/wnjJx4S1ECC9
	7p02ESS0D9KS4x7Ia75NiE+HftcY7TXtdCyq3v3t96mv32NzXgo7BVIUYtWaTN8u
	yBWn8MwuIEf0QxTkRENXW1Bo8mnCZdxfI5PsXOLWuJVlVLEjCC+0ZXnb+Q/UI7eD
	wXTRGbFjhwzVSrZh5xxImekaF1PzXhCTKaxkLv58gQ9KXkNxg7olfYzN9nq0HLDk
	TYOgx7fYPgliC+StELaq2Zu/cKGxHeOQNkzcE+z9haYTqPDufTdIjtWpqyBlGYkc
	h8/xrQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449m72gavk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:12:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KCCm5e006797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:12:48 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 04:12:43 -0800
Message-ID: <9aab1765-224e-4f84-9366-a1b46e5260b7@quicinc.com>
Date: Mon, 20 Jan 2025 20:12:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ARM: dts: msm: Use Operation Points V2 for UFS on
 SM8650
To: Krzysztof Kozlowski <krzk@kernel.org>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>
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
 <5b419c6a-ba22-41d3-bd5e-869d422f3c5d@kernel.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <5b419c6a-ba22-41d3-bd5e-869d422f3c5d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eLu7vWzDkpWVCfPRGrIgu4LQey7OUqIK
X-Proofpoint-GUID: eLu7vWzDkpWVCfPRGrIgu4LQey7OUqIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501200102

Hi Krzysztof,

Thanks for review and comments~

As Neil has submitted a similar patch:
https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-10-eaa8b10e2af7@linaro.org/ 

I will withdraw this patch in next version.

-Ziqi

On 1/16/2025 5:22 PM, Krzysztof Kozlowski wrote:
> On 16/01/2025 10:11, Ziqi Chen wrote:
>> Use Operation Points V2 for UFS on SM8650 so that multi-level
>> clock/gear scaling can be possible.
>>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> 
> Please don't send downstream code directly, but fix it first. Actually -
> rework it 100%.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> >> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 51 +++++++++++++++++++++++-----
>>   1 file changed, 43 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 01ac3769ffa6..5466f1217f64 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -2557,18 +2557,11 @@ ufs_mem_hc: ufs@1d84000 {
>>   				      "tx_lane0_sync_clk",
>>   				      "rx_lane0_sync_clk",
>>   				      "rx_lane1_sync_clk";
>> -			freq-table-hz = <100000000 403000000>,
>> -					<0 0>,
>> -					<0 0>,
>> -					<100000000 403000000>,
>> -					<100000000 403000000>,
>> -					<0 0>,
>> -					<0 0>,
>> -					<0 0>;
>>   
>>   			resets = <&gcc GCC_UFS_PHY_BCR>;
>>   			reset-names = "rst";
>>   
>> +			operating-points-v2 = <&ufs_opp_table>;
>>   			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>   					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>   					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> @@ -2590,6 +2583,48 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>   			#reset-cells = <1>;
>>   
>>   			status = "disabled";
>> +
>> +			ufs_opp_table: opp-table {
>> +					   compatible = "operating-points-v2";
> 
> 
> Messed indentation.
> 
>> +					   // LOW_SVS
> 
> 
> Drop
> 
>> +					   opp-100000000 {
>> +							   opp-hz = /bits/ 64 <100000000>,
>> +									   /bits/ 64 <0>,
> 
> Messed alignment.
> 
>> +									   /bits/ 64 <0>,
>> +									   /bits/ 64 <100000000>,
>> +									   /bits/ 64 <0>,
>> +									   /bits/ 64 <0>,
>> +									   /bits/ 64 <0>,
> 
> 
> 
> 
> Best regards,
> Krzysztof

