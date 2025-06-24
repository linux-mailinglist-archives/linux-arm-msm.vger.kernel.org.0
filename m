Return-Path: <linux-arm-msm+bounces-62161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A9AE5C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA1791B63E5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0208323C512;
	Tue, 24 Jun 2025 06:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zo6tjNxR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36FB235076;
	Tue, 24 Jun 2025 06:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745212; cv=none; b=WMTQpqM7lupu+QYGhx6nXhqmCReTsfyMpcJozpaBDjJPnf5XuwhC44Z2vZh0UeOUKCY7thWwsmxHyjWGWRCHZpj0QHt7MYp8asT837Dt/sVOJOJQjbgmMGvEYZ4rFsbJQhDa6LvHFSXNCJn+JHmQwTAvb+Ogx1VwczyE5n9LQrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745212; c=relaxed/simple;
	bh=dliIV/s4yoFrkmG9zq1wframm3sLFNVuCCgyAzGTVDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fI/X1hIm7yHL5SRSmZh6HPfheSZWNc1VhAqwodQKvkXoHTznro6b93GZhq+dKx9uY6WKaCUCtgCWht20HOXhBPAUYjCqv/AEAldtpkhgh1Aw7fsqW89XTPAEfbEcGLKf4vwWdoeFVXJ+9U+7GY8HiGPkQu39xRD2hccg24JlmPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zo6tjNxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56CBC4CEE3;
	Tue, 24 Jun 2025 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750745212;
	bh=dliIV/s4yoFrkmG9zq1wframm3sLFNVuCCgyAzGTVDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zo6tjNxRE0aeGwLwKgZzj0cBHl0BxwtZrGc6MZJtDAy4ppRHd0IC437Zbl2SYWsh6
	 ZyCmmE2KrbwfkcK24KOsHubpKezrE0MbweEXzG5W0XL/dbniNSF+szQhZKnfwOOIN4
	 OCYFPEsQeewdzQxjD5h2LxsxF36gbJVNFLeXvKZIIWABl3hrzMTkxUYM+U5qd4I9Mk
	 0JN3D9DD6oAVWGSQzKiiKN1003T6V5sZMOugl8my7bSK7154zzmMco5zOlh3bE4f7r
	 79a/bOUkEJGUcwdDtUl2VN3ZC5GXSa1mP9YgCW1y90zu7+cTPpRgBg9ehh/F1F3HtA
	 0wV1jOsdNpAjw==
Message-ID: <e0e66895-e68a-4420-a61b-98a689798ce4@kernel.org>
Date: Tue, 24 Jun 2025 08:06:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Sarthak Garg <quic_sartgarg@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
 <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
 <5bdae07b-a7b1-49be-b843-1704981bc63b@oss.qualcomm.com>
 <ffc62906-c3bb-4968-8f7c-fa7ae5028ad5@kernel.org>
 <fd73a142-3b22-407f-8e6d-00f4e1e1c8eb@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <fd73a142-3b22-407f-8e6d-00f4e1e1c8eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2025 14:31, Konrad Dybcio wrote:
> On 6/23/25 2:16 PM, Krzysztof Kozlowski wrote:
>> On 23/06/2025 14:08, Konrad Dybcio wrote:
>>>>>>
>>>>>> This might be fine, but your DTS suggests clearly this is SoC compatible
>>>>>> deducible, which I already said at v1.
>>>>>
>>>>> I don't understand why you're rejecting a common solution to a problem
>>>>> that surely exists outside this one specific chip from one specific
>>>>> vendor, which may be caused by a multitude of design choices, including
>>>>> erratic board (not SoC) electrical design
>>>>
>>>> No one brought any arguments so far that common solution is needed. The
>>>> only argument provided - sm8550 - is showing this is soc design.
>>>>
>>>> I don't reject common solution. I provided review at v1 to which no one
>>>> responded, no one argued, no one provided other arguments.
>>>
>>> Okay, so the specific problem that causes this observable limitation
>>> exists on SM8550 and at least one more platform which is not upstream
>>> today. It can be caused by various electrical issues, in our specific
>>> case by something internal to the SoC (but external factors may apply
>>> too)
>>>
>>> Looking at the docs, a number of platforms have various limitations
>>> with regards to frequency at specific speed-modes, some of which seem
>>> to be handled implicitly by rounding in the clock framework's
>>> round/set_rate().
>>>
>>> I can very easily imagine there are either boards or platforms in the
>>> wild, where the speed must be limited for various reasons, maybe some
>>> of them currently don't advertise it (like sm8550 on next/master) to
>>> hide that
>>
>> But there are no such now. The only argument (fact) provided in this
>> patchset is: this is issue specific to SM8550 SoC, not the board. See
>> last patch. Therefore this is compatible-deducible and this makes
>> property without any upstream user.
> 
> When one appears, we will have to carry code to repeat what the property
> does, based on a specific compatible.. And all OS implementations will
> have to do the same, instead of parsing the explicit information

Adding new property in such case will be trivial and simple, unlike
having to maintain unused ABI.

And it will be unused, because last patch DTS should be rejected on that
basis: adding redundant properties which are already defined by the
compatible.

Best regards,
Krzysztof

