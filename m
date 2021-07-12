Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA703C5ECD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 17:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235315AbhGLPHX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 11:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbhGLPHW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 11:07:22 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AE9C0613DD;
        Mon, 12 Jul 2021 08:04:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a13so26049729wrf.10;
        Mon, 12 Jul 2021 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P4x9ngsQZ6dM/wC80e125gR+0+UIoP4BLSPS21gx258=;
        b=NuutA/xGl/ivnXIMf6Uo6oDUQDOzG6Xl+BBnd6KqzDMQTjH4UObTk/2++fTFb/Dl8t
         LVIjmSrMglqYyhhroUKCZrTTf67JKxriFkstqVeKlhDU9MMDFez8savOw7Rfa5e9UOx/
         E/uO3Z6qysCLetzaoPs0Da4EZtw1ptFKMuIiqQJyiGOwkfexplTkZsUIixd1KC8W2ESy
         jPH8k3U9ByvD3NLYdJMPTER+EQ9e+fhJnBOZLMkZrKizqEpQuvw3gPj+zYUOwd5JDhWM
         JUtCoevmjtcOKFy7HGy6Z5vDSGYrzL/FIFUgEgqhREf++ehfkxNBhOcQD3y6z8qcbuLa
         CxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4x9ngsQZ6dM/wC80e125gR+0+UIoP4BLSPS21gx258=;
        b=NqnoPqV4Bdc92Hp59JGFmVXSB6w8vmFeenfpncsms7yXwSnXhJ4HEzb3WPvygCRKbc
         jZh4YuWQV/BSkhq3iP8mOXjB3pwfWz2fW59s8X/oTAcVmt8oGxOW2EyOnqFEWVgprJbk
         D7xAnGtv3ecCGabArMH8kgsmJyoZ+zAhDSydTJSA9YEuX9FG4YQbJ0vpWdiFJnYZvFNc
         SVG6hqPRdjYDgB/wjnoN5meoq9IwhyiA7S2H32N5M4AdGHJW423ixdO+3inQthawt7th
         13w/lilH1aJ0d/8d9SQdEG70hnAsnx/Yg/WkGBYx6TajAFBDT3oCoX8l7Rkt3KPqQwOO
         e2Tw==
X-Gm-Message-State: AOAM531Gwvjcxqv/a0TUdfwcuuStzkS0ngAZpxv2aG0YdFRoIc2m9w0i
        t/aec719Jnc6Sei/pU1AzbUNlcN+nOFF944MVe0=
X-Google-Smtp-Source: ABdhPJxvox1OrFAFUF4ib7ALy86XyHdv/10koDZja9voJr42EI0RkGEcT+1TnuUqCjyKoknAwehfWxg7iCrdBzyg/HE=
X-Received: by 2002:adf:eb43:: with SMTP id u3mr60157987wrn.83.1626102271732;
 Mon, 12 Jul 2021 08:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210703151835.171313-1-david@ixit.cz> <20210712145111.GA1896405@robh.at.kernel.org>
