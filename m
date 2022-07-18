Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CC257795C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 03:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbiGRBn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jul 2022 21:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiGRBn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jul 2022 21:43:27 -0400
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAA412AFA;
        Sun, 17 Jul 2022 18:43:26 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id f15so1886684ilj.9;
        Sun, 17 Jul 2022 18:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=c7pnuuPkH5Pi7e1WOChXFuT9fvkj/MiUne/+vUS9tYM=;
        b=t5bEHSYeZskS2qP9vAyWuMbwVvj72La/O96Xt7v31+sRqjDqeuQ15zCHRET2vUkwQQ
         GRoHEUATiibCmw8ErMTiOwJRzhuUdHgmkeKVrZTwx2d8iMUq/CvIPqkGFoJZ+CSqCmjL
         Vnn0GS0afGuDDahQD/YyPgHCf08FHXxoYOU5iw7cTlfwGQ20VbwTLT4BeO38HLPneFhx
         cGxDZZjwVuiUVbreeDeeThODPzGcB3DUltNRV7xtZceG6oBeVty25Z+jcJ95sRePscy0
         s4vXuOH9mGzJ/R1NcJ6mSOEf4qxIkz+VGP2VnJOkHHq4csnMfQjGq2gYr0IXDohjFqh0
         D6uA==
X-Gm-Message-State: AJIora/KBIvlwgHFCqvx7UhM1yfpr6e4JtiudQPcSUUxCUBXd43inqJi
        E9JqfPjLTN9mCRS1tuNvKA==
X-Google-Smtp-Source: AGRyM1s8Bcx2Cyr8D/FFSNzWagCrmEYb6G/tUvzeoeF64FLdPr86kqHl2peT/3TxaK8hDKiAZvD4Rg==
X-Received: by 2002:a05:6e02:20e5:b0:2dc:cd3c:a02d with SMTP id q5-20020a056e0220e500b002dccd3ca02dmr5415516ilv.195.1658108605912;
        Sun, 17 Jul 2022 18:43:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r11-20020a02aa0b000000b00339ead526e5sm4942028jam.19.2022.07.17.18.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 18:43:25 -0700 (PDT)
Received: (nullmailer pid 1667787 invoked by uid 1000);
        Mon, 18 Jul 2022 01:43:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        shawn.guo@linaro.org, jassisinghbrar@gmail.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20220717213645.1147342-3-bryan.odonoghue@linaro.org>
References: <20220717213645.1147342-1-bryan.odonoghue@linaro.org> <20220717213645.1147342-3-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add clock-output-names
Date:   Sun, 17 Jul 2022 19:43:21 -0600
Message-Id: <1658108601.911967.1667786.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 17 Jul 2022 22:36:45 +0100, Bryan O'Donoghue wrote:
> Add clock-output-names as optional so that SoCs such as the msm8939 which
> have multiple a53 PLLs can latch the appropriate output name in
> drivers/clk/qcom/apcs-msm8916.c.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml: properties:clock-output-names: {'maxItems': 1, 'items': [{'const': 'a53mux_c0'}, {'const': 'a53mux_c1'}, {'const': 'a53mux_cci'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml: ignoring, error in schema: properties: clock-output-names

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

