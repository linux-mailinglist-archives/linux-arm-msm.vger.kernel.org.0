Return-Path: <linux-arm-msm+bounces-49004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B21A403CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 00:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 459B03B78EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 23:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99EC254B09;
	Fri, 21 Feb 2025 23:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGB2ubSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF87254AE0;
	Fri, 21 Feb 2025 23:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740181991; cv=none; b=LQAoIZFRdhMhQR+zPwFzJfGjbd4OEfuUeC30WI1h1N61aOiRNq70li7oVSmGRQ1awcBw931YU3beVzcZAORAgKr8rBRYbS9SJv3kKWitVIgrm5NWtudY2OudhAMnEFQFkM2ULfb7Yoxz/mlYBjMImvV8uVk3/Ay+Q9vEplCwKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740181991; c=relaxed/simple;
	bh=/YFrwlZgyvLoJMUeq+tvf10yh7R4xJNFEg5KwtEoi2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Em+tkEU0mxqfQRC/UJxuZvhoHaLMR4I6I1GVQTG5ZlqSNkEnKtlYozFcgRscWtns41GNwkm67UmT1ZhJM7wzyPHzDaJ6dSyE7gCfsLHu+ewknYImfHqAtv6ub7HdkwhCnJXHnmsBAWKRyPVVp9NpTJ0PasegTiykZnTeFanMyPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGB2ubSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F5EC4CED6;
	Fri, 21 Feb 2025 23:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181989;
	bh=/YFrwlZgyvLoJMUeq+tvf10yh7R4xJNFEg5KwtEoi2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGB2ubSjMbE6ueP9Gqq/84p4aoMNKf5redslySU1HfRmrAGAB+WTs0uN0rlcHj2/S
	 /C33QhzEcp347yjR7IjJfmzQAZaMwDFv97KvhwwXzN01mYS1puRP4RAkqhJZTRy516
	 t8BxpUPsAU+QgITpLUJxHCTWHRphP4ebBQFsZGs1KF+YJi0OW56vzjt8XTXijJFVPJ
	 CHDLgVM/4xGktwYIkgHFEvlkqtLJ4JeH+gZR/UY+q4I6zYEEPEmMbI0Yf/bCogRcOl
	 6xTfn4UyKw/F3TtA32gdHnr3JAmIcz8q7+Qwjcd7ZX5bLRYKUxJ9vjnJ078aFlOMvm
	 bmlu6PSROh/rQ==
Date: Fri, 21 Feb 2025 17:53:07 -0600
From: Rob Herring <robh@kernel.org>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
Message-ID: <20250221235307.GA401276-robh@kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>

On Fri, Feb 21, 2025 at 03:40:28PM +0800, Yuanfang Zhang wrote:
> Adds new coresight-tnoc.yaml file describing the bindings required
> to define Trace NOC in the device trees.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b8c1aaf014fb483fd960ec55d1193fb3f66136d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ttrace NOC(Network On Chip)
> +
> +maintainers:
> +  - yuanfang Zhang <quic_yuanfang@quicinc.com>
> +
> +description:
> +  The Trace NoC is an integration hierarchy which is a replacement of Dragonlink tile configuration.
> +  It brings together debug component like TPDA, funnel and interconnect Trace Noc which collects trace
> +  from subsystems and transfers to QDSS sink.
> +
> +  It sits in the different subsystem of SOC and aggregates the trace and transports it to Aggregation TNoC
> +  or to QDSS trace sink eventually. Trace NoC embeds bridges for all the interfaces(APB, ATB, QPMDA & NTS).
> +
> +  Trace NoC can take inputs from different trace sources i.e. ATB, QPMDA.

Wrap lines at 80 char. And you need '>' to preserve paragraphs.

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

blank line

> +  compatible:
> +    items:
> +      - const: qcom,coresight-tnoc
> +      - const: arm,primecell
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2

Need to describe what each entry is.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  in-ports:
> +    description: |

Don't need '|'

> +      Input connections from subsystem to TNoC
> +    $ref: /schemas/graph.yaml#/properties/ports

You have to define the 'port' nodes.

> +
> +  out-ports:
> +    description: |
> +      Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port:
> +        description: |
> +          Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.

'connections' sounds like more than 1, but you only have 1 port. 

Wrap at 80 char.

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
> +      reg = <0x0 0x109ab000  0x0 0x4200>;
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
> -- 
> 2.34.1
> 

