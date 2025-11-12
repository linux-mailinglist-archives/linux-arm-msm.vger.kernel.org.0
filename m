Return-Path: <linux-arm-msm+bounces-81397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63FC51FC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A14AF3AAC6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29D730DD0C;
	Wed, 12 Nov 2025 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvZ2mcAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsQeLKLD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA430FC07
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946435; cv=none; b=UTeg9/vwZJ3g3lK/WDQdkdBrL3vfiZPfDCchm7z+u3ze5bLkzm9z5AwEGJuFdbvZLzQsbeNcZho2cMo0OPkgZwpN1Zm/Jq/28QRkA4iZWRsHp0RnAdmORsnAhX+BpzgC97T3FzJQNvLGNjB2b1JvGi66BqWKs8phcoa1uq1tqmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946435; c=relaxed/simple;
	bh=Z8ZdAGG4EyKf8tVMNLlOiWZmA/jRMp+kaNu5G+A0Vfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf5uyDL+1ZcsvnovImw4vXWuniA3ItRaetWzqKzaf1p9z+7VdrejV8kUgZ58iZ8bWy+IHYAoG/6hWKtLBDXts93XSBf9/wNFVDKssqXZDf3ioVYhBggNjMgrsEc9oAsj4RjDj5Ch3c/j/oeUf+Gfpnk8syT3XLEKKZr7ez9JSnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvZ2mcAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsQeLKLD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC4T84f3060194
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5gL8BGnvahOLcwAKb9JaCY7XjjVHbw8vJ21kFjLfyw=; b=JvZ2mcAjim4Djm0G
	bkDVQQBQY6tqUxDRvzHuPOg4UKulx2RGI6pI8zcXsITA83TqJobw3rMkuYGfWP9N
	vF315wdmChMmQeAn7N5b3SAO2qX8wNs6nDYAZwvmKDba7c0ygPs0ztmSOkD/uWfx
	T3lloEVwQwCV+Y0Y7ouEfmV4FRjIKDSzBPbPHBm8l0uOC85QAraMBq5d2vQuznPI
	CxYeTAKUNk3qQL9c756ACGNGFC2iS9o1PtuKuc+KESMN6JUrTJUibj067TqjRzfb
	YD891JV2zvZWz6ECu+uUDVLY8i4GsM8Vo6I6f+YR/lAKFuTiANmgbhgar1cmEhW9
	WS1IfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac988jvqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:20:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so2135341cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762946432; x=1763551232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5gL8BGnvahOLcwAKb9JaCY7XjjVHbw8vJ21kFjLfyw=;
        b=PsQeLKLDEFFKWnXn1zE2B5Ja6x6Y6Q291SuOoJb8sWjuEgrUjcHL/WxxuABgRyO30h
         YE9qfVMADSYsxaWuT6nChK83cZwYO/JiZZ3XAZrJx8RTSHPr4PvOx0dy7BrU+54PglRJ
         Tioc3Tj/9+2W5oRz5qRiiprhep9w+cVQrAwviCeaOz2WEeY35eqbfTxibjiff5GnZwiU
         JCqp8jmpqoS0p/r5Xe4fm3odd5WZmmZHqAITs+3IgfiY9NwDshZv62pW5HvxB3o4tp+S
         JBKj1GltP3tKnCepwk1iFWbvCJ3XpbNj+yjKLMktp+r8cUSDxJt1zPtKe4reejEgl3py
         nxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946432; x=1763551232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5gL8BGnvahOLcwAKb9JaCY7XjjVHbw8vJ21kFjLfyw=;
        b=DW/v7ied08c7E2X3cN4lM+z6oMCxHjwXTIm6WmqLUGSroftFaG2t1EYiR5Dxvqr71e
         S7gsslm9TqokQBNBtQ0A/H3uyTPuJL/v/rwmuaeQlxFO7lGqwERpdQn/g+5onlqYo43h
         OXJzzSqxGpxUPdEJ12ZVOisp1lpP0ygAUMNB52RfmwsZ58bFveEs9yLPOUbNRb8uXoWD
         XC9TmbOmcyKD49FBhAicQHwMDcgtN83Eaz+rfz15oNRidRnrLFwl9cHOIHJ7oDbJImsg
         I+FFGljfFmbTmnZRc6UnOj3RQ+Q0IYtV4klofx5BBe8FS+d9YNJJzohWAG6L8Vursw2i
         0ZQA==
X-Forwarded-Encrypted: i=1; AJvYcCWkcKeAIVJ9ng7Ma1qZUGQRw5nwR+6cbAWpgfSLqf3dsqv9iqm6TYON+q18PvXhHdqBetB5oqgU8XdrYQRz@vger.kernel.org
X-Gm-Message-State: AOJu0YwJyQUdT+78ehXmse4XowJa+s8AWzvFkd23Pi6pHS3ABbBgFMZ0
	VXlqjjxVjsrJMt0AcYV0RDKdYwriGsdGp2HlFD//JMX8Ldb++AM9G3YK9bqfiOfpCOCGbmm7x6R
	Sf1WzrkxsZ0MXTSI3L1gU1XONQY9Pwm0TKqFoaObEtspfOsHAim1JR0lIREntEVH3VP5X
