Return-Path: <linux-arm-msm+bounces-37342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9689C1C5D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 12:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DB7D1C22F41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 11:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0602D1E411C;
	Fri,  8 Nov 2024 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3lAuRG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F92D1E47A1
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731066235; cv=none; b=JRaZEKEB5OeGEl2XCKkSLCmN3CorJpEVKxRuCmL+Pvvz9byCKJRxZrxYqciT0+2eIRLVDfnQ7nNvJRjw/69ZfyflwC31E0jqXZ9RwdrC/KbSEuhty5Tr9cmjOEJltdt5OcZbuNLgdVuyuO9m28UAX+iaSahw8YbyzsEblAE49XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731066235; c=relaxed/simple;
	bh=qjv8Nskk+avwjBuYyWopHdeHY0bXMOaLNpB/xYD+XcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqZvG+04Kp5oKQyzmBqh4B6roiQI3MiTOfmhG577Mj7vrn1UAlgVhxJs/mA8Ge8T3FJhLEBqEJ5qSvupY8MzqrlSa+EZjaaGeFM6SYd/lHJByjJJhxyiqHKy7HzLd+O09y5iRwJ5I4wexK4GYQT04sIeSppY25scr9yue4uUjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3lAuRG6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314f38d274so23936275e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 03:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731066232; x=1731671032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ouVSbkAT3+S3WMSHYg6HVwCj00MU4w8dzA4pzxSauU=;
        b=d3lAuRG6hA9xd+PYJBznZkyI1cz/xYM1tqJkqaJdCHlr8K39DYX0opc9h+xQQ373nH
         qLotlvCaW2g2YuAUHs5sB8eeP2kk0Xqy9hAA91vII5yTn+/wHM52tr0Gm2xd+Hb51YhL
         b8Yo1U+ChMlJh3aHOW3zV3LPsWbWdb55F/vpVlyGtAJn16evmRd63aKDw1JWFoUJsRoG
         tQVK/p7qJyrUzcaDIcT/6teccvBFW6tUTxBEQpxzKn6S2veyjmaagP+/SuDQ0QsQ/zai
         QIWdV8znnMWQF6wKtV/NXtOSUGg0wLhBA3hq7RA4k+glwkKvEJrEAuTHaHeQoPXOE6SL
         0lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731066232; x=1731671032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ouVSbkAT3+S3WMSHYg6HVwCj00MU4w8dzA4pzxSauU=;
        b=R9hdkQi7xYKgbTLCt8HYrDQobAaNRU0RPiEQSVRjGDn/4JhJh0VJxlz9K3LpwH8HQx
         CAFcS25ciQ/061GMNJHpHX0jt491EcN1C8RlMB8OVV/iUWyn2nYYDRJ88X0jCBbiMnWt
         X8qGErkCWvhtAWvrh1EDQnFuSrR4lNgYBwUutVDAsTwyvVXNAMdn83bJErroHQgG6Gxq
         yzD+axGe7YHXTtV051/9/3N9SNrEmF+CYo/JyjPFZC3WfCCyWGVhi3oCt4diGLtobqfG
         LT5b23Q0Fq35a9f9UFx768vPoiY3QFozPvVF5FYt3xCWQzp9P05AX8CljRwcqMyLyH+F
         cpVg==
X-Forwarded-Encrypted: i=1; AJvYcCWNDv7Tek8Ui3Kctcw8g+rv/JikCYsnkrgroN143TJhHwaxEqPwU8p74I1yorL21k0BSA7MuDxL7WVRIwwS@vger.kernel.org
X-Gm-Message-State: AOJu0YyrInQCdZO+cQ+pnoN31oQsQLBVfWfVdwVLfKiLiKQ90wmK8A2c
	ZCvvb/CfE6tqrfQKAdGg44NngI7y+mx0PiucwwLfexB4HlsmdCaH06zIcZfS4aI=
X-Google-Smtp-Source: AGHT+IHenYE2IrQEIw1RwXn2xALrnPWJbFU0VRWzYGh03YSwh3hgPhVUGtDNitZVrXDo/IEmoPy9YA==
X-Received: by 2002:a05:6000:1541:b0:37d:2ea4:bfcc with SMTP id ffacd0b85a97d-381f186bc9bmr2308261f8f.13.1731066232510;
        Fri, 08 Nov 2024 03:43:52 -0800 (PST)
Received: from [172.16.24.72] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e5871sm60742135e9.37.2024.11.08.03.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 03:43:52 -0800 (PST)
Message-ID: <37982a05-2057-45f4-923e-7562c683706d@linaro.org>
Date: Fri, 8 Nov 2024 11:43:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
 <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
 <57544d01-a7c6-1ea6-d408-ffe1678e0b5e@quicinc.com>
 <ql6hftuo7udkqachofws6lcpwx7sbjakonoehm7zsh43kqndsf@rwmiwqngldn2>
 <781ea2fd-637f-b896-aad4-d70f43ad245c@quicinc.com>
 <oxbpd3tfemwci6aiv5gs6rleg6lmsuabvvccqibbqddczjklpi@aln6hfloqizo>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <oxbpd3tfemwci6aiv5gs6rleg6lmsuabvvccqibbqddczjklpi@aln6hfloqizo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2024 13:54, Dmitry Baryshkov wrote:
>>> I'd say, don't overwrite the array. Instead the driver should extend it
>>> with the new information.
>> That is exactly the existing patch is currently doing.
> _new_ information, not a copy of the existing information.

But is this _really_ new information or is it guarding from "malicious" 
additional messages ?

@Vikash is it even a valid use-case for firmware to send one set of 
capabilities and then send a new set ?

It seems to me this should only happen once when the firmware starts up 
- the firmware won't acquire any new abilities once it has enumerated 
its set to APSS.

So why is it valid to process an additional message at all ?

Shouldn't we instead be throwing away redundant updates either silently 
or with some kind of complaint ?

If there's no new data - then this is data we shouldn't bother processing.

If it is new data then surely it should be the _current_ and _only_ 
valid set of data.

And if the update is considered "invalid" then why _would_ we accept the 
update ?

I get we're fixing the OOB but I think we should be clear on the 
validity of the content of the packet.

---
bod

