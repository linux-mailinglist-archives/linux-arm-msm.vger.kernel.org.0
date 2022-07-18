Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678A55788C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 19:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbiGRRu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 13:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbiGRRu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 13:50:28 -0400
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264032B608;
        Mon, 18 Jul 2022 10:50:26 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id d4so6392355ilc.8;
        Mon, 18 Jul 2022 10:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qo+O3LtYsVt3ukwggOHDQf2oi2D8i1x0+YuYG/drp00=;
        b=MgsLkKpjp7zveAwRRm1euOrSW9KU0vDiwSJc0smXVApDTU8OdimXtsDLP/youXiwQz
         mKevB4NmF871ra0TV+vFBdzy5GVcRKVueG7BDyBUxZrc9JtNmPcKfo31BqV+1ZIRKDHu
         6vr8tkwOMiZAar0pfVbfCo3XLnaPcA9maXGqOpNjk0I0DIvDMhNDeRo+lxo2l5LeSWax
         fmQ70sMx3jj30ZjGez/l3gnZ4Jwo/GZ5qsN5kwu8PkBlqSL9zqidrM8I8S+DVlYZkjiH
         fa/Aj1DCRjQmVsWOt2wkrehkjzCFYC7FKPH6iyqDMRQve8b3wx4QAeVMA9hQ52a7TUeB
         GXrg==
X-Gm-Message-State: AJIora/5HPbLtLhn4H1Lk0Je7pAzlAejFvR3p898Gemm7Ub7TGSPCjIb
        9/GCkb3aDIqHrTBfDcfFxZ/HeS6aIA==
X-Google-Smtp-Source: AGRyM1vW0jj+2K/+MnMJmlvpDJ+vIEj6eMNRycI2GUzxrkQTlF3EGll5aFibyTPPNbtPr1MMDnGyzA==
X-Received: by 2002:a92:dd82:0:b0:2d9:126:5bed with SMTP id g2-20020a92dd82000000b002d901265bedmr14367423iln.97.1658166625399;
        Mon, 18 Jul 2022 10:50:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y27-20020a02731b000000b0033f51b3b0d9sm5764589jab.138.2022.07.18.10.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:50:24 -0700 (PDT)
Received: (nullmailer pid 3238778 invoked by uid 1000);
        Mon, 18 Jul 2022 17:50:23 -0000
Date:   Mon, 18 Jul 2022 11:50:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 11/11] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <20220718175023.GA3216365-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-12-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 10, 2022 at 12:00:40PM +0300, Dmitry Baryshkov wrote:
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
>  .../bindings/display/msm/dpu-common.yaml      | 42 ++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 43 ++-----------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 39 ++---------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 43 ++-----------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 43 ++-----------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 43 ++-----------------
>  6 files changed, 62 insertions(+), 191 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..14eda883e149
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,42 @@
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
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc.

From the last version:

> In case of MDSS all ports are output, they are connected to the external
> interfaces (DSI, DP, HDMI, etc). The driver uses them to bind available
> interfaces (using components framework). The reg property of the port is
> completely ignored.

It doesn't matter what the driver does or doesn't do. Without 
describing port nodes at all, you are not validating what port nodes 
can contain. Just try adding any property under a port node. You need at 
least:

'^port@[0-N]$':
  $ref: graph.yaml#/properties/port

where N is the max number of ports.

Rob
