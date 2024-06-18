Return-Path: <linux-arm-msm+bounces-22986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3390C8A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046D4285135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2067820B349;
	Tue, 18 Jun 2024 09:56:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0DD20B335;
	Tue, 18 Jun 2024 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718704584; cv=none; b=nNt14gPsD1bZMdpU1BczIsRuJ+sxj6HrD6RynGQ+gUi/TAHRAAqylHZAfcYe0I3uZlUyRZmZHHJYRo3MxzuAxWL8Jf+uqAra0SNGF8v55J3pESOyzUZGm+re3sjSLHUWXM8V/GHSP9Z9CLuq74j8uXWLQFNcKvxcuooOLTSuMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718704584; c=relaxed/simple;
	bh=p4eu6ZcMWmIUI/+gU4HHJ/vfCsmXfLgKSV4vK6dSLQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLpJmOJwp/zLjEPWZy7QaFYVLd6ADPHmNCvGj4+Ov3LsB4mdzE1CWGoIRKJwonlh12/xVmJC5KKpynYO2iPxIMeOG082aDojSUL2LwWv+ZMFYBELjUdDRyfAj3gNXoO2ZH9X0EODYGXZ7/mZpfdbeDmcX+4MBn7Lb2vUrUouiOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 735FFDA7;
	Tue, 18 Jun 2024 02:56:46 -0700 (PDT)
Received: from [10.57.72.20] (unknown [10.57.72.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A28453F6A8;
	Tue, 18 Jun 2024 02:56:17 -0700 (PDT)
Message-ID: <67e6d553-80fe-41c0-9e7a-f809d11ae9bd@arm.com>
Date: Tue, 18 Jun 2024 10:56:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: Add binding document for
 Coresight Slave Register device.
Content-Language: en-GB
To: Jie Gan <quic_jiegan@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Mike Leach <mike.leach@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, quic_yijiyang@quicinc.com, quic_yuanjiey@quicinc.com,
 quic_liuxin@quicinc.com, quic_yanzl@quicinc.com, quic_xinlon@quicinc.com,
 quic_xueqnie@quicinc.com, quic_sijiwu@quicinc.com
References: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
 <20240618072726.3767974-2-quic_jiegan@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240618072726.3767974-2-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/06/2024 08:27, Jie Gan wrote:
> Add binding document for Coresight Slave Register device.

Is this a made up name of the driver ? CoreSight Slave Register
device sounds nowhere near to what it does. If you have a proper
name for the "IP" please use that.

> 
> Add a new property to TMC, qcom,csr-atid-offset, to indicate which
> ATID registers will be used by the TMC ETR. Each TMC ETR device is
> associated with four ATID registers that are continuous in address.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   .../bindings/arm/arm,coresight-tmc.yaml       |  8 ++
>   .../bindings/arm/qcom,coresight-csr.yaml      | 76 +++++++++++++++++++
>   2 files changed, 84 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> index cb8dceaca70e..295641a96c21 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> @@ -82,6 +82,14 @@ properties:
>       $ref: /schemas/types.yaml#/definitions/uint32
>       maximum: 15
>   
> +  qcom,csr-atid-offset:
> +    description:
> +      Offset to the coresight slave register component's ATID register
> +      that is used by specific TMC ETR. The ATID register can be programed according
> +      to the trace id to filter out specific trace data which gets through the ETR
> +      to the downstream components.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Why do we need this ? Could this not be inferred from the "input port" 
to which this ETR is connected on the CSR ?

e.g., input-0 : Offset 0
       input-1 : Offset for Bank1




> +
>     in-ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>       additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
> new file mode 100644
> index 000000000000..16f97cbe3d4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CoreSight Slave Register
> +
> +maintainers:
> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +  - Jie Gan <quic_jiegan@quicinc.com>
> +
> +description:
> +  The Coresight Slave Register controls various Coresight behaviors.
> +  Used to enable/disable ETR’s data filter function based on trace ID.
> +
> +properties:
> +  compatible:
> +    const: qcom,coresight-csr
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1
> +    items:
> +      - const: apb_pclk
> +
> +  reg-names:
> +    items:
> +      - const: csr-base
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port(@[0-7])?$':
> +        description: Input connections from CoreSight Trace bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - in-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10001000 {
> +        compatible = "qcom,coresight-csr";
> +        reg = <0x0 0x10001000 0x0 0x1000>;
> +        reg-names = "csr-base";
> +
> +        in-ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csr_in_port0: endpoint {
> +                    remote-endpoint = <&etr0_out_port>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                csr_in_port1: endpoint {
> +                    remote-endpoint = <&etr1_out_port>;
> +                };
> +            };
> +        };
> +    };


