Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6323570FDCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 20:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbjEXSYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 14:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbjEXSYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 14:24:05 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6402C98;
        Wed, 24 May 2023 11:24:04 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6a984993740so272645a34.2;
        Wed, 24 May 2023 11:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684952643; x=1687544643;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8bcNBSFf0r6rM89+plD7hrjF2xX7NyiQ83JQGrpkWFM=;
        b=OuFtSZahaE4BMPBkB6gb1nsyAFDcXSpoPJwpwb0rX0UvYTSMQcP1X65XAW1u6gcj1F
         m/tGWMkPIoFycydW3J4hLQG740uGiLG62cP+BNW/9EdYEFuuiHCR8r+QGE5ic6v6aTu3
         XaZlajcqSM9xShlyoqxV1HniVz1m7V2ppCInfjJPBNZOz66SaNl8hi5y++NlULvg3VRh
         YVSimpwbT3P+cN04w6f4toM4xnzG7DyjwCvkZV4zownrWSEbyl0mNe27QlNti6Gr7CdX
         IiV1F5YUJs/rexknECB4h7CIAmy99MHU/Jrit+TYeGFSnSU8lCD3CA/cTW20ERdXAFz2
         H1ng==
X-Gm-Message-State: AC+VfDzjH+7Sn8P07GfcGAAfufb9TQ+GxbYdF4YKvnxkp17sS9wNabDv
        SL6qHwNJt7NeVBE0YJ7pSw==
X-Google-Smtp-Source: ACHHUZ5VwAG4ALDtmwg2oVBuz75YfVWoi3IFWgKU8VxJs/MbWsV0LwP02+JOp6CWVkAl1jN/8qSkmg==
X-Received: by 2002:a05:6830:1bcc:b0:6a5:f147:5255 with SMTP id v12-20020a0568301bcc00b006a5f1475255mr9857122ota.6.1684952643543;
        Wed, 24 May 2023 11:24:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m10-20020a056830328a00b006a6558ef17fsm4829900ott.30.2023.05.24.11.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:24:02 -0700 (PDT)
Received: (nullmailer pid 4092086 invoked by uid 1000);
        Wed, 24 May 2023 18:24:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-1-f9334afc4505@linaro.org>
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-1-f9334afc4505@linaro.org>
Message-Id: <168495264200.4092051.1331327210839405499.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: qcom,spmi-pmic: Document pmi8998
 charger
Date:   Wed, 24 May 2023 13:24:02 -0500
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


On Wed, 24 May 2023 18:38:52 +0100, Caleb Connolly wrote:
> Document the new pmi8998 charger bindings
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/power/supply/qcom,pmi8998-charger.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230524-pmi8998-charger-dts-v1-1-f9334afc4505@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

