Return-Path: <linux-arm-msm+bounces-49809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FA8A490E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9902F1893474
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A86319993D;
	Fri, 28 Feb 2025 05:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MuHkf1SU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8D31EEE0;
	Fri, 28 Feb 2025 05:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740720690; cv=none; b=q/FH/RFlV4BQBtbGtyuU4FpCdDbI3n1EEpt9UrR0HzrQvdxHMYLd2LN/rlVIKCSN/1VDs3ERBf8AmNKqeNssOsWshedDqt+U2KLr7Ju604M0hMI5GGD7YbxRqItnqiTcix/fKLFP5jn+MFIuFftEg9yNNYscOj0SQgtE1BqvjMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740720690; c=relaxed/simple;
	bh=+STl88bAkBd9DGKmS+aEF8q/3e0HRxiB4N848LL6Hlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hB09rSI16hb8Ih5MTyvokfvkcamOyPwHJgVCOReI40Oy9enNAguD17yn+LHbhKi1G2X+nS+kkgV8ZRFh9lPyfv5AI8vbAO+JkHC7rdMIrdLbuIYTM+um+7nhaCdzui8B7Ho4LRaCW0k5kUAFQtAm9evPY9oOiWZWC+K0NzjYWjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MuHkf1SU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RH801Y013260;
	Fri, 28 Feb 2025 05:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5D/hr1fuv0S6ELFcDcwZRM3GXbBTxa07KUOxBpN5gfM=; b=MuHkf1SUua/iY6Gh
	v/1GP4x7N5iJ3hgJO2ipGYw8TsrHSJecZM8Lr1kSQ3lZSsvaud/EhKLZ7TbLUpnA
	HZtMg/KDfGr13/JoXCCfxXYs6dMqutof6DpX61uUPR/H9Ik51Cl3tvryaC0HVclG
	xTEt2fzbE3sLj6QPMfIr3j7ipkcp0rO05cfx9N1u6k7BN3f4AVgBMvEjDRmo9L6E
	gh7xnvwdCnD/AWvGYA4hDYsvzfQgh895iGqeWpkQLVvRl0uEix9eSUPa76cg8EoB
	b5CnJGlxPXZHLz9hp5p7hw3Z5uYHh0hJ3zmMHQ4gorXxL354kR2leqxLj0xGRa6i
	VWhGYw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk847d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 05:31:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S5VNwq009229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 05:31:23 GMT
Received: from [10.216.6.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 21:31:20 -0800
Message-ID: <7b219289-4f3d-4428-a0af-42491acb1cbb@quicinc.com>
Date: Fri, 28 Feb 2025 11:01:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <2mlmhzllhb5fhcbwtupy2nk74my5hruliayyr3kayrjvmtou25@em5encygrn2i>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <2mlmhzllhb5fhcbwtupy2nk74my5hruliayyr3kayrjvmtou25@em5encygrn2i>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d6bZm8qI_NFqlmmEc332MTdpWVPEsIBl
X-Proofpoint-ORIG-GUID: d6bZm8qI_NFqlmmEc332MTdpWVPEsIBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280037

On 2/28/2025 5:56 AM, Bjorn Andersson wrote:
> On Thu, Feb 27, 2025 at 11:38:16PM +0530, Yuvaraj Ranganathan wrote:
>> The initial QCE node change is reverted by the following patch 
> 
> s/is/was/
> 
>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
>> because of the build warning,
>>
>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>     ...
>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
>>
>> Add the QCE node back that fix the warnings.
>>
> 
> Are you saying that adding this node back will fix the warning?
> 
> I'd expect that you would say something like "The changes to the
> Devicetree binding has accepted, so add the node back".
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 23049cc58896..b0d77b109305 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -2418,6 +2418,18 @@ cryptobam: dma-controller@1dc4000 {
>>  				 <&apps_smmu 0x481 0x00>;
>>  		};
>>  
>> +		crypto: crypto@1dfa000 {
>> +			compatible = "qcom,sa8775p-qce", "qcom,sm8150-qce", "qcom,qce";
>> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
>> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
>> +			dma-names = "rx", "tx";
>> +			iommus = <&apps_smmu 0x480 0x00>,
>> +				 <&apps_smmu 0x481 0x00>;
>> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0
>> +					 &mc_virt SLAVE_EBI1 0>;
>> +			interconnect-names = "memory";
>> +		};
>> +
>>  		stm: stm@4002000 {
>>  			compatible = "arm,coresight-stm", "arm,primecell";
>>  			reg = <0x0 0x4002000 0x0 0x1000>,
>> -- 
>> 2.34.1
>>

DeviceTree bindings were accepted but the comptabile string does not
properly bind to it. Hence, adding the correct binding string in the
compatible has resolved the issue.

Thanks,
Yuvaraj.

