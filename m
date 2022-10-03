Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30CB05F3130
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 15:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbiJCNZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 09:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiJCNZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 09:25:05 -0400
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3607523BE9;
        Mon,  3 Oct 2022 06:25:01 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1326637be6eso3215968fac.13;
        Mon, 03 Oct 2022 06:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OnKrZwaq0Jt57yvCbQVUHRHxEgzoHsasBifv2Bty2KE=;
        b=dJhooT2prPLJEWtlbn/olNnS6H08idtBDC2Cqk8Bsd6JIH2dCn8pfn7ulaOKrVk1aB
         2Dgzdv00YseW6QS/YmX61ggKeVsQJmk2Urw3OLEV5zkFDGJcH+0/wjCX6no7c8rEsh4Q
         +g5nrVQdZtFZ4jmuEwiVB7wZ53+hfc9Uf7gXUkgIbkSy+syiNjC5DH11bUlC5JQoj9Aq
         cCk3VYBNSTVCfKOl0BzSchaVvBNHeeK6VMvKw0di+uofYj2zvQlhQkbf4Ev96O9VfRZs
         VijxyyvJ/fjBhEtgLKkHNK5Yy0j9BiiWLk4yFzX92Z7NE8au8VrPkQu01Rf1f8sfip9d
         TomA==
X-Gm-Message-State: ACrzQf1lfOPBYhUHsF/cqh9GCjyeIYfMPqF0nyRjzCDFVdHxg4bEDbvX
        ODpiOZIiCUGI9R+ngJaHbA==
X-Google-Smtp-Source: AMsMyM6MYDUKqaKwyW65twRhxUvBzhA6efHAv3ewrpiPTSsmtzjLDbt4KFT8rwwyVhLrCb9lqUpZgA==
X-Received: by 2002:a05:6870:899d:b0:12c:5f78:328b with SMTP id f29-20020a056870899d00b0012c5f78328bmr5434913oaq.94.1664803499496;
        Mon, 03 Oct 2022 06:24:59 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l3-20020a9d7083000000b006561d30cdc2sm2437498otj.23.2022.10.03.06.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 06:24:59 -0700 (PDT)
Received: (nullmailer pid 1863797 invoked by uid 1000);
        Mon, 03 Oct 2022 13:24:47 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
In-Reply-To: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
References: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
Message-Id: <166479587079.1658870.3052831186469578938.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,spm: support regulator SAW2 devics
Date:   Mon, 03 Oct 2022 08:24:47 -0500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 01 Oct 2022 02:14:16 +0300, Dmitry Baryshkov wrote:
> Merge qcom,saw2.txt bindings to existing qcom,spm.yaml. This fixes
> compatibility of qcom,spm schema with regulator SAW2 devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/arm/msm/qcom,saw2.txt | 58 -------------------
>  .../bindings/soc/qcom/qcom,spm.yaml           | 44 +++++++++-----
>  2 files changed, 30 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,spm.example.dtb: power-controller@2099000: '#power-domain-cells' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/power-domain.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

