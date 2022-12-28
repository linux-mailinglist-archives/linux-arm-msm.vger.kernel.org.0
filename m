Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1681965853C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 18:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiL1RQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 12:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234855AbiL1RQv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 12:16:51 -0500
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459DCB87E;
        Wed, 28 Dec 2022 09:16:50 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id n63so8543948iod.7;
        Wed, 28 Dec 2022 09:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kws3uwMtrY+FuMqLAlK4QwrZhceDZCqUsibK8/wgUTM=;
        b=wFCwi63MzHQp192uxhIB8AMFRsIGy9ipOHJ6vJ/UUibimRSGSC+AQem9eqPrlQ9Cgc
         eGOeuqLAbh2UqmUaW26gvRlLCZG7q45h3/0XjAE0PJIbg6hatmyV5YY413q6FEhTfzp5
         Pnt7S+6q1A2k2jG+ijaYuMi4MbxkqK0XSzPtlI2sgvqEKaf8TlfWO3MeoxYefLjxFHYN
         iL+Tx1aiw6j1WsFYKKTN8AE+mUUeNipW4wzsdOtMkkwSRpLPYTRxeRBaefif9Gmgxiqs
         pb1srL13Th+iBGrtQrHunzzJGVATy1D7mSlBgrEsznVo6/2QVMNUOE/zc8lvWo/4NP3r
         CAUw==
X-Gm-Message-State: AFqh2kpBEj4RyLg0xJHQT4THeU/9LK1jVLWOUY3WIMUZ4/RmJzjJJUyQ
        mzIFmsIeBa9c0tOMnr8c+sw4bj+o/Q==
X-Google-Smtp-Source: AMrXdXsxtfXIdRf6NFPgIYsJl+SBmJxdpwxCgbwPWzfTt0i1r4DbvWN9npBTHgWET7TqkG0cH9wIkw==
X-Received: by 2002:a5e:db4d:0:b0:6df:427:1ecd with SMTP id r13-20020a5edb4d000000b006df04271ecdmr26901601iop.8.1672247809362;
        Wed, 28 Dec 2022 09:16:49 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b10-20020a056638388a00b00374fbd37c72sm5350795jav.147.2022.12.28.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 09:16:48 -0800 (PST)
Received: (nullmailer pid 1928463 invoked by uid 1000);
        Wed, 28 Dec 2022 17:16:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20221228133243.3052132-2-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-2-dmitry.baryshkov@linaro.org>
Message-Id: <167224753985.1921575.2829498629927482782.robh@kernel.org>
Subject: Re: [PATCH 01/16] dt-bindings: clock: qcom,gcc-msm8998: drop
 core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 11:16:44 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 28 Dec 2022 15:32:28 +0200, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml | 4 ----
>  1 file changed, 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.example.dts:31.9-10 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221228133243.3052132-2-dmitry.baryshkov@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

