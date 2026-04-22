Return-Path: <linux-arm-msm+bounces-104032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGLMLO966GlvKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:38:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB39443034
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26AB0301753F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 07:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE76A372EC0;
	Wed, 22 Apr 2026 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8oU9euG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9883A3603FC;
	Wed, 22 Apr 2026 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843455; cv=none; b=Y6hthZ3io7dZSh4OKCBcYTI1sXCvKI/ns5vGkzRwU1Km/1KOqYDLlqDKpftXXdVd1K8vxIQNq6qoFIOSUhT2YgWSRYvy5TmXdlWKQceIBIO6z06bBvz25SrYDUmQsuqwFh6jNNBoyX7/K9ct3Tk3x4oKC0KlgT3OXlqXsAMO0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843455; c=relaxed/simple;
	bh=obqVR0jvrA34R7p1liFllX9ZW6t24tAVPvVaoNRMaX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWXlBZXWhJRyT9X/YpBRUdhXENMAzwMfOa1h//u5ib3dXjXaQthunWLhGbqcVePFJ2PAaTDSZbk++y0G8s44z+WXIjCzBlqRsh3lNGfGqm/4O05Mi65ljR7Bz0+tjc/k/9jxDoq1yFQMhCEtiHlvekqZOefGltuhDvPibPAaiDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8oU9euG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C2FC2BCF4;
	Wed, 22 Apr 2026 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776843455;
	bh=obqVR0jvrA34R7p1liFllX9ZW6t24tAVPvVaoNRMaX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8oU9euGedxV8ZrPLFTsmjtXgKDbHru83MG40BHxelH5qFI9Ztl7zt/cMHeJWTrbp
	 5NqfNCNuV9AzZwCxhhDwgwNkwj9L3wibK4gYfUYl1X6CIVwackukk67PaAbwHPfeYG
	 JJuBppOS0Su4StDQdojNRy9jAxdomEdB8ojTEIWig8bF/7Vc/nEs7r2QbfqFARzdDS
	 GXqH72FAVEMLq0PXYXzdkoev+6RgKTL3d8fQWW5RB932dbxLvedB6Hsl8OBpGDFzu2
	 juKGyvldR6RvLRL7LvTHGXI8CzMCxlkOJ0vH5UFAsJOiEOJ3CT9w8eg1GiNiTcmlwa
	 oaS6ud59SZNrQ==
Date: Wed, 22 Apr 2026 09:37:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 01/13] dt-bindings: soc: Introduce device bindings for
 CESTA Resource Manager
Message-ID: <20260422-prophetic-hog-of-variation-93722c@quoll>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104032-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,bootlin.com:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 6EB39443034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:58:54PM +0530, Jagadeesh Kona wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> CESTA (Client State Aggregation) Resource Manager which is responsible
> for client side management and aggregation of local resources.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

A nit, subject: drop second/last, redundant "device bindings for". The
"dt-bindings" prefix is already stating that these are bindings and they
cannot be for a "non-device".
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> ---
>  .../devicetree/bindings/soc/qcom/qcom,crm.yaml     | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a1485db8b7476b0cb0b4e8a41adc8fb4092b731f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml

Filename must match compatible.

> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,crm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. (QTI) CESTA Resource Manager (CRM)
> +
> +maintainers:
> +  - Maulik Shah <maulik.shah@oss.qualcomm.com>
> +
> +description:
> +  Support for communication with the hardened-CRM blocks. A set of SW

What is a hardened-CRM device? How can you harden a block? Are we
talking about steel manufacturing or software security?

> +  client Direct Resource Voters (DRVs) in CRM provides interface to vote
> +  desired power state of resources local to a subsystem.

I still don't get what this device is doing.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8750-disp-crm
> +
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    oneOf:
> +      - description: Specifies the name of the CRM.
> +        items:
> +          - enum:
> +              - disp_crm

Nope, same as compatible so pointless.

> +
> +  reg:
> +    minItems: 2

There is no such syntax. And if you did run it via internal review tool,
that tool would probably tell you that.


> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 6

Nope. Standard bindings rules - we do not have flexible lists. Please
follow writing bindings or any of previous DTS speech slides.

> +    description:
> +      One interrupt for each DRV. The interrupt trips when a message complete/response is
> +      received from the accelerators for the desired power state. Number of interrupts must
> +      match number of DRV blocks.
> +
> +  qcom,sw-drv-ids:

Drop the property. For sure we do not want drivers in the bindings.


> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 6
> +    items:
> +      minimum: 0
> +      maximum: 5
> +    description:
> +      List of SW DRV IDs used within kernel. May contain holes as some DRVs can
> +      be allocated to DSPs / can be spare.
> +
> +required:
> +  - compatible
> +  - label
> +  - reg
> +  - interrupts
> +  - qcom,sw-drv-ids
> +
> +additionalProperties: false
> +
> +examples:
> +  # Example of Display CRM device with SW DRVs

Drop

> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    disp_crm: crm@af21000 {

Drop label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).



> +      compatible = "qcom,sm8750-disp-crm";
> +      label = "disp_crm";
> +      reg = <0x0af21000 0x6000>,
> +            <0x0af29f00 0x100>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
> +      qcom,sw-drv-ids = <0 1 2 3 4 5>;

Pointless property :/

Run this binding via internal review first, because it does not match
expected upstream submission quality and YOU ARE expected to have it
internally reviewed first.

Best regards,
Krzysztof


