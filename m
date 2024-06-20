Return-Path: <linux-arm-msm+bounces-23337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D5490FFAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 10:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BF2B1F20FAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 08:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743EF1A4F04;
	Thu, 20 Jun 2024 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="COc42nn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA52D05D;
	Thu, 20 Jun 2024 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873797; cv=none; b=c68R4aogBO0KUuEbfd+xiXjdwi5Q67M8j84kkYHda3uXUnFjfA8A/Pyn/9prfxbEdeMP8BdFCmRG39K7NSTft/X6SVQ1iRegiQP6SW8AOG2rsXjbcD7tJqal6+6aU4R//yGS5crS3gcme1Q3nTa+OS2qWsRJkMIkWdfJw6a/TcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873797; c=relaxed/simple;
	bh=QlL4f7uAlCxHMvZhXgxAGFYV9KwkcOkyql3sPbp7knA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AZMZ/tijpN2FnkbPQH9aQpm5E9Yij2SPimcK4/lRk490KDwK09J1GijcjANfFNdcz619/KJOH7VGSDO3i8+g/uFA12Rf/9zuYTXoj2O/7oBsWO5yahFU1Q/Y+Jf765yaRdS6fWFkFbYe5aUg6dMxilmI4qnF4n2inAl7MPQMXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=COc42nn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K3BH8Z028488;
	Thu, 20 Jun 2024 08:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHzNJ459cj6SDZFGX4hm2DSP8m7fdo5A6UULRep+CCw=; b=COc42nn2qjraAmeE
	g8XskAw+Xn2tXc0QzYLSZwiy5uK+fck7JWPM/IJby94Ve7HMuu3yPFmG/jL7d7Zg
	9phn2ktMTniEUWV59NFtkWwbZeC+XTkCGU/MsVQUmAevpUBFJvlBMu5zHHjBHzCm
	JU0Bl/7nv6tqovwlO1Z39cLZJDVgq6uEhWRJY3Ypkt1lGN4knjUs4EEzN+3Wva4N
	h6ZHCxQNr/RCJhIoFy7xJ97tFwBBsT31JRzdugdlxnQCziyt044lJuUjOSp02n95
	TlPdClGE/Ve7T6J8v1sNwqzhR9dqtEtWBXIzjTPSnxzO5T5oeKtnoOIk87WbsTYV
	79nYwg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvba30sfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 08:56:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45K8uUNJ013870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 08:56:30 GMT
Received: from [10.214.20.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 01:56:27 -0700
Message-ID: <461966ee-11ce-45e7-8ea8-abbb71431458@quicinc.com>
Date: Thu, 20 Jun 2024 14:25:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Add tracepoints in
 bwmon_intr_thread
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>
References: <20240619135140.3581119-1-quic_kshivnan@quicinc.com>
 <a30fb728-d832-4309-8415-a28fed301e27@linaro.org>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <a30fb728-d832-4309-8415-a28fed301e27@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8esNfmx153UOE0FQsE12Lhk-F2t-GynN
X-Proofpoint-ORIG-GUID: 8esNfmx153UOE0FQsE12Lhk-F2t-GynN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_06,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200062



On 6/20/2024 12:46 AM, Konrad Dybcio wrote:
> 
> 
> On 6/19/24 15:51, Shivnandan Kumar wrote:
>> Add tracepoint for tracing the measured traffic in kbps,
>> up_kbps and down_kbps in bwmon. This information is valuable
>> for understanding what bwmon hw measures at the system cache
>> level and at the DDR level which is helpful in debugging
>> bwmon behavior.
>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> ---
>>   MAINTAINERS                        |  1 +
>>   drivers/soc/qcom/icc-bwmon.c       |  7 +++--
>>   drivers/soc/qcom/trace_icc-bwmon.h | 49 ++++++++++++++++++++++++++++++
>>   3 files changed, 55 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/soc/qcom/trace_icc-bwmon.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 242fc612fbc5..1b410c0183bb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18573,6 +18573,7 @@ M:    Krzysztof Kozlowski 
>> <krzysztof.kozlowski@linaro.org>
>>   L:    linux-arm-msm@vger.kernel.org
>>   S:    Maintained
>>   F:    
>> Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
>> +F:    drivers/soc/qcom/trace_icc-bwmon.h
>>   F:    drivers/soc/qcom/icc-bwmon.c
>>
>>   QUALCOMM IOMMU
>> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
>> index fb323b3364db..9b5ac1e62673 100644
>> --- a/drivers/soc/qcom/icc-bwmon.c
>> +++ b/drivers/soc/qcom/icc-bwmon.c
>> @@ -17,6 +17,8 @@
>>   #include <linux/pm_opp.h>
>>   #include <linux/regmap.h>
>>   #include <linux/sizes.h>
>> +#define CREATE_TRACE_POINTS
>> +#include "trace_icc-bwmon.h"
>>
>>   /*
>>    * The BWMON samples data throughput within 'sample_ms' time. With 
>> three
>> @@ -645,9 +647,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void 
>> *dev_id)
>>       struct icc_bwmon *bwmon = dev_id;
>>       unsigned int irq_enable = 0;
>>       struct dev_pm_opp *opp, *target_opp;
>> -    unsigned int bw_kbps, up_kbps, down_kbps;
>> +    unsigned int bw_kbps, up_kbps, down_kbps, meas_kbps;
>>
>> -    bw_kbps = bwmon->target_kbps;
>> +    meas_kbps = bw_kbps = bwmon->target_kbps;
>>
>>       target_opp = dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_kbps, 0);
> 
> This breaks bwmon, as dev_pm_opp_find_bw_ceil is now fed a random
> (uninitialized variable) value
> 

Thank you for reviewing the patch.
I didn't get it, still the variable "bw_kbps" is being initialized along 
with "meas_kbps". Which variable are you referring to as being fed to 
dev_pm_opp_find_bw_ceil  with an uninitialized value?

Thanks
Shivnandan

> Konrad

