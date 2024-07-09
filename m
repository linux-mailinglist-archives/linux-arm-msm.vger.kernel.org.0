Return-Path: <linux-arm-msm+bounces-25731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A292C338
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 20:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6B5284FC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 18:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66C717B036;
	Tue,  9 Jul 2024 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TxBAwY75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840E12D766;
	Tue,  9 Jul 2024 18:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720549292; cv=none; b=phJZWqayTO/U3Qyxsjdb3vEmmf2PxddjQ3uuUrHmDastP5LgD6MGo6McfTJN+/LYr0vk+vUA7cth58WtQvQHmagQ96hCnSZISYUeIWgpwNoF20/hFIJZH2895MXKdQQ/giYgxb6ktnwhntoLT2bpD6TRTs03HEs4AMf7K8dtSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720549292; c=relaxed/simple;
	bh=pf69FWMO9D2dX8R/beIlxekO2hL3IQYEObvxezWPVxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OndWydV2Zh6Ktams1TDQJeOuYQHYSHBJ13sVq7E2+CDxA5XX4qN6n97SSJV5YdTKy+1U7sGbpRwNy415YMf/VY0BEcSop2SD9sOuncGVtft9zsNvTngnAQyBV8GRxuKgBCj/vCKyPBPS42ya8Ign+OgNjAOw5MRR49Y+ttGZxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TxBAwY75; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AQCbo026793;
	Tue, 9 Jul 2024 18:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNLiJ/rx2O+KzIimhVQHVvy5puSuLvDv9tvJX3czpZY=; b=TxBAwY75ijTxM/H4
	yrkz3a7GhYu0lZp2eo8G09nefjIj9EeRE50mgGIxB8c969S4g7DxE0cALTSDNWp0
	X2K6/vUpV0IfrH6x2boOp+v4evoIPaEcm/LexdLi9Du/ND0hKaOcKR9gPAA04MJp
	x940g+NY3iFiewgsWUbeJokr1lTLX/zDBkM2IbvS8yyLXwXg9dHmA+KCHcH7USzS
	f2AfqTZ7vtmq4r/1Git3D0wDfn7/LqZ+RFd+snAQXsiJp4O4Cv2MCF9LphliRsEV
	BwHD+ABMcbK31vTpHJNvVTLrT9UgaKv81muEmn3M+c1BKhByUdJDLbpuFWzmocBH
	x4B2nw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wg3yh0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 18:21:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469ILL2s001606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 18:21:21 GMT
Received: from [10.110.47.59] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 11:21:17 -0700
Message-ID: <f7f8b223-4ff3-45f1-9962-7df2c5a77092@quicinc.com>
Date: Tue, 9 Jul 2024 11:21:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add interconnects for ethernet
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Andrew Halaney
	<ahalaney@redhat.com>, <kernel@quicinc.com>
References: <20240708-icc_bw_voting_emac_dtsi-v1-1-4b091b3150c0@quicinc.com>
 <6af7308b-ab84-4173-968f-c67fc1aef04b@linaro.org>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <6af7308b-ab84-4173-968f-c67fc1aef04b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: koHAMbQV0HHCvnHGdMbKBRtB6TmB0Vo4
X-Proofpoint-GUID: koHAMbQV0HHCvnHGdMbKBRtB6TmB0Vo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_07,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=974 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090124



On 7/9/2024 5:19 AM, Konrad Dybcio wrote:
> On 8.07.2024 11:14 PM, Sagar Cheluvegowda wrote:
>> Define interconnect properties for ethernet hardware.
>>
>> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
>> ---
>> Adding interconnect dtsi properties within ethernet node of SA8775P,
>> this patch is adding support for the interconnect properties defined
>> in the series ->  
>> https://lore.kernel.org/all/20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com/
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 23f1b2e5e624..7ebf03953b7b 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -3464,6 +3464,12 @@ ethernet1: ethernet@23000000 {
>>  				      "ptp_ref",
>>  				      "phyaux";
>>  
>> +			interconnect-names = "mac-mem", "cpu-mac";
>> +			interconnects = <&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>;
> 
> property
> property-names
> 
> please
> 
> otherwise lgtm
> 
> Konrad

Thanks Konrad Dybcio for reviewing, let me post a new patch re-ordering the properties.

