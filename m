Return-Path: <linux-arm-msm+bounces-87352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103FCF15B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 22:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CBE300C5CE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 21:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB062F4A1B;
	Sun,  4 Jan 2026 21:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcbTp/Yj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DT4i9glH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51D12F1FF1
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jan 2026 21:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562938; cv=none; b=JArDIpGwgUvlCPWX6XONBMFtqmF08u5g/C9ndUDeWcKD2nJukLG51g1isSiN3FU2w5g8YzkEgnQQyP4qQCYM8efgz6KjLAXiRP5CV7BEhGSs2CqwwkHmdA57irFrpeclyzrqIEnlBLCEKMJ6rKW2eKjuj+wPcEhfKEhI0jtZ060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562938; c=relaxed/simple;
	bh=w16TMO27UtiBI3a5qt3dM5OuRXpQmCG+fP+Ljm2c6Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VokkP+0pl+Jw8VEpqyUs1Esc7f+8DQ4c4AOmpRt18shcycO8VaGE3/REwTGDGdPZHC2oxXarb80LvYMyVZPFBQwaEISKcZZOUwUAsmder8N+Rf3qi0k05WUqrQKIgYNuRUTR0XzrpYXTDS1N2oSq2BRAZNGXEBQr/6mSK1iUqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcbTp/Yj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DT4i9glH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Ku3so2991884
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Jan 2026 21:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rImH/2KlyvyZhocXv4tvAEkdDHKv39O59A2fFmYnOfE=; b=bcbTp/YjDkqO8Wub
	XcfrHgNSPDqCkudhNfT1jeejUvTPW2FRadXFWrpK22E6VO/cjWLU/dQtuEL5uLYG
	FeV/22K3iTwmkXxSQ3IyE7j24lfJUZqu3NGMQTpZ+Dd5IMN0l4k4cVQI3sby1FpJ
	VWOZqYOKoJtQNJg4D2+Mfc5mO2/QxARuipPKVyf8WXDZciyvOaJhCC3QnZRpsd+f
	Oee3UErhgEMN04n+jjRl0ucUW0r7mI++/ziL+D5c3TzvBfcudKnhvqamLakbC0RF
	Q0JoQrJ0+d5CP1ZcCWRpJSxikAaeuLZ3jwwHtB2AMf6vU6iXauyGiVQG/otGlKHV
	ChQSsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beteftjhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 21:42:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f2b45ecffso227563855ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 13:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767562932; x=1768167732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rImH/2KlyvyZhocXv4tvAEkdDHKv39O59A2fFmYnOfE=;
        b=DT4i9glHQwxVkxk0KyYUQpOVg0mmdF2hyMsudP1BU3LsZSTCZF7l9JEyj49L6jjbh+
         yxps/MbN/rN4Pk3cgpwMFv9HSYkaXSidDn9EdGR39C/EBDjgDSmRS943jJ33z8298u85
         NeCOmGYPmOunEfopLLDnofkM0/27G9nuOkB0SHZMobW7D79JECBjvaanBPMhN8wtouo5
         YxWJNZoSiuk/6Rao5pp8x0C2DzGNVJgN/6zqLHrS4KPKaB8XAPjKtB19THeL1ogJKeT4
         crQIoJ8B2vhOURvE3st3+AHHx1BdcAOYV3Os4BvWvo3F1/D91eeBJW/8oso4OiB7qfY4
         /maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562932; x=1768167732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rImH/2KlyvyZhocXv4tvAEkdDHKv39O59A2fFmYnOfE=;
        b=ewtXwymZVGs9EeGTu35Nvz6OKBFnesKByyz0OIGnaNOmQSZuZgb63LvGtqZo3xYKWd
         eoWczvK6W7f3HaiY/08aX4hJdj/C9h/a0QMVQNjcWf7v/fxtCQme+fDeH2Fo0iPAQQJe
         0S6dQ4Wt2Lia0l12Irh5GXBezJB1xnU7x7MXRfw3snL8qAMhEQZCGv1mV/9Mf4iGgWBu
         bXm8ddH416NyOyLljPfFwaI6pRexWetJwAiwvRG422v0oiYN6rZTmZ7E5XQW0jHv41YJ
         aQxJUfDG9buIKGH4uIrvfUa3Q7LA995DYCGORcQlhf2my86Cy0ScDAdZfqLJQoBk1o9c
         CpYg==
