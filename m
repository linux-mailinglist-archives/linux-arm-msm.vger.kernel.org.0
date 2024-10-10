Return-Path: <linux-arm-msm+bounces-33918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF61998F73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 20:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D7A31C23EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 18:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1251CCEC7;
	Thu, 10 Oct 2024 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImVHqF34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264619D07B;
	Thu, 10 Oct 2024 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583732; cv=none; b=u5DfrM4sJiPRitVW01qvVrnlYoKzSiPXSPYnKVeHYlt/swwnxIp6Sxs3IBSW29XGXFKJ2RkncRmC5uk+Qpc0nF6KYNTsE8CbcVba4Qpx2XBvtbU/mbi1joyRI1zhIgH4HtcUdyWnSN3Hxni76WokqDKx8SGC2q38NuEu9zJhU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583732; c=relaxed/simple;
	bh=kRyuQEirx8OT3QxshSDoNDq0jtdqV++P9IE7Wa7d97Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehp1ZgOcpf45mmb4wX6UTR4K6VIlmsMUiJp0B4J//WR5bDYryuyOAh2TbBkrNsJp0SIIpezXvsClTBUKTFo2J/b4+KUdwY/gpbj8Ohr2BWdp9+zlqVESMJs431f0/BAMIpOIt0t+e7Zor/4APM6RODpOp/Ifnx6QLYrSmsKZISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImVHqF34; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185C8C4CEC5;
	Thu, 10 Oct 2024 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728583732;
	bh=kRyuQEirx8OT3QxshSDoNDq0jtdqV++P9IE7Wa7d97Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ImVHqF34ZN8lV6UT/hSHMhvJ6R6TsRCOwj0xZPU5jUPfDOOi11a+8mbryjMJbw4Qc
	 KIO/1QcnAGcTU/AY1Cb09cW+lzxuFUhE9CgRoxfrEQB65iREMGsjj7/RcXQpuiZl0a
	 VdtCbBw34u6eApoKmfZAes1t6CRZeDcO31PasH4wuH6EMvDSWJiEZ6wJ6PPnzU8QIX
	 U0iCzKpCa+VWoKjqdM3KdI71NFx7iTKXLdwxJ6BS/5PYa4mY+aZKvzCgqn3MFqG+AY
	 cZzJj8+AAGmBPSxl/o1k+WKd0qUkaMCoBmJcycLyurJ0PsvAdpHQoFVMn4uYnAO3Sz
	 Hsc+9IxuoIHig==
Date: Thu, 10 Oct 2024 13:08:48 -0500
From: Rob Herring <robh@kernel.org>
To: Songwei Chai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
Message-ID: <20241010180848.GA2094931-robh@kernel.org>
References: <20241010073917.16023-1-quic_songchai@quicinc.com>
 <20241010073917.16023-2-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010073917.16023-2-quic_songchai@quicinc.com>

On Thu, Oct 10, 2024 at 03:39:09PM +0800, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>    TGU configuration space
>         offset table
>  x-------------------------x
>  |                         |
>  |                         |
>  |                         |                           Step configuration
>  |                         |                             space layout
>  |   coresight management  |                           x-------------x
>  |        registers        |                     |---> |             |
>  |                         |                     |     |  reserve    |
>  |                         |                     |     |             |
>  |-------------------------|                     |     |-------------|
>  |                         |                     |     | priority[3] |
>  |         step[7]         |<--                  |     |-------------|
>  |-------------------------|   |                 |     | priority[2] |
>  |                         |   |                 |     |-------------|
>  |           ...           |   |Steps region     |     | priority[1] |
>  |                         |   |                 |     |-------------|
>  |-------------------------|   |                 |     | priority[0] |
>  |                         |<--                  |     |-------------|
>  |         step[0]         |-------------------->      |             |
>  |-------------------------|                           |  condition  |
>  |                         |                           |             |
>  |     control and status  |                           x-------------x
>  |           space         |                           |             |
>  x-------------------------x                           |Timer/Counter|
>                                                        |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new coresight-tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tgu.yaml      | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> new file mode 100644
> index 000000000000..25b464486fe2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Trigger Generation Unit - TGU
> +
> +description: |
> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
> +  to sense a plurality of signals and create a trigger into the CTI or
> +  generate interrupts to processors. The TGU is like the trigger circuit
> +  of a Logic Analyzer.The corresponding trigger logic can be realized by

space                    ^

> +  configuring the conditions for each step after sensing the signal.
> +  Once setup and enabled, it will observe sense inputs and based upon
> +  the activity of those inputs, even over clock cycles, may detect a
> +  preprogrammed state/sequence and then produce a trigger or interrupt.
> +
> +  The primary use case of the TGU is to detect patterns or sequences on a
> +  given set of signals within some region of the SoC.
> +
> +maintainers:
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +  - Sam Chai <quic_songchai@quicinc.com>
> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,coresight-tgu
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,coresight-tgu
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  qcom,tgu-steps:
> +    description:
> +      The trigger logic is realized by configuring each step after sensing
> +      the signal. The parameter here is used to describe the maximum of steps
> +      that could be configured in the current TGU.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +
> +  qcom,tgu-regs:
> +    description:
> +      There are some "groups" register clusters in each step, which are used to configure the signal
> +      that we want to detect.Meanwhile, each group has its own priority, and the priority increases

space                           ^

> +      with number of groups.For example, group3 has a higher priority than group2 ,the signal configured

space                          ^

Wrong spacing around the ','.

> +      in group3 will be sensed more preferentially than the signal which is configured in group2.
> +      The parameter here is used to describe the signal number that each group could be configured.

Wrap lines at 80 unless there's some exception not to.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 18
> +
> +  qcom,tgu-conditions:
> +    description:
> +      A condition sets a specific requirement for a step and defines the subsequent
> +      action once the requirement is met. For example, in step two, if signal A is
> +      detected three times, the process jumps back to step one. The parameter describes
> +      the register number for each functionality, whether it is setting a specific
> +      requirement or defining a subsequent action.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 4
> +
> +  qcom,tgu-timer-counters:
> +    description:
> +      TGU has timer and counter which are used to set some requirement on each step.
> +      For example, we could use counter to create a trigger into CTI once TGU senses
> +      the target signal three times.This parameter is used to describe the number of
> +      Timers/Counters in TGU.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 2
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description: AXI Slave connected to another Coresight component
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tgu@10b0e000 {
> +        compatible = "qcom,coresight-tgu", "arm,primecell";
> +        reg = <0x10b0e000 0x1000>;
> +
> +        clocks = <&aoss_qmp>;
> +        clock-names = "apb_pclk";
> +
> +        qcom,tgu-steps = <3>;
> +        qcom,tgu-regs = <4>;
> +        qcom,tgu-conditions = <4>;
> +        qcom,tgu-timer-counters = <1>;
> +
> +        in-ports {
> +            port {
> +                tgu_in_tpdm_swao: endpoint{
> +                    remote-endpoint = <&tpdm_swao_out_tgu>;
> +                };
> +            };
> +        };
> +    };
> +...

