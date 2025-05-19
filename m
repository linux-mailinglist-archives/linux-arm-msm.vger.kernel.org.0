Return-Path: <linux-arm-msm+bounces-58510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A0ABC4F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332497A1451
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AAC2882BC;
	Mon, 19 May 2025 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3IWVzl4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9B28641D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673593; cv=none; b=kBlS5/LSp6tC8O9s7VkE5rni/ry9wow1CWaT1s+8kAYzXYz/d25gvP1qLlWTozxAHqUSqYAm+USKQg1QjzlDPp1qMV0WlSQF3igNDX9eB0BLkaZJ4Bj50n0TYULvaZflyXhXsHZ/H6JdusdeY2Dy3wBDh7mLGZU/poP2uYtcR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673593; c=relaxed/simple;
	bh=k+WX/VGR+GLyTcXpjgk0GiZP4ydVVhFRDfjsBGYfPvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRNvKqhnivKDF+EeiCTlfiT9WxoB64ENka2PG4NZ5EbIQZCUm2YK4E8ZoTNQxUkOXE6+GdGGXLfmxwcWEl9c5RD15rCYu6XOKVgXpS3d/H2emGPqI7yYG9jzRGLewgXUD/91HIUnU/sfolIRLR5hJFUd1q0uLTaj40VMcJQ7H4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3IWVzl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9iogJ005266
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mb4xLfXZNKPtfn9wmLcWyrskW+Yx8ILVuk5MPBj/GR8=; b=L3IWVzl42QPTsvqb
	hCmT8q7X/25zGTL2aMN3lLVLS1K+IxsKT4F7nzx1yTuXlqM8kfS1lduqhVdTM8zd
	zoxRxc3BmMrj5J5K6gchQzCskuPmr8cJE3MTxbODocuzCeZXFKj9jOZfmVNXvqES
	FTQNY+sbyk04EXbf6GtGO/42+UCcNjgJCz7Qw6O9rnWcPrpbykvUiMtpkKTraTZY
	itQuSPzRKAelUHUuv8LckKQ+gayHYEZC2Oo6QYkeGcBNmQ8RhIv6OdoStXYqskSg
	OqGKk3qdP+cCkzYT4hPq10ybt6c+hRZ8wX7AUEtX0i1t2Sy54uiTs4sCDfGcYKiv
	cijs5A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4w38m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:53:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so24243646d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673589; x=1748278389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mb4xLfXZNKPtfn9wmLcWyrskW+Yx8ILVuk5MPBj/GR8=;
        b=bh+8NOoQ8lZZppqtasJR3yZ/mxviMTfizEPQ/gpbUq9AiXLIgVicj/HD6CkYloKjMl
         yRXLC8aV3MFNAaA8k/TBCoOVqY0QtP+59EuBVFPCZjbAMfI2OEJir/zgc1TgvgnCk6x2
         rkLYeY+KzyKupL+38NNzHFprVGY3pvO1XrsF/nAL5Rssz6xXwpNupIZOsnywOWmiud1o
         GE/Kmm8su+8YekAN27WCV7VCJXeAoG7mdT0BzsVrwxXcN3ckpyMOfOP6gSazDEn13bbK
         QmpYPRPVcq8Aj+5ZwbO7rzkjhihFZpJOQRCyu/lnFWFa4ku7UHH8bpP0gUZ2PGlZLMqH
         t2MA==
X-Forwarded-Encrypted: i=1; AJvYcCUyL5jONPQ0klJSecm2Z8dIaRVL/AE1R8DXmJEWy+G9f/xMAlbrkeugxkdu0yq1qylg6wPXAnBXDl2u6yjo@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhP++dW57BVWya7CANDsghO7I3g9/hznSy1qVsLuPpjUar8U/
	ti2kRozcVY7mBBderGsLkZL8Q3G30KJCGCT5vbIHSgc/hVal5WVFuXFgAvHxzt0uf2NjyusllG9
	I0NTDNJfq9C+sfaw0LfaF94J2mGT2BbhYa0SN19eVDet1lOYXad5DQUlV3EvMGnMeeQMK
X-Gm-Gg: ASbGncuE/wIEAG8T7CQy0hEAwZmuUYrQcSTmvv84Keo31UMwx0xMxR6kxWyVHl3DwpU
	exlltIQq/qrwj9jd0UJ/5YkqM1IDow5WaS9bPJMhULsXZY6gOvR/Q9XZpYpLF5c7j/CwiSZ9Mlg
	GRahp458R+W0OIfR29C06rJCdpjaM8NK+StJqBgrtRn5R90uwy+YCFBKvgsVKaouqgCM439zpyQ
	lK+aSfb0aExMcd2QaRHYsZgJOItUbnUo3cPT8vut5k+a6MB7OppiSwhzJsyRH8pNJyCfkiLGIWz
	8kbbnz5kAOnST/yRuoHz9OfBATQ/IlLdJiD2T1mXNO5kkYCPKM5IDMyGlxl5ESOWpBh2
