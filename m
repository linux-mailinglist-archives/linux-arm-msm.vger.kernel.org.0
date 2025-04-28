Return-Path: <linux-arm-msm+bounces-55876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 732BCA9EB70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 11:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 936273AEB99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A9D255233;
	Mon, 28 Apr 2025 09:06:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB739B672;
	Mon, 28 Apr 2025 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831201; cv=none; b=fn0Nn200woebtMBM4Y3ObcJqNHMfg3eIxfv4yJz1dAh+JyhCrmSbS01cGbqPqrb1BuDWbo2SiCJUTZkILIgxbhJOpELVDDNHMWditF2BgkangbmrSeWGwQtWYLG8Q2Kxi1cVKfpI51fRPo9s2V2x/4lBNGPB+itNvmce/kZBBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831201; c=relaxed/simple;
	bh=LNo/xdsUolHxYQUv52HGSaorVZ7jl2MegopSWIyC/JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/DKmK2pKXq0sbw8r85POIuamM/usUIP4plPbD6axmIl0aeIWsARAaOp4kdW54Upe8GnXD6guaqeeCuFQnhWWiXs4heALS4xh5sw5xf3chSWpf6Q+ap/ZB7fI9EowZ1A7fwdcS9MhjUdoNKW7t27gu1StiHN/z73aSI8eEVQRUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EDDB1595;
	Mon, 28 Apr 2025 02:06:32 -0700 (PDT)
Received: from [10.1.37.44] (Suzukis-MBP.cambridge.arm.com [10.1.37.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00B283F673;
	Mon, 28 Apr 2025 02:06:35 -0700 (PDT)
Message-ID: <3094b6e7-0de9-43a3-9678-4b1844aa600c@arm.com>
Date: Mon, 28 Apr 2025 10:06:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Lee Jones <lee@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry

On 25/04/2025 18:47, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks. Document those optional clocks in the schema.
> Additionally document the one-off case of Zynq-7000 platforms which uses
> apb_pclk and two additional debug clocks.

What is the plan for merging this series ? I am happy to pick this patch
via coresight tree.

> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Otherwise,


Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki



> ---
>   .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> @@ -30,6 +30,19 @@ properties:
>     power-domains:
>       maxItems: 1
>   
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - enum: [apb_pclk, atclk]
> +      - items: # Zynq-700
> +          - const: apb_pclk
> +          - const: dbg_trc
> +          - const: dbg_apb
> +
>     in-ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>       additionalProperties: false
> 


