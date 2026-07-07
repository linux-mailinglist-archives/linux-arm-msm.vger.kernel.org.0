Return-Path: <linux-arm-msm+bounces-117138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kl+7KSaXTGrxmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:05:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E224717C21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:05:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Yzls6/s5";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117138-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117138-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 256D63005152
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDBE387596;
	Tue,  7 Jul 2026 06:01:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D78420892;
	Tue,  7 Jul 2026 06:01:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404107; cv=none; b=iZaCgHATwQ66A13f/aq89Wm4iG3TVJECHFU1b+SWQi2Fh6DO1WPFrSg71ghy9BFHNwOTGlyweT+eGjeot2JQDsKFimcqlAMtwk7Awz/ezY+kEvcYaAIq357MBR7xGGJAc/Pd/q8+WFb7Uwcbz6fQ/LLxNSRJVOd61gOVvjUwxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404107; c=relaxed/simple;
	bh=XlJmG73C0YHM5bgOagrmh/05qHGhVAiyd+QUMQQkBZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAT7sEoULJPpP2JLtjfwcpOwBWG3i9aI02uCDKULjZCVHWaEMlX6Nw5QUrm0J/Szq9l+/ChLVj37P9TNx/eg9Iqz88MWm9lKSKxoMJPoJ4FNjb6quY56t1T4EEUTRuG6Xdr6UXJwt7Pu0itkxXi+VRLo9MxUrCPil0JqEEe/HGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yzls6/s5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7541F000E9;
	Tue,  7 Jul 2026 06:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783404104;
	bh=h+YSsQmbdRzPNOq2XDh4gASM3soRQc0edbTNTFIaXR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yzls6/s5XHwLgzUgteVrW791rVksMW4b9lgsRRPSUaNjXnN8ptaX9dXrJsgt2dnDC
	 bP0FUoN2bRoliUUck3KQMlubauQseOfDj2K+CzEHRIVhWHCI9JhWZ31rFEgJcQSbyh
	 +dq2nVxDlSppOs2WQFUOxDT4fXPlUM7yEXiBnxNqwPmSH+41rEZlXWg8DfFJr+unLT
	 aQtMF2WHSnbU6zX+GBPCOuBQ3ogYGvasVWmmN0494A/zOS7zRCRS2jHK+y+yOPM4jd
	 6lGdr5lb7+trVqQs/UyL17DBXGYVnzv95XV4CtJEPOw+r1ZZ4UePhrpnVoHeSyyRkh
	 s1D8llpRQ4aYw==
Date: Tue, 7 Jul 2026 08:01:34 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: PCI: qcom: Document the Shikra PCIe
 Controller
Message-ID: <hf6szamduxopeuvkjkxxteqauirsgfq36pih7go2wf25o4zmv4@vhmhe3gyzgo5>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:sushrut.trivedi@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117138-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,devicetree.org:url,vhmhe3gyzgo5:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E224717C21

On Wed, Jul 01, 2026 at 12:32:44AM +0530, Sushrut Shree Trivedi wrote:
> Add a dedicated schema for the PCIe controller found on the Shikra
> platform.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
>  1 file changed, 211 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
> new file mode 100644
> index 000000000000..f9d1dba9dd2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
> @@ -0,0 +1,211 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/qcom,shikra-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Shikra PCI Express Root Complex
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description:
> +  Qualcomm Shikra SoC (and compatible) PCIe root complex controller is based on

s/PCIe root complex controller/PCIe Root Complex

> +  the Synopsys DesignWare PCIe IP.
> +
> +properties:
> +  compatible:
> +    const: qcom,shikra-pcie
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

MHI is not optional.

> +
> +  clocks:
> +    minItems: 7
> +    maxItems: 9
> +
> +  clock-names:
> +    minItems: 7
> +    items:
> +      - const: aux # Auxiliary clock
> +      - const: cfg # Configuration clock
> +      - const: bus_master # Master AXI clock
> +      - const: bus_slave # Slave AXI clock
> +      - const: slave_q2a # Slave Q2A clock
> +      - const: ddrss_memnoc_pcie # PCIe SF MEMNOC clock
> +      - const: tile # PCIe tile SYS NoC clock
> +      - const: qmip_pcie_ahb # QMIP PCIe AHB clock

