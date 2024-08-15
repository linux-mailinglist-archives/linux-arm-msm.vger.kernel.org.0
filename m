Return-Path: <linux-arm-msm+bounces-28626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80723952EB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 15:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCB67B27248
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317F618D647;
	Thu, 15 Aug 2024 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfrQyIKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3874315CD52
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723726921; cv=none; b=gneFR3NhkFdGtZk/E1a36I7U1iEucZ+jNhE7ZyBQvvUMSk8RSJBgp+x0T5o5m22ufv9v/5pDdbYJDU3viCTfikyyRBm/8KvfKlUlFAUBd5Oz1HtY0kSiD+Wr57CfqyG+imEDxdoPvzSsdrofADb02H3ex5QiYvUkn6tJaA/Z4d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723726921; c=relaxed/simple;
	bh=kVIk7GsQyzJJcvMObIjOZMj/BUpGToWHk7YtzNA+A+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYJAnQ6YsF/NRKy6ZRDXXrVH9ZY/tknvzJ/YMtalBEJ+T2cJfT4SSDL9sv0CKMIRhtb18D4XKH2ME+uqXKpYyjbW4Ewua5axFHAns9OsOzTavcg1/mo58ccgUyCpRFoTHXlSbADiU5UYkWw2nIsv8vOhhjBjcVucYRrDcvkIc1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfrQyIKM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ed741fe46so978041e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723726917; x=1724331717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MK1lrvq2fI83NC++VVYh6Ea4nWpDhAxN+NgfBKLJiGo=;
        b=nfrQyIKMukj/HEUw7OG9UDSBeP3RKta5EGKjD2Um/IRT/8CbvQfBYY5ZYYZ/rnsRA3
         nbXotGW95xpWSauWYrQqPUncv90QS3uKHi1wDueMBrEb6rYqsPecX5K9NAIKzXo0zqw4
         9svGnH9dIvbKIKKa1p+G5utnX8g2bzVqlZ6cF6Fkwh32L8MA1rn2oZm1L65bcndwHn32
         s07hbKWr7YBA9n9p4NwMN4CbxfuXVkW1ZUX+hrX9hktQbi8j299GqPUmOq8h+s0bQpWu
         MiJY0nu5/Q7oQvI7+nG/YUazQOZbMxLqANuia59JNV23WHVqICLJw5FPL3YpoLtsl9wV
         EjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723726917; x=1724331717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MK1lrvq2fI83NC++VVYh6Ea4nWpDhAxN+NgfBKLJiGo=;
        b=ITxkxoMjBiFZXeqQFPHDv80Wsr0tOufj/cDNshXJgtduuZQgRdIBq18wOgcwHEPD8y
         YbJCAt8wFH5kQvJbZu3458r5OFn7tcIqzv1VHrSsdj23qU28Mufco+4Wb02j2GXb/rRB
         Cn+6YQ9bJTT0AsgPUpwT/DA9fztwCJJeEM7ac7+g54yS1kBn54EGg8yfM8tebjSFr8uW
         ACloa2TiNjqRY5ZAhmD86Iq6Dp9F7LEBNkGdhG3GLWwnKXFFHvZ1mgs+HEmks5xvbJz4
         pxroCXaD+2b+Su2eg9z+27FVCYlw8MBArlxzHGR9hsNqwm7ukrBn8NuRuLoRLdEzkA2D
         mJog==
X-Forwarded-Encrypted: i=1; AJvYcCVPoDw+DJO9YJcqZ+MsUemIPV7IvsHffRGPeD/2qw+NER3oZ/v8/z8xFaJSLxvbKccnRxxenp1DCvl6WgiCV0JcOgvGclZWSshZaa84ww==
X-Gm-Message-State: AOJu0Yzt+hYoLi0Xe4KN2dWjQKSd33a+tcjEhz27I/ZfuJBC0pZhOr0z
	KsyMYoqIcOFn8vBPcjCdu4fJ0gF1modNOAcSaKsEiu3ScpCVwcllnpUTK3U46Do=
