Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785474FE886
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 21:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345707AbiDLTWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 15:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352457AbiDLTWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 15:22:53 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5F52229A
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:20:34 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id t2so19821413qtw.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=chVyhFxixwoz7zNbu99F11TKHFQnl3/UVYBDPB80ZHY=;
        b=gXpCS89SV25uD/Y+1x2aHYvQ4vgt3R0Xu8swk6osxevhzyMgEDaPNW9ZP/NFJNuPHz
         28TaViXb9L44buYRbeek8mPQATl09OQ79rU7Z3vikUf8fC9CMeEtxoBc20+ak86yhtyJ
         frFm6Pn3raz0+A/40BKzY3O7/vPlZktKTHmUJQDZM+eSJneDV8Q6568Y70BWO4GhTcgy
         eVEoeFmqKEpZc2RCRauAr7aKhDGpHi/ukxgVxu4alQ5aDJTSCJAJ/pdyygki/zCHbuN+
         F1osIdGDrMeDJsLmaphrdl1NYjQqnyYcFDCrHCkgbVNURgnm8xNBbKuiqeudtRZSVYtY
         FakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=chVyhFxixwoz7zNbu99F11TKHFQnl3/UVYBDPB80ZHY=;
        b=T3pUY/BoM6PYftFCtg1G66dyuXieL/30QpykH3K4yoVMemiMIDB4nyAvdObil14xJA
         KMU3NcaNO9EnGjh9sdDsVQJigl4hfUhHMmgjkBZqdtFgoVgCSkzqVVyv9z/9Kd9OFgEz
         QvDe+hDF9KHi4rGYYZ7WajXNcUcm1NP3Ar1K0EIH+6IAfUd0qPiqF+Zllkw/C6SB5Xwq
         G4zgy98Q6l87dMHdSCKF3A4Y+1rPy/C7RSiuitTwI3knndErE7IZ606iewq/vQfZ/DL/
         X0I5XoCogUa15uQhybLRvcFRncAu5/9KAIzJs6UrvPZjnk7/ohS8D1Zzv7/+TDEAFeyG
         i3ZQ==
X-Gm-Message-State: AOAM532mKAWEcsibO0mFmPaXSZAgayFfh2080WigINl3Xuwg9m4EXkc2
        jgDV/Iark3XBbab+P/rurU+e982sgXoe/qoGR21lpw==
X-Google-Smtp-Source: ABdhPJyLIBZR72VaDtuzWmfwbKyURkZFlbzUnKCwIee1kql6f59UqrnPndVBLSVdTBBd76Xhj9Y/B4Xwa0ph4v4E8kU=
X-Received: by 2002:ac8:5a46:0:b0:2e2:2edd:374 with SMTP id
 o6-20020ac85a46000000b002e22edd0374mr4570468qta.295.1649791233793; Tue, 12
 Apr 2022 12:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
 <20220406154028.EC897C385A3@smtp.kernel.org> <CAA8EJpod2cNOYr3g+DmdWo_2Ujv7-pW39fBKqcpCPvtVgP5-NQ@mail.gmail.com>
 <20220412184304.79012C385A8@smtp.kernel.org>
In-Reply-To: <20220412184304.79012C385A8@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 12 Apr 2022 22:20:22 +0300
Message-ID: <CAA8EJppha+V77S6LAZW9us6XiVu9vD9X=RF+RKd+5cvCz+NxEg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm: qcom: qcom-apq8064: add separate device node
 for tsens
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Apr 2022 at 21:43, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-06 12:57:30)
> > On Wed, 6 Apr 2022 at 18:40, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2022-04-05 17:26:44)
> > > > Currently gcc-msm8960 driver manually creates tsens device. Instantiate
> > > > the device using DT node instead. This follow the IPQ8064 device tree
> > > > schema.
> > >
> > > Why can't the schema be changed?
> >
> > But these commits change the schema. They make apq8064 follow more
> > logical scheme of ipq8064.
> >
>
> Sounds like ipq8064 and apq8064 follow different schemas. Is there any
> benefit to harmonizing the two vs. just leaving it as it is in the dts
> and making the schema match whatever the dts has?

I'd prefer to harmonize them. It makes no sense to have two different
approaches for the single IP block (shared between ipq and apq/msm).
And having a separate device tree node for the tsens removes a
dependency from gcc on the nvmem/qfprom.
Note, upstream qcom-msm8960.dtsi doesn't describe tsens at all, so we
don't have to worry about it.

-- 
With best wishes
Dmitry
