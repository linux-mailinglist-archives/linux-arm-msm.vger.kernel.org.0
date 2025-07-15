Return-Path: <linux-arm-msm+bounces-64985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86098B0562D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F386189D063
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B77B2D5A18;
	Tue, 15 Jul 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ok2RS/FI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B292D541B
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752571243; cv=none; b=Tp/6SXua6iHHRwXpNbPTLB5Od6mLSms6W3B4G+Qd2y7ge/pMUutHHzwAcAAzVLlQdLN40n1ahXYJZPn//KT4SRTW1/JEbLdrVl2pwS9tm51VB1U3OU7EQOPB5ZM/zU83SOMIaQx7isPE7oi73b9vcHSj2UDhZ3wW+GO4Qp/jm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752571243; c=relaxed/simple;
	bh=OemvodW9GzFSWJ4bb89tBFPOUPsA8BlJ18STvzza4Fc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sZtUDbsclZyv31wRixtkkDauTHT1CXm2rMY65i+pryTGeo6BVy7e7mxzfa5Ety+VacrIoP5BUxlqaGdxv5o0ysuG26wJxJOAObHjmSXPjLBG2LxZQ4Buk/gcHefJvwtmcE6G0XJrXEJOSbmtrLndcdym3XabwXv9IP2ca+HpImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ok2RS/FI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so795136f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752571239; x=1753176039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1E/qonGhUcmwHnVeNtDrr44q90xBTvb4uBQ3BxXBTvY=;
        b=ok2RS/FIDrJGBfNuBD6DGC5YqZsfn1bZcsCAZEmiWSemWmdmYlaYSsdFbzZK30tIqO
         A/JExKxdLfweTLalMrBZi5DI+d1B1SktnBHQKPlDqeb7QAjmnRhADGuBijA7KTqh8LdS
         fjdwUuI0F19w2vuKgbobHVky3qU6ySux/iJl2p7D+gkLN88UAymH+pZ695ed+fi2iGAH
         Q0YZGf5Ow84AGKfPTqQZQVPDrdqgWeiSQM5SzpgGmvPq3IYzK11FgkqTqzEvRZrIDvoC
         mya9wBHywCE4A9plUT9qGKeTXFg+ieeiVcz/1vK0s0xE1PU4rUPvzXvKUTdUmX8gkLWC
         eJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752571239; x=1753176039;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E/qonGhUcmwHnVeNtDrr44q90xBTvb4uBQ3BxXBTvY=;
        b=UDDEsXF+FFdhtXH7bFDKHmGfL8r+eEwFNq2/US2C9OUom7emPbzHn02Hx8Qkqc/PTi
         FVq2aqQMi9I9DfraY+ozu/d4Wm0p7z75BHhxD0R8aTPCfP2BdVVJpB/vUFbV9uDJXGeV
         8D+SxFRb3dYt9N2s4Ok6J/LBDZ8TGFCf6G9kj1B5LSS4qNzBR1aYaE8xyxy4ubwyZjdq
         y+lYZ1uCapzeIeYlgO2aJYA4zY1Eix/30qFJDh/22eG3At+nDw0tsbKE+TtDIrS7Vkfg
         Qxd8lKqYtBNIp+PyCPJ3YrzCx9mbm0IDyXNf4xM12xOrjOTFuoVfalOckzLq6EetPdT+
         g3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW2FVUMGLy9EUHW62wS3uAorVvZM8wu888qstQkvdeld4OUASTMbMPWlrZuCrOBfN/khAJJ7tA/Bd8FzD0O@vger.kernel.org
X-Gm-Message-State: AOJu0YwFLrmXgzhQT0DxFzB5q/Rn1O/a6qvqwEhqtuHLiE0YUFt47lw6
	LiRkMo3bvVTqrSh+/NhusDbhdpWXKwXPU7RnszJVw5G4bUWfZHC/LGPYazqo3xiF9r8=