X-Google-Smtp-Source: AGHT+IEBRsbTYanoOZ6mWrplzKqC9FlP2GuZhc920raZOzMiLgqjHnj2kv0E+1L4DZIxsxV+1q3QxA==
X-Received: by 2002:a05:6512:3b2b:b0:52c:fd46:bf07 with SMTP id 2adb3069b0e04-532edbbe468mr3859768e87.49.1723726917031;
        Thu, 15 Aug 2024 06:01:57 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::e7e1? ([2a02:8109:aa0d:be00::e7e1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383935657sm98645366b.138.2024.08.15.06.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 06:01:56 -0700 (PDT)
Message-ID: <310913ee-6275-4366-ad74-6565b7443867@linaro.org>
Date: Thu, 15 Aug 2024 15:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/arm-smmu-qcom: hide last context bank from
 linux
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
 <20240814-smmu-v1-2-3d6c27027d5b@freebox.fr>
 <a7j3lz62bp6pceuq472muioinjzfgw2mec5pv256zfr7yjsn3p@ok6nfsbsabig>
 <dfd80103-391a-4777-8944-296ba31a11dd@freebox.fr>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <dfd80103-391a-4777-8944-296ba31a11dd@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marc,

On 14/08/2024 19:33, Marc Gonzalez wrote:
> On 14/08/2024 17:29, Bjorn Andersson wrote:
>> On Wed, Aug 14, 2024 at 03:59:56PM GMT, Marc Gonzalez wrote:
>>> On qcom msm8998, writing to the last context bank of lpass_q6_smmu
>>> (base address 0x05100000) produces a system freeze & reboot.
>>>
>>> Specifically, here:
>>>
>>> 	qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
>>> 	arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);
>>>
>>> and here:
>>>
>>> 	arm_smmu_write_context_bank(smmu, i);
>>> 	arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
>>>
>>> It is likely that FW reserves the last context bank for its own use,
>>> thus a simple work-around would be: DON'T USE IT in Linux.
>>>
>>> If we decrease the number of context banks, last one will be "hidden".
>>
>> I asked you to write something like "the hardware/hypervisor reports 12
>> context banks for the lpass smmu on msm8998, but only 11 are
>> accessible...override the number of context banks"
> 
> I don't understand how the exact number of context banks is relevant?
> It's just that the FW reserves one for itself, which happens to be the last,
> probably because some FW dev thought that was a good idea.

It's relevant for your patch description because it offers useful 
context that might help someone in the future. Especially being specific 
that it's the hypervisor which is causing issues.
> 
> Also, I don't like the phrasing "override the number of context banks"
> because while this is indeed what is done in the code, the *intent*
> is to "lie" to Linux about the existence of the last context bank.

I'm not sure if that framing makes this code easier to understand for 
me. You aren't lying to the kernel, you're enabling a quirk/override.

There is another hypervisor quirk on Qualcomm platforms where BYPASS 
type streams are disallowed. We work around this by using the 
(coincidentally) last context bank to emulate them.
> 
>> It also seems, as the different SMMUs in this platform behave
>> differently it might be worth giving them further specific compatibles,
>> in which case we could just check if it's the qcom,msm8998-lpass-smmu,
>> instead of inventing a property for this quirk.
> 
> Wouldn't that be too specific?

If we aren't aware of any other platforms that have this issue, then no.
> 
> Angelo's patches were even more generic than mine, as he supported
> a list of context banks not-to-be-used-by-linux.
> 
> Do you say the LPASS SMMU behaves differently because it's (currently,
> to the best of my knowledge) the only SMMU where a context bank
> (the last) is not available to Linux?

