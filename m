Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F32B7472CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 15:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjGDNfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 09:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGDNfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 09:35:12 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80733185
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 06:35:10 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c4dfe2a95fbso3387574276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688477709; x=1691069709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WqIHh+G4XahXVKdkslZXY2hDyJ9c234XGoQUojzzroA=;
        b=y3EPa0BxKmG5AolGrBXtKtk5yxu7UDdfkbh9qbFcLUnY5WWexlDXKwKEOAjVlVakkJ
         uKxLuoTitJmFs9PO9UDVAUlC9SoX6MKokSyPQhLsCyQRSkaYA0j8hInarR9amNsIwVOF
         Jy4w/a2ROrnNsnygY5w8aIb+I6Nixvp0EWrPTND8WlYO+q1OqPUz4PbJaEx/JlhPPRzM
         qGpH7ZfPtT6VNBslTQ4VoBMb0GbxzKaIx6dW3oDVN5G3jtmoBhaMk7VtbfjdAbxGSuz3
         BHvgh4lxl6BpC/p2KjCHpH1s1kXvESul+KB40C3D8TkAWE9Wf4vUiXgL94YB2Us1H4Ar
         acbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688477709; x=1691069709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqIHh+G4XahXVKdkslZXY2hDyJ9c234XGoQUojzzroA=;
        b=OusropMeferVQdFpVheB+9Onai3/BLwukN1PrJPYAcy0EWQ521duJEvjb2gAnoUzvl
         Qn5e1BUb1cwU02rnJQnYt437NkbaHkyHZoRWEZXadOJqc+2WoqYNXf28ovDGeKNRxRuy
         wuD12a9m7UfkAGrHHbr2kIXvlDcaPkjfucODgJE70OvaaFziOQ3tNKHbotyvb4whgpVQ
         S8D61JHohaBZYl9JiqZrgA1w5fvqvcjxm2sJ8aOzDBRaOtMfqh6R/ZE0eFgb8S3w1ByA
         CPKQqrshg3yufa3KJNrbeS66PUcbDIJokllgSAkfuDE2VU9HbYONsmLKfdyVImnqQP/J
         dxxA==
X-Gm-Message-State: ABy/qLYDcqeCz/4b2BfV6nWShZks1Hq+5gz2QLF7o/KHQcGid8InKQjs
        miJwVjxDDUnX3VJdUwTnyQgJiWFPo05mamxS8/CNnQ==
X-Google-Smtp-Source: APBJJlEYH6VsmNEu5MYnqCp4aZICtRhSpFUOoR+/B14onGj+m97qmuMBKMWWYtMv7ca/U7kvG6k+qXQV+bE2WdHHHyo=
X-Received: by 2002:a5b:f07:0:b0:c13:aca0:b70a with SMTP id
 x7-20020a5b0f07000000b00c13aca0b70amr12114660ybr.32.1688477709691; Tue, 04
 Jul 2023 06:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
 <20230702175045.122041-5-dmitry.baryshkov@linaro.org> <971262d5-98b3-c48e-89fd-ce107275008a@linaro.org>
In-Reply-To: <971262d5-98b3-c48e-89fd-ce107275008a@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 16:34:58 +0300
Message-ID: <CAA8EJpqvk02LeuS=-pPLUi=0OsBQ0npqioEtYkiNfPm+0EpF8Q@mail.gmail.com>
Subject: Re: [RFC PATCH 4/8] ARM: dts: qcom: msm8960-cdp: constraint cpufreq regulators
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
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

On Tue, 4 Jul 2023 at 16:03, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 2.07.2023 19:50, Dmitry Baryshkov wrote:
> > Add additional constraints to the CPUfreq-related regulators, it is
> > better be safe than sorry there.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> I'm squinting quite hard at
>
> https://github.com/LineageOS/sony-kernel-msm8960/blob/jb-dev/arch/arm/mach-msm/acpuclock-8960.c
>
> but I can't figure out where these min values came from

These should be the minimum values for vdd_min and vdd_dig in
l2_freq_tbl_8960_kraitv2 (v1 is unsupported in mainline).
See below,

>
> Konrad
> >  arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> > index 414881d34c60..cba0d1e460a1 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> > +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> > @@ -131,7 +131,7 @@ pm8921_s2: s2 {
> >               };
> >
> >               pm8921_s3: s3 {
> > -                     regulator-min-microvolt = <500000>;
> > +                     regulator-min-microvolt = <950000>;

And this is obviously a c&p from 8064. This should be 1050000.

> >                       regulator-max-microvolt = <1150000>;
> >                       qcom,switch-mode-frequency = <4800000>;
> >                       bias-pull-down;
> > @@ -287,7 +287,7 @@ pm8921_l23: l23 {
> >               };
> >
> >               pm8921_l24: l24 {
> > -                     regulator-min-microvolt = <750000>;
> > +                     regulator-min-microvolt = <1050000>;
> >                       regulator-max-microvolt = <1150000>;
> >                       bias-pull-down;
> >               };



-- 
With best wishes
Dmitry
