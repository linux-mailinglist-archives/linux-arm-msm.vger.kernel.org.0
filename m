Return-Path: <linux-arm-msm+bounces-109155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPwwO1WVD2o1NgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 01:29:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9BD5ACB7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 01:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8B2C3010BEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 23:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0289C36683B;
	Thu, 21 May 2026 23:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMfqFDXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0B8358369;
	Thu, 21 May 2026 23:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779406154; cv=none; b=sj3rPy29XqyCaBp8avEYD3jpAhNfp5sLdQWvYX2ZzbDw3vKhGLz/8O9LsmCWfeGxvTmI04AYJ8yWlQZd7yICoOafPvXErVr4hLMJno7ll8MA5whNKft78g5e7bMsy1gJBYfCtj7BbBxmvwae9/rGSy2RUX4qP0KzlgdCKXGK7JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779406154; c=relaxed/simple;
	bh=pYWW3CJI3YpWoRdYXYWtuNIFKB4xFwjURoXMlJJy7ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6XxM1EjmXMIuiVPlzvL768PhApX8LDJ6nuRarIpdUyJbyaQ+CI9teaP0RAQ2MeV6U6phi8buCNKi5LBb97FKzOv5mPc+PzzbGBWfL/XzcF04nNWSZWEQl8LDlE9MEx6oHODcNzk5+xfETiuXsBVBMu/JdG5Mv6giJbK95pUr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMfqFDXi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251C81F000E9;
	Thu, 21 May 2026 23:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779406152;
	bh=x+xI9Ld8AF43KjQU9QwS4fLelxs7Xu3EE5qgLxKO8tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMfqFDXiCxwPha8nF4Di4bSuhlitEUXJy2iw30b7ocDsLoMex/Xb/uH8M++S1RE66
	 YiFL05xG5DSiU/AwkigflLhD/MQii7bROIlxc8tKHfvr0xhwjXdcHiCJsCYu265rM5
	 wxN2D+Wo2D0D4XySJgRxIls5LMa7BnGqxKlBkwrnffgLKwqyf/WCxzZ0zqm89hz+h/
	 YizebCdwIw0x195XkgwGzsItN/blRpcT/2d194SyjRJRXuNCBbksS0KH6dpzaCAX7W
	 3o66N880y7Jd3hbY2msCbA4050ZemDulFergCf7EAVwTehIynkd7yykzpAYEoE4jU1
	 Kp00RWHx8Sc/A==
Date: Thu, 21 May 2026 18:29:09 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
Message-ID: <ag-Tk8xE4OkZpvIZ@baldur>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: AF9BD5ACB7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:35:09AM +0530, Vignesh Viswanathan wrote:
> Add documentation for the CDSP Power Management driver, which handles

Your commit message should not describe an action, it should describe
the problem you're solving.

> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
> Power Mode (LPM) transitions via MPM handshake, and provides virtual
> regulators for the remoteproc driver to control CDSP power rails.
> 

You have a node describing the CDSP (remoteproc) already, but it doesn't
contain all the properties, so you're going to add this sibling node.

Why don't you describe the remoteproc properly instead?

> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,cdsp-power.yaml         | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
> new file mode 100644
> index 000000000000..f0f89fdeba4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,cdsp-power.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CDSP Power Management
> +
> +maintainers:
> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> +
> +description:
> +  The CDSP Power Management driver provides power management services for the
> +  Qualcomm Compute DSP (CDSP) subsystem. It handles Dynamic Clock and Voltage
> +  Scaling (DCVS) requests via SMEM, manages Low Power Mode (LPM) transitions
> +  via MPM handshake, and provides virtual regulators that are consumed by the
> +  CDSP remoteproc driver.
> +
> +properties:
> +  compatible:
> +    const: qcom,cdsp-power
> +
> +  reg:
> +    items:
> +      - description: MPM (Modem Power Manager) register region
> +      - description: RSCC (RSC Configuration) register region
> +
> +  reg-names:
> +    items:
> +      - const: mpm
> +      - const: rscc
> +
> +  interrupts-extended:
> +    items:
> +      - description: LPM (Low Power Mode) interrupt from MPM
> +      - description: DCVS (Dynamic Clock and Voltage Scaling) interrupt from IPCC
> +
> +  interrupt-names:
> +    items:
> +      - const: lpm
> +      - const: dcvs
> +
> +  mboxes:
> +    maxItems: 1
> +    description: IPCC mailbox channel for sending DCVS responses to CDSP
> +
> +  qcom,smem-item:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SMEM item ID used for DCVS communication channel between APSS and CDSP.
> +      This is a platform-specific value that identifies the shared memory region.
> +
> +  vdd-cx-supply:
> +    description:
> +      Phandle to the CX voltage regulator. This is the actual hardware regulator
> +      (e.g., from MP8899 PMIC) that supplies power to the CDSP CX rail.

This isn't the CX supply of the power management block, this is the CX
supply of the remoteproc - so put it there.

> +
> +  vdd-mx-supply:
> +    description:
> +      Phandle to the MX voltage regulator. This is the actual hardware regulator
> +      (e.g., from MP8899 PMIC) that supplies power to the CDSP MX rail. Optional
> +      on boards where MX rail is always-on or not present.
> +
> +  regulators:
> +    type: object
> +    description:
> +      Virtual regulators provided by this driver for consumption by the CDSP
> +      remoteproc driver. These virtual regulators pass through enable/disable
> +      requests to the actual hardware regulators (vdd-cx-supply, vdd-mx-supply).

These regulators doesn't exist in reality, they are only here because
you choose to split the description of your remoteproc implementation in
two.

> +
> +    properties:
> +      cdsp-vdd-cx:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        description: Virtual CX regulator for CDSP
> +        unevaluatedProperties: false
> +
> +      cdsp-vdd-mx:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        description: Virtual MX regulator for CDSP
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts-extended
> +  - interrupt-names
> +  - mboxes
> +  - qcom,smem-item
> +  - vdd-cx-supply
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

It's just an example, when you write bindings drop the 0x0 from base and
size in your reg and this need goes away.

> +
> +        cdsp_power: cdsp-power@4ae000 {
> +            compatible = "qcom,cdsp-power";
> +            reg = <0x0 0x004ae000 0x0 0x1000>,

For when you do this properly, please confirm that this is a dedicated
MPM register region and does not alias with any other nodes.

> +                  <0x0 0x26018018 0x0 0x4>;

No, we don't point reg = <> at a single register.

> +            reg-names = "mpm", "rscc";
> +
> +            interrupts-extended = <&intc GIC_SPI 65 IRQ_TYPE_EDGE_RISING 0>,

0?

> +                                  <&ipcc IPCC_CLIENT_CDSP
> +                                         IPCC_MPROC_SIGNAL_PING
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "lpm", "dcvs";
> +
> +            mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_PING>;
> +
> +            qcom,smem-item = <503>;

Isn't this static for the given remoteproc?

Regards,
Bjorn

> +
> +            vdd-cx-supply = <&ipq9650_s2>;
> +            vdd-mx-supply = <&ipq9650_s4>;
> +
> +            regulators {
> +                cdsp_vdd_cx: cdsp-vdd-cx {
> +                    regulator-name = "cdsp-vdd-cx";
> +                };
> +
> +                cdsp_vdd_mx: cdsp-vdd-mx {
> +                    regulator-name = "cdsp-vdd-mx";
> +                };
> +            };
> +        };
> +    };
> 
> -- 
> 2.43.0
> 

