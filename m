Return-Path: <linux-arm-msm+bounces-66494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD28B1089F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D97803A7E36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3631D26C389;
	Thu, 24 Jul 2025 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5co5boj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF98213E7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355358; cv=none; b=SMrqIpEjs2tbtYeoUV7w1+I+mS8MumrBsvUNWV7x7v/JZeGeKtjkxlazAF3sPja0EBwUx0dzgEedT9o3Vu6VkmTmMWb+V0+Ws4EC1u0Ka/zLrGZTXjf3dLksmO03GiK9tFSLucKKukcLzaz43xlVsdoZuCVhz67K5quBdQQut9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355358; c=relaxed/simple;
	bh=4MkEvu78QrUvExfpgJM10kwAs/6EItzsTbrSjSTAvhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgwB3ZJ+bnJQareL5EvIwNSc+rtlMQDlFPZLc9HTN9/XHXa42NuYbjv8i//1Ve3je3M3zyYViak7yRAhAbPCiXTSWqGqGRfaYrrfyleQPrzDPNPQeXBmNxOwEYGWI0OkAKkHbeZsXRwH1oLIrNtjny1rHpyduWAjvl0QLT/Lpd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5co5boj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9wtwL022020
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omoQ5joPArCteDC0YHg4O+qjve6IQsjjq+F76qZeAQA=; b=c5co5bojJjlNRKbP
	bMLUJtjLT0X1E/YOmJTps3XhNkUhDcAEqcWz1XcsAIhoWqg9m77xUCToYT3egYnt
	z8p6gpB37g+Isjuevyjg40D3W3+R+Ijhn8fzDR74NeDpG/MW8ZNnqwAwT28a/R/h
	3IJOD+OZJFjj6pBtHazcT8Mz7wfp+GsOZl22QEvYHNVHsxm2jeRCA5+QdjHRMrSU
	63M98ulaw+XRt8/xiP/kivVFlAHk5qGXAR2c8Dz7bhs2+Dex07cNbTSv/YdbyABS
	0vgcQ15Cdm9w43/ZiBuqNbbeFSPEe7WTNXCDHmlvsnttCQwhoTlrlP6Fz2aSMF1g
	2gHhuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dr8qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:09:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ceb5b5140eso162817685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 04:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355353; x=1753960153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omoQ5joPArCteDC0YHg4O+qjve6IQsjjq+F76qZeAQA=;
        b=Ra/WxWlsDPXZvJBv6Zp+LXowMTc0Vq3gq7csWm0vEHZ0vS6tcBVRhqlpvx3/1phVUj
         aQy+Grs9meUk/KNpYnv4C//qXhex477e0t1sOigcRkUb5GcOK3TiX6y7OcA0HIePieWM
         GJdqNcyONIUHm4TqVQVzWxSDYEdp7nBUjq02i7kvh22mj1vyGIWPO90B1XwCRC0X4jc9
         AykWNOQl6D41Wsdy1rMkojcd0xUzaNFgTM6aJV5nhW6Enew6wP9KaAE+7AtNQkXv4lWW
         QHPfCYnKd45In0bonn1064JAmDD0OQqpc7rfNk9T40q7NsWplZJVdrwrSHak4fHla2jX
         QKKg==
X-Forwarded-Encrypted: i=1; AJvYcCUjenMLNyg2xqwk/flKkisNINI8xPh3PXz7DnHtOS2z6P35Ad556TFakMa8oJuDXUKZy8ivaIUNdS0xiC82@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/c8W68ioBa9tJmf9odiMmhJ6twRfLVxHBmQCYaTKrtZ6G4+S
	uR2lBt/cHFcCEktSgQ8aNiu+kbYkuNZVGDLXQ8FThHCtCsU0FxWp9cNFV1Dan1QFyEdV5e396Ei
	g80BenIdLa+/0Upi6UN/89D5Toi/MKmNGM4uFRyR7OohLIVvP/wnIiKVFaz/qhW7wIoz0
X-Gm-Gg: ASbGncvlbRGgiQvI38yuhECfbqhrXUTlSYolmlvAAhjFecLPgAFGqSFdc4IhIfVyJBH
	otpaiWJ9wPvtqrmpu6OoYbR+7+mZU/eQa+ON9bgxWNQteN47gqsOwp0gB9zngaLYnit6gpF3mZ0
	KH9+kHtILcscjppGZw7x8IwuihDhFC8iXlP19O39nKe9iR9jLNbBKLDUm7R+fYglYg4d1YcYvga
	D35waJi6k0DzcHKS3yKHAYU1hasBnWYG+8FxIwauVZ0dQ6Rd3b1kFqPiSGQIqLRRLZ/ZJOy4GWJ
	IqSsn46wjrpe/xsTrei8L/z4h2LgxbraVGrkUQa/ClojobSLnCvLkB+2Zxr6peMK9DiCPCJitFw
	WvoO08ff94iWo2XA0EJafbZh3tuWffQUDhQypkmUZPjjTBTv/M/+5qtvJJLkLwzb9MQY4tCEXVB
	TSm16pISsBEXbs0WtvAgVs39E=
X-Received: by 2002:a05:6214:300c:b0:6fd:26bd:3fe9 with SMTP id 6a1803df08f44-7070075b46fmr88683596d6.36.1753355352900;
        Thu, 24 Jul 2025 04:09:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc/fYZ423PcC/MADtOutu923q+hqx/kNGi5uwxh6IK8njxLje60SRvGbbX151gfy/K27n6jw==
