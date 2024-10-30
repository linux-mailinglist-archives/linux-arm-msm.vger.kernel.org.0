Return-Path: <linux-arm-msm+bounces-36381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 028DF9B5DD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 09:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8525E1F23F63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023E11E0E12;
	Wed, 30 Oct 2024 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJOpCx1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B11E0E1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730276899; cv=none; b=avf/ircZ+ojFvdG+IOvyTpe4PRQGDDh4++5rBsNVa+Qc0/8FaLIDIKRL0ZEGQ+IlQ6jYCibVCz+ZINS05258Cs3KD7x8ZQkVyJi045Cr3do2GaG1iZJWbKxIhgrrNLkExZiadI7VhMvk1ptFzntRB1DWiapbMfhgM6MNCbBASyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730276899; c=relaxed/simple;
	bh=intKQltl8qe04sX6ih8WJjx4/6q7A5aJSvz7oVoo5PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQEitHKuuwIjkfAg29Ox4xj4/HHNsj51wMJt4cwjDj+3bkek5sOz1Elbpxj/pFcRlWTwVQMgdrgO4OGNqMHBtn7A8FT0Up6GBWA7QDHv7Wshe/gQh1MR8sEkcXQegyLhrk2Pcgt7AnhgucDYrCVreqhNshFHBCcKzQzrjEs8sAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJOpCx1G; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso59679885e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 01:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730276896; x=1730881696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UL2HqkuSmHQ7OPeQE/93gQ+LDrEwS9SDaauaieTM4CQ=;
        b=wJOpCx1Gaf8LTArqtp2fT6X+gmETexc+s9V98CpqALLzROINVQ7PV9/CjxJt6h9rFZ
         ipiJi4zQ0FsCZv3jfXY+SjUfDzS6g+I/SgFF8jwTBJlmYl5XHBUGiasLTLdOFeMlkm2R
         HFBRPfbzPOh1eVRnaq+wfJiei4iPe5KPMfFAnb5+/OjQ8j/58rDX5G6k+J+5wLqpPruE
         bj3qyVa/00LWMvgi3lBA4vpFKMVDNQO0q5+RcrEca+0GmBlacnqewODf7OG6jXHCHHRs
         spYq1/Ldcqd5fT6U9lQrgdKUdSdLilUplA+1yRVTyrvghVJXm+QT/BXhDVfHVo9PBZfo
         H6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730276896; x=1730881696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UL2HqkuSmHQ7OPeQE/93gQ+LDrEwS9SDaauaieTM4CQ=;
        b=bo1H6DKo3V8361RVlr8Htn6v2I5B9sdPtHHn8/DkJlka6r6MNy8MM3psbR6LtWLbo9
         3M/1Vgela37VDskB+enWw+Zmw8XMNrvsY1jcTjZfuP4GMO3Faocz0+xqzio9yOZoRbfu
         2URSdg1fTGnD40L3r2ZdEd/Kzs4KwboqQ5P2B/COdon5xHJqfp9VGGKFcCdFtdCYyfzs
         iyucSIKeAeGjIN4lR7wLXiAeEDAqeXQnr/QsE8Xe3u82C+B5N5YX2ytsm6SvpZORCG+F
         bx09qDcNEhIzzTypF3Hvizn6gmNjG1EKyMoNRGvvNDdpzkQ8jGOUCdtS18iLpEkkXp3R
         vmgw==
X-Forwarded-Encrypted: i=1; AJvYcCXx1k+5r1nVcZg7N5ERXCelbGL5csVgRQF/1/BlGnvz/QAj5qCenzAsJUOVlNMYxUEiyfK4Cwj8WHpH4UuW@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUlANhUAoJk3uHQFv9/evovKVgtobnfYV8guMXALKCdwu8Qgv
	K/bjS5RKfOvMCHGoDN6M0jekHXBUQ72cGqhmcE0J+ydWdtVhirmsWXU3P/qmlr0=
X-Google-Smtp-Source: AGHT+IF2VwBune3eYE6REO5H1xO9vZLSDRXCcz1HESbflFaHLwuvzmPQ13IVdJ+0j1WTo7gHVfIs0g==
X-Received: by 2002:a05:600c:524c:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-4319ad24a7fmr142258435e9.29.1730276895897;
        Wed, 30 Oct 2024 01:28:15 -0700 (PDT)
