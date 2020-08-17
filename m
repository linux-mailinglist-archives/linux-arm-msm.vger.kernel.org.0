Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A240324784B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 22:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgHQUpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 16:45:47 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:44714 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgHQUpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 16:45:45 -0400
Received: by mail-il1-f196.google.com with SMTP id j9so15697455ilc.11;
        Mon, 17 Aug 2020 13:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8BJpUFruvhhEHxqofNhY/G7iCQHj547c9tNCNX6kgbg=;
        b=ubaUFp6TYC0P7OMQFr2Lcu/QSp/sHnQ3Zu9dklt7+9Z9WwUd3ATACpOBJ2hwo6B/uk
         WZGy70gafB+BFupbcE1yGgDojAhA9VBolM/hQTHcQY8A2Y/IdWEC/klXhzNh4uf+Zhvg
         +DODdqOqNwp6x1RtO/lbLcK00Hn9WT96i0uKdPy+fuxZZAsoSSPnbwJGZcXarbovKoSs
         rJafn/AK6eeYLJk/1259xvM2gl2+/CEJJkiV3LBftYCQN/dVdF42aLnNMfKlJzxHYz1o
         X2PDU6VfMFym86RbS2dX/CJ+Yv3OqBt+bjUQ1xwBgHBxsKl2MwwkbeTSDzpMrjdv+kQo
         Wrcg==
X-Gm-Message-State: AOAM530MolVdTP0EYPDkldJA6w5q+J7kroXKrzyO123enGOmP1f7P/KL
        yhqcHSo8oguWPIw4+0RXRQ==
X-Google-Smtp-Source: ABdhPJytR1FxTi0bUkNGyhC8h+w18pWMjgJBz4sZPYA/pW7wZXQCMWd83VU3tLqjKxekg/37S7MOlA==
X-Received: by 2002:a92:9e48:: with SMTP id q69mr15760069ili.170.1597697143190;
        Mon, 17 Aug 2020 13:45:43 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id u17sm9552610ilj.0.2020.08.17.13.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 13:45:42 -0700 (PDT)
Received: (nullmailer pid 1527573 invoked by uid 1000);
        Mon, 17 Aug 2020 20:45:39 -0000
Date:   Mon, 17 Aug 2020 14:45:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rohit kumar <rohitkr@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/12] dt-bindings: sound: lpass-cpu: Move to yaml
 format
Message-ID: <20200817204539.GB1512270@bogus>
References: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
 <1597402388-14112-13-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597402388-14112-13-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 14, 2020 at 04:23:08PM +0530, Rohit kumar wrote:
