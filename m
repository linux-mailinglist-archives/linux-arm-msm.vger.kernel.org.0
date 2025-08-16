Return-Path: <linux-arm-msm+bounces-69425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22235B28BE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 10:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93D21A26331
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 08:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AAE1F1518;
	Sat, 16 Aug 2025 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EduzWTlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912BC171C9;
	Sat, 16 Aug 2025 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755333219; cv=none; b=TSAba25zsKer1MqQaYxmE5mbypP5MvbLNtpKsdrYRMX2C3VWWFN6jiS0pbv0zhnPUTr4XTFxZWgL8feoAdU0sfAlx0L5ROT0sRPs+1HTI2ulZU0hoizLY1DngCN6DkmAJbAC561YF/Y/1ih7vE+1QBxpGEiHQzvyGjVeWkAsLqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755333219; c=relaxed/simple;
	bh=NoF/gia3BzIk7K9+zQybrkg4qnMCSC4IHUB+TORz8TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNeGFD52HTNU7pPBbOB26FV1MYkEQC4nNVjkgWfo+/qRAVRBYvQm1EyMJtBBXoJGLQMbEM5+YBjXryIcqbHao4DZjU8fvu0VzQeN1Vuxnq1rgryMfsord2UTDkM8gZaHK9RGvTvKBbYdF5Cgt/mnqXFHxkSjIWJHWe2QdqV6veQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EduzWTlT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102EFC4CEEF;
	Sat, 16 Aug 2025 08:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755333219;
	bh=NoF/gia3BzIk7K9+zQybrkg4qnMCSC4IHUB+TORz8TQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EduzWTlTyrKzPY6aHEtGQISHbS/b+1yjJdU3OsXnjqnYQXCm599FXAPNI9VYyEz0z
	 FYgc6ov3Uegdq9x5dWmsRlKoCdk8eX39OuLVM0sNTvt6pAG+V4FW1zGfYEafLfeagY
	 wIbG9pXc7p1auGgoSq2dzEAK3E5W+PLQerPqOZxVcoP77qGLLWp524Y+X0ea9xF7rg
	 wB4slB8i3HnVHhRuRr6tQc1KcyLU0Eg1hIoybRAM7HaMEgZB/ZL559hYMwMa0KSpas
	 Tk2MT0rTZgnzifvtnGbkQW80gVL/rMARzv5sOzLQkloWUjzA7TPEPcG3U7XTl1/MLh
	 wxEqOOh8GRd2Q==
Message-ID: <e82ca132-f312-45b5-bec0-9d83cd3771d4@kernel.org>
Date: Sat, 16 Aug 2025 10:33:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-1-62c8e4f7ad32@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250815-itnoc-v1-1-62c8e4f7ad32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2025 15:18, Yuanfang Zhang wrote:
> Add device tree binding for Qualcomm Coresight Interconnect Trace
> Netwrok On Chip (ITNOC). This TNOC acts as a CoreSight
> graph link that forwards trace data from a subsystem to the
> Aggregator TNOC, without aggregation or ATID functionality.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fd224e07ce68918b453210763aacda585d5a5ca2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
> @@ -0,0 +1,108 @@
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
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The Interconnect TNOC is a CoreSight graph link that forwards trace data
> +  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
> +  does not have aggregation and ATID functionality.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,coresight-itnoc
> +  required:
> +    - compatible

Why all this? Drop

> +
> +properties:
> +  $nodename:
> +    pattern: "^tnoc(@[0-9a-f]+)?$"

Why are you requiring a non-generic name?

> +
> +  compatible:
> +    items:

No need for items

> +      - const: qcom,coresight-itnoc
> +
> +  reg:
> +    maxItems: 1
> +    description: Base address and size of the ITNOC registers.

Drop, redundant

> +
> +  clock-names:
> +    items:
> +      - const: apb

Drop clock-names, obvious. Also, odd order - names are never before
actual property.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^port(@[0-9a-f]{1,2})?$':

Why do you have here 255 ports?

> +        description: Input connections from CoreSight Trace Bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false

This goes after $ref

> +
> +  out-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port:
> +        description: out connections to aggregator TNOC
> +        $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false

This goes after ref

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

And here different order... Be consistent. See also DTS coding style.

> +  - in-ports
> +  - out-ports
> +
> +additionalProperties: false
> +



Best regards,
Krzysztof

