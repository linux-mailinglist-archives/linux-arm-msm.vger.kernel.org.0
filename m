Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8705EC1B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 13:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiI0LnL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 07:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiI0LnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 07:43:07 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE6813EAD7
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 04:43:05 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-346cd4c3d7aso97231017b3.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1UNUZyMK/OZ21uPgXbaDaE6VCzNbiNTe4G35X2WsgGM=;
        b=uNoAW36K+R+kkCa+Umxh2Y6ilxyFTgOthA8c5fH1d6TljaGMCKpOzpQJhZyuc5oXRV
         o89/yovBX923OhW2A8SZge1t9O7bOq0AidkxzLLisvibV2ttPaJBopg529Gv234Dq1QZ
         JnfBQGbFRt0pBqmcqZaeSEg5klhskSXksjhT+nbz88HCwW48opfKRE4ndsjo/Iqwdb+i
         Hh3u3TsaeQ+OKewmrSybW963y3k07cFhF7PyMHcwhhljDbYlcMw2Kf6KROaeg2StCpw8
         HbWGcyaLaLSmgCVrU7mNXrwiBr3DUCH98gHB6M2D7y+VwX2iInDwVbLJy+Kv94+BmYZ+
         VxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1UNUZyMK/OZ21uPgXbaDaE6VCzNbiNTe4G35X2WsgGM=;
        b=Ad1pWk8CwaKV7HXB3NKKCH8HsOg/WR5tad7zGXeMl2ksRuM+BfyGl8Sknm0DtT/ZFy
         IZ149QYhLSZ7V9bme4jbcJbLTPvObdFXrmCO8GKVH6PAPDH1aGL0g0NG1DkQg0CwsLlL
         ywBk9wACqeOVbHIVQ37hJacRRpMIcv1svJSGh4JQgJlt/smmPgpinAY52zhv9PiL24Xw
         sYkbCd5HKEDvMubqKPb+y40godEjmUpp8e4FtHKP0S7QGfDwotOTVAMCMWz+0ET5rW3v
         UMwiXTszq/uKuREKjcikK+p3SiwiC3yL39MRP9SvKwwmhKAcf1qn8vSCsH/fgb+VkhfJ
         ujcg==
X-Gm-Message-State: ACrzQf1VUs3vSPZzMzXF3KBXh/aEZE9s4NLgoiCgeq+osQ/4K8Oilsiw
        0aM8pIux1Nralo8Ltcpzh7hDqGxG5PfG6rJypgxacA==
X-Google-Smtp-Source: AMsMyM7ws0DMxaFmLyszjvjSKi8amcPO/6WXEbRGYUNf8TVwbdwVj0rb+eSEyxSN+KvhGNmB5xiwm+U9P3OSo0sEUFg=
X-Received: by 2002:a81:b40f:0:b0:352:477a:659e with SMTP id
 h15-20020a81b40f000000b00352477a659emr1170959ywi.127.1664278985104; Tue, 27
 Sep 2022 04:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org> <20220924080459.13084-26-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924080459.13084-26-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 27 Sep 2022 14:42:54 +0300
Message-ID: <CAA8EJppxWu86+t=nejrqe_TnhoMLjtvWcvAaQA1awx3qW0t=fw@mail.gmail.com>
Subject: Re: [PATCH 25/32] dt-bindings: pinctrl: qcom,qcm2290: do not require
 function on non-GPIOs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sept 2022 at 11:07, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Certain pins, like SDcard related, do not have functions and such should
> not be required.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,qcm2290-pinctrl.yaml        | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
> index 5324b61eb4f7..89453cb60c12 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
> @@ -60,7 +60,6 @@ patternProperties:
>      description:
>        Pinctrl node's client devices use subnodes for desired pin configuration.
>        Client device subnodes use below standard properties.
> -    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
>
>      properties:
>        pins:
> @@ -116,6 +115,16 @@ patternProperties:
>      required:
>        - pins
>
> +    allOf:

Nit: I think you can drop allOf here and move the $ref up a few lines.

> +      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
> +      - if:
> +          properties:
> +            pins:
> +              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-9]|12[0-6])$"
> +        then:
> +          required:
> +            - function
> +
>      additionalProperties: false
>
>  allOf:
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
