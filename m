Return-Path: <linux-arm-msm+bounces-55282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98AA9A506
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F303F16C99F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 07:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563631F5424;
	Thu, 24 Apr 2025 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mMyYm0Ep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6AF1F4701;
	Thu, 24 Apr 2025 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481378; cv=none; b=DgVbDBozO5X0MAjXweX9VK2XTbkAb3Q8eSfYJBiW8gtAtm1YqqBcefBxIavWx/avYXyhc+Qo7mZnNBmt22kp6AK5qG2KeTDMdqaklhew+ZfJKsqcHqnIXyMq/ImkGoRTsfn7TQYC5Kl7j5wvxu+sdwTGIKgqCNU7VAncvRhPgek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481378; c=relaxed/simple;
	bh=f3eIIVDimPRFiUePYtS3GnqRY+fghTickcLjZYIfygI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YfIv/mJCX+BUNOarlKpmzxZ/Q9+A+EfGgWltPCzWiA14qCrX487RrwY0TGGzWD3BIVXUNyg0wBHbs87xLg5+X4SX6HXZ1Lrzvge/rXH2u9JqaQiFpE4oAFY5ikzREngvKAmnJTYgF9zJfWCSRTN08BIFsd8/STFZbpatciNtaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mMyYm0Ep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F8nc010153;
	Thu, 24 Apr 2025 07:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDYVcaD2vgHMNkALouL+nXyl+PSA4fkxHhUjBnz1ibs=; b=mMyYm0Ep5uMkPPln
	uLDN4f6M5xdwP8l2coQKztvjoC8QI1VhlBZs2WYMQCmSeL9K6kIitlun2ojOez2k
	51pXhoOI2pOnTvhHjTJkL3Y+bPbZjFj9Hj2Si01Usd4LM4r4AaTHC+kCVNCJE3sX
	uER27aibYDEZP4rgs9lBupugC7qWDHBXZkaN1A43Mt/uxD9dY3gFH9zML1/p+d+i
	EIZqj2syBIMtgAe6M9H7PySW+1RtZgraV6YfM6137IhdkLW+37vgkfuq7i7tFdQy
	kH7ir8FR8x9FsPqzOl2SJgzdSHslfttH5Z7eT1CHFXU4jTjtCgitJwdXQns1TenT
	+D/V/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0cqr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 07:56:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O7uBWB008328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 07:56:11 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 00:56:05 -0700
Message-ID: <774c2476-937b-4d3a-b0dc-d66f12d9f60e@quicinc.com>
Date: Thu, 24 Apr 2025 15:56:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
 <654e4b69-dac2-4e05-bbe7-61a3396da52d@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <654e4b69-dac2-4e05-bbe7-61a3396da52d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J9UjFCVBTYp1o4G95W1CGXiAyle7td8d
X-Proofpoint-ORIG-GUID: J9UjFCVBTYp1o4G95W1CGXiAyle7td8d
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6809ee9c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=_vx_Gu03EpfxpjJPsgkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1MiBTYWx0ZWRfXykghJYI7SWYF DPP7WpT/NQvfHg5SovNtkpcLn2s9OI5aJzxcV4OnZTN8YwkxL+cMDD15co34ntIaWuAV4svAtLp GLRJo0Ksqk1LgCgCEtB0ZSIWk8wvPKwOFFJnY8V5aNuMIL/rMgj5rEcoNSt4miqVEnVO2/MJ+Wv
 AEMnRxdHmNsADwvAE5/TL3ArwzwLwg81BpkxdWDV31qODnmsM0sX82XDeyBsxyQJNBzhDpVxGuD jdJ73ayCDDMwTTSTrd98fssCBml3AytATFuqmIbm6MhgMD1lkxmoz9tqIhB7MhXOxk2WPFbttMR 3Q4dP4w9lRnvzWbtn9ML90fuA1R9vaQSBFPKy48JOUzkBogMQU8rQsu4n5a/w5rH8Sdz7nAj1cq
 FD+IqVZJNvcTRn51BNbu+zGYxwB0eAG0YYwvIFVnW8zQ4ZmuhSwsR/6QHLuOrmGOinfkChkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=949 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240052



在 4/23/2025 5:34 PM, Konrad Dybcio 写道:
> On 4/23/25 11:17 AM, Lijuan Gao wrote:
>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>> remoteproc functionality.
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index fe9fda6b71c4..c0e2d8699d05 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -503,6 +503,16 @@ smem_region: smem@86000000 {
>>   			no-map;
>>   			hwlocks = <&tcsr_mutex 3>;
>>   		};
>> +
>> +		rproc_cdsp_mem: rproc-cdsp@93b00000 {
>> +			reg = <0x0 0x93b00000 0x0 0x1e00000>;
>> +			no-map;
>> +		};
>> +
>> +		rproc_adsp_mem: rproc-adsp@95900000 {
>> +			reg = <0x0 0x95900000 0x0 0x1e00000>;
>> +			no-map;
>> +		};
> 
> Please double check these addresses, I'm not saying they're necessarily
> wrong, but I can't find a confirmation for them either
> 
After double-checking, the addresses match those on the latest memory map.
> 
>>   	};
>>   
>>   	soc: soc@0 {
>> @@ -3124,6 +3134,44 @@ cti@7900000 {
>>   			clock-names = "apb_pclk";
>>   		};
>>   
>> +		remoteproc_cdsp: remoteproc-cdsp@8300000 {
> 
> remoteproc@
> 
> [...]
> 
Understood, it will be updated in the next patch.
>> +		remoteproc_adsp: remoteproc-adsp@62400000 {
>> +			compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
>> +			reg = <0x0 0x62400000 0x0 0x100>;
> 
> The size is 0x100000 (1 MiB)

Sorry, my mistake. I checked the latest datasheet, and the size should 
be 0x4040. I will update the register size for both ADSP and CDSP
> 
> Konrad

-- 
Thx and BRs
Lijuan Gao