> Update lpass-cpu binding with yaml formats.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 130 --------------
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 189 +++++++++++++++++++++
>  2 files changed, 189 insertions(+), 130 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> deleted file mode 100644
> index c07202c..00000000
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -* Qualcomm Technologies LPASS CPU DAI
> -
> -This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
> -
> -Required properties:
> -
> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> -			  "qcom,sc7180-lpass-cpu"
> -- clocks		: Must contain an entry for each entry in clock-names.
> -- clock-names		: A list which must include the following entries:
> -				* "ahbix-clk"
> -				* "mi2s-osr-clk"
> -				* "mi2s-bit-clk"
> -			: required clocks for "qcom,lpass-cpu-apq8016"
> -				* "ahbix-clk"
> -				* "mi2s-bit-clk0"
> -				* "mi2s-bit-clk1"
> -				* "mi2s-bit-clk2"
> -				* "mi2s-bit-clk3"
> -				* "pcnoc-mport-clk"
> -				* "pcnoc-sway-clk"
> -			: required clocks for "qcom,lpass-cpu-sc7180"
> -				* "audio-core"
> -				* "mclk0"
> -				* "mi2s-bit-clk0"
> -				* "mi2s-bit-clk1"
> -				* "pcnoc-sway-clk"
> -				* "pcnoc-mport-clk"
> -
> -- interrupts		: Must contain an entry for each entry in
> -			  interrupt-names.
> -- interrupt-names	: A list which must include the following entries:
> -				* "lpass-irq-lpaif"
> -- pinctrl-N		: One property must exist for each entry in
> -			  pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
> -			  for details of the property values.
> -- pinctrl-names		: Must contain a "default" entry.
> -- reg			: Must contain an address for each entry in reg-names.
> -- reg-names		: A list which must include the following entries:
> -				* "lpass-lpaif"
> -- #address-cells	: Must be 1
> -- #size-cells		: Must be 0
> -
> -
> -
> -Optional properties:
> -
> -- qcom,adsp		: Phandle for the audio DSP node
> -
> -By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
> -The SD lines to use can be configured by adding subnodes for each of the DAIs.
> -
> -Required properties for each DAI (represented by a subnode):
> -- reg			: Must be one of the DAI IDs
> -			  (usually part of dt-bindings header)
> -- qcom,playback-sd-lines: List of serial data lines to use for playback
> -			  Each SD line should be represented by a number from 0-3.
> -- qcom,capture-sd-lines	: List of serial data lines to use for capture
> -			  Each SD line should be represented by a number from 0-3.
> -
> -Note that adding a subnode changes the default to "no lines configured",
> -so both playback and capture lines should be configured when a subnode is added.
> -
> -Examples:
> -1)
> -
> -lpass@28100000 {
> -	compatible = "qcom,lpass-cpu";
> -	clocks = <&lcc AHBIX_CLK>, <&lcc MI2S_OSR_CLK>, <&lcc MI2S_BIT_CLK>;
> -	clock-names = "ahbix-clk", "mi2s-osr-clk", "mi2s-bit-clk";
> -	interrupts = <0 85 1>;
> -	interrupt-names = "lpass-irq-lpaif";
> -	pinctrl-names = "default", "idle";
> -	pinctrl-0 = <&mi2s_default>;
> -	pinctrl-1 = <&mi2s_idle>;
> -	reg = <0x28100000 0x10000>;
> -	reg-names = "lpass-lpaif";
> -	qcom,adsp = <&adsp>;
> -
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -
> -	/* Optional to set different MI2S SD lines */
> -	dai@3 {
> -		reg = <MI2S_QUATERNARY>;
> -		qcom,playback-sd-lines = <0 1>;
> -	};
> -};
> -
> -2)
> -
> -#include <dt-bindings/sound/sc7180-lpass.h>
> -
> -lpass_cpu: lpass {
> -	compatible = "qcom,sc7180-lpass-cpu";
> -
> -	reg = <0 0x62F00000 0 0x29000>;
> -
> -	iommus = <&apps_smmu 0x1020 0>;
> -
> -	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> -	clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
> -	clock-names = "pcnoc-sway-clk", "audio-core",
> -			"mclk0", "pcnoc-mport-clk",
> -			"mi2s-bit-clk0", "mi2s-bit-clk1";
> -	interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
> -	interrupt-names = "lpass-irq-lpaif";
> -
> -
> -	#sound-dai-cells = <1>;
> -
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -
> -	mi2s-primary@0 {
> -		reg = <MI2S_PRIMARY>;
> -		qcom,playback-sd-lines = <1>;
> -		qcom,capture-sd-lines = <0>;
> -	};
> -
> -	mi2s-secondary@1 {
> -		reg = <MI2S_SECONDARY>;
> -		qcom,playback-sd-lines = <0>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> new file mode 100644
> index 00000000..09c9bd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -0,0 +1,189 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc. LPASS CPU dai driver bindings
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +
> +description: |
> +  Qualcomm Technologies Inc. SOC Low-Power Audio SubSystem (LPASS) that consist
> +  of MI2S interface for audio data transfer on external codecs. LPASS cpu driver
> +  is a module to configure Low-Power Audio Interface(LPAIF) core registers
> +  across different IP versions.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,lpass-cpu
> +      - qcom,apq8016-lpass-cpu
> +      - qcom,sc7180-lpass-cpu
> +
> +  reg:
> +    maxItems: 1
> +    description: LPAIF core registers
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 6
> +
> +  clock-names:
> +    minItems: 3
> +    maxItems: 6
> +
> +  interrupts:
> +    maxItems: 1
> +    description: LPAIF DMA buffer interrupt
> +
> +  qcom,adsp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle for the audio DSP node
> +
> +  iommus:
> +    maxItems: 1
> +    description: Phandle to apps_smmu node with sid mask
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "(^mi2s-[0-9a-f]$|mi2s)":

This allows '.*mi2s.*' for a node name which is too lax. And since 
there's a required 'reg' property, the unit-address should always be 
there.

Looking at this again, the node names shouldn't imply instance 
information. Just a generic '^dai@[0-9a-f]$' should suffice.

> +    type: object
> +    description: Required properties for each DAI

'description' should be what the node is, not what the schema has. Plus 
it is wrong as there's optional properties here too.

> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Must be one of the DAI ID
> +
> +      qcom,playback-sd-lines:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: list of MI2S data lines for playback
> +
> +      qcom,capture-sd-lines:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: list of MI2S data lines for capture
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,lpass-cpu
> +
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: ahbix-clk
> +            - const: mi2s-osr-clk
> +            - const: mi2s-bit-clk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,apq8016-lpass-cpu
> +
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: ahbix-clk
> +            - const: mi2s-bit-clk0
> +            - const: mi2s-bit-clk1
> +            - const: mi2s-bit-clk2
> +            - const: mi2s-bit-clk3
> +            - const: pcnoc-mport-clk
> +            - const: pcnoc-sway-clk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7180-lpass-cpu
> +
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pcnoc-sway-clk
> +            - const: audio-core
> +            - const: mclk0
> +            - const: pcnoc-mport-clk
> +            - const: mi2s-bit-clk0
> +            - const: mi2s-bit-clk1
> +      required:
> +        - iommus
> +        - power-domains
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/sc7180-lpass.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        lpass@62f00000 {
> +            compatible = "qcom,sc7180-lpass-cpu";
> +
> +            reg = <0 0x62f00000  0 0x29000>;
> +
> +            iommus = <&apps_smmu 0x1020 0>;
> +            power-domains = <&lpass_hm 0>;
> +
> +            clocks = <&gcc 131>,
> +                 <&lpasscorecc 6>,
> +                 <&lpasscorecc 7>,
> +                 <&lpasscorecc 10>,
> +                 <&lpasscorecc 8>,
> +                 <&lpasscorecc 9>;
> +
> +            clock-names = "pcnoc-sway-clk", "audio-core",
> +                          "mclk0", "pcnoc-mport-clk",
> +                          "mi2s-bit-clk0", "mi2s-bit-clk1";
> +
> +            interrupts = <0 160 1>;
> +
> +            #sound-dai-cells = <1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            /* Optional to set different MI2S SD lines */
> +            mi2s-primary@0 {
> +                reg = <MI2S_PRIMARY>;
> +                qcom,playback-sd-lines = <1>;
> +                qcom,capture-sd-lines = <0>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
