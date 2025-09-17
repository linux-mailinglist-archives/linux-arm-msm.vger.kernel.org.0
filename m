Return-Path: <linux-arm-msm+bounces-73858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C053B7CC5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64B521881F2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 06:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036BE261B92;
	Wed, 17 Sep 2025 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBG8NRr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADBA81749;
	Wed, 17 Sep 2025 06:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758089565; cv=none; b=MDpBHAO+T0M+OMrZBFoghcy7gEpOaW7hbjanz1NR1ekgz/DFmAlhNj5Zk5sIO0faDWpGRNcg1+TXmf0IE0K7xKgqN80k2iScADji8JKWpX0FtA9kohYBUXXhJ4ibJHM/lahs6OLu/AkBskeCD2G8f4EkUftYXD9gta6f4hCdY4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758089565; c=relaxed/simple;
	bh=udpS6+iQy+p9dZ8y/1+rUWGfwcAIGSK/9mGEtIpNcwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTN4nU36Oiv5GobFJK8YUjA/ucgGPxVF/FahmCgVuSUHXSbOERRdKD3XdqvSwI7bQZkYnQp8E3SODJ9HE/sV7NLZBZyjybAtCIFL3mhgQq/uCFM0mIOrTF3gjCMEdvMVMmfsRcSMTEwdFi8efchdR1j/pyxz17398IR0X25KSws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBG8NRr0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758089564; x=1789625564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=udpS6+iQy+p9dZ8y/1+rUWGfwcAIGSK/9mGEtIpNcwQ=;
  b=GBG8NRr0tVaymvxOcP/iANXVzOXM+k0aQPhMokKEN869HaLQqqWrR8qA
   CR1KKk23sAILnMRZOILZb8ssczNuNiUe/hUpRI0mu5TGZPDF0MPGIH0f2
   ogip+86Ui59sHw9oOikkPDZV9nKIFxZShZNrkStRgMRUdtOmcgybYtdad
   0iwO3cqM+vsoE6l3safE/3+t4xiSK6NMdxU+T1HvE7ikbh9g6gyOn/KOr
   z4IKRizJ3IYZVJn0iD/b3FIvWARS1f44yYie71IyX7NfMiC8q8jtW6b6o
   efdnVQobCQ2oJfyNUMLOQW/+x5oCZ3dFEsxFj5T3lb+QOx5xTOLQTw202
   A==;
X-CSE-ConnectionGUID: HkDddUD2Q1y5a/in9+IPEg==
X-CSE-MsgGUID: gStdk3KaS8WrxQymFlAy0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64019708"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="64019708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 23:12:43 -0700
X-CSE-ConnectionGUID: hNZcGEGhSCW7xK5OGpZE9g==
X-CSE-MsgGUID: CXf3vY/dTtyHWHmpM38U2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="198831405"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 16 Sep 2025 23:12:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D33E795; Wed, 17 Sep 2025 08:12:36 +0200 (CEST)
Date: Wed, 17 Sep 2025 08:12:36 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Jack Pham <quic_jackp@quicinc.com>,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mayank Rana <mayank.rana@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC] dt-bindings: thunderbolt: Add Qualcomm USB4 Host
 Router
Message-ID: <20250917061236.GF2912318@black.igk.intel.com>
References: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>

Hi Konrad,

On Tue, Sep 16, 2025 at 10:06:01PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Several Qualcomm platforms feature an in-house Host Router IP block,
> which enables USB4 and Thunderbolt 3 functionality. It implements the
> common NHI interface, allowing for easier integration with existing
> Thunderbolt driver implementations.
> 
> The Host Router features a microcontroller (with loadable firmware),
> which takes care of detecting and acting upon plug events, initiating
> high-speed link establishment or performing HW power management
> operations.
> 
> Each instance is connected to a single USB3.x host, a PCIe RC and a
> DisplayPort controller through a fitting Protocol Adapter, allowing
> for the tunneling of the respective protocols between the USB4/TBT3
> device and the on-SoC controller.
> 
> Describe the block, as present on the X1E family of SoCs, where it
> implements the USB4v1 standard.

