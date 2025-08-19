Return-Path: <linux-arm-msm+bounces-69819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0C4B2CD34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 21:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 329F7A01CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 19:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE0930E0E7;
	Tue, 19 Aug 2025 19:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7P4H0LA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3626E70E;
	Tue, 19 Aug 2025 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755632740; cv=none; b=Mfm0cBpUxeS0Le/FQCUxlb2htygW8bIx6URh6wpyI7KruWb4a8RlADf7c0LECefUrwT5PYtVdY8oOG7vkctIFKqOaVSXw8Zq4upqikGiW2owTQJDfD/p2kpnc8KRbu5O1E21QbAWBc/x3Z3K1X3xFK6hbAEtyAdmdGMBxv2fvTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755632740; c=relaxed/simple;
	bh=5+kZM9FbVDV+s3RqTCNRp+ZjDOmphXSaFf1t6iPNim0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWXcPLhQkjrcfb2ZydXX5eAe/s6IUDVntla9gIDNAAylSVGJn3YdfS/LYttSm2TntCQukPRHtwfmkvyem4Okcv0a7XC6HJJbm2viZo6i08GwvuMpivsLwsRyKZyJaqbezMWrk/Q/Qna6+JO8q/y3GeTriBjmO1ymd5U7sUrf1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7P4H0LA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDACC4CEF1;
	Tue, 19 Aug 2025 19:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755632739;
	bh=5+kZM9FbVDV+s3RqTCNRp+ZjDOmphXSaFf1t6iPNim0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7P4H0LAB1KdNUDFG3dgnmKr7y1WRKpgp16Pm9IkMckikQ66uTBEQNghp7y7vEh8o
	 NvwQOmsVwM4Vm4O4ctHiKx6iYcApEG50DCeGLI87TiAjwYrbk1k+4m3n90y+y9jmh1
	 EDnAJNdGbpt44euYOB3gQ47ATic1Iiz5CiWSdSKVlyKbVAUXiHV8MxE4fih5bkylgu
	 aEa9a2nNXGL5Hy2q416+gBF4TmUGuMMEV+C8VajvzzQD9nhX2FzeQCAN/7EQfvVpGW
	 J8vd1NnE4XMLCkICEzV9eMq+mzDTiPJnHRQqMwqGTb2ltDOpIGosEzAx9hAfnLB6vU
	 pI4oN0GM/gkSA==
Date: Tue, 19 Aug 2025 14:45:38 -0500
From: Rob Herring <robh@kernel.org>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight
 Interconnect TNOC
Message-ID: <20250819194538.GA1214644-robh@kernel.org>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 03:27:43AM -0700, Yuanfang Zhang wrote:
> Add device tree binding for Qualcomm Coresight Interconnect Trace
> Network On Chip (ITNOC). This TNOC acts as a CoreSight
> graph link that forwards trace data from a subsystem to the
> Aggregator TNOC, without aggregation or ATID functionality.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a3b5f2b949f69617a014d0ae2831c9c767178f8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-itnoc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Interconnect Trace Network On Chip - ITNOC
> +
> +maintainers:
> +  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> +
> +description:
> +  The Interconnect TNOC is a CoreSight graph link that forwards trace data
> +  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
> +  does not have aggregation and ATID functionality.
> +
> +properties:
> +  $nodename:
> +    pattern: "^itnoc(@[0-9a-f]+)?$"
> +
> +  compatible:
> +    const: qcom,coresight-itnoc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0

Drop these. Already defined by the above ref.

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
> +        description: out connections to aggregator TNOC
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
> +    itnoc@109ac000 {
> +        compatible = "qcom,coresight-itnoc";
> +        reg = <0x109ac000 0x1000>;
> +
> +        clocks = <&aoss_qmp>;
> +        clock-names = "apb";
> +
> +        in-ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                tn_ic_in_tpdm_dcc: endpoint {
> +                    remote-endpoint = <&tpdm_dcc_out_tn_ic>;
> +                };
> +            };
> +        };
> +
> +        out-ports {
> +            port {
> +                tn_ic_out_tnoc_aggr: endpoint {
> +                    /* to Aggregator TNOC input */
> +                    remote-endpoint = <&tn_ag_in_tn_ic>;
> +                };
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.34.1
> 

