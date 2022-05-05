Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA14C51C09B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 15:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236767AbiEEN3y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 09:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236054AbiEEN3x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 09:29:53 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B01E396BA;
        Thu,  5 May 2022 06:26:13 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-e5e433d66dso4189583fac.5;
        Thu, 05 May 2022 06:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=UkGAP5s5laybhc9LkfgTADAzwy+qLXJpEsxF9NHsNJo=;
        b=xRVsmpWgv8fWP8hQmXhaNXNagd7uawNhq6WRQB5I3KOtLsllF/inaHxBgNJifmB39N
         ZT72K/urx/u83HRf+uVhh/tom1124bvFRF7brR9vU6mCqNr8XtOZryv4cfDY7S+4g/T6
         lXZ52I/9+WNmqMUkzqMM1huThoJt+l/EnLYXlnWV5r8IjoiQqL+kWHVhE72ZcEx/Qavu
         CpS/OqGR6gL0VKQtfMuuNTgBkx+cuWKyRmMCBvOJ+YOqhboEjT6q1UXS2VFnrlQVXtiV
         nr2CgSGPupZXGkoOrM4X0/RByEuUxHF4wSDjmxIvz2SXGjUFALgHvZBYpLrqDiAv5gkv
         htRA==
X-Gm-Message-State: AOAM533dQXHmOQ0ElW0Ohj1VixYy38WiHOxh88wNqOWlINzmSqoNVzuu
        FvuR6Qu/IFpHDQI046t+DQ==
X-Google-Smtp-Source: ABdhPJx8mCSXJ/Wk/EpeRCNIPupXZZoCnmb4v8OClohRhyNnEBymrxOoCAOSH4TY2iwjEc8rjLI5eQ==
X-Received: by 2002:a05:6870:8907:b0:e2:a4fd:7539 with SMTP id i7-20020a056870890700b000e2a4fd7539mr2247286oao.56.1651757172462;
        Thu, 05 May 2022 06:26:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v9-20020acade09000000b00325cda1ffa8sm637096oig.39.2022.05.05.06.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 06:26:11 -0700 (PDT)
Received: (nullmailer pid 3739614 invoked by uid 1000);
        Thu, 05 May 2022 13:26:11 -0000
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>
In-Reply-To: <20220505121213.4121802-2-vladimir.zapolskiy@linaro.org>
References: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org> <20220505121213.4121802-2-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: add QCOM SM8450 camera clock bindings
Date:   Thu, 05 May 2022 08:26:11 -0500
Message-Id: <1651757171.146367.3739612.nullmailer@robh.at.kernel.org>
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

On Thu, 05 May 2022 15:12:12 +0300, Vladimir Zapolskiy wrote:
> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
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
./Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
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

