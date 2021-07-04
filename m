Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46753BAC17
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 10:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGDIVY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 04:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhGDIVY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 04:21:24 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1061CC061762
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 01:18:49 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id x6so6956360qvx.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXAKzB+7V4rmvBC/YTuwa/Oiqizzoa7oFHywVDj7y7A=;
        b=GqBVXgW5+FT5HETXcgRqZIEW/b8ydTfLKKIpjG8Qt/8/3WCtCpKx5vcXLhW97NRz0j
         k7hDH7RMyhbwaQHLg92ZT+rHvof/EHpMNKDxJS6au9j/SJZl4EscADIkqpoDmjR43wnH
         0Ob2gsoDh73zujUF1yCZ0APweBl5eCogc2aMk3BaMGXi8IXBV0yGZ8cAC0y3Q3HqBnZj
         WLyfDd5G39RQgMHRW4+YtpWyTKce02Ovkj1cYgwry82+t5BOJlK55hqjSkjFIFkLo4Hc
         maYB7brXeS2JzL9rFNcoirRXaR8pzaM77alxLhaOsEhMnvSrvkXvvP9mSReKcM8kcajs
         tE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXAKzB+7V4rmvBC/YTuwa/Oiqizzoa7oFHywVDj7y7A=;
        b=Qy4YQPqE30EK2gw/sfIItq/V2rVsc7shiuufRr6bwAoygdOJgJz06jT2qOP3FPlW6v
         CTQUwpl2gt12qSj1hA6Op4hDPrZi33bXGkhoei2JYiW5cPV2YnN3FzTdYjPcNB7hC75L
         7F5sY0N9mPRDOgkwWCg41Gd1QaKn0nLl0K/n0aWjNRL7yxs30fkmMxAUmltvO0191Bvf
         AToYUAHMkz0JFsmEghYLKcpOx+GIn+7grGhDVk/IzbrWz579M9CkyDbYOlV3mcwx5atM
         xndBUC3xzxZ29vTRzVH0MdV6WKVisVZ7WbC4DXemY4JloHZ+u1kEH6iIHMnV37koNo1g
         afng==
X-Gm-Message-State: AOAM5329BfLSLKeTlWhvW5bYWz/+C3JWp8pM8iwgbNMD6OXWTVLZGb45
        LF4KSkqPSF2IsWjCt8sJL1xzH7EcVF8vtJKJ6+SMeA==
X-Google-Smtp-Source: ABdhPJymH78HodMWsIPx0bB+aeC/012l4d5uautfiEt2xnG6/2Yww7y+oTfU0S31A38VBb6/Uj5go8/8lbKqOdtXe3k=
X-Received: by 2002:ad4:5ca6:: with SMTP id q6mr7727556qvh.23.1625386728044;
 Sun, 04 Jul 2021 01:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210703151835.171313-1-david@ixit.cz>
In-Reply-To: <20210703151835.171313-1-david@ixit.cz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 4 Jul 2021 11:18:36 +0300
Message-ID: <CAA8EJpqo=5JNVPfoB4QAJnYKEMV2PWgJL0=+8MEV7BVzL2ht=g@mail.gmail.com>
Subject: Re: [PATCH] RFC: dt-bindings: drm/msm/gpu: convert to YAML
To:     David Heidelberg <david@ixit.cz>
Cc:     Sharat Masetty <smasetty@codeaurora.org>, masneyb@onstation.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 3 Jul 2021 at 18:19, David Heidelberg <david@ixit.cz> wrote:
>
> This warning cannot be fixed by conversion, since this naming is already used.
> Documentation/devicetree/bindings/display/msm/gpu.example.dt.yaml: gpu@5000000: interconnect-names: ['gfx-mem'] is too short

It is not a problem of the name length. You've declared that
interconnect-names would contain two items (gfx-mem and ocmem), but
add just one.

