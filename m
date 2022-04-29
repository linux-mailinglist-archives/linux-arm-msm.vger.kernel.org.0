Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F00B951502E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 18:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbiD2QGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 12:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378753AbiD2QGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 12:06:35 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0C66A435
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 09:03:16 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2ec42eae76bso89877557b3.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=weVUNOweEKuBnOgbTT5sRsubKFtsUKuKJQ1Z2ZMEyQk=;
        b=ktuMVBY3hzkXH24i9FvxhrVi5t/aZModgQunaWbvlAtnM53jhHuWMasNMZzQL5NU2v
         IDW2KYoOMpVcSbret2ZelAh1luFQmP+z0q1h6YAt9090HrsVp+boZ/It7uTrSZ1AxOgr
         fiAPxFp1uAWXbByuRmEGlIChZrg+R3g48Thg51O4qqE5akQ6tjZ3Jnav0cnBCvz9Amhm
         WjzjSwc/chzd50zhhaQx7JDxy/W3Q1cxDoZseHtub6LFR0M+HrU1hNP18hHh6W6R9Awq
         U4CLPUqtIJx4PzdOZ9Z3fvZbM0ZpJ/i4JJl4EiXanuD0+J6MAY2QLD1RR9yHvuJFk8xl
         h+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=weVUNOweEKuBnOgbTT5sRsubKFtsUKuKJQ1Z2ZMEyQk=;
        b=CJweYRBr/WdIvMvDUcA14B6aWnlsSsY3jtua64PD19BEsK64uqWy4ifLk/EXt75vl5
         npYtPugiwQZydG4BSQVkh6zfgKWGMlFDymlPTij/Diu54t2K8GP1S85M0YmSmiH/7xOH
         ZR1bcVxWXT2N9m/i6lky/PQKnCBw23A0ry4SPLma6zKG2PQyLY+z9hB1oozfPl/FmPkG
         e4wnnhD9G8K9k44jcovGyUAb/+4S7dRj8HF04FPxqq5EhgebvBluNOh6WYaOoH7jM7C4
         WcBLRAEfDLL34vuWCmUt4lLgKxRh9pV7KgkTSuPXpYBRlXbotQ7jEgShkYwsTyQhrjgp
         g5gQ==
X-Gm-Message-State: AOAM5308teW0q4QEo8pbiz5Jdeovc+E/qvvcBdib2Oi6Zy/AZSboLLYw
        eQ98Q7FrTJ/dzW7RwGITqR0+vSDJR/sNDEoTTMeKQA==
X-Google-Smtp-Source: ABdhPJzk62ofT4JmF5QwOrBYsJ9viJWc9NtUrS4CcwDplIfqkHLFEiAGrAWs6uyCLeRCdBNGfPhopEY3GE0WTk+bBv0=
X-Received: by 2002:a81:4c11:0:b0:2d1:1925:cd70 with SMTP id
 z17-20020a814c11000000b002d11925cd70mr38033089ywa.101.1651248194446; Fri, 29
 Apr 2022 09:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220429121739.28584-1-ansuelsmth@gmail.com> <20220429121739.28584-4-ansuelsmth@gmail.com>
 <1651247596.124069.2344494.nullmailer@robh.at.kernel.org> <626c0b64.1c69fb81.1b1e9.4fe6@mx.google.com>
In-Reply-To: <626c0b64.1c69fb81.1b1e9.4fe6@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 29 Apr 2022 19:03:03 +0300
Message-ID: <CAA8EJpr4Qsiop5_6Ad1dT-i-xc4RkOot9UedDtp6ViEYpc46DA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: arm: msm: Convert kpss-gcc driver
 Documentation to yaml
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
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

On Fri, 29 Apr 2022 at 18:59, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> On Fri, Apr 29, 2022 at 10:53:16AM -0500, Rob Herring wrote:
> > On Fri, 29 Apr 2022 14:17:39 +0200, Ansuel Smith wrote:
> > > Convert kpss-gcc driver Documentation to yaml.
> > >
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  .../bindings/arm/msm/qcom,kpss-gcc.txt        | 44 -------------
> > >  .../bindings/arm/msm/qcom,kpss-gcc.yaml       | 63 +++++++++++++++++++
> > >  2 files changed, 63 insertions(+), 44 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt
> > >  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml: properties: '#clock-cells' is a dependency of 'clock-output-names'
>
> Erm how to fix this? I can't do a 1:1 conversion if the source was
> wrong and also have no bot warning.
> Or I should just push an additional patch to fix this error after the
> conversion?

You can fix obvious simple mistakes and describe your chains in the
commit message.

>
> >       from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml: ignoring, error in schema: properties
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.example.dtb: clock-controller@2011000: '#clock-cells' is a dependency of 'clock-output-names'
> >       From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/clock/clock.yaml
> > Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.example.dtb:0:0: /example-0/clock-controller@2011000: failed to match any schema with compatible: ['qcom,kpss-gcc-ipq8064', 'qcom,kpss-gcc']
> > Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.example.dtb:0:0: /example-0/clock-controller@2011000: failed to match any schema with compatible: ['qcom,kpss-gcc-ipq8064', 'qcom,kpss-gcc']
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/patch/
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit.
> >
>
> --
>         Ansuel



-- 
With best wishes
Dmitry
