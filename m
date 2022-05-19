Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B968452D374
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 15:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238317AbiESNDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 09:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238233AbiESNDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 09:03:17 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54A268F87
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 06:03:15 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id e78so8872817ybc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJboZI2NsvWRkkS2FZfaavw5BFRU6LKS0+t+LYIVRaM=;
        b=aD8Q5JYMw42ChofBSREwntJeJdBp3BU+f3U/TlHBVFAu5/VEqjNqcIynD5kQ1W3FZ6
         X9eJZd1DQakfDZpCXrKFUCicsZgGMC4IpdGwdpeqpMPJIpwYwB5Oe7K3tQV3HDddB4gN
         oPBmzv+tNSsjDCoLfUu1UXb2AFdmBu2WtXvWXtq4N1anIcmgwMETF3AkIRQDKj+vMr5K
         1U4T/oCu/rWV/7Dt/KSvBiEqwaEr9rPMBrF/wziiIS4yqOjfO0F2ZTEoVJX9ooxHY24Y
         78XctnDfsqm43vgqTND8Y/ghOXf54/PMqKLqvII65z15HdBxI5Ud/Z8JuAvZhbl2fVbY
         NBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJboZI2NsvWRkkS2FZfaavw5BFRU6LKS0+t+LYIVRaM=;
        b=6rX/FiobhftVsHv/Xm6/9Ab1ea4czZ6K0fYynAlU49GoqEM6q1wNiv4i6gTjkUEg6i
         Pwu1Gp+sHp2Y8kAVZ2udmKjPtYo2vSBUFEzrbU9bJpdFmUwVee8OhI+qWj/ojC7yJ2Jd
         6d+zTceywzFWIkCUt1bYqvIW/ZIc//cgu+QNiJ+u5riibHoe+6W35cccbgYx7zSS1Lqw
         3+0NvdKjMVvtl/b2DOEDtyGSIq6spdjJlnYD+23gr/X9mX1h2Eih6nb+UJOC91itnkgs
         oHQ9U/AKWePbV16/98OSnbdwlp50Pd+buU53w0TSoaZpSEEv+T3YetGgQpx/ePIf6fNN
         PiyA==
X-Gm-Message-State: AOAM533XKYfbCmVj0rBH6QrFAt5bYCtwa1r8+vQzTNeCn6kDbqjxDioo
        K5KVrC8UN4qZEt7uyG7UgdeAOc9eNg+9E/+7sZnyZA==
X-Google-Smtp-Source: ABdhPJxp4KGREJ53aJoUykkHDLgIEJGi4eAGae0DgddXUeulX75zxzyG1tNH7l6DYoKkaL5z76yVDaV40VkVJ9vWTtM=
X-Received: by 2002:a25:e78a:0:b0:64d:672b:af3c with SMTP id
 e132-20020a25e78a000000b0064d672baf3cmr4462034ybh.369.1652965395136; Thu, 19
 May 2022 06:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:03:04 +0200
Message-ID: <CACRpkdbuJByQO=FnFHLWK5PYX-wfKmemY6aWB_qar1rmHJutkA@mail.gmail.com>
Subject: Re: [PATCH 00/11] dt-bindings/pinctrl/arm: qcom: minor cleanups of
 QCOM PMIC pinctrl
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 7, 2022 at 9:49 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Krzysztof Kozlowski (11):
>   dt-bindings: pinctrl: qcom,pmic-gpio: document PM8150L and PMM8155AU
>   dt-bindings: pinctrl: qcom,pmic-gpio: fix matching pin config
>   dt-bindings: pinctrl: qcom,pmic-gpio: describe gpio-line-names
>   dt-bindings: pinctrl: qcom,pmic-gpio: add 'input-disable'

These four patches applied to the pinctrl tree.

Yours,
Linus Walleij
