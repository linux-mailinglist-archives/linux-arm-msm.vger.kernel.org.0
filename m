Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA973669C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 16:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjAMPdo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 10:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbjAMPdU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 10:33:20 -0500
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DC89423A;
        Fri, 13 Jan 2023 07:26:54 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-12c8312131fso22639322fac.4;
        Fri, 13 Jan 2023 07:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PbROUEuIJk+HQe91NY18FTTLvUzGQXQDtdY40/ABZE=;
        b=nu9IWNcY7xo7v/v/EMifLvQYzgEOpL94Ga6v0ECuGHM1fqcWd8w/WZNHxtaEIhsZaI
         6Z6G+EQoEzaeMFXSjCRWSAf9zxHPtgFFQoqcfnsqloYoKBBGiUnnVe/2IPfXhADEqolH
         txayA1FISMh798xZEQHZZFn7VrdcptMP6uCmTbwasNMAZzsGcDYud1lNkNaQ5GFPjaMi
         92crlmkInW4YUTszXpczoz5HQsdvZcOLNEH0oKgfktXAd0Bfj3K0U/RSHlj72dDCiTs0
         O/gp4k9yhd/SAZnBvDguBjXGopDor3n5ab7LKvTzTKcAizqAwUOp/bgKY3u6SympyABO
         FXNQ==
X-Gm-Message-State: AFqh2kqI0jHuSvoqcI8skDUYR9HGAWsOPNcj36icQ0XQ1zjgbv5DaQpV
        azeRPCp+a9tFC0+SqKLuXg==
X-Google-Smtp-Source: AMrXdXs3qrRsk35e5aDRYxcFeHO8M4hoHtTtK5NTH7ZKCs86bZQy6UFOAiOsRQojs+jf/ClrcsasKQ==
X-Received: by 2002:a05:6870:c905:b0:15e:ef68:67cf with SMTP id hj5-20020a056870c90500b0015eef6867cfmr1226310oab.59.1673623613356;
        Fri, 13 Jan 2023 07:26:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m34-20020a056870562200b00143ae7d4ccesm10612793oao.45.2023.01.13.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:26:53 -0800 (PST)
Received: (nullmailer pid 2224492 invoked by uid 1000);
        Fri, 13 Jan 2023 15:26:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        devicetree@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20230113083720.39224-5-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-5-dmitry.baryshkov@linaro.org>
Message-Id: <167362341911.2212079.15291287366051593468.robh@kernel.org>
Subject: Re: [PATCH v6 04/11] dt-bindings: display/msm: rename mdss nodes to
 display-subsystem
Date:   Fri, 13 Jan 2023 09:26:52 -0600
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 13 Jan 2023 10:37:13 +0200, Dmitry Baryshkov wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-5-dmitry.baryshkov@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

