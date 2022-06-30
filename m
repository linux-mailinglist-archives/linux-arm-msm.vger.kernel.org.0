Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D101B561BA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 15:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbiF3Nop (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 09:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235266AbiF3Noj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 09:44:39 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D267DC33;
        Thu, 30 Jun 2022 06:44:38 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id p69so19140229iod.10;
        Thu, 30 Jun 2022 06:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=098bCjvSq2vLzZ8kSm1NRadPmRoIe0iiYEdy6zpYp2A=;
        b=y8v7sBW/FGNf6BMcQ5LYUBJwRHN3wHUGUiVyCQKjJXErONi38Y6Pz3+cmD7omSjLn7
         ItkVPfwU2n3v4cTa4c1BysNqS6bpZ2qqjFcnmoBQOcf3QW2BrkBhwt+3QfNxYftMByC3
         ABsSrzVc88aFiof82XGLBeZpj/bh36LDHaxj4aA3oQ9P8z2lZzSt+mAOX6w9R5lNr6ib
         sWJwlVuU33aAGCkN5nIuLiC+gh1ubFyl1Tdq4xjcILi10LRFgB/JkD1202rXJ7GfPxxE
         hqIAtKCJdlVKOq1sgUQtvzUt0q/qkG/s/trieg18D+2/5WBzoIl1JK7g3jTH7yJQdyP4
         Eweg==
X-Gm-Message-State: AJIora8mNXt6Y7gpf0dFH+Y9dC2xooch/TIlmwRyYKsrmpvQC7RksLiF
        FNQpFFKqcJyRZmgNV8XNxA==
X-Google-Smtp-Source: AGRyM1tB80axJ8y8zwEEVRRYtiz4vKZRCPQp/PnKkCbp2byRTUO4lTkAeBOd6KkqUChxTRjBZF4R4A==
X-Received: by 2002:a05:6638:25cd:b0:332:109a:fac with SMTP id u13-20020a05663825cd00b00332109a0facmr5677367jat.70.1656596678107;
        Thu, 30 Jun 2022 06:44:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w17-20020a92d2d1000000b002d3aff5d8b0sm8169371ilg.14.2022.06.30.06.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 06:44:37 -0700 (PDT)
Received: (nullmailer pid 2569460 invoked by uid 1000);
        Thu, 30 Jun 2022 13:44:25 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20220630043536.3308546-2-bryan.odonoghue@linaro.org>
References: <20220630043536.3308546-1-bryan.odonoghue@linaro.org> <20220630043536.3308546-2-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Add syscon const for relevant entries
Date:   Thu, 30 Jun 2022 07:44:25 -0600
Message-Id: <1656596665.792233.2569459.nullmailer@robh.at.kernel.org>
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

On Thu, 30 Jun 2022 05:35:35 +0100, Bryan O'Donoghue wrote:
> msm8916, msm8939, msm8953, msm8994 and qcs404 already declare or should
> declare syscon as they have drivers that use syscon inside of the apcs-kpss
> block.
> 
> grep apcs arch/arm64/boot/dts/qcom/* | grep syscon
> 
> Add in the additional syscon in the documentation for the above mentioned
> parts.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 44 ++++++++++---------
>  1 file changed, 24 insertions(+), 20 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.example.dtb: mailbox@b011000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs404-apcs-apps-global'] is too short
	'qcom,qcs404-apcs-apps-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,msm8976-apcs-kpss-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,msm8998-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sdm660-apcs-hmss-global', 'qcom,sdm845-apss-shared', 'qcom,sm6125-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm8150-apss-shared']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

