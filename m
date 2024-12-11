Return-Path: <linux-arm-msm+bounces-41559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF479ED73E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76B7167B36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 20:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF2D1DD880;
	Wed, 11 Dec 2024 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FOOviwwc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A42594B5;
	Wed, 11 Dec 2024 20:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733949052; cv=none; b=Zfxx+7o0vRxE7unbHVV7apaCWMKnzAtSPw8ZEXd5t90Vexrpfp43YiVhRSYh999xoLKnkqkj789gs6ANBcUZMlYQ/pUJR6PgGFR0zMvMd+O+fP6pO/KSIfSXjwykJjsCrh6QaTk8EWQNGH4i4gGR/6617N7dk1TcO7e1SpzQqS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733949052; c=relaxed/simple;
	bh=XCXXh9j93NsjIe52hhBIM9bIsa2zlatKw6Lg9gLo1j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rpf+W30KH8/K25SRrIDg3aBV6TJlhp6VZKuNxlQHTo6BubNUd1Momw4IBIFPprs9o3hoBW4oxA+lWXMZNqTRFjjdHmQoN+d5c0jUvVkB0/AcoaZNjgqmb3kc0blOVDkRcbaJ7aPk1otUyvb6H2fhyI8+vlTDZYEN23lLUOzxOfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FOOviwwc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD2De029009;
	Wed, 11 Dec 2024 20:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaUEmMPR5hAVeKcLyli8tiJit5WQFU76fMSw576M9vk=; b=FOOviwwcu3tQT3IE
	M48fcNg42D0XPkylqilyTuoan+ZuC6RvZA3sN+QVUrLR/SKec1kEm8nDT1Xv6zA/
	zzPHxhuA0nDePQdRGuTFCJMXtHRn8KSlbOmha6Se4jp9bond42oDJKf0y4fLYsPL
	A+YRYLRkqArypyCr4BfnK0FM3ZXN1O0pA05pGb0ZReuaKt/XWUfTl9okxhtN6U6L
	eBXHs5P/Kb4ukNTqfuvdH1FScXkePU5XN9g8/ezMkV2XsLnRphyBwsPdJmxlP6M4
	/cVCcIa9zfnPbLjq5riBAU8YVdF/VU7FsN6gvCmb0W4WzJ9PMAopbECzPDUUKhJY
	rQgF+g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xrtd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 20:30:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBKUXg8012320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 20:30:33 GMT
Received: from [10.216.57.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 12:30:27 -0800
Message-ID: <38f94094-c8ff-4c5a-aba5-6cc5acb81aa6@quicinc.com>
Date: Thu, 12 Dec 2024 02:00:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs615: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>
References: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
 <20241126-qcs615-gpu-dt-v1-2-a87782976dad@quicinc.com>
 <573d254c-9478-400a-9811-d8de7eba6dcb@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <573d254c-9478-400a-9811-d8de7eba6dcb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pdNQlLHZDcohJTwOCTwOJWpFeFr-bAFy
X-Proofpoint-GUID: pdNQlLHZDcohJTwOCTwOJWpFeFr-bAFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=962 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110143

On 12/6/2024 1:16 AM, Konrad Dybcio wrote:
> On 26.11.2024 3:06 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 8df26efde3fd6c0f85b9bcddb461fae33687dc75..f6a3fbbda962f01d6cf2d5c156ea1d1d846f310a 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -387,6 +387,11 @@ smem_region: smem@86000000 {
>>  			no-map;
>>  			hwlocks = <&tcsr_mutex 3>;
>>  		};
>> +
>> +		pil_gpu_mem: pil-gpu@97715000 {
>> +			reg = <0x0 0x97715000 0x0 0x2000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc: soc@0 {
>> @@ -508,6 +513,87 @@ qup_uart0_rx: qup-uart0-rx-state {
>>  			};
>>  		};
>>  
>> +		gpu: gpu@5000000 {
>> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
>> +			reg = <0x0 0x05000000 0x0 0x90000>;
>> +			reg-names = "kgsl_3d0_reg_memory";
>> +
>> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> 
> This one belongs under the adreno_smmu node

Yeah, right. Unlike downstream, smmu is a supplier of gpu here.

-Akhil

> 
> Konrad


