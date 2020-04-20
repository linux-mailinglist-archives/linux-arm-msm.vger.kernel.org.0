Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8901B17D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 22:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgDTU72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 16:59:28 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41840 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgDTU72 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 16:59:28 -0400
Received: by mail-oi1-f193.google.com with SMTP id k9so10103352oia.8;
        Mon, 20 Apr 2020 13:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mOt6/FQvr6N0iPNwh5IPsr5rXWYLyfRTzfakH8R9QAo=;
        b=lsPJ9cNO3kJAwuqSZxJMguTSVmjTbJj6sZK1agcCSsimxpzpFEE/Jbg8TM8Jgsx/8P
         0M59aFVg1/RsSzE8imXHCtt6WfWbvKXJngYFTWtRTnjZxmPwtntfmLfNMhVEQmQaB4Gq
         Zd6L/AKQj0TmGc2vxQZB8vMdoJTzt+mKv9/Tn9e+uAn/TQxomhHFR80aqjS9U9FRBAU6
         zaop4ytPMOooB0kMYoCYwb57oNaX9mA4j+SWHT6CgIylNUJP0lgr0nQZ+wqsAt8ZjeF/
         l4gvnVIatU5bnsilV/HM6iDqcL/183ysvgc1eIot9dFDhyK4YHfxlvaofMOpopkLiaFc
         3+Tw==
X-Gm-Message-State: AGi0PuYSFgvncHobbo41V1h3AolXKsptJDZSiQ6XDUDlqtKv2opaCGcz
        dN25hJgYwRd36s10K0GzCL6ISEs=
X-Google-Smtp-Source: APiQypJcuIt6JYq9J2AP7m/tfgVDCTdO54Fxa86dRVa59HUpp9C1e93ZyFzpOwKllPXlamcdWfcdLQ==
X-Received: by 2002:aca:440a:: with SMTP id r10mr912120oia.139.1587416366372;
        Mon, 20 Apr 2020 13:59:26 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c81sm142374oib.35.2020.04.20.13.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 13:59:25 -0700 (PDT)
Received: (nullmailer pid 18851 invoked by uid 1000);
        Mon, 20 Apr 2020 20:59:24 -0000
Date:   Mon, 20 Apr 2020 15:59:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/8] dt-bindings: mailbox: Add YAML schemas for QCOM
 APCS global block
Message-ID: <20200420205924.GA13256@bogus>
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org>
 <1586832922-29191-2-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586832922-29191-2-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 14, 2020 at 08:25:15AM +0530, Sivaprakash Murugesan wrote:
