Return-Path: <linux-arm-msm+bounces-28541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B5795213E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C863B22791
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F40A1BC065;
	Wed, 14 Aug 2024 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="e0HUBpcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73401BB693
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723656795; cv=none; b=DTq4E8hTFqUsVLAuhdVYVkWBWblw2FrtRYvIYgbDRYpnct6bCQkt7GKfjSFaEjTYUEFMQ1yjQulTJqignLOnmp9HDfV0M3r7EHEPF6lg6zBWTQf/EzB1N6TII6gRNePRSmiNvXR3iNBS7UjnpBLFu/yP/VDYAaqJ+S/ii05+ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723656795; c=relaxed/simple;
	bh=xHPn6y4xO+5SYBhOLhdA2juhFMoy6KgLmbab3AbXS8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvEVvF8tSbv+XHIcZH5EftweJjKXIri1AEi1GpRzhOfUO2RXPE7FRLBdJaj+pIRhg2vH4llduc7RID33/C4M3Z65NgLo3q3n/WGxkoTg+9mJAgGWdt6bq9ZfMez+H+T/I3TgSD7d5I+tdEzcabzVe8eQ/V+ONdMCUBBmPNEEOQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=e0HUBpcp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42819654737so334435e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1723656791; x=1724261591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsViqlXuad7EqaJTSukZTNrLwUDaFtbQLR6eV58xusI=;
        b=e0HUBpcp+yhRqfLOCRHjiRR7XzpVnGVdeo0I6txc+VrNkct+5c+07uDcVO0J1HRXQE
         3z04C77CWru46CNtoVWtCCtBxErwreNNCE1P7IdUaWPHXtLkfqENJnt8V28+Qz9ArEZ/
         xvP8K2R7H+jLS1Yv9z4dVRS3aYeK6c1mphEhhw1qqKAXkCZnadZlm4zlj0E+RCLch86A
         PqBpj1j2GeVixq9nwg5LcXz8CTABWs+8DkfkhTQOx5BeHygGIhYgm+nA0/KwCtLiKtQz
         Fo0PfxepKwpHvaVCw2Pkf82UMd4RTV93BHyzwcxif626YEtZDKrllAtVVyy7jXvmS7zT
         Unyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723656791; x=1724261591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VsViqlXuad7EqaJTSukZTNrLwUDaFtbQLR6eV58xusI=;
        b=p00C/Vcn6ee/a9z37EqqSK+ELe7o9IU3DzupRhb8Pr10l4AVWcDlemYOaZd52gjFYQ
         UhMCFKwE8gpFEFOmAgjYgkEohJZHQN3cRjJUsUpa5makl225cMqRCVweHNXGYP0X7qwM
         dS14oJyAOOwIAov5FpoN/eU8Ci7z1nOGCq6kxajwPxguK4b8oqmS+cOlaGgugzL0UCo0
         iwww7Dz3kLlDF0RuDMhykNFtYHfRLNfJh8aZM62jaNtzGJ1kPkZeKJxe83AyAHDGzNZK
         EWCETlDEYmVtZNlLVfCTbFe1GicyodC80PIh/6ayD0OdbbLR3/pfGUlWIa+sC+6tGHJv
         HSgg==
X-Forwarded-Encrypted: i=1; AJvYcCXtRcUs38uU12VtlnN68ssYyo9DFFvgQ8wI8Nk1RSSDlNiR1qlXHiHkMJrrEP7uoA2Pn5aL+nm6Yiqait6RiXI6f7vkj5iQm5sd+Vm+Qw==
X-Gm-Message-State: AOJu0Yy6hXaF+4rHwU24p768ry3I/OFoZLtwZGORmxkDIteKS2CYTgWy
	9aI6DRJoC0bwADYFpdOmXl+bzFVwdv5y/nFT2G9jOYU7OCWrmEf4o9eDmQK75Ik=
