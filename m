Return-Path: <linux-arm-msm+bounces-109183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GEgMq/9D2qCSAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:54:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF15AFB5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5CB930210C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88573630A3;
	Fri, 22 May 2026 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nbwp13Za"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38343537FE;
	Fri, 22 May 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432609; cv=none; b=ufU2PO89ljlPID5WHehi0VaP0RnFgikgoTlJyzjGyVuaNi2jTeQnv0SEfaPJEsYq/bqC9lOUWYwgcQy9WsuBeoQBp68XVKVS06Sh6PQsMoOAy44NEbxhHjgorHDieYn2+ApjixEqk5ZQkMVFY1TSsNC3hTRyIOM+W7WlL0AXNdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432609; c=relaxed/simple;
	bh=A/DtBXZwaGuynrQY6Kb+1lIpa6Veb5XYG0pT2NF2BDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0/mcVAwPxkMd8IvMZT5I9eKf0Dg0VwhRloRrMS2DVFhc/RiBrb4RsCu22qtEoUQmPljwcIHSzA2DmSseWS/ADHZyf98b5pbgu/EF5fzFolj5JFZWnYvkQl63T08uyFT8XGH0MGztje0knUSZsMiX709l82ZcVg/NQAgoK6RpSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nbwp13Za; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F2B1F000E9;
	Fri, 22 May 2026 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432604;
	bh=YfScx9EoFO8nSle2v2AarnRZDMn7LIOkpHcFtOUg/jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nbwp13Za+JUrIo8e2IXiYsYERqJA6PyfS7u0AvSgnM+gulokorkyvtvs6IwfWgpgQ
	 zFIfjwSonKt/K249h2ACceFdomeuFWbOfjxLz3hdFtOxN6iX+6g1tNBcYDZ40xERnS
	 NLjlOBsu+88EWXkYG4nXpty6j4mB063fcijZC4aBhev3U5opnczsAWnaqVfLSAaqeb
	 YTD0V1/yImHkHHWAXcdQvipG4vGkKY2AnH0u5ysDTEtQmW3Y6YiC5uFeghXJ1Dec4D
	 SvPw/AuFeKkBGC1cQ69zn8kzAwFvY2uDrjLPSkB1XDXA8xYk+fcAthRry9m1lcKAeG
	 +av6BcbjEQDvw==
Date: Fri, 22 May 2026 08:50:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: PCI: qcom: Document the Eliza PCIe
 Controller
Message-ID: <20260522-calm-bug-of-kindness-2dfae2@quoll>
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
 <20260521-eliza-v1-2-97cdbe88389d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-eliza-v1-2-97cdbe88389d@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109183-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1c00000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 30DF15AFB5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 07:35:30PM +0530, Krishna Chaitanya Chundru wrote:
> +description:
> +  Qualcomm ELIZA SoC (and compatible) PCIe root complex controller is based on
> +  the Synopsis DesignWare PCIe IP.
> +
> +properties:
> +  compatible:
> +    const: qcom,pcie-eliza

All new pcie compatibles moved to correct format.

> +
> +  reg:
> +    minItems: 5
> +    maxItems: 6
> +
> +  reg-names:
> +    minItems: 5
> +    items:
> +      - const: parf # Qualcomm specific registers
> +      - const: dbi # DesignWare PCIe registers
> +      - const: elbi # External local bus interface registers
> +      - const: atu # ATU address space
> +      - const: config # PCIe configuration space
> +      - const: mhi # MHI registers
> +
> +  clocks:
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: aux # Auxiliary clock
> +      - const: cfg # Configuration clock
> +      - const: bus_master # Master AXI clock
> +      - const: bus_slave # Slave AXI clock
> +      - const: slave_q2a # Slave Q2A clock
> +      - const: ddrss_sf_tbu # PCIe SF TBU clock
> +      - const: cnoc_sf_axi # Config NoC PCIe1 AXI clock
> +
> +  interrupts:
> +    minItems: 8

This should not be flexible. Neither 'reg'.

> +    maxItems: 9
> +
> +  interrupt-names:
> +    minItems: 8
> +    items:
> +      - const: msi0
> +      - const: msi1
> +      - const: msi2
> +      - const: msi3
> +      - const: msi4
> +      - const: msi5
> +      - const: msi6
> +      - const: msi7
> +      - const: global
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: pci # PCIe core reset
> +      - const: link_down # PCIe link down reset
> +
> +required:
> +  - power-domains
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: qcom,pcie-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,eliza-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pcie@1c00000 {
> +            compatible = "qcom,pcie-eliza";
> +            reg = <0 0x01c00000 0 0x3000>,
> +                  <0 0x40000000 0 0xf1d>,
> +                  <0 0x40000f20 0 0xa8>,
> +                  <0 0x40001000 0 0x1000>,
> +                  <0 0x40100000 0 0x100000>;
> +            reg-names = "parf", "dbi", "elbi", "atu", "config";
> +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
> +
> +            bus-range = <0x00 0xff>;
> +            device_type = "pci";
> +            linux,pci-domain = <0>;
> +            num-lanes = <1>;
> +
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +
> +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> +                     <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> +            clock-names = "aux",
> +                          "cfg",
> +                          "bus_master",
> +                          "bus_slave",
> +                          "slave_q2a",
> +                          "ddrss_sf_tbu",
> +                          "cnoc_sf_axi";
> +
> +            dma-coherent;
> +
> +            interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "msi0", "msi1", "msi2", "msi3",
> +                              "msi4", "msi5", "msi6", "msi7", "global";
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0x7>;
> +            interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +                            <0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +                            <0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +                            <0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> +
> +            interconnects = <&pcie_noc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
> +                            <&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_0 0>;
> +            interconnect-names = "pcie-mem", "cpu-pcie";
> +
> +            iommu-map = <0x0 &apps_smmu 0x1480 0x1>,
> +                        <0x100 &apps_smmu 0x1481 0x1>;
> +
> +            pinctrl-0 = <&pcie0_default_state>;
> +            pinctrl-names = "default";
> +
> +            power-domains = <&gcc GCC_PCIE_0_GDSC>;
> +
> +            resets = <&gcc GCC_PCIE_0_BCR>,
> +                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> +            reset-names = "pci",
> +                          "link_down";
> +

Drop stray blank line.

> +        };
> +    };
> 
> -- 
> 2.34.1
> 

