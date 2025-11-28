Return-Path: <linux-arm-msm+bounces-83801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D7CC92977
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 17:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C8FB3AC2DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 16:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9331426CE2F;
	Fri, 28 Nov 2025 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="AKGvIonl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D423C4F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 16:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347751; cv=none; b=t0ZT4Snz9vj+wsEaxaEd80ZbuwpO90ZrJLKgBZ4l46xJ3zDiPoj9OOQjujZoJw0BZd9yTDkE00e/1vEMyhaR0XhSmfVH1pgc4panKs9aZCWot5lMxT1CDrdGo3KiCc79P5orOZX5tmOCBkk6Tg6R2I+RsBKdDeM2f5L78HhDsu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347751; c=relaxed/simple;
	bh=GOP/kpxv/SiG8IleAVvu3y+ovNM3AHbdlm/tdl/uDsI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uWgDMF0kr59oy0UgkadP0ydoWnZUBipPwOIfB+PKCIPXC8nNj1AQ9rTMa9C1K4L+fim1ooC+4nKl9WIRyIsOesxJx8pne+a0ktxcy/ERnG1eVcDURgxc0M/jTlc4GXLAHqSHa+GKrJF8Ly7SHvQ556tS2ZCCL1WOTMCAK2H1UgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=AKGvIonl; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ed9c19248bso17388151cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764347749; x=1764952549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsIiGN2rbV6QEaM41dIcddlDyFwba69ep6ezkRocLRE=;
        b=AKGvIonlFOQigaHBKSSeGgckHwdMJM9QTUckb5hessWdzB+1Y0kaicVncYT9owjoQj
         YBe/S/psKdU158bN/jOWntQoHYfOZW8v2OJs+jfpL5hY2DSendg7/vJM80+gHqTLAOmK
         rd0hm9+ijsZvgekLw/CtV9Y4zSIDPd/IhoFX9f0mAPmYQV4gE5H1IfikUa1rr2jymL1P
         gUq13GOECj2nH0LWnC5pP5QXOnNDFd+oo/MbkngWoY15SqO0vDi9RnfJ36f9hgjEf+Zx
         YQHQuSsoBO8UAdPxPFN5FigAH0rczTnvB0y7pxi8Zw5CGAQdlSHopKQSHBWJckqq5+dV
         DBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764347749; x=1764952549;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsIiGN2rbV6QEaM41dIcddlDyFwba69ep6ezkRocLRE=;
        b=dLwU1DO6GMfayxr8FjFgLaS+mYOnTgznyJu5E3kKrURQa1KtQ2IqEE035598sZAgFj
         VbhOIB+blpRbxLS7kdNzcGI3Lm3JWZPJPtbc9MH0464Qh1Na09t85EqtEbnCqZmLQgsW
         QQ2rFT9zKBMU6ovoLOJ/CUmP7ykBBIxnoQJNZO0+6CNzuE1lG8EmKc9MTldA7s5PiLNS
         +QCFP73dTrRUsEXxnsP5W60v3s/BQyWkR8P88IA/mBehckFxwcOfT4w0KUZclA9G/lDy
         2GxhvNBxJxpFSabP8JcTqYhvnOJktQm3sJKUM7wjCvMmNm0nRSLCNH/9B4nQANV+kNVU
         A3xg==
X-Gm-Message-State: AOJu0YzXSzvHy6SkHt1qC5DcnJVebNnj6V7XYZ/EubPPGGJ7cj0Qde/i
	cw0rC5xEDHYoZmniMtClRqlj6DqDkLz2yoRHqAipMEdgrl1MQ60xRG+RRkh0Tzqf2SY=
