Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7214E5F2352
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Oct 2022 15:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiJBNVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Oct 2022 09:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiJBNVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Oct 2022 09:21:07 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BF145F6E
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 06:21:05 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id f189so10307313yba.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZZwkz7k64dFZYuHYdeZSaefwEw4J/HEc2WRaMih5KK8=;
        b=vIyrw7Qxg38O2nP1y82PwWWH0YFbhdwSKa8xuw8fA/+HtQ+x6WhYqYzWM19ebeypqp
         4wZH8LaX+Sxi5/jOAO0ovbhngHiFTMi5DArryf4CRorUGV1syXcE3cFFnHKGaTXHXvNp
         0brsvdqi3KU59R5k4tAFE8TixZuKd8xLLlorTvuPA+Ac4am4i3s2ltiee0PaFtect6WB
         n1bok3hW+amHnwLHQCxhA2XAD1UU9R7iISuxcnxNq78fx8bP4PWDlkVWcq0wYxk8VdmM
         +Ts96tJNia3e7IWwqUFmv7l3lxbKBHCVFE7OfhgKZR/FvBOaA74ghcdqc6GsGqzlUb/6
         E0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZZwkz7k64dFZYuHYdeZSaefwEw4J/HEc2WRaMih5KK8=;
        b=QAAtPUkDY9oFNhkjxHX8bTB6Qv1AzDQS7y2GX9PW3qpGTcJ7rJukvTAICRNus85moK
         BswEDjB6g9bofE10/63IR6VStHscLNMTLrIo0XcwdlJePjqv+26/r9inC8VHqFMR5dDl
         htoQmIotD+HzLbNfPaH8bRsVj03DcUHRPvcf6wHa+/aG5isGnobZXTG6mluzgb3GbC3M
         pBBpYcttjFKmvjay5hm4l5KU/UZ7lVVeWdxZVy5y6RUsLWGsbZw+d+reWMjy6lF3rrEn
         jchCHJT+Won7jt0OgZWGIT5NlIV2m0pWZBAXCRrmGWo8IIEno4ZDZ83VPst1ms6f+j4U
         Afvg==
X-Gm-Message-State: ACrzQf3wUH/SUtgnmj3FMFbT0yeDUF/NjWVXykVjGXkgJpdyM8ZSZs/z
        GqdifktfX4skJJhaY7kFb10FNgOh0TB3qfbKm+wwhA==
X-Google-Smtp-Source: AMsMyM70ZqbctjIZ4G6bhXtRRj3qjyUL7l1g26d48Fz39OwONNJzHjFmKvVoZRtnYSYRMGoXSaHzrBdfjhBsB+bUTj0=
X-Received: by 2002:a05:6902:102e:b0:6bd:bdd2:ac32 with SMTP id
 x14-20020a056902102e00b006bdbdd2ac32mr344177ybt.516.1664716865195; Sun, 02
 Oct 2022 06:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
 <20220930212052.894834-2-dmitry.baryshkov@linaro.org> <b3b2dc79-30cc-a768-e7bb-d5e8ff3f6ba0@linaro.org>
In-Reply-To: <b3b2dc79-30cc-a768-e7bb-d5e8ff3f6ba0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 2 Oct 2022 16:20:54 +0300
Message-ID: <CAA8EJpqA5uO+Nfo571qAbQ5KxatsVcp4Mkyxn0h5NR5dEot1eA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: qcom: mdm9615: drop unit ids from PMIC nodes
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Oct 2022 at 12:40, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/09/2022 23:20, Dmitry Baryshkov wrote:
> > On MDM9615 the PMICs are connected using SSBI devices, which do not have
> > any addressing scheme. Drop the unused unit ids from PMIC device nodes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm/boot/dts/qcom-mdm9615.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> > index b47c86412de2..bb17a57a2b90 100644
> > --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> > +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> > @@ -283,7 +283,7 @@ qcom,ssbi@500000 {
> >                       reg = <0x500000 0x1000>;
> >                       qcom,controller-type = "pmic-arbiter";
> >
> > -                     pmicintc: pmic@0 {
> > +                     pmicintc: pmic {
>
> I think several other platforms, also with PMIC over SSBI, have the same
> problem. If that's correct, can you fix them in the same patchset?

It was a part of my previous patchset, but yeah. Let's get it done in this one.



-- 
With best wishes
Dmitry
