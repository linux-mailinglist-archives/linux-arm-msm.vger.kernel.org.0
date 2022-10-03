Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338865F3115
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 15:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiJCNYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 09:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiJCNYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 09:24:52 -0400
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAF4186CF;
        Mon,  3 Oct 2022 06:24:51 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id d74-20020a4a524d000000b004755f8aae16so6710067oob.11;
        Mon, 03 Oct 2022 06:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OnKrZwaq0Jt57yvCbQVUHRHxEgzoHsasBifv2Bty2KE=;
        b=5uMwpJQ8kLBEXkDWEwRhH8JVHdUJV1BKY/K71yb3uXieX+iwRYtF7kzIg818sZDHtp
         zz8bp21/6qOZahDFVz/rCJmJaSnRt5D6iGvvN+yXGyamNdvnRdSweCP+mTfTXFDyPMKi
         /NkMzxBqkVxcXgo97AxKyq6Nfd2Xl/3EBZZN+sKJR3Mepr57HJ6k02lAcBq+d4lEfHK7
         XSpM4AohbEuqr7gP0nq7VXy85LqfCAxXt7CgpmXbw3yiBYBevtqxlB5Gac/9VSzhdtHO
         63QQ+J6kT4/8IXFeSS2wOzOl42kPVQn8QnIdbeoM5kuUDjUIw4d3FcZ/lM8mKg8+WmhW
         A/ww==
X-Gm-Message-State: ACrzQf3ko51JAcUDKTRPweqenHR1DIk0YNTsnGe+ifJv7QscIraJdktj
        9R2w34fTBt7SVRga3FqnSGhQ8+hxHQ==
X-Google-Smtp-Source: AMsMyM70RjizPKS+xH/dW9ysqQ2a01dwioQKxiKTpVZvU9t7QDybTkqUh5VnrP7wNMw8IDb4Cl+UCg==
X-Received: by 2002:a9d:347:0:b0:655:d0f9:ccea with SMTP id 65-20020a9d0347000000b00655d0f9cceamr8055691otv.16.1664803490316;
        Mon, 03 Oct 2022 06:24:50 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e1-20020a9d0181000000b0063b2251a78asm2384045ote.12.2022.10.03.06.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 06:24:49 -0700 (PDT)
Received: (nullmailer pid 1863795 invoked by uid 1000);
        Mon, 03 Oct 2022 13:24:47 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
References: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
Message-Id: <166479586980.1658829.2384820658140545803.robh@kernel.org>
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