X-Received: by 2002:a05:6214:405:b0:6f5:3e46:63eb with SMTP id 6a1803df08f44-6f8b0833007mr195922036d6.13.1747673588598;
        Mon, 19 May 2025 09:53:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvIqC4SYEoxg7ld+LNMo4kHLPjNfRWk0GWcdCnLzJRTGyDzMhLlP7Cr3xiD3OkNvOQg+196A==
X-Received: by 2002:a05:6214:405:b0:6f5:3e46:63eb with SMTP id 6a1803df08f44-6f8b0833007mr195921246d6.13.1747673587898;
        Mon, 19 May 2025 09:53:07 -0700 (PDT)
Received: from [10.153.41.224] (176-93-133-115.bb.dnainternet.fi. [176.93.133.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702da4dsm1935650e87.202.2025.05.19.09.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 09:53:06 -0700 (PDT)
Message-ID: <7d7f1712-b037-4f47-96a3-e57a13b58295@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:53:05 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <ygd6givaigkmypmaufpeidkqauoujcndm2xemi5pm5zue6ou7j@zonusie3tuap>
 <b4dace94-afa1-4910-b77d-20de08b5a6b9@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <b4dace94-afa1-4910-b77d-20de08b5a6b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b61f6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wJfVPMc1y4yLOrLMgEZDyw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QqOX20ToenTIRIA7GcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rDg1fIYhBi0wPhOEGzvF9ltic-YFAiqH
X-Proofpoint-GUID: rDg1fIYhBi0wPhOEGzvF9ltic-YFAiqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1NiBTYWx0ZWRfX+6jRlXJzQDuL
 lmvI95gChEHqYdqpRwU9e00wAs0mYV0hwhjDW+JwijYazo2+HMJzTzNdel1KefUvqytHnJCY4p3
 6zJEsXYTT+T8OEB9H7db7H7bONhgHUlIZE5r1Q5UtGoonvyNreEDPSWZN5W7rlErwgnW0vxKU8+
 OgPhAyPgJaJA0iEedSSBfK8qBSAzPfQr+QveSgOBLaOXvWC77fIeShp395AWJV5nB24EhuJw5/H
 ZhcNiDz5phCjzn9vehYmqQh3hWc+PndrHh+OMLMZ22P5ClUGoIpU3riLls1RHNZZU+Vq78+HKc5
 qF6QBBhVCoLs0vjPG1O54ytSmPZ/PmyX2S5jFV1Cp5FhQROKjOy3f+0YdNo18zLmYd07r0ZeLtY
 JqWIHVFcMk0V2pDO6lepdmRzSQuzYCuBJxGTuiByhPOYGWQ2E2JPoeBj0o6RH1NNzAu4zLzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190156

On 19/05/2025 19:49, Abhinav Kumar wrote:
> 
> 
> On 5/5/2025 5:24 AM, Dmitry Baryshkov wrote:
>> On Wed, Apr 30, 2025 at 03:00:51PM +0200, Krzysztof Kozlowski wrote:
>>> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
>>> differences and new implementations of setup_alpha_out(),
>>> setup_border_color() and setup_blend_config().
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> 1. Lowercase hex, use spaces for define indentation
>>> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
>>>
>>> Changes in v3:
>>> 1. New patch, split from previous big DPU v12.0.
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 ++++++++++++++++++++ 
>>> +++++++++--
>>>   2 files changed, 94 insertions(+), 9 deletions(-)
>>>
>>> @@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct 
>>> drm_device *dev,
>>>       c->idx = cfg->id;
>>>       c->cap = cfg;
>>>       c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
>>> -    if (mdss_ver->core_major_ver >= 4)
>>> +    if (mdss_ver->core_major_ver >= 12)
>>> +        c->ops.setup_blend_config = 
>>> dpu_hw_lm_setup_blend_config_combined_alpha_v12;
>>> +    else if (mdss_ver->core_major_ver >= 4)
>>>           c->ops.setup_blend_config = 
>>> dpu_hw_lm_setup_blend_config_combined_alpha;
>>>       else
>>>           c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
>>> -    c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
>>> -    c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
>>> +    if (mdss_ver->core_major_ver < 12) {
>>> +        c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
>>> +        c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
>>> +    } else {
>>> +        c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
>>> +        c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
>>> +    }
>>
>> I tried picking up these patches, and choked on this one. This heavility
>> depends on the DPU fetures bits rework patchset (mentioned in the cover
>> letter, it's fine), but granted the lack of the reviews / updates on
>> that patchset I can neither apply this patch (and its dependencies) nor
>> steer Krzysztof away from basing on that patchset (this patch provides a
>> perfect example of why that series is useful and correct).
>>
>> Abhinav, could you please continue reviewing that patch series?
>>
> 
> I think we could have continued this series on top of the current 
> feature bits model and I thought we were doing that based on #linux-arm- 
> msm chats in Feb between you and me. Not sure what happened there.

I'm also not so sure. Krzysztof has been posting it on top of the 
feature-removal series, so be it. Let's see, how many patches of that 
series would be acceptable in the end and decide the fate of this series 
afterwards.

> 
> Regarding the review, myself and Jessica have discussed this last week 
> and Jessica will take over the review of that series and please work 
> with addressing the comments provided there by her.

Ack

-- 
With best wishes
Dmitry

