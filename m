Return-Path: <linux-arm-msm+bounces-15481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A733488F32F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 00:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6179A29D771
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 23:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22D4154BE3;
	Wed, 27 Mar 2024 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1H0ixTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580A134A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 23:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711582154; cv=none; b=slLDHhCmCAMx/V8i3pHwdG+AQmEW3zrnwQB2ZP0O1UDuKCRqNEUKOz1xuXWvMObzChrJBUl1Rwi4YuqdKcipN3a/60N1RQ9DX3ojKDnsy31x5Mc8FBEkwNCYJAEV6YhthvU2Z3a/EvqVO4+ZX7V9dsF01YibRsaIjZ6ZWiPxTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711582154; c=relaxed/simple;
	bh=5wZZekYaSMWMCpHNW8cLBKcEHNhySwdHwzgcbhar/Uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSxOiZCc4Mmo5VKSngyID1IEM8Ej1u1HNkXfdQGFGzMLikKigxjbocWijdN2jEmMbmN/dPx5ls3R9qzItD8mHWrZgS8R6EIRuRHEQ+3uLCeTwOfjfODKBMicZU/luLvUgk1RciPSxPQ3QKT6vhOOZ4HFZf+Is/RUyG3/oJnMBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1H0ixTu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41490d05bafso4131895e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 16:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711582150; x=1712186950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9PUNGNkymAHFEOcV0kzGalSNW81dr90U8zDmo0wkwhE=;
        b=l1H0ixTueK98h/uOlZ2Qexoza3l5kND52ZUwsglcnIeZdIeisd8C5fpGwoZvI55D8x
         THGPO0HSf16oi4I8Re0N0Vsc4l9FRJVVvLSyXmHxAi7X4M8ymJc4yqIICFkG0ZxBk1mX
         nB2xo+o1G7ks+iv92e4LD/oEjNWgSmYmqCoyT9pGEjs3YQFtDPXB39kdpiwo82jeubSV
         alFgFvnKbW/nN0Ad8QVKAVDoUjwCeqifD5xV/NMp4SSv46P79OxRDg61zACFfOfzqyxW
         mnpFsUFfF2R/2tN5L4mVcLyenkuBYeGNR2zKpCIvVZ+/yXFatBvqnJaquBA0CA6gJIgA
         fEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711582150; x=1712186950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PUNGNkymAHFEOcV0kzGalSNW81dr90U8zDmo0wkwhE=;
        b=DHCs1frDuoo0VZOuwrfjZgIcOcKhI+EInVoLF3H7fZvqDlXao7tMpx16JQvGgRpK4E
         WglinMm5pw7rDGj20inoRUVItcGcDIMC9JGdV7r8Kmjgd9PcMBmZkl+6XFlK3hsQx+7h
         b1SGVLJtxaaXZzYQ2INsr9/YezY5r2QcKpkZQou8f7ftu8TwnbYr39o8UszkE2ucv7Qo
         iSoc022zUs2hYFl/MyawNTafjXja0QZch84mwZBlV76kS51DrkfOC+snAo+IZcpq2mTM
         td9+TebJa3PgXRmMUSRG8qCwyCZCSFOMLBBuiiVTMf8D1b8mYT+uxalvwyBcM2vLi3SG
         rRIA==
X-Forwarded-Encrypted: i=1; AJvYcCXySM7DFvjbP3UDU1aK4Riks7t/DMSrYaIsu5NDhUzLYi4UJgUGcAibXR5Z1imwWGYnNZwxxX4XZY73cqHQV3NfbcZsZehQeoIsH81UzQ==
X-Gm-Message-State: AOJu0YzRbG1zvNb4hgrXcoY8RKWljq/7RBU5AvWl9kH0HIWVsmjtLAD8
	MVgTaL/b+IwBVF12NTLc5OEb96MPbVW+WFJLvnr4fWoZJ7cpJiBvY+w7rnPAtbc=
X-Google-Smtp-Source: AGHT+IFKFRzprEfio4SCPKPHiOGI8teVk725SH/51qFE6EAenF4ezEyqPG4LszZrB128WOrNky/e+w==
X-Received: by 2002:a05:600c:1d02:b0:414:7eca:d9a5 with SMTP id l2-20020a05600c1d0200b004147ecad9a5mr1484707wms.12.1711582150221;
        Wed, 27 Mar 2024 16:29:10 -0700 (PDT)
Received: from [192.168.1.78] (host-92-17-96-232.as13285.net. [92.17.96.232])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b004148c3685ffsm382557wmq.3.2024.03.27.16.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 16:29:09 -0700 (PDT)
Message-ID: <cd549ee8-22dc-4bc4-af09-9c5c925ee03a@linaro.org>
Date: Wed, 27 Mar 2024 23:29:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: cmd-db: map shared memory as WT, not WB
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20240327200917.2576034-1-volodymyr_babchuk@epam.com>
 <e0586d43-284c-4bef-a8be-4ffbc12bf787@linaro.org> <87a5mjz8s3.fsf@epam.com>
 <f4ebe819-9718-42c3-9874-037151587d0c@linaro.org>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <f4ebe819-9718-42c3-9874-037151587d0c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27/03/2024 21:06, Konrad Dybcio wrote:
> On 27.03.2024 10:04 PM, Volodymyr Babchuk wrote:
>>
>> Hi Konrad,
>>
>> Konrad Dybcio <konrad.dybcio@linaro.org> writes:
>>
>>> On 27.03.2024 9:09 PM, Volodymyr Babchuk wrote:
>>>> It appears that hardware does not like cacheable accesses to this
>>>> region. Trying to access this shared memory region as Normal Memory
>>>> leads to secure interrupt which causes an endless loop somewhere in
>>>> Trust Zone.
>>>>
>>>> The only reason it is working right now is because Qualcomm Hypervisor
>>>> maps the same region as Non-Cacheable memory in Stage 2 translation
>>>> tables. The issue manifests if we want to use another hypervisor (like
>>>> Xen or KVM), which does not know anything about those specific
>>>> mappings. This patch fixes the issue by mapping the shared memory as
>>>> Write-Through. This removes dependency on correct mappings in Stage 2
>>>> tables.
>>>>
>>>> I tested this on SA8155P with Xen.
>>>>
>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>> ---
>>>
>>> Interesting..
>>>
>>> +Doug, Rob have you ever seen this on Chrome? (FYI, Volodymyr, chromebooks
>>> ship with no qcom hypervisor)
>>
>> Well, maybe I was wrong when called this thing "hypervisor". All I know
>> that it sits in hyp.mbn partition and all what it does is setup EL2
>> before switching to EL1 and running UEFI.
>>
>> In my experiments I replaced contents of hyp.mbn with U-Boot, which gave
>> me access to EL2 and I was able to boot Xen and then Linux as Dom0.
> 
> Yeah we're talking about the same thing. I was just curious whether
> the Chrome folks have heard of it, or whether they have any changes/
> workarounds for it.

Does Linux ever write to this region? Given that the Chromebooks don't
seem to have issues with this (we have a bunch of them in pmOS and I'd
be very very surprised if this was an issue there which nobody had tried
upstreaming before) I'd guess the significant difference here is between
booting Linux in EL2 (as Chromebooks do?) vs with Xen.

Volodymyr: have you tried booting the kernel directly from U-Boot in
EL2? Can you confirm if this issues also happens then?
> 
> Konrad

-- 
// Caleb (they/them)

