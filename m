Return-Path: <linux-arm-msm+bounces-3596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF8807A3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 22:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A9B1C20FF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 21:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCAC6F629;
	Wed,  6 Dec 2023 21:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/UIDWYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BCED5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 13:21:15 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54c671acd2eso317742a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 13:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701897674; x=1702502474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6eHL/dN/qRcrKzFWjeWh9PSQOYj5S62HkgJQDrTF094=;
        b=F/UIDWYYvkwgRW/g4H4VCgNJnooVoPAX7Ws2YHmoX8xyhvQsnztByB+rd3q9p/aPiw
         lk6IUzSX/Zwf5kfwcdVhdDBhql1UYwiAIHZ+omAxTxJnbMICRF7SYcMOxNlqvVQKBXMf
         RrOsP94OuBW9Cb/Zg+uUqgJIF6lJe9Xqd7b8j/ihEucJ7AdruP7PIlqDTZeKgH8rpK9I
         fal03+LzIg16hkdKqsIs4crVVNWrN0LaBJFw2jhDpv9ezWRok/pUbMampyJv72+mibnS
         RIaiCVEqYTQB83l+m1CluYRwvx8Z6ZRb+8y1MK55yQxsLfS7zNJf0g8HWzB5w8P74y63
         Glzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701897674; x=1702502474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eHL/dN/qRcrKzFWjeWh9PSQOYj5S62HkgJQDrTF094=;
        b=kqfBZtWcIaKgKn3k3/Xs+ba2md7jUkTbHR+tpUMxmfpfA8Vik/TP4et3r3Gcs8qgH4
         xG28lIcOwGCG6k7j1ncuUkSiZqRONar4wGFwlN9ttCyU09wT8UMqtxmH9Nb59ac7TlHD
         QB4NzdLLtdiHY6rA4Uo3OfKB+VoOzKEbXI1GNmAuxuF3SJGBJQl+2IMeN/aHGGl65WX1
         9xzQUNKB7ZcbQg12gKoExbOSLTc+GGcgBZf4PHj3/Ej9Y/8mjidNM34HDgh1uP11eTbn
         MRx6/hTBEhjvheYm8WlU3qQK5k9hBcBln/X1PapKnnmM+z4liUqNnVy+v107SUijbs76
         Jijg==
X-Gm-Message-State: AOJu0Yweo95ecwZL1N/IX8gpUheGUMdqNrwxvGJPXGvyBy8VnbTymOOS
	DPxO25oRIcUcMLapquDzhbXO/g==
X-Google-Smtp-Source: AGHT+IGc+dDMW9dkb1ZkmEGUnnVdZSMIE832JsEWrrD5zfx3lvPWRNCWR48Ww5HEZRT+9SQfWvkV0A==
X-Received: by 2002:a05:6402:17c5:b0:54c:e632:e629 with SMTP id s5-20020a05640217c500b0054ce632e629mr881004edy.44.1701897673701;
        Wed, 06 Dec 2023 13:21:13 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381? (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id f11-20020aa7d84b000000b0054c7dfc63b4sm385980eds.43.2023.12.06.13.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 13:21:13 -0800 (PST)
Message-ID: <a058827a-b025-4ee5-b2a4-d6c8963a6b73@linaro.org>
Date: Wed, 6 Dec 2023 22:21:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic: add CONFIG_OF dependency
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>
References: <20231206172037.12072-1-rdunlap@infradead.org>
 <d0323841-a3a7-45b7-b702-0a08f9250c55@roeck-us.net>
 <0c1bb5e8-1ad2-4bda-b038-456d9791f9b7@infradead.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0c1bb5e8-1ad2-4bda-b038-456d9791f9b7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2023 20:46, Randy Dunlap wrote:
> 
> 
> On 12/6/23 10:49, Guenter Roeck wrote:
>> On Wed, Dec 06, 2023 at 09:20:37AM -0800, Randy Dunlap wrote:
>>> DRM_AUX_BRIDGE depends on CONFIG_OF, so that is also needed here
>>> to fix a kconfig warning:
>>>
>>> WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>>>    Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>>>    Selected by [y]:
>>>    - TYPEC_QCOM_PMIC [=y] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_TCPM [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
>>>
>>
>> All but impossible for me to determine if this patch or
>> https://lore.kernel.org/all/20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org/
>> is more appropriate.
>>
>> Guenter
> 
> I guess that Bryan is the person to ask about that.
> 
> I don't see anything wrong with Nathan's patch. It should clear up the kconfig warning,
> so as long as it builds cleanly, it seems OK.
> 

So, I see both versions of this fix

Nathan's
drivers/gpu/drm/renesas/rcar-du/Kconfig

Yours
drivers/gpu/drm/tve200/Kconfig

and virtually equivalent commit text. I think we agree its 1:1

So, maybe stick with Nathan's since he posted first.

---
bod

