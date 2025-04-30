Return-Path: <linux-arm-msm+bounces-56263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE7AA4B5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 14:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C08FC16D5EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D125B1D8;
	Wed, 30 Apr 2025 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCOo2aW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1925A624
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016526; cv=none; b=ZZBmOIn8nfZ1XjYKWzUIdELte44voOlsx8K+b96KC1Ojm9kZo0gTWjaHDHVkxb2Fg6uIlWH2HXNYg/gEPMMGZJcRbPzxxRUloe4ZodWzYhyDSlzg5nS34uL26WW6u7ecZTzIrtpL4SPZukqb5AFcqHOwxuQrmEaKztt6/xC5AcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016526; c=relaxed/simple;
	bh=jEcC9UGE/YqMYrqwTIiNtzaSZ07n6/H/NMhDizZasxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFIrtlowdBSIg/vS01AeC9nB79F16PLbXs2p/mG8jzsjQN8pCV8bydmSeRWFv1d+5vhCSzJ48fD7Y1v3hQhNDQTQ20uZDNk5sFbhIa+lPdo1z5Xh3sr5EVsuG2AMZ6ytNwEqqwTVe1O7mR46XPN2icMELBtL4D/VkMwkX4gHDY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCOo2aW/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9csKP016182
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 12:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnlo59KsvGmoAJK5ykVOnV/qLVIIalGNC4+OxntEXxE=; b=kCOo2aW/dNR4HZBi
	hTvCsRcyGXI6Sr5fc1x0GWYvFjc6V9Lq1WrSbyvVXEAapiPIGUqnXXq/Eneyuds/
	eMmWZvRyBYy7LH6j760UO+GOoWz7Ab76FhnNgd9hfZiKGT/EmUqy2/A+B1GxZkbD
	oLmAVhlvc1COl6Sd7pBlGZI89TgZ1fpax5qbsPgvdi5viqcmMLugbxWBgQSBiYRA
	uBfAg2trRUMJ1ISyL0mbv0s71nUP8F0BtGgvTISxIBaTqIE/BrhnQa/hAnXVBjg7
	BImfF0zodWtqi82nB3kQbmOe+b97rBBh5RtJKXPxdUG71gIDeY9mqGq0SFfdu87b
	QevxqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubj5t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 12:35:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7789335f7so38295085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 05:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016522; x=1746621322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnlo59KsvGmoAJK5ykVOnV/qLVIIalGNC4+OxntEXxE=;
        b=V2OKx723s0Cgl0S9PN7C26EpOy1O9N8nxghvQFhJNqjmad7TqHMwJ1gUUfRFMx5ip6
         yRO8aVpePyFiok2RSqfDDnDq9PcMVdycqOBb9lxIm4dqSaqCiDD3ku3ehVu76NrxeYhS
         8mH/ZQHq040GjwI79UfIXLFQXUGmTZui7gGrUcqGa7r/bTCkbGFaY7RulYFMi3MxD9ED
         XwjBua/PgjlT7HrpJidwcS9sZQHQEwZsU/mApOwfy5AZTSAawblosTJaHne368wySva2
         ihYVwvh+KKMYW6Eox/UNepVpDbHDS66a8y25+x+B5aTPCz+TUEsT/INRVKE71mdSHrBW
         gvAw==
X-Forwarded-Encrypted: i=1; AJvYcCXkiIMm0jN644Go/sStPrNmZy4NQU5VWQQ6l65hav+kJ+aougnmRXiUnCquoPfvJdaUHk+9hpgYkYdvc+uP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5o8WzFcolienCyUlBdWzgzDxhLUhVwdouwNX0pwm0xpf7/Uik
	wO4QqQnDD6cDJy34EZdbeS+xo/vtwFgwJSDO1RY8OWjRs+Xo0goQ9ydqb7xGre1XB4V763rm6/n
	ZoNcE1Kgl3HPj2k8SKx+WghQXqC2lOCyQxXuTZzegxR3+CO16dEwrDnPjVb6xfmGB
