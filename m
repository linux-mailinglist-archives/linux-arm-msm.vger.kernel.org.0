Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF16456D03C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 18:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiGJQyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 12:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiGJQyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 12:54:22 -0400
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8B0CC5;
        Sun, 10 Jul 2022 09:54:20 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id l24so3083223ion.13;
        Sun, 10 Jul 2022 09:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=K1U98b2nQAOqyF/zWDcOQdXgcbNOU9fD4IHpPS4zIGU=;
        b=rsq3AnFcYinHT1T3WdkrQkz7Dvfu+L5fV64Aze7TVDYZav/UKr4PQB77Os2GZspVG4
         TP11kxmzD6G78S5SuhZYumnEDLyOCGmiZ/oh4FffKUwK+i5YaOFlwz0Ke1d5G9mXAk53
         Vh2adF6BJhMCDgPFrX1O4yDad3tr6i1p1fPHHTMT93Y+fPwEpIEwSMDX2cPDpNvD0sX8
         Q64/p0O+l4GjLRkQ9FeHxTcfZLeIDMM1aqlr+sReCn7FDBaofsUynnimBZJ+BqGlNNot
         rZMJh6+ja665hwAwVkQV0ZRtY0GpJzSHg6xwEqjJXlpF1spTfrfaMKy+xsnVyPIsSkCS
         qiCw==
X-Gm-Message-State: AJIora+/ecTW8UbXTCm7vE3YLDV00wePSg8obMNlkPLoS8Ci4umuojgp
        r2y12cFM7djhLjj7oDgWvg==
X-Google-Smtp-Source: AGRyM1sA6wNkB+tjSCRg0xPTzMooxjxM/3jkVUsmV677/VUB10SU0wOJ/0vYKqwZxyIsK+4BV5XdIg==
X-Received: by 2002:a05:6638:264d:b0:33c:ba2d:72e6 with SMTP id n13-20020a056638264d00b0033cba2d72e6mr7725563jat.173.1657472060018;
        Sun, 10 Jul 2022 09:54:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f6-20020a02a046000000b00339eedc7840sm1953954jah.94.2022.07.10.09.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 09:54:19 -0700 (PDT)
Received: (nullmailer pid 1602130 invoked by uid 1000);
        Sun, 10 Jul 2022 16:54:16 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
        Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org> <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: display/msm: split qcom, mdss bindings
Date:   Sun, 10 Jul 2022 10:54:16 -0600
Message-Id: <1657472056.252419.1602129.nullmailer@robh.at.kernel.org>
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

On Sun, 10 Jul 2022 12:00:33 +0300, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added (optional) "core" clock added recently to the mdss driver
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>  .../devicetree/bindings/display/msm/mdss.yaml | 161 ++++++++++++++++++
>  2 files changed, 162 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/msm/mdss.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/phy/qcom,hdmi-phy-qmp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

