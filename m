Return-Path: <linux-arm-msm+bounces-19565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE388C0C9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 10:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9763BB22B6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 08:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7855314A0A8;
	Thu,  9 May 2024 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABXq/ZcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF6614A084
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715243501; cv=none; b=J+yJrgraL4gRyrJuH2DnIhJwLbxsFo8CvsFY21qieSkPaaWIx4VHRXOjj16q+VgYpI5pOyGlfoPP7RHEEqO2i1qjcQeTJLLC3Y+WYhKbeEmeUfNUC899wc+Y805GoI7IPTqbIcofuBk8aipoSytIww5y6yPLYtoAGTu7zB0eDgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715243501; c=relaxed/simple;
	bh=g6brLIjlctrnBrGGIGeLbfb8eDQbn6shISRqkm3Vvr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiSabZ3s1Rk7Cd4WBQrPiRzZbRxVjj0U1hLZS//TKogZmkufCfQJJNc9PVHqtbEeNq+o6EHlxh8G8W3cCnpGiiioMzPthjvxIBuSTmt3hX0Uj5FhHlK2avjVxTrrEZcvGGOFgrvXY8oXx18y7MfP/bNtxz3qIgrPXGa20OqnAuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABXq/ZcG; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59a64db066so140888166b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715243497; x=1715848297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PN7HUcKm95s2j3xS4Is4Wg9h1CVJ8IRE/G93EyxqKbA=;
        b=ABXq/ZcGZ1VeTizHeNCuKMlhtLnESv8nlvR7BsJSwo6G9gSlR/+tPx1GK7ZagFOww5
         yBjSTYT60F7aBdIQ0bu7JgPo8Yk+g3EPT/xqo9DJ2mP+b2sgkJ3qXeimWALKf23W/cHI
         1fYuHGHQF1Y+azH2bevlTVfI9dJCuSA8LhayRY2OjyY7/rMQkDjGqIsTdH9qwQiPq9LK
         HJ1Eh9fR9mzvaJXLkeWrIgxwGHdZSKudtZjugvIWwIFeOp80RaksM94Y1kY28Er6cLIv
         PaBT60TjCRnBrJiqFeQgnbDaj7pXfm2H9VUYRMHKXnqNQalrfdnYB+DvLnqTZwJroaWQ
         THuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715243497; x=1715848297;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN7HUcKm95s2j3xS4Is4Wg9h1CVJ8IRE/G93EyxqKbA=;
        b=Ow+U9D/kVMxNDCSajBlENC+ieCaTNGGctdzmh0oBDOopxOvDgQEyLCtaCDmgMViJeo
         RpF9MQkoya3U7X0yru9nYfDcfsU2Kl4U979YWO5kWsHE23SJHEW8HZOaKEvCotlI2IRY
         IjezP3eD6eNZMdj2RC4pLfodhsPkjLFxKHdj0h+i8po5sC2n3hhx4fVUp812Q7xHRXm6
         a4Nuy+omuRkXCiKg1prncZ5h3l2YL7TgxHsAH2yuRn3/MIzbz3FxaKcH4VX5BV34+5P1
         X+n40wNkBUCkjCBPAetoDO104V/rmzeHVDbFZF3vUBD1WoBYGJcudLmZ7wxRAlVZRNVp
         rZgA==
X-Forwarded-Encrypted: i=1; AJvYcCWA4qzIJ00XoEBPleyWOWxBRS57tkN+6U9LLR2lDaDyBXUhLmoaJ/ViFu0efLN1H6dB4sobiWXcUV2VeGQ5p5y4r/yGtRlLQ6vhGeqzyQ==
X-Gm-Message-State: AOJu0YzRreH0SSoI/i8mIKkDQtqe+jbU7rDYZpgnp52BqATvxC0tGWwH
	jSVbzaWDhc23aFJFXQ0pdpnH8H6NPWRqOVb7TTcfnWaLO5g6ELOCBJH9BQi42rs=
X-Google-Smtp-Source: AGHT+IEWEKZonq801qsZzLiH9WGt2fbYv4VFxzbE8jq5dRvtfVVEaz/68zuTSiORJoesn/4lMcRj9w==
X-Received: by 2002:a17:906:407:b0:a5a:12f0:3737 with SMTP id a640c23a62f3a-a5a12f03927mr114445066b.10.1715243496882;
        Thu, 09 May 2024 01:31:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0145csm48181866b.158.2024.05.09.01.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 01:31:36 -0700 (PDT)
Message-ID: <c0a12ea3-b869-48f2-9f23-e3139d87d5cd@linaro.org>
Date: Thu, 9 May 2024 10:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>, andersson@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_nankam@quicinc.com, robh@kernel.org
References: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <20240507163045.28450-1-quic_vvalluru@quicinc.com>
 <a32fa81d-bd70-4dfa-b512-e2adce4f8c35@linaro.org>
 <9a48b0a8-d1d7-8e2d-dafa-47e136a46c99@quicinc.com>
 <2f810036-1832-42ef-b896-e9470f469029@linaro.org>
 <CAA8EJpqG7k2+eEyndzrGgF4YqSOhD-kKfaj93PLhitcku1B6tw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA8EJpqG7k2+eEyndzrGgF4YqSOhD-kKfaj93PLhitcku1B6tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2024 10:13, Dmitry Baryshkov wrote:
> On Wed, 8 May 2024 at 10:38, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 07/05/2024 21:20, Abhinav Kumar wrote:
>>>
>>>
>>> On 5/7/2024 9:35 AM, Krzysztof Kozlowski wrote:
>>>> On 07/05/2024 18:30, Venkata Prahlad Valluru wrote:
>>>>> Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
>>>>> reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
>>>>> Bridge supplies are Vdd connected to input supply directly
>>>>> and vcc to L11c. Enable HDMI output, bridge and corresponding
>>>>> DSI output.
>>>>>
>>>>> Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
>>>>> ---
>>>>> v3: - Updated commit text
>>>>>      - Arranged nodes in alphabetical order
>>>>>      - Fixed signoff
>>>>>      - Fixed drive strength for lt9611_irq_pin
>>>>>      - Removed 'label' from hdmi-connector, which is optional
>>>>
>>>> Please respond to each Bjorn comment and explain how did you implement it...
>>>>
>>>
>>> Yes, agreed. Even though it seems like you mostly just agreed to mine
>>> and Bjorn's suggestions and decided to implement all those in v3 , it
>>> would have been better to explicitly ack them or tell why you agreed or
>>> what went wrong that you had not done it in v2 itself to close the loop.
>>
>> The problem is that one or more were ignored... By responding to each of
>> them, I hope they will be finally read and understood instead of
>> repeating the same mistake three times.
> 
> I found a mistake that was repeated two times. This leaves me
> wondering which mistake was repeated three times.

That was about future, I was expecting v4 as in-reply-to :)

Best regards,
Krzysztof


