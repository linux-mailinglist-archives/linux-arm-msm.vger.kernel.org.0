Return-Path: <linux-arm-msm+bounces-61713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BDADE99A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 13:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2E361888FDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD47B28A70D;
	Wed, 18 Jun 2025 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QV9TfPox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5F028A1DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244914; cv=none; b=qko2u9Ar97qocOhom+uZTi/hLjPEp2gie52XOtfsqn0QfeV7umpRijBKrNDFZk7JNd/S0wD5DIayrXV9RlIQcvYfas6vof7xQwHNEB6VzUc3vlIw393VoM1HTA/29Sx27P6r9tvLdmDbF/5zqo2IkWOB04STfcVjq69JaB523wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244914; c=relaxed/simple;
	bh=DWY2j4BwgDoCzsCVjrX9qM1FVccm21ydRjarE/7nZ9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PD6++r9gRMLXeqB5ousG6mpU796xvEAIACq7ssJAWfn898KzBybS/NOqyKe+eN1j5F1tj6peRTEO+g9yFg9ZVIgPJFEyDCmlNshdgG7TmwkNurVVt1EOTwT/YgorxWuyodVvzI07m7agLJhVoXuUNBalqJsNMWRwtVfMHGraV9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QV9TfPox; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso4573102f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750244910; x=1750849710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtIjx1H604kHpCCT/i9zvqA7AzOCUNGiWPkoqfHW1sE=;
        b=QV9TfPoxKU01x8k9NAfXKlCa1YyT+zTqXKb91djJ0sAki9eFV1LaPqVe3j+R51znh6
         pAhwNamN754RTI5q6/TbU4r3KqK+LZd+Uwa/K5XhLbpLOfKKottLuJ1oJ1TiQH7pF/i3
         mP9t+O6IMfqfTk/fMQkazCPdL/pSuK3YvnwyDlF79xd8itbGjP3VyKY2VvJtwwHvpgO8
         jpJgGI/Ehxh+hz3c8/4ikaqWSPL0bq46dWVfpgRoAqz4sdt9U1Afgix+Xyq+WjecbrfA
         oNNhTN6Jj1OvY1qhK14R1xRQKcpzehuvcs2picfNfsxO8OVcAfZ5jrCPQiscvBBiAL2F
         j4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750244910; x=1750849710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtIjx1H604kHpCCT/i9zvqA7AzOCUNGiWPkoqfHW1sE=;
        b=aX+KGvpJQusKKlxtDq8N/k60+hi4vodhI1ZimwcnS39k0TSLmjyxAgQWtU4YUm36Z6
         JB9ir2Zq2M33u39byE3iur11QRewIoRM72K4hIpiOpA+V3by6zmmN2er/JQXuuv6FxBK
         Ag9bqu1Rjay/II4qQs/02REgS+Gb2bPh6gko9zQBliKsbgNn5SGbwB4ZC1p6cbGsKXX8
         HnlF30UYp6eaZ3pHbyy3x3u5ygNGisXBqVLNRGN06Wu3CHi97Z9HKVQ2h/GIhkwOxAni
         WSj8JR5FMHdWBS3PA4WiS1wUuxh9mPCA6Npv6tccjo2wkayXYgVpT8ePEdmkMxLWWWD0
         ya/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOVQWl3XSs5ayQKVR8wMVZr6VhLk/p2S08//licIUbyH+NB1+UX6pacv3U717bugvVqKhsr/inMTURUYBj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1yYaiOAlUdYzA7OJlFu7Zhi3JGf35cpmDtWwtMmatpWLND6Kk
	a6QEWtbnoXMXGCv2zh2HYvnmjIwUHqu5Uhnuh7ygbMehVKSVKj5UXkV1mdJxv/0Hl+k=
X-Gm-Gg: ASbGnctt+w2uG5D9q5zchJSfpZ9S5UE1b8C/DL6RclA3/N8oOMdzonBwX1RtMebmj3j
	/UvwyJlVm5psTteiyIlFpkL2wqlxFed5Tq3vTfbxvZIK6DDECj516ha0JUVftY6QoHkZmD1MB4l
	a9HOT4hECVdNZPF8dYSZM+e5mg/EG/NmDf7wXWOq8p6H89tO9R6xvrGRgZ9Ar47FKt18RwdBS9a
	7QbP3JsNwivb4VpXPfxHnsnT00ACSnsFp2VYZ/6z7LLNux97DUjuW0m79Hf4AvKHB8+psajkcj3
	StpICr82CxmcWPIuUXKzREEHhbaFFW6INR+LdazrJXvfhGaLF8+08IJX9lpSNqUekaJCRrM5ym3
	clNjhWjxuVsgetNe/YRWk4IoI0m4=
X-Google-Smtp-Source: AGHT+IHn/G4EzkvrTYF2d+H9Hf5eubic1v9xu40MDUa7Z15ib1OJXlBvAfwdheD+/JgizfAMHPCa9Q==
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a57237c9a7mr15991668f8f.26.1750244910365;
        Wed, 18 Jun 2025 04:08:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7389bsm16713344f8f.37.2025.06.18.04.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:08:29 -0700 (PDT)
Message-ID: <ec3defcc-f19d-4224-9029-14c1e95399b7@linaro.org>
Date: Wed, 18 Jun 2025 12:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, quic_dikshita@quicinc.com,
 loic.poulain@oss.qualcomm.com, mchehab@kernel.org, hans.verkuil@cisco.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com> <aFAVTvsDc8xvwBme@trex>
 <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com> <aFA5FpJPRmJ/ltI9@trex>
 <aFJlqGFPrO9Hw4f1@trex>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aFJlqGFPrO9Hw4f1@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2025 08:07, Jorge Ramirez wrote:
> On 16/06/25 17:32:38, Jorge Ramirez wrote:
>> On 16/06/25 20:14:36, Vikash Garodia wrote:
>>> Hi Jorge,
>>>
>>> On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
>>>> On 16/06/25 17:26:24, Vikash Garodia wrote:
>>>>>
>>>>> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
>>>>>> Ensure the IRQ is released before dismantling the ISR handler and
>>>>>> clearing related pointers.
>>>>>>
>>>>>> This prevents any possibility of the interrupt triggering after the
>>>>>> handler context has been invalidated.
>>>>>>
>>>>>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>> ---
>>>>>>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>>>>>>   1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>>>>>> index b5f2ea879950..d9d62d965bcf 100644
>>>>>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>>>>>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>>>>>> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
>>>>>>   	venus_interface_queues_release(hdev);
>>>>>>   	mutex_destroy(&hdev->lock);
>>>>>>   	kfree(hdev);
>>>>>> +	devm_free_irq(core->dev, core->irq, core);
>>>>> Could you please check and add the handling here [1] as well ?
>>>>>
>>>>> [1]
>>>>> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
>>>>
>>>> hi Vikash, sorry I dont get your point - what do you mean?
>>> IRQ need to be freed even for error cases during venus_probe().
>>>
>>
>> but  this is what the current patch does (venus_hfi_destroy is called at
>> the end of probe error handling as well).
>>
> 
> for background, this fixes a null derreference in the Venus driver -
> reproduceable in RB3Gen2 on a particular error condition during probe.
Shouldn't it be the case that devm removes the handler for us anyway ?

Why not ->         disable_irq_nosync(core->irq);

i.e. disable the IRQ until the normal/expected exit path removes it.

---
bod

