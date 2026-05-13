Return-Path: <linux-arm-msm+bounces-107501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBCVN6oBBWquRQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:56:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EE53BAED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82B9E3011589
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C2F3A9DA3;
	Wed, 13 May 2026 22:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpqbMkkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555025B0BB;
	Wed, 13 May 2026 22:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712995; cv=none; b=ah0raN+pzZEA2XosJqBZzjcEEv1r/uk+ivbZG9Tn762cZI0NXNyiT+QYtSbqDqd7lz1I2OD9zJwSxymd2H0l5tqW+pBHULyZXH82ae1tik5blBU03DXcgzyCzwXKYCCbFEGfa2diG+naiKUicxG8+dfK5QiK+0pNoPE1hO9apFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712995; c=relaxed/simple;
	bh=XnTGPLSBPoYlpDMm/hJJBGwFN9XacJY80lhJMcjbIE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo4tr1JKpp9rGraplxylpq66iuJQ+agjePGXD9p0eyfyN36zTwGcU/Fpw4rCjxrqMTmRMjdRYnM6ZvM9A2Cp+hwPQf16+HSwAyf7JKxMXdEeg5TFUnFWBTLeTRtzAzE0iOR7aBMuOt8RD2S2WjPCyE2coGRzrtlYYPNs8gGl7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpqbMkkS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3563BC19425;
	Wed, 13 May 2026 22:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778712995;
	bh=XnTGPLSBPoYlpDMm/hJJBGwFN9XacJY80lhJMcjbIE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpqbMkkSnVgid3gB9JUgwAlYknXZ1PDnVz3FHtYeJvBQbEn7ZTTsdyjQfQkvaNUI8
	 NC8VYvD+mbUkJazNuI/Wj8hiFHksqsaCA+jefgYxD8rbUS53QE7DLNOZcbdFukTOba
	 lmbQfZNHPvCHzNVc5Qp+eTgqnDgBPo5ox3/StxuTw33wOLnA4lOSdyS/m/TR60/cW9
	 0Bdx8mOH6R+xxsZxUl3F5kk6Y5BqC6ZOcZHmgkOxSc/hoQBHimgiSPioVEYe7LJmSD
	 QObnKHwin3zTr98PZssMqTEGdAoFFGi1KviztpNhhnZ5A3xRHAqqr+XmraLzeSSeUg
	 TdIzTKTsDeoGw==
Date: Wed, 13 May 2026 17:56:32 -0500
From: Rob Herring <robh@kernel.org>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <20260513225632.GB2251300-robh@kernel.org>
References: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
 <20260508-hawi-pcie-v1-1-0c910906f7e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-hawi-pcie-v1-1-0c910906f7e5@oss.qualcomm.com>
X-Rspamd-Queue-Id: 3C3EE53BAED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107501-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,0.0.0.0:email,1c00000:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 01:02:14AM +0000, Matthew Leung wrote:
> Add a dedicated schema for the PCIe controllers found on the Hawi
> platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 188 +++++++++++++++++++++
>  1 file changed, 188 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
> new file mode 100644
> index 000000000000..154bc88e5969
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/qcom,hawi-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hawi PCI Express Root Complex
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Manivannan Sadhasivam <mani@kernel.org>
> +
> +description:
> +  Qualcomm Hawi SoC (and compatible) PCIe root complex controller is based on
> +  the Synopsys DesignWare PCIe IP.
> +
> +properties:
> +  compatible:
> +    const: qcom,hawi-pcie
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

minItems: 6

> +    maxItems: 7
> +
> +  clock-names:
> +    minItems: 6
> +    items:
> +      - const: aux # Auxiliary clock
> +      - const: cfg # Configuration clock
> +      - const: bus_master # Master AXI clock
> +      - const: bus_slave # Slave AXI clock
> +      - const: slave_q2a # Slave Q2A clock
> +      - const: noc_aggr # Aggre NoC PCIe AXI clock
> +      - const: cnoc_sf_axi # Config NoC PCIe0 AXI clock

Move all these description comments to 'description' entries under 
'clocks'. Same comment for 'reg-names'.

> +
> +  interrupts:
> +    minItems: 8
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
> +    minItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: pci # PCIe core reset
> +      - const: link_down # PCIe link down reset

Same comment here.

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
> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pcie@1c00000 {
> +            compatible = "qcom,hawi-pcie";
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
> +            num-lanes = <2>;
> +
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +
> +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> +                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> +            clock-names = "aux",
> +                          "cfg",
> +                          "bus_master",
> +                          "bus_slave",
> +                          "slave_q2a",
> +                          "noc_aggr",
> +                          "cnoc_sf_axi";
> +
> +            dma-coherent;
> +
> +            interrupts = <GIC_ESPI 205 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_ESPI 206 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_ESPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_ESPI 208 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_ESPI 209 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_ESPI 210 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_ESPI 211 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_ESPI 212 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_ESPI 204 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "msi0", "msi1", "msi2", "msi3",
> +                              "msi4", "msi5", "msi6", "msi7", "global";
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0x7>;
> +            interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +                            <0 0 0 2 &intc 0 0 GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +                            <0 0 0 3 &intc 0 0 GIC_ESPI 215 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +                            <0 0 0 4 &intc 0 0 GIC_ESPI 216 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> +
> +            interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +            interconnect-names = "pcie-mem", "cpu-pcie";
> +
> +            iommu-map = <0x0 &apps_smmu 0x1000 0x1>,
> +                        <0x100 &apps_smmu 0x1001 0x1>;
> +
> +            pinctrl-0 = <&pcie0_default_state>;
> +            pinctrl-names = "default";
> +
> +            power-domains = <&gcc GCC_PCIE_0_PHY_GDSC>;
> +
> +            resets = <&gcc GCC_PCIE_0_BCR>,
> +                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> +            reset-names = "pci", "link_down";
> +
> +            msi-map = <0x0 &gic_its 0x1000 0x1>,
> +                      <0x100 &gic_its 0x1001 0x1>;
> +            msi-map-mask = <0xff00>;
> +
> +            pcie@0 {
> +                device_type = "pci";
> +                reg = <0x0 0x0 0x0 0x0 0x0>;
> +                bus-range = <0x01 0xff>;
> +
> +                #address-cells = <3>;
> +                #size-cells = <2>;
> +                ranges;
> +
> +                phys = <&pcie0_phy>;
> +                wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> +                reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
> +            };
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