X-Google-Smtp-Source: AGHT+IGjd27AWWYXM6KKfwqDHwnfvaRFqeEGxklZ34WgUw5nl1yiZggtjfE6mMr+RwZoA8oB3FddQA==
X-Received: by 2002:a05:600c:42c8:b0:429:e6bb:a436 with SMTP id 5b1f17b1804b1-429e6bbb75fmr428945e9.9.1723656790860;
        Wed, 14 Aug 2024 10:33:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:108b:e400:1437:6ff2:646:a3e5? (2a01cb08108be40014376ff20646a3e5.ipv6.abo.wanadoo.fr. [2a01:cb08:108b:e400:1437:6ff2:646:a3e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c937bb9sm13456330f8f.34.2024.08.14.10.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 10:33:10 -0700 (PDT)
Message-ID: <dfd80103-391a-4777-8944-296ba31a11dd@freebox.fr>
Date: Wed, 14 Aug 2024 19:33:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/arm-smmu-qcom: hide last context bank from
 linux
To: Bjorn Andersson <andersson@kernel.org>
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
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <a7j3lz62bp6pceuq472muioinjzfgw2mec5pv256zfr7yjsn3p@ok6nfsbsabig>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2024 17:29, Bjorn Andersson wrote:
> On Wed, Aug 14, 2024 at 03:59:56PM GMT, Marc Gonzalez wrote:
>> On qcom msm8998, writing to the last context bank of lpass_q6_smmu
>> (base address 0x05100000) produces a system freeze & reboot.
>>
>> Specifically, here:
>>
>> 	qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
>> 	arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);
>>
>> and here:
>>
>> 	arm_smmu_write_context_bank(smmu, i);
>> 	arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
>>
>> It is likely that FW reserves the last context bank for its own use,
>> thus a simple work-around would be: DON'T USE IT in Linux.
>>
>> If we decrease the number of context banks, last one will be "hidden".
> 
> I asked you to write something like "the hardware/hypervisor reports 12
> context banks for the lpass smmu on msm8998, but only 11 are
> accessible...override the number of context banks"

I don't understand how the exact number of context banks is relevant?
It's just that the FW reserves one for itself, which happens to be the last,
probably because some FW dev thought that was a good idea.

Also, I don't like the phrasing "override the number of context banks"
because while this is indeed what is done in the code, the *intent*
is to "lie" to Linux about the existence of the last context bank.

> It also seems, as the different SMMUs in this platform behave
> differently it might be worth giving them further specific compatibles,
> in which case we could just check if it's the qcom,msm8998-lpass-smmu,
> instead of inventing a property for this quirk.

Wouldn't that be too specific?

Angelo's patches were even more generic than mine, as he supported
a list of context banks not-to-be-used-by-linux.

Do you say the LPASS SMMU behaves differently because it's (currently,
to the best of my knowledge) the only SMMU where a context bank
(the last) is not available to Linux?


For easy future reference, here are the reports for the 5 SMMUs enabled on my system.

[    0.137343] arm-smmu 1680000.iommu: probing hardware configuration...
[    0.137354] arm-smmu 1680000.iommu: SMMUv2 with:
[    0.137381] arm-smmu 1680000.iommu: 	stage 1 translation
[    0.137390] arm-smmu 1680000.iommu: 	address translation ops
[    0.137399] arm-smmu 1680000.iommu: 	non-coherent table walk
[    0.137406] arm-smmu 1680000.iommu: 	(IDR0.CTTW overridden by FW configuration)
[    0.137417] arm-smmu 1680000.iommu: 	stream matching with 16 register groups
[    0.137447] arm-smmu 1680000.iommu: 	6 context banks (0 stage-2 only)
[    0.137733] arm-smmu 1680000.iommu: 	Supported page sizes: 0x63315000
[    0.137743] arm-smmu 1680000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
[    0.137833] arm-smmu 1680000.iommu: 	preserved 0 boot mappings


