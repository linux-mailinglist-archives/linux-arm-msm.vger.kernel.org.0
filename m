Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A96561BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 15:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbiF3Noo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 09:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235110AbiF3Noh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 09:44:37 -0400
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3175C22504;
        Thu, 30 Jun 2022 06:44:37 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id p9so12120409ilj.7;
        Thu, 30 Jun 2022 06:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=DyXyyeapIW+NLAi9Bj+YwU/w2EygOtxzBhz96O028x4=;
        b=uOIhTcPMplg0/PzUede8Fzb0MNYO3U5mrrqEYctCmZDDjuGr1ZjvJXbYzETBVA0zgl
         yU73M7NoM7jCVI4JZyHxXZNe2/Y900OlboTr+Ar9rBRlBNWiopOon3mimtjeZ52qNDQX
         ooaJ4pvo+Gz9WnsV/P8Gdmt64i3tpSHWFcSf+/SXR1xGwBGIW/UHSN5C1mT1oWMm+Bg9
         n0BfWRKcNzJa4QEr48dIAhikfu1Y/z+isdrDcYk2yyQgZRlasYTQTaH14uQITuboiZ+h
         K64mO/uMIAKf90t+T6weKRIYf57rf/P8GaRoPEH0lvUYaq/IdWXjQFbEPeQa1iHGJYsN
         LR/A==
X-Gm-Message-State: AJIora9DuXq8Lq4gDl6dsh4m0qv0Mki/GYWlD4b3ZumJ4mh6V4gkzDAP
        TiVjSNvF87oim30x04UfQw==
X-Google-Smtp-Source: AGRyM1vhx7vGZdYkfwwd/ahKh4+DR/KaHmlEBexMqxVcfqP/s7aUDFj7Sy55xX13lzBpeGv0wYFs8w==
X-Received: by 2002:a05:6e02:1c44:b0:2da:7918:2ae6 with SMTP id d4-20020a056e021c4400b002da79182ae6mr5582545ilg.96.1656596676438;
        Thu, 30 Jun 2022 06:44:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r15-20020a92d98f000000b002d90e9a694dsm8107827iln.4.2022.06.30.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 06:44:36 -0700 (PDT)
Received: (nullmailer pid 2569462 invoked by uid 1000);
        Thu, 30 Jun 2022 13:44:25 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     jassisinghbrar@gmail.com, agross@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20220630043536.3308546-3-bryan.odonoghue@linaro.org>
References: <20220630043536.3308546-1-bryan.odonoghue@linaro.org> <20220630043536.3308546-3-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: mailbox: qcom: Add clock-output-names
Date:   Thu, 30 Jun 2022 07:44:25 -0600
Message-Id: <1656596665.818105.2569461.nullmailer@robh.at.kernel.org>
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

On Thu, 30 Jun 2022 05:35:36 +0100, Bryan O'Donoghue wrote:
> Add clock-output-names as optional so that SoCs such as the msm8939 which
> have multiple a53 PLLs can latch the appropriate output name in
> drivers/clk/qcom/apcs-msm8916.c.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml: properties:clock-output-names: 'Usage' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml: properties:clock-output-names: 'Value type' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml: properties:clock-output-names: 'Definition' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml: properties:clock-output-names: Additional properties are not allowed ('Definition', 'Usage', 'Value type' were unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml: ignoring, error in schema: properties: clock-output-names
Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.example.dtb:0:0: /example-0/mailbox@9820000: failed to match any schema with compatible: ['qcom,msm8996-apcs-hmss-global']
Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.example.dtb:0:0: /example-1/mailbox@b011000: failed to match any schema with compatible: ['qcom,qcs404-apcs-apps-global']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

