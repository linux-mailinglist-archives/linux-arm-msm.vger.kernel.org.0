Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F33266287C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 15:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbjAIOak (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 09:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbjAIOaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 09:30:39 -0500
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A2F11A21;
        Mon,  9 Jan 2023 06:30:38 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id v70so7234320oie.3;
        Mon, 09 Jan 2023 06:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEtiZmOlPmj7+0osikAlaU0wda2snqapMro7/OnMBS0=;
        b=TRlHox4sidR+4YNfMnuCgWc0Z+Ndhi5zcTvxh/1arDXjORv4q0eU+Gm8cQ4lLbC2TA
         vxNpEG1c/JkJzzie41f+jVwGi3gOPKYimsTLGLtiK2JZL0e9KWf6DXsKpNkxaxD+sr36
         FVfmmHvHStxwTKGeC9GocnRp8O15bW0AbOILz7C0vJqlAvotoKZeTfHKIO6dYgbNqpea
         xSBcmYPOQeSDXm0VCZCvzQUcW8aSRdn8EGGZGHR0hvahZ+4HGgfs0ehmR2LWIW3RcQi5
         PRvWCtQWzeeUMfRwCFGg0NTeuRjvZeSiepiKUaML5p4D57Iw32Iw9wNa1zghIuF6m6WH
         srkA==
X-Gm-Message-State: AFqh2kpE1gwmv0ArXQbnbj9kW8w0s0csvqy7NQUjhv7Tw6EOC2gFyPo5
        CxOALg4EqEzLWGSZyw+/rg==
X-Google-Smtp-Source: AMrXdXs63wOixqgxtIDGY1yMIvVV753STG4GiVydHxCYw4oCKfkBAipIkbRYpm/4/gnUVlrsgDcEtg==
X-Received: by 2002:a05:6808:2b08:b0:363:1449:1614 with SMTP id fe8-20020a0568082b0800b0036314491614mr31278725oib.2.1673274637390;
        Mon, 09 Jan 2023 06:30:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a7-20020a056808098700b0034d9042758fsm3973459oic.24.2023.01.09.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 06:30:36 -0800 (PST)
Received: (nullmailer pid 237512 invoked by uid 1000);
        Mon, 09 Jan 2023 14:30:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>
In-Reply-To: <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
 <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
Message-Id: <167327376625.60943.17966814849467816091.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: rename mdss nodes to
 display-sybsystem
Date:   Mon, 09 Jan 2023 08:30:36 -0600
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 09 Jan 2023 07:13:57 +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdss nodes to
> display-subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230109051402.317577-2-dmitry.baryshkov@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

