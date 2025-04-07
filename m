Return-Path: <linux-arm-msm+bounces-53359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C1A7DAF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 12:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BEC23A2467
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 10:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DBB230BC2;
	Mon,  7 Apr 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDmpOHgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8791A227E82
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021232; cv=none; b=UDvOY1RklhPMp0+ekIyaI4FiKMw7wQdXDDvIt41ftMlT0Ce8O5kckdgPHeQ0993cXNuMGNpTeWb+kEXRStbLZluMvsQWp2U0HpIpWYwPMUfymG8jlkbkW5wE6ivX8AwxtnpCfO3BQtqEockF6zFSyOi/Icms8CtYWWEdx7LDUgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021232; c=relaxed/simple;
	bh=JFVMB2yW22lXmwWMWcPmfPT4MtEe/YQP2YeKvV+tCEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPIhSgdPKiGN6Gl8Qr71lTjKO+s6rN/wcHPeAeRKKSdtT7K7VBgHy2Afz9+r0MTsxA+MA5EfOnstCC9CG7gbTeUreue8BmHZhePbeOhCot+zi0FShx16H+QELQYZfsFTFK1/TpOwodCFKjkbGBcSA4aZczvoTJViTOlYBybYCdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDmpOHgo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3274888f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744021229; x=1744626029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezQp2+U6ixHlt9GUKNzafIUfaIB4N3lwLkkdWaVaceI=;
        b=iDmpOHgold10PGwzlos/SaBDDmsBqEnI9/2trRkv4zQn6B4cmwv5swaH7VKmWxau30
         4Z9O2OwvTtbTnRmrrSI+ZuKjuA43G5AYwRboYjM580xPFGfo14z/gXdtCSqgRPsTpJ3H
         cOWyQiNsDk5IflFXHZaAszy9A7rWCKHfDA8ndCt6tOpYRLn0nUU9YOvTIaO+GRFAVvSy
         cg0lIia4YsEY78TaElZb8NKzHw+P7wkfqwDrcTtKsXDI56aTmgva2QMBE5UXPjiNS4VX
         jKsbYmSWLYyn6trnNEbCC0KlZweGl6by6AVLD8XNeusGjvRP4+tJOs4gHx/GdCHkoj9f
         CRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021229; x=1744626029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezQp2+U6ixHlt9GUKNzafIUfaIB4N3lwLkkdWaVaceI=;
        b=t8H/tnRmsB86rIE7sFvnwvukYQaB6Q2Esy3TV7v/4p+xF6gQKMNyBzIDZEerueC88b
         hWN8VXl5EekI/C8ZBpZuErw48JF28g3EeFPNEmzb4FG28B0EsfYQHvQHpps16pWKnGvU
         0uQY1LoKiq2MUVrpLKRkGKrXUxORVpItkg7iRZFHa//JXe4NhxLwZYVSung4tgMpvq6J
         KdspPcARHiiJtI02Ty72j8OuhyyjNeNPmJTrVvKvwvDUg08zXS7W6K+JLkVl+z1fMmY0
         uMQIewr9ETCCgIyioE8s8QiSSNs7QAFIYhkXR9EF3lehuorBZwjfoQz61iKbf48icKuS
         1OWg==
X-Forwarded-Encrypted: i=1; AJvYcCVJmPg+a47Aa7p2hPJWZZG94gpnZzVP2eJNmOMixJYnvEpGf3nA4235scR7LOzqKSeqLUalTLFWoDQc37Gh@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFc49NS5ERoilS9ITjq/tHqgRYZ2POdezI7MQXpCIHU+xOWVy
	Si9ADYDliRjF+29D8xJvzrQok9vCtClXXPIhakboXt+9d34puGJH982OWY7xNfs=
X-Gm-Gg: ASbGncuOjVlCkYdGzJZclrohQoXgvi/0/o5XUWfwZRzAJVP8E1lnFEIGr/l8kOjF46N
	M3dR3KQy64f/YCYj5klx5uJ/fsgwiitcWSnneYdfsCd7S5UfUI0dZIRyN4ktzOSNqeeydL0Jkuq
	B9zpkVCMEAXi6GpPNJ8et35JUc9IN6V7TXk7wFhKqeKiSNeZ807fpDaimmrwpYyzO3hVpcq8TKB
	U4pQCHcDztCIJ+eIWYrAuWbUdwnq91iZ8FzP7+oMxyzg3c6KtUU3pzkGjv76WiibSiVoH/uprdi
	fMG7ZacnIeAFS3fplQQhtIFjl59nUVu0cdU9BzsRDz7qUeedkJ3RRF4CpADWlKWPeceH3Wquekc
	W+QdvdhFAGQ==
X-Google-Smtp-Source: AGHT+IFBFVAvZvAQWJ5FKIazBfYYoIxt8b/d6GZyBtfy4dBPa0KMfqalT1E6OJFjYBvAIvbUjzNAlg==
X-Received: by 2002:a05:6000:400e:b0:39c:e0e:b6d1 with SMTP id ffacd0b85a97d-39c2e6112ddmr13566771f8f.12.1744021228977;
        Mon, 07 Apr 2025 03:20:28 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm11734041f8f.62.2025.04.07.03.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 03:20:28 -0700 (PDT)
Message-ID: <b8dde6e9-5e84-4e4b-921c-4a2e2b3c05f5@linaro.org>
Date: Mon, 7 Apr 2025 11:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
 <012b0381-a5d1-49bc-aa59-aae0d35aa034@linaro.org>
 <84fd283a-ca87-4689-8955-855f7275d6d1@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <84fd283a-ca87-4689-8955-855f7275d6d1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 11:15, Wenmeng Liu wrote:
>>
>> Great to see this work.
>>
>> I think the TPG should be another type of PHY.
>>
>> ---
>> bod
> 
> Hi bryan,
> 
> Do you mean to handle TPG like CSIPHY and embed it into the CSIPHY driver?

I have some example code I can share with you, I'll dig it out.

---
bod

