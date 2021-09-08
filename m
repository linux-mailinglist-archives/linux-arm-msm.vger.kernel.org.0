Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17521403FAD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 21:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349726AbhIHTRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 15:17:05 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:38769 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbhIHTRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 15:17:05 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 452E81F995;
        Wed,  8 Sep 2021 21:15:54 +0200 (CEST)
Date:   Wed, 8 Sep 2021 21:15:52 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     smasetty <smasetty@codeaurora.org>,
        masneyb <masneyb@onstation.org>,
        robdclark <robdclark@chromium.org>,
        jordan <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] [v3] dt-bindings: drm/msm/gpu: convert to YAML
Message-ID: <20210908191552.ay5mk6ho5nfsqgvv@Marijn-Arch-PC.localdomain>
References: <20210908062946.8529-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908062946.8529-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi David,

On 2021-09-08 08:29:46, David Heidelberg wrote:
> Signed-off-by: David Heidelberg <david@ixit.cz>

Apologies for not getting back to you in time about my questions on the
optional handling of clocks and clock-names properties.  After
addressing below comments, feel free to add my r-b.

Note that I'm still seeing some failures on the following cases:
- Missing firmware-name in zap-shader;
- #stream-id-cells, nvmem-cell-names, nvmem-cells are not covered by
  this binding;
- amd,imageon as third compatible is not handled (but the source DT
  might be to blame here).

If this patch is not intended to cover every case (yet), and/or requires
future fixes to dtbs, it is appreciated to denote this in the commit
message.

> [..]
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> new file mode 100644
> index 000000000000..9feb1112af71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -0,0 +1,297 @@
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
> +          The driver is parsing the compat string for Adreno to figure out the gpu-id and patch level.
> +        items:
> +          - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
> +          - const: qcom,adreno
> +      - description: |
> +          The driver is parsing the compat string for Imageon to figure out the gpu-id and patch level.
> +        items:
> +          - pattern: '^amd,imageon-200\.[0-1]$'
> +          - const: amd,imageon
> +
> +  clocks:
> +    description: Requirements depends on the Adreno gpu-id.
> +
> +  clock-names:
> +    description: Requirements depends on the Adreno gpu-id.

You are indeed correct that not specifying these properties here, and
only having them in the allOf-if-then doesn't work and results in:

    'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

The common way to solve this is to assign true here to indicate that the
property is required:

    clocks: true
    clock-names: true

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
> +    required:
> +      - firmware-name
> +
> +  "#cooling-cells":
> +    const: 2
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
> +        clocks:
> +          maxItems: 0
> +
> +        clock-names:
> +          maxItems: 0

Subsequently, instead of setting the array length to zero you can
disallow this property from being specified instead:

    clocks: false
    clock-names: false

That appears to be the common way to solve this problem, maxItems: 0 is
not used anywhere else in dt-bindings.

- Marijn
