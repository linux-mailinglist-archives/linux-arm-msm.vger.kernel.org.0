Return-Path: <linux-arm-msm+bounces-69766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42177B2C5C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 15:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98B571BA0ABC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9A6335BA3;
	Tue, 19 Aug 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e09qY7GF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B609310645
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610478; cv=none; b=hSIsNBrxa1cV7Sne0ykKkZIR/hn7IYbWliQ9n5OF4+yF7aNekBkjbA86v6AwuWmRVxo8U43VB8cO627E54hQIARSzXUjPeiuFCBTtrbsBPxfO5JDk+EC9H9So7EsfGf8C/QFCVObvXtyc72gdchn/tYZBICFKDqTpDBwDZeF0tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610478; c=relaxed/simple;
	bh=wipzgxzu/rUCZ24ZntLQzz9oqTSOOsAe7X1A0+zrX08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpMzAoyPZLUXjVoPcqMMmzNQ5xPMIL4fKntAYnNcxH9hGBG3Jlvny7C3hxKfvtgaSvbGqF5tKLCuxlR6TdygTMA407byzL6/rzI9MbCvqztqX/3tlngCMDn0RskSI0RDtwEoez/Zk8M/2dTzQawj/LKqDBjNgOnE8Supt7qG6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e09qY7GF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b0becf5so29038735e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755610475; x=1756215275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9ZFei03fy4ZPyixVVD0bhhT9fRXV0zABOzey2pvCiY=;
        b=e09qY7GFqk2uaOkiQe3ID/b1q5kb8s1xn35ziiaUZ+1zHECeWonxQJoPp6Y9dSOglV
         1oXZLKEbLZ+7dXCUFP9J7aXYENfzubh4muCxPj88BjjMLi/l6M4A3VNVxcHyFDcg3m/O
         9oizJST5wMvxj/eGXMcvcNAdLmW6ahOs+asL2A5+gNUiBiTV92Y1mZG18G5Yml1CCW9j
         YSpHjoL0w4c5uGtPtaDy5PwBKh0WeyuQkHwtTkayt3Mt9ohr5kQPI3VWrwpBNmOtHne6
         z1nNYT/j92GR3VIvPBolgSgf3qy/sHn+9PEByLSN9w35yffeVqlGZAYlHTFZMhqAmCAj
         juVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610475; x=1756215275;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9ZFei03fy4ZPyixVVD0bhhT9fRXV0zABOzey2pvCiY=;
        b=qsal8YFO1r4+HhRAWy1CqUNugh0MjaUh+BaW61bAQ/qyX5cAX4u2gP2MaASqSi65Nr
         HLz4+g5mxSlMIwYLtjJ3U5pxGvqc9Pt8TEEDlssKRA3GyH8CqLuPPEqmWqFbit0sdkIW
         iJhYCvDBFZ1dKeKmWNUTpIvi/8dIN9HZshyjOZ51Wp+pEysUhkUbWysA7k5ZZwmJZe2T
         oTnbCZqNK9fG7v1oLgVydcQRVgWwTyNo0wiQ7Lqwfp3jrGLabwu3PAURJwHJe/zA9eIA
         TWSG9o2URy8W/zwe6SpfTzGL0HjlK3X6Six0OPQh0IGsyfc81JKy8+KogULJ+bCo5fHa
         8DGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXltA+YkE1aFLmRlrnHbNFygjOgzHEo9bwfXoiWDCPImqziFYIh+Bzw6kHRnYZfGr+56BQ7ZOwO/fOHaLaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLzEiNd9Hwb17/hn+GzKfr1HpGPFv/abHKGRtqK9yy9xKV5+b
	o5r2omNchLBkiA4r2nFtXJDeJ6871Go/jYSKNgpwdQOlC9PL+5IE7QPZUvPxy8iC/+4Q3o1Czl9
	OHXCetvY=
X-Gm-Gg: ASbGncuEN6YF1tNZOvDfpu49TFbCkZoNHqp0TVfZlfXNeuU3bNqk6+eOEaBkU+NxF+/
	6ZnroBh7+8zM+NZMl+53oqj8LmA9sAvu8DWcRRE6MoUYJjxtzDdkNonVV/jMjzCzuuPUEuXiK1e
	liUxJNPJezc58RMpPMC6wDnA50f9W0iuWvG9ebPDzNo4JKpbZJXS/7Yj0X7cFkmp3ZYOw9FyTO+
	uvTAOL2bxYoEHFhEQg4/BnA+QJFu3y3ZQvVkI7iHfxhlNcqeCTBoQfwF5wwkPE3ojhLut22JpFg
	18+P0qFidbCfRADbiLE64ivnWiO469t3+QD2bMDrSe92AJqkpDErPv0Z5KA5mOba8ZAf+4p7nkC
	CJzksg3HOXXz3qfY7RiSKJWrCCc8M9On5CSIonwkaUQg/Ww8dwLoJn4WklCiuK9w=
X-Google-Smtp-Source: AGHT+IGA4uZOavHskRVazrBsrJEpwCCS9yNXa5Q7x4nDv12AaruKezbMFjMhYQNh3voiuKoxjMWquQ==
X-Received: by 2002:a05:600c:46c6:b0:456:24aa:9586 with SMTP id 5b1f17b1804b1-45b43dfff1amr20520035e9.21.1755610474714;
        Tue, 19 Aug 2025 06:34:34 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a7756asm40936015e9.11.2025.08.19.06.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:34:34 -0700 (PDT)
Message-ID: <552c0e8d-f3ae-4c2e-ac8d-f43cde5c5ccb@linaro.org>
Date: Tue, 19 Aug 2025 14:34:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] media: iris: Fix port streaming handling
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-4-c725ff673078@quicinc.com>
 <40673a17-a19c-4722-ae5b-272082af917b@linaro.org>
 <8b9d5f6e-ee95-e4d1-3fac-fdcb277a7af3@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8b9d5f6e-ee95-e4d1-3fac-fdcb277a7af3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/08/2025 10:45, Dikshita Agarwal wrote:
> 
> 
> On 8/16/2025 4:10 PM, Bryan O'Donoghue wrote:
>> On 13/08/2025 10:37, Dikshita Agarwal wrote:
>>> +    if (!ret)
>>
>> I think you should have a consistent error pattern
>>
>> if (ret)
>>      goto error;
>>
> Its done to avoid duplication of code, otherwise it would look like
> 
> if (inst->state == IRIS_INST_STREAMING)
> 	ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
> 	if (ret)
> 		goto error;
> 	
> 	ret = iris_queue_deferred_buffers(inst, buf_type);
> 	if (ret)
> 		goto error;
> 
> and more duplication when encoder is added.

Understood, IMO the pattern above is clearer and easier to read.

Up to you if you want to change it though.

---
bod

