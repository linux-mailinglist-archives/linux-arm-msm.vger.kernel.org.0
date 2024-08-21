Return-Path: <linux-arm-msm+bounces-29176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D19594F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 08:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734F8285A51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 06:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B89B21C161;
	Wed, 21 Aug 2024 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLtyZU3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BE42139B6;
	Wed, 21 Aug 2024 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724222889; cv=none; b=GCyVQEUQzhHvFocGb4ifpE2x8tskfYVmZU1CIpbmwxm7uxZThD0BsI/GRC85C9RpjYqGkjJofTpuhgF5tKxA9SdcvPEbzswCdH5NMtYm5gut03duzv+P7MXkR49PsrAkMcEuceNVP/Y3CDrgNJhGlzeMEwBiQuXOWxW7fKwb8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724222889; c=relaxed/simple;
	bh=KnyKptH5XM79KZ+C1EQSJLGrGtVSPFQ5nOZWireWwZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoCQwZqcfaciFcmm4kbaqWseP8yWDMUQGf1Z3bJEafpjY4jmlFvzBR5WQl6xDS90kprUhh9fnRg/4Y1hm3hpLKqC5Qm5GG/DZoJfVDYwbb7QcbOqvsbHyL6o+R1hu7CsLGfAo7Jl+F+9Mscd4EkqE9/EpG5Kl41YfF1hnYDjjZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLtyZU3U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C706DC32782;
	Wed, 21 Aug 2024 06:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724222888;
	bh=KnyKptH5XM79KZ+C1EQSJLGrGtVSPFQ5nOZWireWwZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OLtyZU3UnOXLPgnRcroAuwGR1i4uYqC0wBm2yr/fBIbtThb7bhbFQp8uk1gPM8mcb
	 hZqZ7sZSyJZSU3gFM0tI1SaMJh0aeU5EiHT0KOKdiGh5jzweOfjWt1spclCLdQ9tua
	 es7sneCvw4vGSjckr2hGnAsezRbz3TFvcaPC3ssWO56zYWl2+aXbI+/iQ5BpdRuGry
	 KYdV5EETL1MvHC0qPAwRbUhTyJjYENU8enUhnFqk0N15GN04BkaNswLe24Dp0xCzL/
	 o3R/fWspusNYk/PtOUvY50SCCg+V3bXrJuIHAOzaR3BtJPVijCCn/wtTLQc+BUOMLo
	 O2+Wmx+O5YjsA==
Message-ID: <11ca366c-7788-41d0-bf47-4f31c1ee2626@kernel.org>
Date: Wed, 21 Aug 2024 08:48:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Konrad Dybcio <konradybcio@kernel.org>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Elson Serrao <quic_eserrao@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
 <20240807183205.803847-2-quic_molvera@quicinc.com>
 <dfb1ac84-f011-45ea-9fb1-b8c6bc36cabc@kernel.org>
 <46d0627d-877b-41f3-83f6-4c33b562f460@quicinc.com>
 <0ebb1ca3-722d-422f-9f71-fcc61c3470b0@kernel.org>
 <2b118a49-2229-4346-ab21-0aa5377d7a4e@kernel.org>
 <8bb412f8-4fe1-40ca-8414-bb77c66899ae@quicinc.com>
 <0eca6755-a2ec-404f-b98c-ee6c9f6fb55f@gmail.com>
 <f8caa9aa-7fc4-4d42-9011-21ca40eb106d@quicinc.com>
 <81ec34a6-8627-4a59-8fc7-87eee4625b2d@quicinc.com>
 <e663d19a-0ad1-4dfc-903b-ff2012796d84@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e663d19a-0ad1-4dfc-903b-ff2012796d84@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/08/2024 21:19, Konrad Dybcio wrote:
> On 20.08.2024 8:21 PM, Melody Olvera wrote:
>>
>>
>> On 8/14/2024 3:09 PM, Trilok Soni wrote:
>>> On 8/14/2024 1:25 PM, Konrad Dybcio wrote:
>>>>> Unfortunately, no. We considered several options, but none guarantee that we will avoid
>>>>> a crash if we try non-securely. The secure call also won't give a specific error if it fails either
>>>>> (for security reasons) so we can't know if a secure access failed because it's supposed to be
>>>>> accessed non-securely or for another reason; hence this approach. If there's
>>>>> another way to achieve this functionality that might be better, I'm all ears.
>>>> Can we read some fuse values and decide based on that?
>>> In most of the cases, these fuse values are not allowed to be read
>>> from the Linux, so that will be another problem. Melody can check
>>> if there is any fuse values around here and possible to read them
>>> through Linux.
>>>
>>
>> I double-checked, but there really isn't any kind of fuse or anything we can read to determine
>> how we need to access these registers. I remembered checking before authoring these patches,
>> but I wanted to just make sure before responding here.
> 
> Well in that case I suppose a new compatible / property (please voice
> your opinion Krzysztof) is necessary after all.. Thanks for making sure

You mean the "secure" part? Sure, I don't object that, although
(repeating as usual) I am not in favor of it in the first place, be
cause you should use only SoC compatibles.

The objection here was for dropping specific front compatible, without
any relevant explanation.

Best regards,
Krzysztof


