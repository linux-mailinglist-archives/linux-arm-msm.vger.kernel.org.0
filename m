Return-Path: <linux-arm-msm+bounces-87790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98BCFC439
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 08:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C480B300FFA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 06:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943A1230BCC;
	Wed,  7 Jan 2026 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB+Fy0uR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6B874BE1
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767769086; cv=none; b=lOGECVTz+8cPRnDeR7hkd+QHLZmIW+3SAyXMZG8mcHm2sFvrgmxjp9/PepTMvFUqmDh5H/RaI5kRIdTd/O32ZuoB9H5/apZPRFqf3nWjnrxy1MO7nYbz42ptvgAKBMHvI41dlCf9YPr4ZnkOeYvxrcKtxCqFPhLxOE3m2FYM5QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767769086; c=relaxed/simple;
	bh=h/hjUe/EE/3PSq+SDKA2uU8CDeM2m6D10ErSYppFyNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYMHTL3iY24j/Bb5xJgfklmYLIGfBBhUov2xH9WSi3pKM41NntZzFANG6MP8786eHpaNu1VO/5vTk3QMqAJIpFhIcAwYNcbwvvDWE8hRLZE9ads1dpm4w4KtmxcooGIaQLwuRrwUz55cj5CT4YC/3G0HoIWAjcKNBmxbt6+4vvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jB+Fy0uR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f0f875bc5so18832045ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 22:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767769084; x=1768373884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TFQzAD4cExpKXiU3IgEY1vncCxeqHff9zhX4PPRmSI=;
        b=jB+Fy0uR38FG1rmZtKvNyiD51Wa+j7sMgqBgeADMFlk+paY80rXamQyWtx6J4c98UD
         Ql2sDjhzHfrqF12pKeJlcoq7UJ8qcSJk1H497myGuHvzb5E+IcKFqZFhJZvnXVbL18au
         6Pg1NUEsE+tbZYTCGADxtiLKUIlKk84Eq1fIihnBqM1r+VBPvs7Hi5ZP6zAgkiOv/JzI
         /5zWY4rF3zp7+oC0A81whluLik67L0cOwbTEyvHm03xIhZtNz0rxyIwvLy2KEMpWL7bk
         MCpx9zZ9/3yBzIZu2kUqhsk+6ESHSLviytK0k1WobTOoj8A79IEzph8YGJu1TVBkcmqO
         2WZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767769084; x=1768373884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TFQzAD4cExpKXiU3IgEY1vncCxeqHff9zhX4PPRmSI=;
        b=OE442czsPyrg91KuDGG31fKFMnfli+pRvab2lXuVTbf2HD0BgRTfK5sJnSUQ3ANqkW
         p3OWvr9QJ+2I1tjqANJwXwcggjdNY037YEMsD69iqiZP9MGDSReeDmJFK3jemqKhXEnS
         jBHlBuaf51enwqYIwXGAOtXQjZpzMWIhK41l2isTwllBeSl49i8sL+gAab2VE8awKblW
         Z1gaLQyHxo3XA2o5Z2jQaHz3teGOKAv7Te0iGMAXIiveW9up7HJmWJN5QfVRBAndlMm/
         ri2qW7oloodqtMSzH0zWsAe1HASdyvZ3AkhUNe4E3VRZYTl5HKdVZwRnEcGrLeBBQFit
         XWng==
X-Forwarded-Encrypted: i=1; AJvYcCW8sP8hSRvocPHWaxCK2xmynQT7diNuG9B+17IC5XOUi9ocCMvMn4Uq0oUYLJVu7aDiyM4E7e8ev9DF3/rK@vger.kernel.org
X-Gm-Message-State: AOJu0YwE6alDf6jvyHDPLH5Ctw22dWps5mrExPyv6dqyQmq20PpgqKP0
	IOlb/I4iPIZLOYJkU7OOWEz6sU0y7yDgvf43uHxyAs3dacvXhcJDIssM
