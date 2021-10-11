Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64844299EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 01:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbhJKXoT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 19:44:19 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36655 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhJKXoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 19:44:19 -0400
Received: by mail-oi1-f175.google.com with SMTP id u69so14288110oie.3;
        Mon, 11 Oct 2021 16:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yx1rSRBykhGl8iK8RYxEC5omr7AmwZN1DW6y//N4PPs=;
        b=pzX+k3prmNgiBQqRb3hVOCFZ46kOwi8WquI4VgBZokIo8b35jZyir9WZJLA2Yd3HJJ
         0idvCKaR8eT0cMH0dqUBKmg6eM79oEWpPRFIgoCWMojmnDOn/69nUeGhUvaBOzdmCAMW
         BdXCf29RarQF9CpO5Sgq31+mCyzBmY02WhqrkEfTweC2bJ2TX9zPZlFUQIF85A6JM+6e
         bu4nYm3M+HZD0T5lNqfwu7qa9wMIt8QWihuMcg9piz0Aqy0vSd1i55PmQJPTaeioekEw
         zMEECof4s15MxUGp5rLT+x80hv3MbV3lk9mxQeWHp0iMKjw8ejLdX9HbC9fN4j+JLW65
         q26w==
X-Gm-Message-State: AOAM531JxXM7jXT5N0hnn4Zcee70ryS77XiDcPCjryKKqUbtLc+JD6Lx
        30h6OUwEW+7OHg30BaM9R2XMqYLKgg==
X-Google-Smtp-Source: ABdhPJw3RY/c3vTaRUmHbDxyGWMGqs+2f2EiKCVsYGtWAaVAMXVOqlSa2X3HwxrLyUohIwMXgk8b3w==
X-Received: by 2002:a05:6808:118c:: with SMTP id j12mr1390571oil.65.1633995737926;
        Mon, 11 Oct 2021 16:42:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o14sm1795522oos.11.2021.10.11.16.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 16:42:17 -0700 (PDT)
Received: (nullmailer pid 1387917 invoked by uid 1000);
        Mon, 11 Oct 2021 23:42:11 -0000
Date:   Mon, 11 Oct 2021 18:42:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~okias/devicetree@lists.sr.ht,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] [v5] dt-bindings: drm/msm/gpu: convert to YAML
Message-ID: <YWTL00UGp3ydXYV+@robh.at.kernel.org>
References: <20211010084245.9091-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211010084245.9091-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 10, 2021 at 10:42:45AM +0200, David Heidelberg wrote:
> Conversion of text binding for Adreno GPU to the YAML format.

