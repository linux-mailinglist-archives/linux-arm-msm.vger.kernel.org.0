Return-Path: <linux-arm-msm+bounces-10427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1C850033
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 23:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD5A286D97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8C42E63C;
	Fri,  9 Feb 2024 22:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYebRFZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636942836D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707518714; cv=none; b=cD/UA372nqxAwC9YqVMrPgQPLTvoVCHwsG6gZPGJGhiIjPiyS0DzI/GS9qj+cucU+6EfGo1c6blWqNO6clKFjOWb6l0/0e23OWHWKWEY1+tZYzkcZNgGo3LIsiCu1c7EnpEYCLpJazePI3da8oHrWDex592fSETV5DR5Ad1DEp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707518714; c=relaxed/simple;
	bh=PCuOO1miD4yYQqIynxL3zjiud3HXuKhWFEAcI/DIvPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJnwUPNvoYAR+OnBK1XG3opcXV7SmRd2m1Smp1IdQnJ3CYGPSjreIMYwjnTQm/CM6ddsO2v5vXyns/Rns3mmqLDRy8P9PdDDnQ8WhjKPX66D/njqUYByjdxYHv3bcX60hPziGsqWKhY9Yqerbq3S91nsfn9//EfgZSbEGtYpAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYebRFZl; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5114fa38434so1648546e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 14:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707518710; x=1708123510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKbLP7kIBhW5L1hXOD3HxgkQsg75+FOMpBkBzulTld0=;
        b=TYebRFZlxJmxpOzGi38nXU2o6PX3sQCwRmg/JkyLa0Jq8KiasVlO2JrozNCzEt/oxC
         6qN7iV2rbjnmqZ2A7k6ub6wPdEj0QrDmr+/N6FBYjMLBu+Vd6ri+SqPA5iQ4kLCJPGqb
         RI5gEuV7BJu4vQyL8IXTwMsS7IFooUag57KmTZkwrfy6qxJpVYut3Frdzt1DMtNS8ty8
         DTRSNHeUR15eZp8fWsYlkY+/UZHUdogK2ZKbEO8LZe6bnQoHnxdJmZiVB45JH97ktiik
         5Zp9qw0NcwQYPFXeSwF0G5Bb8PH2Y0ttP90dI2QiqcPxI+Nfb2Xtv0mDherCjwWslXkx
         GAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707518710; x=1708123510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKbLP7kIBhW5L1hXOD3HxgkQsg75+FOMpBkBzulTld0=;
        b=G0CFgAoYWJY9qYcN/hHeMkyv+JRh+j4ejAlcgfImhqFMH37r+spg2FzlcijtrNdRIc
         p/dIrthiVBrfdFh0mTQQxIab9Psu+6BhYwAY0kR9MW8T6YES0ivKQ2GHvH6gv+fEsZ2w
         DI0liFwEeUwFvsqUyoALjcB47tglG3+Cj8wvpGxw8jOHOXmzapwbtURg0k3b5Qzkvsaa
         OmNuo0IR0MK2IsV6PbnHLtrED/ELeQyBi377S2tLdwOxu4Ei5CzKGsdGR17tdqunP0o9
         qzOHR2p4KHXEJbKgw6EQONfP5rhhzCGglKo8XGup35J1/yco66vMV3GleQq6TjN1q0W1
         19gQ==
X-Forwarded-Encrypted: i=1; AJvYcCU307A1aPi4GDk50igeZkCLIFfr2XGdzecA/tNopKRCo7biVXVswmmUgLF1pVbqsGIhVJbpyzNBzYkCz8X0Ya2EVGL7rRu0NI28biHPxg==
X-Gm-Message-State: AOJu0YwaAIaYyblrdsfr/Wx7OZ77+Jp+1bbLfefIq8TSg/xnbp0blv0l
	OUxYIHebUHgcBXeuSbD/G5YWy0N004sOWHl5wGVtJa+ZzHerFwPDj/wlaVUbi2U=
