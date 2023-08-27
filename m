Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB04789D08
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 12:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjH0KnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 06:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjH0Km6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 06:42:58 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55492115
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 03:42:55 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7481bc4d6fso2337416276.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693132974; x=1693737774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k41heu0RFGj/vrXovP4h2JkqRtCjrg3Oa5aQHew6OZI=;
        b=ZMp4b9BtnylggkfxoR0PEZ4kPqeyouzQF22L8XryGFq3IllFrZbTQSt/avRB1fl8kF
         Tnw3T7U+zb1zRGJ0aSz+1dJxaEYHqJCof86r5SgftkIOp7NEXSG0lip66Jm8zS9d07Kh
         HQGFXyoJLfFdXjq9F9IE4LfSOijHAdfmBATzch4phXQTDiHNGfDnCUwuxxMrJuUT/rxE
         MTbIY60fprAgVatmHtKsQydV2D3dqRQQJqqyySM/QtMEFh7SR/qOtA4BdnWh0SrePLte
         AOkBIs6GbOkmX46uipSV44xesiMeGNwJAvVkGYlYzNnzhB+6/rbAVaRYc9aY1pQF0DQk
         bZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693132974; x=1693737774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k41heu0RFGj/vrXovP4h2JkqRtCjrg3Oa5aQHew6OZI=;
        b=YzzsMwhAmvnyorDN3xnQhIbzZRYuNc1B3iui/HEjRIFL6vkL+cFZANejapMycUUXo7
         bjXcUwD4F8Xb065vED5K9UC14XJUOU1QFCFsCsmU+uEw9/5XFLrW40nJ3lJgoDkgHuY6
         hUlAmXlM+q0tjV0ALqjzubWJFh6Eg0WZ9BR67W4qZvP76vxnWzyLqzUXkjY0wd+po9b1
         FPUj9SEAKcJ2z1y+YMAd51HDA2m4L29KPP5eNlKsX1krlx0U8DiS4W5ZF5viw/g/LzAh
         EJENzfeKe9FZSK0s84VJlmU5ZA+r9bILaEfUxxNX4agCk+LnZiihEmHfEaFjHAkcl7mA
         uBhA==
X-Gm-Message-State: AOJu0YzC+KQmFxfTeBlh8ypx1xB7evK91nO+UVKs7FnEF9zUTAv5e6yB
        5NwHXyqRtOku3H6GZ3jb1RMN1tSZkn28PRlO02kPbg==
X-Google-Smtp-Source: AGHT+IEx2QsidMoNBEfib6YkDH1+NVBGaRUuwBcuraejSMFrOy5gRemXBeHXtgHEXQAgMU+lysYcNBCZ1jSqX9gjwFY=
X-Received: by 2002:a25:8741:0:b0:d66:d468:62c8 with SMTP id
 e1-20020a258741000000b00d66d46862c8mr21957186ybn.63.1693132974450; Sun, 27
 Aug 2023 03:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
 <20230827005920.898719-4-dmitry.baryshkov@linaro.org> <39af3ab5-4fa5-5b3c-395a-e86e70bbe803@linaro.org>
In-Reply-To: <39af3ab5-4fa5-5b3c-395a-e86e70bbe803@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 27 Aug 2023 13:42:43 +0300
Message-ID: <CAA8EJppw0Kxo3W560ucWey959368M1c8BFnvF4Ggi5XKCOfesw@mail.gmail.com>
Subject: Re: [PATCH v4 03/38] dt-bindings: mfd: qcom-pm8xxx: allow using interrupts-extended
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
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

On Sun, 27 Aug 2023 at 11:35, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/08/2023 02:58, Dmitry Baryshkov wrote:
> > Allow using interrupts-extended, which is a preferred form of interrupts
> > specification compared to the interrupt-parrent + interrupts pair.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> > index 7fe3875a5996..33d9615e63c8 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> > @@ -37,6 +37,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  interrupts-extended:
> > +    maxItems: 1
>
> The entire patch is not needed. At least should not be needed. What
> problem are you trying to solve here?

The main problem is the next chunk, which (currently) explicitly
requires `interrupts' property. My goal is to allow
`interrupts-extended' in addition to `interrupts'.


-- 
With best wishes
Dmitry
