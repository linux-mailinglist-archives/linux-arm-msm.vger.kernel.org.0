Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6DF5B0DAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 22:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiIGUDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 16:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiIGUDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 16:03:39 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546BFBD746;
        Wed,  7 Sep 2022 13:03:37 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id d18-20020a9d72d2000000b0063934f06268so11024288otk.0;
        Wed, 07 Sep 2022 13:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=HJtpL2X+zo8QGiAz4xLcd6dnwWmk0PxaqMgysL3AVC8=;
        b=LXldZzcGQ5+sYKm/PH/BODP88fPa/+wnaoBdWrE37+VWvj0vTM4QRFtzu3UhtUQmfR
         lLFnmnMnsf74b2pWC91x13Nq8HJMb5KcKfWO/msUJKVfGTPCKaAUgPkM1CaPm7v1EcSj
         YyYcabU8WSQ4PHZ67VvJN7r/uP7SGlJSTSXfzTKBFvkyRBMvJp9h0XatybXp1xbozkzE
         yd6h8zdjdL0KoQeMJJR52nrqf9eK+jG59UB1dH2jK1aM3cv14AMznjboPBvRvmOTXmpU
         r9W5t/bsQFMoRk2D+6QwHAErl6iT+I01+Gxlnxz4gPa9jMq5RXdfdQ6i7VjSu7/LH5WQ
         R4Ig==
X-Gm-Message-State: ACgBeo2VlfI7cj/L9sGX3rWvzVRM2pf4i6t0+jXZwtE3BU9pne0tM3n4
        PdA9Uo69y8ZPJ9zGIC13bw==
X-Google-Smtp-Source: AA6agR7IyMO/AfcshwHGYC1fPOTTYCdaa/6reZ0Ew4AMdBfoMVEEfqKL5j7akmLaX8uKO+dYpP2hag==
X-Received: by 2002:a9d:6b15:0:b0:636:deac:5288 with SMTP id g21-20020a9d6b15000000b00636deac5288mr2156093otp.236.1662581016595;
        Wed, 07 Sep 2022 13:03:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z125-20020aca3383000000b00326cb6225f8sm6786337oiz.44.2022.09.07.13.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:03:36 -0700 (PDT)
Received: (nullmailer pid 118890 invoked by uid 1000);
        Wed, 07 Sep 2022 20:03:35 -0000
Date:   Wed, 7 Sep 2022 15:03:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Message-ID: <20220907200335.GA113284-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 01:23:05PM +0300, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 42 ++--------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 52 ++----------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 51 ++----------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 51 ++----------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 55 ++----------
>  .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
>  6 files changed, 116 insertions(+), 218 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> new file mode 100644
> index 000000000000..053c1e889552
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display MDSS dt properties (common properties)

...MDSS common properties

> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |

Don't need '|' if no formatting.

> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc.
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mdss
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    minItems: 1
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> +
> +  ranges: true
> +
> +  interconnects:
> +    minItems: 1
> +    items:
> +      - description: Interconnect path specifying the port ids for data bus
> +      - description: Interconnect path specifying the port ids for data bus

Same description twice...

> +
> +  interconnect-names:
> +    minItems: 1
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +  - ranges
> +
> +additionalProperties: true
> -- 
> 2.35.1
> 
> 
