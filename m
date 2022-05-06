Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC79C51D05F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 06:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389022AbiEFExq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 00:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381291AbiEFExo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 00:53:44 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762DD64BE2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 21:50:01 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-ed9ac77cbbso6214268fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 21:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DbTzwaOIwGb0TT9g7l9scXPT5GJOJT3bNtMetNu/grc=;
        b=eXe7FpyIvy/UsDfzb+KAq06m2NMeOXCv/ETzKBWhqS0aa07hSWrTl4DVQUOo6NKOY9
         w0ZfIJlEWQv5Sl1b+pn0sCjhku04Us84QTUu5ijuCvP8heGKe+EG3bb30BjdTGV8stol
         S4QZtWZfTmvzIdfdW+Knm8pXO9aUCfiSnSzomv+jqlqbDjKstPoNw4ONvn+jbgJsVsBD
         PKh5+dxJ1RqKbvRvARQ6Wgb5y4GW4b7b5dppVER/XRm/EGGXv589hKLinRYmySy+5tBn
         QMis9hgc7PMa4HI1D/Mcjz+FdygCrvXyshA2BLzOiSgnDjmyM1KbfG6ElxfznzR+LLVx
         aTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DbTzwaOIwGb0TT9g7l9scXPT5GJOJT3bNtMetNu/grc=;
        b=zt4b0ED5bnUrdSduCr9ZFHuD58C58d+9iAyonJnOPRowLbT3L7QP5XOa2TjHKbu3Oe
         m73gUBU2ZTJb5L5VvxUaFkgRsJA7L6jPO4GBoiuGHyQJb0P85SEQWYOXT1eGSRoQnxRT
         K72Yo/hhVqHqmvnG6HlJBVuYLmSw30fJgX6+QL7Bp5xjXVRd0u9U4Y2J+2oj9hnV484B
         dEdB39HnyXXrDLJMjHlnBO+G4/GG+rCBAA3SNzGaISs2Xi1Io/Of0aztOjk0/UoAr1WG
         GuZrBPH3/zvqkpRqwY35ROvdI6Fr0nB5lASRCG51e5IDsIIGQwvoUlx7hoZn0Zdepqc1
         cFdg==
X-Gm-Message-State: AOAM530m/cYmNsMLFW8DoIv5aqQIvwDg+7NvJnoiKXMsnTXFmt6OTOdS
        JSw+jbeabuiVm64IwcUF26IURY/uTqmbEBeFvvmB8g==
X-Google-Smtp-Source: ABdhPJxtggnbKMD7VEvQYkEJDSwVOJ5H+Z9F5ubmhLXSslQkDEcU50IdroxLWZO4nFbW3RNSQtfQJ/cxdPEDGtfzVTc=
X-Received: by 2002:a05:6870:b50d:b0:ed:e8f5:b1cd with SMTP id
 v13-20020a056870b50d00b000ede8f5b1cdmr565395oap.147.1651812600715; Thu, 05
 May 2022 21:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220429214420.854335-1-bhupesh.sharma@linaro.org>
 <20220429214420.854335-3-bhupesh.sharma@linaro.org> <YnSTFRuMDFYclHYh@builder.lan>
In-Reply-To: <YnSTFRuMDFYclHYh@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 6 May 2022 10:19:45 +0530
Message-ID: <CAH=2Ntz3eE2yFQjuqhSr-LZ3_Uqc8NwMyuH7HL1oqymyMkfsQA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Fix node names for sdhci
 'opp-table' nodes (across dts files)
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Fri, 6 May 2022 at 08:46, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Fri 29 Apr 16:44 CDT 2022, Bhupesh Sharma wrote:
>
> > Since the Qualcomm sdhci-msm device-tree binding has been converted
> > to yaml format, 'make dtbs_check' reports a number of issues with
> > node names for sdhci 'opp-table' nodes, as it doesn't seem to like
> > any 'preceding text or numbers' before 'opp-table' pattern in the
> > node names.
> >
> > Fix the same.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 86175d257b1e..b6df3186e94c 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -725,7 +725,7 @@ sdhc_1: sdhci@7c4000 {
> >
> >                       status = "disabled";
> >
> > -                     sdhc1_opp_table: sdhc1-opp-table {
> > +                     sdhc1_opp_table: opp-table-sdhc1 {
>
> There's only a single opp-table child node of &sdhc_1, so I would prefer
> that these would just be:
>
>                         sdhc1_opp_table: opp-table {
>
> Like  what you did in the sm8150 and sm8250 case below.
>
> Can you please update this accordingly?

Sure, let me fix these in v2.

Thanks,
Bhupesh

>
> >                               compatible = "operating-points-v2";
> >
> >                               opp-100000000 {
> > @@ -2609,7 +2609,7 @@ sdhc_2: sdhci@8804000 {
> >
> >                       status = "disabled";
> >
> > -                     sdhc2_opp_table: sdhc2-opp-table {
> > +                     sdhc2_opp_table: opp-table-sdhc2 {
> >                               compatible = "operating-points-v2";
> >
> >                               opp-100000000 {
> > diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > index fb1a0f662575..87a5d72b2ca0 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > @@ -497,7 +497,7 @@ sdhc_1: sdhci@7c4000 {
> >
> >                       status = "disabled";
> >
> > -                     sdhc1_opp_table: sdhc1-opp-table {
> > +                     sdhc1_opp_table: opp-table-sdhc1 {
> >                               compatible = "operating-points-v2";
> >
> >                               opp-19200000 {
> > @@ -941,7 +941,7 @@ sdhc_2: sdhci@8804000 {
> >
> >                       status = "disabled";
> >
> > -                     sdhc2_opp_table: sdhc2-opp-table {
> > +                     sdhc2_opp_table: opp-table-sdhc2 {
> >                               compatible = "operating-points-v2";
> >
> >                               opp-100000000 {
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 2700a8145cb9..e265d61f7c05 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -3563,7 +3563,7 @@ sdhc_2: sdhci@8804000 {
> >
> >                       status = "disabled";
> >
> > -                     sdhc2_opp_table: sdhc2-opp-table {
> > +                     sdhc2_opp_table: opp-table {
> >                               compatible = "operating-points-v2";
> >
> >                               opp-19200000 {
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index dc2562070336..5ca16f76ddeb 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -2937,7 +2937,7 @@ sdhc_2: sdhci@8804000 {
> >
> >                       status = "disabled";
> >
> > -                     sdhc2_opp_table: sdhc2-opp-table {
> > +                     sdhc2_opp_table: opp-table {
> >                               compatible = "operating-points-v2";
> >
> >                               opp-19200000 {
> > --
> > 2.35.1
> >