X-Gm-Gg: ASbGnctfPVlT05RaVmC79ON/dk2QLiEpmVamVbgXAxVIo/ZX1xl4IZ4hWfG5aGI92AT
	cYNuSdpGpWeEdGpb1H6Td/YDxB0DRVVArw2DCaZ0zJCdnzGaagvNgKgiiVOE1AL6zVzNzjPkTsX
	REi44LkbkcuuUguW+oPoI5gjMANJjovZ3FQOQXOmq2lm1bIsMZi+Z71MSivfJXfOvECt3zj441S
	qkUdtX6xqUVGQtn0oVwxh7pFSU98wPDnfrJSfsawMQ9JiVYnb//qjq3iKt3j0tneM5y0e4Gi4bw
	TsanY3yXKOOG5wPFmJhSrVqQat1MsbqD8S01LcLuaIFFqm1daBtlPEnzhPXxtZblDENmAVki/9A
	20W3SOfEXTQmKSWyRcAfXMK7Y4lsLMlnlQtgARbcgxTc/fzm4W7sLnxo65/OHURn2QvVq0C6/oB
	ZqHzjtiqtVznXEU+WrGlSx6KG77RyJCXYfEGjafEpKu5T8RbBCCUzWtwh1Lw==
X-Google-Smtp-Source: AGHT+IEid5PwFVhxwHcg2m8sj1oMjCxEDjABwlPhJ94vWnRIxAYTmRy804ezhMM72PRfoULBpaYSRw==
X-Received: by 2002:a05:622a:591:b0:4d2:f9e3:c12d with SMTP id d75a77b69052e-4ee5883f8f2mr405538631cf.14.1764347747428;
        Fri, 28 Nov 2025 08:35:47 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd34365b4sm28012621cf.26.2025.11.28.08.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 08:35:47 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <aSl48gV9laFb-MR1@linaro.org> <d969b3e6-a6e1-6dd3-45b9-539ba7a9f42d@marek.ca>
 <aSnH3C8s5xVSk_ti@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <1aa75dd2-6fb4-e9ca-ca27-c0bd910246fe@marek.ca>
Date: Fri, 28 Nov 2025 11:34:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aSnH3C8s5xVSk_ti@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/28/25 11:03 AM, Stephan Gerhold wrote:
> On Fri, Nov 28, 2025 at 09:39:52AM -0500, Jonathan Marek wrote:
>> On 11/28/25 5:26 AM, Stephan Gerhold wrote:

...

>>
>> I am using EL2.
>>
>> Without this patch, DMA buffers allocated in the upper 36-bit physical range
>> will try to use bounce buffers. The dma range from the dts is compared
>> against the physical address, not the virtual address.
> 
> I don't think this is the case for the dma-iommu layer. I debugged a
> crash caused by USB in EL1 on a 64 GiB device earlier this year and it
> was happily using buffers above the 36-bit physical range without using
> bounce buffers. There is some code inside dma-iommu for using swiotlb,
> but it's used only for "untrusted" PCI devices and some edge cases with
> unaligned/small buffers.
> 
>>
>> The crash I see is display driver crashes/freezes once a buffer is allocated
>> in the upper 36-bit range and it tries to use bounce buffers. This can
>> happens very quickly under load.
>>
> 
> You could be right about the MSM display driver though, since that
> bypasses dma-iommu and manages the IOMMU itself. I stared at the code a
> bit and I'm not immediately seeing where it would end up calling into
> swiotlb, but it might be hidden somewhere in the endless nesting.
> 

Looks like you are right about this, MSM driver ends up going through 
dma_direct_map_phys(), which decides to use bounce buffers. I didn't try 
to see if other drivers end up using bounce buffers, but it would make 
sense that only MSM driver is affected.

>> The same crash would happen for EL1 as well. I wasn't aware of the EL1
>> broken firmware when I sent this patch, but instead of display freezing I
>> guess the behavior would a hard reset now, which is a bit worse but still
>> unusable unles display/gpu driver is disabled.
>>
>> This patch is correct and should be applied regardless of broken-firmware
>> EL1 cases (where 64GB isn't usable anyway), but I guess the Fixes tag
>> can/should be dropped.
>>
> 
> Please clarify the commit message a bit and mention the two separate use
> cases (EL1 and EL2). I'll leave it up to Bjorn/Konrad to decide whether
> to merge it. At the end you are right and using 64 GiB RAM in EL1 is
> kind of a lost cause anyway.
> 
> Thanks,
> Stephan
> 