This is nice!

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Hello!
> 
> This is our stab at USB4/Thunderbolt dt-bindings.
> 
> This submission, as stated in the commit message, describes our USB4
> Host Router block, which is roughly the same class of hardware that you
> can find on add-in PCIe cards aimed at x86 machines.
> 
> This specific patch is NOT supposed to be merged, since the bindings
> may still ever so slightly change, as we continue work on the driver
> (i.e. it's still possible that we omitted some resource).
> 
> It is however published early to create grounds for a discussion.
> This is the first bring-up of USB4/TBT3 on a DT platform, so this
> binding is likely going to influence all subsequent submissions. I've
> added various DT and TBT folks to the recipient list to make everyone
> aware of any decisions we settle on.
> 
> Comments very welcome!
> 
> P.S.
> The driver part (which has quite some dependencies) is not yet 100%
> ready to share and will be published at a later date.

Okay, I think it is beter to submit the bindings with the driver changes so
that we can see the big picture.

> ---
>  .../bindings/thunderbolt/qcom,usb4-hr.yaml         | 263 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 264 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml b/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1cf3d083c6129a492010a4b98fea0e8dec9746cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml
> @@ -0,0 +1,263 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thunderbolt/qcom,usb4-hr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm USB4 Host Router
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> +
> +description:
> +  The Qualcomm USB4 Host Router IP block implements the NHI standard
> +  as described in the USB4 specification.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,x1e80100-usb4-hr # USB4v1
> +      - const: qcom,usb4-hr
> +
> +  reg:
> +    maxItems: 17
> +
> +  reg-names:
> +    items:
> +      - const: router
> +      - const: router_config
> +      - const: tmu_config
> +      - const: port_group
> +      - const: sideband
> +      - const: uc_ram
> +      - const: uc_per
> +      - const: uc_mbox
> +      - const: nhi
> +      - const: cfg
> +      - const: debug
> +      - const: usbap_config
> +      - const: pcieap_config
> +      - const: dpap0_aux
> +      - const: dpap0_config
> +      - const: dpap1_aux
> +      - const: dpap1_config

Are these the specific to the host controller? I mean route_config sounds
pretty much like Router Config space and that is available through the USB4
fabric so not sure why this is listed?

Also this does not list the standard Host Interface registers, is that on
purpose?

> +
> +  interrupts:
> +    items:
> +      - description: Combined event interrupt for all three rings
> +      - description: OOB Firmware interrupt

No MSI? If not then at least I suggest to support it in the DT description.

> +
> +  interrupt-names:
> +    items:
> +      - const: ring
> +      - const: fw
> +
> +  clocks:
> +    maxItems: 10
> +
> +  clock-names:
> +    items:
> +      - const: sys
> +      - const: tmu
> +      - const: ahb
> +      - const: axi
> +      - const: master
> +      - const: phy_rx0
> +      - const: phy_rx1
> +      - const: sb
> +      - const: dp0
> +      - const: dp1
> +
> +  resets:
> +    maxItems: 13
> +
> +  reset-names:
> +    items:
> +      - const: core
> +      - const: phy_nocsr
> +      - const: sys
> +      - const: rx0
> +      - const: rx1
> +      - const: usb_pipe
> +      - const: pcie_pipe
> +      - const: tmu
> +      - const: sideband_iface
> +      - const: hia_master
> +      - const: ahb
> +      - const: dp0
> +      - const: dp1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  required-opps:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: usb4
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: usb4-ddr
> +      - const: apps-usb4
> +
> +  mode-switch: true
> +
> +  wakeup-source: true

What about the "power contract"? Are you using the existing we have for
ACPI:

https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers

It was designed DT in mind but I don't think we have DT bindings for it.
This is needed to make sure the driver (Connection Manager) creates the
tunnels before the native protocol stacks get enumerated (e.g during power
transitions).

> +
> +allOf:
> +  - $ref: /schemas/usb/usb-switch.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - phys
> +  - phy-names
> +  - iommus
> +  - interconnects
> +  - interconnect-names
> +  - mode-switch
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb4_router0: usb4-host-router@15600000 {
> +            compatible = "qcom,x1e80100-usb4-hr",
> +                         "qcom,usb4-hr";
> +            reg = <0x0 0x15600000 0x0 0x8000>,
> +                  <0x0 0x15608000 0x0 0x70>,
> +                  <0x0 0x15608070 0x0 0x500>,
> +                  <0x0 0x1560d000 0x0 0x1000>,
> +                  <0x0 0x15612000 0x0 0x1000>,
> +                  <0x0 0x15613000 0x0 0xe000>,
> +                  <0x0 0x15621000 0x0 0x2000>,
> +                  <0x0 0x15623000 0x0 0x2000>,
> +                  <0x0 0x1563f000 0x0 0x40000>,
> +                  <0x0 0x1567f000 0x0 0x1000>,
> +                  <0x0 0x15680000 0x0 0x1000>,
> +                  <0x0 0x15681000 0x0 0x1000>,
> +                  <0x0 0x15682000 0x0 0x1000>,
> +                  <0x0 0x15683000 0x0 0x1000>,
> +                  <0x0 0x15685000 0x0 0x1000>,
> +                  <0x0 0x15686000 0x0 0x1000>,
> +                  <0x0 0x15688000 0x0 0x1000>;
> +            reg-names = "router",
> +                        "router_config",
> +                        "tmu_config",
> +                        "port_group",
> +                        "sideband",
> +                        "uc_ram",
> +                        "uc_per",
> +                        "uc_mbox",
> +                        "nhi",
> +                        "cfg",
> +                        "debug",
> +                        "usbap_config",
> +                        "pcieap_config",
> +                        "dpap0_aux",
> +                        "dpap0_config",
> +                        "dpap1_aux",
> +                        "dpap1_config";
> +
> +            interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "ring",
> +                              "fw";
> +
> +            clocks = <&gcc_usb4_0_sys_clk>,
> +                     <&gcc_usb4_0_tmu_clk>,
> +                     <&gcc_usb4_0_cfg_ahb_clk>,
> +                     <&gcc_aggre_usb4_0_axi_clk>,
> +                     <&gcc_usb4_0_master_clk>,
> +                     <&gcc_usb4_0_phy_rx0_clk>,
> +                     <&gcc_usb4_0_phy_rx1_clk>,
> +                     <&gcc_usb4_0_sb_if_clk>,
> +                     <&gcc_usb4_0_dp0_clk>,
> +                     <&gcc_usb4_0_dp1_clk>;
> +            clock-names = "sys",
> +                          "tmu",
> +                          "ahb",
> +                          "axi",
> +                          "master",
> +                          "phy_rx0",
> +                          "phy_rx1",
> +                          "sb",
> +                          "dp0",
> +                          "dp1";
> +
> +            resets = <&gcc_usb4_0_bcr>,
> +                     <&gcc_usb4phy_phy_prim_bcr>,
> +                     <&gcc_usb4_0_misc_usb4_sys_bcr>,
> +                     <&gcc_usb4_0_misc_rx_clk_0_bcr>,
> +                     <&gcc_usb4_0_misc_rx_clk_1_bcr>,
> +                     <&gcc_usb4_0_misc_usb_pipe_bcr>,
> +                     <&gcc_usb4_0_misc_pcie_pipe_bcr>,
> +                     <&gcc_usb4_0_misc_tmu_bcr>,
> +                     <&gcc_usb4_0_misc_sb_if_bcr>,
> +                     <&gcc_usb4_0_misc_hia_mstr_bcr>,
> +                     <&gcc_usb4_0_misc_ahb_bcr>,
> +                     <&gcc_usb4_0_misc_dp0_max_pclk_bcr>,
> +                     <&gcc_usb4_0_misc_dp1_max_pclk_bcr>;
> +            reset-names = "core",
> +                          "phy_nocsr",
> +                          "sys",
> +                          "rx0",
> +                          "rx1",
> +                          "usb_pipe",
> +                          "pcie_pipe",
> +                          "tmu",
> +                          "sideband_iface",
> +                          "hia_master",
> +                          "ahb",
> +                          "dp0",
> +                          "dp1";
> +
> +            power-domains = <&gcc GCC_USB4_0_GDSC>;
> +
> +            phys = <&usb4_phy>;
> +            phy-names = "usb4";
> +
> +            iommus = <&apps_smmu 0x1440 0x0>;
> +
> +            interconnects = <&icc0 &icc1>,
> +                            <&icc2 &icc3>;
> +            interconnect-names = "usb4-ddr",
> +                                 "apps-usb4";
> +
> +            mode-switch;
> +
> +            port {
> +                usb4_0_mode_in: endpoint {
> +                };

This describes the Downstream Facing Port (e.g USB4 port), right? We have
something similar used in Chromebooks so it would be good if we can make
the bindings close to each other if possible. This allows binding firmware
description to retimers (and also to "fixed/embedded" device routers as
recent changes to the USB4 spec makes possible).

See drivers/thunderbolt/acpi.c::tb_acpi_find_companion().

> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9da37c8dee69de9421d4f70906b4e623a442d171..b607f0a66f953fb1ea72e3405820288850004dfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25428,6 +25428,7 @@ L:	linux-usb@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git
>  F:	Documentation/admin-guide/thunderbolt.rst
> +F:	Documentation/devicetree/bindings/thunderbolt/
>  F:	drivers/thunderbolt/
>  F:	include/linux/thunderbolt.h
>  
> 
> ---
> base-commit: 05af764719214d6568adb55c8749dec295228da8
> change-id: 20250916-topic-qcom_usb4_bindings-3e83e2209e1e
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

