Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFD75F3118
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 15:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiJCNYz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 09:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiJCNYy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 09:24:54 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396CD1A835;
        Mon,  3 Oct 2022 06:24:52 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-131dda37dddso11954245fac.0;
        Mon, 03 Oct 2022 06:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kU451SIl5W9H4rqW6cWLRkVs+TNTYoxZeSEJlocEXiY=;
        b=v0qkAibpdwzs5BiyS5xXv4BbEWf/R05jLe6YNHXRBF6PryVIqkaE38eUYAfkr05ru2
         ZRPepyp4Jm5ff7DXdeGjvMhsRfUJyUNR3t/6h9ZqrakaQgwycVTJJpIOsS2cPiSbZV3J
         zwezM9cYFBQSgWcJ8zrmy+5A/tPSHkSfqiMcBXzXXAHddVTZzoR3YEAz8xyw8jE59k0A
         LRQ6C0KVNNIsKtSVjAGs+CpNu6WnCAADcMHSMqHOv7RCwUpUKNLdhsO0AhRdKoTGwBfS
         vGqZoY4m8LrYwW22HPn5MP1jCBy4W0StxMFpGcFC+Q62igOcNzFLsbkXZnXtvuadilaT
         cHKQ==
X-Gm-Message-State: ACrzQf2AdiaHZFodFVOgkje73xzAM6dxxN0B8mZCvgKHq1nXNLxrxoQy
        LkGLCDsW7GKceqyBCB7BGA==
X-Google-Smtp-Source: AMsMyM66Yr+43935UF7qvwRbu/q3OvffSorhHYRGRaO+avE7oKZXCndv5PjrUf4KA/Eus+oq0IocBg==
X-Received: by 2002:a05:6870:f20b:b0:12d:29e4:df2e with SMTP id t11-20020a056870f20b00b0012d29e4df2emr5777042oao.262.1664803491473;
        Mon, 03 Oct 2022 06:24:51 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k14-20020a0568080e8e00b003357568e39fsm2422394oil.57.2022.10.03.06.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 06:24:51 -0700 (PDT)
Received: (nullmailer pid 1863809 invoked by uid 1000);
        Mon, 03 Oct 2022 13:24:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
Message-Id: <166479590716.1659638.11088026200399207863.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
Date:   Mon, 03 Oct 2022 08:24:48 -0500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 01 Oct 2022 00:20:51 +0300, Dmitry Baryshkov wrote:
> Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with SoC
> bindings (soc/qcom/).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/arm/msm/ssbi.txt      | 18 ------
>  .../bindings/soc/qcom/qcom,ssbi.yaml          | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/ssbi.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


qcom,ssbi@500000: 'pmic@0' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dtb
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dtb
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dtb
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dtb
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dtb
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dtb
	arch/arm/boot/dts/qcom-msm8660-surf.dtb
	arch/arm/boot/dts/qcom-msm8960-cdp.dtb

ssbi@c00000: 'pmic@1' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dtb
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dtb
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dtb
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dtb

