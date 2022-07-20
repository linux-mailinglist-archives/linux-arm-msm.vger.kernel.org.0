Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9BB57B92D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 17:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240385AbiGTPHf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 11:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240332AbiGTPHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 11:07:33 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0562558DB
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 08:07:32 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id b11so33542847eju.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QLkLqL61DDqJ9IAVUdmTVDocJg5pLEqlAURJ5AHPPUk=;
        b=jwiuRcsVxReYTQwzNleS0OK+pJTpyysxB+6naxh1/qIV3RDFn0d/Gah6qlvxG7mYR0
         +Ae6/nMY7OPLolxegD4LWlydgrTVuRzzVTAiuQHwCiE+AkUiVyb3/6ZBLWYAN2A6T8iR
         nsCrclsH10l+1H/sy8X2ZWmsfqB6oGWuSZZdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QLkLqL61DDqJ9IAVUdmTVDocJg5pLEqlAURJ5AHPPUk=;
        b=fTseVmb40rGQ8DLBnLrT3XtnqevdxdgtcqSNWV3Ih6d8hf0ztytW4KkWi3U69ozGpR
         qD1eu9f4SnLRkJOn1zYiGSfyyo0yFQBEEptvwJ8cP4vFCKI9aio//ETJkYlLSJ/kVgL8
         vTuQc1RFR9A4JQaFMz5t4bxujUKyf/RdCwGZukFK2Mgg68mshaH9BfMSB3/TlBp4B7cO
         ajBqB+GMxMsVZVtC8D1umsD527WDQnc5pYGq0QJLzigLFCjswxqjrT8L6mx/uL8+nNpH
         eTUnXETYWEYJQ0jD2q+jG51zk96V90XWCnmQZ/b0yfpA3fRe5+bxVY0ue9wk5kQqwyxr
         csJQ==
X-Gm-Message-State: AJIora/o7N9tLP0yCLUgKfXV9bcxZezDFWR4LZO9pxISJSzoJKK/ijSO
        rBPYjv+hi6ebshZ2oi0uR6Eo7UnIu28d6pErH4Q=
X-Google-Smtp-Source: AGRyM1v/29kDU+kjhbaucNRGuJm50RuPqrg3FTVusYTByVGHaUV/Zzsq1fP5wSGtREGqSgJFCrb/tA==
X-Received: by 2002:a17:906:9b86:b0:72f:56db:ccf3 with SMTP id dd6-20020a1709069b8600b0072f56dbccf3mr7867349ejc.422.1658329651397;
        Wed, 20 Jul 2022 08:07:31 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063e1600b0072aadbd48c7sm7936491eji.84.2022.07.20.08.07.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 08:07:29 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id i132-20020a1c3b8a000000b003a2fa488efdso1534928wma.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 08:07:28 -0700 (PDT)
X-Received: by 2002:a05:600c:1549:b0:3a3:2aa2:6f60 with SMTP id
 f9-20020a05600c154900b003a32aa26f60mr2807595wmg.57.1658329648175; Wed, 20 Jul
 2022 08:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220720073755.1.Ifab936517646b3876dd31b6e9b1b58a858529e57@changeid>
 <4cc6a276-4cbe-506a-6425-677c56469645@linaro.org>
In-Reply-To: <4cc6a276-4cbe-506a-6425-677c56469645@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 20 Jul 2022 08:07:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WP22g2ZhyeGeYJcGtQTBeKjinxQRCXicHxeVh-ziC8iA@mail.gmail.com>
Message-ID: <CAD=FV=WP22g2ZhyeGeYJcGtQTBeKjinxQRCXicHxeVh-ziC8iA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document additional sku6 for
 sc7180 pazquel
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 20, 2022 at 12:46 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/07/2022 09:38, Yunlong Jia wrote:
> > The difference between sku6 and sku4 is that there is no esim
> >
> > Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> > ---
> >
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 4dd18fbf20b6..aebeefdab27f 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -410,6 +410,7 @@ properties:
> >        - description: Google Pazquel with LTE and Parade (newest rev)
> >          items:
> >            - const: google,pazquel-sku4
> > +          - const: google,pazquel-sku6
>
> This looks wrong, did you test it?

Why do you think it's wrong? This patch is adding a second compatible
string to an existing dts. The only difference between SKU4 and SKU6
is that one of them has the eSIM component stuffed and the other one
doesn't. This need not be represented in the dts since the eSIM is
automatically detected, but it was still stuffed as a SKU strapping so
the factory could tell whether the missing eSIM was an error or
intentional.

This is just like the SKU0 vs. SKU2 difference.

Other than the fact that this should be together in one series with
the dts patch:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
