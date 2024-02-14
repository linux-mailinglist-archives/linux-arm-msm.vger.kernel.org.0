Return-Path: <linux-arm-msm+bounces-11108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71656855519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24E61282E4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 21:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F23D1420A4;
	Wed, 14 Feb 2024 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WhJ/BGlR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC921419B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 21:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707947035; cv=none; b=c/yPl0gBIwYoYXV0FvR4kGcejoAvkzuhmyhW9hh629IwP1rCIGsqeitfU7P/QAu7mCiSsM7hD5IkAdxOK0QRkOMKM7fuBvC1Yfpu0lvkNZN6aF7cxtSHF4q7qhZZ18KWK8f+pizehfcXuOcnpd7pKKfxliBiTkIZcHffDYA1Idg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707947035; c=relaxed/simple;
	bh=u/x3T5HDqGeZWo77Dpcyc92umvyPgChrrclu/5H3d/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+SA7HmBs0eeGDYXVkSo5n9tjvaPjAX7E0aUlEEnwX1v39PgWjSAyeNUvkQca2hbOlr8eB0D0BtiURCo75suBz+qfmv5vQnyN5HWetVzpg8LKxHYAdB4xEirdBlvhuRu4S+7leOB4vdjtYUaIVvZ44vFpFBI9z7O8Cw/y6Ak6Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WhJ/BGlR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3d664ccfcfso13733766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707947032; x=1708551832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPL/vERAXks4ai7t6/eyxOnWTcRhge6asVqZD2S4Ris=;
        b=WhJ/BGlReMNNksVybE/TPiO+r2bE2MZ4LtwIh1OILJy0FZwSJBuiv0BFGuiO0cxdcL
         osf9fNyCqkR4KfhY61Z4vZE7XjBhPVFQBhKZrPBxIpkeiNbRUeb8bnn+F0N2ylPJVaIe
         +Hb53DB4UXQ0n7IWdCdL5qhYClYoHUhwObCSNIAZ0FABY+G1H2QRtnkGW57eX8osV7M/
         W7VyJhuMRds5qHMUIfAddYK4fypR3VlX7KkHaIPZ/p/CYoLZ41/4SehwdGZXF4nReA9L
         yodToMuUQjZWK+Wv4+KE6gJnL4cRytlQkxnBJlCGlXVzYb0aWdc4GCeAMlFOibCiUuNE
         ksMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707947032; x=1708551832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPL/vERAXks4ai7t6/eyxOnWTcRhge6asVqZD2S4Ris=;
        b=rQWJygXb1qOggwAUQkcWF3R8iJ6yV5Y6+K5mKBabCiK1tgOVX9QUE0LHA9PzrmM7At
         hecv+oT69khH7t7Zpxwp2KmD+zlR1HD8BJbbiN667LES1ePKBlyd0YqpPQDtM9XunFgG
         3f19iynq6sRHFUvjt2QbflHjnDb+ybwbMvyAM0P/IybZhQqPuvfcVQceKoveMy+NzIEU
         5+uBaM5cLMUyc7bDZijxrcKLtgLbKz2e0ezXh93/5saK/dsMunDUmlIHqQ3BoLHdLhZ1
         0WY9034ticP4UOsKW9A58KZhy90JjF0yMz4zaGSIZBysuFPfeMhWMS8OsSjhlznHgknH
         4NfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuIrFAARLQtZcMzlFzAZWXA/5xazpZf4VzVr9ecJS6IbLUvdPst1aNRcbLfDba4Qspo6y9Nax/PLKzQKq8MTCXIZavImbxjM0FYpP+7g==
X-Gm-Message-State: AOJu0YzxHS92hcjMhnmYg3CJ99MaCGooFvFxFFpeSgvKAAQAzC9NJaMx
	IlE/vplw4YjBUyt6n8zx/Vp+5tGnWUHAi4gclj0m/ZmVAi1qzDbhqbwCb3sUM2g=
X-Google-Smtp-Source: AGHT+IGoPy+AaXTuJ9UIMaCXSUGA1XorD3ESHxHmJJDwKEX2Z+1e++bp3q68rQW7XBG2rN29vJ5Vkg==
X-Received: by 2002:a17:906:3591:b0:a3c:ed94:7672 with SMTP id o17-20020a170906359100b00a3ced947672mr3035179ejb.64.1707947032051;
        Wed, 14 Feb 2024 13:43:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1R7Q+NOhjaTkmTechEyQDazukoMviKX5j8inP/2YZzCeaS1hcXtEq1SwLoFKaird3WsifruzvZEh+3WupZoU478ReNQxxvCLLU6dW6p/z6bF9HsET0D8aOaR1aY4z/N6p6pOEQuOj0xWB87Ql/B5yRqypaXEdKUEUj+Ta534nNNrrxXwqJ6kyXCcoV9OJSfZJu03wy367SL195hjh7CFB4GF9pQWOu6Uck09LCywkbEWHngNjIZzN5DMn74GNjAS4AUfFbMohmUTwcodB7c6gnzTwOilGpJWmUDvItbRT3Hf6anjEn4GDht1jm0m2X9oG0VYCGyn0RfnrWv8q9MlccHVyGBaXwCbtC8Y+KR8qYJdNpucPD1yzJ1JCdW9hdHXofomjVcjKVT7H+Y9kNwANfZwNH2Us5RfegGCwaA4CrjppWnhE0IHnCzESDktYWA4hlxSALtZE9egFCPyXN0AwE5sba93bLd3VlwI=
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id sa4-20020a1709076d0400b00a3d841e627bsm51757ejc.58.2024.02.14.13.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 13:43:51 -0800 (PST)
Message-ID: <c6b0f119-237e-4493-8cd9-831252ad074e@linaro.org>
Date: Wed, 14 Feb 2024 22:43:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Venus cleanups
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <c12ce98f-d5af-4c54-a453-2416b85b4a5d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <c12ce98f-d5af-4c54-a453-2416b85b4a5d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 13:56, Bryan O'Donoghue wrote:
> On 09/02/2024 21:09, Konrad Dybcio wrote:
>> Definitely needs testing on:
>>
>> - SDM845 with old bindings
>> - SDM845 with new bindings or 7180
> 
> I can do 8916 for you but, I think we have these boards available remotely on qc.lab.
> 
> Could you test those boards out remotely yourself ?

As I mentioned in the cover letter, I am not sure if anybody cares about
this breaking or not.. But I'm willing to test not-deprecated-bindings 845/
7180.

Konrad

