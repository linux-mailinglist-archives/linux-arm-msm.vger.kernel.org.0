Return-Path: <linux-arm-msm+bounces-56304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D8AA506E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 17:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 366E67A2982
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B8E2609C8;
	Wed, 30 Apr 2025 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW+UzbVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AE257AC6
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027409; cv=none; b=lC+di5VqlZRQkGudV35hqHuMFLkx7OlWI5sT73x272cD2BhJ1uodtVnOqLlgFG8JMDVMABnjoxiH+PvJOYL8drd9MTmVVTFDvsXxDMrc6L7AWbcRIQL/vD5DLkiQq9nbe47psO17Jgx9azFFt7pT5Nrb8FXY/3sbNCnyKynT/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027409; c=relaxed/simple;
	bh=XcW0QkwqVv+mxsmZ3CHJrD49am54f+e7taS3iNaQUFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5X7vyKjYWhXn6hmPCGewIryLEy/Xtq6RN6xsM98mJ7G/zlqDiAROPfZnhNX+qtZt4E9Uo/Wi3CDgZeSj31u+8u+1eOFl/Bj80ed42J0rn/eKSKx/HJMJENmqpvJzY36//z4XzoJvDXjNvNPX0Qd8ygGOUSm/AEihZ99+tYnBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HW+UzbVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U93npj032392
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 15:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTGh4TqbF63xwYUm3QG5BIwcl65sh+wxAUCOiZrYCSU=; b=HW+UzbVhvZ4IZ/iB
	vO4WYx1WSCJxYjgWru18fm1EdcXWRb+22zr7uW40wv4F0ogDZ3XK+Tp3sRnmUz1l
	p+8i5mUmQWOm3Bv7PKABYQ9YNRrV8zulnQEYGYldYEDPNCrRG9JhmYBVd9dLB6Do
	XyuqRJVFRJhhUEsCsnVJzOaHN+qnYBffdEsUDmHQRnwacD/TTijwlKziodOKvAlB
	juOcE9Kn4WFFSOcrxmDq3ivP2ur7fEyLpdzuCrTBzAq9/AObu26xo0BjtNtLuqTB
	39Q4LhG1z+Y4pHzRluWotffMt7Qb0PFgUiz9LPHTzIYHmKJ/L4NsDcybbaMV7cgf
	HqlqbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2apw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 15:36:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5841ae28eso108689385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 08:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027405; x=1746632205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTGh4TqbF63xwYUm3QG5BIwcl65sh+wxAUCOiZrYCSU=;
        b=bPTnMM5PeecP4V3SBf05Tptq4xpiCLZEvw6gDGjfg7lg3/SjkFymb7cg7Aw5vnvYg0
         xgUU1CJg+FUJ6Au+6/MT2mNuwVfZh6Fs+rRA/T93q5J7EiFR5aMT202d4OojZWlbd0ZL
         AT+ANZfTfrEy5jCoSPjipv3d1WS8wySFRE7i7sTiuX92qrorc0mE47XcYK4tdUbNRGCr
         x1b6dH2f4OoauqvNMvr3giLKQKzausMIn9nNqSRJzb/iPVRRh1SLoLymreI0QT/EDsA5
         0zc7SdGxt91xwusoXhDV3TxWika+qu3pZb/knqqYv2KPHgclR5fRSkdj7P6O13J52mUE
         rsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgoFyLCrQiBZY0F9T0c73qC/L+wnGlcNpegNHjBOC+i6YOS7NRyBF2fjqGS5X4memC8wdZ2SJwpJaekY8H@vger.kernel.org
X-Gm-Message-State: AOJu0YzkZQx7AHaNvh5QPZ0hl1ibQWGPwgrGn74oHOCQQ41/h9uH+4rC
	HRAP9vASOyGZvrBSX+NuRyRbU9JOK/r3RenCEGeh42P7WFZwCvCSP69WfQ3NlLeBgjbCwaPwASp
	B1WSYyrwB13jK51Dmixc0AJ0Pm2CkwvR1b4cVYbhCrI3Qq/B0pKeDRq65FBtMySBT
