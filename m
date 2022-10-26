Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C30460E484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 17:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbiJZPdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 11:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbiJZPdp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 11:33:45 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E519FFB719
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 08:33:44 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id a5so29030127edb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mBX4bT2qc6/G5xqtzpd0iJ6M1TPlZmSU/EpcMpqcNzM=;
        b=U51/v2w0f9bh4CquGhgtUghzC0aS52L9CRVebJ48950nhz00QgYxl2FErs8/XE6tG2
         OBjdfDhfhgAkSHEAyO1ezFmEzBbkUizjIm6roRJhDFr0OA8wAHd5rTI7kJab2X70ansT
         Bsq1CJ9EzVqc/g0itDGIwsR57YVOY6EcurqyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBX4bT2qc6/G5xqtzpd0iJ6M1TPlZmSU/EpcMpqcNzM=;
        b=kuP0BNPwTRzCRcBc6e+t9DyUll9343U/KNmbOslTR99EZ0z7pPRzOvdEZSegxMxsmr
         b4SnJabNeqzC9PXs16xs6ce+XeaZq9OwKKhtMUJ3RhpERbSyCiECpVISl1Ytl1jAy3UT
         MaV0Q+5vNiFzwWIZsjzsGprAlWT+mJR9CM3UqpcHO0dTebpQUxSAmrgjavreZHJT/4bV
         peQFj9W0n60bTLa08hOJftGFZvOOQ8t/6bMpkyjDo0vPj9NQPCPoMGWx+sILYHkupULF
         oADt28/JsAvxQ/2Cw6NhTZMAes0VusJZErpvlQFoi6HHtjOC8r2hJSWr+MDrzRnXr/aS
         jg8w==
X-Gm-Message-State: ACrzQf1Bel/QQMuBBLRArilp19XO3Lz/36CG7kTevM5yEYeV2B97zuVq
        KwqM5EXpsrt76glry3mL99omIMyCSkwSW1x2
X-Google-Smtp-Source: AMsMyM5K1GdiAUBa59BiZ/n4HQZJnm7e+REtvRBaIF4YttSBq0sDJq2VBPc4N2t/57o7mI0TDBSohA==
X-Received: by 2002:a05:6402:35d1:b0:45d:3661:567e with SMTP id z17-20020a05640235d100b0045d3661567emr42379580edc.343.1666798422994;
        Wed, 26 Oct 2022 08:33:42 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id g17-20020a056402321100b0045726e8a22bsm3757484eda.46.2022.10.26.08.33.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 08:33:41 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id bp11so26437213wrb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 08:33:40 -0700 (PDT)
X-Received: by 2002:a05:6000:3c1:b0:236:5779:546d with SMTP id
 b1-20020a05600003c100b002365779546dmr18412470wrg.405.1666798420614; Wed, 26
 Oct 2022 08:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221020225135.31750-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221020225135.31750-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 26 Oct 2022 08:33:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VRgEF=bADEKttmtGqrQ6mDqipGZFRh7JKa5mf4ovF2iA@mail.gmail.com>
Message-ID: <CAD=FV=VRgEF=bADEKttmtGqrQ6mDqipGZFRh7JKa5mf4ovF2iA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] arm64/pinctrl: dt-bindings: qcom: sc7180: convert
 to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Thu, Oct 20, 2022 at 3:51 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Hi,
>
> Changes since v3
> ================
> 1. Drop bindings patch: applied.
> 2. Rebase.
> 3. Add tags.
>
> Changes since v2
> ================
> 1. New patch: revert of glitch SPI CS workaround
> 2. dt-bindings: Drop entire drive-strength (not needed, brought by common TLMM
>    schema).
> 3. Add tags.
> v2: https://lore.kernel.org/all/20221013184700.87260-1-krzysztof.kozlowski@linaro.org/
>
> Best regards,
> Krzysztof
>
> Krzysztof Kozlowski (3):
>   arm64: dts: qcom: sc7180-trogdor-homestar: fully configure secondary
>     I2S pins
>   arm64: dts: qcom: sc7180: revert "arm64: dts: qcom: sc7180: Avoid
>     glitching SPI CS at bootup on trogdor"
>   arm64: dts: qcom: sc7180: align TLMM pin configuration with DT schema
>
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts       | 236 +++----
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  36 +-
>  .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  41 +-
>  .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  16 +-
>  .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   |   8 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  16 +-
>  .../dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  25 +-
>  .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi |  72 +-
>  .../qcom/sc7180-trogdor-parade-ps8640.dtsi    |  32 +-
>  .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |   8 +-
>  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  14 +-
>  .../qcom/sc7180-trogdor-quackingstick.dtsi    |  56 +-
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |   8 +-
>  .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |  16 +-
>  .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  25 +-
>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  72 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 650 +++++++-----------
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 597 ++++++++--------
>  18 files changed, 776 insertions(+), 1152 deletions(-)

I'd love to see this series land sooner rather than later. It'll cause
conflicts with pretty much any other patch to a sc7180 device tree
file, so it'd be nice to get it in the tree. ;-)


-Doug
