Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45805604C3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 17:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbiJSPxO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 11:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbiJSPw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 11:52:59 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579A7FBCE2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:49:54 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id ot12so41048084ejb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GYZSbQZP6Xh4e4kFk7TUEEgkZvZ475vyRePbBKOiGu4=;
        b=VmvNLbu6AaNr25QIZqpnPieIkLgzWqhpfhsSj1S4bSEMKws3PWsuB3ORl1S0qUY/zX
         uaGp4SwY4L27LJ5A/6B59RK6hnxpjt4dfu6oxy9X+7+eDAa8XX3fnpU+x3KzAEeJ74It
         HZ+aU/PotiS94Pvu5mCCWKXWZd1BqnBnjD6xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYZSbQZP6Xh4e4kFk7TUEEgkZvZ475vyRePbBKOiGu4=;
        b=N/vwZkw26pxtbZXH0yMN5lnP3sb96fQs+/XbRwgHNYGArOeuJSl9FAOOyj/OMb+uiF
         CWYSOkx3/j53qwtgN8QNbyOyFM8jv8v288M9+Z/V1QLlprw9Jl8F5edteTVDIIpEp/sS
         9aq8Gim4UU9205uZCJMRU36+YMLRdjGb0aiw/eoEIM4AW4J8HPWOOtcLOEtLBxQ7klk9
         98KEdkYPt1UH57f6kNO7GOuKGT3/CDIDdCkQeaw+QyN67FgOdynsythF/GGvU5Ce8zms
         tMvWblBlr7/kcojxF7lkIU1UMp/tjk/WRgMn5ED61WmssTUGGPEmyGS4ERCeCUOBoTHL
         iL3A==
X-Gm-Message-State: ACrzQf3ChS74IBD9jnW8dyBewEgfkIPYH3eNUkf5qfjEGpgaf5tKTbr3
        NHxgcT1gB6knXUqecwaZjbdrsQbZsDBv9ydu
X-Google-Smtp-Source: AMsMyM5fmG9C8AC38/FDe/Njtm1MSk5rzbXYB6uRUR1f8oyMMzva4+sQepohF4lIZjw4sLRzbXjNow==
X-Received: by 2002:a17:907:3206:b0:780:a882:a9ac with SMTP id xg6-20020a170907320600b00780a882a9acmr7161918ejb.765.1666194506099;
        Wed, 19 Oct 2022 08:48:26 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id nb36-20020a1709071ca400b0073ddb2eff27sm9175226ejc.167.2022.10.19.08.48.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 08:48:25 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id n12so29637924wrp.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:48:25 -0700 (PDT)
X-Received: by 2002:adf:9d8a:0:b0:230:5212:d358 with SMTP id
 p10-20020adf9d8a000000b002305212d358mr5692508wre.405.1666194505138; Wed, 19
 Oct 2022 08:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org> <20221019001351.1630089-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019001351.1630089-5-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 19 Oct 2022 08:48:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0WR-a7d4p5eoCFMRer5yhX8AcEPdUaJag4KpGB9kp+A@mail.gmail.com>
Message-ID: <CAD=FV=U0WR-a7d4p5eoCFMRer5yhX8AcEPdUaJag4KpGB9kp+A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: pinctrl: qcom,sc7180: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 18, 2022 at 5:14 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Convert Qualcomm SC7180 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> ---
>
> Changes since v2:
> 1. Drop entire drive-strength (not needed, brought by common TLMM
>    schema).
>
> Changes since v1:
> 1. Drop default:2 for drive strength
> 2. Add Rb tag.
>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
>  .../bindings/pinctrl/qcom,sc7180-pinctrl.txt  | 187 ------------------
>  .../bindings/pinctrl/qcom,sc7180-pinctrl.yaml | 158 +++++++++++++++
>  2 files changed, 158 insertions(+), 187 deletions(-)

Looks great now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Will you also send out separate patches to fix up the "drive strength"
for all the other Qualcomm boards. They all have the same problem. The
drive strength never defaults to 2 and always gets left at whatever
the BIOS leaves it at unless it's specified.
