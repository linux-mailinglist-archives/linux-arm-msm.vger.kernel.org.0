Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C304F7C30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 11:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240158AbiDGJyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 05:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbiDGJyj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 05:54:39 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9A53D1CB
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 02:52:37 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id v75so5119105oie.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yf8JQc9Qjute3HaS4oAxuuK/UMyLcmwrFL+oSYp9c4s=;
        b=f9c6/YdmZ59ENBQIZ3oOlALAZgCDQ1xxl11RbHfKBiRt+gLbsH0LwKSLJyPYqufHuB
         vlCFCpPxeBg1ggL1bM9XQr1luz2yaZuN2XqHd+UF/PR7ZHAhKaKn0qJKHnikzH7Pb0jo
         FD/7hBKLKjvcTQzHkkVVr4ciXIKtKT5VEz97wlVn89LXNi+wtyVxlET7a+QiptsiLEKx
         lK1mQEK9vCfrMPxXMyR7m4YUKBufkmsNiy1WrrWycfc8/6lgEX2LgbBvlSI+SwhV/J1B
         taxE9//5InT8IPDWuYLG+AiPmbaL1vZzsypzuqeeuj3FuaY7Y2nHEoLUl3WvLXPkU7av
         XMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yf8JQc9Qjute3HaS4oAxuuK/UMyLcmwrFL+oSYp9c4s=;
        b=WbuY5zlbGzPG+8h2e2oqQsjSGk9AL8lRKhrO6bQaBrfWfrcCFIBWuv3aibLiVnUafi
         mkwDRLR8AcxOlakJjWgRr9QwhY52vAS0HMcGGPsGXU2kIDyWiz/90/nXx29COp4BHWVj
         9uV68Vn4WPOKWVhrA5QhQQsPUXgAN/e5h5covuIt0XTV4qdGntuoH4h6UTRF9l5MZVlr
         FIpfb8gviG7LEi0/iE9ZuAsB2q1AqUKczkOCBOT/ty1EeoLbVBg0T0HKJ5uSlmgxRVp7
         hM3Ax2tq4ATTm3RofF7MM/YqGZK4d/L9UGMGarLamEQGeFVk+2KHvaZIPQJIduvu5dn1
         luSw==
X-Gm-Message-State: AOAM532aPjj4NQhBCpp6qNYehWsX+Ek41xuLWhgrfcD9EbsMrpI9roJ2
        XjrHlS14SsNu6EMN7eI2ExlTcJElGW3jt6kyGo4pVA==
X-Google-Smtp-Source: ABdhPJxfIYs3oP15TQZ95ML7kXxJZYCzuv9OJyRs5uLFdpahVDzSN+WqzWCtw7pcD5uY2IWTV+DukmbBJrTKg18Gs2s=
X-Received: by 2002:a05:6808:dc3:b0:2ef:86e7:a0b with SMTP id
 g3-20020a0568080dc300b002ef86e70a0bmr5327574oic.48.1649325156785; Thu, 07 Apr
 2022 02:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220403145133.93583-1-bhupesh.sharma@linaro.org> <CAPDyKFp2U0MgrJYeV9T=fJ+82+2OP-VT1rSqgbyrAQM2E9ssfw@mail.gmail.com>
In-Reply-To: <CAPDyKFp2U0MgrJYeV9T=fJ+82+2OP-VT1rSqgbyrAQM2E9ssfw@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 7 Apr 2022 15:22:25 +0530
Message-ID: <CAH=2NtwROCoJ5AKskpa2hc5HU8HXGNo7JJ4b9DVuQuD0RKvJGQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: mmc: sdhci-msm: Add compatible string
 for sm8150
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ulf,

On Wed, 6 Apr 2022 at 20:20, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sun, 3 Apr 2022 at 16:51, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >
> > Add sm8150 SoC specific compatible strings for qcom-sdhci controller.
> >
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > index 6216ed777343..35a7d78da213 100644
> > --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > @@ -25,6 +25,7 @@ Required properties:
> >                 "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> >                 "qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
> >                 "qcom,sdx55-sdhci", "qcom,sdhci-msm-v5";
> > +               "qcom,sm8150-sdhci", "qcom,sdhci-msm-v5"
> >                 "qcom,sm8250-sdhci", "qcom,sdhci-msm-v5"
> >         NOTE that some old device tree files may be floating around that only
> >         have the string "qcom,sdhci-msm-v4" without the SoC compatible string
>
> Even if this is a trivial change to the existing DT bindings, I would
> really like to see all mmc bindings getting converted to the new (not
> so new any more) yaml format.
>
> Would you mind having a look and doing this conversion?

Ok, will send the yaml binding conversion with v2.

Thanks,
Bhupesh
