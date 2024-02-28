Return-Path: <linux-arm-msm+bounces-12852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3586A8BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 08:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB8C628A1E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 07:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A3923772;
	Wed, 28 Feb 2024 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCM0SDI8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E923023765
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709104453; cv=none; b=bn5OueIogVs8hiqaulaD/iGneJ60xvWeswzL2rJYJ2HDbEA9nO3HEL6hDmbP17eHGlXwync33r8QKk2wnZPSt5genK5Kd+hIJkxsbwWbyeAgVRhtlM5TNnhl06B8Q4HICdVmUJ7mdPKygose+P2B3mjRIcxe63Ha0S5gU3kOuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709104453; c=relaxed/simple;
	bh=td1qmz0+bjms7NZee4Q+grU7YkzyB9sI4rOA4HGi4J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uib5jY90wkaw75EiOux7KPybNHQbRKXx1NBRvLH8vVf/KbAglJFr9CbLe0UvOulhRg424O13dGR/NPg/FgDU5RP2QYKB+8o/riN8v52OrPt6RSMfZvVoLHQ8UYryjKunn4p/PC1RqMEOl6p40gXL0S2YyeRidtBmwoUNemWzjR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCM0SDI8; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5658082d2c4so6659403a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 23:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709104450; x=1709709250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tIiib22Ou0SGw5uF5Rbg55UMvxvsUTPekbWkzDENBc=;
        b=nCM0SDI85OKO3HN7BModAA9PaC5AOsUOfYdp9by7bAFTDHOWGZ7EQt7WKOJWd+EkHm
         jQ0AU3UDDQ0b6Y7mK1to1fEYoJu5kOhALbWvLMHhRlFIeEYjFY6F1scfov+y7tHg1NeU
         pCkWS4kEUw+b0BvEbdl/iEIVbwpY5mjOzkZHNFRXXxiy5iecKmYJkm8HMB30QPA/2aUo
         PahupjK7qh56at3vmgt0ynpKJEJc2zcw6VtkSxCqTllUCT6tUx+oKAYGvexPg0u1GIUO
         S6m3+rYimE6cXqZA2U09UIvn7IOh6x5CZ9hBSwWAIv9XUAsfyX5k16pJiBC2akLDLhmQ
         NijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709104450; x=1709709250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tIiib22Ou0SGw5uF5Rbg55UMvxvsUTPekbWkzDENBc=;
        b=RVJI8Ib0HLaTwt1qUbxiA7gVYKv4uiTiFT+Z5/kgpj5fZkyeyJXpXybUZAIBEiLhD+
         2+OZRuzVJJoCyHlFFvsTih9H8A/g8h9OznnfbTFI/0z/TZcIcvew4hpycanNUpsCtq8w
         Vj4JtunFI9F/lz+GYvqgBNYbYiSGHd3YdL3c7n8jN+hxA3yiucZsWcRCGD5ipxw5ZRg9
         f7oiCb+/Ap5SiZ5VVGyTPCdUOPb0Tm+nBxmJ/SKwAKzcvFvZAPWjd2A2P9xiXu4HyXf6
         ETX24SaGbBZtuwG9S7/GNthyft29rmrZa74L7rXJqz4D/os1XMuykH1sp605Be41VvLL
         7ebg==
X-Gm-Message-State: AOJu0YwgzaV7oYrO18ccALywe69s2H248iXddjgU6iARNt0TyQYtYtWK
	wn6j9he8GAZClXg2idHOGHMGUghoiN4EwGZLIxqDmVlY2yFxbUJkVfVb/iJhvck=
X-Google-Smtp-Source: AGHT+IGWmjcy5X/t5s8nv2IkcfNwjmZslcI/pzWBk6oFbvUIC02iIyYrFWd1OeVIdr9AUl5MU8GLFQ==
X-Received: by 2002:aa7:d958:0:b0:564:f6d5:f291 with SMTP id l24-20020aa7d958000000b00564f6d5f291mr8678330eds.34.1709104450349;
        Tue, 27 Feb 2024 23:14:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id m18-20020a50d7d2000000b00564e4debe29sm1570011edj.78.2024.02.27.23.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 23:14:09 -0800 (PST)
Message-ID: <b9ed4403-bf3a-4ff4-a92b-22badb845527@linaro.org>
Date: Wed, 28 Feb 2024 08:14:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: msm: Add llcc Broadcast_AND
 register
Content-Language: en-US
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <cover.1708551850.git.quic_uchalich@quicinc.com>
 <93143410af20807c8451539db7fca7cddf31e7b4.1708551850.git.quic_uchalich@quicinc.com>
 <26feb928-55e8-4f6e-8727-44ef8e045b4c@linaro.org>
 <68a81c2e-8398-441f-b33d-374c37f39e06@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <68a81c2e-8398-441f-b33d-374c37f39e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2024 02:04, Unnathi Chalicheemala wrote:
> On 2/27/2024 7:47 AM, Krzysztof Kozlowski wrote:
>> On 23/02/2024 00:07, Unnathi Chalicheemala wrote:
>>> The LLCC block in SM8450, SM8550 and SM8650 have a new register
>>> space for Broadcast_AND region. This is used to check that all
>>> channels have bit set to "1", mainly in SCID activation/deactivation.
>>>
>>> Previously we were mapping only the Broadcast_OR region assuming
>>> there was only one broadcast register region. Now we also map
>>> Broadcast_AND region.
>>>
>>> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
>>
>> Why did you ignore the tags? Qualcomm upstreaming guide covers this
>> case, so please read it before sending patches.
>>
> 
> I was asked to remove the Reviewed-by tag as the previous version of the
> patch gave errors on running 'make DT_CHECKER_FLAGS=-m dt_binding_check',
> that's why I dropped it.
> It was sometime ago, https://lore.kernel.org/all/d78b4bce-7bcd-4ab0-a76b-135cee3ec9b0@linaro.org/

And where is it explained/mentioned? Every tag drop should be documented.

Best regards,
Krzysztof


