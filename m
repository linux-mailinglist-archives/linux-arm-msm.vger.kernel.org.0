Return-Path: <linux-arm-msm+bounces-29142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA15958E83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 21:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 376D71C2216C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 19:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78626156228;
	Tue, 20 Aug 2024 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGeksdpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F39149C4F;
	Tue, 20 Aug 2024 19:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724181577; cv=none; b=TEeWBiNTznn4DlFD9MIjaZXlRui8byl0AHudiE+F/HdnmHfM5CqpD7yg9pW34OgiUHZARkenJo/zEXnbSLaAe2ZRKvoa7zTYQmBA8M2E6kb7dpyyacJdPefcDemJrb+ijg9DIdMwRtqcPiNRe+TUkeXl1Mj9Acox+dRlJuLBw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724181577; c=relaxed/simple;
	bh=RmGcxW3LOlrMeL/m6yokO6bOc5amCC+GM7pwxxxaMRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLoECivVYexqenVPkR7bMZ99VtLV2umpXIaWJqEkhIgoyzGfhJYdsIMuvUyvjxDQoUgwzP6fhB7GiGfx7UEOpzCLJG3Y+2wGZWS0MWvsAQToVMEiQKhboYaJxNx0fMZJOE27DO7+jXraD75k8YB1qniusHwDeO3h/2NpYzg4uv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGeksdpW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C248EC4AF0B;
	Tue, 20 Aug 2024 19:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724181576;
	bh=RmGcxW3LOlrMeL/m6yokO6bOc5amCC+GM7pwxxxaMRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DGeksdpW5zPhgcy8CdXTTEXPiepI1YDObSkTjvfFpkgNEPb3gt7j62q6LitcMjZ1l
	 xfzxUDG0KyzrEQu5OJmGlI9xiYT8fScDIpkfe6mXgFhtvD/aRvl35FJzY3BrCRR7qf
	 KFB+0umrG9oRuGPaCtRHjykpD84nKWnZvcxIAxY89zwwZ/e2Ji7GMrJW3URfIdmN/K
	 Td9+ca0BdvC5W6yO+ZBPQS9LRx4nQs0W8eN86APtfgQgqmo3q1SbFhruTCp6iJ29J+
	 VtuhpITXii79w4cWiQWIFt+jsjGDjNo3aqPzSSbB2FJExNAru7poZUIcFTXp3Yvc+M
	 8tsOYWhdcYp8A==
Message-ID: <e663d19a-0ad1-4dfc-903b-ff2012796d84@kernel.org>
Date: Tue, 20 Aug 2024 21:19:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Melody Olvera <quic_molvera@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <81ec34a6-8627-4a59-8fc7-87eee4625b2d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2024 8:21 PM, Melody Olvera wrote:
> 
> 
> On 8/14/2024 3:09 PM, Trilok Soni wrote:
>> On 8/14/2024 1:25 PM, Konrad Dybcio wrote:
>>>> Unfortunately, no. We considered several options, but none guarantee that we will avoid
>>>> a crash if we try non-securely. The secure call also won't give a specific error if it fails either
>>>> (for security reasons) so we can't know if a secure access failed because it's supposed to be
>>>> accessed non-securely or for another reason; hence this approach. If there's
>>>> another way to achieve this functionality that might be better, I'm all ears.
>>> Can we read some fuse values and decide based on that?
>> In most of the cases, these fuse values are not allowed to be read
>> from the Linux, so that will be another problem. Melody can check
>> if there is any fuse values around here and possible to read them
>> through Linux.
>>
> 
> I double-checked, but there really isn't any kind of fuse or anything we can read to determine
> how we need to access these registers. I remembered checking before authoring these patches,
> but I wanted to just make sure before responding here.

Well in that case I suppose a new compatible / property (please voice
your opinion Krzysztof) is necessary after all.. Thanks for making sure

Konrad

