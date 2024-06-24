Return-Path: <linux-arm-msm+bounces-23919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A4914835
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17808B24E93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 11:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F974137C2A;
	Mon, 24 Jun 2024 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XySVVeuc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C60137901;
	Mon, 24 Jun 2024 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227542; cv=none; b=OP2tFYQdGSDXbhxxoaO4UmKvx7/4M8wWcvl5TULzkBekzC/eWF2ot9kFPq5ChmvwLSNhkMwIqLJx4VoHxPzgZyXqotwBlVxh1vikQhzUh/mSR8SH7bnZlkz45nOFAr8qWsBtQjaO2b7VbP2IMN/8sa9CHGECcQ6PSv9R5ik4Y4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227542; c=relaxed/simple;
	bh=q+U3yN8gMGFBbMWuWPYKd/Spdf1yePuTY80TwZVFjuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JyOxQzx1VuljQEI/7kp+2HswZQynLeVTL5X6b1YE+4Un/2d6CUxOcTrtB+6CaF19HS8gSQDJW0ZWR+rDnLOZLDeTRcj3TX2rcflpurQNMbr1aABYlBaVoAaO3apXE8DcxVXJbGvGcyz7l72kcFqvFmrjNVJ5e50i2GdxXjR3gF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XySVVeuc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O8YVN3017098;
	Mon, 24 Jun 2024 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MFzAd64mgrFlVIMi+8KFIONtKYwyev/KOmYz4G/GFM=; b=XySVVeucPFzwhDOL
	sNZKAlGjQK32i4L6LgiNAzHDPRgHO1qkCIp2A+BUMR/h6Ys+5brCQeBdHjxcAKaM
	hWaFBjsfwgYYH44PzsYdBfrvL3lokU6PHPmGuhL+EwWqwgArRQqP2B+0Oal8vfvI
	NhJn/wF5dOKVb14vHrrnY7JYkgKREkBu9XzNUpd3CbkEEjDY5b2fiXv9WwXInH+s
	IULRGPQfL+4a437cUuNdG74meIqCxERi/aZ4nzMzFHsF/YDmsrzvvUewryA3OXok
	4Yvlpgx6G4osMdFnp4xxiVvJM7q2Tq1vyfUAUhe1AchWbWWFNZqC7ttlye52FIMZ
	C/u5xg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9b78v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 11:12:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OBCF7Z006920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 11:12:15 GMT
Received: from [10.214.67.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 04:12:13 -0700
Message-ID: <bc57891b-f318-4c4c-bae4-52617d5643ef@quicinc.com>
Date: Mon, 24 Jun 2024 16:41:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Add tracepoints in
 bwmon_intr_thread
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>
References: <20240619135140.3581119-1-quic_kshivnan@quicinc.com>
 <a30fb728-d832-4309-8415-a28fed301e27@linaro.org>
 <461966ee-11ce-45e7-8ea8-abbb71431458@quicinc.com>
 <e84c3ab5-4064-425f-8c04-1d49f0425234@linaro.org>
 <xigukwbvqld5snjykp6h7qwob3r55w4evacbrp7svnzkqrmau3@enk5xlu5bbqn>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <xigukwbvqld5snjykp6h7qwob3r55w4evacbrp7svnzkqrmau3@enk5xlu5bbqn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2G2DlhUoUlrbGLB7YSztdY4H8W5lPtB2
X-Proofpoint-GUID: 2G2DlhUoUlrbGLB7YSztdY4H8W5lPtB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406240089



On 6/21/2024 2:06 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 20, 2024 at 12:48:04PM GMT, Konrad Dybcio wrote:
>>
>>
>> On 6/20/24 10:55, Shivnandan Kumar wrote:
>>>
>>>
>>> On 6/20/2024 12:46 AM, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 6/19/24 15:51, Shivnandan Kumar wrote:
>>>>> Add tracepoint for tracing the measured traffic in kbps,
>>>>> up_kbps and down_kbps in bwmon. This information is valuable
>>>>> for understanding what bwmon hw measures at the system cache
>>>>> level and at the DDR level which is helpful in debugging
>>>>> bwmon behavior.
>>>>>
>>>>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>>>> ---
>>>>>    MAINTAINERS                        |  1 +
>>>>>    drivers/soc/qcom/icc-bwmon.c       |  7 +++--
>>>>>    drivers/soc/qcom/trace_icc-bwmon.h | 49 ++++++++++++++++++++++++++++++
>>>>>    3 files changed, 55 insertions(+), 2 deletions(-)
>>>>>    create mode 100644 drivers/soc/qcom/trace_icc-bwmon.h
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 242fc612fbc5..1b410c0183bb 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -18573,6 +18573,7 @@ M:    Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>    L:    linux-arm-msm@vger.kernel.org
>>>>>    S:    Maintained
>>>>>    F: Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
>>>>> +F:    drivers/soc/qcom/trace_icc-bwmon.h
>>>>>    F:    drivers/soc/qcom/icc-bwmon.c
>>>>>
>>>>>    QUALCOMM IOMMU
>>>>> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
>>>>> index fb323b3364db..9b5ac1e62673 100644
>>>>> --- a/drivers/soc/qcom/icc-bwmon.c
>>>>> +++ b/drivers/soc/qcom/icc-bwmon.c
>>>>> @@ -17,6 +17,8 @@
>>>>>    #include <linux/pm_opp.h>
>>>>>    #include <linux/regmap.h>
>>>>>    #include <linux/sizes.h>
>>>>> +#define CREATE_TRACE_POINTS
>>>>> +#include "trace_icc-bwmon.h"
>>>>>
>>>>>    /*
>>>>>     * The BWMON samples data throughput within 'sample_ms' time. With three
>>>>> @@ -645,9 +647,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
>>>>>        struct icc_bwmon *bwmon = dev_id;
>>>>>        unsigned int irq_enable = 0;
>>>>>        struct dev_pm_opp *opp, *target_opp;
>>>>> -    unsigned int bw_kbps, up_kbps, down_kbps;
>>>>> +    unsigned int bw_kbps, up_kbps, down_kbps, meas_kbps;
>>>>>
>>>>> -    bw_kbps = bwmon->target_kbps;
>>>>> +    meas_kbps = bw_kbps = bwmon->target_kbps;
>>>>>
>>>>>        target_opp = dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_kbps, 0);
>>>>
>>>> This breaks bwmon, as dev_pm_opp_find_bw_ceil is now fed a random
>>>> (uninitialized variable) value
>>>>
>>>
>>> Thank you for reviewing the patch.
>>> I didn't get it, still the variable "bw_kbps" is being initialized along with "meas_kbps". Which variable are you referring to as being fed to dev_pm_opp_find_bw_ceil  with an uninitialized value?
>>
>> Oh this one's on me, I skipped over the middle assignment.. Sorry!
> 
> Still:
> 
> CHECK: multiple assignments should be avoided

ack

> #57: FILE: drivers/soc/qcom/icc-bwmon.c:652:
> +	meas_kbps = bw_kbps = bwmon->target_kbps;
> 
> While we are at it:
> 
> CHECK: Alignment should match open parenthesis
> #88: FILE: drivers/soc/qcom/trace_icc-bwmon.h:14:
> +TRACE_EVENT(qcom_bwmon_update,
> +

ack

> 
> CHECK: Alignment should match open parenthesis
> #109: FILE: drivers/soc/qcom/trace_icc-bwmon.h:35:
> +	TP_printk("name=%s meas_kbps=%u up_kbps=%u down_kbps=%u",
> +		__get_str(name),
> 
> 

Thanks,
Shivnandan

