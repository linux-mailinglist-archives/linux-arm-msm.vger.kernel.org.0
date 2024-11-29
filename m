Return-Path: <linux-arm-msm+bounces-39511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E749DBEA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 756382824D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015EF14B088;
	Fri, 29 Nov 2024 02:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mqIa3Sni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7059F42AA5;
	Fri, 29 Nov 2024 02:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732846855; cv=none; b=gnZJiU2+DMu+ipJPgm3TsNq5WUuZSUwiB028a9xUtDCs2V+ZJRH76kLhefoZtG/9WP82hXxUzvhdOEdbrkJShOFj++FErHUty2YpG22e+jqwVzYLTOk3/6QX9rsSvyrgD4VC5Wv1H5FUjyqKROjLdJXxh8H0z/OvzjBpy3JzPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732846855; c=relaxed/simple;
	bh=ydNZlkl3eUzpv7FePh+VVcbb1ePhZfcmPxayqxuOQPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=egV5kw7MY493QTyeNztsFxxEm5vtBoFIdO09nk2kb2O+3/Kq0QH8dDiW5iQbglT3OhY2QzLx7L17AeAvHBOx5NY3flrtKHWUnLsGy9fvdGa5Rz3AhYQFyCdp6x4YW+2j6AdYd6viBe1VOdHbHf/fYqLmcSbyXR1PL/i5iAU9oiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mqIa3Sni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMMssO028200;
	Fri, 29 Nov 2024 02:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrXm2D95YzK2XfL6//NbpfmH0gV9TCCoCZ6jVK/zfkA=; b=mqIa3SnimrG/wYhp
	TJt5FfXvkAbnc91gImT4m316X12LoL08h4q08seRT5WDTJf83+SbOJTnrrPcYnfi
	EiTQQ12UDy118XHRA8BH9MaglGmzLc3gmwEE6T95u2BYmLc4nnXxsavjZsPO3Rcm
	NjGZ1MsUHF0UBQ+uCadVFG3f0s+PCYo+d+tsbbo0uy4jL1tJqsZ3qWTcJ/4Uxo31
	mHGVMgLeu7rQMWuhyZ+dXNFCJlfeZvIRulG5UCGQMQ+eYJPm09ndFIHgT37O7Zji
	Gcnyvl7j5pNYKyBI3rDD1SRDr+k18i2ckggtmZ2pOr7xBlRAppauWLfPJcJgmooR
	yTjCdA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43673jc48w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:20:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2KkFp032347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:20:46 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:20:42 -0800
Message-ID: <7083653c-15c6-4971-b9ca-cd7fa02a9a75@quicinc.com>
Date: Fri, 29 Nov 2024 10:20:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-2-26aa8a164914@quicinc.com>
 <evzdrhzrr242ynfv6p4qhtjpgd4allzgw3osxalmtyfxzsjj2h@vingsirpf5su>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <evzdrhzrr242ynfv6p4qhtjpgd4allzgw3osxalmtyfxzsjj2h@vingsirpf5su>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7FY4LVx6QF9Uqp1KKhJ7dnSWgNtxdbXv
X-Proofpoint-ORIG-GUID: 7FY4LVx6QF9Uqp1KKhJ7dnSWgNtxdbXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=828 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290017



On 11/28/2024 9:12 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 28, 2024 at 04:44:44PM +0800, Jingyi Wang wrote:
>> Enable clock controller, interconnect and pinctrl for Qualcomm
>> QCS8300 platform to boot to UART console.
> 
> ... which is used on the ABC DEF board. The defconfig is being enabled
> for everybody, so at least let them know which board increases the size
> of the default kernel build.
> 
will add that
>>
>> The serial engine depends on gcc, interconnect and pinctrl. Since
>> the serial console driver is only available as built-in, so these
>> configs needs be built-in for the UART device to probe and register
>> the console.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  arch/arm64/configs/defconfig | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index d13218d0c30f..3d9e48940c96 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -608,6 +608,7 @@ CONFIG_PINCTRL_MSM8996=y
>>  CONFIG_PINCTRL_MSM8998=y
>>  CONFIG_PINCTRL_QCM2290=y
>>  CONFIG_PINCTRL_QCS404=y
>> +CONFIG_PINCTRL_QCS8300=y
>>  CONFIG_PINCTRL_QDF2XXX=y
>>  CONFIG_PINCTRL_QDU1000=y
>>  CONFIG_PINCTRL_SA8775P=y
>> @@ -1327,6 +1328,7 @@ CONFIG_MSM_MMCC_8998=m
>>  CONFIG_QCM_GCC_2290=y
>>  CONFIG_QCM_DISPCC_2290=m
>>  CONFIG_QCS_GCC_404=y
>> +CONFIG_QCS_GCC_8300=y
>>  CONFIG_SC_CAMCC_7280=m
>>  CONFIG_QDU_GCC_1000=y
>>  CONFIG_SC_CAMCC_8280XP=m
>> @@ -1634,6 +1636,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
>>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
>>  CONFIG_INTERCONNECT_QCOM_QCS404=m
>> +CONFIG_INTERCONNECT_QCOM_QCS8300=y
>>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
>>  CONFIG_INTERCONNECT_QCOM_SA8775P=y
>>  CONFIG_INTERCONNECT_QCOM_SC7180=y
>>
>> -- 
>> 2.25.1
>>
> 
Thanks,
Jingyi


