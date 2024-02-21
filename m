Return-Path: <linux-arm-msm+bounces-12015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928485D511
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 11:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E17261F287FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 10:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD354EB22;
	Wed, 21 Feb 2024 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nuvf1FKa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01BE4E1CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708509511; cv=none; b=UEKwT5KQ8Wiz3ITcMhKKDyui+ZIntZlIuhuElRdhkoyvGDb7A5rMi4/sWc8Wk53rxqqNrF6AZJoAwD3Cl2oMr1UT4nDYZegMoTkG1TxeLkfwm0CEHyQwvXJOnlEcSsKOAEdpSbbNds92gjzjugq3Eaz1TFKhL5yMam9GjtgpGUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708509511; c=relaxed/simple;
	bh=35UDvqaEjT+Hd/yr4gwYb/tZirZ1jaBXbFk85JTZ5Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJ6FSqe4VIb1JRhrU/43Qv1a0i0wVi/OmCBZONARN2J3jRx4cL2pBRe7wZfNHH17ki/2J1+eNZ7wgUaO6wev/31TVquza1ynEKCyNyV+5aXpbgNI5TciJZMtHGYMOkLVJDbiJBS8a06ixWeCUDDLdb8GsNAXDwxDHgM4ViIBQ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuvf1FKa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3566c0309fso761850266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 01:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708509508; x=1709114308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaQGx9XByKSc51LpkoUduPFIZjy4psowaw+hO7Oynl8=;
        b=nuvf1FKa4r4/MMeIxCeuchUOnHCyoyj/LoLrlMaOq1M2KNDg8k5Q6u12w13U7HfNmG
         iQM6ex6chyFu1pO9FNQxldlA40AmfFD0XGGoJbTUst5+Yzs37cEPkmVhRUocdBPa3bDq
         1MpkLwk8jiZqF6sKnMsG1h0kIOdtWO6jeQG/7EXPgVAO/868A08vy+UWW3NBwEAwyAiS
         KKoQqHi4eOJ0ftSTrt1HKoRXSg+tH9uaxrQkvb96RoSqqiFlw/5plc7OQlNKQiWuFhFd
         OWnrOGQfLgJDOVcUcoE42YXnHsaK8+GOUSRbdwru7HfR/KcC5Xy4QU9DTbbR1PTKn+z4
         o4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708509508; x=1709114308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zaQGx9XByKSc51LpkoUduPFIZjy4psowaw+hO7Oynl8=;
        b=efrjUD1Pvs2WLO2whxEz0mCP2n+3NemvxrAbCqqNWgu1O7JnvQIwbozrNYxprwaosE
         1t1SxhSF7i52QcDfgbZXNUCAobDJ3/V/q5V9v3VTe7GlECvC+ewy1Sh8qnRWhvyZ8mDE
         1p28d4kzE94rTBwv5IBPb47SodATnI+fMaHMu0SGsZm3QP7lkQpm5X7X0GFqDH+CVbKJ
         Ke8eS6l/i6IuK7baqKf+UDMZ9TxciWjcz9B3CD0QcY8+5Two864jB4yQOi11p4AB3ng9
         Vv8sYCtiL7ZBm/SMm+UWP/NRlAaymbpNVRx1nCkMpS1Inb9R/KNZuKgkJUPzu+7dpSLO
         jb1g==
X-Forwarded-Encrypted: i=1; AJvYcCWj5n7Nu58DITnYI938kYBA6J+Lbwx3enLcRQER4xG8psBrcDswcScbyrfc8P3usFrd71CscSIr4Egr1GRZ2AiMEuDqssSKMhO2C6Mllw==
X-Gm-Message-State: AOJu0YwKGf7o4NHwQogRn2+EZ9NGdUUicK2fJxHGGRI9F8shdZ3wG0bj
	J7sIQJpZJZK1wh4TYFbKS6qRV0Pa7M/6wpvoadQ/vy7hpcPJCVeReaMSDASsu7A=
X-Google-Smtp-Source: AGHT+IGCskWR+d3aRl4ZoT1wuIhZfVSo9PKn3auj07ruinBPu2PLg14UAn9mjm1hpm8wHCSYYIdnjw==
X-Received: by 2002:a17:906:1958:b0:a3e:c557:7cbe with SMTP id b24-20020a170906195800b00a3ec5577cbemr4661160eje.3.1708509508206;
        Wed, 21 Feb 2024 01:58:28 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381? (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id hs32-20020a1709073ea000b00a3e4802b4f1sm3946290ejc.217.2024.02.21.01.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:58:27 -0800 (PST)
Message-ID: <cf3a2def-4c41-4ca9-abdc-477d79ca396a@linaro.org>
Date: Wed, 21 Feb 2024 09:58:23 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix pm8010 pmic5_pldo502ln minimum
 voltage
Content-Language: en-US
To: Fenglin Wu <quic_fenglinw@quicinc.com>, Mark Brown <broonie@kernel.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, lgirdwood@gmail.com,
 quic_collinsd@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240214121614.2723085-1-bryan.odonoghue@linaro.org>
 <13baed68-1014-4a48-874a-94027a6dd061@sirena.org.uk>
 <f38468b4-8b16-4180-9738-0a2b557651a1@linaro.org>
 <dcce3fa9-ecf3-42be-adf6-ca653a79ba2e@sirena.org.uk>
 <3851e21f-f8cb-487b-9ed4-9975949ff922@linaro.org>
 <a09d6450-95e7-4ed6-a0ad-5e7bb661533a@sirena.org.uk>
 <df6a49f3-88e9-46b4-b7c3-e5419fd01eca@linaro.org>
 <6f6dfaa2-f529-c9fe-7dde-402c92f0daf6@quicinc.com>
 <bc05fe84-0700-4587-bb18-eb39d30f10a8@linaro.org>
 <6b36bdc2-0ffb-491f-a1ae-93a20822e6f0@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6b36bdc2-0ffb-491f-a1ae-93a20822e6f0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2024 9:11 a.m., Fenglin Wu wrote:
> 
> So, programming it to either 1.8V or 1.808V, the HW will output 1.8V. I 
> understand there is a problem for x1e801000 because its AOP side limits 
> the voltage range to [1.808V, 1.808V] for LDO3/4/6 power rails, it won't 
> work if linux side updates to use 1.8V. Actually the same issue applies 
> to SM8550 and SM8650 if you simply update the voltage level to 1.808V, 
> because their AOP side limits the voltage ranges for some of these LDOs 
> to [1.8V, 1.8V].

Hmm.

We have no use case for 1.808 to my knowledge - the sensors take 
voltages in the range 1.7 to 1.9 volts.

TBH I think it should work just fine at 1.8v bang on.

I'll test this theory on the reference hardware and repost either a 
patch or further discussion.

But I think we should probably just leave what you've upstreamed and 
request 1.8 v in the dts honestly.

Thanks

---
bod

