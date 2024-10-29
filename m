Return-Path: <linux-arm-msm+bounces-36277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0D9B47D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3B51F22007
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7CC2038A0;
	Tue, 29 Oct 2024 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FbtjQ9MF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECB1DF753;
	Tue, 29 Oct 2024 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200029; cv=none; b=ZPumVlpLdEtxksspyqfn6hsTerakRTdlliQ+574nXZZBhnkv4UsM4VjVRNP3vafeR+gtQYFBqPgevvVvqd7plLo/bEZl+Th0+PD4oCcrWUzn+u8D13qsV/r6k1V4M6N3hsgoADxYVr0q6GlqWEjqlaU/kMR5CCWBiq1yDpenhAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200029; c=relaxed/simple;
	bh=JVHgsgLpf4vjbEvcbEAaNHu5W6OoFfO3Y2fLYfnFZ7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h2RW49FS3XBZ2rwtycOKnkDb3jld/qnXFGDYd5TDLJANRf9Tx6Z2TVpuzA37lpUVEA4e13JMsHv0+VktAXSJ4fvgpzRgB2CuQ+fPYO3N9UrTEAs8HC+UXpvDTrg4nteBLtvcnbopM4Ns3tJWZPuBoM2hFG2PoEwQQLB3BkLlhTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FbtjQ9MF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9Lcjk004586;
	Tue, 29 Oct 2024 11:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1LuXf9jYuiVYJdyPLwQTVsJnJJdP0P/j5ARC3WFPmX8=; b=FbtjQ9MFSG0V7P9N
	H7cI1x6Ox99l5qPjvjni6QNr+x3MSSbJjtRzTkuF7Z315wzS1AwNMvCJzWrH+93i
	NGrg3sJEnPAU8YanUK12XCsi9M0YCV/cz9vDvuseDY58h0hnFKnZ+NnSWJin+tzH
	ZFBD/uxzlKvT8/PuM7AOHrIgbG/5vQEB+MJfWU9mVHSW+MdBBDtbpJLdWWpkd/O0
	aZccgUR77DPQzKLvUX+Mqg5tUxtZkQVuVx36w38UEa4CTgbqtsp6y20Q8Pqh+erW
	65/8Ta84pmWK9BAGNeR8kxYCt76vMxYbujw9wrrsARa57M/0lu/e0ve8QzKbQjw3
	n0E1bQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x859s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:06:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TB6gs3029772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:06:42 GMT
Received: from [10.216.3.156] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 04:06:35 -0700
Message-ID: <75589588-ed41-42f6-b7fa-c6f0359ba4cd@quicinc.com>
Date: Tue, 29 Oct 2024 16:36:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Add ICE algorithm
 entries
To: Krzysztof Kozlowski <krzk@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
 <20241005064307.18972-3-quic_rdwivedi@quicinc.com>
 <070bd760-9095-496b-8f46-1825c592754c@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <070bd760-9095-496b-8f46-1825c592754c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KaS_AwvqOTb_1vuyQ--Sn0N5liSx3Ehv
X-Proofpoint-GUID: KaS_AwvqOTb_1vuyQ--Sn0N5liSx3Ehv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290086



On 06-Oct-24 2:02 PM, Krzysztof Kozlowski wrote:
> On 05/10/2024 08:43, Ram Kumar Dwivedi wrote:
>> There are three algorithms supported for inline crypto engine:
>> Floor based, Static and Instantaneous algorithm.
>>
>> Add ice algorithm entries and enable instantaneous algorithm
>> by default.
>>
>> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 9d9bbb9aca64..56a7ca6a3af4 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -2590,6 +2590,25 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			#reset-cells = <1>;
>>  
>>  			status = "disabled";
>> +
>> +			ice_cfg: ice-config {
>> +				alg1 {
>> +					alg-name = "alg1";
>> +					rx-alloc-percent = <60>;
>> +					status = "disabled";
>> +				};
>> +
>> +				alg2 {
>> +					alg-name = "alg2";
>> +					status = "disabled";
>> +				};
>> +
>> +				alg3 {
>> +					alg-name = "alg3";
>> +					num-core = <28 28 15 13>;
>> +					status = "ok";
> 
> NAK. This has so many issues... First, describes OS policy. Second,
> there is no "ok".
> 
Hi Krzysztof,
	I have updated the status to "okay" in latest patchset and updated the alg-name with actual allocator name.
	I have already mentioned default allocator as instantaneous. Sorry, I did not understand OS policy comment, could you please explain?
Thanks,
Ram.

> Best regards,
> Krzysztof
> 


