Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A226FC4DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 13:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235275AbjEILV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 07:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235371AbjEILVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 07:21:33 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F3B46B9
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 04:21:32 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so29908255276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683631291; x=1686223291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z+5wgGTHu+kyiCkcb2BDZZqbKYIviJyARRNcsDbyCCo=;
        b=hTQmIxGPQHd+3VPhdQTNEZ+mj7nR94hBBUkKAJGcaKDNNXdg0yP9zzBJkx+hpvLCaS
         hVnodW8nCDACmp6QczzBoIgiZQrdv7nEVnxf1APtG+85dzYjXjRkF8M4OldPeC2NnU3Q
         1jTJV6it9LA6wFfJ8XgvrlHKfhLcFXDyoLg7OC4/L+WA+N8xWv06yBi5LXmekQ8NZmyR
         +VBa6CtZ/CjjUhukszzG+c4W9/pMXFZMuJbW78WPE+Fi5whAtGs3g2Z/H+j3xBRTbfBn
         QstIhSATC7nV2sCeDrhTYeMAQ3I2HzcqZAb+IMTeQPFZlbO9OmQopZRCzRTtTf3FMBZk
         iFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631291; x=1686223291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+5wgGTHu+kyiCkcb2BDZZqbKYIviJyARRNcsDbyCCo=;
        b=QrI83mFPVO6I7ImkQQYsXaiEkumCkxY8ti4yt5kRxX++/grHWVeXjUmFAgkirGC1GU
         UNlsWZZVkfn0X4wNZLRmUVsspYN4TTwh68ThwXuwSS0pkbN+YW9noCTUruTv25oi38KH
         BEFkANayPtIYpyyg5674aG9g4xWgFivFfzrlrhHfql1ElhpXYblJdkSzJBJu2Nr0Ihnq
         o1n9n/CwM1UKLQV/vsPsnww/9f0EpM3d4VkAG/fL5/zzWP7ad0bbjpuNrsGalymx7nmZ
         uYYipvp9YWDQ0k1SarJXDmU5G2NPTOT7wV7Npfz3bDOaaDyq3LVGTFVgNN9zM/Y8E4sL
         +m6Q==
X-Gm-Message-State: AC+VfDw2oy94tmTcs3LU4qnWJ9cYaU8q0hr2JFd88FWNZ48rM9pJuirm
        e8Vah/kaHGDtDJLo/UZpJuw6NXKKgVD2b1K7z9jmFQ==
X-Google-Smtp-Source: ACHHUZ6I3laB3qX+d6kiVRNbsCRL8FDtwxlB9jIo5gZ+eIhDl3++/2JqcjYVJUElpA+l9WZLRn61YReK93HU04gABbg=
X-Received: by 2002:a0d:d545:0:b0:55a:64b3:fc13 with SMTP id
 x66-20020a0dd545000000b0055a64b3fc13mr15882690ywd.1.1683631291698; Tue, 09
 May 2023 04:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230508160446.2374438-1-dmitry.baryshkov@linaro.org>
 <20230508160446.2374438-2-dmitry.baryshkov@linaro.org> <32d6b9be-58f1-1d63-2c1b-de9f7ba7b3b5@linaro.org>
In-Reply-To: <32d6b9be-58f1-1d63-2c1b-de9f7ba7b3b5@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 May 2023 14:21:21 +0300
Message-ID: <CAA8EJpr4yC8sKsvscSK3FtQdM7fFUJAbA6zogzAo96U0MxvKDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: power: reset: qcom-pon: define pm8941-pon
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 May 2023 at 11:53, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 8.05.2023 18:04, Dmitry Baryshkov wrote:
> > On PM8941 pon doesn't store the reset reason. However we still need the
> > wrapping node for pwrkey and resin nodes. Add bindings for pm8941-pon
> > device.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Should probably also disallow setting reboot modes!

But we don't set reboot modes in DT!

>
> Konrad
> >  Documentation/devicetree/bindings/power/reset/qcom,pon.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > index d96170eecbd2..0f4f55dd4eac 100644
> > --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > @@ -19,6 +19,7 @@ properties:
> >    compatible:
> >      enum:
> >        - qcom,pm8916-pon
> > +      - qcom,pm8941-pon
> >        - qcom,pms405-pon
> >        - qcom,pm8998-pon
> >        - qcom,pmk8350-pon
> > @@ -63,6 +64,7 @@ allOf:
> >            contains:
> >              enum:
> >                - qcom,pm8916-pon
> > +              - qcom,pm8941-pon
> >                - qcom,pms405-pon
> >                - qcom,pm8998-pon
> >      then:



-- 
With best wishes
Dmitry