X-Gm-Gg: AY/fxX5jpvK+M4PtlxGmrUXYEAOkdW4du4UlZ/b87XgA794XnjXZTtF2LvaAjmzRj93
	mVGC0nBfq60TzDkd1HoEDjuFzt9dMJxQ+2+LywSuh7WNQH6j4Cq9u4ZFJhM3xpqaglksHebdEAT
	tvFtIgtgpR2l3k0UjrM+AIrecadGpEa4C14JCwsweo9MDUTu2z7tfNQMqbwbVORn6Ut4TjfdQj6
	FBem+Zqj2TLCn6taX6a7UoTqXr71Abau7Off9t0yriwMaNJkOCwegKNoQJbSL/3d0wtGJpTdBN9
	6MvKUqvfonxXMLPWdB28YK4C+PvLOu+X5U5HX9z9EMop9rF+4nSrop7ytapv/rRLfOFlqEKdl7b
	KxBcUMak2cHXNNdaph6lJt5ux/WG17ycwB8F7gsK2ea52SAthr9ADUuHh780HNzPYypnSZxeqZw
	Yga6fClaD+Wbl7d3BzmneXF2esMPFV44U8tA==
X-Google-Smtp-Source: AGHT+IEcs4NBq8H4fFrSYs8fPYZFfN64Sy7nKxMok/ResdzgJ/ADE3P0J3wz890e8k344EJwHst7Bg==
X-Received: by 2002:a17:902:cecb:b0:295:8a2a:9595 with SMTP id d9443c01a7336-2a3ee4e8276mr12662105ad.39.1767769084387;
        Tue, 06 Jan 2026 22:58:04 -0800 (PST)
Received: from [172.16.20.12] ([136.226.245.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47303sm40012345ad.24.2026.01.06.22.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 22:58:03 -0800 (PST)
Message-ID: <dce7702f-e845-4940-8679-a8d80563988a@gmail.com>
Date: Wed, 7 Jan 2026 12:28:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] dt-bindings: arm: qcom: talos-evk: Add QCS615
 Talos EVK SMARC platform
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-2-tessolveupstream@gmail.com>
 <2e533b51-399a-47e8-bc3e-ab61797d6762@kernel.org>
 <f6ff2086-19f2-46cc-ac89-d8ef3847b9f0@gmail.com>
 <d23e3693-0cf8-4b31-a3e4-e562621911d5@kernel.org>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <d23e3693-0cf8-4b31-a3e4-e562621911d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05-01-2026 12:42, Krzysztof Kozlowski wrote:
> On 04/01/2026 14:11, tessolveupstream@gmail.com wrote:
>>
>>
>> On 30-12-2025 20:33, Krzysztof Kozlowski wrote:
>>> On 30/12/2025 14:02, Sudarshan Shetty wrote:
>>>> Add binding support for the Qualcomm Technologies, Inc. Talos EVK
>>>> SMARC platform based on the QCS615 SoC.
>>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>
>>>
>>> Why did you decide to drop the tag and where did you explain that?
>>>
>>> <form letter>
>>> This is a friendly reminder during the review process.
>>>
>>> It looks like you received a tag and forgot to add it.
>>>
>>> If you do not know the process, here is a short explanation:
>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
>>> of patchset, under or above your Signed-off-by tag, unless patch changed
>>> significantly (e.g. new properties added to the DT bindings). Tag is
>>> "received", when provided in a message replied to you on the mailing
>>> list. Tools like b4 can help here. However, there's no need to repost
>>> patches *only* to add the tags. The upstream maintainer will do that for
>>> tags received on the version they apply.
>>>
>>> Please read:
>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>
>>> If a tag was not added on purpose, please state why and what changed.
>>> </form letter>
>>>
>>
>> I apologize for missing the Acked-by tag in this version.
> 
> How missing? It WAS THERE ALREADY!
> 
> You had to explicitly remove it.

While updating the linux-next kernel source and reapplying the 
changes, the Acked-by tag was inadvertently omitted. I’ll ensure 
that all previously received tags are retained in future revisions
in accordance with the submission guidelines. My apologies for
the oversight.
> 
>> I will make sure to include all received tags in the next patch
>> as per the submission guidelines.
> 
> Best regards,
> Krzysztof


