Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E16251C5F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 19:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243956AbiEERWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 13:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiEERWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 13:22:33 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB595C767;
        Thu,  5 May 2022 10:18:49 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-d39f741ba0so4829984fac.13;
        Thu, 05 May 2022 10:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=i1FuK5FUH4jQkE/QUvHNMXEN4JGRJ3wRdrdO6vSKNH8=;
        b=m8LPjnSlH3DuHRLFRjSW5bgP0CKJKjjX2wBLRb1NaFfDwLGraoW+6gjkH+F6vv9nn9
         F6yRROLmTN7+ARrliG7r68aiFmNcY5/NvMSCTDg++JFr5IIGCJTqU3hwFWicU3EOqxcV
         Zb3oEeQ+gHMPWiMAd/Th2+hQlUOMOUvwkm0iO/E4KxuUPF19kwf9TJ2kLerf0zdcUv2w
         XXCDR5dGm4HSPlvmQC91wJOkhcc/mp8aOPje7WMm23V4i9FtzJobF3m2uFsvqWKA7jRs
         PL34ZF0K0dtXgxIdPk7jpArLzMKRp8PSbKEwzzNCL3ZeURNRCweCD1uOqddFdyUUAgt2
         F9QA==
X-Gm-Message-State: AOAM530vO8dULrz2ox69eQqRRSsvJ06HORoiZZUByvtYHMC/VtfioZYN
        I558ho+3L5AsST97J30llA3ou0UvqA==
X-Google-Smtp-Source: ABdhPJxzT+pTHTDszz2pfvOrtWv4acL4k7h/zqwbkBsyulCWx6EVuH+/tZ8j1qKsMV5Psl7R+xn3XA==
X-Received: by 2002:a05:6870:a70a:b0:d9:aea4:a62 with SMTP id g10-20020a056870a70a00b000d9aea40a62mr2853687oam.143.1651771129040;
        Thu, 05 May 2022 10:18:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u6-20020a4ad0c6000000b0035eb4e5a6d4sm959505oor.42.2022.05.05.10.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 10:18:48 -0700 (PDT)
Received: (nullmailer pid 4062673 invoked by uid 1000);
        Thu, 05 May 2022 17:18:47 -0000
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org
In-Reply-To: <20220505134408.4124575-1-vladimir.zapolskiy@linaro.org>
References: <20220505121213.4121802-2-vladimir.zapolskiy@linaro.org> <20220505134408.4124575-1-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: add QCOM SM8450 camera clock bindings
Date:   Thu, 05 May 2022 12:18:47 -0500
Message-Id: <1651771127.625482.4062672.nullmailer@robh.at.kernel.org>
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

On Thu, 05 May 2022 16:44:08 +0300, Vladimir Zapolskiy wrote:
> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v3 to v4:
> * renamed a filename in $id value after the rename of the file itself
> 
> Changes from v2 to v3:
> * renamed files to match the compatible value "qcom,sm8450-camcc",
> * fixed a typo in a usage example found in the yaml file.
> 
> Changes from v1 to v2:
> * updated qcom,camcc-sm8450.yaml according to review comments from Rob,
> * changed qcom,camcc-sm8450.h license to dual one.
> 
> .../bindings/clock/qcom,sm8450-camcc.yaml     |  89 ++++++++++
>  include/dt-bindings/clock/qcom,sm8450-camcc.h | 159 ++++++++++++++++++
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.example.dts:30.34-35 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

