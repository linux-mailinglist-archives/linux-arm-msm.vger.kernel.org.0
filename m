Return-Path: <linux-arm-msm+bounces-102546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHyyCEUO2GmlWwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:38:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A543CF8E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40AFB300E710
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC6F330649;
	Thu,  9 Apr 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="gIA9WO/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0316C86329;
	Thu,  9 Apr 2026 20:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767104; cv=none; b=Ehn8wGQntooWZM+HIXN6IsC4omKxaeyFKYT2spOnwUZSJ9sRoR7Wj1vgEJXSUox/zVJtW95SGl5GIvePDPnKGCTuaXhEEZyIP9hPMONX5rvnHubfozz7edHVcmymvbTHnuYxQq47Wu+YBZryvylS6nUe/YtKHa/nmTgL6FXAN+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767104; c=relaxed/simple;
	bh=aUUCWf6/kvdLhr3jT22D0KkSihovsMBQ9lnpEksksko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qz9trrwOy7GK+mNXL89BSo2oKsbrVa4v2dnQTWnID2B0neByRwIoKYly9/mcWiB0c6kbswU7JSupMAsn4sDYmaLzXv9lyxmZaxYN4zF9N+w+Er8UgT/HLGOHV77OggocjvP4f5aAc8L55i+7waB1tObX5K940JmC0cYo9SU+b3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=gIA9WO/E; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [IPV6:2a02:f000:10bd:e301::471] (unknown [IPv6:2a02:f000:10bd:e301::471])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 594FC5340E02;
	Thu, 09 Apr 2026 22:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1775767096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ahz7Bk3xD2P4hB8w3yAV0ESZON1h7UZOAAG/Qh3s/cc=;
	b=gIA9WO/EVlo/3W/T9UMgzqjOeDI+YlwQvejGmSx8OiqBcsRYMr82fW9JWGWUQbt+D++ehx
	i0BiixjDD/tLHqIuykHEQquKcuzys+/Nzk/+qHOjd6B+hJveADkXYRbe27+lwG4uVzClAb
	wuOwwldKKh1jNabsGDN9ia1+FRtHZaw=
Message-ID: <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
Date: Thu, 9 Apr 2026 22:38:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102546-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeberg.org:url,ixit.cz:dkim,ixit.cz:email,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0A543CF8E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/02/2026 16:59, Dmitry Baryshkov wrote:
> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
>>
>>
>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>>
>>>>>>> If the OS does not support recovering the state left by the
>>>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>>>
>>>>>> This is not the relevant reset
>>>>>>
>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>>>
>>>>> Thanks, I prepared the fixes [1].
>>>>>
>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>>>
>>>>> David
>>>>>
>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>>>
>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>>>> place
>>>
>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
>>> change that to CORE behind the scene. I'd prefer David's approach.
>>
>> Back when I replied, David had a patch that removed the current RSCC
>> reset definition in dt-bindings (at index 0) and re-used that index
>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
>> specific commits when making comments, note to self :P
> 
> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
> work.

So, finally I spent "so much effort" (read throwing it at LLM) looking at:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4bb500, 
fsynr=0x170021, cbfrsynra=0xc88, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4c6900, 
fsynr=0x170021, cbfrsynra=0x880, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x880
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4c3f00, 
fsynr=0x170021, cbfrsynra=0xc88, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4cff00, 
fsynr=0x170021, cbfrsynra=0xc88, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4cd220, 
fsynr=0x170021, cbfrsynra=0x880, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x880
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4d9a00, 
fsynr=0x170021, cbfrsynra=0x880, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x880
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4deb00, 
fsynr=0x170021, cbfrsynra=0x880, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x880
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4e3400, 
fsynr=0x170021, cbfrsynra=0xc88, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4e9500, 
fsynr=0x170021, cbfrsynra=0xc88, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9d4eca00, 
fsynr=0x170021, cbfrsynra=0x880, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x880
arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]

These (or very similar warnings) are around sdm845 definitely 6.19+ / linux-next 
kernels for some time, but pretty harmless.

LLM suggested multiple fixes, but when presenting possibility of implementing 
mdss reset it found it as most preferable [1].

Adding MDSS reset would most likely solve it. It's not critical, but not nice to 
see many red lines in the dmesg.

Is there something I could experiment with to get closer to have proper MDSS reset?

David

[1] https://paste.sr.ht/~okias/c20e8bb1a67ba09df558d56da84894d71ddc1b54

