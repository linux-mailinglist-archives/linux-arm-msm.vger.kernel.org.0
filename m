Return-Path: <linux-arm-msm+bounces-50116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D935BA4D5B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93FB718871C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 08:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4911F8BC6;
	Tue,  4 Mar 2025 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJFy/ant"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D41F8918;
	Tue,  4 Mar 2025 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075508; cv=none; b=auLaOW6ap3L4gMbTO1HSWDsxVCAa/dD1ajR0JTBo28xSV6o6jt3T25Io/uoOZ4XtgrIOtDxRQoEHyw6zxiktPf0b47NTA0pV4Cj+tPal8mlMfp0znF5LoEa5NcIve8B4Wchz+7ytj9oiygBXJcfgLVn0H6QezFYT/Is0hIyz8vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075508; c=relaxed/simple;
	bh=/S/hdDRbQrJo2up60ogcSpBJLmTR8FQezMvSl2ll4/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8qGtHxopIEwvim0hUoF51+h91wwvZ0G3XIPdnAxqpS04uhuV113yEv+m3VIhMkT8mlcslUBTWXVKzG3hx5JJRqGnqvxLk2VnPFYD+FuH49utRbY+GEcn9qcDy34cQ6tQvkZh3e1+vAJdEeQ1U9rnnpMrv2qvYrjPotv/1+7zlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJFy/ant; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881E5C4CEE5;
	Tue,  4 Mar 2025 08:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741075507;
	bh=/S/hdDRbQrJo2up60ogcSpBJLmTR8FQezMvSl2ll4/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJFy/antoVkyiFQMJKZ/5j5aeF/sT4nJRyzTOcz+G02QivQvaFciX+FxRIgHQ5KYl
	 GaxUt/4HStgZL9OEoJFr//CkyWGSzJu4jvM0A+YagjkrWayNZZlpz6z6cRlY3yQWkz
	 0Xh2nHqNWCamu9ZspFDyBmAlTWLi/lzAdqbTymoMeljyH6E7a6NYk6eQduqbS/Dpz9
	 27ja2gJ7zqRSB3TchxY1r8Dn8f7idlbUuNzsSnjFIz2HDAAxYimdVnsWekJHIAg3Zh
	 EI+DZXnv1TaWhClR/83hwG9iaVdqSRib79ScOaKt9QExqSFwWWUjhlOI3czDVo2dfX
	 irFogFnd9kHSQ==
Date: Tue, 4 Mar 2025 09:05:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: songchai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
Message-ID: <20250304-certain-aboriginal-magpie-cade86@krzk-bin>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-2-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227092640.2666894-2-quic_songchai@quicinc.com>

On Thu, Feb 27, 2025 at 05:26:34PM +0800, songchai wrote:
> From: Songwei Chai <quic_songchai@quicinc.com>
> 
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
> Signed-off-by: songchai <quic_songchai@quicinc.com>

Don't duplicate yourself.

Anyway, this is marked as v3, I cannot find previous versions, no
changelog, no references.

What happened here in this binding?

> ---
>  .../bindings/arm/qcom,coresight-tgu.yaml      | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> new file mode 100644
> index 000000000000..a41ac68a4fe7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.

2023 and 2024? Where was it published in these years?

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
> +  of a Logic Analyzer. The corresponding trigger logic can be realized by
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
> +      There are some "groups" register clusters in each step, which are used to
> +      configure the signal that we want to detect. Meanwhile, each group has its
> +      own priority, and the priority increases with number of groups. For example,
> +      group3 has a higher priority than group2, the signal configured in group3
> +      will be sensed more preferentially than the signal which is configured in group2.
> +      The parameter here is used to describe the signal number that each group
> +      could be configured.

And all groups are indexed by number? Or do they have names?

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

Wrap according to Linux coding style, so at 80.

> +      For example, we could use counter to create a trigger into CTI once TGU senses
> +      the target signal three times.This parameter is used to describe the number of
> +      Timers/Counters in TGU.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0

Drop

> +    maximum: 2
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description: AXI Slave connected to another Coresight component

So this TGU can be connected to anything in coresight graph, no
restrictions?

> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Most likely you miss also: in-ports


Best regards,
Krzysztof


