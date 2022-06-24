Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CC2559FCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 20:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbiFXR1T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 13:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbiFXR0y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 13:26:54 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470AC2A242;
        Fri, 24 Jun 2022 10:26:47 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id i17so1896370ils.12;
        Fri, 24 Jun 2022 10:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=vZ0KuXzCWjXQ6AOsXh2KIfZrb6C7pE5QQouNmQuZeM8=;
        b=ABNNc6AlB50Tq7S1qoNUr0v/4EGyhjD2Ex4eiZohbT96jr6TqU8ckxV8gT3goUOjmz
         GMr0hHuumHijyCK8Xe/LTcM86SHtMSJGLE8iLLkasgPFGix5vUpreaG5SsOCu3gcQvKe
         KBzrWWucc9OXscrZe5zPZtZYQihM6mPCvJOfkeqqAL7NtH6NRZGJroxCFiX1k/j72ro/
         i4xxT6/BuCBUgv3lRSI9GZusLLaMPMQY/b014bx0I0FETmpa2ks6WIIFjvKSIcquyeK+
         lymyZbPbnzWzKnMUzbDGK4iFdGBU/xJofm8GF5mL91mAGZgnEHUb6Mbk964LcPTi4ulO
         2CZw==
X-Gm-Message-State: AJIora/0V/OliWyDXK+bLnwq4UHZlwGXtl2yo5FzwxQkrP16eoj59YWO
        z49SxYU7CP6XMznJNdxcaQ==
X-Google-Smtp-Source: AGRyM1sBSKVmc+LUuAPAyJCPs6KiKiCCRkgo+ta5nSdAMPAK8ZAQAS7zk/gkV6LhWB/SkzLPVhM2Gw==
X-Received: by 2002:a92:c567:0:b0:2d1:6268:2fd5 with SMTP id b7-20020a92c567000000b002d162682fd5mr25811ilj.255.1656091606321;
        Fri, 24 Jun 2022 10:26:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k16-20020a023350000000b00339cb105ae7sm1342385jak.92.2022.06.24.10.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:26:46 -0700 (PDT)
Received: (nullmailer pid 146338 invoked by uid 1000);
        Fri, 24 Jun 2022 17:26:34 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>
In-Reply-To: <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org> <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: clock: qcom: add bindings for dispcc on SM8450
Date:   Fri, 24 Jun 2022 11:26:34 -0600
Message-Id: <1656091594.372061.146337.nullmailer@robh.at.kernel.org>
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

On Thu, 23 Jun 2022 14:47:34 +0300, Dmitry Baryshkov wrote:
> Add device tree bindings for the display clock controller on Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm8450.yaml    | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.example.dtb: clock-controller@af00000: clocks: [[4294967295, 0], [4294967295, 1], [4294967295, 0], [4294967295, 1], [4294967295, 0], [4294967295, 1, 0, 0, 0, 0, 0, 0, 0, 0], [4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

