Return-Path: <linux-arm-msm+bounces-72973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87210B51602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 423A03BB5C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75E7317712;
	Wed, 10 Sep 2025 11:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxVDaAsh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D330EF96
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757504517; cv=none; b=Hw66LMzChMYfoxj9B1oEtNeWIXtsQUNBT8TOHRzSIkHJPtvWrS5dzqf5tTUHMV/ANMbPECbTZ0DFmr4IpR8RLM7aszp8qK4ALAs3FG/2QDT8AOJD5pisru0r40rlIQ772ISEhuxSLdjXWY+70TCXPFb2RJUsNtlxBw+q7dIahAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757504517; c=relaxed/simple;
	bh=R80lrQS1hQJF0roYzz0DTf0dlLu6IexIel/iumK3y4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=do3QTFtpr4pRFTjPqxoye4UU4U8pEf+WDmswub4xYJcSpoH/7QysRdAiwB7YWqssGjfW1ucTW1mdYpZLJwKdgWhHX5BtU/PruSp0XlE2llpTmySY1cQMhMyyGqSUR2oLtMTQo/HhJarB51+rG/7s+Bs5ITbMxMM+hRwEG/ghWmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxVDaAsh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45cb5492350so44360845e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757504513; x=1758109313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shZJxLtW9iAiaEf/F/KUNA4WoMg1VvumYYY6r6PZJkc=;
        b=NxVDaAshFsgaAK4X7xC9jxYSWMowcAJt7SLKmBRMmhNAQEr1YYAECr02V3Iewd3s2h
         S6X4FWxwRYoTbwwBqfC7M7+nc4QtEHfoE1qDena3ps3yUqC5QMZeNSVakbzDUUxbdUmd
         AHW5VBPcc5wTkG75SFllmTawOnCnrcKf8sPQJwIKgE5w7z8jWurQ3ULvVjTcfubU7ysT
         4ARK2gNFwpwSJo4dOHrTJq4Ch8J5JmKLlVY71tZT23h+Uj69vC5mNavLWLSHxuYp4Bz5
         +LFDsuFnMyQi0Zz9bjJ0AK0T8kBqCYc1TsgYbNVmUYoDCIrNyfKKflltQcHH30G8MX5F
         q02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757504513; x=1758109313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shZJxLtW9iAiaEf/F/KUNA4WoMg1VvumYYY6r6PZJkc=;
        b=OUd9ym0HqVXAXXHTaVeWyEARimABs9RemvMEnpyqDgfUoYrW7fMq0DkjHp8mrcjTjW
         kl1UedGbaamigc0At9c2jbtIquBKIUEJLYbHeNKcr2nF4Ucag5gXzXRXUfJvPjzvJfbH
         0erJiYj932gjE57257QOtIuFPk2N9dPV+Q1khRIjKN6RhqGqmUH6BnBDc1WW6o7JbeAS
         Bb0scbNhY2sNFz260m8q+qAR3I8USkc/fNpu8iBk7CnJzaMJkJW5Ne/4aWYSEo1lECtG
         uNErZY2fkTvQai2l1zI06UOYYRS9QLM85Mj2xU3mywldRsUSr2kAHMa52djokOwkFF/q
         znMw==
X-Forwarded-Encrypted: i=1; AJvYcCV41IGPqcKgkD4lM+WUsq6/jyNE8G3LGNtt9NVHB4TTHbPoEjrRqwK3jZCue4rAuuzG4bpGDoRDPClqGS77@vger.kernel.org
X-Gm-Message-State: AOJu0YxlYRrfszurRUEBLsUpY4q8yaxiwB5LuZq9g9OrwjMbGFwwVhkM
	hE35UAVj6Cmu93lWZWjFNIB0ews0IfNf64zV0051ZjLL7LzK6dHmeOnaIk4WP1hFVDI=
X-Gm-Gg: ASbGncvLC6vMcl1MtHGDtmbCGMYBkwj4BOdXgC2E/2orUMhyv2jJUTjJ4wkq/esq66J
	/Taw8l4NH3xDjpS64FoanIwARlR5HsTIOUhyWQeT5bfr1HUiw+oOniKq3agokNfr+etbkrC/tTL
	VO4bVuy6UxkDqAu3edHLByIKN5HnMOVbunSBZEeRHPcyea2qWV31westGMaK6E9p35lCvarhc/U
	ukd99G6e9EtasEXD4CNRFdjEBpIJVyzJnVBQMAq6E9rxorq/hg56YB6ZtRAp5wOkFr+isa+/yX4
	YffBXMzT5af+fMRZU0Su1DuZHua9mIz49nP5vOCO6hiTCgpo4OPuLM5jhfLV2xp3HeO3/7tu5CL
	x408KpzBfDj6RDKQ/JJE0Yd4g6cDV0c4PJ+x9ep4hWFdzYhjKKsSTAmpVdS7giQZ8q6n8G4yLxj
	piDtT9mofvshvkDYYroko=
X-Google-Smtp-Source: AGHT+IGlxSt/xs7I3D7ZMakn9Gr+X1/Zuc0c5vvYIA/kLFFFxTaanjZmiqDr4kYOYkKHuiNeNUlj3A==
X-Received: by 2002:a05:600c:4453:b0:45b:9c37:6c92 with SMTP id 5b1f17b1804b1-45dddef02f7mr145102055e9.31.1757504512855;
        Wed, 10 Sep 2025 04:41:52 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8259524sm24547495e9.21.2025.09.10.04.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 04:41:52 -0700 (PDT)
Message-ID: <61b562ad-eb67-4917-a449-f5556c43ceef@linaro.org>
Date: Wed, 10 Sep 2025 12:41:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: media: camss: Add qcs8300 supplies
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-5-quic_vikramsa@quicinc.com>
 <e4d3c2a3-e395-4f60-8cff-fbb9a1611ec2@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e4d3c2a3-e395-4f60-8cff-fbb9a1611ec2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2025 08:02, Krzysztof Kozlowski wrote:
> On 09/09/2025 13:42, Vikram Sharma wrote:
>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>
>> Add vdda-phy-supply and vdda-pll-supply to the qcom,qcs8300-camss binding.
>>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
> 
> There is no such file. Why are you not fixing the patches on the list?
> 
> 
> Best regards,
> Krzysztof

The easiest thing for me to do here is to take this patch and send out 
another PR.

I can fix the commit log too.

---
bod