>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/msm/gpu.txt   | 157 -----------
>  .../devicetree/bindings/display/msm/gpu.yaml  | 256 ++++++++++++++++++
>  2 files changed, 256 insertions(+), 157 deletions(-)
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
> -             "amd,imageon-XYZ.W", "amd,imageon"
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
> -       Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.
> -
> -Example 3xx/4xx:
> -
> -/ {
> -       ...
> -
> -       gpu: adreno@fdb00000 {
> -               compatible = "qcom,adreno-330.2",
> -                            "qcom,adreno";
> -               reg = <0xfdb00000 0x10000>;
> -               reg-names = "kgsl_3d0_reg_memory";
> -               interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> -               interrupt-names = "kgsl_3d0_irq";
> -               clock-names = "core",
> -                             "iface",
> -                             "mem_iface";
> -               clocks = <&mmcc OXILI_GFX3D_CLK>,
> -                        <&mmcc OXILICX_AHB_CLK>,
> -                        <&mmcc OXILICX_AXI_CLK>;
> -               sram = <&gpu_sram>;
> -               power-domains = <&mmcc OXILICX_GDSC>;
> -               operating-points-v2 = <&gpu_opp_table>;
> -               iommus = <&gpu_iommu 0>;
> -               #cooling-cells = <2>;
> -       };
> -
> -       gpu_sram: ocmem@fdd00000 {
> -               compatible = "qcom,msm8974-ocmem";
> -
> -               reg = <0xfdd00000 0x2000>,
> -                     <0xfec00000 0x180000>;
> -               reg-names = "ctrl",
> -                           "mem";
> -
> -               clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> -                        <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> -               clock-names = "core",
> -                             "iface";
> -
> -               #address-cells = <1>;
> -               #size-cells = <1>;
> -
> -               gpu_sram: gpu-sram@0 {
> -                       reg = <0x0 0x100000>;
> -                       ranges = <0 0 0xfec00000 0x100000>;
> -               };
> -       };
> -};
> -
> -Example a6xx (with GMU):
> -
> -/ {
> -       ...
> -
> -       gpu@5000000 {
> -               compatible = "qcom,adreno-630.2", "qcom,adreno";
> -               #stream-id-cells = <16>;
> -
> -               reg = <0x5000000 0x40000>, <0x509e000 0x10>;
> -               reg-names = "kgsl_3d0_reg_memory", "cx_mem";
> -
> -               #cooling-cells = <2>;
> -
> -               /*
> -                * Look ma, no clocks! The GPU clocks and power are
> -                * controlled entirely by the GMU
> -                */
> -
> -               interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> -
> -               iommus = <&adreno_smmu 0>;
> -
> -               operating-points-v2 = <&gpu_opp_table>;
> -
> -               interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
> -               interconnect-names = "gfx-mem";
> -
> -               gpu_opp_table: opp-table {
> -                       compatible = "operating-points-v2";
> -
> -                       opp-430000000 {
> -                               opp-hz = /bits/ 64 <430000000>;
> -                               opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> -                               opp-peak-kBps = <5412000>;
> -                       };
> -
> -                       opp-355000000 {
> -                               opp-hz = /bits/ 64 <355000000>;
> -                               opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> -                               opp-peak-kBps = <3072000>;
> -                       };
> -
> -                       opp-267000000 {
> -                               opp-hz = /bits/ 64 <267000000>;
> -                               opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> -                               opp-peak-kBps = <3072000>;
> -                       };
> -
> -                       opp-180000000 {
> -                               opp-hz = /bits/ 64 <180000000>;
> -                               opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> -                               opp-peak-kBps = <1804000>;
> -                       };
> -               };
> -
> -               qcom,gmu = <&gmu>;
> -
> -               zap-shader {
> -                       memory-region = <&zap_shader_region>;
> -                       firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
> -               };
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> new file mode 100644
> index 000000000000..4315482e0b12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -0,0 +1,256 @@
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
> +description: |
> +  These bindings describe the GPUs
> +
> +properties:
> +  compatible:
> +    anyOf:
> +      - items:
> +          - pattern: '^qcom,adreno-[3-6][0-9][0-9].[0-9]$'
> +          - const: qcom,adreno
> +      - items:
> +          - pattern: '^amd,imageon-200.[0-1]$'
> +          - const: amd,imageon
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    maxItems: 3
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: Physical base address and length of the controller's registers.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 2
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
> +      optional phandle to an interconnect provider. See
> +      ../interconnect/interconnect.txt for details.
> +      Some A3xx and all A4xx platforms will have two paths;
> +      all others will have one path.
> +
> +  interconnect-names:
> +    items:
> +      - const: gfx-mem
> +      - const: ocmem
> +    description: |
> +      the names of the interconnect paths that correspond to
> +      the interconnects property
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
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  zap-shader:
> +    description: |
> +      For a5xx and a6xx devices this node contains a memory-region that
> +      points to reserved memory to store the zap shader that can be used to
> +      help bring the GPU out of secure mode.
> +
> +  "#cooling-cells":
> +    const: 2
> +    description: |
> +      For details, please refer
> +      Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
> +
> +  qcom,gmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      for GMU attached devices a phandle to the GMU device that will
> +      control the power for the GPU
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
> +            pattern: '^qcom,adreno-[3-5][0-9][0-9].[0-9]$'
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GPU Core clock
> +            - description: GPU Interface clock
> +            - description: GPU Memory Interface clock
> +
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: iface
> +            - const: mem_iface
> +      required:
> +        - clocks
> +        - clock-names
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
> +    gpu: adreno@fdb00000 {
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
> 2.30.2
>


-- 
With best wishes
Dmitry