[    0.138963] arm-smmu 16c0000.iommu: probing hardware configuration...
[    0.138974] arm-smmu 16c0000.iommu: SMMUv2 with:
[    0.138994] arm-smmu 16c0000.iommu: 	stage 1 translation
[    0.139003] arm-smmu 16c0000.iommu: 	address translation ops
[    0.139011] arm-smmu 16c0000.iommu: 	non-coherent table walk
[    0.139019] arm-smmu 16c0000.iommu: 	(IDR0.CTTW overridden by FW configuration)
[    0.139030] arm-smmu 16c0000.iommu: 	stream matching with 14 register groups
[    0.139058] arm-smmu 16c0000.iommu: 	10 context banks (0 stage-2 only)
[    0.139255] arm-smmu 16c0000.iommu: 	Supported page sizes: 0x63315000
[    0.139265] arm-smmu 16c0000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
[    0.139341] arm-smmu 16c0000.iommu: 	preserved 0 boot mappings


[    2.424369] arm-smmu 5040000.iommu: probing hardware configuration...
[    2.428581] arm-smmu 5040000.iommu: SMMUv2 with:
[    2.434914] arm-smmu 5040000.iommu: 	stage 1 translation
[    2.439584] arm-smmu 5040000.iommu: 	address translation ops
[    2.444881] arm-smmu 5040000.iommu: 	non-coherent table walk
[    2.450522] arm-smmu 5040000.iommu: 	(IDR0.CTTW overridden by FW configuration)
[    2.456175] arm-smmu 5040000.iommu: 	stream matching with 3 register groups
[    2.463216] arm-smmu 5040000.iommu: 	3 context banks (0 stage-2 only)
[    2.483555] arm-smmu 5040000.iommu: 	Supported page sizes: 0x63315000
[    2.490455] arm-smmu 5040000.iommu: 	Stage-1: 48-bit VA -> 36-bit IPA
[    2.497171] arm-smmu 5040000.iommu: 	preserved 0 boot mappings


[    2.546101] arm-smmu 5100000.iommu: probing hardware configuration...
[    2.552439] arm-smmu 5100000.iommu: SMMUv2 with:
[    2.558945] arm-smmu 5100000.iommu: 	stage 1 translation
[    2.563627] arm-smmu 5100000.iommu: 	address translation ops
[    2.568923] arm-smmu 5100000.iommu: 	non-coherent table walk
[    2.574566] arm-smmu 5100000.iommu: 	(IDR0.CTTW overridden by FW configuration)
[    2.580220] arm-smmu 5100000.iommu: 	stream matching with 12 register groups
[    2.587263] arm-smmu 5100000.iommu: 	13 context banks (0 stage-2 only)
[    2.594544] arm-smmu 5100000.iommu: hiding last ctx bank from linux
[    2.614447] arm-smmu 5100000.iommu: 	Supported page sizes: 0x63315000
[    2.621358] arm-smmu 5100000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
[    2.627772] arm-smmu 5100000.iommu: 	preserved 0 boot mappings


[    2.806781] arm-smmu cd00000.iommu: probing hardware configuration...
[    2.813029] arm-smmu cd00000.iommu: SMMUv2 with:
[    2.819627] arm-smmu cd00000.iommu: 	stage 1 translation
[    2.824304] arm-smmu cd00000.iommu: 	address translation ops
[    2.829601] arm-smmu cd00000.iommu: 	non-coherent table walk
[    2.835243] arm-smmu cd00000.iommu: 	(IDR0.CTTW overridden by FW configuration)
[    2.840897] arm-smmu cd00000.iommu: 	stream matching with 54 register groups
[    2.847954] arm-smmu cd00000.iommu: 	17 context banks (0 stage-2 only)
[    2.869307] arm-smmu cd00000.iommu: 	Supported page sizes: 0x63315000
[    2.875785] arm-smmu cd00000.iommu: 	Stage-1: 32-bit VA -> 36-bit IPA
[    2.882205] arm-smmu cd00000.iommu: 	preserved 0 boot mappings


[   24.525457] arm-smmu 16c0000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1900
[   24.525604] arm-smmu 16c0000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
[   24.721874] arm-smmu 16c0000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1900
[   24.722033] arm-smmu 16c0000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]


