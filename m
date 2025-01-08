Return-Path: <linux-arm-msm+bounces-44399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4203FA05E07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C39C71883E84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7DC1FCCE8;
	Wed,  8 Jan 2025 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVNxBQqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793AB1A9B3F;
	Wed,  8 Jan 2025 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345358; cv=none; b=BzKYq6M82tdck8vINpEaHqNVvnvY99cdRJK7q4DvLqNs+jaGaR2PNJq6/vyA16ySjtWvCm/mm1Xdb8abqZYHojQ8TeUwkHq57DNQGhQ/thvmyy5OtsBrB4rKiFvHCZkMFUQ53Uu793pM8LlG3EM7pMYE9iC7U8IifimYqfk0guU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345358; c=relaxed/simple;
	bh=LX133Dc3thZtji5CpjH5Sk1o+MOEpI6ZbvkftrnYjGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJqo8KdIObyCSlnB9My3Whn2B9k6hQpgadu+ACY5uEWtttIzCd98zrccfdIGlrkJAky4KJ97zrumA6HYce6MWkB+a2LdR5K+mhJ08x5GXQoAUEOHVGUaSFKXtNhOzfG1kWHqzCgU0QUtfc8+FNJnAw4zaT+mzbaYsjnBKJdY8fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVNxBQqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017F3C4CED3;
	Wed,  8 Jan 2025 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736345355;
	bh=LX133Dc3thZtji5CpjH5Sk1o+MOEpI6ZbvkftrnYjGg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dVNxBQqC8tlyjhC3+GZpNQsr++VJNuYCuiqUa0j1xWIKAXDCAJTZ1SXokzYJlOVsQ
	 zCl6e2eKAFQEvSr8+7ZLGpDxcbZOFq1REwJ5CbFonpcKmpBSVIAfBcJ6CNsyUnCTwx
	 rpOqQ2/WL5+4n7/gCEeXqNH6natNLvg/XrU/YuKIUJr88N1t83LsWGuKzXgjNcuQG7
	 YK1Uxpq7DU0oQ4jvhqfkKtVWuZa2tpjLvYSH1yHQXg2s/+FhCGlTLq/sctltnP4wiy
	 jQBJCHhyuq+2qGWvIhk7uq2DS8myhTv/ox0jxTyRPNzmf5jvj6aIMciAtBYprhLVlf
	 9HCsMxyKbEnlA==
Message-ID: <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
Date: Wed, 8 Jan 2025 15:09:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <tjrg5zqggupjo36udpyv3vynsij76f4qlus6lkbqotuimusqgq@hosmksp77sif>
 <Z3ZXWxoBtMNPJ9kk@hu-wasimn-hyd.qualcomm.com>
 <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
 <Z3eMxl1Af8TOAQW/@hu-wasimn-hyd.qualcomm.com>
 <xuy6tp4dmxiqbjitmoi6x5lngplgcczytnowqjvzvq5hh5zwoa@moipssfsgw3w>
 <Z3gzezBgZhZJkxzV@hu-wasimn-hyd.qualcomm.com>
 <37isla6xfjeofsmfvb6ertnqe6ufyu3wh3duqsyp765ivdueex@nlzqyqgnocib>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <37isla6xfjeofsmfvb6ertnqe6ufyu3wh3duqsyp765ivdueex@nlzqyqgnocib>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/01/2025 20:58, Dmitry Baryshkov wrote:
>>>>>> Initially, we included the DTS [1] file to avoid duplication. However,
>>>>>> based on Krzysztof's previous suggestion [2], we change to this format.
>>>>>>
>>>>>> Please let us know how to proceed further on this.
>>>>>
>>>>> Krzysztof asked you to include DTSI files instead of including DTS
>>>>> files. Hope this helps.
>>>>
>>>> Are you suggesting that we should also modify the 9100-ride files to
>>>> include DTSI instead of DTS for consistency between QCS9100 and QCS9075?
>>>> However, this would result in the duplication of Ethernet nodes in all
>>>> the ride board files. Would that be acceptable?
>>>
>>> git mv foo.dts foo.dtsi
>>> echo '#include "foo.dtsi"' > foo.dts
>>> git add foo.dts
>>> git commit
>>>
>>
>> We cannot convert sa8775p-ride-r3.dts and sa8775p-ride.dts to .dtsi as
>> they represent different platforms. In patch [1], we included these DTS
>> files to reuse the common hardware nodes.
>>
>> Could you please advise on how we should proceed with the following
>> approaches?
>>
>> a) Previous approach [1]:
>> Include sa8775p-ride-r3.dts and sa8775p-ride.dts in the qcs9075-ride
>> platform DTS, similar to the qcs9100-ride platform DTS. This approach
>> avoids duplicating Ethernet nodes and maintains uniformity. However, it
>> involves including the DTS file directly.
>>
>> b) Current suggestion:
>> Include sa8775p-ride.dtsi in the qcs9075-ride platform DTS and also
>> modify the qcs9100-ride platform DTS files to maintain uniformity. This
>> approach results in duplicating Ethernet nodes.
>>
>> Please let us know your recommendation to finalize the DT structure.
> 
> sa8775p.dtsi
> `__sa8775p-ride.dtsi
>    `__sa8775p-ride-r2.dtsi
>       `__sa8775p-ride.dts
>       `__qcs9100-ride.dts
>       `__qcs9075-ride.dts
>    `__sa8775p-ride-r3.dtsi
>       `__sa8775p-ride-r3.dts
>       `__qcs9100-ride-r3.dts
>       `__qcs9075-ride-r3.dts
> 
Wasim and all other copy-pasters of sa8775p-ride,

Just to recap, qcs9100 contributions started this terrible pattern of
board including a board. Unfortunately qcs9100 was merged, so that ship
has sailed.

This patchset was going the same way, because poor choices like to keep
spreading, but at one of previous versions I noticed it and objected.

This v5 however solves above problem by duplicating the nodes.

Apparently all these designs - sa8755p, qcs9100 and qcs9075 - use the
same board, but none of this was communicated. I checked all the commit
msgs in this patchset and nothing explained about it. What annoys me is
that you do not communicate your design forcing us to accept poor DTS or
forcing us to guess and make poor judgments.

Come with proper hardware description and split out shared parts, like
motherboard. Look how other vendors are doing it, e.g. NXP or Renesas.
But assuming there are shared parts because I am pretty sure you will
pick my comments when it suits you without actually following them fully
and without understanding and explaining to us your own hardware.

Best regards,
Krzysztof

