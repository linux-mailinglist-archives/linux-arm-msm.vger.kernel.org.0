Return-Path: <linux-arm-msm+bounces-36163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DA9B300A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 13:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B8E71F21146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D74D17C61;
	Mon, 28 Oct 2024 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="airc98HC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18691D61AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118163; cv=none; b=eO1sqMvlKUIlvT4eIm9rqJXhFNAC4TgADveetBEKxI/lFfMGkW8U4H1tY3k8jnajx5NR9rSQMN6daii1+n/4ciYhS5DQWhZluL/CqsbHZNUS/E0UtYh/vpHN1w98OhdL+r3oM3DWXWkJnD2oBuMpqT/ii4dsvPKahbAd0J3O7bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118163; c=relaxed/simple;
	bh=v4nnScfFa5IpOIZ9twe89aFRYX0+3V7eDmJUoKi7jBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSuhVimJyNOUk9Dw3VWZmWk/WcHk4zfLMw9/8PbO4mhjsYkobe8AVG2WZJA5GUZWi3YAIcZFQoMbmT2ndqdJbJGD1+zhvVjoDclHx/RymuWEZEarUyJJUehsdn8MJ2Q+e3fKe6F0pc3x1TrjMGRzPMYBBaSwUbRpazezdXhR8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=airc98HC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so41480315e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730118159; x=1730722959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42xlY4CTCCMOJREXIIl0KBgi7tSrmtE7L65YgLuMbb0=;
        b=airc98HCdIQ9DoCEE5RgjxPbpeeXH0GkTJHFFixUvha9b4FHJFHEE2Gu5L0fnPF+zH
         INFu1Pl0tPRIPg1FFQTRmE/4QH+lutwJ/zlO1cIa/sc1u7+c2fe9JKw8ZQUAOgTW+T6W
         nJ/UoeFesd/0TCionM0jyP7XJLGlo++U26Jb3d9CD+TMWKPt9hXg2OrRbMfF/7WTfWjo
         VYh5Vgt9pT615ZdENQZOzgPqr2jO/7KbOJeHGwvvLsbK4hv11XANKAb3xX9QGO9U7ZLL
         VbyUtKcVRfA+j9Wj03ooO7XvHCJus6yMaFoes33gQg5BeOYoTNBdh/PscJZZGvd+LTn+
         mGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730118159; x=1730722959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42xlY4CTCCMOJREXIIl0KBgi7tSrmtE7L65YgLuMbb0=;
        b=hKirmeJ4ipFTW1GJJB77ePQTwi1PkO54lF3jKSc3zT1Mx4DR7LEHod/OUt8Ericton
         VxGAtxewopMQ/WZaoxPqMGfuJxdbk0rLsQ6YxKb3loN3FoH5OBzG2Y8M81lC4Bf8n/19
         PvDPYuoOkps4eSdW92EEvTJfQy1SInDmADmIkjJVjpmeDTui3nVpZg/u6FrqFXDlEk6k
         /kVuzkMs3pxpJX5iJH7Tnrm5YpbTyBuT+Rjn1uHH/Jfh5KVXmHe/H1J/HLlEqqfL4C5t
         quszNeIc9gj2XzFfMElkKHZpxSvzMRw/7r1P2xpjbVo4tc1ZUx1hkyHbHktcxUP/YJ6j
         YiFg==
X-Forwarded-Encrypted: i=1; AJvYcCX6sgLrD9jep/ksST5klxBmt0+u7V3IqO3dV0QcSfrFc5PzyJjgZm6dIbhqvj8f0XNi+Bsz9tzDV7XkOdgg@vger.kernel.org
X-Gm-Message-State: AOJu0YzhzJKexbKBkHPksTwaxRVOVtAy+gSna0oEX/9z7bRqx9WS050J
	kjzuad4eU40l/p4gCa2Cal8ahxuEKUvrDXuQQ46Li8HKSoM57dKueszZk3oKNCc=
X-Google-Smtp-Source: AGHT+IFjtgIbINxQhGCP3y3IMwTys2Lf+h5YOyZA5SnPjmMIY+gDkrQ9FsjGqZHJrSO24BCho1A2Qw==
X-Received: by 2002:a05:600c:4f06:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-4319ad043e7mr75108345e9.22.1730118159031;
        Mon, 28 Oct 2024 05:22:39 -0700 (PDT)
