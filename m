Return-Path: <linux-arm-msm+bounces-85298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF62CC108A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 06:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D3F63002BA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 05:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD259334683;
	Tue, 16 Dec 2025 05:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9tTIDtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DC227A107;
	Tue, 16 Dec 2025 05:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864387; cv=none; b=BeES9KPuuY4uX7NB+h1r7ak8q6m7G2n35JxOf0eCPwWExG7+bTCJa60D4fpVDCWc8U1ewImzvjb0NB3RfgGDb1xQEa6iMYLc0Jh04lyBdcsN0QeVfUuSH+kcA7uwmDhxUz3/6cLdeKyIGuZRrN7DyoegHXPE7bCGAROsQ7fo+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864387; c=relaxed/simple;
	bh=s86mdKjN2cdmgjm8R2+QkPL0rT4EVd4ArfKmeFvFbFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OY3mom/gBwJbHrTY2cxLhmHLabqkawNW2HqP1q4v+popSL+j3fREN2GhjcyZWZ/jXA2PN6GPqWcUW32mI9SB+PvhYrgb8844bRD2BeLM2hDL6HY/Qfum3b4iIiYDZo3vDoN5sjYAjNviAWIKMFtyGxd43o3nJoAOqNlT5SuNVmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9tTIDtt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD72C4CEF1;
	Tue, 16 Dec 2025 05:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765864386;
	bh=s86mdKjN2cdmgjm8R2+QkPL0rT4EVd4ArfKmeFvFbFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9tTIDttgLgO+UO60bk1Bv2SVwFcr1y+ha0xFhkAzd0jIyZZlaBnKcIOeg1rrw5B4
	 pAVWl/cM4z5104QhJCf9BXs1SbRPL0yJoGwmEUt0Vjuym1qAzLoCi6xuKk8Ei82Iwz
	 VWYjFBor5bGxWVRZN5Z62RsLR13XA8ONG2QnS2NHj7QNrUDyhK3JZQ0VvxLV8v7BKF
	 sPwChVDIcjAgT7vO6579Jx3T6UBtGgG3mpHyvomaSiY5zV6sYicLLs+k/mYO6nrqH0
	 bvPYadLDvwU8+X3PurYi9ATlyTfgIYKiLeYWuwyKHr4w6bMB0W1J0Xa+gsDy1CoP3F
	 3WZU/MpORlSfQ==
Date: Tue, 16 Dec 2025 06:53:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil:
 convert to DT schema
Message-ID: <20251216-notorious-omniscient-frog-caceaf@quoll>
References: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
 <20251210003729.3909663-2-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251210003729.3909663-2-mr.nuke.me@gmail.com>

On Tue, Dec 09, 2025 at 06:37:23PM -0600, Alexandru Gagniuc wrote:
> Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
> schema. The text bindngs incorrectly implied that IPQ8074 needs only
> one qcom,smem-states entry. This is only true for QCS404. IPQ8074
> requires both "stop" and "shutdown".
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

Don't add fake addresses to CC. I could not respond to this email
because of that!

> ---
>  .../remoteproc/qcom,ipq9574-wcss-pil.yaml     | 167 ++++++++++++++++++
>  .../bindings/remoteproc/qcom,q6v5.txt         | 102 -----------
>  2 files changed, 167 insertions(+), 102 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
> new file mode 100644
> index 0000000000000..d28f42661d084
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml

Filename based on the compatible, so for example:
qcom,ipq8074-wcss-pil.yaml

> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,ipq9574-wcss-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ WCSS Peripheral Image Loader
> +
> +maintainers:
> +  - Placeholder Maintainer <placeholder@kernel.org>

This must be a real person. Fallback is your SoC maintainer.

> +
> +description:
> +  The IPQ WCSS peripheral image loader is used to load firmware on the Qualcomm
> +  Q6 processor that exposes WiFi-6 devices to the OS via the AHB bus. It is
> +  generally used by ath11k to start up the wireless firmware.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq8074-wcss-pil
> +      - qcom,qcs404-wcss-pil
> +
> +  reg:
> +    minItems: 2

Drop

> +    maxItems: 2
> +    description:
> +      The base address and size of the QDSP6, and RMB register blocks

Drop description. Look at other bindings how this is written.

> +
> +  reg-names:
> +    items:
> +      - const: qdsp6
> +      - const: rmb
> +
> +  interrupts-extended:

No, you only need interrupts. Please look at other bindings - how they
write this.

> +    minItems: 5

Drop

> +    maxItems: 5
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +
> +  resets:
> +    minItems: 3

Drop

> +    maxItems: 3
> +
> +  reset-names:
> +    items:
> +      - const: wcss_aon_reset
> +      - const: wcss_reset
> +      - const: wcss_q6_reset
> +
> +  clocks:
> +    minItems: 10
> +    maxItems: 13

Why is this flexible? Wasn't in the old binding and nothing in the
commit msg explained a change in the binding.

> +
> +  clock-names:
> +    minItems: 10
> +    maxItems: 13
> +
> +  cx-supply:
> +    description:
> +      reference to the regulators used for the booting of the Hexagon core
> +
> +  memory-region:
> +    description: Reference to wcss reserved-memory region

Drop description. Missing maxItems, please look at other bindings. Don't
write your own style, but look how we already wrote remoteproc bindings
(the latest).

> +
> +  qcom,halt-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      A phandle reference to a syscon representing TCSR followed by the three
> +      offsets within syscon for q6, wcss and nc halt registers.
> +    items:
> +      - items:
> +          - description: phandle to TCSR_MUTEX registers
> +          - description: offset to the Q6 halt register
> +          - description: offset to the wcss halt register
> +          - description: offset to the nc halt register
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

That's incomplete - missing constraints. Are you sure you wrote this
code the same way we already did for other devices?

> +    description: States used by the AP to signal the remote processor
> +
> +  qcom,smem-state-names:
> +    description:
> +      Names of the states used by the AP to signal the remote processor
> +
> +  glink-edge:
> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the Modem.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts-extended
> +  - interrupt-names
> +  - memory-region
> +  - qcom,halt-regs
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> +
> +allOf:

Seems you do not reference other schemas. I am going to repeat myself
for 10th time: are you sure you followed other devices?

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq8074-wcss-pil
> +    then:
> +      properties:
> +        qcom,smem-states:
> +          items:
> +            - description: Shutdown Q6
> +            - description: Stop Q6
> +        qcom,smem-state-names:
> +          items:
> +            - const: shutdown
> +            - const: stop

Missing clocks

Missing blank line

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs404-wcss-pil
> +    then:
> +      properties:
> +        qcom,smem-states:
> +          maxItems: 1
> +        qcom,smem-state-names:
> +          items:
> +            - const: stop

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs404-wcss-pil
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 10
> +          maxItems: 10
> +        clock-names:
> +          items:
> +            - const: xo
> +            - const: gcc_abhs_cbcr
> +            - const: gcc_axim_cbcr
> +            - const: lcc_ahbfabric_cbc
> +            - const: tcsr_lcc_cbc
> +            - const: lcc_abhs_cbc
> +            - const: lcc_tcm_slave_cbc
> +            - const: lcc_abhm_cbc
> +            - const: lcc_axim_cbc
> +            - const: lcc_bcr_sleep

All this goes to previous if.

> +      required:
> +        - clocks
> +        - clock-names
> +        - cx-supply
> +
> +additionalProperties: false

Missing example.


Best regards,
Krzysztof


