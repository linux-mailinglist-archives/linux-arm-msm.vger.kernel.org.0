Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C170C36BB37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 23:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhDZVbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 17:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235538AbhDZVbg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 17:31:36 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E95C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 14:30:53 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id md17so2344219pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 14:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2ckH4hUfpDdDWwuKa1ZBizdcjSL+I5Wex++8qFAuFSE=;
        b=XTpFrYb10B3+0YojlYf9ZaXG/ustpKd0v0gQZcJ+WZoXI08GHZoSEWj+LTSV6svoq6
         UJE3bLsaixQPJp/Wo4LJE11HKmCZk6dEUv2mpD8Nscn27L2WwRT+4aXlWqV+zvFuBAVe
         8dAIo3/n5zno5DtKrWcGJ+zhmz6PyxcfzCc8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2ckH4hUfpDdDWwuKa1ZBizdcjSL+I5Wex++8qFAuFSE=;
        b=Q08sdNnvLG0Ivj8qlWlsPc4r75LSM/LDs1l7Gf+RHzCX5OmmxGjhbGHiRmROfSe6af
         TcGyycPc7v2fOz4UKE2JK3DoCb+a1NoJPhzSzcBwbS9eVuYeaMLg8PT7duIp9ZV4PaFa
         TNb8ikmbtZCXKJ4BM6VT4PhJbELemkICE6ZyLjStfHzCnZtda+zQH573IsRpeVbESc8z
         JPYy6JIWYCF8FaekK7+Rljvs+VPBvTAGb0sPKce6qQE8N5eD75c/NDd7cR2oxkhOJuRV
         NyZpf8EdAXz147wN/nu9D2rQ3i/HkkBFmGaB+JOaxC89lL8RPqSzrp7CwVYmbfykIjJb
         lcnw==
X-Gm-Message-State: AOAM531EZtefoTLHPcoZcPAERfItVBPCpSfYOCM1yh5W4wsprfjYf0oM
        pMNyCtUTroGHRlV4x6WUxAwbYQ==
X-Google-Smtp-Source: ABdhPJwdkPoaHKsUygkQew9U/igE2xVenGFvoPlLdF3molSYalbVJYhicdBMilL4LHv8J0uTQ6LVzg==
X-Received: by 2002:a17:90a:c7d4:: with SMTP id gf20mr13763967pjb.106.1619472652585;
        Mon, 26 Apr 2021 14:30:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:3a16:de17:8721:d706])
        by smtp.gmail.com with UTF8SMTPSA id d26sm535416pfq.198.2021.04.26.14.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 14:30:52 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:30:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org
Subject: Re: [PATCH] dt-bindings: media: venus: Add sc7280 dt schema
Message-ID: <YIcxCn5ajN8Pu8Vg@google.com>
References: <1619432515-9060-1-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1619432515-9060-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From a quick glance this looks extremely similar to the venus binding
for sc7180. Is there really a good reason for a separate binding?

On Mon, Apr 26, 2021 at 03:51:55PM +0530, Dikshita Agarwal wrote:
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
> -- 
> 2.7.4
> 
