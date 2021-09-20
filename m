Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC05E410E0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 02:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhITAwc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Sep 2021 20:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbhITAwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Sep 2021 20:52:31 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B687C061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Sep 2021 17:51:05 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id s69so15011293oie.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Sep 2021 17:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z6iIwGZqo8KFJn+K0TUvoAOeMuSy61NsAakI2Z/4K8w=;
        b=KvM71N8Dw/gWNX5mKKyv6VZ1nY6dwecJVnMPR5dWjRm+Y7rkXJrt/JN9cAX2LpM/fv
         k8rzVabTBJ4LJtWma1/vWUhGNkJo6CKcwEQd7UGjEaxHHwl11MboslsmZMn90Ak0V/18
         HIqm7nx8f81940o09Ud0t0epVRtUWvg5iBhUEdzCHcpgTNspdc3GgVndJJhRl8BecDUv
         g0KcsGMDVOEc2BLKEJoM3Qc40jZZ9CQrstBpP/7laf9Cnkua6fsPl0CRVlZkkDp4M6ZR
         kYdPjuQ1Jv6bMH63sWX/Xi5n5FIGGo5gewH8lEAm3VqHWzBIIRiihCkuXza4XNRUKhVG
         70hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z6iIwGZqo8KFJn+K0TUvoAOeMuSy61NsAakI2Z/4K8w=;
        b=3roa6yRsdMS8JtPZjDC710DKM1a0NifVktezqWQmSdWZziZkYTUCF0BQs/KgTbk660
         Q6u8DtYZa4qBC52FA62Wv58MNRc8MKblKL3qhznEE7VHMtLg0sd7q4l4z2E7Vqy0hxDR
         0nynn6lQ2g2pN7uhJx63punkiTaDm4Hu90zLGpEhOtUdm6gbAoTamN7SbnUuqQG5BlyS
         EfMsSDbEerZQa3SQdFZtZMPQnwMAF7LxHPfe93appVfoEpEPJTuiKwDT8w1itOHDFLvC
         /GSv6YqG2fn3e2zX7yLTHaDeIuQ5Bfm4Fhrr8XDbIeTTXJWNfkomixHZekdlNwiCWHJB
         GaBQ==
X-Gm-Message-State: AOAM532TyZdOnrI9T4hnFz3Yo+rpoFFmGK3iwU4CI6mSaUSZTWeVR6la
        qtLHgsbMNB+4OS93fBmsaKvksw==
X-Google-Smtp-Source: ABdhPJxSkAodcmoM2Y66MDLBhy46TWQ5FzcF1TGxUX/DMbwy5Gc50Wxz/JTxTF7zP5+eDbTsC1414g==
X-Received: by 2002:aca:2218:: with SMTP id b24mr5017407oic.55.1632099064731;
        Sun, 19 Sep 2021 17:51:04 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i1sm3182453ooo.15.2021.09.19.17.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 17:51:04 -0700 (PDT)
Date:   Sun, 19 Sep 2021 19:51:02 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jami.kettunen@somainline.org,
        paul.bouchara@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, jeffrey.l.hugo@gmail.com,
        robh@kernel.org
Subject: Re: [PATCH v7 2/6] dt-bindings: avs: cpr: Convert binding to YAML
 schema
Message-ID: <YUfa9jF+F3ght1lN@builder.lan>
References: <20210901155735.629282-1-angelogioacchino.delregno@somainline.org>
 <20210901155735.629282-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901155735.629282-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Sep 10:57 CDT 2021, AngeloGioacchino Del Regno wrote:

> Convert the qcom,cpr.txt document to YAML schema and place it in the
> appropriate directory, since this driver was moved from power/avs
> to soc/qcom, but forgets to move the documentation.
> 
> Fixes: a7305e684fcf ("PM: AVS: qcom-cpr: Move the driver to the qcom specific drivers")

I don't see it to be a requirement that the DT binding structure follows
the Linux implementation structure, so I think it's appropriate to keep
it in power/avs and I don't think it deserves a fixes.


I would like to merge this series, could you please address Rob's
concerns on the binding?


PS. If you did the YAML-ification as the last step I would have merged
the other 5 patches...

