Return-Path: <linux-arm-msm+bounces-35823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB59AFD19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61E651F22DA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670781D31B6;
	Fri, 25 Oct 2024 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AUlhk/AF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C49A1D2B13;
	Fri, 25 Oct 2024 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846171; cv=none; b=p3X4Q7J4ktT/TwNWex/pvfb1DMOlO80IPZTWpz2ljYco3m6sn6Icn/kNcR1SyTTcqfcxtHUA5w8c7CbHIZz/PvgzfJIodLxWAaA+K6/5343eKjsIH66uhhKfBKWRVN1WFcd9eKpOO/Mdjw4l7tFCUYxM0rtZREdzSh7dl+mcRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846171; c=relaxed/simple;
	bh=A5x7JbW8OzPHcJUDztnr4ni7vd+G7hChdtbwOnoDrDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fUDCqfL/fsb8LUkU6p0lUEKDgUQPr1eYnLMu1p/KtbFRs5LrxoXnr5u2Sq96cHrJUwgZf/k3MYqDQh7QLoSj3oZX6Zl6zBFz8V4e3NI8LR7zlojBlTVPv3675NCjS2WqfcAFpsVrg88Kg6DOmCaErgq670Uprzc0lbs+u3P7ON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AUlhk/AF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OJWZpQ007404;
	Fri, 25 Oct 2024 08:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPNnpS0SrtTCNXFGOO26V132+UHssTnX0jhPMVaoVm4=; b=AUlhk/AFWF+lihbJ
	QicO06tT89rWLlLFwOlCCZUoSCvavOlK5MUMEnwH11ITl/p9lebZQc29xNzHvjuq
	IchKX0MgEB3mXlWug04bMZVCOipCVrcbL+aaI87ieD8h/klEO2ISnBrkWAiX3OVI
	LY71E2qvSunI4Efjn0f1DRH7ViH3pcqIf++0GvoQrmjSAPDPWH1Exth2Qr6vdZog
	3RlwfHso81goa1a5v6Ze0T/As19oHp7B4elwdWLll/le7s4eTTWJmmyBB/7miQV7
	8POVfUGe3gQwwIUx/8yrRNoxsMZ2QukVG4/HHxXRAl5nujSvEZGe3TtNEAInp+oD
	+9Qa8Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52k7ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:49:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P8nNsK012368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:49:23 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 01:49:19 -0700
Message-ID: <c5743db2-36b3-423e-a1a4-174c17689e9b@quicinc.com>
Date: Fri, 25 Oct 2024 14:19:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] arm64: dts: qcom: Update sleep_clk frequency to
 32000 on SA8775P
To: Bjorn Andersson <andersson@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
 <20241011-sa8775p-mm-v4-resend-patches-v5-7-4a9f17dc683a@quicinc.com>
 <amnapm4ig6ivhmle4tgywi2n7ah54cha3gpl5sowvf2rqvhg6s@7xg2afpus4ej>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <amnapm4ig6ivhmle4tgywi2n7ah54cha3gpl5sowvf2rqvhg6s@7xg2afpus4ej>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0JCPa7W6cHqzjB6bLuSNMMndBeks0FT2
X-Proofpoint-ORIG-GUID: 0JCPa7W6cHqzjB6bLuSNMMndBeks0FT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250067



On 10/23/2024 4:01 AM, Bjorn Andersson wrote:
> On Fri, Oct 11, 2024 at 12:28:37AM GMT, Taniya Das wrote:
>> The HW supported sleep_clk frequency on SA8775P is 32000, hence
>> update the sleep_clk frequency with the correct value on SA8775P.
>>
>> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> 
> It's generally expected that bug fixes are sent first in patch series,
> but perhaps it's fine as this is the first DT-patch in the series.
> 
> That said, the only relationship between this patch and the rest of this
> series is...you. There's no reason for sending this together with the
> multimedia clock drivers.
> 
> 
> Further, the patch subject doesn't match the expected format. It's too
> long (not a summary) and it doesn't have the expected subject prefix for
> changes to this file.
> 
> Please correct this.
> 

Sure, Bjorn, will update in the next series of the patch.

> Regards,
> Bjorn
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 0c1b21def4b62cc65a693552983ec0bc7eec697d..adb71aeff339b564eb3acc42a38bba2f03507508 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -517,7 +517,7 @@ &serdes1 {
>>   };
>>   
>>   &sleep_clk {
>> -	clock-frequency = <32764>;
>> +	clock-frequency = <32000>;
>>   };
>>   
>>   &spi16 {
>>
>> -- 
>> 2.45.2
>>

-- 
Thanks & Regards,
Taniya Das.