X-Forwarded-Encrypted: i=1; AJvYcCV19sAJwRRbQEAnmTAlXDQsWGANtiqKGzldYlLWlgtBTwzEBJTdHSl9jMsXQTPaLv1xflxOG7IUfr/73t/X@vger.kernel.org
X-Gm-Message-State: AOJu0YzrqhzeJYcnDqKLrEcCz0m2vBdK1U4/n7G3y1OvPH652pqQ7Ihh
	D0x1zfBJWXMhIbegmLPBGPmmhUohSjoik34Oa9/oAsvIVdh4varLfTeJhVJYuj12y4NX0iXIBdS
	gjH/TK2HU0rKPi+cQ0hhgLTyM659n0c3VpdsDTzaPJ7u8NaAXWuK1QI+B4KgT9m3Wa4E=
X-Gm-Gg: AY/fxX4nXPIdiYqF3aG+L+gYl4qToof4wSqdwU+F3knn+O/FsK4QzqWAwYyDZg2C8ZE
	ztMLqnsC2k9h+giwHHHFvFrqlyuxgZj6GtPETS1jKU4jYqXVM0JXDt+OiTaTCRZSLa/+0lfonBP
	OD+0NPIZK3ruIlNxOcFDKDQ+OXcGlhn+gxEfD0xG7cfEIp0nVLUu3Ha8ObU2tYhgi9mPkFAuUx4
	bwe20uUE+a0rySQtLFIl4iOE8i3BO8NpndefYMPyC9ccXyyuQSHb70VQSnzy8O8Sfl2ncCqnUjE
	pME6oty04p/zQWTuGYG43lzXezu8micY7FByKXuTDMic2fqm3JaoKdeyNfgkhCwUb64tu0TaZb/
	t+VY+P/tbj27DkOK+S7RKQ05Mdv/kqFaZ7Yc1cRxPri3OdFK7Ti6ugXXHlDLtXsFbgyFYkTfJ48
	2HqOLE9E0=
X-Received: by 2002:a17:903:244f:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a2f222bd48mr542175275ad.2.1767562932403;
        Sun, 04 Jan 2026 13:42:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6mzsu28xlvCSCcsYwKe8FITpxti/Q0k/fto0O4UNvWtGYcXQhJtAxHgDry153WPUw0oTW/w==
X-Received: by 2002:a17:903:244f:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a2f222bd48mr542175165ad.2.1767562931937;
        Sun, 04 Jan 2026 13:42:11 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a322d76a19sm379338355ad.101.2026.01.04.13.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 13:42:11 -0800 (PST)
Message-ID: <d6c7b08a-0577-47d9-9a3c-5213a002af61@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 08:42:06 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aTtn-x0hh18V7n7J@sumit-X1>
 <b29c97cd-cade-40ef-8e6d-d164b1d16059@oss.qualcomm.com>
 <aTtyR5J3AqXoE7to@sumit-X1>
 <7b074ee0-4f10-4fba-9680-3d87dcf766c1@oss.qualcomm.com>
 <CAHUa44EO8HYA=KgouSt902RJ63H-Vz24nOaaj7PATVT0n2fkeA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44EO8HYA=KgouSt902RJ63H-Vz24nOaaj7PATVT0n2fkeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hq572kTS c=1 sm=1 tr=0 ts=695adeb5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QEsY0_0xN9MvHtGfP8gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: mh753b_LCxtJpXH8UoNGYiETXSpIarM6
X-Proofpoint-GUID: mh753b_LCxtJpXH8UoNGYiETXSpIarM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDIwMCBTYWx0ZWRfXylLKAYPxwbWd
 a9A6/LY89z9a9VspDPdJyj1rFcdQ8YLFPPbbK/9QpKoXJjSFfhcs6DZ2B1eahyk2TDs2++hIIod
 CcbR7MvJCcVtLVsztsICvPxpLe2g2ar3SHgU3tt9koHc/7hBm+hldXMx+UIOAmrryJ+O0gJZmjk
 +GRHBAMBJsW5mh6k6lKM+2JsX7mdAPj2mHyPsjfeokr5HN23l50m3dAWwtuVMGMmUVUd7+gFBkr
 u6xDqTOXa66nNc8RNvq/EQxYc0M6RBJsz0O0A4Ju4KnOuVQIHXPj00rawobSGcmjr68Xo3P28V+
 XM37X+8XWgP84pDKYvtdrc666nnfHvejwOiHyzQpGDG0KtJuumI2yNpyQ5rjETwFuxvZ5ld9ha9
 eiMGkDlQW4CazlHnoBcuYBm45gdr9SMA9BN2yRUjv0ydKtdAh3NKz/MMUoCRDJZMze/Q8MMrMc1
 Ye0q9p1K+6eqE2ITqKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_06,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601040200

Hi,

