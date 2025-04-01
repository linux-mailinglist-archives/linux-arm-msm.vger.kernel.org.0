Return-Path: <linux-arm-msm+bounces-52964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E002DA77AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 14:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A24169674
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 12:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B3E202C56;
	Tue,  1 Apr 2025 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMU708Eu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A01EC01F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510013; cv=none; b=DX7NlyeyB+EzyzisIzAEjYhtOBEImMoqzGUpgAGf6hAfey/58L+7qLVPZZdUQ4KIO77HFmQ7mZXgoG6sFSiPfDtPAu1wif1kMSkWEIcEMnxz9SSTGI8Hxj7dnpF0j71lOMvX52W7xkcvI9A4BEAXULEVkjC5BXAIYYtHZazYZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510013; c=relaxed/simple;
	bh=dKjPgmKmqyPFfrKL/o1FVi2WVQPuBqkf3y1a5UJuMSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WAxn2j9F+qo+qoPfNDy3w5JjaXEScUnwuQFLkdoao8lIBKBO8OTFjGvI3wBgfHAuaa7ZOsTF4PkB4SRoh/LsjvDuNWdf5J/W+pxV5Sz1V0j78clAmiAXFuUepiqiNocljmYD4Djo4G27Xs4zXVTHgUkNfQept2NsCfieK4m8jSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMU708Eu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so38989285e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743510010; x=1744114810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u40FSTwz9ltEwkPBj8DAGOUl61JmubNoHLrIbWFFZgk=;
        b=WMU708Euich1hVr/7hx9u1Y7ICDoar0kZv0vgPZsKMr6WmYbXceu+4lK1aiwVsm++S
         ZsPnVcv+FGASTfD06NoEci3eM/l3ypsy1xmYGI/jDg40TEmwHU+vYwuTuk6stJWFN+Jl
         Vx+tLqzNjAS9mg5I1MN4rDcEfY28fNjYjao/uBdjyeB96iOccGipI02nxaIlCvbzZ2s7
         JQSxOhdGIJgfQwG+Dsn2kUNqIsiHSANFvPYcZWBQYBMN6P7N4lFuBW+XAPVx17Klh2P0
         nnvrVOhE3nRW2hqdxccxkYCnfsQEM4ropBWwmv8xoIus7bB/luTqRkx/Tx46esPAWfHA
         XvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510010; x=1744114810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u40FSTwz9ltEwkPBj8DAGOUl61JmubNoHLrIbWFFZgk=;
        b=EVq9vAun250uKrLNxEhQtR0HgKU5LYQB3ZsI0RXQQeIMGjznzWPtx7I7QP0PRqHSdm
         /za+4ba8QnwrCicPYDu8ct7VtT5klar7yxMTbAlobG8GUBvdg/DgHWNvp4I2qULT5QO6
         DiSpjYRdNQwPsuCwh1QmpS//rypKayNQw8rT9a9KBEfoCPIzceDMxN0Q65+y99Px1IN+
         DkLgQTmFI7XgJMKL5vgLe/9jC9iLoB2CgJkSVNjTqn9ygcSNkQLyXCIdrpWAo4qFyxRu
         z5f30AjyJIfNhugHPaZwKTHjT7N6VM3GQFr1F00LjghNLq/TKnj7enlaN8oq9aMBObDc
         /N0A==
X-Forwarded-Encrypted: i=1; AJvYcCWXXN0MZG+ovZnsPNOfhHHZrw2EpwrL+jA09C3rQkS9LRdjK5Lej62NdJbN99/vbGag+hiBwVJwE6evs+5A@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlJz5qbSqduI+jstdWNFzrFDFymQRSQKQwzAqC1+kslMpTZWt
	Izkl3tjKIIZWwr5F/h0QdIDvJx1uMx9AmxvgJEZBNukE7N3RQXvMZP+PnTW1wVg=
X-Gm-Gg: ASbGncvvcyAfpmnjo2cZ//kfaZUb4SFLAzjEG/UybpTZ7zWGjBaX3QBpKiP4vXFWbVV
	CWrEPOekQ706f/lsMa3RL/CG/SiFhNhjvlJZ+jCJWxsr6TItdLu86bT0kikDLM8YH/ccD+CBE0n
	2sz62GM3gYpb8nrMSMItpQB/UWhzEb3YvpaXtDahx43hwIVTkQNeZP3JwCoOHUEEwlsf66DXzGp
	FB3e8Nr4Gwe6P1w/gndjcA/Ihr+kZLgg24oxjxe/3903eIInN9KLsdpAMhz9cOVObaS5xLbZ+XV
	oGB1pPqMxgkLsuEUbmiLP6osZ3Z3MpuSk+nf+fBsDmk8748oPDah9Ev4IrkNOWAN2sAX4dwupmx
	X0mZqebv7MQ==
X-Google-Smtp-Source: AGHT+IEAyjNnqhQdjxN+s3yUvwDysJt9fO4zS10+QJm5P6u0nZ2k22vHjJEOSoho7ee0nVvgqa8ssw==
X-Received: by 2002:a05:6000:250f:b0:39c:1f04:a367 with SMTP id ffacd0b85a97d-39c1f04a399mr4181408f8f.4.1743510010130;
        Tue, 01 Apr 2025 05:20:10 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589efsm14281053f8f.16.2025.04.01.05.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 05:20:09 -0700 (PDT)
Message-ID: <be89aad7-130b-4542-84e0-ffa252dff6cf@linaro.org>
Date: Tue, 1 Apr 2025 13:20:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Trilok Soni <quic_tsoni@quicinc.com>,
 stanimir.k.varbanov@gmail.com, quic_dikshita@quicinc.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
 <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
 <93ca218a-71a2-4751-860c-025ec29b9180@quicinc.com>
 <f1d4d88f-1ca0-4be8-84cd-3ef0d224feb4@xs4all.nl>
 <2539ae48-d75f-bb52-3873-de0b6d9a8180@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2539ae48-d75f-bb52-3873-de0b6d9a8180@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 06:28, Vikash Garodia wrote:
> Hi Hans,
> 
> On 3/31/2025 12:56 PM, Hans Verkuil wrote:
>> On 29/03/2025 02:38, Trilok Soni wrote:
>>> On 3/28/2025 6:26 PM, Bryan O'Donoghue wrote:
>>>> I'd like to volunteer my help in keeping venus maintained upstream.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>   MAINTAINERS | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..5ccddd2030efd96324e53fcee8048120990a85d5 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -19592,7 +19592,7 @@ F:	drivers/usb/typec/tcpm/qcom/
>>>>   QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>>>>   M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>>>
>>> Is Stanimir still an active maintainer here?
>>
>> He's no longer maintaining venus.
>>
>> Bryan, can you post a v2 removing Stan as maintainer? Stan, can you Ack
>> that v2?
> I would propose to have Dikshita in the list instead. That way we can have same
> folks managing patches for both iris and venus, given that Stan is no more
> sending PRs.
Yes, I think Dikshita makes sense here.

I'll V3 this to this effect.

---
bod

