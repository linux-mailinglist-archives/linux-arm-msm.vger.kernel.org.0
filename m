Return-Path: <linux-arm-msm+bounces-34306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C999C73D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55940283FBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AE9158DD8;
	Mon, 14 Oct 2024 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+2piiYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72916F831
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902121; cv=none; b=F/aP/RTdS5JCCTcZ87uzKmjmS+3R5EBOGiEvlXnWoIToGVrcdYHTKD2Irw2JXsqGBxs+RXZkrhLf0ZDxxHGXgQvFa/EZTipFpKPQYz3s0yL0e6bXQmehM5xAM7u+94NVeROk7ZakeyCMHrYwe6AyLxNqJo2NXU3TH8hDztevjSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902121; c=relaxed/simple;
	bh=uLzUr/OYSweUzZbMQhpPpN/1yh9nzjdqPTorbNBqYIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OS+Ft8EGaKPfDPc30J7NNEswmntZO4YsEcskb9JAJ8aPMOoH511tEKW7VBA60xTSBTlKo6+Z+UpYQ+Ek9WiDyWu9pMzxVxC7hiB7zNmW/my/bQWNcwKZLNB5QohbpIuwU1UU2zjtyVIbdiRISfP62S+ywcAN1YzueU0oyNqcjeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+2piiYO; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so10578641fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728902117; x=1729506917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwiTvc3k4z7ze8QDOpmIN76elr7IUSskVb1QCKPSFrQ=;
        b=Z+2piiYONZfxZvxZ+Qph41Yz6iunicKU+xEPONMvcJSlMVVIHnTlCm0CVbN3J69NrV
         oRCTTVEn5+656CzvURzrZ10GUVn8GC8J/BUwndkFNEUHc7/qhDzzk8aoXFaqehyeANBQ
         P5p5ZjgRgdoKby/E5D0VRs+DBTAuZkHq/qSEmoBi9DDMTSa8UXkTNWtQzj31byc+ZMcx
         NclotYkE00zaSfhJTpCQGUIOpQjLrKdxRUb3radrT1+2H1Cr07Hdo6UiZdCil8Zlwa0b
         +dZ88LEV5V+eNCGHSlnk47QyDlFRs2lHG8siUXCAeqV6+noiU+L2jOq7OPwAIUKw8QCR
         eTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902117; x=1729506917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwiTvc3k4z7ze8QDOpmIN76elr7IUSskVb1QCKPSFrQ=;
        b=sbpB6UcCLzqQX9v0zv6L6XauwvikYRB0E6+MAmj31Fc9vbTmCQzllVMNBktDwzeurG
         jqlui0RSN/vhUVb01hJKec74aLNTI4al3QZGsh7Utk0aZJGvru/CxbLvOjCTVk4F1zbS
         EkUywUHkuXjj5b1svqyQ+UrmH7iOfdoiNDLPoBxsvQBzKbEUJBGLviH58e4UcHGOStf8
         5tr0bCihcTbRmum+tjtNaIinbCyI9pflupZkNoE6ssYomSp/IZYUNtWcH3kbcirOMiWD
         K/1crWruN7CHgM1FnzBxY8aRuR8YzqFjc02/OzKnMIXWkgxfylyI+hoIeIwELTcZf5D0
         sGtA==
X-Forwarded-Encrypted: i=1; AJvYcCWMuZeLo56gkTEw8uLuMwVJSzLjZYKzots5jkGxzOTy+8M5g4r8HUIWbNDc6Yjx3QCNKjQ0vXVMYuhxAo4L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2T51zf8Vgz7xDoOkRVIA01tDq4kmC6fLGiBR59BHNW4FZOKuL
	tLA2G4NO09cSIP6Fxj5a/4yndouWeBUjDv4pUhP8XK0X0sxqnJLz3WVzDWkIHVk=
X-Google-Smtp-Source: AGHT+IEp32duwxNDq+fOBsjQ4glT0gNla4rr/hLxnk78h2EepUI2MxzR/89ssip3vyLXXKoTMTA39Q==
X-Received: by 2002:a05:651c:2208:b0:2fb:5786:2518 with SMTP id 38308e7fff4ca-2fb578628famr6342331fa.39.1728902117139;
        Mon, 14 Oct 2024 03:35:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5328feb2sm2454931fa.78.2024.10.14.03.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:35:15 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:35:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: display/msm: Add QCS615 MDSS & DPU
Message-ID: <cq2qg5womfgrp422s3epsobad7lzhvawjnepmj6wsw2rzemarc@75jq4exnyqhn>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-5-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-5-4efa191dbdd4@quicinc.com>

On Mon, Oct 14, 2024 at 05:47:31PM +0800, fangez via B4 Relay wrote:
> From: lliu6 <quic_lliu6@quicinc.com>
> 
> Add bindings for the display hardware on QCS615.
> 
> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 117 +++++++++
>  .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 278 +++++++++++++++++++++
>  2 files changed, 395 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..35339092cb4f905541a7f70f42166bd0b0b7dee7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,qcs615-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS615 Display DPU
> +
> +maintainers:
> +  - lliu6 <quic_lliu6@quicinc.com>

No, you are not. Please at least list Abhinav and me.

> +
> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-dpu
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display ahb clock
> +      - description: Display hf axi clock
> +      - description: Display core clock
> +      - description: Display vsync clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +      - const: vsync
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,qcs615-dispcc.h>

I can not pick this up, these headers are not present in the msm-next
tree. Please use ephemeral nodes instead.

> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-controller@ae01000 {
> +        compatible = "qcom,qcs615-dpu";
> +        reg = <0x0ae01000 0x8f000>,
> +              <0x0aeb0000 0x2008>;
> +        reg-names = "mdp", "vbif";
> +
> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +        clock-names = "iface", "bus", "lut" "core", "vsync";
> +
> +        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +        assigned-clock-rates = <19200000>;
> +
> +        operating-points-v2 = <&mdp_opp_table>;
> +
> +        interrupt-parent = <&mdss>;
> +        interrupts = <0>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +	        dpu_intf0_out: endpoint {
> +		};
> +	    };

Indentation is definitely wrong.

> +
> +            port@1 {
> +		reg = <1>;
> +		dpu_intf1_out: endpoint {
> +		    remote-endpoint = <&mdss_dsi0_in>;
> +		};
> +	    };
> +
> +        };
> +
> +        mdp_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-375000000 {
> +                opp-hz = /bits/ 64 <375000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-500000000 {
> +                opp-hz = /bits/ 64 <500000000>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-575000000 {
> +                opp-hz = /bits/ 64 <575000000>;
> +                required-opps = <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-650000000 {
> +                opp-hz = /bits/ 64 <650000000>;
> +                required-opps = <&rpmhpd_opp_turbo_l1>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fdad15c358892306dcb2c1b78319934c504cfc2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml
> @@ -0,0 +1,278 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,qcs615-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS615 Display MDSS
> +
> +maintainers:
> +  - lliu6 <quic_lliu6@quicinc.com>
> +
> +description:
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for QCS615 target.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,qcs615-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: nrt_bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: qcom,qcs615-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        contains:
> +          const: qcom,qcs615-dp

It is not described anywhere, isn't it?

> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

No empty line

> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs615-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

No empty line

> +    properties:
> +      compatible:
> +        const: qcom,qcs615-dsi-phy-14nm
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>

Same comment, use ephemeral nodes instead of listing the clocks exactly.

> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +        compatible = "qcom,qcs615-mdss";
> +        reg = <0x0ae00000 0x1000>;
> +        reg-names = "mdss";
> +
> +	interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> +			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +			&config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +	interconnect-names = "mdp0-mem", "cpu-cfg";

Wrong indentation. No tabs in yaml files. Did it even compile?

> +
> +        power-domains = <&dispcc MDSS_CORE_GDSC>;
> +
> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        iommus = <&apps_smmu 0x800 0x0>;
> +
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        display-controller@ae01000 {
> +            compatible = "qcom,qcs615-dpu";
> +            reg = <0x0ae01000 0x8f000>,
> +                  <0x0aeb0000 0x2008>;
> +            reg-names = "mdp", "vbif";
> +
> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_DISP_HF_AXI_CLK>,
> +		     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +            clock-names = "iface", "bus", "lut", "core", "vsync";
> +
> +            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +            assigned-clock-rates = <19200000>;
> +
> +            operating-points-v2 = <&mdp_opp_table>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +	            dpu_intf0_out: endpoint {
> +		    };
> +	        };
> +
> +                port@1 {
> +		    reg = <1>;
> +		    dpu_intf1_out: endpoint {
> +		        remote-endpoint = <&mdss_dsi0_in>;
> +		    };
> +	        };
> +
> +            };
> +
> +            mdp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-375000000 {
> +                    opp-hz = /bits/ 64 <375000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-500000000 {
> +                    opp-hz = /bits/ 64 <500000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +
> +                opp-575000000 {
> +                    opp-hz = /bits/ 64 <575000000>;
> +                    required-opps = <&rpmhpd_opp_turbo>;
> +                };
> +
> +                opp-650000000 {
> +                    opp-hz = /bits/ 64 <650000000>;
> +                    required-opps = <&rpmhpd_opp_turbo_l1>;
> +                };
> +            };
> +        };
> +
> +        dsi@ae94000 {
> +            compatible = "qcom,qcs615-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +            reg = <0x0ae94000 0x400>;
> +            reg-names = "dsi_ctrl";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <4>;
> +
> +            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_DISP_HF_AXI_CLK>;
> +            clock-names = "byte",
> +                          "byte_intf",
> +                          "pixel",
> +                          "core",
> +                          "iface",
> +                          "bus";
> +
> +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> +
> +            operating-points-v2 = <&dsi0_opp_table>;
> +
> +            phys = <&mdss_dsi0_phy>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mdss_dsi0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf1_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mdss_dsi0_out: endpoint {
> +                    };
> +                };
> +            };
> +
> +            dsi0_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-164000000 {
> +                    opp-hz = /bits/ 64 <164000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-187500000 {
> +                    opp-hz = /bits/ 64 <187500000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-225000000 {
> +                    opp-hz = /bits/ 64 <225000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-262500000 {
> +                    opp-hz = /bits/ 64 <262500000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +        };
> +
> +        mdss_dsi0_phy: phy@ae94400 {
> +            compatible = "qcom,qcs615-dsi-phy-14nm";
> +            reg = <0x0ae94400 0x100>,
> +                  <0x0ae94500 0x300>,
> +                  <0x0ae94800 0x188>;
> +            reg-names = "dsi_phy",
> +                        "dsi_phy_lane",
> +                        "dsi_pll";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&rpmhcc RPMH_CXO_CLK>;
> +            clock-names = "iface", "ref";
> +            vdds-supply = <&vreg_dsi_phy>;
> +        };
> +    };
> +...
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

