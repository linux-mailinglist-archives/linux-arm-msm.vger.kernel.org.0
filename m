Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F42A27624D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 22:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgIWUl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 16:41:59 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:47057 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIWUl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 16:41:59 -0400
Received: by mail-io1-f68.google.com with SMTP id g7so884766iov.13;
        Wed, 23 Sep 2020 13:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RlUZjMU4duw214AYO6t6QWSC1dLgrNo875Jdwc3bxEc=;
        b=E8U07pdBmv5S9YHQrYX8RXdyfBK48JXo2GjHe2y4LvOLp72KxjkYczIoxhr/6RjFEe
         9BJKkaeYxPUX1W9YkzMWYoDHkybm9pkskCnzSJbW7r6k4APr5JnLXOaY37kJX4w4alSU
         iPPfr9RPdZq/rmHDRW7gHl32KgIyHocZYHD1kzHVyfbgrpWMPfFeitEnLuCpKq/HlFXW
         b8on0XbOdXOweFFz9INwcIIPHzOLILhIqz2r/UTOyONv87oXej+NpWi/E6Aq+sEMKvhz
         RAQIDBi4FradFe5H9zEnDlg0OWtzGmntitlG/B4/qqLBy/MKiiqOVoQtj/C3p8RicoVV
         vlpw==
X-Gm-Message-State: AOAM532B66qlDDHxmSpieFgxZXZM/8rLJUU1Hpm6qAR240Othd10wHVG
        HdOpeNhR3RhW/RxxyIXHPQ==
X-Google-Smtp-Source: ABdhPJzMbLLYzgaphJVeHdGZ0Hi9G2/IgrFv27w4wrBHlwuEdliGpnuCLuOMx4lZHWCobKET72hNtg==
X-Received: by 2002:a02:11c2:: with SMTP id 185mr974444jaf.35.1600893718143;
        Wed, 23 Sep 2020 13:41:58 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s17sm425424ilb.24.2020.09.23.13.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:41:57 -0700 (PDT)
Received: (nullmailer pid 1269697 invoked by uid 1000);
        Wed, 23 Sep 2020 20:41:54 -0000
Date:   Wed, 23 Sep 2020 14:41:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v6 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
Message-ID: <20200923204154.GA1263348@bogus>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600409084-29093-3-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 11:34:41AM +0530, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Adds bindings for lpass hdmi interface
> which can support audio path over dp.
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 74 +++++++++++++++-------
>  1 file changed, 52 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 09c9bd2..f95ef70 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -24,9 +24,10 @@ properties:
>        - qcom,sc7180-lpass-cpu
>  
>    reg:
> -    maxItems: 1
> +    maxItems: 2
>      description: LPAIF core registers
> -
> +  reg-names:
> +     maxItems: 2
>    clocks:
>      minItems: 3
>      maxItems: 6
> @@ -36,15 +37,16 @@ properties:
>      maxItems: 6
>  
>    interrupts:
> -    maxItems: 1
> +    maxItems: 2
>      description: LPAIF DMA buffer interrupt
> -
> +  interrupt-names:
> +    maxItems: 2
>    qcom,adsp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: Phandle for the audio DSP node
>  
>    iommus:
> -    maxItems: 1
> +    maxItems: 2
>      description: Phandle to apps_smmu node with sid mask
>  
>    power-domains:
> @@ -60,10 +62,12 @@ properties:
>      const: 0
>  
>  patternProperties:
> -  "(^mi2s-[0-9a-f]$|mi2s)":
> +  "^dai-link@[0-9a-f]$":
>      type: object
> -    description: Required properties for each DAI
> -
> +    description: |
> +      LPASS CPU dai node for each I2S device. Bindings of each node
> +      depends on the specific driver providing the functionality and
> +      properties.
>      properties:
>        reg:
>          maxItems: 1
> @@ -85,9 +89,11 @@ patternProperties:
>  required:
>    - compatible
>    - reg
> +  - reg-names
>    - clocks
>    - clock-names
>    - interrupts
> +  - interrupt-names
>    - '#sound-dai-cells'
>  
>  additionalProperties: false
> @@ -134,13 +140,32 @@ allOf:
>      then:
>        properties:
>          clock-names:
> -          items:
> -            - const: pcnoc-sway-clk
> -            - const: audio-core
> -            - const: mclk0
> -            - const: pcnoc-mport-clk
> -            - const: mi2s-bit-clk0
> -            - const: mi2s-bit-clk1
> +          oneOf:
> +           - items:   #for I2S
> +              - const: pcnoc-sway-clk
> +              - const: audio-core
> +              - const: mclk0
> +              - const: pcnoc-mport-clk
> +              - const: mi2s-bit-clk0
> +              - const: mi2s-bit-clk1
> +           - items:   #for HDMI
> +              - const: pcnoc-sway-clk
> +              - const: audio-core
> +              - const: pcnoc-mport-clk
> +        reg-names:
> +          anyOf:
> +            - items:   #for I2S and HDMI
> +              - const: lpass-hdmiif
> +              - const: lpass-lpaif

It would be a bit cleaner if you switch the order. Then you are just 
adding on to the end.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +            - items:   #for I2S
> +              - const: lpass-lpaif
> +        interrupt-names:
> +          anyOf:
> +            - items:   #for I2S and HDMI
> +              - const: lpass-irq-lpaif
> +              - const: lpass-irq-hdmi
> +            - items:   #for I2S
> +              - const: lpass-irq-lpaif
>        required:
>          - iommus
>          - power-domains
> @@ -152,12 +177,15 @@ examples:
>      soc {
>          #address-cells = <2>;
>          #size-cells = <2>;
> -        lpass@62f00000 {
> +        lpass@62d80000 {
>              compatible = "qcom,sc7180-lpass-cpu";
>  
> -            reg = <0 0x62f00000  0 0x29000>;
> -
> -            iommus = <&apps_smmu 0x1020 0>;
> +            reg = <0 0x62d87000 0 0x68000>,
> +                  <0 0x62f00000 0 0x29000>;
> +            reg-names = "lpass-hdmiif",
> +                        "lpass-lpaif";
> +            iommus = <&apps_smmu 0x1020 0>,
> +                     <&apps_smmu 0x1032 0>;
>              power-domains = <&lpass_hm 0>;
>  
>              clocks = <&gcc 131>,
> @@ -171,14 +199,16 @@ examples:
>                            "mclk0", "pcnoc-mport-clk",
>                            "mi2s-bit-clk0", "mi2s-bit-clk1";
>  
> -            interrupts = <0 160 1>;
> -
> +            interrupts = <0 160 1>,
> +                         <0 268 1>;
> +            interrupt-names = "lpass-irq-lpaif",
> +                              "lpass-irq-hdmi";
>              #sound-dai-cells = <1>;
>  
>              #address-cells = <1>;
>              #size-cells = <0>;
>              /* Optional to set different MI2S SD lines */
> -            mi2s-primary@0 {
> +            dai-link@0 {
>                  reg = <MI2S_PRIMARY>;
>                  qcom,playback-sd-lines = <1>;
>                  qcom,capture-sd-lines = <0>;
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
