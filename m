Return-Path: <linux-arm-msm+bounces-66535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE13B10B43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B29CB3AF397
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88A02D5C9E;
	Thu, 24 Jul 2025 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJVU6jbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFE267B9B;
	Thu, 24 Jul 2025 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753363234; cv=none; b=W0xUEEcJmLxqb98mkCh6VhVcZ/jh4qmH2wRy8tKbEesCJDpJKaJERVejGzrroApgvFOnJxpZCkOfgfVRh2RFonsg3UYcF2iqfkUaPkeUmOvkjekjGWIL1CYi4W1EM/0VBRcf8obfnWeBZx+hgZyfmhiB1QNK3EjgECf2+I3GfH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753363234; c=relaxed/simple;
	bh=OjErf/on7Hr9VLr/pwmO5V9uQXm+jUzp0cJzJ5Yqijw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GnifbqK0Lz3jtCTuAOV5fs/sDjWqVWJAs3TyhEMdUrcOsbt6bWuduarkSjOTuk7b8hDY7/m1vy7CPVJB03RQ/CQFtVHuyjgHnfgAHdSlUPDTWZUOvGeCeAPibn23vImf3evP9HTjocFJZOn2USjHMuUhXViB1cnInWYX9q5n8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJVU6jbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E5BC4CEED;
	Thu, 24 Jul 2025 13:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753363234;
	bh=OjErf/on7Hr9VLr/pwmO5V9uQXm+jUzp0cJzJ5Yqijw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RJVU6jbiRqtjqaSUd0tuxqBFxpnonHoeDo7bmnB1+sEhaTx1TCs4r1doF6gjqnrGA
	 da7wfuTsYQ94wD7KLevM3IJp/BamHctRXgr8jtg05KY2FCAS2y6rRIg4d7j1lsl0Zg
	 pKThyyNrLUhvC4PJ0vXRE4H3qHQQqCb8zpnWLs20iQxI9CXtSvDbh8B8Fr3QWp/NeJ
	 LQ09eSQ3YOAnRHg/ipbw5mRXYjUkvEyBVK4hPBrYR0KymVhKT5eS9+bTJeAKzqoCrb
	 DCNY5rzaATwDPmVJjcGl0YNNWS7q/wvpUx/d2UDju0hxPRZXG2xrzx4lXyiolVP7As
	 K6snAsMpfZKYA==
Message-ID: <3cbbace5-eff9-470e-a530-36895d562556@kernel.org>
Date: Thu, 24 Jul 2025 15:20:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
 <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
 <159eb27b-fca8-4f7e-b604-ba19d6f9ada7@oss.qualcomm.com>
 <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>
 <fd1a9f2f-3314-4aef-a183-9f6439b7db26@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <fd1a9f2f-3314-4aef-a183-9f6439b7db26@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/07/2025 15:11, Konrad Dybcio wrote:
> On 7/24/25 2:51 PM, Krzysztof Kozlowski wrote:
>> On 24/07/2025 14:47, Konrad Dybcio wrote:
>>> On 7/23/25 10:29 AM, 'Krzysztof Kozlowski' via kernel wrote:
>>>> On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
>>>>> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
>>>>> collectively referred to as lemans. Most notably, the last of them
>>>>> has the SAIL (Safety Island) fused off, but remains identical
>>>>> otherwise.
>>>>>
>>>>> In an effort to streamline the codebase, rename the SoC DTSI, moving
>>>>> away from less meaningful numerical model identifiers.
>>>>>
>>>>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
>>>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
>>>>
>>>> No, stop with this rename.
>>>>
>>>> There is no policy of renaming existing files.
>>>
>>> There's no policy against renaming existing files either.
>>
>> There is, because you break all the users. All the distros, bootloaders
>> using this DTS, people's scripts.
> 
> Renames happen every now and then, when new variants are added or
> discovered (-oled/lcd, -rev-xyz etc.) and they break things as well.

There is a reason to add new variant. Also it does not break existing
users, so not a good example.

> Same way as (non-uapi) headers move around and break compilation for
> external projects as well.

Maybe they should not...

> 
>>
>>>
>>>> It's ridicilous. Just
>>>> because you introduced a new naming model for NEW SOC, does not mean you
>>>> now going to rename all boards which you already upstreamed.
>>>
>>> This is a genuine improvement, trying to untangle the mess that you
>>> expressed vast discontent about..
>>>
>>> There will be new boards based on this family of SoCs submitted either
>>> way, so I really think it makes sense to solve it once and for all,
>>> instead of bikeshedding over it again and again each time you get a new
>>> dt-bindings change in your inbox.
>>>
>>> I understand you're unhappy about patch 6, but the others are
>>> basically code janitoring.
>>
>> Renaming already accepted DTS is not improvement and not untangling
>> anything. These names were discussed (for very long time) and agreed on.
> 
> We did not have clearance to use the real name of the silicon back then,
> so this wasn't an option.
> 
>> What is the point of spending DT maintainers time to discuss the sa8775p
>> earlier when year later you come and start reversing things (like in
>> patch 6).
> 
> It's quite obviously a huge mess.. but we have a choice between sitting on
> it and complaining, or moving on.
> 
> I don't really see the need for patch 6, but I think the filename changes
> are truly required for sanity going forward.
> We don't want to spawn meaningless .dts files NUM_SKUS * NUM_BOARDS times.

Renaming will not change that. You will have still that amount of boards.

> 
> So far these are basically Qualcomm-internal boards, or at the very least
> there was zero interest shown from people that weren't contracted to work
> on them.

They committed them to upstream for a reason. This comes with
obligations and responsibility, especially for big vendor like Qualcomm.
Qualcomm does not want to commit? No problem, don't upstream...


Best regards,
Krzysztof

