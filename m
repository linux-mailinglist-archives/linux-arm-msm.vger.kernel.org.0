Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5C421E336
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 00:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgGMWxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 18:53:33 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34757 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgGMWxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 18:53:32 -0400
Received: by mail-io1-f68.google.com with SMTP id q74so15355764iod.1;
        Mon, 13 Jul 2020 15:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i7bl8lVozvsdgE9YS/29f2AjrQyXq5IegzpDYAlFKDk=;
        b=lMACpud/B/zpOXyooCHGMRNwYQ7mPbz1ZZPxpC2WtVAfevER5cmDu56t00rNLoBQu8
         XtZS1PZQmoeE9UuGR8DHwlRwqV9lZRvQl1gNBLe1uL3sxBSpnd/hGDXSaI4bIMOe7BSl
         F+a5VtmTe9xUrl/Mwjtx7jEjLzUMTyasaeNN5LSDcX96d7tZNkOkhOQK31GgioIe+YXV
         Qzo7MXQki0RtKFcVpbkrgO9EBJkaSdEgFD/PEXhyIS3wolXlr2fXcqXa08/JTtIaba6h
         UkNRQBT1KsQAmDC8gFRstYUnYeIbp7+9KwiZCDNp0t6XHE/eEzA3r2lyLUgbTzz2Du5k
         Fjew==
X-Gm-Message-State: AOAM532QJ5a+T6FmpJzdKRdtcuvSzC6B41IhychG3ioTjKvRfiZppcAC
        0T/ncWlWDEqtj1zaRgUasQ==
X-Google-Smtp-Source: ABdhPJzBmSzmcOPXxwclfcbkJAWg4Hx9r7duDiLMl+AGttmUoSZszkVUBupxhl6WuMml7z/UOFnRDg==
X-Received: by 2002:a6b:640e:: with SMTP id t14mr2061843iog.39.1594680811094;
        Mon, 13 Jul 2020 15:53:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b13sm8316626iof.21.2020.07.13.15.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 15:53:30 -0700 (PDT)
Received: (nullmailer pid 872292 invoked by uid 1000);
        Mon, 13 Jul 2020 22:53:28 -0000
Date:   Mon, 13 Jul 2020 16:53:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rohit kumar <rohitkr@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajitp@codeaurora.org>
Subject: Re: [PATCH v3 8/8] dt-bindings: sound: lpass-cpu: Move to yaml format
Message-ID: <20200713225328.GA778183@bogus>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-9-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594184896-10629-9-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 08, 2020 at 10:38:16AM +0530, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Update lpass-cpu binding with yaml formats.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  80 -----------
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 154 +++++++++++++++++++++
>  2 files changed, 154 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> deleted file mode 100644
> index 04e34cc..00000000
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -* Qualcomm Technologies LPASS CPU DAI
> -
> -This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
> -
> -Required properties:
> -
> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> -			  "qcom,lpass-cpu-sc7180"
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
> -Example:
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
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> new file mode 100644
> index 00000000..9c350bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS CPU dai driver bindings
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +
> +description:
> +  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
> +  for audio data transfer on external codecs. LPASS cpu driver is a module to
> +  configure Low-Power Audio Interface(LPAIF) core registers across different
> +  IP versions.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,lpass-cpu
> +      - qcom,apq8016-lpass-cpu
> +      - qcom,lpass-cpu-sc7180
> +
> +  reg:
> +    items:
> +      - description: LPAIF core registers

Just: 'maxItems: 1' for a single entry.

> +
> +  reg-names:
> +    items:
> +      - const: lpass-lpaif

Not all that useful with only 1.

> +
> +  clocks:
> +    items:
> +      - description: AHBIX core clock
> +      - description: oscillator clock for MI2S external interfaces
> +      - description: Bit clock for single MI2S dai
> +      - description: Bit clock for MI2S_PRIMARY dai interface
> +      - description: Bit clock for MI2S_SECONDARY dai interface
> +      - description: Bit clock for MI2S_TERTIARY dai interface
> +      - description: Bit clock for MI2S_QUATERNARY dai interface
> +      - description: NOC MPORT clock of LPASS core
> +      - description: NOC SWAY clock of LPASS core
> +
> +  clock-names:
> +    items:
> +      - const: ahbix-clk
> +      - const: mi2s-osr-clk
> +      - const: mi2s-bit-clk
> +      - const: mi2s-bit-clk0
> +      - const: mi2s-bit-clk1
> +      - const: mi2s-bit-clk2
> +      - const: mi2s-bit-clk3
> +      - const: pcnoc-mport-clk
> +      - const: pcnoc-sway-clk
> +
> +  interrupts:
> +    items:
> +      - description: LPAIF DMA buffer interrupt

maxItems: 1

> +
> +  interrupt-names:
> +    items:
> +      - const: lpass-irq-lpaif
> +
> +  qcom,adsp:
> +    maxItems: 1
> +    description: Phandle for the audio DSP node

Needs a type $ref. And if just a phandle, 'maxItems: 1' is not 
appropriate.

> +
> +  iommus:
> +    maxItems: 1
> +    description: Phandle to apps_smmu node with sid mask
> +
> +  power-domains:
> +    maxItems: 1
> +    description: Phandle for power domain node

Drop. That's every 'power-domains' property.

> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  child-node:

I'm sure I said this on some review recently, but you are defining a 
child node named 'child-node'. You need this under patternProperties 
with the actual child node name.

> +    description: Required properties for each DAI
> +    type: object
> +    properties:
> +      reg:
> +        description: Must be one of the DAI ID
> +                     (Usually part of dtbindings header)

Ideally, you'd define the range of values here.

> +      qcom,playback-sd-lines:
> +        description: List of serial data lines to use for playback
> +                     Each SD line should be represented by a number from 0-3.

Needs a type $ref and 0-3 should be expressed as a schema.

'make dt_binding_check' should complain about this. You did run that, 
right?

> +      qcom,capture-sd-lines :
> +        description: List of serial data lines to use for capture
> +                     Each SD line should be represented by a number from 0-3.

ditto

> +    required:
> +      -reg

space     ^

> +    # Note that adding a subnode changes the default to "no lines configured",
> +    # so both playback and capture lines should be configured when a subnode
> +    # is added.
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - sound-dai-cells

Not a valid property.

> +
> +optional:
> +  - qcom,adsp
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: qcom,lpass-cpu-sc7180
> +
> +then:
> +  required:
> +    - iommus
> +    - power-domains
> +
> +examples:
> +  lpass@28100000 {

This is not valid. 'examples' should be a list.

> +	compatible = "qcom,lpass-cpu";
> +	clocks = <&lcc AHBIX_CLK>,
> +		 <&lcc MI2S_OSR_CLK>,
> +		 <&lcc MI2S_BIT_CLK>;

The example will not build because the includes are missing.

> +
> +	clock-names = "ahbix-clk",
> +		      "mi2s-osr-clk",
> +		      "mi2s-bit-clk";
> +
> +	interrupts = <0 85 1>;
> +        interrupt-names = "lpass-irq-lpaif";
> +
> +	iommus = <&apps_smmu 0x1020 0>;
> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +
> +	reg = <0x28100000 0x10000>;
> +	reg-names = "lpass-lpaif";
> +	#sound-dai-cells = <1>;
> +	qcom,adsp = <&adsp>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* Optional to set different MI2S SD lines */
> +	mi2s-quaternary@3 {
> +		reg = <MI2S_QUATERNARY>;
> +		qcom,playback-sd-lines = <0 1>;
> +  };
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
