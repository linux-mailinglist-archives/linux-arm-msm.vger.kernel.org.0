Return-Path: <linux-arm-msm+bounces-23199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AAE90E8D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 12:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 455151C20DA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 10:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1439313212C;
	Wed, 19 Jun 2024 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aMj7GZRh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC6F4D8B2;
	Wed, 19 Jun 2024 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718794770; cv=none; b=SZIg1dsMuqjLBS3OegO/SyzIvKBHsmf3047FrOTtpJvSeRXSiI0VfhQOFIyrCRJBRLngXjTTHCgHWK3iI3b7VH0oE5BgK6xObl6Aha8HeUkjO0SQrO2Q8XN4ANBORRSy7wwQ1tFht75Jq3stTIguPuGS4nA6SWnDflINYOB6Sn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718794770; c=relaxed/simple;
	bh=9jOEVUD31Imf8SxLD+3Kml0LxxGN+C5ah7iPzoy7Hsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aT62zCSd/x/WVGCSuGKTKhTgGbKiv491/ETnKYOoRlZPLHwn7PW7r1wXAbmx3OJLbci2j+jBdu+jv7hMHGRVoQ1eaOKVr4pAgKc5Di9ZDkafEtVPDzmqr08DxYd1BQ4GmW8O2cQn7nOpnfWP14AxhxwFS082P+lRRiqDstTLcVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aMj7GZRh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9cjDw015872;
	Wed, 19 Jun 2024 10:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lGrRbSt82DV24hirvDuiK+n9P4dLi1X+Xg0imWi/zsc=; b=aMj7GZRhVUWMFzu3
	PcyhmFqE6bKUllLn7yRECCFIbk8fiazvKpEYCfeKFKsBHt/8mGzUlSnG+ySaCUvv
	EQoQ0zYsZWSltn8SaJwUwW03hOaTPzzQR1FbbQpyYCbP67LjOa8UQM9RSiLl3zH8
	syWtoI7BweV/EayfH/O+LHLmy1eUJF3Ijw9gNCPtIYD7B5yb6omnA2vzT4EKrXjL
	kRSYl8VHffkNA/md7orRYhpyF4SdoBGzLzvCdNRNIUR8COj9GV2FuGFqGpaIP8RE
	e+HiC7AKqWIp112XzVEfPy2se9mh0Lf10a6bHbtT3LomhWJcYkmVzp2y4KscMWCr
	mzQdsQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9x1eke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 10:59:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JAxNwO027917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 10:59:23 GMT
Received: from [10.214.230.142] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 03:59:20 -0700
Message-ID: <93c75e4c-0e99-b5a7-919d-69da89cbad45@quicinc.com>
Date: Wed, 19 Jun 2024 16:29:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3] arm64: dts: qcom: qdu1000: Add secure qfprom node
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240618092711.15037-1-quic_kbajaj@quicinc.com>
 <ZnHUFVFKTP+74Iie@hu-mojha-hyd.qualcomm.com>
 <ZnKvDZGuc7hojsCj@hu-mojha-hyd.qualcomm.com>
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <ZnKvDZGuc7hojsCj@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mgrIdms6X3NR4Yz1_WchXQNAPRhbYq01
X-Proofpoint-GUID: mgrIdms6X3NR4Yz1_WchXQNAPRhbYq01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=924
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190081



On 6/19/2024 3:42 PM, Mukesh Ojha wrote:
> On Wed, Jun 19, 2024 at 12:08:13AM +0530, Mukesh Ojha wrote:
>> On Tue, Jun 18, 2024 at 02:57:11PM +0530, Komal Bajaj wrote:
>>> Add secure qfprom node and also add properties for multi channel
>>> DDR. This is required for LLCC driver to pick the correct LLCC
>>> configuration.
>>>
>>> Fixes: 6209038f131f ("arm64: dts: qcom: qdu1000: Add LLCC/system-cache-controller")
>>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>>> ---
>>> Changes in v3:
>>> * Addressed comment by Konrad
>>> * Added Fixes tag in commit message as suggested by Dmitry
>>> * Link to v2: https://lore.kernel.org/linux-arm-msm/20240612063424.2494-1-quic_kbajaj@quicinc.com/
>>>
>>> Changes in v2:
>>> * Minor correction in commit message
>>> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240607113445.2909-1-quic_kbajaj@quicinc.com/
>>> ---
>>>   arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
>>>   1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>> index 7a77f7a55498..27f9fc87079c 100644
>>> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>> @@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
>>>   			reg-names = "llcc0_base",
>>>   				    "llcc_broadcast_base";
>>>   			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +			nvmem-cells = <&multi_chan_ddr>;
>>> +			nvmem-cell-names = "multi-chan-ddr";
>>> +		};
>>> +
>>> +		sec_qfprom: efuse@221c8000 {
>>> +			compatible = "qcom,qdu1000-sec-qfprom", "qcom,sec-qfprom";
>>> +			reg = <0 0x221c8000 0 0x1000>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +
>>> +			multi_chan_ddr: multi-chan-ddr@12b {
>>> +				reg = <0x12b 0x1>;
>>> +				bits = <0 2>;
>>> +			};
>>
>> LGTM, without this change, LLCC driver for QDU1000 will result in probe failure.
>>
>> Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> 
> Just noticed, sec_qfprom driver config CONFIG_NVMEM_QCOM_SEC_QFPROM, still
> need to be enabled.

Thanks Mukesh for pointing out this.
Posted the change to enable CONFIG_NVMEM_QCOM_SEC_QFPROM [1].
[1]https://lore.kernel.org/linux-arm-msm/20240619105642.18947-1-quic_kbajaj@quicinc.com/

Thanks
Komal

> 
> -Mukesh

