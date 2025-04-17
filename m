Return-Path: <linux-arm-msm+bounces-54619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7FA91684
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 10:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F34331907E02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 08:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33011223323;
	Thu, 17 Apr 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H03mvwnR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD9D21C17B
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878908; cv=none; b=ofTYBdvtYvwgNUZi9mG8YKyIomSBXiVyDXR28VaVW04MYh6O09dyAPldFRaoF+Wlm+syF5OIhHDegl2kgeLHceYNbJHXRBnEbefYSI9AFmg8STSfMk842sGatGCK/LUSb15DDMUDAxmDIGurgFAhyVFt4kXJHjTGnZpmOsEZL/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878908; c=relaxed/simple;
	bh=v7Beki1wx0pFxToSPLRFkM034OQKjMUf3qDwIahY5NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clcDKybG5IOsm+ngDfvQd4gV0vGHz5/lMvcNUlZl6Y5erIz5MflzOvdUR7mefN9Vadqtn4Bx6/LSeVw4XVUPeeiVIcmE01WLJ6OzPpefRGBMArRcj8+8+koXQF4oSj6O8CC7PxUjXH97morE8P5evojZXNg2YHADhTG+rYaZ7Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H03mvwnR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so11992145e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744878904; x=1745483704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bFwlWCS6Kk0bCLYBtfT5ejGrulPH1qXFNrU5XO5/8E=;
        b=H03mvwnRiYcbZYS1DZNrmt5AS6xuF+vkG/VOBFyTlmX0CzDZdfOZqlT4mdWIHGd+7H
         u8s4w0fEXI53qwD4GNx4ONdXdvU/KRbIsV9YdbfdbnX2SJM+i8xnfLvWdtT4IX8CPv8t
         5URndPnbDjPuip5eXJ/JiG3J0m4lCev9Twjjpfmrm1emLomRMlJ1Fa1vMN2S0ZTsXLn5
         G1tpCVHswCqY7NwyDzvVCiLztkjT0QmdZihrDtB5P5/3/+T05VxWxmAleWU1pmhMD8Po
         r//58OPVdZQgwkC/7X4akrwL0vUnjiGXlxRmNHRh2cn/Om98YJ+NZwRFBG3md7eFDaBk
         cExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744878904; x=1745483704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bFwlWCS6Kk0bCLYBtfT5ejGrulPH1qXFNrU5XO5/8E=;
        b=Iscqgolw0UjPHbXYVuEODp0AxVWe9EAo2Y5KD3tr6a185ykjpXlaqBm5v5WBTy4Gzd
         4dTl+0cJ6dLgAaiWv80kY1OA62KtUghX1hO55CKHBsSsibfd1ce9FOBBWzQlZAkxBbLT
         Oujce1EcFC9rXzuzMAYjaGG3zvlK8qcOJcRY0LJ0D69C1Pa29HaWqLv/EdHlWTk6JVfX
         bi8b7g2stn0VWAmppmbXHHHGOzPJjUUo/zwwHa2DgNCjSGEE44TtUvJ3VxFFewlpML9W
         J5B69gJu9SDvqpVSOCX294AgaHAmZ4o6BoLPJuSSzFSr7MODGX77G7QJbrhpz6toh4U7
         HGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyiV/dxvtJ+M1xJtTCaO9JY/G+laysGULSeouV49jp2dGbw10CK8LPDjJ/0mbRyd72cKJqSlGzn36vsYd8@vger.kernel.org
X-Gm-Message-State: AOJu0YzJtSLGVbIN+X/Qy4u+UfZ+2qgwUx2h6HUZCQOmObWh2hj33DKW
	25IjJVr2A0fnbinA3KORifhUPGKj4PtDszk33yoOpGmigtN0HWw9anpLC8iFlXg=
X-Gm-Gg: ASbGncv1wGNQLSyrxsBi72wwCPJSO/xrmklSczOskQ69YcQZOSSOdeWtw6+8eofpGQE
	hB3oXBaKI8i6GJOkFCe52V1X8Xv5oHLiCackc8evOfv7KMACHDHgzzbUz8wiVFioaZ0ETdNckw5
	4zQh/GSee8D6C2hmVjgGqXw8hW23tBxHXNyKjZLFAkmlaJXt45dyzI8CD8v8nNuhhR+IVhtK5Dh
	VR4Hzr8DiGPYCATERR0PICr/wldg7+MqY55jlZaX4C8cdIeUa28zpsGHNu+/g8ImdKryILrj1af
	0HspohOPaoMNdlKeSjLVMo4OLY//p9/WygpzQeuNnS6/A3T4AliY5T8Y7uQ/BvONjuc+AhfJx+t
	9ZMG57Q==
X-Google-Smtp-Source: AGHT+IEB3uiv9d12q/gsfhCkq1pih+E/njAdV0CZuqhp7+y+hbWHDbSN03BGf2xjAj3/8S3g6KwzKA==
X-Received: by 2002:a05:600c:5127:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-4406351b084mr16091615e9.10.1744878904468;
        Thu, 17 Apr 2025 01:35:04 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ee411dd02sm4256434f8f.55.2025.04.17.01.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:35:04 -0700 (PDT)
Message-ID: <b9e232c9-ae06-42f1-9fca-a8c5d7d64a86@linaro.org>
Date: Thu, 17 Apr 2025 09:35:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
 <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
 <137c68d5-36c5-4977-921b-e4b07b22113c@linaro.org>
 <96bd9ffa-94f6-0d1f-d050-5bec13b3328f@quicinc.com>
 <70a630cb-06ad-403c-b2e2-ae6d26e0877e@linaro.org>
 <30ebc1b7-5746-59a3-0155-7a7870544622@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <30ebc1b7-5746-59a3-0155-7a7870544622@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 17:40, Dikshita Agarwal wrote:
> 
> On 4/16/2025 5:40 PM, Bryan O'Donoghue wrote:
>> On 15/04/2025 05:58, Dikshita Agarwal wrote:
>>> Although firmware makes sure that during session close, all buffers are
>>> returned to driver and driver will release them but still we shouldn't rely
>>> for this on firmware and should handle in driver.
>>> Will fix this in next patch set.
>> Shouldn't we reset iris in this case ?
>>
> Not required.

OK sure.

Could you at least add an error message on close() if any buffer is not 
released ?

That way we can "trust but verify". What makes me suspicious is that we 
have one instance where a buffer hasn't been released which we expected 
to have been released - that may be reasons for that which we can't 
interrogate from APSS - fine but, then how can we be sure the software 
contract on close() is respected ?

So yes, I accept what you say that its not required but for peace of 
mind we should at the very least be noisy on close() about unreleased 
buffers and if we start to see kernel logs about unreleased bufs we 
should revisit resetting firmware.

---
bod

