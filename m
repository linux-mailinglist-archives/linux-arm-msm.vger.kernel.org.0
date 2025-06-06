Return-Path: <linux-arm-msm+bounces-60486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B654BAD0445
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 16:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 147D57AB13E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 14:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8919C1C84B2;
	Fri,  6 Jun 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5tFHyqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0B1B4F09
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749221615; cv=none; b=mPBn6RR9j6jg0yanSbZwtDCIeSncJF8B+PYSPIsBsxG/YPtw2yJZPPzVmuXtDwq5On32WOCXYCN79m9sdj5ws05epjEIrz+220xwcWqtIN5OpXkozuBs0wxzA5+3qdanozbFcSOEsoYv88mW321ByN/E2mpM2Fl5xgTJj8gqzaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749221615; c=relaxed/simple;
	bh=w+Omoq+vlVHzV4IfFXuuzmED1zDs8T0KXnjptRaXDI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1EfnNujaxdS2iiy2bxaWfEZIEymWF83+Xr3g4DZiWU/Mpf7liJiQ4sgeA5FttGXxcERmwVzpuRRcRWKIhe/Ya0oRnP7vHLr+cWR1PfaFJMf5kVq1iXUKhj8OlZ0roskAcUPDritDExmeX2+UPiXROK5GhMEFjggbtOci+Rilbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5tFHyqy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1632350f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749221612; x=1749826412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuzIRk+RYz/0vZCl8riGldIGv+a0bdZGEeVS47CS15M=;
        b=K5tFHyqyz+Li74bh7idNremcXgPsTTUyBe+sOReCL+i/RLieixawvXkeMkYNcKZLJr
         4J/fusH1Js21c4jc6NHAwX6jZRtFM66/58X9AioEjIzX8CacYfj2BUz8nIkWzkzTUURf
         9k/L9iCUO8GqOJ0AIuXpn2K0erbw+Ikqj6fWkBOW8q7/Lw6ngVCbR6q6WTUghOogXRCl
         w+lA+GrBbNN2Igm3ZJXS0L2UxF+Y1s7+QgMSE3vvG5beCl1/FwUhcGNQNPxuITd0qu4r
         4NooCi1TPZMi9Wj5zyWsLMwboQnzGKwlnYoEME/Ri13j0Y7q95E6wz83TYGBJZLlbEmI
         RCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749221612; x=1749826412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuzIRk+RYz/0vZCl8riGldIGv+a0bdZGEeVS47CS15M=;
        b=qgeYaBQy8KjzCEQaXUD+bQEQ3ikrjbp34mEjlquE0yvEQs+FpqIlgqbc3WaRRgT+N2
         y2nLqfdStcidNu2p8lPqteL0nn63icdtRY/9Md0RwIeWNUm9+/OYbx9/NWzMV6B+TS+a
         2GXij2ISHAeHwkp7wjw9pHt3Cyz9pkp7j+6RUa2mKFeQlfolVkmrM41wfHZNKMP7UHZc
         seIXP5ILqYMIIfcgFxRGPqOcvBclduTbbRZ1Fj7yPHJFFepiBdbDrL5FdQhNNxLxbMBm
         6S4UokArfuUu59frdnzeiD4BUO8InLJYwq8gETG7yhg14wFv5vq/w27UrSt1n0aOEGDd
         1MDw==
X-Forwarded-Encrypted: i=1; AJvYcCX/OOUsw45nI+DRWYwdVTIfHLc5Yiebr05NOs1774AB1La7MZFRd00o2bGpPeRGL1T6OccdQCjAxGxe56K+@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfPG44PIL2qsPyMTUZWERk05G/VN2zdb/IqX1y8Z2ODdyA68m
	3BoT5BQd8+c2Tn9kvrvG9iSnYVBOvCJ+booe01JMXCRV28ylGH21ePDDx3Yt+PxjEd4=
X-Gm-Gg: ASbGncuYXINmUjiPeSf7Xk6BEd949bmed8yMxXocAntFfxSuafQ3xZkAFP8cHmXG3RW
	2ao0G3KWto0Hheml9Vhilhmd1PadmFnsoJC4GI6SuSKCZIFD012UrrH50xHbIWGpUF6jfh8oOea
	3YgmgIF+cwAfpXTz5TBv6XmVe5tkI5KD/FgleSrve2Pk8uW07pCUYO2DIpVXnh+VKFymTpNeZVc
	LatNN5GF1u/mNiaejzFaArLTQ3ub/JTQ/gD6aabrMFD3p7IUSx5DjTvTBH3U9Rl6xiYZzp366t1
	TuhRHW1jZwNSjita0Gpg8GX2zg3X1d12vrkqdrDO3eLoJBtO1nOj85WdZUyviHV4NQpN3pefSNY
	iskVANZtOpnAxTbuf
