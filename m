Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA27252F482
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353508AbiETUie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353503AbiETUie (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:38:34 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B78619FF45
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:38:33 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id n23so12240965edy.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbQPTM72ehryL5FYoSB2A2iBAshky0xebXkx4czYmNQ=;
        b=IPxznzUvQHNK+9WYxlWPVLNwNj8TMm7NjtzE+16cNKZ7k1Cf1JV3GKzDx5ZrujI/QS
         pR+FSDdXdcSJ/Xwso2HdPJSioY6htXGkjVUEHNZOzb6syjEJTudTxwgdBS4pCtkJ/1OJ
         9KRXQpOW9LNh2cpV3Uk4IEODtoEFlosdmyXC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbQPTM72ehryL5FYoSB2A2iBAshky0xebXkx4czYmNQ=;
        b=qhLP9PTBVXYkYnZbFzALTbjLetjyPFs2VGzFfMQiK/DByITipTRw6SAgJJU2L9Hodx
         KwMw98jA+IbdkI5jnapjiR2TEI1ecVETMPWcJ2hwDJ3G2G3TNL3/2Pbc+4uZznUbu0f2
         /JKjoh+WjCUQU37cZbzE9ninoZqCDiemvIM8Jj+7RgkU9aCxOATAczuzF4Mgi9Dfqxn9
         4p/cIHFEz6/tjziNroNW0PL0NpzRxhSfRaFHzcyx8sJxSEzCPrYDS+zFUIOLQRc/irEb
         UCXCmnIBoSkzONYHP60s7mPh/DJk9v+MgyyIqa73qux1/cggSMeaiYirIgrUwovbGcFX
         X8pQ==
X-Gm-Message-State: AOAM5321f47xrU894DEXq9WNVyfNmRoGLO/WIdlcB+VaSHf6wXOJcgx4
        rb7Z9lZBb5Os1xw5KJ1SgkSqyH9kBi76Q6N3iCY=
X-Google-Smtp-Source: ABdhPJzowbUbb6HUolGGCDyBtDJfqUvNmzoeKrjhJe4AIemyZ0y++2sFW/xxZ7QFBpqoQc7Mnj/Esw==
X-Received: by 2002:aa7:d4c4:0:b0:42a:9de1:fe38 with SMTP id t4-20020aa7d4c4000000b0042a9de1fe38mr12975601edr.323.1653079111395;
        Fri, 20 May 2022 13:38:31 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id en9-20020a17090728c900b006f3ef214e72sm3477475ejc.216.2022.05.20.13.38.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 13:38:30 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id e28so12347908wra.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:38:28 -0700 (PDT)
X-Received: by 2002:a5d:5009:0:b0:20d:846:f4da with SMTP id
 e9-20020a5d5009000000b0020d0846f4damr9841738wrt.301.1653079108326; Fri, 20
 May 2022 13:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220520124834.1.I7c51c6255bb53086a82c5b3f4fafffcc5ccbc4ae@changeid>
 <CAD=FV=X4GBLoTuOcHetAFXWLQKFF0yn=E5yv0ExTg8Mwrw1iUw@mail.gmail.com> <Yof6MeM1Ohthe7Fq@google.com>
In-Reply-To: <Yof6MeM1Ohthe7Fq@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 13:38:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VKqnTWDP9vkxhsR_QVj5rXNXNNwjTaQX431J1JQBTSqA@mail.gmail.com>
Message-ID: <CAD=FV=VKqnTWDP9vkxhsR_QVj5rXNXNNwjTaQX431J1JQBTSqA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Enable keyboard backlight for villager
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 1:29 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Fri, May 20, 2022 at 12:57:50PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 20, 2022 at 12:48 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > Villager has a backlit keyboard, enable support for the backlight.
> > >
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > >
> > >  arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts | 8 ++++++++
> > >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi            | 2 +-
> > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> > > index d3d6ffad4eff..b6a6a1454883 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> > > @@ -58,6 +58,10 @@ &ap_sar_sensor1 {
> > >         status = "okay";
> > >  };
> > >
> > > +&keyboard_backlight {
> > > +       status = "okay";
> > > +};
> >
> > Instead of doing this, can you just get rid of the status = "disabled"
> > in herobrine.dtsi? I don't think there's any benefit to having two
> > levels of "disabled" in the herobrine device tree.
>
> Sure.
>
> I guess the 'disabled' status was put as a micro-optimization to avoid
> probing the 'pwm-leds' driver on boards that don't have any such LEDs. In
> practical terms it shouldn't really make a difference in terms of memory
> or CPU.

Just to be clear, I was suggesting leaving the "disabled" at the
pwm-leds level but removing the one at the "keyboard_backlight" level.
I don't expect us to have any pwm_leds on herobrine devices that
aren't for the keyboard backlight. If/when we do we can always add the
two-levels of disabled back in...

-Doug
