Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2255B0D9B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 21:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiIGT7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 15:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiIGT7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 15:59:06 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1151BBD0B2;
        Wed,  7 Sep 2022 12:59:06 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-12803ac8113so5445093fac.8;
        Wed, 07 Sep 2022 12:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vEqVd2k+2TAPs8cnrAp8dbyIOEfZe94ggvuKkbHBjfE=;
        b=SCc0kw3GbX5UlDY9obtggfeeW7iLIcriiZaHp1h/9VLsiYprKARxPikyOVABnr+3to
         IR67h5Hw+kdrbGRNUnK/jhlBf1gW8gmrDEBuM11XDs2MWuBpkDuOPEqywmz9ute1QiH2
         5uLfANdOkXne0qQu0LWs1T1SmhZORoQlFHeOPy6GPLjW3NgV97ysvZdkVoc85yTdRFuV
         uIPbAL1lgB8jpp3BlyWJninr+1RZ/IlPCAdMt4D9EzE7jTOAM3kGP1mOWMidCTUzJZO3
         XyUm3ACdNERCoqjHlBnWxXTHBuNyJr6nWuqcK0sJq//kHypkXeXFSDzMAxIOvqwwlxDx
         ngvQ==
X-Gm-Message-State: ACgBeo1TE+TgvXdDuh3NtRXUR+7WaljUG1SSc2ntZJ4gneGvXXzm0OpW
        Kwma1v1bHbT6Pm6vhrm6pA==
X-Google-Smtp-Source: AA6agR7v7B3ZgVF/EuigyxD9vJaQk60vlALu+YF0C/uZRmm7ur/lJ+s7NOO5kAzLaxANl0JMB10s/A==
X-Received: by 2002:a05:6870:d209:b0:127:5f0b:e18 with SMTP id g9-20020a056870d20900b001275f0b0e18mr69292oac.47.1662580745319;
        Wed, 07 Sep 2022 12:59:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e14-20020a056870c0ce00b0010e73e252b8sm5936082oad.6.2022.09.07.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:59:05 -0700 (PDT)
Received: (nullmailer pid 111227 invoked by uid 1000);
        Wed, 07 Sep 2022 19:59:04 -0000
Date:   Wed, 7 Sep 2022 14:59:04 -0500
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
Subject: Re: [PATCH v6 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <20220907195904.GA98468-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
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

On Thu, Sep 01, 2022 at 01:23:04PM +0300, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 44 ++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 46 ++-----------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 41 ++---------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 45 ++----------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 45 ++----------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 46 ++-----------------
>  6 files changed, 64 insertions(+), 203 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..bf5764e9932b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,44 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties (common properties)
> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |
> +  Common properties for QCom DPU display controller.
> +
> +properties:
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc.

Haven't we been over this already?

You have to define 'port' nodes or else anything is allowed in them 
(and endpoint nodes). If you want to define them as pattern, then fine. 
But you must have a ref to graph.yaml#/properties/port.

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
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> index 253665c693e6..0d6743eabd27 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> @@ -62,7 +62,10 @@ patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
>      description: Node containing the properties of DPU.
> -    additionalProperties: false
> +    unevaluatedProperties: false
> +
> +    allOf:
> +      - $ref: /schemas/display/msm/dpu-common.yaml#

Don't need allOf here. (and elsewhere)

Rob
