Return-Path: <linux-arm-msm+bounces-58122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF8AB8E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E51A31BC6BFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D049B25C6E7;
	Thu, 15 May 2025 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwMzc4Ld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D13C25B67B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331830; cv=none; b=osz77KT4gW6/qAgfCTOT29UXxbGPVpfM9zDA73DHfOhLuZHxi9I93iY7k8BpvcTk1a0+nA/sk56jPgpjgeFawlo4aA2o52B798JqsQ+I/jm+qLU/kZUaXLlyPLJZ6uU3ZBt5ZetZjXo1upv9AtS1WvmNI+8BU+QoKpsJWHsKjIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331830; c=relaxed/simple;
	bh=Z2zgZ20MbKzC8RsCCnFPqBCamGxGynTOl1qSbQCDhwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+x9egjrUoTvk/03I8RSFRL0v613BPWpiUHLOS+2OGtnqfoR1o5oMkVC3Ugolt9MWB8/7LydY5m8wrA2x8FCOTfswH+CsxHORTJi5IEO5mv/mN2f2NUpTckhVv81t3tTXVaFkCUk46D9JcoBfKzpNhF2CelGWqSlvgQP0b9GekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwMzc4Ld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFT2L026254
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO7osz8wRUJZDY0Z+dnUrmrOR+9j3qqdgRHC4Q77+38=; b=HwMzc4LdGegn2rqq
	nkZVXl5aFZQ6ueCZuOzufVXlUV88Vm4mLCc3lMLzS2Sm7FVtd9L/YGtAjF5NQRDK
	Re3k9oE+Y9EvziJl84rb9/9JjOZOQ+eKYkQLuH0sh2wvJWbx4Mqwtsn441p5L44r
	RYOGwT+cYYUzpdk6EH+K4PLWtT/mnK0ZMNLDy6Xlf+/kAersK5fvZKDCdGFavROI
	9fmGBO9TVvBgFXEwNK3Elilq5IbQPpFP5JOK9hLa6r1QAWtgwXahsQdNbh34p5my
	WyV+pLY7nB67LaRYrMdTC2wjasqhpR9hve94u1QU5sq8GxsIQYN6fQgSh9VlowDE
	MMjvVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyqapq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:57:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so31763185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 10:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331806; x=1747936606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nO7osz8wRUJZDY0Z+dnUrmrOR+9j3qqdgRHC4Q77+38=;
        b=aCNTtSBGwlUOxiNx9QHBbQqDYsPOY0xWxKwxuZlgAccSbyBZuGqipS+1a1S11sIYqf
         UErpVN4K/Bnu8jlBwTrvt+x0142gDZJXCWxjOBkx6Ns6VQ3BiXfmDMYQ51kRy2jqPr5b
         dtX0Ppbve1Odo4DyygtrKI6998JALDw9kZhJU/e35RFBr1FOKX1qlCtsYyASKOeOrJlN
         1ApICszS/8xFOF85VAti0sbecxMtKHORppAZ1EvrHydZj+z3nnaivIuFvTNleAFFyTWB
         lv3pFFxGCgea6LyWADgPusmXUWpe4buPSb5KLWAfwQ9ijvKpYNr3F5q3Gcu10p17q4Vd
         1/Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVx1tikeCT4iS+5XbtgUW54VlnJpv7bRsn90WR4+virAV5eKsd/3qsL0k4rRpJFM0dES8XYy0moK6cIugp4@vger.kernel.org
X-Gm-Message-State: AOJu0YyextoUnEDVgL6sx3ORLPLOWhbBc01XBrPT2bYsmK8xuI5R+vh5
	gMWJqRAFGgN1dSre9SzvO9y8h/m0CnV/ZO6YcgjUMHEHgafRF/XrUpir1zUxWbXkOCtTQYGnTgD
	0vWsqS1MeicyPxg8khWy5CBWw4ZW2UPjxh+cDfXgcaneualy3I1xeCdN4OPYj71EF05hv
