Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8707D45A295
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 13:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbhKWMb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 07:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235598AbhKWMb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 07:31:57 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF9AC061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:28:49 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id l16so718618wrp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rVG2OvFNtwuvGocTJEIePQliGx/5pyumNMpZCeSGnRQ=;
        b=OD+6KF5Y5qceY/zxVgxxPcEVQMUX0pZeUD8ypVQ/WNqhPJX2wPyMbs3SJkvoc6mfty
         SJkZN2I4aTJ8+U3u1savTJ5kq9IVnPtogvFYMUfbpL3gbyWsSw6Df7y7+xDAf0ic626g
         HSLaxA5Sssu9e1GkKsgrhbpyRW2JiBLBMzh7Vaq7zZbvNEqpLi5EUyAk0IHyEYExkNkP
         CA8hJr4OrxFH3ZwQ2LKRJ8VCJ/0caM3tx5hIybVYeiPjHR9joeypipiq0LOudwNotdOI
         z76xvyMRizrFa5Ksn+ckgm2GrQw8H+dkJ6Ng+UJiP3bjGLi71SYksK7e3IkJtnr4pmST
         oUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rVG2OvFNtwuvGocTJEIePQliGx/5pyumNMpZCeSGnRQ=;
        b=RYxhH/QnwrlvP7t8z6bWRxCe4jidxAJB/Sfoyiq7YpVEyrEMzqOFKu5MwaI/3yDSCJ
         5IXzx7ACgu56RrZ9MQInEkYv1cGI4REbRWjUKv0a7QROyVr5c7mD0P3ho3V6EflF+dq1
         KIoD5W8QdmCrbzFEm4yYDNav7oKCygJZ/nc82lTAAQGAVG/cu9j9TsqAVJbIA+Ho6bG4
         6ou2OHHegG8KnrwdJdD67dsod7vryPap2J/YsWs9hUis4L02Xjkw1Ob2JlW6znHNLkai
         Atwt5/rygFF8ZNZOtD3rdSthr3SAXxqWmJwB2MIXdIHeR1hClVqtmLAsPrALvFAS0TK4
         JPWQ==
X-Gm-Message-State: AOAM530lefyZqBIGEKHFeqKfJ1U3XwftnADvWKGK/z6P4ZGlWRPiuZ0G
        +HKJUiAZU6zcEm+QAKe5+qx86w==
X-Google-Smtp-Source: ABdhPJw2G3xBF8JO9ULiAtM6rn77suLuvt/9/yYIPGC1AaRp7/soYwduibi0SyYdmFhXiTVcCegtww==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr6905140wrv.13.1637670528084;
        Tue, 23 Nov 2021 04:28:48 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id z18sm12160056wrq.11.2021.11.23.04.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:28:47 -0800 (PST)
Subject: Re: [PATCH v5 08/10] ASoC: dt-bindings: Add SC7280 sound card
 bindings
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
 <1637581599-24120-4-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6bc587a0-fa8a-4509-99d9-f76aa2418c0b@linaro.org>
Date:   Tue, 23 Nov 2021 12:28:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637581599-24120-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/11/2021 11:46, Srinivasa Rao Mandadapu wrote:
> Add bindings for lpass sc7280 based soundcards which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 


Subject line is totally missleading,

This is not a soundcard bindings but its lpass cpu bindings.

--srini
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>   1 file changed, 61 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 1e23c0e..0f5a57c 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -22,35 +22,36 @@ properties:
>         - qcom,lpass-cpu
>         - qcom,apq8016-lpass-cpu
>         - qcom,sc7180-lpass-cpu
> +      - qcom,sc7280-lpass-cpu
>   
>     reg:
> -    maxItems: 2
> +    maxItems: 5
>       description: LPAIF core registers
>   
>     reg-names:
> -    maxItems: 2
> +    maxItems: 5
>   
>     clocks:
>       minItems: 3
> -    maxItems: 6
> +    maxItems: 7
>   
>     clock-names:
>       minItems: 3
> -    maxItems: 6
> +    maxItems: 7
>   
>     interrupts:
> -    maxItems: 2
> +    maxItems: 4
>       description: LPAIF DMA buffer interrupt
>   
>     interrupt-names:
> -    maxItems: 2
> +    maxItems: 4
>   
>     qcom,adsp:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description: Phandle for the audio DSP node
>   
>     iommus:
> -    maxItems: 2
> +    maxItems: 3
>       description: Phandle to apps_smmu node with sid mask
>   
>     power-domains:
> @@ -69,7 +70,7 @@ patternProperties:
>     "^dai-link@[0-9a-f]$":
>       type: object
>       description: |
> -      LPASS CPU dai node for each I2S device. Bindings of each node
> +      LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
>         depends on the specific driver providing the functionality and
>         properties.
>       properties:
> @@ -174,6 +175,58 @@ allOf:
>           - iommus
>           - power-domains
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
> +
> +        reg-names:
> +          anyOf:
> +            - items:   #for I2S
> +                - const: lpass-lpaif
> +            - items:   #for I2S and HDMI
> +                - const: lpass-hdmiif
> +                - const: lpass-lpaif
> +            - items:   #for I2S, soundwire and HDMI
> +                - const: lpass-cdc-lpm
> +                - const: lpass-rxtx-lpaif
> +                - const: lpass-va-lpaif
> +                - const: lpass-hdmiif
> +                - const: lpass-lpaif
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
> +
> +      required:
> +        - iommus
> +        - power-domains
> +
>   examples:
>     - |
>       #include <dt-bindings/sound/sc7180-lpass.h>
> 
