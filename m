Return-Path: <linux-arm-msm+bounces-27257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528593F5A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05EA91F22657
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1215D1494AB;
	Mon, 29 Jul 2024 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIYD5Ml5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95441494A6;
	Mon, 29 Jul 2024 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256839; cv=none; b=igJzLVm79/Kg7NopSHpnjMawCoNzlJTIPeMN3mhBuTOX0ERwlaIXSAMAIVi9ybZtNZIMe9ytf/bykc/fYNsWsR0EDqzrSYE/fTli173KXRSPR3+Sp7uIX1swI6qgoSq1gUFPDBqCGPrSDoTkIRjoIzwWHMqCt8YMfWudBcqhcqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256839; c=relaxed/simple;
	bh=N3xXeZ5Sz94ZClfXA2KC8TLwvIpUwZiE2+p14uPFP0U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=vE0cYKU3XWqWl4I5DpTEXK2Zs1MmB6y5zQb93tlxjuMkEJH0vY0ZP776Z42Q8dcfIuSkP2kdNmXf/1HA4/4M+qmD3uQJiDynM4W2rr4k39WRmGJvoHf/4kwnkt0ZVPvEXRk2NE+kV0aDdmII5MbCPKMKdCW/dSNj1H36b3PIbSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIYD5Ml5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038F3C32786;
	Mon, 29 Jul 2024 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722256838;
	bh=N3xXeZ5Sz94ZClfXA2KC8TLwvIpUwZiE2+p14uPFP0U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=mIYD5Ml5u6jBbAhz4WBkGgqO6N37dImmRT5PYLWABPIwOVl9rxQyXhvqF2WTzKuiX
	 uO7wSu1FteyPMT7TlL2SxhguOg9jZZVMTD7NzQn0558cQxqAcxt5W35CcxjHha28vx
	 nxU1fXT/+fpEDGsaIUAUweGv51VHDz/XAt9DNRAiGxcy/B1449qgp1LCC48K+tNuZw
	 s0SaQEOUMSX1MuE01fZczIbVXIJi1mdwW2+/4Q7qtVeyPkJnnMiNqq+jCFbmfTQWOF
	 hkHN0iAgil+j6hW1Krw1lv5nftLljpu92YMHKoOYSgsBC2vdJOoctfLWcACZ86mauj
	 F/1Enhe/KWCBQ==
Message-ID: <aaf74e25-ba24-454c-8bc1-c2b079d549e3@kernel.org>
Date: Mon, 29 Jul 2024 14:40:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
From: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
 <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
 <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
 <8e2ebc97-f455-4f41-81da-af56263e6cf6@linaro.org>
 <87607d2c-a4b1-4923-ba9f-9cfc56a0aa38@kernel.org>
Content-Language: en-US
In-Reply-To: <87607d2c-a4b1-4923-ba9f-9cfc56a0aa38@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29.07.2024 2:13 PM, Konrad Dybcio wrote:
> On 16.07.2024 1:56 PM, Konrad Dybcio wrote:
>> On 15.07.2024 10:04 PM, Akhil P Oommen wrote:
>>> On Tue, Jul 09, 2024 at 12:45:29PM +0200, Konrad Dybcio wrote:
>>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>>>> abstracted through SMEM, instead of being directly available in a fuse.
>>>>
>>>> Add support for SMEM-based speed binning, which includes getting
>>>> "feature code" and "product code" from said source and parsing them
>>>> to form something that lets us match OPPs against.
>>>>
>>>> Due to the product code being ignored in the context of Adreno on
>>>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>> [...]
>>
>>>>  
>>>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>>>  		speedbin = 0xffff;
>>>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>>>> +	adreno_gpu->speedbin = speedbin;
>>> There are some chipsets which uses both Speedbin and Socinfo data for
>>> SKU detection [1].
>> 0_0
>>
>>
>>> We don't need to worry about that logic for now. But
>>> I am worried about mixing Speedbin and SKU_ID in the UABI with this patch.
>>> It will be difficult when we have to expose both to userspace.
>>>
>>> I think we can use a separate bitfield to expose FCODE/PCODE. Currently,
>>> the lower 32 bit is reserved for chipid and 33-48 is reserved for speedbin,
>>> so I think we can use the rest of the 16 bits for SKU_ID. And within that
>>> 16bits, 12 bits should be sufficient for FCODE and the rest 8 bits
>>> reserved for future PCODE.
>> Right, sounds reasonable. Hopefully nothing overflows..
> +CC Elliot
> 
> Would you know whether these sizes ^ are going to be sufficient for
> the foreseeable future?

Also Akhil, 12 + 8 > 16.. did you mean 8 bits for both P and FCODE? Or
12 for FCODE and 4 for PCODE?

Konrad

