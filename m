Return-Path: <linux-arm-msm+bounces-107409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKohEcW7BGriNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:58:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3103538739
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2426300B56C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00784DC534;
	Wed, 13 May 2026 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpmq3Hq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB4F43637A;
	Wed, 13 May 2026 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695106; cv=none; b=gxJMXTYJuqlPKDErR1olQlVZn/RbwIZQXDq6b2BgcNlNJcBkjztRmhlCGNjXDVZ8i8MVv1o8UeNpcay0GHScpWy3VlOb8xzVbhYUciu9Gws/l0zjPNwZ0TR4HrOF3UJhhtH3LILX9BrUeImnnjNoUk8F5lPT9ow7asNUoj6TVqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695106; c=relaxed/simple;
	bh=AxClpjGMFT/IS8TAonyIRQqd4Y8WS5Q+6hwbcruaAjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mp25ko7OMoB/Bvd/RUJp79nNGkPmshPNEpouR8PYe7FB0CyJLIry+ZqAbX3O0V0yHyUcT0uLB1TYGFJKUFJuk0oMMF9as2y580TFrPwzCcBWvY9r4NPHwPif8lBeS3S7yXI2qFCqD35TF3qxEb3ST0o9aySzWV0kABJUTJe8/w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpmq3Hq9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A7FC19425;
	Wed, 13 May 2026 17:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695106;
	bh=AxClpjGMFT/IS8TAonyIRQqd4Y8WS5Q+6hwbcruaAjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpmq3Hq9P0j7QXE+5mLqJHwS1cXfU4Ral57BbyHV3Jd6qqyP9R7+zSbBgS9PTdj2e
	 ihZOcy9VQYy+u4QJyo10n3O3Oi5JMN7qib0QIkaDNo4QyBo3M2+glGo+sy+KoCQIck
	 JZDF83e5p8Un0HNHdRuor5wTYoTc0X5+YNv5W2Mf/Vofn1Oc1EprL6u3z1v/ufc1Uw
	 kJ6G44rhH+pKjSlan3Sn4SpFQ4uDMcZAeuPadtvcdDGR0RxSweyVyOzMaxw4E2YDqj
	 CKjnHjpdALtpdWZ+pM52fe8BX9O4S0FScN/bfW7UA+7+bqsilwK8ssKJsPTUi1MNN9
	 Jg7xPqCjL51kw==
Date: Wed, 13 May 2026 12:58:23 -0500
From: Rob Herring <robh@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Ruidong Tian <tianruidond@linux.alibaba.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
	mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM
 AEST
Message-ID: <20260513175823.GA1471517-robh@kernel.org>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
X-Rspamd-Queue-Id: B3103538739
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107409-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,devicetree.org:url]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 05:53:49PM +0530, Umang Chheda wrote:
> The Arm Error Source Table (AEST) specification describes how firmware
> exposes RAS error source topology to the operating system. On ACPI
> systems this information is provided via the AEST ACPI table.
> 
> Introduce Device Tree bindings that provide an equivalent description
> of AEST error sources for DT-based platforms.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
>  include/dt-bindings/arm/aest.h                     |  43 +++
>  2 files changed, 449 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
> new file mode 100644
> index 000000000000..7809a0d38270
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
> @@ -0,0 +1,406 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Error Source Table (AEST)
> +
> +maintainers:
> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
> +
> +description:
> +  The Arm Error Source Table (AEST) describes RAS error sources and their
> +  register interfaces. Each error source exposes one or more error records
> +  through either system registers or a memory-mapped register window, and
> +  may signal errors via interrupts. The top-level node acts as a container
> +  for one or more child nodes, each describing a single AEST error source.
> +  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
> +  Flag bit constants for use in DT source files are defined in
> +  <dt-bindings/arm/aest.h>.
> +
> +properties:
> +  compatible:
> +    const: arm,aest
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
> +    type: object
> +    description:
> +      An AEST error source node describing one error source defined by
> +      the Arm AEST specification.
> +
> +    properties:
> +      compatible:
> +        description:
> +          Identifies the type of AEST error source. Each value corresponds to
> +          a distinct error source class defined by the Arm AEST specification.
> +          arm,aest-proxy represents a proxy error source that forwards errors
> +          from another error source.
> +        enum:
> +          - arm,aest-processor
> +          - arm,aest-memory
> +          - arm,aest-smmu
> +          - arm,aest-gic
> +          - arm,aest-pcie
> +          - arm,aest-vendor
> +          - arm,aest-proxy

This is a fundamental difference how DT and ACPI get structured. ACPI 
defines new table for some feature and puts everything in that table. 
For DT, these all belong in the node for the corresponding h/w. For 
example, if the GIC supports AEST, then that belongs in the GIC node. 

> +
> +      reg:
> +        description:
> +          Register ranges for the error source. Absence of reg implies
> +          system-register access (interface type 0). A single range implies
> +          memory-mapped access (interface type 1). Two ranges imply
> +          single-record memory-mapped access (interface type 2).
> +        minItems: 1
> +        maxItems: 4
> +
> +      reg-names:
> +        description:
> +          Names for the register ranges. The base error-record window is
> +          unnamed (or first entry). Optional named ranges provide access to
> +          the fault-injection, error-group, and interrupt-config register
> +          windows defined by the AEST specification.
> +        minItems: 1
> +        maxItems: 4
> +        items:
> +          enum:
> +            - fault-inject
> +            - err-group
> +            - irq-config
> +
> +      interrupts:
> +        description: Interrupts associated with the error source.
> +        minItems: 1
> +        maxItems: 2
> +
> +      interrupt-names:
> +        description: Names of the interrupts associated with the error source.
> +        minItems: 1
> +        maxItems: 2
> +        items:
> +          enum:
> +            - fhi
> +            - eri
> +
> +      arm,fhi-flags:
> +        description:
> +          Bitmask of flags for the fault-handling interrupt (FHI), as defined
> +          in the AEST node interrupt structure flags field. Constants are
> +          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
> +          AEST_IRQ_MODE_EDGE (1).

DT already has a way to define interrupt flags. Why invent something 
new?

Rob

