Return-Path: <linux-arm-msm+bounces-36703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5859B8DF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 10:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C6E8B21BBA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 09:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B8C158DC8;
	Fri,  1 Nov 2024 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Td7TDQqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A3F153BF8
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453768; cv=none; b=ukN+EV1sXyWbfSyMKEH5gGy/84TqonRO5Dyjug3igzC+xsSahBf98qipSGZZzqATO3EKUfs4Qjjk/tPzpITX3FhzWMCCEw6kQuzuo3L6ByBoGmeP9vpOAzBhFdgpoMX9oksiuIVfjWFJs97V8oVrvmvdl6sLsnKkb85lNgRHSUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453768; c=relaxed/simple;
	bh=bhoZuGYJ0dpbGLsSlcpH1LRwhSF9fz4qDNP2qyAzsiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHjfq25D2Yz5BUEg55ZE3GPK6PhlZjS9Vv7K+G14CLE91t0H3cDHHjrvA5w5mwzstvGQJQwFYMG11K8rXbcdKkCbWQN+hLo4sE6pGA509lCL0aGKtuEYgHNNLhRQBGQBrlJ8/zP5wF1bVWN1Oa7VuNN9MyHnuLcf81oyLmCVcls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Td7TDQqp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431ac30d379so14566855e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730453765; x=1731058565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdmUQcv8f+NST8Xxnn6Q4h/hVBLPTZ3zTynazKcBrXc=;
        b=Td7TDQqp1gYCyR98Y7IbledvU79Pt3SYfrEP0qPyXx8NqrGFNW2HCSmQoT2h9FeqRi
         se+R/WKWRArmmyq87BxIANm31L8AwbO67sUDCZ04xo278iYBvhtKMmlExpIOl0wOSS43
         DnQs0UqjoNe4y0jQnSaMQCRkrfGqabGfJiZQ+QWUJ/TQjfLCVgWMAlma2Z80lcaxfWHp
         ebDywJqEJvyQfdG+JdvwpU4O6itkUw+XfPe1qM0tt8GfnryqlTkEfVZfX0lMU15UPy4c
         1yl+Xt4lRaAktEYV3RqoRbQ1Vn6BL/x8VVPIsk4dSYHKcHVx7ObAZRlC1RQWFKeWU0Vv
         cpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730453765; x=1731058565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdmUQcv8f+NST8Xxnn6Q4h/hVBLPTZ3zTynazKcBrXc=;
        b=Np45LiCUE13tjJ8aS/ZrcGiRGvErVS7POVNqHjj35SgAmcT9Ckp1DmSw0z5iTP+j2Y
         fw4r9DdJehK9NoQ7JXsfEF0W65hMnutCKwYPkPZWC7uw/yGgFucQe45HEpDJPJ0KEJ0I
         myz2SVAxj+zXSq40KVFVqlpWOpv75SF/DEthtnlLYpKiTuqLHnl3jAY08aOsyPfSlXVt
         KTH69klASKjZdrntLYB6kg4C4+lLd5bS+xzEFi10gegrfIyspvx3vQemOQziXh1JdXgv
         AdG6zkH99mdWqWeppDnU3Q9pFeeR9hU3HsCDnG0XM1WbYkSyaju6A/ChbnpPMyWRY+pS
         1/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUVQPW2NCWAI0/rREaa+Qkb3Vg8IVxZqJw2eQ1KfuhzrIFMXNMfXKy7WY6ogQcM7Gq5OdtI4OgtySOwNgXi@vger.kernel.org
X-Gm-Message-State: AOJu0YwUPAHKvPMSs50CSfvSIt4lfOAocrF4JIScnS3xdxa50aAqhMCU
	DU9IKrjyrk69MuMVNP+4nngiB8jWUUNZAJJ3CQSSKPbci6U3vwu9scgB3dwF/14=
X-Google-Smtp-Source: AGHT+IHidUyaeAtvp6cpUVTv7uscb3XBO2+MSJeqz6vskBADg7hj+Htc3WyMOhjhFbPB3OgybkBWjg==
X-Received: by 2002:a05:600c:4f15:b0:430:5654:45d0 with SMTP id 5b1f17b1804b1-4319acb104dmr198131765e9.14.1730453764877;
        Fri, 01 Nov 2024 02:36:04 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca818sm84122375e9.40.2024.11.01.02.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 02:36:04 -0700 (PDT)
Message-ID: <fde8fd81-f9f5-4885-8dc1-5ccb115b856b@linaro.org>
Date: Fri, 1 Nov 2024 09:36:03 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <jcqgsgp4ivbokn545sy2rvfllm3vnygfpbufxagotuicacfmgd@v2hlnohlwzdf>
 <b054116e-c6a4-48c3-8162-571d653788a4@linaro.org>
 <6ce1f20b-1efb-408f-ac28-e8c35162643a@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6ce1f20b-1efb-408f-ac28-e8c35162643a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2024 09:17, Krzysztof Kozlowski wrote:
> On 31/10/2024 16:42, Bryan O'Donoghue wrote:
>> On 11/10/2024 15:29, Krzysztof Kozlowski wrote:
>>> How do you imagine writing drivers and request items by order (not by
>>> name) if the order is different in each flavor?
>>
>> I don't think I'd be much in favour of relying on declaration order in
>> the dts, favouring names to find resources instead, tbh.
>>
>> The 8250 has regs that sort by address and name in the same order. For
>> 8280xp we preferred sort by address and you're right the interrupt
>> sorting isn't consistent.
>>
>> However the latest applied dts for CAMSS is sort by address/irq not sort
>> by reg-name irq-name.
>>
>> Unless its a NAK from yourself and Rob, that would certainly be my
>> preference for any _new_ additions subsequent.
> 
> It's not a NAK as long you keep the same order in new bindings, which I
> think it is not possible. I repeat myself: there is no rule/style that
> list should be ordered by values, but there is a rule that all devices
> from the same family should have the same order of items in the list. I
> don't think it is achievable with your approach - sorting by value.

Grand.

I'm happy enough to sort by IP alpha TBH.

---
bod

