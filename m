Return-Path: <linux-arm-msm+bounces-80605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77920C3B053
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 13:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08C73188B9A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 12:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1959B333452;
	Thu,  6 Nov 2025 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0JfQSKa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mz/ZYnSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4CD332EDB
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433444; cv=none; b=mhL1w9s323ZjRLOa06MMoG/RaOlV5WbjAhWU39USz5WJ+Pt4GIRodvHgwk311PbQbUq2RB3GsL1Gl9OjNXdDMBWqvJy17/tP/8fH/tWQ0N34vHsXBEEnwIXXJaO4yB7XEqeMQyEzPaRtHHdl4fDVc2ONqqaY/VIgkmq9Wg4E8+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433444; c=relaxed/simple;
	bh=QjhRddLZifMCPASnjvZfhckdalV2VV7RKm3V6+PnlCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbZfoD1lUWDGC5jN07ZX5jTXIsl/7fKf2WPIWkLJyXR6kSI6K/0+EHAcJCsAegbkIaTuzoTUVG2bk0N7tG1kn+HgWKqD25qT1n2CnRjpKqGeSSZfFL0GO2aEkXzsOOAxEICHlU9d7cID4MEuHRmFqF7LpQj050/8Bc5qS13DXBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0JfQSKa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mz/ZYnSg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68kKsT2326595
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 12:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLv4czebOcJ1bkV40M22vFw4BmTbiGkvM+5Q5UfbKWc=; b=T0JfQSKa+4aT0W+I
	70PgTr3KLJowgWGtSS/oJr8n7oOSIgN9ycAy0MRfGwcPYsZH/BKbF9+PM1VYYze1
	zSgKQTZv1iTQG0uUYB0bu0zLB4f8v84R6MGKMtuau5GODZQBS7NL/QFvaaty8a9/
	bYtDm6hJ1cm9tFpzKTINCJRZ1uJc2NPLJ9wkmtB7jX4vu1BKP3w+P7/yEGso/O+1
	vmnEFOJAEE/ukqEkWWLAuVKEPvvE7aNPuBpvBbM/Dyk/YAByvB1IWSBVe2raMoVE
	ylbuJfC7doUna/10ltIdQ2Zre94mJwNS+vnZwqmuAQVWpADETrVzRtkC9OAzU/ZK
	ujoGhQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h0v1w2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 12:50:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88044b68809so1146586d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 04:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762433440; x=1763038240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLv4czebOcJ1bkV40M22vFw4BmTbiGkvM+5Q5UfbKWc=;
        b=Mz/ZYnSgTgFhXzMrE/9ohxG9HPmR3k8qvYODsr9ce7D3+rzC7s9Ir1P4jmeA+kfwpT
         5o2F9B1/eDDhTxwJfFz6S5DdHyp6knmAI+zt1pWsGFWpY2S6WTHwsy+NEgs+EPx+uLhE
         x97YWW6ttFhlSCqncicuWbZlNudp0nRL6OtNMmoph4xAtNj/0nYlGSCk7zJ+0lTTTb+o
         xzMEN09hIjBnYwNPq4fzIBGK1LtjYV/nd+JKas29u2unW03xkPXdnnDOSrzxl5w3skC0
         Y8Knx7rj6mehgAJWaWf74vUYDEAtGQZO+My3RWfsjtgtGaMK9VxjG6QLk04JosZsB7hT
         +5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762433440; x=1763038240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLv4czebOcJ1bkV40M22vFw4BmTbiGkvM+5Q5UfbKWc=;
        b=qFTSIjCIm/T+TlUX84q/qqY1NjnHdrS8fBvaJw7Yj41Ecze7Q4LQfun5QdVhDtKyIo
         qgv59brIU52KbWM6JXp/wKluoipz7PVR7MEdgPhSTLF9MMlHtXtpytJB8HALlowrMnGX
         dxXlSik1mgZHltDU7iCPtSpn1Lcq0+vGw+41yE9EuEACKb39yVdtivli1o/BMMRpfWWJ
         gMxJsNsK9MJ94U1aJWdrM6a+T+lgL5jzSMGOBvt7V6h1d/Svtvl2dPCLs96wChIjhSc5
         R4NsJlxd0o4/BWsbkSExG8z/OVY9fVIAVE6guG6wwrYVQeHsMB9e9TGe5sjBDIlnspNY
         XEGg==
