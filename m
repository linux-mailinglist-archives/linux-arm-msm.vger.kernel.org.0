Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C59637BBC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 May 2021 13:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhELLaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 07:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhELLaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 07:30:23 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E3FC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 04:29:15 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id c22so6337863ejd.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 04:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p+0YOYaRxbFMw+uL/7LtmKF1N1pHhWl+ZjgZZT1HKoQ=;
        b=W8dni7W2/iKgS4s2GmvXABI+I7ETlzol9q3RpkgFQySHdK+VDlAE6ew5oXAPqATjm9
         wrul/me2EACVtHMa53KKBcN+eUiqjrMM0921B/LZ9NrtyCn1G3RQLdcQHm6JueRmE1/A
         TP4pIbR4ayOBSsPGd4Q6wHerDj0ayHkA8SoaDeNETd6VJyn0THlOVD9te6/ZN18P79wb
         /U1oP3btpGXtHPAGujnt4z2eEpowEl6rd4RaOXwTareGC9yAzdTcgnZZb0ORJchuYDWn
         5pycrTSliO6DjWh8/gadoKH1bTAX31ymM9G2iKouHD3+BZS/8WtzrK6ocW4Qyc2jstbx
         FnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p+0YOYaRxbFMw+uL/7LtmKF1N1pHhWl+ZjgZZT1HKoQ=;
        b=dPtJGp914Nmdu+6yU2cVe9AK4DCzUQBAFM6GHPEih5LbMrA0L7Q5WM/FTPad8mSV3j
         538SzBtWHDf3t8kIVueVdLJH/ygTWETUBYildn2JKftwvbFsuBdfLVzNTfexypC9nOJz
         bFvuc4x7ngHhfHNbq6r6UdUR2aLD3M0fBnkkZS81ycK9DZUOIXBNuKnILaRvxnLZi/FH
         2nfmD8CoCvqInkj5Hvx0C6l82nYGOpgib6MPiuF/dNCd6UI4cMQTosQfVY17f2CfVK2Q
         BUKP+TZey9tUQCXz8S0hj0u3VOlHQ3I41jcYy+LlVKRQ1fcF7ryV/y64pe2egurmeKCW
         YQcA==
X-Gm-Message-State: AOAM531Cfkj1xPGcVx1+htP9XOixRcVesm/DW9J+WkKnD+DM4B/+JyHS
        PfkUhUE5emPUPmjgoKZ8LqjWNw==
X-Google-Smtp-Source: ABdhPJzL08mwriKdnUFL09Ht5rZVvMocAji4D4B8Fc4kXVLPRlSuuoSNBe7aObKe+/5HLEsJstaYng==
X-Received: by 2002:a17:907:766d:: with SMTP id kk13mr37418524ejc.417.1620818954369;
        Wed, 12 May 2021 04:29:14 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id o22sm17412576edq.60.2021.05.12.04.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 04:29:14 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: media: venus: Add sc7280 dt schema
To:     Matthias Kaehlcke <mka@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1619432515-9060-1-git-send-email-dikshita@codeaurora.org>
 <YIcxCn5ajN8Pu8Vg@google.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9871b811-f018-eac8-1816-72f982c2b82a@linaro.org>
Date:   Wed, 12 May 2021 14:29:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIcxCn5ajN8Pu8Vg@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 4/27/21 12:30 AM, Matthias Kaehlcke wrote:
> From a quick glance this looks extremely similar to the venus binding
> for sc7180. Is there really a good reason for a separate binding?

The Venus IP is different (newer) for sc7280 (Iris2 vs AR50), and I
think it is clearer if we have separate yaml for it.

> 
> On Mon, Apr 26, 2021 at 03:51:55PM +0530, Dikshita Agarwal wrote:
>> Add a schema description for the venus video encoder/decoder on the sc7280.
>>
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  .../bindings/media/qcom,sc7280-venus.yaml          | 158 +++++++++++++++++++++
>>  1 file changed, 158 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
>> new file mode 100644
>> index 0000000..a258d97
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
>> @@ -0,0 +1,158 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/media/qcom,sc7280-venus.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Venus video encode and decode accelerators
>> +
>> +maintainers:
>> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> +
>> +description: |
>> +  The Venus IP is a video encode and decode accelerator present
>> +  on Qualcomm platforms
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sc7280-venus
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  power-domain-names:
>> +    minItems: 2
>> +    maxItems: 3
>> +    items:
>> +      - const: venus
>> +      - const: vcodec0
>> +
>> +  clocks:
>> +    maxItems: 5
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core_clk
>> +      - const: video_cc_mvsc_ctl_axi
>> +      - const: iface_clk
>> +      - const: vcodec_clk
>> +      - const: video_cc_mvs0_ctl_axi
>> +
>> +  iommus:
>> +    maxItems: 2
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  video-decoder:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: venus-decoder
>> +
>> +    required:
>> +      - compatible
>> +
>> +    additionalProperties: false
>> +
>> +  video-encoder:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: venus-encoder
>> +
>> +    required:
>> +      - compatible
>> +
>> +    additionalProperties: false
>> +
>> +  video-firmware:
>> +    type: object
>> +
>> +    description: |
>> +      Firmware subnode is needed when the platform does not
>> +      have TrustZone.
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - iommus
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - power-domains
>> +  - power-domain-names
>> +  - clocks
>> +  - clock-names
>> +  - iommus
>> +  - memory-region
>> +  - video-decoder
>> +  - video-encoder
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +        #include <dt-bindings/clock/qcom,videocc-sc7280.h>
>> +
>> +        venus: video-codec@aa00000 {
>> +                compatible = "qcom,sc7280-venus";
>> +                reg = <0x0aa00000 0xd0600>;
>> +                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
>> +                         <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
>> +                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>> +                         <&videocc VIDEO_CC_MVS0_CORE_CLK>,
>> +                         <&videocc VIDEO_CC_MVS0_AXI_CLK>;
>> +                clock-names = "core_clk", "video_cc_mvsc_ctl_axi",
>> +                              "iface_clk", "vcodec_clk",
>> +                              "video_cc_mvs0_ctl_axi";
>> +
>> +                power-domains = <&videocc MVSC_GDSC>,
>> +                                <&videocc MVS0_GDSC>;
>> +                power-domain-names = "venus", "vcodec0";
>> +
>> +                interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>
>> +                                <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
>> +                interconnect-names = "cpu-cfg", "video-mem";
>> +
>> +                iommus = <&apps_smmu 0x2180 0x20>,
>> +                         <&apps_smmu 0x2184 0x20>;
>> +
>> +                memory-region = <&video_mem>;
>> +
>> +                video-decoder {
>> +                        compatible = "venus-decoder";
>> +                };
>> +
>> +                video-encoder {
>> +                        compatible = "venus-encoder";
>> +                };
>> +
>> +                video-firmware {
>> +                        iommus = <&apps_smmu 0x21a2 0x0>;
>> +                };
>> +        };
>> -- 
>> 2.7.4
>>

-- 
regards,
Stan
