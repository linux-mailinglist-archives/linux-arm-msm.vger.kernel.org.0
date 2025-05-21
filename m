Return-Path: <linux-arm-msm+bounces-58836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06840ABEC74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A426F7B4A7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 06:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D7E2356B4;
	Wed, 21 May 2025 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZhjeY6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57669231A32;
	Wed, 21 May 2025 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810268; cv=none; b=RIr1CyWVgkDH97B654tLJUtErwNLeus2Swl2ftFloqey30CHhUfIAeJwZ39FCCic3pTU/N9/wVG824RmnktopHwmaeEU7ApR3pJmlW5q5gmu4X5rJHhdNsx9LO627DTlHuFZhkzwxmosvlsus92S86sOptk9D1/RdwqH8zciwcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810268; c=relaxed/simple;
	bh=rbPuWRc2IlHAfuxihPZQnz6FEHLQy5ZB9NDxIJCBN3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOqmjJm36gEP1MC9vOR7wQzMvomgbs06SGJYFSsdur4TZL0QikmOjsXtneGUjMaga2yPBn6vkl5xwH5/IWrvW7g5zAQEOPEqDdcNn0w1a6fHVRIC78HthYMD5xBSjjuPpv11m36ZKM7RuP5apPTfTcWWj/v7jbwtfHsxiFSnIKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZhjeY6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93DDC4CEE4;
	Wed, 21 May 2025 06:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810267;
	bh=rbPuWRc2IlHAfuxihPZQnz6FEHLQy5ZB9NDxIJCBN3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bZhjeY6M/3TadKT7EnBM6pZrIHDRGyts1x0gInFxLZxd0ORIORHemirY4lNZxcVOR
	 cFasB/i5H98H7/BE+hi8SAJCxu34dskibUukpCVm+R0Rni4sm48STVMeYLnbziCGqC
	 fz91yury0EXGYBHRpsoYTrDBjS1+XilQzEJ/SfUplchvDW31rw+w+1LIpC6FB+ixn5
	 qe+y9lBPUHWF5TbO1s+m+lNfvvQfQxBlGtvN2B2MmVpG+UaJBShLHhBJ49J31nar96
	 VvIrbm773nSWJ+tuYk83hFvuGWlbA/T8ESBlL3xt/Ly3qMmDOCfV1QN7zKGw7EWIYW
	 zltK2UQzAxJQA==
Message-ID: <4734853b-87fc-4625-a9ee-54339b7a1512@kernel.org>
Date: Wed, 21 May 2025 08:51:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
To: Nitin Rawat <quic_nitirawa@quicinc.com>,
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
 krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org, conor+dt@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 beanhuo@micron.com, peter.wang@mediatek.com, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
 <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
 <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
 <852e3d10-5bf8-4b2e-9447-fe15c1aaf3ba@quicinc.com>
 <8aa09712-5543-4bda-bf9e-a29c61656445@kernel.org>
 <80d8888c-41d9-4650-8be7-11e71610a4b8@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <80d8888c-41d9-4650-8be7-11e71610a4b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 20:49, Nitin Rawat wrote:
> 
> 
> On 5/20/2025 1:39 PM, Krzysztof Kozlowski wrote:
>> On 12/05/2025 09:41, Pavan Kondeti wrote:
>>> On Mon, May 12, 2025 at 09:45:49AM +0530, Nitin Rawat wrote:
>>>>
>>>>
>>>> On 5/7/2025 8:34 PM, Nitin Rawat wrote:
>>>>>
>>>>>
>>>>> On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
>>>>>> On 06/05/2025 18:37, Nitin Rawat wrote:
>>>>>>> Disable UFS low power mode on emulation FPGA platforms or other
>>>>>>> platforms
>>>>>>
>>>>>> Why wouldn't you like to test LPM also on FPGA designs? I do not see
>>>>>> here correlation.
>>>>>
>>>>> Hi Krzysztof,
>>>>>
>>>>> Since the FPGA platform doesn't support UFS Low Power Modes (such as the
>>>>> AutoHibern8 feature specified in the UFS specification), I have included
>>>>> this information in the hardware description (i.e dts).
>>>>
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> Could you please share your thoughts on my above comment? If you still see
>>>> concerns, I may need to consider other options like modparam.
>>>>
>>>
>>> I understand why you are inclining towards the module param here. Before
>>> we take that route,
>>>
>>> Is it possible to use a different compatible (for ex: qcom,sm8650-emu-ufshc) for UFS controller
>>> on the emulation platform and apply the quirk in the driver based on the device_get_match_data()
>>> based detection?
>>
>> I do not get what are the benefits of upstreaming such patches. It feels
>> like you have some internal product, which will never be released, no
>> one will ever use it and eventually will be obsolete even internally. We
>> don't want patches for every broken feature or every broken hardware.
> 
> Hi Krzysztof,
> 
> Thank you for your review and opinions. I would like to clarify that 
> this is a platform requirement rather than a broken feature. 
> Additionally, there are few automotive targets, in addition to the FPGA 
> platform, where Low Power Mode (LPM) is not a requirement. For these 
> platforms, the LPM disable changes are currently maintained downstream.

And these platforms do not have their own SoC compatible? When you say
platforms, you mean SoC or boards? So many options... all this is so
unspecific, I need to dig every answer, every specific bit.

> 
> My apology for not including the automotive requirements in my previous 
> commit messages.
> 
> In my opinion, since these platforms do not support LPM, I requested 
> that this be reflected in the hardware description (i.e. DTS)). However, 
> I am open to suggestions and am willing to proceed with module 
> parameters if you have concerns regarding the device tree.

Module param will get other obstacles... We have lengthy discussion
because your commit msg explains nothing. Even now I still don't know
what do you mean by half of above statements. Use the wide upstream
terms, instead of ambiguous like "automotive platform".

Best regards,
Krzysztof