X-Google-Smtp-Source: AGHT+IHJ08jeEQm4SYRJvPv9bX9J+DzKe5Je/h7iSbK4gB1S4kbI0xJWpsKEGlbxxh3EeBz1RwbNiw==
X-Received: by 2002:a05:6000:2203:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a526e0cfa0mr7685880f8f.23.1749221611820;
        Fri, 06 Jun 2025 07:53:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323bee86sm2058411f8f.43.2025.06.06.07.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 07:53:31 -0700 (PDT)
Message-ID: <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
Date: Fri, 6 Jun 2025 15:53:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/06/2025 14:32, Renjiang Han wrote:
> 
> On 6/6/2025 8:56 PM, Krzysztof Kozlowski wrote:
>> On 06/06/2025 14:51, Renjiang Han wrote:
>>> On 6/6/2025 8:44 PM, Krzysztof Kozlowski wrote:
>>>> On 06/06/2025 14:37, Renjiang Han wrote:
>>>>> On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
>>>>>> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>>>>>> Note:
>>>>>>>>> This series consist of DT patches and a venus driver patch. The 
>>>>>>>>> patch
>>>>>>>>> 1/3, which is venus driver patch, can be picked independently 
>>>>>>>>> without
>>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, 
>>>>>>>>> which are
>>>>>>>>> DT patches, still depend on [1].
>>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video
>>>>>>>> core
>>>>>>>> on QCS615 over(?)clocked.
>>>>>>> Agree, so we need to make sure that the driver patch is not picked
>>>>>>> after the DT patch.
>>>>>> This statement is confusing.
>>>>>>
>>>>>> 1/3 states that there will be a fallback if there is no OPP table
>>>>>> present.
>>>>>>
>>>>>> Giving the code a glance, I believe that is so, freq_table should be
>>>>>> used if there is no OPP specified in the DT.
>>>>>>
>>>>>> I think we are having a hard time here understanding what you are 
>>>>>> saying.
>>>>>>
>>>>>> My understanding:
>>>>>>
>>>>>> - venus modification is standalone 1/3
>>>>>>     Qcs615 will fallback if no OPP is present
>>>>>>
>>>>>> - dt modification 2/3 3/3 is therefore also independent of driver
>>>>>>
>>>>>> ---
>>>>>> bod
>>>>> yes, let me re-spin this with driver patch alone. Once that gets in,
>>>>> will bring in the DT patches.
>>>> Did you read my feedback? There is no "once that gets in". DTS is an
>>>> independent hardware description and your patchset claiming there is
>>>> dependency is just broken.
>>>>
>>>> I am repeating this since few emails, so shall I NAK it that you will
>>>> address the main issue you have?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>> Hi Krzysztof
>>>
>>> SC7180 and QCS615 use the same video core. Only difference lies in the
>>> freq_table for the video. Freq_table is generally determined at SOC 
>>> level.
>>> The Venus driver does not currently handle freq_table compatibility well
>>> across platforms. This patch enables the driver to use the OPP-table 
>>> from
>>> the DT, addressing the frequency compatibility issue.
>> This does not resolve the main problem at all. If SW cannot use the
>> fallback alone, your fallback has no meaning and is not only confusing
>> but actually incorrect. And based on previous statements like
>> "overclocking" it is not only incorrect, but even harmful.
>>
>> Best regards,
>> Krzysztof
> The fallback is only triggered when there is no OPP table in the DT.
> Since the QCS615 DT will include an OPP table, the fallback logic will
> not be used.
> 
> Also, if the freq from the freq_table and the OPP table are the same,
> would it be acceptable to drop the freq_table from the driver?

If you drop the freq_table, you will need to apply OPPs for the sc7180 
to DTS first before venus or you'll break sc7180.

I think TBH you should add a freq_tbl for QCS615 and make it so the 
order of patch application doesn't matter wrt adding OPP support.

- Add QCS freq_tbl
- Add OPP support

Then do whatever in DTS, nothing can break in this case.

As we've established the fallback isn't a fallback because it falls back 
to wrong data, so lets fix that.

---
bod

