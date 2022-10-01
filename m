Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2775F1A87
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 09:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJAHOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 03:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiJAHOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 03:14:10 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18CB5F13D
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 00:14:08 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 81so269365ybf.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7ue00wyDQ8ycUSRPgbYo15PRoBs6yC8KtymaqQ2kQws=;
        b=V8S7xMkKB8LxnpjClzNYnqqYUOHVR5IoKwSjTrUKqdMcznu8+8TjbH1IIf44DhJ6nG
         7Dk/yOSlBvcd/XwMgZbDhCqINA8IEhM4ju3RHcwj6Y+YoZVZdMsQ/gPz5y9SuRvPNutb
         jmV8CGdMTLw7fL3H55NCpT5jZhclV89iPtyG83wTNbkc2m5xMMo+qqGwLmXRfoG0LetY
         Y2eXFCOHJttOiFRTseVmiRRH0r3zZ78J+PQ5r5jQ0OakJO6jeLdnApBCuRB+3sd332g5
         oPFicevFdOuBqJtuaYb2X+qz8996tK2bCqibp+tWrz8e/5LzIsrP+TGQcjOYbir8oSfH
         jD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7ue00wyDQ8ycUSRPgbYo15PRoBs6yC8KtymaqQ2kQws=;
        b=vL8O9Gj+Nq52PJE55Cb3ADA+X9RmcwtP/JrNd6S0KZp1uzdYDmo3fsiR5Q0Yx8m1L5
         i7njLJmnRIoKzOvXrbfSSgHoJ55aDmzkEZ/9v4XmKJfobOYx/TVtF4x+AHKjyTBRjg5H
         sGqbheiONG6QPyrZDHJ7Tov8AsGHVfBls1gjK1XlnRcFijzUi9HS2F3K6A99q5Jt38yZ
         Ks9NlCzVA0or8fDHeSdtrUdADk/xP0w90AXY0gLpwZx0P22o1AnlVCiDiXoJW2KTG2ke
         W8kAPLimdexbHXtIZGAUSP+m3jrVns/ba45bhJzQP64QpdHmNtqrEtzRRnQTDkdJ7ZO/
         n0cw==
X-Gm-Message-State: ACrzQf15I/UBkTZ9s/zsYtFchevvIYHKjCfeman2xTmOsq0BJiXFuGom
        UUal7cRrlGNc9VN2Etir7zhVJojgfYibkJp11WLZrewgaas=
X-Google-Smtp-Source: AMsMyM7oJ0p65XoYBq5LSSqHJKDAIk67BF452YFYa2UMr/VG/BxY67wN0a+Cq8WpTODQqJHR8sfRB0fvpubzUG5Hxdo=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr12061140ybj.194.1664608448066; Sat, 01
 Oct 2022 00:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030627.29147-1-quic_molvera@quicinc.com> <20221001030627.29147-2-quic_molvera@quicinc.com>
In-Reply-To: <20221001030627.29147-2-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Oct 2022 10:13:57 +0300
Message-ID: <CAA8EJpo5x4Wva4thoryvh3_jf9WssbRN=94fNq8Xwvph75G_iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: qcom: gpi: Add compatible for
 QDU1000 and QRU1000
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Oct 2022 at 06:08, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add compatible documentation for Qualcomm QDU1000 and QRU1000 SoCs.
>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 7d2fc4eb5530..e37cee079c78 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -25,6 +25,8 @@ properties:
>        - qcom,sm8250-gpi-dma
>        - qcom,sm8350-gpi-dma
>        - qcom,sm8450-gpi-dma
> +      - qcom,qdu1000-gpi-dma
> +      - qcom,qru1000-gpi-dma

You know my comment, qdu/qru comes before sm/sc

>
>    reg:
>      maxItems: 1
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