X-Gm-Gg: ASbGncsZriyKJQSZ/ayTi4OybxyYOIj1hpwF7LIzLNrfQAxy3tEOYrKWlm4XpV6+61Z
	mj/hj/dg90y8XFucoHRTBZyqUGzCZYBa5aBcfhl2K2O41aulF/azUJYQqtjBcOWuRtDAQ9/JjLA
	sERJ2TlDZoYFMeSLNhc3jMl4yyUTPqXFbU5aP38P6Hx+q7PiMzu5eR8x0w7hmm+VSPOY/vyR5YI
	Atf1IOjAMv686GAcY4nENnDQJ0lzrPaOvSvAlgqRjRwaPgS6ikLjHamo4GbGssyo/NN9wzETjDm
	Z+flxkf5p+DBPwmuZErGeYr7nVx/cisbv1epL7eNno4EE7+STw8JgjrGxYLpCyhXyNY=
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr46432085a.4.1746027405299;
        Wed, 30 Apr 2025 08:36:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdlzJzIfgOStzSFzks/Qe+xlSUuq+TMfHaCn0Fsor48lpZnfx+WjAEpbyBluclwVZNHNt8+g==
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr46430385a.4.1746027404834;
        Wed, 30 Apr 2025 08:36:44 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f703545218sm8711952a12.53.2025.04.30.08.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:36:44 -0700 (PDT)
Message-ID: <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 17:36:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
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
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XLr4q2PpV9coDtQRlJ7zBmrmUJDmC2W3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExMSBTYWx0ZWRfXylopQ5uAwHmK TX2l9UYpklf2U0GZTuQca9k2CIWzb0Px/PdDslduebmi3l9wf4GrJc5JT+G5GfXH3WYTmS4lqR/ G5zqJ+KTZILVR9Jpx4yF6+YYdopSkiFOVvAn2gVyYMLYHI7YKk31YBJmb6hDrXgM/wH+oI6B4NJ
 OAuPwCaHJ71nWY6NhhVHfoqP7gwD5SIQ9ew2r1xKZ5bPLEIgHrLvLhUG2SWcGcL2qo95vXnvCUm qrPwANoqqzAkEpW02ozACW1bJFa+kkv7niaEnHwhYOqjqnKYe6ICGU++aor2Ldc2tGVbuhIkjka JEA2nT4smg+ZCwHsKXYNTtINrLgWyOQnSA2mTiUEfxybwIznOD4pki3s332BfV1OtVsgaRZf8mj
 y3jAd6sojA5sA71obM1joVs8aCNNTVHOp54DcQam5B1iGk8ZwiP9jMw5mjFvdaim05+cjmIq
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6812438e cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=uyuhvXrvZAXgkk1q3UwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XLr4q2PpV9coDtQRlJ7zBmrmUJDmC2W3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300111

On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 15:09, Konrad Dybcio wrote:
>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>>>> Hi,
>>>>>
>>>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>
>>>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>>>
>>>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>>>> should be speedbin 1", but what the values are for said "everything" are
>>>>>> not known, so that's an exercise left to the user..
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>>>     1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> @@ -11,6 +11,9 @@
>>>>>>     #include "a6xx.xml.h"
>>>>>>     #include "a6xx_gmu.xml.h"
>>>>>>     +#include <linux/soc/qcom/smem.h>
>>>>>> +#include <linux/soc/qcom/socinfo.h>
>>>>>> +
>>>>>>     static const struct adreno_reglist a612_hwcg[] = {
>>>>>>         {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>>>         {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>             },
>>>>>>             .address_space_size = SZ_16G,
>>>>>>             .preempt_record_size = 4192 * SZ_1K,
>>>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>>>
>>>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>>>
>>>> What I'm saying is that all other entries that happen to be possibly
>>>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>>>
>>>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>>>
>>>> No, the default was to allow speedbin mask ~(0U)
>>>
>>> Hmm no:
>>>
>>>      supp_hw = fuse_to_supp_hw(info, speedbin);
>>>
>>>      if (supp_hw == UINT_MAX) {
>>>          DRM_DEV_ERROR(dev,
>>>              "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>>>              speedbin);
>>>          supp_hw = BIT(0); /* Default */
>>>      }
>>>
>>>      ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>>>      if (ret)
>>>          return ret;
>>
>> Right, that's my own code even..
>>
>> in any case, the kernel can't know about the speed bins that aren't
>> defined and here we only define bin0, which doesn't break things
>>
>> the kernel isn't aware about hw with bin1 with or without this change
>> so it effectively doesn't matter
> 
> But it's regression for the other platforms, where before an unknown SKU
> mapped to supp_hw=BIT(0)
> 
> Not calling devm_pm_opp_set_supported_hw() is a major regression,
> if the opp-supported-hw is present, the OPP will be rejected:

A comment in patch 4 explains that. We can either be forwards or backwards
compatible (i.e. accept a limited amount of
speedbin_in_driver x speedbin_in_dt combinations)

Konrad