X-Gm-Gg: ASbGncv8AsDssfnr+pksQUVEKGqju5hAnfajfer7fBvCFb3vtWXp0KuJ8R4izOH12xR
	MY8IWwh9hl3fKB1pRSEiTqPLtsxsKE9CbMOOzm/hz0Q2MRLK9n50L/cWiK9SsbpW+eveNKKsVfi
	kiSvwBiE7qwjIEKRVvAVGom106cBKEc8NBU4qgm0KfXjuGfQQEkdlfqu4J/GPp7j5tvf64oQKKG
	w+UXa7OEIK48c+WYKsr5YJHBaxWb+/Tj/j0BeKLuRKp9utAIxIPdqdwo/imQFJDb3Elkc3kReya
	1JL5dkaZtcBX+yrzvAIAntYpiKfyIg8vQ1BPeG64vu+sd9gCp0sKp/nqRa6MdCUKcg==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr25636585a.6.1747331806298;
        Thu, 15 May 2025 10:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3ibf+MjEukbdNgXoiuGdyW6XD2s0VHGguMOsCRyXNY9KKGsFmIMV8aCJE2HbDHDTsZjO7oQ==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr25635285a.6.1747331805816;
        Thu, 15 May 2025 10:56:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cdefsm22310566b.52.2025.05.15.10.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:56:45 -0700 (PDT)
Message-ID: <6d7b30b1-60ac-45bf-9ff8-72461f1b21c3@oss.qualcomm.com>
Date: Thu, 15 May 2025 19:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
 <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
 <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
 <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1oD8mFlw_pfc3AN3BR6DFZiuCOz-2hEC
X-Proofpoint-ORIG-GUID: 1oD8mFlw_pfc3AN3BR6DFZiuCOz-2hEC
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68262af3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=S0qm8UsrUeb_ptZHZhEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3NyBTYWx0ZWRfX7CBERrruR10Y
 PUJTuevb20g5Ac2DNyWj7PyIVLEa08wyMxZVrY7CV9F1ZF+kHDPzRU8xjRDT7s2ReqtAlUFurDN
 7+KwK6S+d6Asg3ihr5H5soDI1Zt1TQEalvLf+hThB5c3gCFlIMtVqF/rhVgab9aRbf25iphRJaC
 03dMH013Mk8VfqMacmJJlDtNRB5n3Zq7Zma89asLs/WJWk14hC6LvyiltTXKLF15F2lAkcVcu9t
 Ys78BQJntZYCD0bf7NY3sTle/ENxF/3H6Kby1XRoNf70fNsO25VR3xnNlTw6Oow2vU5AIlmB9T4
 jviSIRcGYFjbP+Vx/V/uNZUXN4yrLOUWPgXlox2Ehy+ul6DTCqxf9WSsC8pc+EtjerscmByGRE+
 uWXwzIhSUHZ3370xJJHpW6xeR9mgpRGk8daJ5CFHj8wDsSbMeE4lCXqfQIpW19b2MkSWIzR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150177

On 5/15/25 7:15 PM, Dmitry Baryshkov wrote:
> On Thu, 15 May 2025 at 19:36, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
>>> On 15/05/2025 19:18, Konrad Dybcio wrote:
>>>> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>>>>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>>>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>>>>> 1.0 encoder).
>>>>>>>>
>>>>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>>>>> bits, as they weren't consumed on this platform).
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>>>>        .ubwc_enc_version = UBWC_1_0,
>>>>>>>>        .ubwc_dec_version = UBWC_3_0,
>>>>>>>> -    .ubwc_swizzle = 1,
>>>>>>>> +    .ubwc_swizzle = 7,
>>>>>>>>        .highest_bank_bit = 14,
>>>>>>>>    };
>>>>>>>
>>>>>>> Add a comment and squash into the patch 1.
>>>>>>
>>>>>> I don't think that's a good idea, plus this series should be merged
>>>>>> together anyway
>>>>>
>>>>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>>>>
>>>>> - MDSS: offset HBB by 13 (patch 2)
>>>>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>>>>> - get a handle (patch 4)
>>>>> - resolve / simplify (patches 5-10, not squashed)
>>>>> - fix sm6125 (patch 13)
>>>>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>>>>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
>>>>
>>>> Does this bring any functional benefit? This series is unfun to remix
>>>
>>> I know the pain.
>>>
>>> The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.
>>
>> HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
>> should be good enough (tm) - I scanned through the values in the driver
>> and couldn't find anything wrong just by eye
> 
> Well. What is the ubwc_swizzle value used for SDM845? I think it
> should be 6 according to a6xx_gpu.c and 0 according to msm_mdss.c.
> Yes, higher bits are most likely ignored. Still, we'd better have one
> correct value.

Ehh, so laziness bites after all..

Unfortunately it seems like I don't have a good answer for you
- although I can infer a technically valid config for these
at the very least:

msm8937
msm8998
sc8180x
sdm670
sdm845
sm6150
sm7150
sm8150

with the ubwc1.0 platforms receiving all 3 levels and ubwc 2.0/
3.0 enabling 2/3

this however I'm not sure matches what downstream does..

Konrad