X-Gm-Gg: ASbGnct73E49VEe+0GvUs1ZYc5jxOZVrW/XtlXhHQZQ2hWhlthwDF3JBAdM6qZTK8ew
	YrCyFvetL+iDCcW4lkMHmIMBeZ2cy/P5NnRGazN09yM0yz+KaVW/17ZY7tSZH9XPBYtF3bf40Ge
	EuPSjAAFbNjn5mVB16NDRyk9/0Hyw1r/13yw4quDRwhICfsFDcnXbA2dlBNTjBdEUT24o3f+uHt
	mfXCoU9BBVPE7UfQtaUtEGLQmtnzPHS3Y/BYY/rudH4VWFO4tzCMRcZlBc1bQv6RNtUPLE6RWVy
	mP12Sb2JLNmrL9SRimtomj9RU4OwHufua/ECPZwvvvNRvNMFzSDCCVrh6YnM0YKjMTg=
X-Received: by 2002:a05:620a:2722:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cac85a0299mr123370285a.8.1746016521542;
        Wed, 30 Apr 2025 05:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5YnBbAS+ImgEHeNjfO53rm94FOWqBYpnXyEX6Ie1ldv17RmYfaWc5AhrZsf2uYwjVaJF4eg==
X-Received: by 2002:a05:620a:2722:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cac85a0299mr123368385a.8.1746016521141;
        Wed, 30 Apr 2025 05:35:21 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm913931766b.169.2025.04.30.05.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:35:20 -0700 (PDT)
Message-ID: <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:35:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PnOtTYNMXnDXJSpu8_76k0D_7chK-pti
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6812190a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=_6aSloehX7qqCDj74gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4NyBTYWx0ZWRfX6SSvvNzeMQBN k6yN5mwtcARbJB5IpjQW1+2rYEYSZpF8one/hpMt8y6B+BmmMd2kdVBhNLVaNt7VPDO8mmPCfZT YRcx5PWSY1vlZkqlQ1qR25XaLLqkse75K7T5OdCnJH7zhQIDHLzYxVF8vgM8n8A84MakXlMAOt9
 VY6DnUv16oEm2L1f6rli+emPCk54PL3lu+pRN3bDdUsyZ9zdgrjwvBcJ/QRXKUMDQ22HArihBWA 2EcRTucMzqZhjJjQSMrBxxa+opDWazqcLw50DU1+f1aPz8nCPq7iACWktgiBwryh/F3efzMzdvS h1blmyHtnWicz2Ci7VbcxjO1cpken6cddjKZN2cj37aXxGSBrWL6D08JDuyQhLHv7teaVICIZ90
 r96YgTj79QSdhtL55M/+GmzwoSPusTpU2rFY/HsbmR8v9yTchk/nTJyu1OA5yZf//wUnuzuz
X-Proofpoint-ORIG-GUID: PnOtTYNMXnDXJSpu8_76k0D_7chK-pti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300087

On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 30/04/2025 13:34, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>
>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>> should be speedbin 1", but what the values are for said "everything" are
>> not known, so that's an exercise left to the user..
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -11,6 +11,9 @@
>>   #include "a6xx.xml.h"
>>   #include "a6xx_gmu.xml.h"
>>   +#include <linux/soc/qcom/smem.h>
>> +#include <linux/soc/qcom/socinfo.h>
>> +
>>   static const struct adreno_reglist a612_hwcg[] = {
>>       {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>       {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>           },
>>           .address_space_size = SZ_16G,
>>           .preempt_record_size = 4192 * SZ_1K,
>> +        .speedbins = ADRENO_SPEEDBINS(
>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
> 
> I'm trying to understand this sentence. because reading patch 4, when there's no match
> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?

What I'm saying is that all other entries that happen to be possibly
added down the line are expected to be speedbin 1 (i.e. BIT(1))

> Before this change the fallback was speedbin = BIT(0), but this disappeared.

No, the default was to allow speedbin mask ~(0U)

Konrad

