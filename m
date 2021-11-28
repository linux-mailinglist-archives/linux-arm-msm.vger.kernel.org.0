Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6CB4607BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Nov 2021 17:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358491AbhK1Q7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Nov 2021 11:59:00 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:42850 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbhK1Q47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Nov 2021 11:56:59 -0500
Received: by mail-oi1-f181.google.com with SMTP id n66so29765201oia.9;
        Sun, 28 Nov 2021 08:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=45c1gacm72RX4cF7zNnpU51xQn+kJSWSAn4Mo9Q7trc=;
        b=FW+5dkPJBRq1whp5F9dHlh1DC+ac7EF0rsKqRl3K4KXsJWZsXusLm1V71Sr6ZhxAf/
         xAm9NwxcbLJUeqoL052CZeOPqwhOHQBEFrjsjqLQCWoroBY+VbZ9R89+AXismgyGgFRG
         CZeUOQ7adnbltxz8tvtaTCx0eGFxzM9jL+3BnqAZwy1/BXRKJFa6huhcKkguO+VEBCrt
         P4dbCXSW2DPZA49h4JfzJRs3lAwwCvt1KHfy7kXwN3CU7Fgk1HsUK4HzjhuJrE50Dovl
         pcJS7CvdZGYacm5B9wVs4hwISFZIkebjNZuA5hOGk6igmduWv/AgzvcQ/S5brD2xTL+u
         Yp0Q==
X-Gm-Message-State: AOAM530JUHH4lvzS5s8VP8B7i47IT2ElkPaxAEqeemNYmO/1h6MPOA17
        UkQDCArXnDn8rKpIyEwKPA==
X-Google-Smtp-Source: ABdhPJy7pyUbgpVnYnG9saZFi8PYobUToY1xZuAG64h436uSkvorpWBdVmBhJPtgTE5wStLGhyx8Cw==
X-Received: by 2002:a05:6808:120b:: with SMTP id a11mr36930823oil.128.1638118422790;
        Sun, 28 Nov 2021 08:53:42 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
        by smtp.gmail.com with ESMTPSA id a17sm2437469oiw.43.2021.11.28.08.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:53:42 -0800 (PST)
Received: (nullmailer pid 2708024 invoked by uid 1000);
        Sun, 28 Nov 2021 16:53:37 -0000
Date:   Sun, 28 Nov 2021 10:53:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
Message-ID: <YaO0ER2pNIQrvlxM@robh.at.kernel.org>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-9-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637928282-2819-9-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 26, 2021 at 05:34:40PM +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for sc7280 lpass cpu driver which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>  1 file changed, 61 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 1e23c0e..0f5a57c 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -22,35 +22,36 @@ properties:
>        - qcom,lpass-cpu
>        - qcom,apq8016-lpass-cpu
>        - qcom,sc7180-lpass-cpu
> +      - qcom,sc7280-lpass-cpu
>  
>    reg:
> -    maxItems: 2
> +    maxItems: 5
>      description: LPAIF core registers
>  
>    reg-names:
> -    maxItems: 2
> +    maxItems: 5
>  
>    clocks:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 7
>  
>    clock-names:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 7
>  
>    interrupts:
> -    maxItems: 2
> +    maxItems: 4
>      description: LPAIF DMA buffer interrupt
>  
>    interrupt-names:
> -    maxItems: 2
> +    maxItems: 4
>  
>    qcom,adsp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: Phandle for the audio DSP node
>  
>    iommus:
> -    maxItems: 2
> +    maxItems: 3
>      description: Phandle to apps_smmu node with sid mask
>  
>    power-domains:
> @@ -69,7 +70,7 @@ patternProperties:
>    "^dai-link@[0-9a-f]$":
>      type: object
>      description: |
> -      LPASS CPU dai node for each I2S device. Bindings of each node
> +      LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
>        depends on the specific driver providing the functionality and
>        properties.
>      properties:
> @@ -174,6 +175,58 @@ allOf:
>          - iommus
>          - power-domains
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-lpass-cpu
> +
> +    then:
> +      properties:
> +        clock-names:
> +          oneOf:
> +            - items:   #for I2S
> +                - const: lpass_aon_cc_audio_hm_h_clk
> +                - const: lpass_core_cc_sysnoc_mport_core_clk
> +                - const: lpass_core_cc_ext_if1_ibit_clk
> +            - items:   #for Soundwire
> +                - const: lpass_aon_cc_audio_hm_h_clk
> +                - const: lpass_audio_cc_codec_mem0_clk
> +                - const: lpass_audio_cc_codec_mem1_clk
> +                - const: lpass_audio_cc_codec_mem2_clk
> +            - items:   #for HDMI
> +                - const: lpass_aon_cc_audio_hm_h_clk

'lpass_' and '_clk' are redundant.

> +
> +        reg-names:
> +          anyOf:
> +            - items:   #for I2S
> +                - const: lpass-lpaif
> +            - items:   #for I2S and HDMI
> +                - const: lpass-hdmiif
> +                - const: lpass-lpaif

Doesn't this apply to other SoCs?

> +            - items:   #for I2S, soundwire and HDMI
> +                - const: lpass-cdc-lpm
> +                - const: lpass-rxtx-lpaif
> +                - const: lpass-va-lpaif
> +                - const: lpass-hdmiif
> +                - const: lpass-lpaif

'lpass-' is redundant too, but consistency across SoCs is better.

hdmiif and lpaif should be first. (Add new resources on the end.)

> +        interrupt-names:
> +          anyOf:
> +            - items:   #for I2S
> +                - const: lpass-irq-lpaif
> +            - items:   #for I2S and HDMI
> +                - const: lpass-irq-lpaif
> +                - const: lpass-irq-hdmi
> +            - items:   #for I2S, soundwire and HDMI
> +                - const: lpass-irq-lpaif
> +                - const: lpass-irq-vaif
> +                - const: lpass-irq-rxtxif
> +                - const: lpass-irq-hdmi

Again, add new entries to the end.

> +
> +      required:
> +        - iommus
> +        - power-domains
> +
>  examples:
>    - |
>      #include <dt-bindings/sound/sc7180-lpass.h>
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
> 