Why optional clocks?

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

Same here, why global interrupt is optional?

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

Same here.

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
> +    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
> +    #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>

What are these includes for?

> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +

Get rid of 'soc' node.

> +        pcie@45e8000 {
> +          device_type = "pci";
> +          compatible = "qcom,shikra-pcie";
> +          reg = <0x0 0x045e8000 0x0 0x3000>,
> +                <0x0 0x60000000 0x0 0xf1d>,
> +                <0x0 0x60000f20 0x0 0xa8>,
> +                <0x0 0x60001000 0x0 0x1000>,
> +                <0x0 0x60100000 0x0 0x100000>,
> +                <0x0 0x045eb000 0x0 0x1000>;
> +          reg-names = "parf",
> +                      "dbi",
> +                      "elbi",
> +                      "atu",
> +                      "config",
> +                      "mhi";
> +          #address-cells = <3>;
> +          #size-cells = <2>;
> +          ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
> +                   <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>,
> +                   <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x0000000>;
> +          bus-range = <0x00 0xff>;
> +
> +          linux,pci-domain = <0>;
> +          num-lanes = <1>;
> +
> +          interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
> +          interrupt-names = "msi0",
> +                            "msi1",
> +                            "msi2",
> +                            "msi3",
> +                            "msi4",
> +                            "msi5",
> +                            "msi6",
> +                            "msi7",
> +                            "global";
> +
> +          interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
> +                          <0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
> +                          <0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
> +                          <0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-map-mask = <0 0 0 0x7>;
> +          #interrupt-cells = <1>;
> +
> +          clocks = <&gcc GCC_PCIE_AUX_CLK>,
> +                   <&gcc GCC_PCIE_CFG_AHB_CLK>,
> +                   <&gcc GCC_PCIE_MSTR_AXI_CLK>,
> +                   <&gcc GCC_PCIE_SLV_AXI_CLK>,
> +                   <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
> +                   <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
> +                   <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>,
> +                   <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>;
> +          clock-names = "aux",
> +                        "cfg",
> +                        "bus_master",
> +                        "bus_slave",
> +                        "slave_q2a",
> +                        "ddrss_memnoc_pcie",
> +                        "tile",
> +                        "qmip_pcie_ahb";
> +
> +          assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
> +          assigned-clock-rates = <19200000>;
> +
> +          interconnects = <&system_noc MASTER_PCIE2_0 RPM_ALWAYS_TAG
> +                          &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +                          <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +                          &config_noc SLAVE_PCIE2_0 RPM_ACTIVE_TAG>;
> +
> +          interconnect-names = "pcie-mem",
> +                               "cpu-pcie";
> +
> +          iommu-map = <0x0 &apps_smmu 0x800 0x1>,
> +                      <0x100 &apps_smmu 0x801 0x1>;
> +
> +          resets = <&gcc GCC_PCIE_BCR>;
> +          reset-names = "pci";
> +
> +          power-domains = <&gcc GCC_PCIE_GDSC>;
> +
> +          max-link-speed = <2>;

You don't need 'max-link-speed' unless you want to limit the link speed.

> +
> +          operating-points-v2 = <&pcie_opp_table>;
> +
> +          status = "disabled";
> +

No, you should not disable the example.

> +          pcie_opp_table: opp-table {
> +                  compatible = "operating-points-v2";
> +
> +                  /* GEN 1 x1 */
> +                  opp-2500000 {
> +                          opp-hz = /bits/ 64 <2500000>;
> +                          required-opps = <&rpmpd_opp_nom>;

Are you sure that the power domain need to be in NOM for 2.5 GT/s?

> +                          opp-peak-kBps = <250000 1>;
> +                          opp-level = <1>;
> +                  };
> +
> +                  /* GEN 2 x1 */
> +                  opp-5000000 {
> +                          opp-hz = /bits/ 64 <5000000>;
> +                          required-opps = <&rpmpd_opp_nom>;

Same here.

> +                          opp-peak-kBps = <500000 1>;
> +                          opp-level = <2>;
> +                  };
> +          };

Odd indent.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

