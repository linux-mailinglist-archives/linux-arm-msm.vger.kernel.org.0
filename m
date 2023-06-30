Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37BAB743912
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 12:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjF3KLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 06:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbjF3KLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 06:11:17 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB552974
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 03:11:14 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bdd069e96b5so1551125276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 03:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688119874; x=1690711874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CLtUYyJmFpXUCnBKaPjwc0ogntOCCD1dJe6EQNzDukc=;
        b=K/PHv47I1EdBLnMKJScBAO17etXkyuYbmR3ZAxaY8m0EoWiZRPoRWD9CUpmeW0F1QM
         zr5IxjAGQJujaj9K2GYQ/ieXDYTsX3Trjo+NRScTv6icavfbKMoheDZSoktyYgQbJ7bo
         ofV+lnJLss/vo3X8VPukrkmK4hTpJGTsbdrEwckwg2rWkS702ppluoSOnN81FAzj5rTc
         WX0QBzK16uSnEqEVk2b0HI5xUUTgBjHZZ3PCZ8F/UnRQbK4fxEr7R1s7YuTtJ/BeLffl
         YKM3wntm/j4zl8wBCb6+DakBFzqiOnEH7OPpWDJoxUPn0a/GnUteTE7N586BAFn6nvZm
         024w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688119874; x=1690711874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLtUYyJmFpXUCnBKaPjwc0ogntOCCD1dJe6EQNzDukc=;
        b=HZ/VYQcQOUSTmqpVOyt5apOdxG6NEWFEuLYT0Q8ggk3U8Mdm51d0en9v9Vjd8uU/mQ
         dea/HG8IcgV9RRzPVutXhFF35N1idbYkJa+ACQdVrHB8jHye0Ldhh3cU2+yuLn8/mcuw
         wjx2wGEAo4D162nVB1KeUL02h7xeg9ZanW0PrwiUTuAMAproMCChcxZNVaqy6oPMXg2m
         /jtX1GynKljx4YYnGz2Uqk1aDCEbwm3fhFHMJQplwT9Ghk50YK8avUHrPuoLgboBNXFU
         ysEGYESU6S7uxyikUIHK2ZhmsFz69QGgWJI6H2AHuzAmF6oJGgwYcsqFLogkel4ozclI
         I0GQ==
X-Gm-Message-State: ABy/qLZB/SXHg48VmVimUgdBATh5pCdKEJSKWkOPkfOjK8FHENwm22+c
        2E7RDqHD1j+eujJMxZ4hN6wyRT66rwu492Q36LpyKg==
X-Google-Smtp-Source: APBJJlHz/+lBf2xIzCqumkGSGKATewiFsUktYKSV0T6KuihVET8RlH7UaaDTtj3Rhrb0Ho7nqoMUB9giITwWIvhJwoU=
X-Received: by 2002:a25:ad06:0:b0:bc6:91e5:7b4e with SMTP id
 y6-20020a25ad06000000b00bc691e57b4emr2394673ybi.13.1688119873996; Fri, 30 Jun
 2023 03:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-5-dmitry.baryshkov@linaro.org> <4c7377c8-eca9-5614-9c71-d90c091f134d@linaro.org>
In-Reply-To: <4c7377c8-eca9-5614-9c71-d90c091f134d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 30 Jun 2023 13:11:02 +0300
Message-ID: <CAA8EJpoeNawPtpnz+mC0W94bcfZPn87+saQ8wxNX+5Wxx+ZLTg@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: pmk8350: fix ADC-TM compatible string
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
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

On Fri, 30 Jun 2023 at 11:13, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> > The commit b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for
> > pmk8350") for the ADC TM (thermal monitoring device) have used the
> > compatible string from the vendor kernel ("qcom,adc-tm7"). Use the
> > proper compatible string that is defined in the upstream kernel
> > ("qcom,spmi-adc-tm5-gen2").
> >
> > Fixes: b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for pmk8350")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Well actually, adc-tm7 would be the correct compatible (PM8350X is PMIC7)
> but it never landed on the driver side..

I also thought so (and started implementing adc-tm7), but then I
stumbled upon the commit 96f6f333bcf0 ("thermal/drivers/qcom: Add
support for PMIC5 Gen2 ADCTM"), which clearly tells:

    Add support for PMIC5 Gen2 ADC_TM, used on PMIC7 chips. It is a
    close counterpart of PMIC7 ADC and has the same functionality as
    PMIC5 ADC_TM, for threshold monitoring and interrupt generation.
    It is present on PMK8350 alone, ....

So, this is the right compatible for PMK8350.

>
> Konrad
> >  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> > index bc6297e7253e..1eb74017062d 100644
> > --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> > @@ -59,7 +59,7 @@ pmk8350_vadc: adc@3100 {
> >               };
> >
> >               pmk8350_adc_tm: adc-tm@3400 {
> > -                     compatible = "qcom,adc-tm7";
> > +                     compatible = "qcom,spmi-adc-tm5-gen2";
> >                       reg = <0x3400>;
> >                       interrupts = <PMK8350_SID 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
> >                       #address-cells = <1>;



-- 
With best wishes
Dmitry
