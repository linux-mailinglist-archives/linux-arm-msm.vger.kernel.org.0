Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913E453C9F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 14:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244403AbiFCMZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 08:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244395AbiFCMZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 08:25:14 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5FB3A5C9;
        Fri,  3 Jun 2022 05:25:13 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-f2e0a41009so10392159fac.6;
        Fri, 03 Jun 2022 05:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=YZtN1F0Qk9NbbCUaUPvkdQ1eLPQxxxaqqx36o3Sni5k=;
        b=7D8I6vv8Lo2I6NelwLtAOPQvVz+QUj67zjUst5AWEwAjBZhZ6ppJNW15jyRFnxXbj1
         69AmvfKnxuM070OpaRPYw6KHvqdSnGVVLLdSrEA4+2CW8XZOjwiHVrAKohcH6pAAQTVm
         olAp+E1eJf9+zMuLWp21LXyEsHyYVS+3AqljQbYva9/1dco3nBZECYebl31bbS5aculQ
         Cp2KANOsWsgXp/NsuQRy5/SQTD9UzmgJ+Yoay4VT0Pw6vcH3gFAsmmBlawnwQuc/qD7P
         KosZAwRvBimaKplPudsSocXZXdaoMX6YD4CZ6CGSVBWu0annCYbW9ztx4xaMk070CcUg
         WG8g==
X-Gm-Message-State: AOAM531Bv5DXP8AMCmlkwlms0hnImrxViL4ERFA1dwl5PlgAr9FSAT8d
        u7/WxPQSdrxdFEXFw0G36q2XAhoN2w==
X-Google-Smtp-Source: ABdhPJxSVrqRYKsD/zB7jTBr5ppoHfux9/u9Rnk3J/ggqOIFhHqD+yh/Q/u1OQq9Kf6x2ZnC3jgxgQ==
X-Received: by 2002:a05:6870:c6a0:b0:f5:cf37:63a3 with SMTP id cv32-20020a056870c6a000b000f5cf3763a3mr5338923oab.288.1654259112858;
        Fri, 03 Jun 2022 05:25:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c30-20020a056830349e00b00605da994088sm3531447otu.2.2022.06.03.05.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:25:12 -0700 (PDT)
Received: (nullmailer pid 136419 invoked by uid 1000);
        Fri, 03 Jun 2022 12:25:11 -0000
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220603080019.2251764-2-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org> <20220603080019.2251764-2-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: clock: add QCOM SM8450 camera clock bindings
Date:   Fri, 03 Jun 2022 07:25:11 -0500
Message-Id: <1654259111.699187.136418.nullmailer@robh.at.kernel.org>
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

On Fri, 03 Jun 2022 11:00:18 +0300, Vladimir Zapolskiy wrote:
> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v5 to v6:
> * added Rob's tag.
> 
> Changes from v4 to v5:
> * fixed a typo in a usage example found in the yaml file.
> 
> Changes from v3 to v4:
> * renamed a filename in $id value after the rename of the file itself.
> 
> Changes from v2 to v3:
> * renamed files to match the compatible value "qcom,sm8450-camcc",
> * fixed a typo in a usage example found in the yaml file.
> 
> Changes from v1 to v2:
> * updated qcom,camcc-sm8450.yaml according to review comments from Rob,
> * changed qcom,camcc-sm8450.h license to dual one.
> 
>  .../bindings/clock/qcom,sm8450-camcc.yaml     |  89 ++++++++++
>  include/dt-bindings/clock/qcom,sm8450-camcc.h | 159 ++++++++++++++++++
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.example.dtb: clock-controller@ade0000: reg: [[0, 182321152], [0, 131072]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

