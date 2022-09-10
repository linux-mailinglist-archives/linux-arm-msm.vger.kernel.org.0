Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A832B5B4711
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 16:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiIJOyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 10:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiIJOyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 10:54:02 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C90C43E60;
        Sat, 10 Sep 2022 07:53:58 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 92-20020a9d0be5000000b0063946111607so2905921oth.10;
        Sat, 10 Sep 2022 07:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZuBSNUDy5xHjwz6pHfSR3niPnGrA1MhbCCohLDkUnn8=;
        b=Lapl0DyyziI0XmXVm5VePA4YTnnos2etyzrUNffHtS2hpzT1r70mygfjt1fzl9/gU+
         Saolws7983yeBdDpbPdS9vjoTFs0Lmfe4ALrI5PTUOizSPZeFUAj7b3Uo3wpArZphuXz
         DbCKlRXFJlUsNhD1ualYkBV1MB+8OooMj15X7QBRzLsZcFmn+7eMcD4h1beMnD9WK0i5
         7L1hHOzCz2ONiaVu2KW6i8xNOJRE5kJIgGtT4qS5WSVuq2c0ew4lDffY6Ak5q3XpdKw0
         LXZmQ8P1oaHiCTooCBaiHNHWOJSTY8byS13q+7C197tbq3IhCeHfPSkawbk8zJntSvjV
         b9VA==
X-Gm-Message-State: ACgBeo010/dCEQMQhj81L/W/F64i7vMBvSjFu1Oat1k2nHYttVXfgzt8
        StHC/eTlIJ1KpHAmbG+98SPh+Hx0zg==
X-Google-Smtp-Source: AA6agR65eUeeyrgUAvr7MsRa9LTk64wcwb/NZDieNg2h8AF7vRusJ7IoRALHAEFlY0VZVT5MAaZlMg==
X-Received: by 2002:a9d:6e9a:0:b0:638:96f2:634a with SMTP id a26-20020a9d6e9a000000b0063896f2634amr7483944otr.205.1662821637309;
        Sat, 10 Sep 2022 07:53:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v25-20020a056870709900b0011f00b027bdsm2300432oae.45.2022.09.10.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 07:53:56 -0700 (PDT)
Received: (nullmailer pid 34697 invoked by uid 1000);
        Sat, 10 Sep 2022 14:53:55 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20220910014206.1101962-2-bryan.odonoghue@linaro.org>
References: <20220910014206.1101962-1-bryan.odonoghue@linaro.org> <20220910014206.1101962-2-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: Mark old binding qcom,cpu-lpass-apq8016 as deprecated
Date:   Sat, 10 Sep 2022 09:53:55 -0500
Message-Id: <1662821635.164850.34696.nullmailer@robh.at.kernel.org>
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

On Sat, 10 Sep 2022 02:42:06 +0100, Bryan O'Donoghue wrote:
> We've had some discongruity in the compatible string of the lpass for 8916
> for a while.
> 
> Mark the old compat as deprecated. New SoC additions such as msm8936 and
> msm8939 should use the compat string "qcom,apq8016-lpass-cpu".
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml   | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml:23:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

