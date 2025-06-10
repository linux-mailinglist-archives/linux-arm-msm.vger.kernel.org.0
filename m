Return-Path: <linux-arm-msm+bounces-60890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8CAD4620
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87AFD7AAF4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29934286D77;
	Tue, 10 Jun 2025 22:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQ51gCR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0BD24676A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749595953; cv=none; b=hgKM/9UtFuTnCDqEQOpsve/fFDwXm50EoD4tY2i3kLMCoYmKCVtHM/0eCWXyaRKX+V3UZdet8Tz5bOpjdhKt0S2gydrS383EPcIrE3gIH46loe+JxXeuPOUsV0gWKdwdj/MIYwnnclazIIA9q1R2BD4ak6ZHfFDqcUCeX8z4SNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749595953; c=relaxed/simple;
	bh=dGvEL7VFQMEHyCl9uhKD2qLMJqcGj2fNl68zFI+CAcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/8OUwQTmdrDbC5ur2uScQ2cmBOct6xsGsnE/bJyMnkTAf3cmTFLumT8DHJ+bJ/FfLLHDv++PAcXM/oamoLNgrr74kePLwovXDk+SHI0sIi9Zwd5VyCF5aL75NWdL6hE3qXhyer+wmXRRks0misVYF5JCv+LLo4XMO4Qm9ghKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQ51gCR4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55328ae0473so846651e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749595949; x=1750200749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDzIKnfoXKVxpTDnGzOlzzRBRZz/lpcLf4ffLk3rm3E=;
        b=DQ51gCR4zyHBQsAO3THxmep1HOUDK+vpZCSjhA94cktIduNcodYUGsXUImm2utb1HR
         lNi594PgRpr0EaFMAxAXtC5hnKB4rmFzprNLmK+/3QLWDdtVAItrMfEJQ97SpG8vtrSG
         C5NRZ/QcOYRTX/FVO9JE3/3pNJJU8komB3YkQczkMF1ALSApqcvltWNYHAWDKu6Aybzd
         HxBRiVLaOF+mbs+JqROqeICRXVF9javIo8MWyFBe2xQIt0wW0c955Vr6X+eRS0Kh3w5S
         aoLP29XsVEdqM2yvJ2RqhrWMHW7XcKv3j0dfbx7CGRhhoFf6sq1t1dzl2kLAO/DJHvBr
         gBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749595949; x=1750200749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDzIKnfoXKVxpTDnGzOlzzRBRZz/lpcLf4ffLk3rm3E=;
        b=bjda7OpB84FnUqEdkTbaaW+zO/5kPqrWFbHBoidQKI0GmI07ZSMpMXcS9ysQXD+FBl
         HLi5XFegZspTpfVzCn74UBecUE+RX1CGb4RpE/RhA8qpvnPA81aQ6P6qz4kG1Bw3LtPE
         9Yvilc614jlPCoJDQbClLUMDOIUC2f/ZYN/pOh4DtfaEnHGVYwQiTtOTIRTGTSgxtkid
         QMG3oV9Pfcn2CVOEhpC7WUZCVBrISIwUdN3IiniUVLqOluzGkN3jofo0khztqgn3JH7R
         4Kw+AY3mn0iuWrTKFltucXHtSacZnXBHqpPz28VSiA1CzTiwthSD7fvSqeZ0ftygW1Uf
         MBYQ==
X-Gm-Message-State: AOJu0YxRON1TZF8AupRT2C91Pf/fHQHxmec6x1UMrRviEOB6BTtiQLqc
	Wen0zFhodgnR+9/eHJRTWe9YB3RRJdjjB85bSkSzLC7f9qqY5eEHB6xyDEEKOwDuU9Y=
X-Gm-Gg: ASbGncvmjcASMWGWNziun93yE1iELuH8XwhKiMTBsHRW0WimLpQCHryoc7ccm6+buUA
	5PMH9jzfK3VMcSvRyfhp37nVNVDRuuNV30npskwxLz7tFiXPO9hS0GCf3fxxXfXzNZCXZjI9j/I
	1mCpRMTfgvbE2v5ORxB/2+tCb7U8c4KLdmv0g5rFVPBBHeoT4tN/ZQzAaXP57DSwTEV5gGeNoxI
	BN9E3vbnypTAGSpOm6SQ+7ooyQhd4nZYa4+xa7AZOkl96c4c391Dk60cCkXy9eidZiE0ZDddiHf
	IGKfSjQ8HPVwJUwRDEmaD7YjxSo5859sUiNoh8I6Vk/J82rpULgXZKMtYPTYRoE4Cqq4lDcmFRK
	4A78lcVPJxtS2aKOmuPRJ4LyQjahrvHl/XWiY7Jiv
X-Google-Smtp-Source: AGHT+IEtuqJcRIG0E5fei0/F3drx/EifVxzaUFRy6V7mzVWAdahdyPi7wDfC9TSKmVZdcMYEaT5BQw==
X-Received: by 2002:a05:6512:39c1:b0:553:2874:8efb with SMTP id 2adb3069b0e04-5539c2482femr113667e87.11.1749595949406;
        Tue, 10 Jun 2025 15:52:29 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d03acsm1722972e87.32.2025.06.10.15.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 15:52:27 -0700 (PDT)
Message-ID: <13db6444-d9e9-4c37-a68d-7ed2c4d52ef6@linaro.org>
Date: Wed, 11 Jun 2025 01:52:27 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
 <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
 <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
 <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/11/25 01:17, Bryan O'Donoghue wrote:
> On 10/06/2025 22:13, Vladimir Zapolskiy wrote:
>> Hi Konrad.
>>
>> On 6/11/25 00:04, Konrad Dybcio wrote:
>>> On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
>>>> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>>>>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>>>>
>>>>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>>>>
>>>>>>
>>>>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>>>>
>>>>>> The expressed concern is about the novel label name.
>>>>>
>>>>> I mean to say the feedback from Krzysztof was that we should use isp@
>>>>> not camss@ and I agree.
>>>>>
>>>>
>>>> Let me repeat it thrice, it's okay...
>>>>
>>>> I don't object against the properly selected device tree node name
>>>> "isp",
>>>> here I object against a never used and very questionable label name
>>>> "isp".
>>>>
>>>> Please feel free to ask more questions, if you still find it confusing.
>>>>
>>>> Again, I may missed a discussion about the need to get and use a novel
>>>> label name, then please share a link to it, it'll be very much
>>>> appreciated.
>>>
>>> To hopefully help out:
>>>
>>> label: node-name@unit-address {
>>>      property = value;
>>> };
>>>
>>
>> Thank you, here is a link to the wanted section of the dt specification
>> for Bryan's comprehension:
>>
>> * https://github.com/devicetree-org/devicetree-specification/blob/main/
>> source/chapter6-source-language.rst.
>>
>> If for whatever reason a proposed "isp" label is preferred, then
>> since a label rename is not an ABI change, it would make sense to
>> do a massive change of renaming all camss labels. Otherwise there will
>> be an outstanding incorrespondence/confusion of the label names in
>> board .dts files, and that's bad.
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> Ah the label, I thought you meant node.

I'm trying to do my best in expressing myself by means of the second
signaling system. As an example when I write "a label" repeatedly, I mean
to transmit "a label" symbol, hence I hope it should not be overly
complicated to understand me.

It's great that the understanding is reached now, it would be better,
if we can save some time in future.

There is no bug introduced in this particular change, however it shall be
fixed and be resubmitted.

--
Best wishes,
Vladimir

