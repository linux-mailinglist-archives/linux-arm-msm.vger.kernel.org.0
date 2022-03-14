Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2864D8722
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Mar 2022 15:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240052AbiCNOoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 10:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240020AbiCNOoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 10:44:10 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E342AE6;
        Mon, 14 Mar 2022 07:42:59 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id d62so18406840iog.13;
        Mon, 14 Mar 2022 07:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=AqFg7xrs3Geyfxo5Vr0DOQb5idtAj8J/XERgXrBpIrU=;
        b=DXk7Ms8ncO3F0RgAwItJeuf6ojvyf4bbklDoNpSCZ+KhrG1+krrCCn7ZAUNLETNPEg
         M00vQlzBVL/zoPI5F6NUrhMY4d0/p/DwAM/0GDlQhgwqTuZJDH7xWh4M3x9+10ONv19j
         RZ3oHzKYamIlN3IfPYEXDuK+rAGSMhkYEL5n9Wcw0t4vNWJA0CgRGlH1soobbFgzNnf/
         wEzP1AkJKDLvnpcbTJ0VUOzUh0jQ+XTHnn1mK4f3SXPKoL2V4z+95wHXHERy/YxryXp4
         HjPdaJWAPDYRZzcaa8glPYl7zMsAvw9/aayvZGbrlImnIkiquwHqvaZUywpslyrTAl+5
         raBw==
X-Gm-Message-State: AOAM533Sv97P8M7B1IivRs2HaLPFp6JPsfKXNpX7vtj3rJ1pCwdHQySP
        XogjGPaaV4We5Pd9vQdrkw==
X-Google-Smtp-Source: ABdhPJwFTcp79lodU884hJVkoWne5DgyZnLhnKAbJFb9GtejUeLRtjVys1pJd7RPg/rUb1YbHKAp+Q==
X-Received: by 2002:a05:6638:108:b0:319:99c7:5a69 with SMTP id x8-20020a056638010800b0031999c75a69mr21008718jao.297.1647268979081;
        Mon, 14 Mar 2022 07:42:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a13-20020a056e02180d00b002c77c357fcfsm5500032ilv.76.2022.03.14.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 07:42:58 -0700 (PDT)
Received: (nullmailer pid 12513 invoked by uid 1000);
        Mon, 14 Mar 2022 14:42:49 -0000
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20220314114211.1636574-2-vladimir.zapolskiy@linaro.org>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org> <20220314114211.1636574-2-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: add QCOM SM8450 camera clock bindings
Date:   Mon, 14 Mar 2022 08:42:49 -0600
Message-Id: <1647268969.345129.12512.nullmailer@robh.at.kernel.org>
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

On Mon, 14 Mar 2022 13:42:10 +0200, Vladimir Zapolskiy wrote:
> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v1 to v2:
> * updated qcom,camcc-sm8450.yaml according to review comments from Rob,
> * changed qcom,camcc-sm8450.h license to dual one.
> 
>  .../bindings/clock/qcom,camcc-sm8450.yaml     |  89 ++++++++++
>  include/dt-bindings/clock/qcom,camcc-sm8450.h | 159 ++++++++++++++++++
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8450.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.example.dts:30.34-35 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1605035

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