X-Received: by 2002:a05:6214:300c:b0:6fd:26bd:3fe9 with SMTP id 6a1803df08f44-7070075b46fmr88681936d6.36.1753355351070;
        Thu, 24 Jul 2025 04:09:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00:6f:d7d0:17d0:bfc8? (2001-14ba-a0c3-3a00-6f-d7d0-17d0-bfc8.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:6f:d7d0:17d0:bfc8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e08e81ebsm2577601fa.50.2025.07.24.04.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 04:09:10 -0700 (PDT)
Message-ID: <5d86adfd-e16d-4072-b5a8-4f128a2c9adb@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:09:10 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
 <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
 <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6882145a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=m-6kepI0FKUGdeIz8lcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MyZVB4apD2_Ldz9uY8ca0q7v03azfCyl
X-Proofpoint-ORIG-GUID: MyZVB4apD2_Ldz9uY8ca0q7v03azfCyl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MyBTYWx0ZWRfX56hx5TV48+Uu
 AwPXpd0MxX910lEQ6NfSsZf3ER/4WTwMl7U0FeKwlUc3rHgM/7Uc7wqcSVfCZIMI/6oEL4sFps7
 f2xrUwut2sFf+qcBcnSNWkz1DDRAs2j8j6r8LeORUDsiK1sPUM3eFSWmklBf2rz7q3zgGmMV/cf
 mJV0sGyhzvzg7vFvmx71mJR5E25s4h/yLbAwTd3Zii5WOuDK6/+XKdmGnzS3dutCPw6MFcjrXON
 tTVZqYuOyQyeWnUcfGpTtVeStNuJtnhRWOuj3fR38Yv9q3TJB9MPE200YPKDxbvNTE3ZE97CDTs
 BxnOOQ5B7boHPsAxfg8cCNw6svMCDQU7q7O1cdx0GVQN/0JwnjcKGhr+53vIieimc2oc+l3TfWK
 EVVuCZdZ8QhDui8Dhse7UPr1F71sHsMD/Qxyu0Tvc3gOzeUw7OddiThz/gs7+DnN3P1D62Bo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240083



On 24/07/2025 12:42, Neil Armstrong wrote:
> On 24/07/2025 11:32, Dmitry Baryshkov wrote:
>> On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
>>>
>>> On 20/05/2025 10:06, Johan Hovold wrote:
>>>> Hi Chris,
>>>>
>>>> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
>>>>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>>>>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
>>>>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>>>>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct 
>>>>>>>>> drm_dp_aux *aux, struct drm_edp_backlight_inf
>>>>>>>>>         }
>>>>>>>>>
>>>>>>>>>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>>> +
>>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
>>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
>>>>>>>>> +     if (ret < 0) {
>>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
>>>>>>>>> pwmgen bit count cap min: %d\n",
>>>>>>>>> +                         aux->name, ret);
>>>>>>>>> +             return -ENODEV;
>>>>>>>>> +     }
>>>>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>>> +
>>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
>>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
>>>>>>>>> +     if (ret < 0) {
>>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
>>>>>>>>> pwmgen bit count cap max: %d\n",
>>>>>>>>> +                         aux->name, ret);
>>>>>>>>> +             return -ENODEV;
>>>>>>>>> +     }
>>>>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
>>>>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than 
>>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
>>>>>>>>> +      * the sink must use the MIN value as the effective PWM 
>>>>>>>>> bit count.
>>>>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability 
>>>>>>>>> range to ensure
>>>>>>>>> +      * correct brightness scaling on compliant eDP panels.
>>>>>>>>> +      */
>>>>>>>>> +     pn = clamp(pn, pn_min, pn_max);
>>>>>>>>
>>>>>>>> You never make sure that pn_min <= pn_max so you could end up with
>>>>>>>> pn < pn_min on broken hardware here. Not sure if it's something 
>>>>>>>> you need
>>>>>>>> to worry about at this point.
>>>
>>> I'm trying to figure out what would be the behavior in this case ?
>>>
>>> - Warn ?
>>> - pn_max = pn_min ?
>>> - use BIT_COUNT as-is and ignore MIN/MAX ?
>>> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
>>> - reverse clamp? clamp(pn, pn_max, pn_min); ?
>>> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?
>>
>> Per the standard, the min >= 1 and max >= min. We don't need to bother
>> about anything here.
> 
> Yeah, I agree. But I think a:
> if (likely(pn_min <= pn_max))
> is simple and doesn't cost much..

Really, no need to.

> 
>>
>> On the other hand, I think the patch needs to be updated a bit. If the
>> pn value changed after clamping, it makes sense to write it back to
>> the DP_EDP_PWMGEN_BIT_COUNT register by jumping to the tail of the
>> drm_edp_backlight_probe_max() function
> 
> You're right, we need to write it back, but we can't jump to
> the tail of the function since it has all the pwmgen logic
> in the middle.

If you add 'driver_pwm_freq_hz && 'to the 
DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP condition at the end of the function, 
then we can jump to the tail.

> 
> Neil
> 
>>
>>>
>>> Or just bail out ?
>>>
>>> Neil
>>>
>>>>>>>
>>>>>>> I am honestly not sure. I would hope that devices follow the spec 
>>>>>>> and
>>>>>>> there is no need to be too paranoid, but then again we do live in 
>>>>>>> the
>>>>>>> real world where things are... not so simple ;-).
>>>>>>> I will wait for further feedback from someone who has more 
>>>>>>> experience
>>>>>>> with eDP panels than I have.
>>>>>>
>>>>>> There's always going to be buggy devices and input should always be
>>>>>> sanitised so I suggest adding that check before calling clamp() 
>>>>>> (which
>>>>>> expects min <= max) so that the result here is well-defined.
>>>>>
>>>>> Makes sense, I will do so in the next revision.
>>>>
>>>> It seems you never got around to respinning this one so sending a
>>>> reminder.
>>>>
>>>> Johan
>>>>
>>>
>>
>>
> 

-- 
With best wishes
Dmitry


