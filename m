Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9478F416833
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 00:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243435AbhIWWwU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 18:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243431AbhIWWwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 18:52:19 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CBEC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 15:50:47 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id w19so11876877oik.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 15:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dKp1hHRL8F+OQfFGWFADWVrKMY57aRNj7ogOQ5bGn2Y=;
        b=PGiSvpZ3mujpWebBaRFE1biL4E5ZSs320mbTYJm+7fNzUWjvYsqL7g6ZPS4AQTwwFR
         2U5/M34k72YDoRewpiMvB5YvGXEekqhvcK4+KNsN5YHpR8+UoQlIOJs9AzWz+mI7ln/D
         oE80oyL4i2nXrwXC1nFBZliv0b4mcmtrcBowc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dKp1hHRL8F+OQfFGWFADWVrKMY57aRNj7ogOQ5bGn2Y=;
        b=U3bouMAEXNI9qsCPQK4zKEF8S3HhnMVmfXatnsbNUQylHIYydU6db824lLiu++IfIV
         B+zMXWIWX2s2P26Qest2zvbrOnn+XLszK44VNBmyxp82Q8JVHviKgjFrvLFvoG3vvRI6
         iwI35q4C3InK7pfhc4CbOQewLgkKqucUjuFRahF/PbW/cjIydq8gk4CFrzBUKPDtVvic
         2U0OVuIdO/H4MbJR9dStv9ba71W3Vjnd1gIzQsPI1KJGsj8PY8GEau/DqkHe9GXBa0+a
         KvEsEUbCnf68RV92qAQZabKLi0ooNNOIIVRfPQFq7ZIhXemh6SCkjMaX72BUqMrDFMNR
         CxaA==
X-Gm-Message-State: AOAM533VvpuqQbRgKwhhkaqrbfIwg5Z8MORR0VWMApfVRZgPhGuQCxv3
        YbH3FV2E7gtwwe+7F2twZH3FVi5s/HgjTQ==
X-Google-Smtp-Source: ABdhPJwPAGE0/snWBMDX489/NwbqqDCs+opazD224c0VrwYybrgcEHNBcELARDbwCWaTDu5UPe5fSg==
X-Received: by 2002:a54:4e1d:: with SMTP id a29mr14406864oiy.7.1632437446410;
        Thu, 23 Sep 2021 15:50:46 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id x4sm1206231otq.25.2021.09.23.15.50.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 15:50:46 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so10754189otj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 15:50:46 -0700 (PDT)
X-Received: by 2002:a25:ae97:: with SMTP id b23mr9195708ybj.50.1632437128929;
 Thu, 23 Sep 2021 15:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
 <1632399378-12229-2-git-send-email-rajpat@codeaurora.org> <1632436663.381520.3653405.nullmailer@robh.at.kernel.org>
In-Reply-To: <1632436663.381520.3653405.nullmailer@robh.at.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 23 Sep 2021 15:45:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WOJiKUjGTYW0GmqOMqd_8+Y_tRmynuhZpaenwbTiG_9g@mail.gmail.com>
Message-ID: <CAD=FV=WOJiKUjGTYW0GmqOMqd_8+Y_tRmynuhZpaenwbTiG_9g@mail.gmail.com>
Subject: Re: [PATCH V10 1/8] dt-bindings: spi: Add sc7280 support
To:     Rob Herring <robh@kernel.org>
Cc:     Rajesh Patil <rajpat@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, msavaliy@qti.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        satya priya <skakit@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 23, 2021 at 3:37 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 23 Sep 2021 17:46:11 +0530, Rajesh Patil wrote:
> > Add compatible for sc7280 SoC.
> >
> > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> > Reviewed-by: Doug Anderson <dianders@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> > Change in V10:
> >  - As per Stephen's comments,
> >    sorted compatible names in alphabet order
> >
> > Changes in V9:
> >  - No changes
> >
> > Changes in V8:
> >  - As per Doug's comments, added "qcom,sc7280-qspi" compatible
> >
> >  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1531702
>
>
> spi@88dc000: compatible:0: 'qcom,qspi-v1' is not one of ['qcom,sc7280-qspi', 'qcom,sdm845-qspi']
>         arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dt.yaml
>
> spi@88dc000: compatible: ['qcom,qspi-v1'] is too short
>         arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml

Right. I mentioned this in earlier review feedback and Rajesh said
he'd do a follow-up patch to add sc7180 to the list here and also add
the proper compatible in the sc7180.dtsi file. That's not a new error
and (IMO) shouldn't block this patch from moving forward, though it
should be nearly trivial to do.

-Doug
