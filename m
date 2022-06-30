Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424935626CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 01:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbiF3XMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 19:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbiF3XMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 19:12:15 -0400
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB6559266;
        Thu, 30 Jun 2022 16:12:01 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id w10so368764ilj.4;
        Thu, 30 Jun 2022 16:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JR5S4FbFlm7AB5LCYD9+AL7FKrg6jOTlb2pwSAOVR1Q=;
        b=aHiUSHZmpfGLR0+cVIViN//sa5e4nxnUqN0Q1zvYLAhNQ4DdAYmygnIgKLo7NWO39a
         glp8hW0UfDEGt7BcotQ6P5CTtmGz9Hxz83mlnd4we0N4qR68YsbDRBQ5Ga7jV1ntHl7G
         u9C0GMdfCVkD5Xiz08hSo6CT3NCSjivv0lcv6WMPatFr3fJZTvmPYqgLGYgqm93lzN8L
         nrH8xNWXrYd7yDZWY/Gv/nHACVA6Y/Q0ot5caFzT87oqg+ftIwS6cnsv/YAIjWpUwv3W
         b7Se/GLv8LnxykhS8dzszCh7n/Dne1bLDky3abFTEjPFmAwNrRXmG6BPJ1AJX1+cgcBY
         mnxw==
X-Gm-Message-State: AJIora+xA8WHAvkVWtYGdwFulT2OGs8F5j4J5X81P++Cez8bLQ1A1psA
        oNnrptSyyBZ8ut2BoGCqTQ==
X-Google-Smtp-Source: AGRyM1uBaPXhKWPlpc8IwKyqrezf9NwpIw7AH2Glps8IXHvnspekczjlquysBEytKUZDVq41aMdZkg==
X-Received: by 2002:a05:6e02:1845:b0:2da:bc96:8ab2 with SMTP id b5-20020a056e02184500b002dabc968ab2mr6657738ilv.22.1656630721191;
        Thu, 30 Jun 2022 16:12:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j194-20020a0263cb000000b00331f8fff9a3sm9119127jac.64.2022.06.30.16.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 16:12:00 -0700 (PDT)
Received: (nullmailer pid 3506024 invoked by uid 1000);
        Thu, 30 Jun 2022 23:11:59 -0000
Date:   Thu, 30 Jun 2022 17:11:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 11/11] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <20220630231159.GA3497845-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625232513.522599-12-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 26, 2022 at 02:25:13AM +0300, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 47 +++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 28 ++---------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 29 ++----------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 32 ++-----------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 32 ++-----------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 32 ++-----------
>  6 files changed, 67 insertions(+), 133 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..f3465ee3a4ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,47 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties (common properties)
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |
> +  Device tree bindings for the DPU display controller, common properties.

Common properties for QCom DPU display controller

> +
> +properties:
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

Now this schema is applied twice.

> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc. Each output port contains an endpoint that
> +      describes how it is connected to an external interface.

This description is marginally useful. Each port will say it is an 
output to X. So you could just remove.

> +
> +patternProperties:
> +  (mdp-)?opp-table:
> +    $ref: /schemas/opp/opp-v2.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - interrupts
> +  - power-domains
> +  - operating-points-v2
> +  - ports
> +
> +additionalProperties: true