> Qualcomm APCS global block provides a bunch of generic properties which
> are required in a device tree. Add YAML schema for these properties.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 88 ----------------------
>  .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 88 ++++++++++++++++++++++
>  2 files changed, 88 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> deleted file mode 100644
> index beec612..0000000
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -Binding for the Qualcomm APCS global block
> -==========================================
> -
> -This binding describes the APCS "global" block found in various Qualcomm
> -platforms.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <string>
> -	Definition: must be one of:
> -		    "qcom,msm8916-apcs-kpss-global",
> -		    "qcom,msm8996-apcs-hmss-global"
> -		    "qcom,msm8998-apcs-hmss-global"
> -		    "qcom,qcs404-apcs-apps-global"
> -		    "qcom,sc7180-apss-shared"
> -		    "qcom,sdm845-apss-shared"
> -		    "qcom,sm8150-apss-shared"
> -		    "qcom,ipq8074-apcs-apps-global"
> -
> -- reg:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: must specify the base address and size of the global block
> -
> -- clocks:
> -	Usage: required if #clock-names property is present
> -	Value type: <phandle array>
> -	Definition: phandles to the two parent clocks of the clock driver.
> -
> -- #mbox-cells:
> -	Usage: required
> -	Value type: <u32>
> -	Definition: as described in mailbox.txt, must be 1
> -
> -- #clock-cells:
> -	Usage: optional
> -	Value type: <u32>
> -	Definition: as described in clock.txt, must be 0
> -
> -- clock-names:
> -	Usage: required if the platform data based clock driver needs to
> -	retrieve the parent clock names from device tree.
> -	This will requires two mandatory clocks to be defined.
> -	Value type: <string-array>
> -	Definition: must be "pll" and "aux"
> -
> -= EXAMPLE
> -The following example describes the APCS HMSS found in MSM8996 and part of the
> -GLINK RPM referencing the "rpm_hlos" doorbell therein.
> -
> -	apcs_glb: mailbox@9820000 {
> -		compatible = "qcom,msm8996-apcs-hmss-global";
> -		reg = <0x9820000 0x1000>;
> -
> -		#mbox-cells = <1>;
> -	};
> -
> -	rpm-glink {
> -		compatible = "qcom,glink-rpm";
> -
> -		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> -
> -		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> -
> -		mboxes = <&apcs_glb 0>;
> -		mbox-names = "rpm_hlos";
> -	};
> -
> -Below is another example of the APCS binding on MSM8916 platforms:
> -
> -	apcs: mailbox@b011000 {
> -		compatible = "qcom,msm8916-apcs-kpss-global";
> -		reg = <0xb011000 0x1000>;
> -		#mbox-cells = <1>;
> -		clocks = <&a53pll>;
> -		#clock-cells = <0>;
> -	};
> -
> -Below is another example of the APCS binding on QCS404 platforms:
> -
> -	apcs_glb: mailbox@b011000 {
> -		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
> -		reg = <0x0b011000 0x1000>;
> -		#mbox-cells = <1>;
> -		clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
> -		clock-names = "pll", "aux";
> -		#clock-cells = <0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> new file mode 100644
> index 0000000..b46474b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm APCS global block bindings
> +
> +description:
> +  This binding describes the APCS "global" block found in various Qualcomm
> +  platforms.
> +
> +maintainers:
> +  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq8074-apcs-apps-global
> +      - qcom,msm8916-apcs-kpss-global
> +      - qcom,msm8996-apcs-hmss-global
> +      - qcom,msm8998-apcs-hmss-global
> +      - qcom,qcs404-apcs-apps-global
> +      - qcom,sc7180-apss-shared
> +      - qcom,sdm845-apss-shared
> +      - qcom,sm8150-apss-shared
> +
> +  reg:
> +    description: specifies the base address and size of the global block

Can drop this.

> +    maxItems: 1
> +
> +  clocks:
> +    description: phandles to the parent clocks of the clock driver

Need to define how many and what each one is.

> +
> +  '#mbox-cells':
> +    const: 1
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clock-names:
> +    description:
> +      parent clock names, required if the platform data based clock driver
> +      needs to retrieve the parent clock names from device tree.

Drop.

> +    maxItems: 2

Not needed as 'items' implies this.

> +    items:
> +      - const: pll
> +      - const: aux
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +
> +  # Example apcs with msm8996
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    apcs_glb: mailbox@9820000 {
> +        compatible = "qcom,msm8996-apcs-hmss-global";
> +        reg = <0x9820000 0x1000>;
> +
> +        #mbox-cells = <1>;
> +    };
> +
> +    rpm-glink {
> +        compatible = "qcom,glink-rpm";
> +        interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +        qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +        mboxes = <&apcs_glb 0>;
> +        mbox-names = "rpm_hlos";
> +    };
> +
> +  # Example apcs with qcs404
> +  - |
> +    #define GCC_APSS_AHB_CLK_SRC  1
> +    #define GCC_GPLL0_AO_OUT_MAIN 123
> +    apcs: mailbox@b011000 {
> +        compatible = "qcom,qcs404-apcs-apps-global";
> +        reg = <0x0b011000 0x1000>;
> +        #mbox-cells = <1>;
> +        clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
> +        clock-names = "pll", "aux";
> +        #clock-cells = <0>;
> +    };
> -- 
> 2.7.4
> 
