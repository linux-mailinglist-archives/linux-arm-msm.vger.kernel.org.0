Return-Path: <linux-arm-msm+bounces-52023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A9A69747
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 19:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 373921B601FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 18:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E16206F11;
	Wed, 19 Mar 2025 18:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IaVVn3EJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6911E22E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742407256; cv=none; b=XCX1mviJ+aAVsqBb3MImM8kHbCQC1Ax4Q7x3QVJ5JqHQFOfQ9jo0fbgsu7l4sGUyIWaDWIp6qtMVViNwHSQjRdggOZkarIKDHKsPCC8/wKKCkaJBMeMSK58T6eqXA+wPMqVbRlZcmyP0aPQj/gES1IR5fju5igILY9jh7GCvwnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742407256; c=relaxed/simple;
	bh=MyGuRyQlDt+foSD6CeJddJn3OL0fjbCOG+6NlRxWHHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acG0XuV1FyYgTrxeMeyk2e7SG0Lo9qZJwNQmXmrq6ceAPEq0ISpR+cgWnpdxEyzFg+xI1SXXnbCs5hXBeSFKm8QX6KIlbKqZriQW2QE0/npXr9yX1uxE+oCmYDh7tb2l7+WTaex1IUSeQ08xHRreV87qNYIUs+Fw9qTmzNokqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IaVVn3EJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso23099915e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742407253; x=1743012053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rEfxvBCDj+OUf6/+Bbrxfwwkqzx6X/wza22OdnfwyY=;
        b=IaVVn3EJ07saxjGiHiWtvGjXIF/qaa3WjClDBp6ylHibk4GkapEP+mybG6d1sDf6Dx
         KxPmFfnTzHnbrW8rGvo4LTexhNVDI1MR5FPvcg5Auxike2KywKBf3nuA/kREU7L84fk5
         6l+sy9jDzedPo/5ghDrqZNNVCwEb04nF3lyZXv1d3M6PqXBwXeS4/9JzU+2aSa9/258e
         TQhNAFFNs9ClowK7BRpJ7yjcOGh3YhL5OjJQW2BQLK/44maAkkt9zrGXb3bYlOZeRPOg
         C5GxSCoa2OMpiN70ZY5H5KO4tB+E99z/wO/vi2h7Xwv9+cmCLmYSm3HSqr5YGG8LM5IE
         m6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742407253; x=1743012053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rEfxvBCDj+OUf6/+Bbrxfwwkqzx6X/wza22OdnfwyY=;
        b=ppfqqSbhZUfUAgxqszJx3n0B7T4UGeSEbtfolPBlVDeK9iCtMrROV8ycRGwK9SqkwM
         vawXIQHa1pQbiWAahleOgnW5eTFhQAPOZXkd3o4rdt6LsvwVxijtona24Zu+04hGqXA5
         PlS6Sr3FcRcdSZylZ7OqFboL4w0ogZEP/pTXhXH2n08R7MtkBOS5TheJcGa6qkNbWLqK
         862oImPKBjwNeWdOGhJ1O0r1YxaBjGRRPXfzj3snWFg0Qwlm7Jhhm3pWmUgoODQF4THE
         HOWY3uQGYCHl2MmC2cNroMLMVklNabxg3zvW7YUcAJ2m7GkIGsNUoxOR76KPM5AuVtIW
         ZtFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgPkjz56Kp0MxcY9ryLmpW97gVdCW8+iIQqd1y0m8ku/w332mg6xTz1r9vfWfHpxqVFJq6suQxsDbFq6XZ@vger.kernel.org
X-Gm-Message-State: AOJu0YznMiInf1DjAcWxQVOZLlKtmPFExFJOFrC/212SlfZrhxm1qjUS
	yfKFJALmPS7AcOOUglD5Bwnmn4MO6if+Kb1U0cbYmS8DsuOFjDuYRAQBF9XyAPs=
X-Gm-Gg: ASbGnctpBZCo3xoy//KzveHZTnh3IOH8IfaUILOtEEqJTh3nSVNxDxgExUj8QezZxSn
	vQ4FubLdalZyPqSe+1tnMm2B6ORD+Z5jmI0WjkU1/PRr3Adq8Ax3hVPxEl4ScZbGmdUeibAoUUZ
	gUKm6DjqAUYUYuIi/3PLJYUBv7KT3yS9OM0nghFLz8wSWxiMlEkWBlNhTWgVswcOcHlKgKpxZIM
	KsIGmjssENVjhwgs+SLVICnu6b0wfOtd6c4oCld/Zu+WDYKgI9QWC7f9mbSYN1bmMSiG1Gx199e
	Ss6PuEE8iiWi5mZOyI4toAm+SXt8UlQlkwUKihfCMa+fAY7nJ27Z8voKE12BzDw=
X-Google-Smtp-Source: AGHT+IFbFV/3Qs4DOHIi0NIjAkZVN8cQrhEL50TvwHlsiVaJpE49IvMubk5v6WpuWc3f92V/RIBWeA==
X-Received: by 2002:a05:600c:4208:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-43d46deb26dmr19657885e9.12.1742407252904;
        Wed, 19 Mar 2025 11:00:52 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395cb7ebbb7sm22140437f8f.92.2025.03.19.11.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 11:00:52 -0700 (PDT)
Message-ID: <938cb09f-3fb1-4daf-802d-2d95222f30db@linaro.org>
Date: Wed, 19 Mar 2025 18:00:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio
 switch controlling hp
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 andersson@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@linaro.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan+linaro@kernel.org
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
 <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
 <660115f1-d1fb-4fd7-a453-e8c177be9eed@linaro.org>
 <51dd7cb2-0c22-4043-b3a1-fa8410903cbd@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <51dd7cb2-0c22-4043-b3a1-fa8410903cbd@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/03/2025 16:03, Mark Brown wrote:
> On Wed, Mar 19, 2025 at 03:59:23PM +0000, Srinivas Kandagatla wrote:
>> On 19/03/2025 10:01, Dmitry Baryshkov wrote:
> 
>>> Is this regulator supplying the codec or some external component? In the
>>> latter case it's likely that it should not be a part of WCD bindings.
> 
>> This is regulator powering a mux that is driven by gpio which is part of
>> codec binding. So I would assume this will fall into the codec.
> 
>> Where would we fit this if not part of codec?
> 
>> Unless we mark this regulator as always on.
> 
> I would expect that the mux would appear in the DT and consume both the
> GPIO and the regulator.
Yes, its doable, so we would endup with a mux driver consuming regulator 
and gpio and move the gpio handling in codec to move to use mux control.

Let met try that and see how it looks like.

--srini


