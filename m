Return-Path: <linux-arm-msm+bounces-32247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 714209842F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 163E21F23D89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7698157468;
	Tue, 24 Sep 2024 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2wm0uQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E89156678;
	Tue, 24 Sep 2024 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172257; cv=none; b=SmTQF2i587520yTs7QjR05gcl2KXY+ZynQXWn9I8Ab3pyqHVYaFwqU8tJdNe3iMnVDpIF28jmLnCrwwZADz726WlNAizclL4yrM1v42KgX0EwfuQdRo9NQHWsueQndEfKsbs7GZr8yyVtxtkh+hvWSpOSkr3Rv+DvKDwk794JuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172257; c=relaxed/simple;
	bh=ZOlF++g0DIY2Dau+2rmCmqOq54oAWz267Ydk8PsExYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdP5tKMA/tVoZNQNrJ990tfpFM2/NUI7e/uP3gOE/o4LVcMP7rHzfLBZ/3bwFZfO5Nl2t67e9oMD3+9WDcWBYWVqSkINjk/bUZLBhN4s7UmF/Tw6K6AuGwj8p5OAdlwrmva9R93WQkwtyCA5NHfspu7ItnT2pj9lNCYEAGj2Zp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2wm0uQ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FBAC4CEC4;
	Tue, 24 Sep 2024 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727172257;
	bh=ZOlF++g0DIY2Dau+2rmCmqOq54oAWz267Ydk8PsExYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y2wm0uQ1HDdCiv+s91by4J87LRT7W7YFZE1tg7HJiRISSINtagwlzVCbuDJr6X4ai
	 4cIN8c7BzMQk64IJvthriuY4uY2ldAYJJ7u9Z7nljCn7bPMdNYolFabllJUrJkKsUU
	 1hve/5wBQuebCazjHcTG2DvheM0YizqmqNc1w3Hb0HXBSCQ6yvEN1PNe9u7HC54YLM
	 KUV3HEYbZWvikfxzqIdnvzxaUa7XtcHRMwb23i89VuXam0hhUciKgxS4mW2pH+eTrb
	 cMve6I5158QTF+YIrwDoGdxUOnsx/a3G0Xafp3glQT9xzR9FW1tZL+Bm2cWi+zv1++
	 j88IphF1gqrIw==
Message-ID: <2a1b199b-b426-4895-be8f-2b7629e84fcd@kernel.org>
Date: Tue, 24 Sep 2024 12:04:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/11] arm64: dts: qcom: sm6350: Affirm IDR0.CCTW on
 apps_smmu
To: Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
 <20240919-topic-apps_smmu_coherent-v1-7-5b3a8662403d@quicinc.com>
 <D4EBVCYB1A56.21TT1WFRGCYGN@fairphone.com>
 <D4ECC1Y7MLX2.2072IIRC7SJV3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <D4ECC1Y7MLX2.2072IIRC7SJV3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 9:37 AM, Luca Weiss wrote:
> On Tue Sep 24, 2024 at 9:15 AM CEST, Luca Weiss wrote:
>> On Thu Sep 19, 2024 at 12:57 AM CEST, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>>>
>>> On RPMh-based SoCs, the APPS SMMU advertizes support for cache-coherent
>>> pagetable walk via the IDR0 register. This however is not respected by
>>> the arm-smmu driver unless dma-coherent is set.
>>>
>>> Mark the node as dma-coherent to ensure this (and other) implementations
>>> take this coherency into account.
>>
>> Hi Konrad!
>>
>> Similar to [0] everything seems to look fine on SM7225 Fairphone 4.
>>
>> [    0.190433] arm-smmu 15000000.iommu: probing hardware configuration...
>> [    0.190459] arm-smmu 15000000.iommu: SMMUv2 with:
>> [    0.190499] arm-smmu 15000000.iommu:         stage 1 translation
>> [    0.190515] arm-smmu 15000000.iommu:         coherent table walk
>> [    0.190531] arm-smmu 15000000.iommu:         stream matching with 71 register groups
>> [    0.190560] arm-smmu 15000000.iommu:         63 context banks (0 stage-2 only)
>> [    0.191097] arm-smmu 15000000.iommu:         Supported page sizes: 0x61311000
>> [    0.191114] arm-smmu 15000000.iommu:         Stage-1: 36-bit VA -> 36-bit IPA
>> [    0.191299] arm-smmu 15000000.iommu:         preserved 0 boot mappings
>>
>> The Adreno SMMU still has non-coherent table walk.
>>
>> [    1.141215] arm-smmu 3d40000.iommu: probing hardware configuration...
>> [    1.141243] arm-smmu 3d40000.iommu: SMMUv2 with:
>> [    1.141270] arm-smmu 3d40000.iommu:  stage 1 translation
>> [    1.141279] arm-smmu 3d40000.iommu:  address translation ops
>> [    1.141288] arm-smmu 3d40000.iommu:  non-coherent table walk
>> [    1.141296] arm-smmu 3d40000.iommu:  (IDR0.CTTW overridden by FW configuration)
>> [    1.141307] arm-smmu 3d40000.iommu:  stream matching with 5 register groups
>> [    1.141326] arm-smmu 3d40000.iommu:  5 context banks (0 stage-2 only)
>> [    1.141347] arm-smmu 3d40000.iommu:  Supported page sizes: 0x63315000
>> [    1.141356] arm-smmu 3d40000.iommu:  Stage-1: 48-bit VA -> 36-bit IPA
>> [    1.141568] arm-smmu 3d40000.iommu:  preserved 0 boot mappings
>>
>>
>> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4
>>
>> [0] https://lore.kernel.org/linux-arm-msm/CAD=FV=Xrbe1NO+trk1SJ30gHm5jLFjd0bAeG3H46gD+vNFZa1w@mail.gmail.com/
> 
> FWIW adding 'dma-coherent;' to &adreno_smmu also doesn't seem to
> explode:
> 
> [    1.451965] arm-smmu 3d40000.iommu: probing hardware configuration...
> [    1.455547] arm-smmu 3d40000.iommu: SMMUv2 with:
> [    1.459041] arm-smmu 3d40000.iommu:  stage 1 translation
> [    1.462446] arm-smmu 3d40000.iommu:  address translation ops
> [    1.465843] arm-smmu 3d40000.iommu:  coherent table walk
> [    1.469216] arm-smmu 3d40000.iommu:  stream matching with 5 register groups
> [    1.472645] arm-smmu 3d40000.iommu:  5 context banks (0 stage-2 only)
> [    1.476067] arm-smmu 3d40000.iommu:  Supported page sizes: 0x63315000
> [    1.479458] arm-smmu 3d40000.iommu:  Stage-1: 48-bit VA -> 36-bit IPA
> [    1.483152] arm-smmu 3d40000.iommu:  preserved 0 boot mappings
> 
> And kmscube still runs as expected.

Thanks, I'll look into adreno separately

Konrad