X-Forwarded-Encrypted: i=1; AJvYcCV9w8NB169ztXJI1w+TrvUKw2IFDExUBe4NAW5kO2JIAv3iwHZm6zfjkX37GnvqXEVuXcVb35xCCGumTO5l@vger.kernel.org
X-Gm-Message-State: AOJu0YxLt8qSru3JusQPeWQDmqfIfbkGUakISHmisZF9ISM2c0Kh4A4P
	NscMb/Sz1eRo9POrJOLWLXeBQOaUhqBAOc/IHt1Nhuh8RlVpo+E4JkbeWpOToFRualikbOgR3Rv
	XSw2K6B2RRdysYfjlEGOdu5UrKf3ak4C4kfdTiRUfLXQ1w9QwSGycmEpRdrI6SCDAUdHj
X-Gm-Gg: ASbGnctne06D+cIzx6L+nQLCKR7/KqmHKEOgFa6+lPYWmTmThssLS0+SKMwzKeF+niQ
	EjELIeN/qVBn8xlvibe9c5tzJO7mMdwPRF2qcnHfedjz5fWkK8jVNJaPeMdJhe0PZaTF8RObo5/
	K3gT0EeN4D8tMXRFvup0ho6BfnywkocvY2Z5FFgQn9fryWybj+lqPCGP87nlVedGURLpO2wE1+5
	KsTB0NtqMGWSR/8LCR7rhcAVfnwjvyv/Fw8eUTY+3uYz6iB2fMJ66nzBwR0zz07yIM2nno0jL+P
	rZn+hnHJ56kDfiAVNUYUhXpJuopMtdmxTCu3NZPtqbzsmWqBMXDZpwcNRy5IiJ1vvAoUzKxQJEC
	6OOwH1aCdwvQYOZSv0brnAG2V51ynHqfgE/bbIEA614yUdf2n8VzMEdJN
X-Received: by 2002:a05:622a:d5:b0:4ed:616f:3cee with SMTP id d75a77b69052e-4ed72337f67mr55385101cf.4.1762433440225;
        Thu, 06 Nov 2025 04:50:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT2vIG9YygP2Olu+GSf3c63TqClXz3fgZcO5rgUGPkJweGa77vgUrGV6B3ecaRpdRV47rl2A==
X-Received: by 2002:a05:622a:d5:b0:4ed:616f:3cee with SMTP id d75a77b69052e-4ed72337f67mr55384821cf.4.1762433439675;
        Thu, 06 Nov 2025 04:50:39 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm209044866b.9.2025.11.06.04.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 04:50:39 -0800 (PST)
Message-ID: <6daf722b-6b1b-4c91-b108-74793d930319@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 13:50:37 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1+inMhsgjSqAZ+UDBMuNc9DA-jXFyqB=gkvYpSzW9Ukg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wPTtcyNPLaHN6_5qUZk5FSWegO-OJF6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEwMSBTYWx0ZWRfXxz77clvC3EDg
 vdmH2C8ICE419pTB7w6Gqo9Jd4STrdGEfF1AF0D/5foS3Cn7ZNzA466LhEqw+bAHcleBz1Kc8HV
 U2Z771fJs6GHzreUuaowWh2Pe+tZyp6q0qIyIC0IqEvElSWpHOviTeqPsw+N1FII6b+FxRZQG88
 qbM+rpE/t4nb85VHmeurN/urYlen1sC9utnUuVUGqx47QUcWH7Q8eB17ljICQ3xylsakAtKE9/h
 s/4zt2Il6h1tsMBO5JNcrF6VKcsUQTZ2rJ83JedWiDyDDyTGC6yQ05bu82cQju+iNzOjjBmryTV
 /b8gmew087LIMDrAU+j/kGbmZatrnjq+WKnFttTN1HetxoBvHkIBw6xHqn6cEx4DPPIXIWEtK61
 uM+J4YgiGVIQXF4tdv8LVVwSwlLytw==
X-Proofpoint-GUID: wPTtcyNPLaHN6_5qUZk5FSWegO-OJF6I
X-Authority-Analysis: v=2.4 cv=PoyergM3 c=1 sm=1 tr=0 ts=690c99a1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=I94gCajLhTgFHMF_2yUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060101