X-Gm-Gg: ASbGncta7tE0kqoIwlPvpGiIUNCwOU9KJhc3avZBmt6/cNccLqDlCExD2qAKH5vU9ze
	GUwfGFM/VDZN48OYGnD9ZZfroxY7Y3UaAz45zgLKnX5lMNlXVuEWEhg2Znq50pUxRn9kUNrWBrF
	OsHctYfNH7+OWYVUBMQFMT5hgWPQGMcvf0sZXqxVFt6w14wfI7Nvrve3Jg3VYpBVZEEDMbTnrmk
	5FL593GWWoW4mMrVAzrpc9TC/6pOGaq2p6mlClnOOfepdxmpg9XsMp9TJKwrz0t8g79mRc4CLjO
	3GlCSNWRFCL3fxAj7YL6eoxjeeZWgu1TAMTAZ5VGtRUdxDHuYnRhnD+SxcW4dOI6Lts9s5jXv23
	zliNzRqEstRPs9P2rHrBc5E53aFYeRj01m6JpFLMKsa3+ROA0v5rWMgzv
X-Received: by 2002:a05:622a:1a0b:b0:4e8:966b:459b with SMTP id d75a77b69052e-4eddbc9b6fdmr20569011cf.5.1762946432211;
        Wed, 12 Nov 2025 03:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuxcDboMBlXZ8IfMpbvAVD/xCyC6PkgJofI6nYVfYXkD5ZeyDbBO/vyiqeNaeZ+hpdlaOWnQ==
X-Received: by 2002:a05:622a:1a0b:b0:4e8:966b:459b with SMTP id d75a77b69052e-4eddbc9b6fdmr20568821cf.5.1762946431714;
        Wed, 12 Nov 2025 03:20:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7327a48bc7sm321134966b.71.2025.11.12.03.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 03:20:31 -0800 (PST)
Message-ID: <4e9d15cd-1ef2-464c-b421-f8a333c53825@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:20:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] power: reset: qcom-pon: Add support for WARM reset
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-3-loic.poulain@oss.qualcomm.com>
 <740b9e7c-59bc-4a35-a268-526d92db372c@oss.qualcomm.com>
 <CAFEp6-12qN0=cv5=tPeVq3bVDLkaQDHLLCVQY4dtCTSvx+dPOQ@mail.gmail.com>
 <c1269f38-ab90-40d1-b5d3-39f546829d6c@oss.qualcomm.com>
 <CAFEp6-1+inMhsgjSqAZ+UDBMuNc9DA-jXFyqB=gkvYpSzW9Ukg@mail.gmail.com>
 <6daf722b-6b1b-4c91-b108-74793d930319@oss.qualcomm.com>
 <CAFEp6-0sbDj0C9KAMxq1mrGO9jGz4YDMqnf1AGVU49PyGzLi8w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0sbDj0C9KAMxq1mrGO9jGz4YDMqnf1AGVU49PyGzLi8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5fUD9Xian9s3Rzdn9zViksHQdDvKLFjJ
X-Authority-Analysis: v=2.4 cv=eO4eTXp1 c=1 sm=1 tr=0 ts=69146d80 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=oAzUKsySGAh57qx-K-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA5MSBTYWx0ZWRfXz0baQ+3qemYj
 jCEPGWZ9u7H1clXuO5uuuIrhTX5fmPabseZjqSHlgiMLdPF2ynwo2Qvw/DOHUEocqHijcsHrXru
 /+VKVOaJa/15TBKRTFA1+s4bxisifU90wTgKqCHrEFRGKF5Y+dwMbYpbOnRdWhC8H2fUcYR4raB
 ijC6DORp9x4uhTJtDK/aSPDWq63tWzcgrT0OrY0mSYg10V5z0XolX7PCC2IOd+b81Up0yL5sePh
 29WDVtjZu14734H9jRsl+RO2Mh9+LuirD6CTVU8ZUWZJn8k78tx7m/IS87L38JgdYvT5/gUJYQE
 9urAhiOClirKUvxXtItU5TwRBPvSCk8BBLFST+MOvTT6fvZAEC96wWLwZq4Pg3Sh3oKUl3PzG2x
 kXuL/AD7LrTgo/VAShi8qMaiOk9Tzg==
X-Proofpoint-ORIG-GUID: 5fUD9Xian9s3Rzdn9zViksHQdDvKLFjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120091

