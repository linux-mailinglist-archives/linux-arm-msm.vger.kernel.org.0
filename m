Return-Path: <linux-arm-msm+bounces-65211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D831CB0738A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3C9C7A63A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF18C2F2C69;
	Wed, 16 Jul 2025 10:34:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365762F2C4C;
	Wed, 16 Jul 2025 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662041; cv=none; b=TeWe7o5+8XfULmnLJZVYXXx7P8aVJSe1PC79vquPKwmVpXJvGzdzw/NeRRYoGiRs0b5MyoDh5cQH+G46hj+Q3QGLXCWLTX0x/ksMiNYK+tQ9IsZXq0z5mIv8oKTXtzNo9XP0wTGLP+uJLlFVa2nnPytm1h8wZXRZBbqSkAiIZHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662041; c=relaxed/simple;
	bh=iHbQwUEQskSRpiTgjfjfk3baG4wJ79U65ioEyJgGVXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DzT9UEJviy2yr4ZIW+QlmyWURFS2Xn0kHvOADMyGQOjyShmd5gSvmj3NzgHlHxRDCL14vVOjyvhdfUWTK12lRUyTVj00Sbnt+sY5zghhQnHpln2k/HnsYIxefLlqnbc6gMnKtuc6/M6FeY+mJuyvtatlVluPoOULZdgCheRJD0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6285F12FC;
	Wed, 16 Jul 2025 03:33:51 -0700 (PDT)
Received: from [10.57.0.109] (unknown [10.57.0.109])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D65E83F694;
	Wed, 16 Jul 2025 03:33:56 -0700 (PDT)
Message-ID: <c848cb8d-c040-4d4b-8d7b-558f2e041f0c@arm.com>
Date: Wed, 16 Jul 2025 11:33:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: arm-smmu: Remove sdm845-cheza
 specific entry
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-16 11:16 am, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The firmware on SDM845-based Cheza boards did not provide the same
> level of feature support for SMMUs (particularly around the Adreno
> GPU integration).
> 
> Now that Cheza is being removed from the kernel (almost none exist at
> this point in time), retire the entry as well.
> 
> Most notably, it's not being marked as deprecated instead, as there is
> no indication that any more of those ~7 year old devboards will be
> built.

And even if someone did want to make a new batch, they'd have no excuse 
not to fix the firmware by now...

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..646814ec7d15f6d8a0136de73b7eaddae232ea64 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -132,10 +132,6 @@ properties:
>                 - qcom,sm7150-smmu-v2
>             - const: qcom,adreno-smmu
>             - const: qcom,smmu-v2
> -      - description: Qcom Adreno GPUs on Google Cheza platform
> -        items:
> -          - const: qcom,sdm845-smmu-v2
> -          - const: qcom,smmu-v2
>         - description: Marvell SoCs implementing "arm,mmu-500"
>           items:
>             - const: marvell,ap806-smmu-500
> 