On 11/5/25 10:44 PM, Loic Poulain wrote:
> Hi Konrad,
> 
> On Tue, Nov 4, 2025 at 4:20 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/4/25 4:01 PM, Loic Poulain wrote:
>>> Hi Konrad, Krzysztof,
>>>
>>> On Tue, Nov 4, 2025 at 12:50 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/3/25 7:20 PM, Loic Poulain wrote:
>>>>> This mechanism can be used when firmware lacks proper warm-reset handling,
>>>>> for example, when the PSCI SYSTEM_RESET2 function is not implemented.
>>>>> It enables the warm reset functionality via the PMIC.
>>>>>
>>>>> This fallback is only enabled if qcom,warm-reset property is present.
>>>>>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/power/reset/qcom-pon.c | 47 ++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 47 insertions(+)
>>>>>
>>>>> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
>>>>> index 7e108982a582..684e9fe9987d 100644
>>>>> --- a/drivers/power/reset/qcom-pon.c
>>>>> +++ b/drivers/power/reset/qcom-pon.c
>>>>> @@ -19,12 +19,20 @@
>>>>>
>>>>>  #define NO_REASON_SHIFT                      0
>>>>>
>>>>> +#define PON_SW_RESET_S2_CTL                          0x62
>>>>> +#define              PON_SW_RESET_S2_CTL_WARM_RST    0x01
>>>>> +#define PON_SW_RESET_S2_CTL2                         0x63
>>>>> +#define              PON_SW_RESET_S2_CTL2_RST_EN     BIT(7)
>>>>> +#define PON_SW_RESET_GO                                      0x64
>>>>> +#define              PON_SW_RESET_GO_MAGIC           0xa5
>>>>
>>>> Going back to msm8974 where the SPMI arbiter first showed up, these
>>>> values are all seemingly valid, so I think we can drop the dt property.
>>>> The restart reasons are set in stone too, and you can find more of them
>>>> in the register description.
>>>
>>> Yes, but this should only apply when the platform firmware does not
>>> support warm reset via PSCI, right?
>>> Making it unconditional would override the PSCI implementation even
>>> when warm reset is supported.
>>>
>>> The point is that psci_sys_reset() executes a cold reset if warm
>>> reset isn’t available. Therefore, our PMIC reboot notifier must have a
>>> higher priority than the PSCI handler.
>>>
>>> So maybe the alternative could be to introduce an additional reboot
>>> handler in psci, with the lowest priority, so that warm reset can have
>>> a chance to run either from the psci main reboot handler or from the
>>> PMIC reboot handler before falling back to cold reset?
>>> [PSCI-handler]->[other-handlers]->[PSCI-cold-reset-fallback-handler]
>>
>> This seems like a common enough problem, perhaps the framework could
>> accept EOPNOTSUPP or similar and try to delegate further, coming back
>> with a normal restart or so, if unsupported. Trying to make a special
>> contract between qcom-pon and psci silently will be very fragile
>> otherwise.
> 
> I tested the following, as described above:
> https://github.com/loicpoulain/linux/commit/5c34ea54e1a21ff1192c3c341877b24eff5f80b4
> The only special 'contract' is the handler priority.
> If you can elaborate on another/better approach, that would be helpful.

Thinking about it again, it'd be difficult to grab some sort of a handle
to the ""parent"" reboot mode, so what you propose here is good

>>>> That said, we're circumventing PS_HOLD this way - is that intended?
>>>
>>> Well, we don’t have direct control over PS_HOLD since it’s managed by
>>> the firmware in our case. That’s why I considered using the PMIC
>>> software reset as an effective way to achieve this warm reset.
>>
>> Hm, so is there no longer a way to assert it by writing to PMIC
>> registers?
> 
> PS_HOLD is a SoC signal, and we can maybe assert it via the
> MPM_PS_HOLD register through the msm-poweroff driver if needed (well,
> if access is allowed from a non-secure world).
> However, this would also require coordination with the PMIC driver to
> select the correct PS_HOLD action (shutdown, cold reset, warm reset).
> For that reason, I’d prefer to keep PS_HOLD based logic abstracted by PSCI.
> Using the SW_RST PMIC register allows us to perform a reset without
> additional signal handling.

Yeah of course we should use PSCI where functional and available

I think PS_HOLD used to be fully manual on old (msm-3.10) platforms
through PMIC registers. I see that e.g. msm-4.19 has an SCM call to
(de)assert it. There's also a "halt PMIC arbiter" call.

(via drivers/power/reset/msm-poweroff.c)

Konrad

