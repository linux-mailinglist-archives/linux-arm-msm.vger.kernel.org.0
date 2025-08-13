Return-Path: <linux-arm-msm+bounces-69049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B7B2550F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 029981C26369
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 21:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B762ED179;
	Wed, 13 Aug 2025 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEBG+XJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E52C21D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755119718; cv=none; b=TDA/DLVBRWWEBCT9yeTy8cjTINzHzb8FeotvAGpv2Ms3vf17784Q5ZD+HqvJyyA14lzRvXVoWMRnpwLnLl9TpceNMwf0hFXMmyl480/2IdHa/y6NIB8pyKqvY5Cn2FkYMvbx33hlppX09DrYdyGIsSE8rS4n0XRDJcwoRGlL28M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755119718; c=relaxed/simple;
	bh=f0mOh5zW36wEzOojcDIcMa7UEWLFOqZuK/fsupPNmY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsZm7VYbyxntcaB7m8r7GF6Cxch0szKWgdhQLcdcA7K1Zj0UOxN3kZTmVgBI59urVJUJtB8GJZcMcUkSvAnBv5w/J1WEv1KMxAoja0lIJOHXZlMh4rlq6KVeISGk1G6Z4pOMLwI/7mdW2s6AyjsqniwYE0F49pwLAbAxbncG8xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEBG+XJo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b004954so1639505e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 14:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755119713; x=1755724513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ewofpmx2u2AWLuh72EpS+Kxy8uzpjMF+7SbnHvsYlc4=;
        b=iEBG+XJoLFsnrn6dm5Fsa2J/ukEKZdfxok99/Qz+ZSBT/ocPZbg0cyOtkO8wFB1KxC
         V3oC2YQBwEQUo2hGLlfssLsSgzJJV2AI0N1RT/sXR4WfEFRmX/hA8VvttnVRe032Y+N2
         zzgGyQ5h0GwZWuNI70flYcztveCpUA8hhA9ql+CCz5tFCVMfipttR+S+z7bfKHcpQguk
         D9rK2uXZtl461kj3WFMQ7hKMksw5q8UJ7Ya9vVG3BquGU1Cx5mYhGhJ9Iyc7ZV0Zjj21
         UpUlgmAxmXwh1WFYYQlopN+fXiKFIkHwVvdOP0ahGMk6YPSfSG3bxu66eiNgMC4EiTHo
         G53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755119713; x=1755724513;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ewofpmx2u2AWLuh72EpS+Kxy8uzpjMF+7SbnHvsYlc4=;
        b=GcfempU7LzztgbZU56vbvChMzr+hsGSBtsQN4oyTOfGfpL1cmkXku5LuKwbKnrIz7V
         kX+H4I4eHfIBe20MLm0kMRUQncinAX/i0WbSOPDabaB51cjvjidvq2MZzirdmc+MxpIy
         UECizzBQTUxts79Lt/Qjj/Wa8nUK7pVYDOnb2eJi5VRrWE5mGFAuXGTmj+ZdZXk8IGTu
         dgvSQCbc4gZs4Em0h/Vo4M4HpzWHxVdKlP7fAaCRQ9ImST/6remn3mCod8h6qzqs1MZL
         A+3u6MKOp4G67F0dheQvMoItUi7Y0FRVHEBz/ebNH5d383w/2cO0NgVQPV0UkTsgKkTN
         BfcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2jM4jP8HwIbTqDqVq+WJ8s+X2FCIAjqwRa44MgwQzqjuw5JpaZHT16GVsSMr/5+yvdwATifqNFIe7sTNH@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsPZrg6iy41vtnG5EZvUwcqEMztxDOR8B+YoH18be2bNRbfMc
	S2HpZ9j/72hQpiiU7D+N3lEc3R5MfgNMIrv1Q2NytBJhPs1hSg01UUCmGWv081GTx8U=
X-Gm-Gg: ASbGncur1+QWv6YadlknWZy6pyfG7cwp3db5EnkYSDpBtgCrIGZY6gUxp3GtNdC67U9
	CveYkta+jsULW5bR/oVQRM/PWFEQv7+mE3Ctp11w7TrXwvj5590+Ns+OwP5fRBZVnShPgwj5TDF
	+D9cOUtZqQCJ6bqg/Ly3vMT/EH0Cdu09GxLrt129d0I2seDhFDc9QKiel1zGUBov7d2X8vDcaPd
	ldnLCNXIjJh1Ygh7UEjEbBS7TJAhmXloi/ep8+hq1BxOxHKi5eTt8wi+RMgBwBudNgYfIsKT0EE
	8jXb5I1wyrPS+OtsJe9duOSdzlqPnCr5MhZmmxEvEw4nZ4fit6RmdIoLWvmcWOw55L5IgWEq3z8
	xZACMvNsDYsB3cPFVoHunN/HOVEXMAvSbU2ps5Bir2qY0FSh/dikpB2a387f0M25F
X-Google-Smtp-Source: AGHT+IESt7Dqns9DwMc5t6p93qJ/wntgnWbJwzl+NSSOoNpJ0QKJzEMjsB+Jf37ThCfpJRFyEsk/pw==
X-Received: by 2002:a05:6000:4283:b0:3b9:8224:d3cf with SMTP id ffacd0b85a97d-3b9fc2f813bmr578094f8f.54.1755119712975;
        Wed, 13 Aug 2025 14:15:12 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b91b05b28fsm2527911f8f.21.2025.08.13.14.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:15:12 -0700 (PDT)
Message-ID: <93e35282-52a3-4c3e-8065-b2a6c363c974@linaro.org>
Date: Wed, 13 Aug 2025 22:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org>
 <683024c7-3740-cb9a-6924-33816edd63f3@quicinc.com>
 <8d8dcaef-eb96-4e7b-9a0a-8b3836cb284c@kernel.org>
 <e33a22ba-f82a-412a-b1fd-d1cd50f6b21d@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e33a22ba-f82a-412a-b1fd-d1cd50f6b21d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2025 09:04, Krzysztof Kozlowski wrote:
> On 12/08/2025 10:00, Krzysztof Kozlowski wrote:
>> On 12/08/2025 09:54, Dikshita Agarwal wrote:
>>>
>>>
>>> On 8/4/2025 7:07 PM, Krzysztof Kozlowski wrote:
>>>> Add binding for Qualcom SM8750 Iris video codec, which comes with
>>>> significantly different powering up sequence than previous SM8650, thus
>>>> different clocks and resets.  For consistency keep existing clock and
>>>> clock-names naming, so the list shares common part.
>>>>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>   .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++++
>>>>   1 file changed, 186 insertions(+)
>>>>
>>>
>>> Query:
>>> Can the additional reset and clocks be accommodated in existing 8550-iris
>>
>> No, different hardware. Although it is hardware from your domain and
>> your company, so I would assume you know the answer.
> I guess I misread - I thought you want to re-use existing properties or
> something like that, but you just want to create one huge binding?
> 
> No. Don't grow these unmaintainable patterns. We have been changing this
> for some time already :/
> 
> Best regards,
> Krzysztof

@Dikshita can you revert here are you happy with a new binding or 
requesting in-line changes in Iris - my reading here is a binding is 
justified.

@Krzysztof 
https://lore.kernel.org/linux-arm-msm/fb8f154b-3da4-4bee-82e1-3a1597a35c46@kernel.org/

Are you sending a v3 here ?

I can also just add the OPP when applying this patch.

---
bod


