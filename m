Return-Path: <linux-arm-msm+bounces-29195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B749599EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 13:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A67D41F22B6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 11:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CFE1D1305;
	Wed, 21 Aug 2024 10:39:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1A81D12FE;
	Wed, 21 Aug 2024 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724236742; cv=none; b=ITGTBOWpVlAeD/EOHts7soFej3VZrRgMSAI+BvS0mN++ggXjgWMNKGDkvNGaaDtw4qqdZqdjoGmyTTZAbz6crd6sMGKCUy//ztiNFosZkU84b9qBAdiyG1WzgipGpfTf3RPZr6wWt37pzUjteFfA9Pl2cCs3lktd9hbMG9tb7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724236742; c=relaxed/simple;
	bh=RmQmTjDDSu/v2Oc8+OOVBVUUOFGP3r3fgDj2i6yJMBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojAczwohxuuBXHq5kEd3jB8OUfcbpOP0mSURBs4EaYw5gw1x2ee8KgAg+gZHNkR6OHlzFnU5gIdMnuaEWwzBQUTQvQiqZ27eqD04hE+dRTJ1AFxHP0p21QMw4uQPDG6Be4Az33380WwHITer34aAC0GvGC/qLzDNfujU8YXq1nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0353ADA7;
	Wed, 21 Aug 2024 03:39:25 -0700 (PDT)
Received: from [10.57.71.237] (unknown [10.57.71.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE0213F73B;
	Wed, 21 Aug 2024 03:38:56 -0700 (PDT)
Message-ID: <a01d2f2f-d963-4eb1-98ee-3dc6f86c9397@arm.com>
Date: Wed, 21 Aug 2024 11:38:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
Content-Language: en-GB
To: Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240821031348.6837-1-quic_taozha@quicinc.com>
 <20240821031348.6837-2-quic_taozha@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240821031348.6837-2-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2024 04:13, Tao Zhang wrote:
> The is some "magic" hard coded filtering in the replicators,
> which only passes through trace from a particular "source". Add
> a new property "filter-src" to label a phandle to the coresight
> trace source device matching the hard coded filtering for the port.

Minor nit: Please do not use abbreviate "source" in the bindings.
I am not an expert on other changes below and will leave it to
Rob/Krzysztof to comment.

Rob, Krzysztof,

We need someway to "link" (add a phandle) from a "port". The patch below
is extending "standard" port to add a phandle. Please let us know if
there is a better way.

e.g.:

filters = list of tuples of port, phandle. ?

e.g.:

filters = < 0, <&tpdm_video>,
             1, <&tpdm_mdss>
	   >


Thanks

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