In-Reply-To: <20210712145111.GA1896405@robh.at.kernel.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 12 Jul 2021 08:08:36 -0700
Message-ID: <CAF6AEGsEC=0BPwpXMYNcZ=mxFVRYiP8Sjf+dsF_GvAMiG=9hdA@mail.gmail.com>
Subject: Re: [PATCH] RFC: dt-bindings: drm/msm/gpu: convert to YAML
To:     Rob Herring <robh@kernel.org>
Cc:     David Heidelberg <david@ixit.cz>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 12, 2021 at 7:51 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Jul 03, 2021 at 05:18:35PM +0200, David Heidelberg wrote:
> > This warning cannot be fixed by conversion, since this naming is already used.
> > Documentation/devicetree/bindings/display/msm/gpu.example.dt.yaml: gpu@5000000: interconnect-names: ['gfx-mem'] is too short
> >
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >  .../devicetree/bindings/display/msm/gpu.txt   | 157 -----------
> >  .../devicetree/bindings/display/msm/gpu.yaml  | 256 ++++++++++++++++++
> >  2 files changed, 256 insertions(+), 157 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/msm/gpu.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/gpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> > deleted file mode 100644
> > index 090dcb3fc34d..000000000000
> > --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> > +++ /dev/null
> > @@ -1,157 +0,0 @@
> > -Qualcomm adreno/snapdragon GPU
> > -
> > -Required properties:
> > -- compatible: "qcom,adreno-XYZ.W", "qcom,adreno" or
> > -           "amd,imageon-XYZ.W", "amd,imageon"
> > -    for example: "qcom,adreno-306.0", "qcom,adreno"
> > -  Note that you need to list the less specific "qcom,adreno" (since this
> > -  is what the device is matched on), in addition to the more specific
> > -  with the chip-id.
> > -  If "amd,imageon" is used, there should be no top level msm device.
> > -- reg: Physical base address and length of the controller's registers.
> > -- interrupts: The interrupt signal from the gpu.
> > -- clocks: device clocks (if applicable)
> > -  See ../clocks/clock-bindings.txt for details.
> > -- clock-names: the following clocks are required by a3xx, a4xx and a5xx
> > -  cores:
> > -  * "core"
> > -  * "iface"
> > -  * "mem_iface"
> > -  For GMU attached devices the GPU clocks are not used and are not required. The
> > -  following devices should not list clocks:
> > -   - qcom,adreno-630.2
> > -- iommus: optional phandle to an adreno iommu instance
> > -- operating-points-v2: optional phandle to the OPP operating points
> > -- interconnects: optional phandle to an interconnect provider.  See
> > -  ../interconnect/interconnect.txt for details. Some A3xx and all A4xx platforms
> > -  will have two paths; all others will have one path.
> > -- interconnect-names: The names of the interconnect paths that correspond to the
> > -  interconnects property. Values must be gfx-mem and ocmem.
> > -- qcom,gmu: For GMU attached devices a phandle to the GMU device that will
> > -  control the power for the GPU. Applicable targets:
> > -    - qcom,adreno-630.2
> > -- zap-shader: For a5xx and a6xx devices this node contains a memory-region that
> > -  points to reserved memory to store the zap shader that can be used to help
> > -  bring the GPU out of secure mode.
> > -- firmware-name: optional property of the 'zap-shader' node, listing the
> > -  relative path of the device specific zap firmware.
> > -- sram: phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
> > -        a4xx Snapdragon SoCs. See
> > -        Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> > -
> > -Optional properties:
> > -- #cooling-cells: The value must be 2. For details, please refer
> > -     Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.
> > -
> > -Example 3xx/4xx:
> > -
> > -/ {
> > -     ...
> > -
> > -     gpu: adreno@fdb00000 {
> > -             compatible = "qcom,adreno-330.2",
> > -                          "qcom,adreno";
> > -             reg = <0xfdb00000 0x10000>;
> > -             reg-names = "kgsl_3d0_reg_memory";
> > -             interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> > -             interrupt-names = "kgsl_3d0_irq";
> > -             clock-names = "core",
> > -                           "iface",
> > -                           "mem_iface";
> > -             clocks = <&mmcc OXILI_GFX3D_CLK>,
> > -                      <&mmcc OXILICX_AHB_CLK>,
> > -                      <&mmcc OXILICX_AXI_CLK>;
> > -             sram = <&gpu_sram>;
> > -             power-domains = <&mmcc OXILICX_GDSC>;
> > -             operating-points-v2 = <&gpu_opp_table>;
> > -             iommus = <&gpu_iommu 0>;
> > -             #cooling-cells = <2>;
> > -     };
> > -
> > -     gpu_sram: ocmem@fdd00000 {
> > -             compatible = "qcom,msm8974-ocmem";
> > -
> > -             reg = <0xfdd00000 0x2000>,
> > -                   <0xfec00000 0x180000>;
> > -             reg-names = "ctrl",
> > -                         "mem";
> > -
> > -             clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> > -                      <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> > -             clock-names = "core",
> > -                           "iface";
> > -
> > -             #address-cells = <1>;
> > -             #size-cells = <1>;
> > -
> > -             gpu_sram: gpu-sram@0 {
> > -                     reg = <0x0 0x100000>;
> > -                     ranges = <0 0 0xfec00000 0x100000>;
> > -             };
> > -     };
> > -};
> > -
> > -Example a6xx (with GMU):
> > -
> > -/ {
> > -     ...
> > -
> > -     gpu@5000000 {
> > -             compatible = "qcom,adreno-630.2", "qcom,adreno";
> > -             #stream-id-cells = <16>;
> > -
> > -             reg = <0x5000000 0x40000>, <0x509e000 0x10>;
> > -             reg-names = "kgsl_3d0_reg_memory", "cx_mem";
> > -
> > -             #cooling-cells = <2>;
> > -
> > -             /*
> > -              * Look ma, no clocks! The GPU clocks and power are
> > -              * controlled entirely by the GMU
> > -              */
> > -
> > -             interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> > -
> > -             iommus = <&adreno_smmu 0>;
> > -
> > -             operating-points-v2 = <&gpu_opp_table>;
> > -
> > -             interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
> > -             interconnect-names = "gfx-mem";
> > -
> > -             gpu_opp_table: opp-table {
> > -                     compatible = "operating-points-v2";
> > -
> > -                     opp-430000000 {
> > -                             opp-hz = /bits/ 64 <430000000>;
> > -                             opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > -                             opp-peak-kBps = <5412000>;
> > -                     };
> > -
> > -                     opp-355000000 {
> > -                             opp-hz = /bits/ 64 <355000000>;
> > -                             opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> > -                             opp-peak-kBps = <3072000>;
> > -                     };
> > -
> > -                     opp-267000000 {
> > -                             opp-hz = /bits/ 64 <267000000>;
> > -                             opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> > -                             opp-peak-kBps = <3072000>;
> > -                     };
> > -
> > -                     opp-180000000 {
> > -                             opp-hz = /bits/ 64 <180000000>;
> > -                             opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> > -                             opp-peak-kBps = <1804000>;
> > -                     };
> > -             };
> > -
> > -             qcom,gmu = <&gmu>;
> > -
> > -             zap-shader {
> > -                     memory-region = <&zap_shader_region>;
> > -                     firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
> > -             };
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> > new file mode 100644
> > index 000000000000..4315482e0b12
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> > @@ -0,0 +1,256 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: "http://devicetree.org/schemas/display/msm/gpu.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Devicetree bindings for the Adreno or Snapdragon GPUs
> > +
> > +maintainers:
> > +  - Rob Clark <robdclark@gmail.com>
> > +
> > +description: |
> > +  These bindings describe the GPUs
>
> Describe what this h/w is/does. The 'title' tells me more than this
> sentence.
>
> > +
> > +properties:
> > +  compatible:
> > +    anyOf:
>
> How can both be true? Use 'oneOf'.
>
> > +      - items:
> > +          - pattern: '^qcom,adreno-[3-6][0-9][0-9].[0-9]$'
> > +          - const: qcom,adreno
> > +      - items:
> > +          - pattern: '^amd,imageon-200.[0-1]$'
> > +          - const: amd,imageon
> > +
> > +  clocks:
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    maxItems: 3
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: Physical base address and length of the controller's registers.
>
> Drop description. That's every 'reg'.
>
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    maxItems: 2
>
> Need defined names.
>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-names:
> > +    maxItems: 1
> > +
> > +  interconnects:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: |
> > +      optional phandle to an interconnect provider. See
> > +      ../interconnect/interconnect.txt for details.
> > +      Some A3xx and all A4xx platforms will have two paths;
> > +      all others will have one path.
> > +
> > +  interconnect-names:
>
> minItems: 1
>
> to fix your warning.
>
> > +    items:
> > +      - const: gfx-mem
> > +      - const: ocmem
> > +    description: |
> > +      the names of the interconnect paths that correspond to
> > +      the interconnects property
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  sram:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    minItems: 1
> > +    maxItems: 4
> > +    description: |
> > +      phandles to one or more reserved on-chip SRAM regions.
> > +      phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
> > +      a4xx Snapdragon SoCs. See
> > +      Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> > +
> > +  operating-points-v2: true
> > +  opp-table: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  zap-shader:
> > +    description: |
> > +      For a5xx and a6xx devices this node contains a memory-region that
> > +      points to reserved memory to store the zap shader that can be used to
> > +      help bring the GPU out of secure mode.
>
> Needs a type.
>
> > +
> > +  "#cooling-cells":
> > +    const: 2
> > +    description: |
> > +      For details, please refer
> > +      Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>
> Drop this.
>
> > +
> > +  qcom,gmu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      for GMU attached devices a phandle to the GMU device that will
> > +      control the power for the GPU
> > +
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            pattern: '^qcom,adreno-[3-5][0-9][0-9].[0-9]$'
>
> Would be simpler to use just 'qcom,adreno' here.

I just noticed that this pattern is incomplete (misses a6xx), which
might be an argument for just using 'qcom,adreno'..

OTOH, it may be worth pointing out that the driver is parsing the
compat string to figure out the gpu-id and patch level.

BR,
-R

> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GPU Core clock
> > +            - description: GPU Interface clock
> > +            - description: GPU Memory Interface clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: core
> > +            - const: iface
> > +            - const: mem_iface
> > +      required:
> > +        - clocks
> > +        - clock-names
>
> What do we have for clocks if this is false?
>
> > +
> > +examples:
> > +  - |
> > +
> > +    // Example a3xx/4xx:
> > +
> > +    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> > +    #include <dt-bindings/clock/qcom,rpmcc.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    gpu: adreno@fdb00000 {
> > +        compatible = "qcom,adreno-330.2", "qcom,adreno";
> > +
> > +        reg = <0xfdb00000 0x10000>;
> > +        reg-names = "kgsl_3d0_reg_memory";
> > +
> > +        clock-names = "core", "iface", "mem_iface";
> > +        clocks = <&mmcc OXILI_GFX3D_CLK>,
> > +                 <&mmcc OXILICX_AHB_CLK>,
> > +                 <&mmcc OXILICX_AXI_CLK>;
> > +
> > +        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names = "kgsl_3d0_irq";
> > +
> > +        sram = <&gpu_sram>;
> > +        power-domains = <&mmcc OXILICX_GDSC>;
> > +        operating-points-v2 = <&gpu_opp_table>;
> > +        iommus = <&gpu_iommu 0>;
> > +        #cooling-cells = <2>;
> > +    };
> > +
> > +    ocmem@fdd00000 {
> > +        compatible = "qcom,msm8974-ocmem";
> > +
> > +        reg = <0xfdd00000 0x2000>,
> > +              <0xfec00000 0x180000>;
> > +        reg-names = "ctrl", "mem";
> > +
> > +        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> > +                 <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> > +        clock-names = "core", "iface";
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges = <0 0xfec00000 0x100000>;
> > +
> > +        gpu_sram: gpu-sram@0 {
> > +            reg = <0x0 0x100000>;
> > +        };
> > +    };
> > +  - |
> > +
> > +    // Example a6xx (with GMU):
> > +
> > +    #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> > +
> > +    reserved-memory {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        zap_shader_region: gpu@8f200000 {
> > +            compatible = "shared-dma-pool";
> > +            reg = <0x0 0x90b00000 0x0 0xa00000>;
> > +            no-map;
> > +        };
> > +    };
> > +
> > +    gpu@5000000 {
> > +        compatible = "qcom,adreno-630.2", "qcom,adreno";
> > +
> > +        reg = <0x5000000 0x40000>, <0x509e000 0x10>;
> > +        reg-names = "kgsl_3d0_reg_memory", "cx_mem";
> > +
> > +        #cooling-cells = <2>;
> > +
> > +        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        iommus = <&adreno_smmu 0>;
> > +
> > +        operating-points-v2 = <&gpu_opp_table>;
> > +
> > +        interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
> > +        interconnect-names = "gfx-mem";
> > +
> > +        qcom,gmu = <&gmu>;
> > +
> > +        gpu_opp_table: opp-table {
> > +            compatible = "operating-points-v2";
> > +
> > +            opp-430000000 {
> > +                opp-hz = /bits/ 64 <430000000>;
> > +                opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > +                opp-peak-kBps = <5412000>;
> > +            };
> > +
> > +            opp-355000000 {
> > +                opp-hz = /bits/ 64 <355000000>;
> > +                opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> > +                opp-peak-kBps = <3072000>;
> > +            };
> > +
> > +            opp-267000000 {
> > +                opp-hz = /bits/ 64 <267000000>;
> > +                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> > +                opp-peak-kBps = <3072000>;
> > +            };
> > +
> > +            opp-180000000 {
> > +                opp-hz = /bits/ 64 <180000000>;
> > +                opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> > +                opp-peak-kBps = <1804000>;
> > +            };
> > +        };
> > +
> > +        zap-shader {
> > +            memory-region = <&zap_shader_region>;
> > +            firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
> > +        };
> > +    };
> > --
> > 2.30.2
> >
> >