Received: from [192.168.0.140] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935962acsm106569315e9.19.2024.10.28.05.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 05:22:38 -0700 (PDT)
Message-ID: <8bd63441-7414-4bc1-9044-b3f1e7b21384@linaro.org>
Date: Mon, 28 Oct 2024 14:22:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: Rework BCM_TCS_CMD macro
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241025084823.475199-1-eugen.hristev@linaro.org>
 <c1d4c2b6-85a0-467a-930c-ac2797c72699@oss.qualcomm.com>
 <a4c44b88-d106-4365-b405-ced561b9e526@linaro.org>
 <6852b25f-94a4-4e04-adc5-5c79eb1f17ca@oss.qualcomm.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <6852b25f-94a4-4e04-adc5-5c79eb1f17ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/25/24 20:03, Konrad Dybcio wrote:
> On 25.10.2024 2:06 PM, Eugen Hristev wrote:
>>
>>
>> On 10/25/24 12:03, Konrad Dybcio wrote:
>>> On 25.10.2024 10:48 AM, Eugen Hristev wrote:
>>>> Reworked BCM_TCS_CMD macro in order to fix warnings from sparse:
>>>>
>>>> drivers/clk/qcom/clk-rpmh.c:270:28: warning: restricted __le32 degrades to integer
>>>> drivers/clk/qcom/clk-rpmh.c:270:28: warning: restricted __le32 degrades to integer
>>>>
>>>> While at it, used u32_encode_bits which made the code easier to
>>>> follow and removed unnecessary shift definitions.
>>>>
>>>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>>>> ---
>>>>    include/soc/qcom/tcs.h | 19 ++++++++-----------
>>>>    1 file changed, 8 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
>>>> index 3acca067c72b..130ed2582f37 100644
>>>> --- a/include/soc/qcom/tcs.h
>>>> +++ b/include/soc/qcom/tcs.h
>>>> @@ -60,22 +60,19 @@ struct tcs_request {
>>>>        struct tcs_cmd *cmds;
>>>>    };
>>>>    -#define BCM_TCS_CMD_COMMIT_SHFT        30
>>>>    #define BCM_TCS_CMD_COMMIT_MASK        0x40000000
>>>> -#define BCM_TCS_CMD_VALID_SHFT        29
>>>>    #define BCM_TCS_CMD_VALID_MASK        0x20000000
>>>> -#define BCM_TCS_CMD_VOTE_X_SHFT        14
>>>>    #define BCM_TCS_CMD_VOTE_MASK        0x3fff
>>>> -#define BCM_TCS_CMD_VOTE_Y_SHFT        0
>>>> -#define BCM_TCS_CMD_VOTE_Y_MASK        0xfffc000
>>>> +#define BCM_TCS_CMD_VOTE_Y_MASK        0x3fff
>>>> +#define BCM_TCS_CMD_VOTE_X_MASK        0xfffc000
>>>>      /* Construct a Bus Clock Manager (BCM) specific TCS command */
>>>>    #define BCM_TCS_CMD(commit, valid, vote_x, vote_y)        \
>>>> -    (((commit) << BCM_TCS_CMD_COMMIT_SHFT) |        \
>>>> -    ((valid) << BCM_TCS_CMD_VALID_SHFT) |            \
>>>> -    ((cpu_to_le32(vote_x) &                    \
>>>> -    BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_X_SHFT) |    \
>>>> -    ((cpu_to_le32(vote_y) &                    \
>>>> -    BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_Y_SHFT))
>>>> +    (u32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |    \
>>>> +    u32_encode_bits(valid, BCM_TCS_CMD_VALID_MASK) |    \
>>>> +    u32_encode_bits((__force u32)cpu_to_le32(vote_x),    \
>>>> +            BCM_TCS_CMD_VOTE_X_MASK) |        \
>>>> +    u32_encode_bits((__force u32)cpu_to_le32(vote_y),    \
>>>> +            BCM_TCS_CMD_VOTE_Y_MASK))
>>>
>>> FIELD_PREP/GET?
>>>
>>> Konrad
>>
>> What would be the difference/advantage in using FIELD_PREP/GET instead of u32_encode_bits ?
> 
> Probably none. I thought it was a function and not another magic macro,
> as it's lowercase..
> 
> Doesn't le32_encode_bits do what you need then?

That works too. It would move the `__force u32` to a higher level, but 
works. I am sending a v2 with that.

> 
> Konrad