On 12/16/2025 6:33 PM, Jens Wiklander wrote:
> Hi,
> 
> On Mon, Dec 15, 2025 at 9:30 PM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Hi,
>>
>> On 12/12/2025 12:39 PM, Sumit Garg wrote:
>>> On Fri, Dec 12, 2025 at 02:07:40AM +0100, Krzysztof Kozlowski wrote:
>>>> On 12/12/2025 01:55, Sumit Garg wrote:
>>>>> On Mon, Dec 08, 2025 at 03:08:45AM +0100, Krzysztof Kozlowski wrote:
>>>>>> Initializing automatic __free variables to NULL without need (e.g.
>>>>>> branches with different allocations), followed by actual allocation is
>>>>>> in contrary to explicit coding rules guiding cleanup.h:
>>>>>>
>>>>>> "Given that the "__free(...) = NULL" pattern for variables defined at
>>>>>> the top of the function poses this potential interdependency problem the
>>>>>> recommendation is to always define and assign variables in one statement
>>>>>> and not group variable definitions at the top of the function when
>>>>>> __free() is used."
>>>>>>
>>>>>> Code does not have a bug, but is less readable and uses discouraged
>>>>>> coding practice, so fix that by moving declaration to the place of
>>>>>> assignment.
>>>>>
>>>>> Okay I see but..
>>>>>
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/tee/qcomtee/call.c | 17 ++++++++---------
>>>>>>  1 file changed, 8 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>>>>>> index 65f9140d4e1f..8f8830f0df26 100644
>>>>>> --- a/drivers/tee/qcomtee/call.c
>>>>>> +++ b/drivers/tee/qcomtee/call.c
>>>>>> @@ -395,9 +395,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>>>>                             struct tee_ioctl_object_invoke_arg *arg,
>>>>>>                             struct tee_param *params)
>>>>>>  {
>>>>>> -  struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>>>>>>    struct qcomtee_context_data *ctxdata = ctx->data;
>>>>>> -  struct qcomtee_arg *u __free(kfree) = NULL;
>>>>>>    struct qcomtee_object *object;
>>>>>>    int i, ret, result;
>>>>>>
>>>>>> @@ -412,12 +410,14 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>>>>    }
>>>>>>
>>>>>>    /* Otherwise, invoke a QTEE object: */
>>>>>> -  oic = qcomtee_object_invoke_ctx_alloc(ctx);
>>>>>> +  struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>>>>>> +          qcomtee_object_invoke_ctx_alloc(ctx);
>>>>>>    if (!oic)
>>>>>>            return -ENOMEM;
>>>>>>
>>>>>>    /* +1 for ending QCOMTEE_ARG_TYPE_INV. */
>>>>>> -  u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
>>>>>> +  struct qcomtee_arg *u __free(kfree) = kcalloc(arg->num_params + 1, sizeof(*u),
>>>>>> +                                                GFP_KERNEL);
>>>>>
>>>>> ..this makes the code less readable with variable declarations floating
>>>>
>>>> Which is intentional.
>>>>
>>>>> within the function. I would rather favor to not use the cleanup.h construct
>>>>> but use explicit kfree() invocations instead like it's done in all other
>>>>> allocations in the TEE subsystem.
>>>>
>>>> Sure, fair. I just don't get why introducing cleanup.h without actually
>>>> accepting its explicitly documented style...
>>>>
>>>
>>> TBH, it is likely overlooked during review of the QTEE driver. Having a
>>> builtin warning for the undesired syntax would help the reviewers here.
>>>
>>> -Sumit
>>
>> While the style may seem unusual -- as stated in cleanup.h, using cleanup helpers
>> makes the code more readable overall compared to relying on multiple goto statements.
>> Also, it’s not just about the "__free(...) = NULL" use cases -- there are locks
>> involved as well. Switching to direct free() would require reverting those locks,
>> since mixing cleanup helpers with manual cleanup is not acceptable.
>>
>> If this behavior is explicitly documented in cleanup.h, there is no reason not
>> to use it as intended. I also support Krzysztof’s suggestion.
> 
> It looks quite ugly, and it can't be mixed with the usual goto
> cleanups (I suspect some care is needed with switch cases too), so we
> must be careful where we use it. It's not obvious that this pattern
> should be used in every function. However, where it's used, it should,
> of course, be used correctly.
> 
> Thanks for the fixes, Krzysztof.
> 
> Amir, if you're happy with the fixes, can you give your R-B for each of them?
> 
> Thanks,
> Jens

Thanks Jens.

Sorry for the late response, I was on leave ;).

I'll do.

Regards,
Amir