Blank line needed.

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2:
>   - added compatbile description from Rob Clark
>   - dropped reg description
>   - reg numbers increased to 3 (since we also have uncommon cx_dbgc)
>   - specified interconnect-names items range
>   - defined zap-shader as an object and added it's properties
>   - enforce 0 clocks for Andreno >= 6xx since it's defined in GMU node
> 
> v3:
>  - fix patterns (add backslash before dot)
>  - add additional clocks
>  - adreno@ -> gpu@
>  - add few const and change enum to anyOf
>  - added clock & clock-names placeholder in non-conditional part
>  (description)
> 
> v4:
>  - clock & clock-names - true,false instead maxItems
>  - impl. #stream-id-cells, nvmem-cell-names, nvmem-cells
>  - dropped requirement on firmware-name in zap_shader
> 
> v5:
>  - maxOtems -> maxItems typo fix
>  .../devicetree/bindings/display/msm/gpu.txt   | 157 ---------
>  .../devicetree/bindings/display/msm/gpu.yaml  | 302 ++++++++++++++++++
>  2 files changed, 302 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/gpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/gpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> deleted file mode 100644
> index 090dcb3fc34d..000000000000
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -Qualcomm adreno/snapdragon GPU
> -
> -Required properties:
> -- compatible: "qcom,adreno-XYZ.W", "qcom,adreno" or
> -	      "amd,imageon-XYZ.W", "amd,imageon"
> -    for example: "qcom,adreno-306.0", "qcom,adreno"
> -  Note that you need to list the less specific "qcom,adreno" (since this
> -  is what the device is matched on), in addition to the more specific
> -  with the chip-id.
> -  If "amd,imageon" is used, there should be no top level msm device.
> -- reg: Physical base address and length of the controller's registers.
> -- interrupts: The interrupt signal from the gpu.
> -- clocks: device clocks (if applicable)
> -  See ../clocks/clock-bindings.txt for details.
> -- clock-names: the following clocks are required by a3xx, a4xx and a5xx
> -  cores:
> -  * "core"
> -  * "iface"
> -  * "mem_iface"
> -  For GMU attached devices the GPU clocks are not used and are not required. The
> -  following devices should not list clocks:
> -   - qcom,adreno-630.2
> -- iommus: optional phandle to an adreno iommu instance
> -- operating-points-v2: optional phandle to the OPP operating points
> -- interconnects: optional phandle to an interconnect provider.  See
> -  ../interconnect/interconnect.txt for details. Some A3xx and all A4xx platforms
> -  will have two paths; all others will have one path.
> -- interconnect-names: The names of the interconnect paths that correspond to the
> -  interconnects property. Values must be gfx-mem and ocmem.
> -- qcom,gmu: For GMU attached devices a phandle to the GMU device that will
> -  control the power for the GPU. Applicable targets:
> -    - qcom,adreno-630.2
> -- zap-shader: For a5xx and a6xx devices this node contains a memory-region that
> -  points to reserved memory to store the zap shader that can be used to help
> -  bring the GPU out of secure mode.
> -- firmware-name: optional property of the 'zap-shader' node, listing the
> -  relative path of the device specific zap firmware.
> -- sram: phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
> -        a4xx Snapdragon SoCs. See
> -        Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> -
> -Optional properties:
> -- #cooling-cells: The value must be 2. For details, please refer
> -	Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.
> -
> -Example 3xx/4xx:
> -
> -/ {
> -	...
> -
> -	gpu: adreno@fdb00000 {
> -		compatible = "qcom,adreno-330.2",
> -		             "qcom,adreno";
> -		reg = <0xfdb00000 0x10000>;
> -		reg-names = "kgsl_3d0_reg_memory";
> -		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names = "kgsl_3d0_irq";
> -		clock-names = "core",
> -		              "iface",
> -		              "mem_iface";
> -		clocks = <&mmcc OXILI_GFX3D_CLK>,
> -		         <&mmcc OXILICX_AHB_CLK>,
> -		         <&mmcc OXILICX_AXI_CLK>;
> -		sram = <&gpu_sram>;
> -		power-domains = <&mmcc OXILICX_GDSC>;
> -		operating-points-v2 = <&gpu_opp_table>;
> -		iommus = <&gpu_iommu 0>;
> -		#cooling-cells = <2>;
> -	};
> -
> -	gpu_sram: ocmem@fdd00000 {
> -		compatible = "qcom,msm8974-ocmem";
> -
> -		reg = <0xfdd00000 0x2000>,
> -		      <0xfec00000 0x180000>;
> -		reg-names = "ctrl",
> -		            "mem";
> -
> -		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> -		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> -		clock-names = "core",
> -		              "iface";
> -
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		gpu_sram: gpu-sram@0 {
> -			reg = <0x0 0x100000>;
> -			ranges = <0 0 0xfec00000 0x100000>;
> -		};
> -	};
> -};
> -
> -Example a6xx (with GMU):
> -
> -/ {
> -	...
> -
> -	gpu@5000000 {
> -		compatible = "qcom,adreno-630.2", "qcom,adreno";
> -		#stream-id-cells = <16>;
> -
> -		reg = <0x5000000 0x40000>, <0x509e000 0x10>;
> -		reg-names = "kgsl_3d0_reg_memory", "cx_mem";
> -
> -		#cooling-cells = <2>;
> -
> -		/*
> -		 * Look ma, no clocks! The GPU clocks and power are
> -		 * controlled entirely by the GMU
> -		 */
> -
> -		interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		iommus = <&adreno_smmu 0>;
> -
> -		operating-points-v2 = <&gpu_opp_table>;
> -
> -		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
> -		interconnect-names = "gfx-mem";
> -
> -		gpu_opp_table: opp-table {
> -			compatible = "operating-points-v2";
> -
> -			opp-430000000 {
> -				opp-hz = /bits/ 64 <430000000>;
> -				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> -				opp-peak-kBps = <5412000>;
> -			};
> -
> -			opp-355000000 {
> -				opp-hz = /bits/ 64 <355000000>;
> -				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> -				opp-peak-kBps = <3072000>;
> -			};
> -
> -			opp-267000000 {
> -				opp-hz = /bits/ 64 <267000000>;
> -				opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> -				opp-peak-kBps = <3072000>;
> -			};
> -
> -			opp-180000000 {
> -				opp-hz = /bits/ 64 <180000000>;
> -				opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> -				opp-peak-kBps = <1804000>;
> -			};
> -		};
> -
> -		qcom,gmu = <&gmu>;
> -
> -		zap-shader {
> -			memory-region = <&zap_shader_region>;
> -			firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> new file mode 100644
> index 000000000000..544e7568a35e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -0,0 +1,302 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: "http://devicetree.org/schemas/display/msm/gpu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Devicetree bindings for the Adreno or Snapdragon GPUs
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: |
> +          The driver is parsing the compat string for Adreno to
> +          figure out the gpu-id and patch level.
> +        items:
> +          - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
> +          - const: qcom,adreno
> +      - description: |
> +          The driver is parsing the compat string for Imageon to
> +          figure out the gpu-id and patch level.
> +        items:
> +          - pattern: '^amd,imageon-200\.[0-1]$'
> +          - const: amd,imageon
> +
> +  clocks: true
> +
> +  clock-names: true
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      enum:
> +        - kgsl_3d0_reg_memory
> +        - cx_mem
> +        - cx_dbgc

Based on the in tree dts files, can't you define the order:

items:
  - const: kgsl_3d0_reg_memory
  - const: cx_mem
  - const: cx_dbgc

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    maxItems: 1
> +
> +  interconnects:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Optional phandle to an interconnect provider. See
> +      ../interconnect/interconnect.txt for details.

Drop generic description.

> +      Some A3xx and all A4xx platforms will have two paths;
> +      all others will have one path.
> +
> +  interconnect-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:
> +        - gfx-mem
> +        - ocmem

Order?

> +    description: |
> +      the names of the interconnect paths that correspond to
> +      the interconnects property

Drop. That's every 'interconnect-names'.

> +
> +  iommus:
> +    maxItems: 1
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
> +    description: |
> +      phandles to one or more reserved on-chip SRAM regions.
> +      phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
> +      a4xx Snapdragon SoCs. See
> +      Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> +
> +  operating-points-v2: true
> +  opp-table: true

type: object

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  zap-shader:
> +    type: object
> +    description: |
> +      For a5xx and a6xx devices this node contains a memory-region that
> +      points to reserved memory to store the zap shader that can be used to
> +      help bring the GPU out of secure mode.
> +    properties:
> +      memory-region:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +
> +      firmware-name:
> +        description: |
> +          Default name of the firmware to load to the remote processor.
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  "#stream-id-cells":

Not documented before. Downstream IOMMU binding??

> +    const: 16
> +
> +  nvmem-cell-names:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    description: efuse registers
> +    maxItems: 1
> +
> +  qcom,gmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      For GMU attached devices a phandle to the GMU device that will
> +      control the power for the GPU.
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]$'
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 7
> +
> +        clock-names:
> +          items:
> +            anyOf:
> +              - const: core
> +                description: GPU Core clock
> +              - const: iface
> +                description: GPU Interface clock
> +              - const: mem
> +                description: GPU Memory clock
> +              - const: mem_iface
> +                description: GPU Memory Interface clock
> +              - const: alt_mem_iface
> +                description: GPU Alternative Memory Interface clock
> +              - const: gfx3d
> +                description: GPU 3D engine clock
> +              - const: rbbmtimer
> +                description: GPU RBBM Timer for Adreno 5xx series
> +          minItems: 2
> +          maxItems: 7
> +
> +      required:
> +        - clocks
> +        - clock-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
> +
> +    then: # Since Adreno 6xx series clocks should be defined in GMU
> +      properties:
> +        clocks: false
> +        clock-names: false
> +
> +examples:
> +  - |
> +
> +    // Example a3xx/4xx:
> +
> +    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu: gpu@fdb00000 {
> +        compatible = "qcom,adreno-330.2", "qcom,adreno";
> +
> +        reg = <0xfdb00000 0x10000>;
> +        reg-names = "kgsl_3d0_reg_memory";
> +
> +        clock-names = "core", "iface", "mem_iface";
> +        clocks = <&mmcc OXILI_GFX3D_CLK>,
> +                 <&mmcc OXILICX_AHB_CLK>,
> +                 <&mmcc OXILICX_AXI_CLK>;
> +
> +        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "kgsl_3d0_irq";
> +
> +        sram = <&gpu_sram>;
> +        power-domains = <&mmcc OXILICX_GDSC>;
> +        operating-points-v2 = <&gpu_opp_table>;
> +        iommus = <&gpu_iommu 0>;
> +        #cooling-cells = <2>;
> +    };
> +
> +    ocmem@fdd00000 {
> +        compatible = "qcom,msm8974-ocmem";
> +
> +        reg = <0xfdd00000 0x2000>,
> +              <0xfec00000 0x180000>;
> +        reg-names = "ctrl", "mem";
> +
> +        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +                 <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +        clock-names = "core", "iface";
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0xfec00000 0x100000>;
> +
> +        gpu_sram: gpu-sram@0 {
> +            reg = <0x0 0x100000>;
> +        };
> +    };
> +  - |
> +
> +    // Example a6xx (with GMU):
> +
> +    #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        zap_shader_region: gpu@8f200000 {
> +            compatible = "shared-dma-pool";
> +            reg = <0x0 0x90b00000 0x0 0xa00000>;
> +            no-map;
> +        };
> +    };
> +
> +    gpu@5000000 {
> +        compatible = "qcom,adreno-630.2", "qcom,adreno";
> +
> +        reg = <0x5000000 0x40000>, <0x509e000 0x10>;
> +        reg-names = "kgsl_3d0_reg_memory", "cx_mem";
> +
> +        #cooling-cells = <2>;
> +
> +        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        iommus = <&adreno_smmu 0>;
> +
> +        operating-points-v2 = <&gpu_opp_table>;
> +
> +        interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
> +        interconnect-names = "gfx-mem";
> +
> +        qcom,gmu = <&gmu>;
> +
> +        gpu_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-430000000 {
> +                opp-hz = /bits/ 64 <430000000>;
> +                opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +                opp-peak-kBps = <5412000>;
> +            };
> +
> +            opp-355000000 {
> +                opp-hz = /bits/ 64 <355000000>;
> +                opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                opp-peak-kBps = <3072000>;
> +            };
> +
> +            opp-267000000 {
> +                opp-hz = /bits/ 64 <267000000>;
> +                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                opp-peak-kBps = <3072000>;
> +            };
> +
> +            opp-180000000 {
> +                opp-hz = /bits/ 64 <180000000>;
> +                opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +                opp-peak-kBps = <1804000>;
> +            };
> +        };
> +
> +        zap-shader {
> +            memory-region = <&zap_shader_region>;
> +            firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
> +        };
> +    };
> -- 
> 2.33.0
> 
> 
