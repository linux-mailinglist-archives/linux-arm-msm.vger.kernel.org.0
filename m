Return-Path: <linux-arm-msm+bounces-74113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C97A0B871E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 23:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F4B1893730
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 21:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F5B2E0905;
	Thu, 18 Sep 2025 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdgu7m42"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A016B2ED848
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230707; cv=none; b=q8FbW+0vRfMxZ+oXZXMwCQJL8LjUvnWYKLfyRsPm8efkVmNQsapNsFLjjpZjGK2NnDQdFzE9MTYCZJu4G4AAJ33QvrBGdTHNbFOoEqOtgEhxveuuUKW8Ko7SsVNEogx7rxLjcXxjzWxDXfl78ZReOofItkNgjGfGNIphPzsuE8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230707; c=relaxed/simple;
	bh=0Orrvnym9z6mx+qpAqsBTHEzgkRRZum9L9LV5MLQZns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6c7wHZsUg8AU4RON7A70Jwt+BcBYpM89TJmIbGEwS1tZZhB2EEow4eRFzwqITbykbqvsbrvBopP2iNQJNrNZ69iGliiFLanG7RVJoJcK3EorP/hcsslF73jCGMQINBbB7hDFQqhf7hUZzuq/9sSgpwco2fa7KjNGsEUyu3v5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdgu7m42; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45f2f10502fso8801005e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758230704; x=1758835504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otQb23FFW/XLhr6Oh4NQ/t5sBVjKo9CxPKgxi2MGprU=;
        b=jdgu7m42NDv6ixwTSCratw0l9mcTHs/P6NKZbRYnE6OfYFPFsju6KnRP+UixwzdCHW
         JVrtA99LnWM5Z982z0SOHpWmUVk7S52HqXHXauIFZn5r9VRM8frmst/KczF/RAtDuKBd
         ybTDX9rNq0vWKRR7gUB25uVYrUTg3qxumLQdoKBR4L3j0TAxtom2A6jvYeUYK55MJE2N
         CRFvjTNw1X5cqeSpc1Y3/4J5M2SFBS2gMbyKZvSKfm9Z+AY24ah8WyW/DXbFlQjQx8eQ
         /KqRwa5+C3ISqAWgLIv50xYCpTo4/G7nENkcelQdfrQ8pvvehHEDKqLVZNqSBTtHkRxS
         blfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230704; x=1758835504;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otQb23FFW/XLhr6Oh4NQ/t5sBVjKo9CxPKgxi2MGprU=;
        b=oOHs7HEY2yTtc9g17eBaWQtntqSylKXUwA13AGJYca/qyfCRtcaaz6TWTvXD3yLDx4
         EKEVo3Cbgenrt9EOxyaUdbxw1WBsrrNSWz7FDgoFtvbdGgASgZAdIUlfGua4z8guyI6e
         oGlIXTjWtmTlnZ1BFp5YW1AVjwaGwEnDALBtlGoMeF67WasHy5Evf9f0hR0eceXOLKX1
         3O11Y1IIpWkq4xx9b9nQgLRWBaCr2oMqBO6CvVcz0ZuNE5ypZp/IYTQTnCkNgd0EbjwQ
         WHM6gfmo6/NsXlVTKaNsh9iTtRmNXnaVdqNUFl//iBrwsMDWIWXTCR9lDKk51fCqnSRL
         ddmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbSaJ/M5JmpU6ByLN9MnNQslKX0D343lqBEXs3slcUdnZ6QLBQXbfEkC51QWRlxlePrSIVLWiz/x3A2+z6@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxCVlbGNz/9oXV7wB56OUWbTUqf+RxS1G8FydpTQyMH0dceNC
	1Ui50fn19KypGIEP5Hq4ft8mnUmjBTJXyXx1kJovn6f0h8oJLnsvBJ2viPn4MQjn7y4=
X-Gm-Gg: ASbGncv4DOGIA/gS4PMb+6UKd2H2DBOv25+t0uGh3SM71h9UdBUitW/fjwEy/Nb42Fo
	40WW68kIjlKbTvLKvWOdFFiQHmwAjt8wq6+/aw7vmbX3wgcyjLMckqZ8/QMxF7OjOY6gzPHF6Ms
	0JDdJvOcVWU6nef1PFHa4r3f0CLQs/F5Epc7xz3v3BuVUxLtkbuLrA1YIrgkYNzvav9XW4vEob0
	nNKcxjGQgd9hKhTd3TUibiW57eAOjAO/oy6bg75K18Lq/QZvFPy0FWDgoGmNsGzwiOq4G+CZ75p
	/voR/lDlIJ8k2BFdxL+ko8KxIkyHg+XDUf8T/+toiFnlM2DyO9IBVUT3/vFPdBaArNeb8SOCYAZ
	b7ounUcLClHbOWQaKbE1XoXq34wKzypZNTr57TS/GIc70Dbvj6ADh0ehEn6XHin+vaE8bWf6w/P
	CYjvPNMYMZXafaraQuB8MSTIFu78IBOq4iAf0Z/A==
X-Google-Smtp-Source: AGHT+IH01Q3BMBxvVH7m//3u3Ebb9hjBK36gAEMhS02bZTEjbdioULidegt2Ht2MGCXIEyWOW0PaKw==
X-Received: by 2002:a05:600c:1f85:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-467ec45ff4amr4854965e9.36.1758230704012;
        Thu, 18 Sep 2025 14:25:04 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad359sm70611035e9.22.2025.09.18.14.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 14:25:03 -0700 (PDT)
Message-ID: <0bb932e4-9fb5-4ee0-bd21-6e30d6c8044c@linaro.org>
Date: Thu, 18 Sep 2025 22:25:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: Rob Herring <robh@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Ming Qian <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250813214949.897858-1-robh@kernel.org>
 <CAL_Jsq+vUNtMw6JS0ac6a8LTdJBB+UepadpDxP_S8vr6QwUiNA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAL_Jsq+vUNtMw6JS0ac6a8LTdJBB+UepadpDxP_S8vr6QwUiNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/09/2025 21:22, Rob Herring wrote:
> On Wed, Aug 13, 2025 at 4:50 PM Rob Herring (Arm) <robh@kernel.org> wrote:
>>
>> Use the newly added of_reserved_mem_region_to_resource() function to
>> handle "memory-region" properties.
>>
>> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>> v2:
>>   - Rebase on v6.17-rc1
>> ---
>>   drivers/media/platform/amphion/vpu_core.c     | 40 +++++--------------
>>   .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
>>   drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
>>   3 files changed, 21 insertions(+), 56 deletions(-)
> 
> Ping!
I'll pick this one up.

---
bod