On 11/12/25 12:16 PM, Loic Poulain wrote:
> Hi Konrad,
> 
> On Thu, Nov 6, 2025 at 1:50 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/5/25 10:44 PM, Loic Poulain wrote:
>>> Hi Konrad,
>>>
>>> On Tue, Nov 4, 2025 at 4:20 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/4/25 4:01 PM, Loic Poulain wrote:
>>>>> Hi Konrad, Krzysztof,
>>>>>
>>>>> On Tue, Nov 4, 2025 at 12:50 PM Konrad Dybcio
>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> On 11/3/25 7:20 PM, Loic Poulain wrote:
>>>>>>> This mechanism can be used when firmware lacks proper warm-reset handling,
>>>>>>> for example, when the PSCI SYSTEM_RESET2 function is not implemented.
>>>>>>> It enables the warm reset functionality via the PMIC.
>>>>>>>
>>>>>>> This fallback is only enabled if qcom,warm-reset property is present.
>>>>>>>
>>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/power/reset/qcom-pon.c | 47 ++++++++++++++++++++++++++++++++++
>>>>>>>  1 file changed, 47 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
>>>>>>> index 7e108982a582..684e9fe9987d 100644
>>>>>>> --- a/drivers/power/reset/qcom-pon.c
>>>>>>> +++ b/drivers/power/reset/qcom-pon.c
>>>>>>> @@ -19,12 +19,20 @@
>>>>>>>
>>>>>>>  #define NO_REASON_SHIFT                      0
>>>>>>>
>>>>>>> +#define PON_SW_RESET_S2_CTL                          0x62
>>>>>>> +#define              PON_SW_RESET_S2_CTL_WARM_RST    0x01
>>>>>>> +#define PON_SW_RESET_S2_CTL2                         0x63
>>>>>>> +#define              PON_SW_RESET_S2_CTL2_RST_EN     BIT(7)
>>>>>>> +#define PON_SW_RESET_GO                                      0x64
>>>>>>> +#define              PON_SW_RESET_GO_MAGIC           0xa5
>>>>>>
>>>>>> Going back to msm8974 where the SPMI arbiter first showed up, these
>>>>>> values are all seemingly valid, so I think we can drop the dt property.
>>>>>> The restart reasons are set in stone too, and you can find more of them
>>>>>> in the register description.
>>>>>
>>>>> Yes, but this should only apply when the platform firmware does not
>>>>> support warm reset via PSCI, right?
>>>>> Making it unconditional would override the PSCI implementation even
>>>>> when warm reset is supported.
>>>>>
>>>>> The point is that psci_sys_reset() executes a cold reset if warm
>>>>> reset isn’t available. Therefore, our PMIC reboot notifier must have a
>>>>> higher priority than the PSCI handler.
>>>>>
>>>>> So maybe the alternative could be to introduce an additional reboot
>>>>> handler in psci, with the lowest priority, so that warm reset can have
>>>>> a chance to run either from the psci main reboot handler or from the
>>>>> PMIC reboot handler before falling back to cold reset?
>>>>> [PSCI-handler]->[other-handlers]->[PSCI-cold-reset-fallback-handler]
>>>>
>>>> This seems like a common enough problem, perhaps the framework could
>>>> accept EOPNOTSUPP or similar and try to delegate further, coming back
>>>> with a normal restart or so, if unsupported. Trying to make a special
>>>> contract between qcom-pon and psci silently will be very fragile
>>>> otherwise.
>>>
>>> I tested the following, as described above:
>>> https://github.com/loicpoulain/linux/commit/5c34ea54e1a21ff1192c3c341877b24eff5f80b4
>>> The only special 'contract' is the handler priority.
>>> If you can elaborate on another/better approach, that would be helpful.
>>
>> Thinking about it again, it'd be difficult to grab some sort of a handle
>> to the ""parent"" reboot mode, so what you propose here is good
>>
>>>>>> That said, we're circumventing PS_HOLD this way - is that intended?
>>>>>
>>>>> Well, we don’t have direct control over PS_HOLD since it’s managed by
>>>>> the firmware in our case. That’s why I considered using the PMIC
>>>>> software reset as an effective way to achieve this warm reset.
>>>>
>>>> Hm, so is there no longer a way to assert it by writing to PMIC
>>>> registers?
>>>
>>> PS_HOLD is a SoC signal, and we can maybe assert it via the
>>> MPM_PS_HOLD register through the msm-poweroff driver if needed (well,
>>> if access is allowed from a non-secure world).
>>> However, this would also require coordination with the PMIC driver to
>>> select the correct PS_HOLD action (shutdown, cold reset, warm reset).
>>> For that reason, I’d prefer to keep PS_HOLD based logic abstracted by PSCI.
>>> Using the SW_RST PMIC register allows us to perform a reset without
>>> additional signal handling.
>>
>> Yeah of course we should use PSCI where functional and available
>>
>> I think PS_HOLD used to be fully manual on old (msm-3.10) platforms
>> through PMIC registers. I see that e.g. msm-4.19 has an SCM call to
>> (de)assert it. There's also a "halt PMIC arbiter" call.
>>
>> (via drivers/power/reset/msm-poweroff.c)
> 
> Yes I could try the SCM call to deassert PS_HOLD, is it something we
> should prefer over PMIC soft reset?
> Asking because the implication would be a more complex solution
> (though not yet tested):
> - Adding reboot mode support in qcom-scm to activate ELD mode
> - Adding reset-notifier in pmic driver to modify PS_HOLD action to warm-reset
> - Adding reset-notifier in qcom,scm (of lower priority than PMIC)
> doing the actual SCM ps-hold deassert
> - Ensuring that PSCI is still used for cold-reset and warm-reset when
> supported...

My answer is unfortunately "I don't know". We should loop in some
PMIC folks that would know the difference

Konrad