X-Gm-Gg: ASbGnctPV3RcHuvU1g6JHWlMcj5PtB2ygmlJEkLXD/pSuSL67PBgcghnIAZotR3qpbD
	Odj5ENSb+36bo9xk0jGLRVWOH9j901lo35M1upy080Nxlkz86uPl13tLfKk9scRcGDOZ7l46p8d
	6tK55G2FJPVemObdJlOlnyOgZRjqqW/auA6hRgPHW7NhHpJdaPkA2ohdaLsZidMxYoxeR0Fj7uq
	Ze7VwUbBt5jbbopgE+0nXfv9/EzuOnuFhN5aDtxNSVyeZ7NhCWQBTb+sjhtxeEKULYjBWI5HzEg
	x7tPWu5PEuWDgeWX1k5HJaN+KpWYGFtNtEfdPnhGWfa7lL3hnukS1eLJlXkCkKhtg3DLwV2kCAX
	wJTQoeoGnOx3QOWLwkgb0zw6U7zT4AwilPxFQo57JaQ==
X-Google-Smtp-Source: AGHT+IFgIrYKr5kPaWqOLL/LuDRPX4sYpz05RkS2bwD3IMEJN9VB46qV3MMA7UHaEpKlBugRNoBDJw==
X-Received: by 2002:a05:600c:8207:b0:455:f59e:fdab with SMTP id 5b1f17b1804b1-45629191380mr4115915e9.5.1752571239496;
        Tue, 15 Jul 2025 02:20:39 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14e82sm14696167f8f.71.2025.07.15.02.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:20:38 -0700 (PDT)
Message-ID: <c70fd6c6-1a65-41ee-b0e1-f6c792867009@linaro.org>
Date: Tue, 15 Jul 2025 11:20:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, bryan.odonoghue@linaro.org,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
 <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
 <b83cc20b-44d2-4635-a540-7a9c0d36cdb5@linaro.org>
 <a4dfc82b-79df-3e3c-0964-a99db222c6e6@quicinc.com>
 <4f79424f-0005-4978-8c6d-6b726ee7e4ab@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <4f79424f-0005-4978-8c6d-6b726ee7e4ab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2025 09:06, Krzysztof Kozlowski wrote:
> On 15/07/2025 09:00, Vikash Garodia wrote:
>>
>> On 7/15/2025 12:14 PM, Krzysztof Kozlowski wrote:
>>> On 15/07/2025 07:51, Vikash Garodia wrote:
>>>>
>>>> On 7/14/2025 8:46 PM, Krzysztof Kozlowski wrote:
>>>>> Bryan O'Donoghue reviews and applies patches for both Iris and Venus
>>>>> Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
>>>>> in pull requests like [1]), so he is de facto the maintainer responsible
>>>>> for the code.  Reflect this actual state my changing his entry from
>>>>> reviewer to maintainer and moving the entry to alphabetical position by
>>>>> first name.
>>>>
>>>> NAK.
>>>>
>>>> The roles and responsibilities are well agreed by media maintainer(Hans), with
>>>> Bryan part of that discussion, w.r.t code contributions to iris and sending
>>>> patches to media tree. The only reason Bryan post the patches is that Hans wants
>>>> single PR for patches across Qualcomm media drivers (Camss/Videoss)
>>>
>>> That's the maintainer role, so Bryan is the maintainer. I am documenting
>>> actual status and your NAK is naking what? That Bryan cannot handle patches?
>> I would say, you are reading too much into it, i updated what we have discussed
>> and agreed upon the different roles for managing venus and iris drivers.
> 
> Reading too much? Bryan HANDLES THE PATCHES.
> 
> That's it.
> 
> There is nothing "too much here".
> 
> Person handling the patches IS the maintainer. Full stop.

Based on email you forwarded to me and some more feedback I got, I think
I understood what would be the solution to satisfy your point of not
changing existing entry and solve my problem of maintainer handling
patches not being listed anywhere as maintainer. I will solve it v2.

Best regards,
Krzysztof

