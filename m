Return-Path: <linux-arm-msm+bounces-89598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD6D3A3FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E0FC307275F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFA53382FA;
	Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MX2GsPbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73333E34D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816730; cv=none; b=Iqo9L9xff7YYR+iIwjh+tLGlmUSssNBcRqTCDpen0wKPhYuNosJ2k6U5379vHd3VQj1CrTBZsCuIqP1WL2+SWBaw54qIE9au1c8aasFN4vC+VeZqYOx5XqdKB5zHOjStRNFxZy2aQhUR0XZBQdO+4posT9rPJfTYS+JeaOVqJ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816730; c=relaxed/simple;
	bh=TLdjqoVIE+Q9q91ePPjmYNloGq0TOanY7B4oKwKnzIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+HCvzLL0nZSRetUrZKbh/XPBHN9hRmphVFG/l91e3bpO/Hi7Y/Eez8Foe+2AgGUj6SKejR1uYv4u3KzYuVxe0HyyaOml4Vx9nJyEzm4yP/4yGKSLwXNIsrL0COYyEFcY+4xJEScBxhbQRWCx4UkVsP4m3dONsXjxdL8s/Gs118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MX2GsPbx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee2715254so18341315e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768816725; x=1769421525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbO+zxW5Tr1lt5ztXDgpLXAufhVHB99cvlxCwAYSGTc=;
        b=MX2GsPbxnAsNH/LhEk7HKr0apsanP/5nOw0m9tqh6dY3YDHg28hKEbQBn5/xFTapA0
         QchRapldVwpxfDZJHAPRkH4PqFwkg9NOsEffB704Wd23USYNv1yKU06fER1QoPrmuIuq
         7XUv+IXK/WnZJLeWKmfNDg2khStg7L63zbFlkGDcxTH4zduL5kYOxW5M8Grz/eMTWfKW
         0glhXdQ1f4VZkgD4n/wYpwQGgv/j80LbxIhcP04Dmov83KSY0pFLiP/8F2gYKhS2ONix
         mgw7ZRAX4r/B5xthTgpmtF3WL4MQGkYiers8UoupjovBGkIQbkiF77ikly0jM0mc0FCx
         b6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816725; x=1769421525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbO+zxW5Tr1lt5ztXDgpLXAufhVHB99cvlxCwAYSGTc=;
        b=mSKZ3c9tt5NTNzcA1ZEXsPtG2wu8pPliIHD82psVkfB0c6b5UYS+eAlvrwH2EUesxe
         Iek0MKIkSFjkQ1zMfEmcQPTofSFo1dnQnnhckernd6C72S+8Y2l7tfTR/CwwcDv1j1DQ
         tmhaVGL473uZ+DNiwcLCRCE8tqMC3NRI2SmNylyflh4jyWbpR/kl2/TJQL+5r94CMP85
         ZkgS6cySoWOKS1C4YObVQ+hhhzA7xbU6Gm5wsF13b1rae4HU1MqwpnJA6qjZuekwDnA9
         VZlxmF8arYtWBlf4aFlBfS/BGD43L62BzaRNJYJaPQqfjkFAUrZp/a9SabdxQX079xnS
         EcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXHzmRnj8JrBhVjisK/AHa3Bo2NwH+7QaDQ6HFtn2rdMAGuv5spjOzm1hrubAjn0C3+nmTfGC+MPqh3Ezk@vger.kernel.org
X-Gm-Message-State: AOJu0YwAk7svwmK09LFD4X5gEwa5SiK8JSnBVvG9sSYGm3onVmEwnnfO
	xju5h2OMSUZqB+MoS3PUKVOxXaMcQ/cACZa8UjSP+v67/UzgZXjuFqMtrMjjJqI1XxRZK5BvVQW
	wchO2
X-Gm-Gg: AY/fxX55gbIEq3vyRbGmjqmaLoZyxGrL3jJ3PL2y8r5rTdUSoBMZQrjmOZUS+Lq5XHA
	8b8TsmZzSFc9yeTz6N1qUC4xmpyzpDsqUWpv8tfaLNporOCCtVTA++KWy/sPj1hGKTWZa/0jdZi
	ZKfr13uwAf5migjFTIZlTruWnBUaswqZ0ELEn3mSVqjzNyyjePDd3b3cFXlINVZd/se3nM3D6Pb
	hWXRFE/3XiSE5+TJ8V/I3hwTAAuhYTFdJhKDKK+N4PgYjuZGsmCpcxG0SbAZEF2VKbfbTGl0rKa
	pzbreNC/1DqI8elbYAQGLc/zlSBolVb1IrRiw9GdY197qGSb1CvWbEOquOKOr9igXwIqOwz9V8e
	oRQ4cLlgVbWstQjLKaU/0oeonnl2EFcLKY1i+HGUno+e7txADs8LUXBCa73zkl2OquKQrR6jKmz
	fHXG5F1GPukEOm5C4ywXO6XbaGiIWQtJ/9mizgs7SS0JVW5+q5vdSl
X-Received: by 2002:a05:600c:138a:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4801e33c066mr162021155e9.17.1768816724599;
        Mon, 19 Jan 2026 01:58:44 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f42907141sm240781765e9.9.2026.01.19.01.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:58:43 -0800 (PST)
Message-ID: <a7228ac6-86ee-4ee2-beda-8252aa418d31@linaro.org>
Date: Mon, 19 Jan 2026 09:59:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
 <a70f69e6-6ee6-4a96-88fc-c0ec4db48697@oss.qualcomm.com>
 <641421a6-bf42-49f4-8f94-9cb0bce8e97c@linaro.org>
 <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
 <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
 <e94e3391-6fef-4378-b5bd-66aafea95a0c@linaro.org>
 <c3a56645-0399-447c-b7a5-d7af9f567a7d@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c3a56645-0399-447c-b7a5-d7af9f567a7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/01/2026 09:24, Vladimir Zapolskiy wrote:
> 
>> keep namespace consistency between CSID-TPG and standalone-TPG.
>>
> 
> When "consistency" is not defined, it's just a fine sounding buzzword.

I mean all spoken words /buzz/s//vibrate/ :)

> CSID TPG has:
> * modes, which numbers are continuously incremented,
> * the number of TPG modes for a user is expectedly the number of TPG modes.
> 
> The displayed v8 of the "standalone TPG" broke both assumptions from above,
> so there is no more "consistency" between two TPGs, while I explicitly ask
> to preserve the "consistency".

I'm not sure I really follow what you're saying so, I'll restate what 
I'm saying.

The values that you can set on the TPG from userspace via yavta should 
be the same names/values when talking to the CSID version as the TPG 
version.

Just looking at the list of strings, I think omitting the Reserved 
pretty much does that.

But you certainly shouldn't have one set of strings for the CSID-TPG and 
the dedicated TPG which produce the same test patterns, no matter how 
its implemented under the hood.

---
bod