Thanks,
Bjorn

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/power/avs/qcom,cpr.txt           | 131 +-------------
>  .../bindings/soc/qcom/qcom,cpr.yaml           | 167 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 169 insertions(+), 131 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> index ab0d5ebbad4e..2ada8cd08949 100644
> --- a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> +++ b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> @@ -1,130 +1 @@
> -QCOM CPR (Core Power Reduction)
> -
> -CPR (Core Power Reduction) is a technology to reduce core power on a CPU
> -or other device. Each OPP of a device corresponds to a "corner" that has
> -a range of valid voltages for a particular frequency. While the device is
> -running at a particular frequency, CPR monitors dynamic factors such as
> -temperature, etc. and suggests adjustments to the voltage to save power
> -and meet silicon characteristic requirements.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <string>
> -	Definition: should be "qcom,qcs404-cpr", "qcom,cpr" for qcs404
> -
> -- reg:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: base address and size of the rbcpr register region
> -
> -- interrupts:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: should specify the CPR interrupt
> -
> -- clocks:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: phandle to the reference clock
> -
> -- clock-names:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "ref"
> -
> -- vdd-apc-supply:
> -	Usage: required
> -	Value type: <phandle>
> -	Definition: phandle to the vdd-apc-supply regulator
> -
> -- #power-domain-cells:
> -	Usage: required
> -	Value type: <u32>
> -	Definition: should be 0
> -
> -- operating-points-v2:
> -	Usage: required
> -	Value type: <phandle>
> -	Definition: A phandle to the OPP table containing the
> -		    performance states supported by the CPR
> -		    power domain
> -
> -- acc-syscon:
> -	Usage: optional
> -	Value type: <phandle>
> -	Definition: phandle to syscon for writing ACC settings
> -
> -- nvmem-cells:
> -	Usage: required
> -	Value type: <phandle>
> -	Definition: phandle to nvmem cells containing the data
> -		    that makes up a fuse corner, for each fuse corner.
> -		    As well as the CPR fuse revision.
> -
> -- nvmem-cell-names:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: should be "cpr_quotient_offset1", "cpr_quotient_offset2",
> -		    "cpr_quotient_offset3", "cpr_init_voltage1",
> -		    "cpr_init_voltage2", "cpr_init_voltage3", "cpr_quotient1",
> -		    "cpr_quotient2", "cpr_quotient3", "cpr_ring_osc1",
> -		    "cpr_ring_osc2", "cpr_ring_osc3", "cpr_fuse_revision"
> -		    for qcs404.
> -
> -Example:
> -
> -	cpr_opp_table: cpr-opp-table {
> -		compatible = "operating-points-v2-qcom-level";
> -
> -		cpr_opp1: opp1 {
> -			opp-level = <1>;
> -			qcom,opp-fuse-level = <1>;
> -		};
> -		cpr_opp2: opp2 {
> -			opp-level = <2>;
> -			qcom,opp-fuse-level = <2>;
> -		};
> -		cpr_opp3: opp3 {
> -			opp-level = <3>;
> -			qcom,opp-fuse-level = <3>;
> -		};
> -	};
> -
> -	power-controller@b018000 {
> -		compatible = "qcom,qcs404-cpr", "qcom,cpr";
> -		reg = <0x0b018000 0x1000>;
> -		interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
> -		clocks = <&xo_board>;
> -		clock-names = "ref";
> -		vdd-apc-supply = <&pms405_s3>;
> -		#power-domain-cells = <0>;
> -		operating-points-v2 = <&cpr_opp_table>;
> -		acc-syscon = <&tcsr>;
> -
> -		nvmem-cells = <&cpr_efuse_quot_offset1>,
> -			<&cpr_efuse_quot_offset2>,
> -			<&cpr_efuse_quot_offset3>,
> -			<&cpr_efuse_init_voltage1>,
> -			<&cpr_efuse_init_voltage2>,
> -			<&cpr_efuse_init_voltage3>,
> -			<&cpr_efuse_quot1>,
> -			<&cpr_efuse_quot2>,
> -			<&cpr_efuse_quot3>,
> -			<&cpr_efuse_ring1>,
> -			<&cpr_efuse_ring2>,
> -			<&cpr_efuse_ring3>,
> -			<&cpr_efuse_revision>;
> -		nvmem-cell-names = "cpr_quotient_offset1",
> -			"cpr_quotient_offset2",
> -			"cpr_quotient_offset3",
> -			"cpr_init_voltage1",
> -			"cpr_init_voltage2",
> -			"cpr_init_voltage3",
> -			"cpr_quotient1",
> -			"cpr_quotient2",
> -			"cpr_quotient3",
> -			"cpr_ring_osc1",
> -			"cpr_ring_osc2",
> -			"cpr_ring_osc3",
> -			"cpr_fuse_revision";
> -	};
> +This file has been moved to ../../soc/qcom/qcom,cpr.yaml
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
> new file mode 100644
> index 000000000000..20f65427c762
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,cpr.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Core Power Reduction (CPR)
> +
> +description: |
> +  CPR (Core Power Reduction) is a technology to reduce core power on a CPU
> +  or other device. Each OPP of a device corresponds to a "corner" that has
> +  a range of valid voltages for a particular frequency. While the device is
> +  running at a particular frequency, CPR monitors dynamic factors such as
> +  temperature, etc. and suggests adjustments to the voltage to save power
> +  and meet silicon characteristic requirements.
> +
> +maintainers:
> +  - Niklas Cassel <nks@flawful.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,qcs404-cpr
> +      - const: qcom,cpr
> +
> +  reg:
> +    description: Base address and size of the RBCPR register region
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +
> +  clocks:
> +    items:
> +      - description: CPR reference clock
> +
> +  vdd-apc-supply:
> +    description: Autonomous Phase Control (APC) power supply
> +
> +  '#power-domain-cells':
> +    const: 0
> +
> +  acc-syscon:
> +    description: phandle to syscon for writing ACC settings
> +
> +  nvmem-cells:
> +    minItems: 9
> +    maxItems: 32
> +    description: Cells containing the fuse corners and revision data
> +
> +  nvmem-cell-names:
> +    minItems: 9
> +    maxItems: 32
> +
> +  operating-points-v2: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-names
> +  - clocks
> +  - vdd-apc-supply
> +  - "#power-domain-cells"
> +  - nvmem-cells
> +  - nvmem-cell-names
> +  - operating-points-v2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    cpus {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cpu@100 {
> +            compatible = "arm,cortex-a53";
> +            device_type = "cpu";
> +            reg = <0x100>;
> +            operating-points-v2 = <&cpu_opp_table>;
> +            power-domains = <&cpr>;
> +            power-domain-names = "cpr";
> +        };
> +    };
> +
> +    cpu_opp_table: opp-table-cpu {
> +        compatible = "operating-points-v2-kryo-cpu";
> +        opp-shared;
> +
> +        opp-1094400000 {
> +            opp-hz = /bits/ 64 <1094400000>;
> +            required-opps = <&cpr_opp1>;
> +        };
> +        opp-1248000000 {
> +            opp-hz = /bits/ 64 <1248000000>;
> +            required-opps = <&cpr_opp2>;
> +        };
> +        opp-1401600000 {
> +            opp-hz = /bits/ 64 <1401600000>;
> +            required-opps = <&cpr_opp3>;
> +        };
> +    };
> +
> +    cpr_opp_table: opp-table-cpr {
> +        compatible = "operating-points-v2-qcom-level";
> +
> +        cpr_opp1: opp1 {
> +            opp-level = <1>;
> +            qcom,opp-fuse-level = <1>;
> +        };
> +        cpr_opp2: opp2 {
> +            opp-level = <2>;
> +            qcom,opp-fuse-level = <2>;
> +        };
> +        cpr_opp3: opp3 {
> +            opp-level = <3>;
> +            qcom,opp-fuse-level = <3>;
> +        };
> +    };
> +
> +    power-controller@b018000 {
> +        compatible = "qcom,qcs404-cpr", "qcom,cpr";
> +        reg = <0x0b018000 0x1000>;
> +        interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&xo_board>;
> +        clock-names = "ref";
> +        vdd-apc-supply = <&pms405_s3>;
> +        #power-domain-cells = <0>;
> +        operating-points-v2 = <&cpr_opp_table>;
> +        acc-syscon = <&tcsr>;
> +
> +        nvmem-cells = <&cpr_efuse_quot_offset1>,
> +                      <&cpr_efuse_quot_offset2>,
> +                      <&cpr_efuse_quot_offset3>,
> +                      <&cpr_efuse_init_voltage1>,
> +                      <&cpr_efuse_init_voltage2>,
> +                      <&cpr_efuse_init_voltage3>,
> +                      <&cpr_efuse_quot1>,
> +                      <&cpr_efuse_quot2>,
> +                      <&cpr_efuse_quot3>,
> +                      <&cpr_efuse_ring1>,
> +                      <&cpr_efuse_ring2>,
> +                      <&cpr_efuse_ring3>,
> +                      <&cpr_efuse_revision>;
> +        nvmem-cell-names = "cpr0_quotient_offset1",
> +                           "cpr0_quotient_offset2",
> +                           "cpr0_quotient_offset3",
> +                           "cpr0_init_voltage1",
> +                           "cpr0_init_voltage2",
> +                           "cpr0_init_voltage3",
> +                           "cpr0_quotient1",
> +                           "cpr0_quotient2",
> +                           "cpr0_quotient3",
> +                           "cpr0_ring_osc1",
> +                           "cpr0_ring_osc2",
> +                           "cpr0_ring_osc3",
> +                           "cpr_fuse_revision";
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f58dad1a1922..90f1db301fae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15490,7 +15490,7 @@ M:	Niklas Cassel <nks@flawful.org>
>  L:	linux-pm@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> +F:	Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
>  F:	drivers/soc/qcom/cpr.c
>  
>  QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
> -- 
> 2.32.0
> 
