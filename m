Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 412077CE0AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 17:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjJRPE3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 11:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjJRPE3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 11:04:29 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3154EA
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 08:04:26 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7dd65052aso93678837b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697641466; x=1698246266; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N9GYwwthR37OzH1RslWzFkCOD4tUhZyxxnl2voBYq0w=;
        b=M8CqiKxN0LSOkdXcBt+PjanKo4A2+IJnwQYrSYk374awZ7ziK+VM1ykBylSsKBdmiI
         T9mtIlaZwgbHAhIyhDxag6GBy6Q2xYVMv1TiWz+mwZ1FyghPTWsyuDmYJojQ/5PQxlj1
         74PGDsd/kx3c0ihsRC9y8DtcfCbjh72TQkCgUJn3zgSfvMcs59HeFAPexSrOryKcarp5
         yifxu/PKf6DMU4bJcc//ECb8SocKEiOMg5vqm3eqet6jlb+tWAMtn3gU4KxiaP2ba2aD
         bW/+dT6U4Fo3Q5FZ7ZnqOZnEcrzNmc5BAAL4ebJSq0iC8RaVIZyNkr9NxLybMOfb58O6
         Vl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697641466; x=1698246266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9GYwwthR37OzH1RslWzFkCOD4tUhZyxxnl2voBYq0w=;
        b=dr2BjIZeZ7CFd0ytA+X248HZxv133tC6jgSaBsMu1m33RQFTcze6LHo/ZuF9dtUFXa
         bpjfJxZCGmlMGGhLwClP9MgfW8o1JNMT8Mbplzs9DhEXhshPehDpp9hZpQOcyWal6jN3
         WDq2d0+q6mkn43YGT99X3tFfVDmeSILePVr8mEAUMeGrHLfcEMc8a9XKltVVYGc6bbPg
         FfhdRLy0EOCCrm/7iiJfjWeSfVAV8Yfs7+deLBMwcvrTlrb/cGn3nFyFR7gG6jRaI9V9
         MeyPPbPYjsyOEewoWvvVeOED/tKv1uDyuSZv17bmUxuINCnPRzTazaJNh8DLMzRmpfXk
         z+wg==
X-Gm-Message-State: AOJu0YyJRiuffitkSEzLtzEW41Y78wd873BFKWsihx04/3n3WarvOkEN
        H1DAFB4gBDzZVcj6d1MNMZtjQmb9k6MMOpLtAszkuA==
X-Google-Smtp-Source: AGHT+IG0MYE+W6gKRDhqufCOvzZlId8cAWJbd8HgweD1sVQ532lmNIhX89oHkxtz+UYoi173UzKYxI5bfYwzwiTJeD4=
X-Received: by 2002:a81:8407:0:b0:5a7:a81d:e410 with SMTP id
 u7-20020a818407000000b005a7a81de410mr6147875ywf.18.1697641466108; Wed, 18 Oct
 2023 08:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231018145750.429385-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231018145750.429385-1-krzysztof.kozlowski@linaro.org>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Wed, 18 Oct 2023 17:04:15 +0200
Message-ID: <CACMJSev5ftXy0di+knVmsMRUEtYnR8A72yzfrvf83JTyxWehZw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sa8775p-tlmm: add missing wakeup-parent
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Oct 2023 at 16:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add missing wakeup-parent property, already used by DTS to indicate that
> pins are wakeup capable:
>
>   sa8775p-ride.dtb: pinctrl@f000000: 'wakeup-parent' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> index e119a226a4b1..2173c5255638 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> @@ -28,6 +28,7 @@ properties:
>    gpio-controller: true
>    "#gpio-cells": true
>    gpio-ranges: true
> +  wakeup-parent: true
>
>    gpio-reserved-ranges:
>      minItems: 1
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
