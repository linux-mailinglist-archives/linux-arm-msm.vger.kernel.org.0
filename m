Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9021D52F469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353455AbiETU3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353454AbiETU3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:29:40 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12721197F5A
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:29:39 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id g184so8666025pgc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nEjFcr7dEWn0xw/FF93sBsAqLUkAO0bOI5T7Xg501FU=;
        b=UP3J/+XvTlR0rmymET+I+IY4BR1wCtj/EfdXeY308JRGgbdTxv7PMWJUHjxLz1Ndhe
         3KFZF8V13kzJ+zhBemZKhnvnt55654FaPAFy2WdwTbUP6AZKt1y+XFNGCmpW7kDS6i/k
         TFpKbnx6CxX4lZO5SmQNgpgACTxD7ZFxYSDWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nEjFcr7dEWn0xw/FF93sBsAqLUkAO0bOI5T7Xg501FU=;
        b=S3UcSIUgI3PHf+dGcttXugBhr8ElUGzsVHb5FMFG+e1h0qVsn5saZA7Tjj05YS6Vrr
         SZewQ7QhQsJvSewhxZBw3nvi/fDjgJjP3wxTikC5UmTCKTo0dEPFHD7LviEiC//OXePa
         bUAkqXUBh2KyGfJtfNAB6b6xCNO4ZbGCxIjqT7KJCOXA/jIebzPsLnmwQK73x879y01M
         uCUVilISFPOb2njOF64piDStTKOliw7j4Z6GFoaZeixmL+ORFLdBSmuMoZiKKbrJw13k
         6ng5rUEzo78WmRZH20ulFGWiQgYzYU3ju/Cudpe/Ow4x4h6/xKT7+6fUuVL6G3Y75r+1
         tDEA==
X-Gm-Message-State: AOAM531P8xrvSWj3YahvPiDwX2hW+jGM3U2WqSBew9mc7G83GnFSXe9Y
        HYJc0MkSghAZm0r9ImHzSZX8bNfUzAVAyQ==
X-Google-Smtp-Source: ABdhPJyGcUmlbs3+tAA96dhSTmHtvw2Llqwqu/jc1LPrXg5xc9VIXWshNbdb/JaGTnxIwWVxVYd6aA==
X-Received: by 2002:a63:b25d:0:b0:3f6:5842:2685 with SMTP id t29-20020a63b25d000000b003f658422685mr6850794pgo.363.1653078578605;
        Fri, 20 May 2022 13:29:38 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:5332:2096:60a3:3455])
        by smtp.gmail.com with UTF8SMTPSA id n5-20020a170903110500b0015e8d4eb1d9sm167036plh.35.2022.05.20.13.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 13:29:38 -0700 (PDT)
Date:   Fri, 20 May 2022 13:29:37 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Enable keyboard backlight for
 villager
Message-ID: <Yof6MeM1Ohthe7Fq@google.com>
References: <20220520124834.1.I7c51c6255bb53086a82c5b3f4fafffcc5ccbc4ae@changeid>
 <CAD=FV=X4GBLoTuOcHetAFXWLQKFF0yn=E5yv0ExTg8Mwrw1iUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=X4GBLoTuOcHetAFXWLQKFF0yn=E5yv0ExTg8Mwrw1iUw@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 20, 2022 at 12:57:50PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 20, 2022 at 12:48 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Villager has a backlit keyboard, enable support for the backlight.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts | 8 ++++++++
> >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi            | 2 +-
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> > index d3d6ffad4eff..b6a6a1454883 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> > @@ -58,6 +58,10 @@ &ap_sar_sensor1 {
> >         status = "okay";
> >  };
> >
> > +&keyboard_backlight {
> > +       status = "okay";
> > +};
> 
> Instead of doing this, can you just get rid of the status = "disabled"
> in herobrine.dtsi? I don't think there's any benefit to having two
> levels of "disabled" in the herobrine device tree.

Sure.

I guess the 'disabled' status was put as a micro-optimization to avoid
probing the 'pwm-leds' driver on boards that don't have any such LEDs. In
practical terms it shouldn't really make a difference in terms of memory
or CPU.