X-Google-Smtp-Source: AGHT+IGp68ZXnWnIe3i6eeZu1V9AEYFGXXkbxiuLD4YA/vOWQy5c3S47rFheU3tWFdGuYVZDPZU1Jg==
X-Received: by 2002:ac2:505b:0:b0:511:52b4:2fed with SMTP id a27-20020ac2505b000000b0051152b42fedmr231156lfm.66.1707518710472;
        Fri, 09 Feb 2024 14:45:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVziY3o+jLOYHVEbvVvc/NKk2+eE+ZxCqBR0txLhjfB4yvjgFOkDmhiBEcjfUfTtDC6jvggl9cFMFaZoaAiSelsQS8m20n2+WZSu32GNm4BtG8lE5oRYI8Y3h7pm92BZC4YxOV4mn9yt3UoLCsp+x5srAKwtnSaLyD04mgJ6oJv+JckkYYPA7IXwW22mOMLlpVy0arxA7N9TWTCzu94/f4kWkjxg66AiK04AYW2CnLGJPJYqIc7A9UPxJiHRTlPK3acsTXOgGY9j0fIyrbjQ8TUiPMEyci51T1oUxSBWQt60XDlA1VAL9L0C8yZskUQtCLxeY8tVXJj31WA68TjdfczcPwX5lhpHv87PLrtNobGcbVeO+IL8ikwWRv7RajJAEWxx6n+1KTMsw4fAVrfUHw0A8pZk/MBtqSdtaSpSXop4YcV+oKTR0rt+A/201rVjdZqEzoFrD61UEAg6+Gnt08=
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vw12-20020a170907a70c00b00a3be00ea824sm1163481ejc.30.2024.02.09.14.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:45:09 -0800 (PST)
Message-ID: <34af183c-638a-49f3-b0b3-784f757282b2@linaro.org>
Date: Fri, 9 Feb 2024 23:45:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/7] firmware: arm_scmi: Add QCOM vendor protocol
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org,
 Amir Vajid <avajid@quicinc.com>
References: <20240117173458.2312669-1-quic_sibis@quicinc.com>
 <20240117173458.2312669-4-quic_sibis@quicinc.com>
 <3325c6ea-ca30-40ee-83ba-c489dc9964b1@linaro.org>
 <2b1d9578-39cc-7836-a51b-be698bb50c43@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <2b1d9578-39cc-7836-a51b-be698bb50c43@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8.02.2024 12:44, Sibi Sankar wrote:
> 
> 
> On 1/18/24 01:45, Konrad Dybcio wrote:
>>
>>
>> On 1/17/24 18:34, Sibi Sankar wrote:
>>> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>>
>>> SCMI QCOM vendor protocol provides interface to communicate with SCMI
>>> controller and enable vendor specific features like bus scaling capable
>>> of running on it.
>>
> 
> Hey Konrad,
> 
>> "QCOM protocol" sounds overly generic, especially given how many
>> different vendor protocols have historically been present in
>> QC firmware..
> 
> Here it is specifically mentioned that way to communicate that
> this is the only vendor protocol exposed by Qualcomm. It handles
> all the other protocols which were usually handled separately on
> older SoCs.

I'm no SCMI specialist but that's a rather.. peculiar design decision,
I guess


> 
>>
>>>
>>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>>> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>>> Co-developed-by: Amir Vajid <avajid@quicinc.com>
>>> Signed-off-by: Amir Vajid <avajid@quicinc.com>
>>> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>> ---
>>
>> So, this is another 0x80 protocol, different to the one that has
>> been shipping on devices that got released with msm-5.4, msm-5.10
>> and msm-5.15 [1][2]. They're totally incompatible (judging by the
>> msg format), use the same protocol ID and they are (at a glance)
>> providing access to the same HW/FW/tunables.
> 
> Thanks for bringing this up but like I already explained the only
> SoC that was actually shipped with ^^ protocol was SC7180 and we
> already have an alternative arrangement for memory dvfs upstreamed
> on it.

Ok, that makes sense.

I took my 8550 phone, enabled some debug prints and it looks like the
only SCMI protocol exposed is 0x19 (which doesn't seem to be defined).

Not sure what other devices would spit out, but I assume what you said
is true.

For completeness, the reported rev is:

arm-scmi firmware:scmi: SCMI Protocol v2.0 'Qualcomm:' Firmware version 0x10000

> Further more it handles only L3 dvfs so it makes zero sense
> to try to upstream the older protocol given that working dvfs solution
> already exists upstream.

We don't have any sort of governor for it though, so I wouldn't go as
far as calling it working :P

> All other SoCs don't have the 0x80 protocol
> enabled for memory dvfs in production.
> 
>>
>> I'm not sure if this can be trusted not to change again.. Unless
>> we get a strong commitment that all platforms (compute, mobile,
>> auto, iot, whatever) stick to this one..
> 
> This is exactly that consolidation effort from Qualcomm. Here they
> expose just one vendor protocol and implement all the algorithms just
> through it.

And I'm very glad you're taking such consolidation steps.. Just a little
worried that in case this protocol's extensibility is exhausted, the next
one would need to be called.. "Qualcomm2"?

Konrad

