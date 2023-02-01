Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47CCA6869CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbjBAPQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbjBAPPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:15:50 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68C96A70
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:15:25 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id b81so9290219vkf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P2xP6eCF3TqKX2hPAQtTqyhRnHPd6nA+ZAl9lx1s02E=;
        b=cPd9ZK+s9OOnXPyWMp4YxzVTUmzWE5mddvFUShs3EAUOGbyfSahgZTkFtkeEfUiX12
         pNNTxcFBD0mva/RhwyvK7Io1ueQL9HvERq/amx0mzc4NpMB0rbJx65UGb1cPDFqtV8vD
         ySeo01oX7qk+TeOAaGW59fg4EXTrfVZc44IZkiH45LO9pG7aixZ7T9cD9wFR1mxJjjif
         eO5UFLZpiDZPZshCPN07y60s2zdJy7AY13+65IlTLncbdxdP93yA9Fp3Moa96T4mIwgr
         CyiCwFC701oqylACrCbaZ6AoaVp8SfP/4Moy20GuM+mZ5R6pnqvvAl9wL2hDcFj3WPhZ
         7Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2xP6eCF3TqKX2hPAQtTqyhRnHPd6nA+ZAl9lx1s02E=;
        b=tzuZnU9tEefA5hVG5W1VhDFgucwO3ln/saqAO+7rV8FlrYmKq/imDRnJJNq5jNcoQq
         yf2hE8jhqU33zrxhhIxAY/s/fcsnpMjcd8B5j3l9YeOvNgTmFfB7j4nK8km9FYIuaqYR
         Nw42rmNv1ribVSEfbdrbWV2ews5IwIWCPxwlM4c7dwaiFaKebEOrNUsjzkXPWMd/1LbS
         ziT5e+bnPItUpBQsO0PhcJ/Pw7UkBIfrdFogQjfqdDtzU5Qhh671AZPCWg4eiPwZdKXD
         NolRFQOtRtOdko/ZcD6wSj2iDc/0r+K/CyUgPq/wq21gxAbAYFQaPmKOnpNeO7O5MJR+
         ghoQ==
X-Gm-Message-State: AO0yUKX0hnxxp5XihpMnBRTTCfQLLq3FxikCBemdW9hv/9KjCQFNU2Zr
        vnXglSeY1tPjqhrobik6K3i0jyAT6rMgyBZ6rDeWew==
X-Google-Smtp-Source: AK7set/a9n8DhEWml4oeRIbxJr7piLem7ocXP6IYnly6d6H3q6ePiYA+VD+PX3blmVuO3ebrdTGmoiIBa20h4UH/ECM=
X-Received: by 2002:a05:6122:691:b0:3ea:22a8:aef with SMTP id
 n17-20020a056122069100b003ea22a80aefmr383731vkq.25.1675264524773; Wed, 01 Feb
 2023 07:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20230201150011.200613-1-brgl@bgdev.pl> <20230201150011.200613-2-brgl@bgdev.pl>
 <e28c9048-635d-3936-e440-27e293501ff6@linaro.org>
In-Reply-To: <e28c9048-635d-3936-e440-27e293501ff6@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Feb 2023 16:15:13 +0100
Message-ID: <CAMRc=Mc8gFpcB6k-qVmSAM0=iKHGBmGcqm3aV2xiyjWPG1wtvg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: describe sa8775p-tlmm
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 1, 2023 at 4:13 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/02/2023 16:00, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add DT bindings for the TLMM controller on sa8775p platforms.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    tlmm: pinctrl@f000000 {
> > +        compatible = "qcom,sa8775p-tlmm";
> > +        reg = <0xf000000 0x1000000>;
> > +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +        gpio-ranges = <&tlmm 0 0 149>;
>
> You have 148 GPIOs, so s/149/148/.
>
> I'll fix other bindings as we have such mistake in several places.
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>

Ah, cr*p, sorry for missing it. Linus - can you change it when
applying? I don't want to send more noise.

Bart