Received: from [192.168.0.140] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8549sm13853315e9.10.2024.10.30.01.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 01:28:15 -0700 (PDT)
Message-ID: <7b57ccc2-7060-4adf-b896-8992ec05125c@linaro.org>
Date: Wed, 30 Oct 2024 10:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: Rework BCM_TCS_CMD macro
To: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, djakov@kernel.org, mturquette@baylibre.com,
 evgreen@chromium.org
References: <20241028163403.522001-1-eugen.hristev@linaro.org>
 <bb5d855954d5ff8694a3978a9f87a9d2.sboyd@kernel.org>
 <6f14d8d7-7b9a-49e3-8aa8-5c99571a7104@linaro.org>
 <b587012e868f8936463c46915b8588c3.sboyd@kernel.org>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <b587012e868f8936463c46915b8588c3.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/30/24 02:40, Stephen Boyd wrote:
> Quoting Eugen Hristev (2024-10-29 06:12:12)
>> On 10/28/24 19:56, Stephen Boyd wrote:
>>> Quoting Eugen Hristev (2024-10-28 09:34:03)
>>>> diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
>>>> index 3acca067c72b..152947a922c0 100644
>>>> --- a/include/soc/qcom/tcs.h
>>>> +++ b/include/soc/qcom/tcs.h
> [....]
>>>>    /* Construct a Bus Clock Manager (BCM) specific TCS command */
>>>>    #define BCM_TCS_CMD(commit, valid, vote_x, vote_y)             \
>>>> -       (((commit) << BCM_TCS_CMD_COMMIT_SHFT) |                \
>>>> -       ((valid) << BCM_TCS_CMD_VALID_SHFT) |                   \
>>>> -       ((cpu_to_le32(vote_x) &                                 \
>>>> -       BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_X_SHFT) |    \
>>>> -       ((cpu_to_le32(vote_y) &                                 \
>>>> -       BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_Y_SHFT))
>>>> +       (le32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |    \
>>>> +       le32_encode_bits(valid, BCM_TCS_CMD_VALID_MASK) |       \
>>>> +       le32_encode_bits(vote_x,        \
>>>> +                       BCM_TCS_CMD_VOTE_X_MASK) |              \
>>>> +       le32_encode_bits(vote_y,        \
>>>> +                       BCM_TCS_CMD_VOTE_Y_MASK))
>>>
>>> Why is cpu_to_le32() inside BCM_TCS_CMD at all? Is struct tcs_cmd::data
>>> supposed to be marked as __le32?
>>>
>>> Can the whole u32 be constructed and turned into an __le32 after setting
>>> all the bit fields instead of using le32_encode_bits() multiple times?
>>
>> I believe no. The fields inside the constructed TCS command should be
>> little endian. If we construct the whole u32 and then convert it from
>> cpu endinaness to little endian, this might prove to be incorrect as it
>> would swap the bytes at the u32 level, while originally, the bytes for
>> each field that was longer than 1 byte were swapped before being added
>> to the constructed u32.
>> So I would say that the fields inside the constructed item are indeed
>> le32, but the result as a whole is an u32 which would be sent to the
>> hardware using an u32 container , and no byte swapping should be done
>> there, as the masks already place the fields at the required offsets.
>> So the tcs_cmd.data is not really a le32, at least my acception of it.
>> Does this make sense ?
>>
> 
> Sort of? But I thought that the RPMh hardware was basically 32-bit
> little-endian registers. That's why write_tcs_*() APIs in
> drivers/soc/qcom/rpmh-rsc.c use writel() and readl(), right? The
> cpu_to_le32() code that's there today is doing nothing, because the CPU
> is little-endian 99% of the time. It's likely doing the wrong thing on
> big-endian machines. Looking at commit 6311b6521bcc ("drivers: qcom: Add
> BCM vote macro to header") it seems to have picked the macro version
> from interconnect vs. clk subsystem. And commit b5d2f741077a
> ("interconnect: qcom: Add sdm845 interconnect provider driver") used
> cpu_to_le32() but I can't figure out why.
> 
> If the rpmh-rsc code didn't use writel() or readl() I'd believe that the
> data member is simply a u32 container. But those writel() and readl()
> functions are doing a byte swap, which seems to imply that the data
> member is a native CPU endian u32 that needs to be converted to
> little-endian. Sounds like BCM_TCS_CMD() should just pack things into a
> u32 and we can simply remove the cpu_to_l32() stuff in the macro?

This review [1] from Evan Green on the original patch submission 
requested the use of cpu_to_le32

So that's how it ended up there.


[1] 
https://lore.kernel.org/linux-kernel//20180806225252.GQ30024@minitux/T/#mab6b799b3f9b51725c804a65f3580ef8894205f2


