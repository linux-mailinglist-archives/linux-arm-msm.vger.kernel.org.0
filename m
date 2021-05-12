Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB28F37BBBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 May 2021 13:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhELL2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 07:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhELL2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 07:28:09 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE249C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 04:26:59 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id g14so26644935edy.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sW3jMCftDfiFtBgZttGt05xUZb6de8CfShosPvhcNg8=;
        b=Ct/bixgpdm8CwXOzW7AiVcDbDzPjEfU8A77D9J6D6jlIx5sqJwfho3+XVoMriZhDLL
         O6hzC/4bxdM9imU5OShWs00D1DM+NMZcDp1ys3mUsVXewPv390xPrkLPWGCgeuNFDfM4
         HfyLLiCIi4twItp7eqqLlO7quZdXDxY7NBh9t+1POIxaXX/ohNSJG91ti9OA+xst7AqR
         xO8ErxgVWmtDupIyr202+s1wTsZPgss0vfZpYHHMVaIXAfzZmIc1l6vEpafIchFirIcz
         di6LD2V8fA8xYqJpIwt5S+4ncv9b1lAzD8HZ7iUOD6ccrD3IdyG8vp8YOBivakI+wE4q
         N8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sW3jMCftDfiFtBgZttGt05xUZb6de8CfShosPvhcNg8=;
        b=evt6SVDv6Ed9eoji/xjjM5zAy2qdkANMnpx+Ei4p1jtpX+12o0upBtWzxzeD0NPwyB
         5f5D2Xx0Z7BaC16vVzS+myyeQLxXrwBlna96k0bl2kfTCsoH5Qi93a0WILz3gK266OdR
         46CaxrKt/b7yjq5kPgp3kSHGs2aJFVdsZIJ1nbywGrzobXzQwoI5k/XFwjM8RpbuwdEt
         6q2ZhB4vIZYhNORg8l6Ilj/j5iXau27pPtZO63uYPwokRqVRSk11OybssoaHqbyMaHug
         +fgzpaIpwPa9oVfFMRFQROaRjBToPuY/Q84IaopSf2f351cDHoKdjMaliVz4rCZ6yGqG
         gwMA==
X-Gm-Message-State: AOAM533R/4tNxEdHk/QAUhPQLglQ6P4nEjqasV4tWZCajNc4Q5zVi0lD
        PEsJw+yk7OdgrOlLrHpA/T7f/1CQj+RrbA==
X-Google-Smtp-Source: ABdhPJz55jMl6b3k9QurAc7BVgcHwv7YgqQ++RMJeBNkrqx9UgSpqH44KgrXr2cMoU4nLdFb7ybC8A==
X-Received: by 2002:aa7:d41a:: with SMTP id z26mr44229923edq.54.1620818818509;
        Wed, 12 May 2021 04:26:58 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id e19sm16703339edv.10.2021.05.12.04.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 04:26:58 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: media: venus: Add sc7280 dt schema
To:     Dikshita Agarwal <dikshita@codeaurora.org>, andy.gross@linaro.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1619432515-9060-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <f40aa304-2717-4a0b-00ee-e2ca222042e6@linaro.org>
Date:   Wed, 12 May 2021 14:26:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1619432515-9060-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/26/21 1:21 PM, Dikshita Agarwal wrote:
> Add a schema description for the venus video encoder/decoder on the sc7280.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../bindings/media/qcom,sc7280-venus.yaml          | 158 +++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> new file mode 100644
> index 0000000..a258d97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,sc7280-venus.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> +
> +description: |
> +  The Venus IP is a video encode and decode accelerator present

Maybe we can mention that this is Venus Iris2 IP?

> +  on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-venus
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 3
> +
> +  power-domain-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - const: venus
> +      - const: vcodec0

The sm8250 (the same Iris2 IP) has one more MX power domain, I guess we
should have it here too?

> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core_clk
> +      - const: video_cc_mvsc_ctl_axi
> +      - const: iface_clk
> +      - const: vcodec_clk
> +      - const: video_cc_mvs0_ctl_axi

I'd suggest following names:
	core
	bus
	iface
	vcodec_core
	vcodec_bus

> +
> +  iommus:
> +    maxItems: 2
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  video-decoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: venus-decoder
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  video-encoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: venus-encoder
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  video-firmware:
> +    type: object
> +
> +    description: |
> +      Firmware subnode is needed when the platform does not
> +      have TrustZone.
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +
> +    required:
> +      - iommus
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - power-domain-names
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - video-decoder
> +  - video-encoder
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/clock/qcom,videocc-sc7280.h>
> +
> +        venus: video-codec@aa00000 {
> +                compatible = "qcom,sc7280-venus";
> +                reg = <0x0aa00000 0xd0600>;
> +                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
> +                         <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
> +                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +                         <&videocc VIDEO_CC_MVS0_CORE_CLK>,
> +                         <&videocc VIDEO_CC_MVS0_AXI_CLK>;
> +                clock-names = "core_clk", "video_cc_mvsc_ctl_axi",
> +                              "iface_clk", "vcodec_clk",
> +                              "video_cc_mvs0_ctl_axi";
> +
> +                power-domains = <&videocc MVSC_GDSC>,
> +                                <&videocc MVS0_GDSC>;
> +                power-domain-names = "venus", "vcodec0";
> +
> +                interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>
> +                                <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
> +                interconnect-names = "cpu-cfg", "video-mem";

Do we have sc7280 interconnect binding somewhere?

> +
> +                iommus = <&apps_smmu 0x2180 0x20>,
> +                         <&apps_smmu 0x2184 0x20>;
> +
> +                memory-region = <&video_mem>;
> +
> +                video-decoder {
> +                        compatible = "venus-decoder";
> +                };
> +
> +                video-encoder {
> +                        compatible = "venus-encoder";
> +                };
> +
> +                video-firmware {
> +                        iommus = <&apps_smmu 0x21a2 0x0>;
> +                };
> +        };
> 

-- 
regards,
Stan
