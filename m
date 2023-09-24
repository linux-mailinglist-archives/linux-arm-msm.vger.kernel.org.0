Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F267ACCD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 00:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjIXW4o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 18:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjIXW4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 18:56:43 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EB0C2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:56:37 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59f6492b415so21157847b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695596196; x=1696200996; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/OCpxsqA1Y/jeI3EOfXWsSomtPtLJuDDitF/d/2TRO8=;
        b=pOFMo2KsPoPjmVs4S/apNeTYOoSF7X1odBJqQgCMVuW5WGmp1U2fpAw/qKa9g1/Dog
         v/tQzWzo2oNH2UGERTkmLpO4uK7rQqGPX3XMk5+24KHC0hGmFvnseLUWQsKEMFhNwDi1
         Zt9yxwWYpn4vexxkEMUbScmYJEUAT2o6+/S7eVzlrGrbKFE+2xGpBw6C6v8ZS7/a1TE1
         YDLBExD531fjPbEA8Drtn966AJ+uk8PV1thpwdegx9D1z4VUq6mQSBz2ZYFTnFcezgOz
         NpvH4nrUw4Ts2QRyrC5aqSamRSC5ZYA0hYvDgjzpW5TfMLq+ujwz+UflMYscDEB6qJc3
         w+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695596196; x=1696200996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OCpxsqA1Y/jeI3EOfXWsSomtPtLJuDDitF/d/2TRO8=;
        b=hOdoJi2hDFWUFaGvNzwG9ser4xWqHbOxBtyfICmrU+Q0k2NmXxpYDXFK4AHLsMXAlr
         1phyYzmxi00Bk/nEjw5WWt/vEFbLDRe7Lf5g1MccaibAJdMv4uJ9OliwjSs4k9T/P0KX
         2njlRdU85gXioGADURFx58eYUUc4DFTeCHsw6QwuNoTPkATtvut8ViEmCRFjXB3UeRG7
         tZ1sw+zMa7hi0rloP7BKJBVdzzmEQyo8LZ74NAY3zcM6pRWUOk2zWX5PV8ooe273W/Xu
         9crlBKd1jdimMshncOXszRU0MHw8RNBhl9qtWhDyQmyf0/BvitGCD0kJsxMYROzi+JzX
         d4ZQ==
X-Gm-Message-State: AOJu0Yza0ri43BUsyYA9XFLhHV1lfl+tiSWhofNdIjvYCCd62IDhrvlc
        AX3Q8VRGKvNI8hCMCeckgPkDAiBlhCmJcIeNbG58Iw==
X-Google-Smtp-Source: AGHT+IEs0XFYwctfCXHL/J4ultHRrsFiwe6xHjtkwvdJwPf3yKHbw4J3FWqbTJ/w9j6wFqh78QJ1eozn+1utWQi7wZs=
X-Received: by 2002:a81:6f8a:0:b0:59f:d01:779f with SMTP id
 k132-20020a816f8a000000b0059f0d01779fmr3582455ywc.23.1695596196669; Sun, 24
 Sep 2023 15:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230924183914.51414-1-krzysztof.kozlowski@linaro.org> <20230924183914.51414-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924183914.51414-4-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Sep 2023 01:56:25 +0300
Message-ID: <CAA8EJpq2ihZ=tFp3MtukNOO2KWQr0SixRg7=M0DA9adgsCFjMQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 4/4] ARM: dts: qcom: ipq8064: move keys and leds
 out of soc node
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Sun, 24 Sept 2023 at 21:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> GPIO keys and LEDs are not part of the SoC, so move them to top-level to
> fix dtbs_check warnings like:
>
>   qcom-ipq8064-rb3011.dtb: soc: gpio-keys: {'compatible': ['gpio-keys'], ... should not be valid under {'type': 'object'}
>         from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts |  55 ++++----
>  arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi | 122 +++++++++---------
>  2 files changed, 88 insertions(+), 89 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
