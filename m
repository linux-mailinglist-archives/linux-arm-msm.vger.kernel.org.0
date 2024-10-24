Return-Path: <linux-arm-msm+bounces-35667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF539AE05A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 11:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B979F1F220A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 09:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485DB1C07C9;
	Thu, 24 Oct 2024 09:14:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509E21B3937;
	Thu, 24 Oct 2024 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761293; cv=none; b=oNqUqpIAWE0JPRFnAf122Sj+PyleeB0UXhISV/gzA7Tx/TG3onRzzNVtGg1bGvxH+WctEwnwPTziYHrD0Tzr/PjwDLXJ44sWapSbSRbYRKw6J/41BMbhHzI3hmniHoHQJIS7aUlZOhddKNoMBSvxytHNm0rkVk3iwLLbuQNuHGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761293; c=relaxed/simple;
	bh=0Dpewwiyr7pfFfSz5fJw/I04WqJpl7G8f4fiLa06qFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5oJLS209+mI/K+eTPuJ9dDbPZ0BXWFad8ORdKeRHxfD2/UsKB2ew3Yv7Ug2K4aweqQK1uko8xU9yY4T9vnfQxnAto0c4EQDq4YI5iUx2D5Zsh2UiAs4AUtf/FCnuuX0Z9IPsMAg2VAsO1QhDQSUvL/7OI9wCiTCnFIctXgkfY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22095339;
	Thu, 24 Oct 2024 02:15:19 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B78FA3F73B;
	Thu, 24 Oct 2024 02:14:47 -0700 (PDT)
Message-ID: <b848ae69-aca4-43d1-aa38-2f424045ee6f@arm.com>
Date: Thu, 24 Oct 2024 10:14:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
To: Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
 <20241024065306.14647-2-quic_taozha@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241024065306.14647-2-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2024 07:53, Tao Zhang wrote:
> The is some "magic" hard coded filtering in the replicators,
> which only passes through trace from a particular "source". Add
> a new property "filter-src" to label a phandle to the coresight
> trace source device matching the hard coded filtering for the port.

As mentioned in here in v3 review :

https://lkml.org/lkml/2024/8/21/597

Please do not use "src", expand it to "source"

Rest looks fine.

Suzuki

> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   .../arm/arm,coresight-static-replicator.yaml  | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> index 1892a091ac35..0d258c79eb94 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> @@ -45,7 +45,22 @@ properties:
>       patternProperties:
>         '^port@[01]$':
>           description: Output connections to CoreSight Trace bus
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +            properties:
> +              filter-src:
> +                $ref: /schemas/types.yaml#/definitions/phandle
> +                description:
> +                  phandle to the coresight trace source device matching the
> +                  hard coded filtering for this port
> +
> +              remote-endpoint: true
>   
>   required:
>     - compatible
> @@ -72,6 +87,7 @@ examples:
>                   reg = <0>;
>                   replicator_out_port0: endpoint {
>                       remote-endpoint = <&etb_in_port>;
> +                    filter-src = <&tpdm_video>;
>                   };
>               };
>   
> @@ -79,6 +95,7 @@ examples:
>                   reg = <1>;
>                   replicator_out_port1: endpoint {
>                       remote-endpoint = <&tpiu_in_port>;
> +                    filter-src = <&tpdm_mdss>;
>                   };
>               };
>           };


