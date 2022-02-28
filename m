Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA88D4C7087
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 16:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbiB1P1j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 10:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237124AbiB1P1i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 10:27:38 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92417EA1F;
        Mon, 28 Feb 2022 07:26:59 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id k9-20020a056830242900b005ad25f8ebfdso9750662ots.7;
        Mon, 28 Feb 2022 07:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=rp3jXo0jowUC07M1Ixk3RLOx4sQHBELJ5AB4vK2RiB0=;
        b=NCzFGVTq9yoWwrJnaOzU3Jom6JqG35Oo51bf7+5y7XkznEGReD/sV3PIFy3rpBaGex
         lOesXSHyqGBQW+Q16mDMMCuGfvuI1pGqq67d3ew+NltQFJp0HGdDa0rQbZ6IyEVI+Hoi
         HuyHhFkPJhh05F1prnRIbTknPhtKPawD6qYswE4Qbd/DLwqG1HDRPYzb3+b2tIenyqJO
         FGPq4nYCSV457HHQz8RWD/wYW+NYR2Kj4C736oBvSQWBgAQZTU2YJAq7uVrf8k00vl9T
         pL3NWKAEZNS+2ZkxqTHTNbzKX/hh2ukZp3OwSu2wshDJwA7RTtxw1hacviE8yvDjDK+y
         lHhA==
X-Gm-Message-State: AOAM530JceXtB3tOIAPUUcbpULNx9Y25QYnvpVcCflSLEPJx6HF3kF09
        /x64UCD4bi/NKuLmkQq/W+Rwq5W9jw==
X-Google-Smtp-Source: ABdhPJzxNAQPBbD8i478ScZWaCVovchVyiuczqMyUQ+9KiVnrzkL5S4/6wCNr6VwhVqnrJvmXiaSxw==
X-Received: by 2002:a9d:71de:0:b0:5ad:32a4:4a9b with SMTP id z30-20020a9d71de000000b005ad32a44a9bmr9296658otj.336.1646062019011;
        Mon, 28 Feb 2022 07:26:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id fq14-20020a0568710b0e00b000d4492531a2sm4805518oab.17.2022.02.28.07.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 07:26:58 -0800 (PST)
Received: (nullmailer pid 1049707 invoked by uid 1000);
        Mon, 28 Feb 2022 15:26:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20220228120258.997027-2-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org> <20220228120258.997027-2-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 1/8] dt-bindings: clock: add QCOM SM8450 camera clock bindings
Date:   Mon, 28 Feb 2022 09:26:56 -0600
Message-Id: <1646062016.591692.1049706.nullmailer@robh.at.kernel.org>
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

On Mon, 28 Feb 2022 14:02:57 +0200, Vladimir Zapolskiy wrote:
> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/clock/qcom,camcc-sm8450.yaml     |  87 ++++++++++
>  include/dt-bindings/clock/qcom,camcc-sm8450.h | 159 ++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8450.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.example.dts:28.34-35 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1598821

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