I think that's a reasonable assumption to make.
> 
> 
> For easy future reference, here are the reports for the 5 SMMUs enabled on my system.
> 
> [    0.137343] arm-smmu 1680000.iommu: probing hardware configuration...
> [    0.137354] arm-smmu 1680000.iommu: SMMUv2 with:
> [    0.137381] arm-smmu 1680000.iommu: 	stage 1 translation
> [    0.137390] arm-smmu 1680000.iommu: 	address translation ops
> [    0.137399] arm-smmu 1680000.iommu: 	non-coherent table walk
> [    0.137406] arm-smmu 1680000.iommu: 	(IDR0.CTTW overridden by FW configuration)
> [    0.137417] arm-smmu 1680000.iommu: 	stream matching with 16 register groups
> [    0.137447] arm-smmu 1680000.iommu: 	6 context banks (0 stage-2 only)
> [    0.137733] arm-smmu 1680000.iommu: 	Supported page sizes: 0x63315000
> [    0.137743] arm-smmu 1680000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
> [    0.137833] arm-smmu 1680000.iommu: 	preserved 0 boot mappings
> 
> 
> [    0.138963] arm-smmu 16c0000.iommu: probing hardware configuration...
> [    0.138974] arm-smmu 16c0000.iommu: SMMUv2 with:
> [    0.138994] arm-smmu 16c0000.iommu: 	stage 1 translation
> [    0.139003] arm-smmu 16c0000.iommu: 	address translation ops
> [    0.139011] arm-smmu 16c0000.iommu: 	non-coherent table walk
> [    0.139019] arm-smmu 16c0000.iommu: 	(IDR0.CTTW overridden by FW configuration)
> [    0.139030] arm-smmu 16c0000.iommu: 	stream matching with 14 register groups
> [    0.139058] arm-smmu 16c0000.iommu: 	10 context banks (0 stage-2 only)
> [    0.139255] arm-smmu 16c0000.iommu: 	Supported page sizes: 0x63315000
> [    0.139265] arm-smmu 16c0000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
> [    0.139341] arm-smmu 16c0000.iommu: 	preserved 0 boot mappings
> 
> 
> [    2.424369] arm-smmu 5040000.iommu: probing hardware configuration...
> [    2.428581] arm-smmu 5040000.iommu: SMMUv2 with:
> [    2.434914] arm-smmu 5040000.iommu: 	stage 1 translation
> [    2.439584] arm-smmu 5040000.iommu: 	address translation ops
> [    2.444881] arm-smmu 5040000.iommu: 	non-coherent table walk
> [    2.450522] arm-smmu 5040000.iommu: 	(IDR0.CTTW overridden by FW configuration)
> [    2.456175] arm-smmu 5040000.iommu: 	stream matching with 3 register groups
> [    2.463216] arm-smmu 5040000.iommu: 	3 context banks (0 stage-2 only)
> [    2.483555] arm-smmu 5040000.iommu: 	Supported page sizes: 0x63315000
> [    2.490455] arm-smmu 5040000.iommu: 	Stage-1: 48-bit VA -> 36-bit IPA
> [    2.497171] arm-smmu 5040000.iommu: 	preserved 0 boot mappings
> 
> 
> [    2.546101] arm-smmu 5100000.iommu: probing hardware configuration...
> [    2.552439] arm-smmu 5100000.iommu: SMMUv2 with:
> [    2.558945] arm-smmu 5100000.iommu: 	stage 1 translation
> [    2.563627] arm-smmu 5100000.iommu: 	address translation ops
> [    2.568923] arm-smmu 5100000.iommu: 	non-coherent table walk
> [    2.574566] arm-smmu 5100000.iommu: 	(IDR0.CTTW overridden by FW configuration)
> [    2.580220] arm-smmu 5100000.iommu: 	stream matching with 12 register groups
> [    2.587263] arm-smmu 5100000.iommu: 	13 context banks (0 stage-2 only)
> [    2.594544] arm-smmu 5100000.iommu: hiding last ctx bank from linux
> [    2.614447] arm-smmu 5100000.iommu: 	Supported page sizes: 0x63315000
> [    2.621358] arm-smmu 5100000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
> [    2.627772] arm-smmu 5100000.iommu: 	preserved 0 boot mappings
> 
> 
> [    2.806781] arm-smmu cd00000.iommu: probing hardware configuration...
> [    2.813029] arm-smmu cd00000.iommu: SMMUv2 with:
> [    2.819627] arm-smmu cd00000.iommu: 	stage 1 translation
> [    2.824304] arm-smmu cd00000.iommu: 	address translation ops
> [    2.829601] arm-smmu cd00000.iommu: 	non-coherent table walk
> [    2.835243] arm-smmu cd00000.iommu: 	(IDR0.CTTW overridden by FW configuration)
> [    2.840897] arm-smmu cd00000.iommu: 	stream matching with 54 register groups
> [    2.847954] arm-smmu cd00000.iommu: 	17 context banks (0 stage-2 only)
> [    2.869307] arm-smmu cd00000.iommu: 	Supported page sizes: 0x63315000
> [    2.875785] arm-smmu cd00000.iommu: 	Stage-1: 32-bit VA -> 36-bit IPA
> [    2.882205] arm-smmu cd00000.iommu: 	preserved 0 boot mappings
> 
> 
> [   24.525457] arm-smmu 16c0000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1900
> [   24.525604] arm-smmu 16c0000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
> [   24.721874] arm-smmu 16c0000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1900
> [   24.722033] arm-smmu 16c0000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
> 
> 

-- 
// Caleb (they/them)

