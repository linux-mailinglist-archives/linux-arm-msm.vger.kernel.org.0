Return-Path: <linux-arm-msm+bounces-108939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEuGFzG8DmrBBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:02:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B31995A0974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BF2C304AFDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00433A16B6;
	Thu, 21 May 2026 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAA84W/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6342DA756;
	Thu, 21 May 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350461; cv=none; b=WpsgSa0keODAVhNz1EFpEDrZXmEzhVv2eF8eMjYkve9YPh7SuLXEXdRk8FL1eFvf6LFUUsZqHGKPnUc/QhU/9RGQm3ymcvmDrbZlXEMXfdSwpy2vTwlHQPgNL1ed0TGmmgK5hVlRG52id/ROFsk5vNIM0r84O1Bxm6VQUxFQfcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350461; c=relaxed/simple;
	bh=vbPl15rtfOhooWcrT9SnZ1N6ODfCM/+FdU4PXiecKXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VI0eWWImL4gdwBOEgQ4AkFrLGyIrhIdV7kl6ZeY/jl3/QwKeV1heXM4IzeJCMSEBtGgxxFBUXgk9qxsbhNSaIvzz6VOsdmJv/OXE1rmCsr5qE9WoSD4vdBxgWpW/xxPdobYSlL0aQ9h1du/6VBC6mv+hnz6Xfi4c6DuQrmNrRXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAA84W/S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCBF1F00A3B;
	Thu, 21 May 2026 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779350460;
	bh=+UsBzdH2/PIrb8UCw2P7EYcwf75xRs7kyCmC/XX+L7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FAA84W/ScHb4GV0tLo3Y5LhpIOHrbLGYdKzAOGrG8ljnTgmCcqEusIKJotq423qHx
	 le5wRdTXZct+y0H0CmR75c0v5JxQ3y5dYkwBM7IW2tKhqxvtbDwonqrHq8qh18nBKa
	 SSlZs2Bg8aZJmn7OJPQ3SE0HZMVY7fJ0GR35fz4uTmOj7VFPI44fsj6X3GF2JzxFyD
	 38UjOdt3Q8ktAfbuYCR4tmj96H/LygJ3nWjT2ZIMhsjaQkgWlAS8uP2gaTO0c3OvHW
	 huK0BsQ48wvXP/1dPVeI5O2B50jOn1noJGlGemYjOe1u0aMpx4r2yQ2gy71KoLHoHQ
	 b0xCJpXmK66yQ==
Date: Thu, 21 May 2026 10:00:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,shikra-pas:
 Document Shikra PAS remoteprocs
Message-ID: <20260521-hopeful-eccentric-pig-7fbcde@quoll>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
 <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108939-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,b300000:email]
X-Rspamd-Queue-Id: B31995A0974
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 08:08:05PM +0530, Komal Bajaj wrote:
> +  glink-edge:
> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the remoteproc core.
> +    unevaluatedProperties: false
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the Hexagon core
> +    items:
> +      - description: Stop the remote processor

You again got the warning here. It must be solved, don't send the same.

See thread:
https://lore.kernel.org/all/20260421195836.1547469-1-robh@kernel.org/


> +
> +  qcom,smem-state-names:
> +    description: The names of the state bits used for SMP2P output
> +    items:
> +      - const: stop
> +
> +required:
> +  - compatible
> +  - reg
> +  - memory-region
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,shikra-cdsp-pas
> +            - qcom,shikra-mpss-pas
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 6
> +        interrupt-names:
> +          minItems: 6
> +        memory-region:
> +          maxItems: 1
> +        firmware-name:
> +          maxItems: 1
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,shikra-lpaicp-pas
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 5
> +        interrupt-names:
> +          maxItems: 5
> +        memory-region:
> +          minItems: 2
> +        firmware-name:
> +          minItems: 2

power-domains: false
power-domain-names: false

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> +    #include <dt-bindings/interconnect/qcom,shikra.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    remoteproc@b300000 {
> +        compatible = "qcom,shikra-cdsp-pas";
> +        reg = <0x0b300000 0x100000>;
> +
> +        interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog", "fatal", "ready",
> +                          "handover", "stop-ack", "shutdown-ack";
> +
> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +        clock-names = "xo";
> +
> +        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> +
> +        power-domains = <&rpmpd RPMHPD_CX>;
> +        power-domain-names = "cx";
> +
> +        memory-region = <&cdsp_mem>;
> +
> +        qcom,smem-states = <&cdsp_smp2p_out 0>;
> +        qcom,smem-state-names = "stop";

Missing firmware-name

> +
> +        glink-edge {
> +            interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&apcs_glb 4>;
> +            qcom,remote-pid = <5>;
> +            label = "cdsp";
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

