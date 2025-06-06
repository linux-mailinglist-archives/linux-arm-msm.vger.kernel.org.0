Return-Path: <linux-arm-msm+bounces-60459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23830ACFF55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 11:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7523AE958
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 09:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7121D416E;
	Fri,  6 Jun 2025 09:32:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BCA27468;
	Fri,  6 Jun 2025 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202346; cv=none; b=IYklOYotOyHDubiz8vvkTfqrkaPE1jpJVj3VmBWGyxVfVzSTRx4IROjgDDQxNwamKV4ltlijQ5tyHzfB4tJfQw8CO26ilt+2WrwsQDkOVjP6Wd2DpzOVTPtDtadIb+L/CrsbfI+oSlyK7J5RRmmKqSEv31PjsxaU5UF5anD2PU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202346; c=relaxed/simple;
	bh=g81aEbYwteZ3V3OWzvKzvIPAPWgs84217Y0lm1MM9SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZFEGuWT30NXGaXRxqLv/8BQiRw95BnSjQNEgwddOn5B+TFgNHVdCtkGrxv31jyMqkS0+G12Hv5AmAJ1Xq9/U9kHgRowdCgprft4pOYWrRfS+qys7/t1ptoBEL0J2fpEn/MdhTlACXu65AlKCzSUpo/HNNPwcMmCQmWqBOuvqxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 830E3153B;
	Fri,  6 Jun 2025 02:32:06 -0700 (PDT)
Received: from [10.57.49.177] (unknown [10.57.49.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A98B3F59E;
	Fri,  6 Jun 2025 02:32:22 -0700 (PDT)
Message-ID: <11ea6009-72d2-4306-a068-a828d4af429d@arm.com>
Date: Fri, 6 Jun 2025 10:32:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: Add device Trace Network On Chip
 definition
Content-Language: en-GB
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250606-trace-noc-v8-0-833f94712c57@quicinc.com>
 <20250606-trace-noc-v8-1-833f94712c57@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250606-trace-noc-v8-1-833f94712c57@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 10:18, Yuanfang Zhang wrote:
> Add a new coresight-tnoc.yaml file to describe the bindings required to
> define Trace Network On Chip (TNOC) in device trees. TNOC is an
> integration hierarchy which is a hardware component that integrates the
> functionalities of TPDA and funnels. It collects trace form subsystems
> and transfers to coresight sink.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>   .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 +++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d07c6f2d7b949f69f9d8dd8de8664382eb39fac1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Trace Network On Chip - TNOC
> +
> +maintainers:
> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> +
> +description: >
> +  The Trace Network On Chip (TNOC) is an integration hierarchy hardware
> +  component that integrates the functionalities of TPDA and funnels.
> +
> +  It sits in the different subsystem of SOC and aggregates the trace and
> +  transports it to Aggregation TNOC or to coresight trace sink eventually.
> +  TNOC embeds bridges for all the interfaces APB, ATB, TPDA and NTS (Narrow
> +  Time Stamp).
> +
> +  TNOC can take inputs from different trace sources i.e. ATB, TPDM.

This looks like the generic description of TNOC. But please could you
also mention this binding is only for Aggregator TNOC ? Or make the
binding as such explicit ?

- qcom,coresight-aggregator-tnoc

Suzuki


> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,coresight-tnoc
> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^tn(@[0-9a-f]+)$"
> +
> +  compatible:
> +    items:
> +      - const: qcom,coresight-tnoc
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  clocks:
> +    items:
> +      - description: APB register access clock
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port(@[0-9a-f]{1,2})?$':
> +        description: Input connections from CoreSight Trace Bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +  out-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description:
> +          Output connection to CoreSight Trace Bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - in-ports
> +  - out-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tn@109ab000  {
> +      compatible = "qcom,coresight-tnoc", "arm,primecell";
> +      reg = <0x109ab000 0x4200>;
> +
> +      clocks = <&aoss_qmp>;
> +      clock-names = "apb_pclk";
> +
> +      in-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +
> +          tn_ag_in_tpdm_gcc: endpoint {
> +            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
> +          };
> +        };
> +      };
> +
> +      out-ports {
> +        port {
> +          tn_ag_out_funnel_in1: endpoint {
> +            remote-endpoint = <&funnel_in1_in_tn_ag>;
> +          };
> +        };
> +      };
> +    };
> +...
> 


