Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0289A40F1DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244974AbhIQGI2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244958AbhIQGI2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:08:28 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A5CC061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:07:06 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id n2-20020a9d6f02000000b0054455dae485so6251634otq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uFxktZTFTvrgPpVfXvx5wJ9NT0aZLesc6X5ChP1iv7A=;
        b=i/ncKKPIpr+3o9b6pA0DCzCBl8WUKX1Ag2tuxiTlv5DFjg2x0hUOLgQi34zNW/rawU
         vC6nF7DwJ49OTMrhSPq1WDne735OUV/Q9jbN/spxDPPRnkqpOh/AHISPiJjUeoj/vdLZ
         y4j4lxX/R/X0aM40ICqquVM9oB2b3UQr+OXIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uFxktZTFTvrgPpVfXvx5wJ9NT0aZLesc6X5ChP1iv7A=;
        b=6m8r9rECxZjn1XdswJXxctu/dAl4jBakUZEadhb5ireVqMmtBJsQGJe0aRgNPZIvQb
         OD7tUmlGary6hAg92OoLhMphxXfmji8YqRyFx5ScMaRBxL9GayIe2z40TO6tiLo3TNAA
         gf1HhuwmZirgbtWy9S29lnIow1g1BoJhpnhnOUSK1wnVx/xdub5Y82Lw1pXkULyQwmfo
         DBa0ypMJWM8UmF+Ae5gkkmwkSnLzI3XHLBEl4FDdREFd5S/PNnr9a9B2G2nMqRfcZgnt
         2GQzJkIcsrQc20TY2kTdicFGG2Q0+QUpUIeLwb2MTLlI4Vdnd7Es/+Jvz0lFdjbYDutc
         Q3og==
X-Gm-Message-State: AOAM531fx9ncXWGfFibjiK/ect+r+yGxYeC8eVqoOO2f49E1eN4U2Qah
        AJjwfltx+PBfhZ+4hsoX+2hgyq72jsli3NhZfnc3yg==
X-Google-Smtp-Source: ABdhPJxQEesmDcj/3cYONDWgEpdGmnZZmuk8Te4FWZg9ahd8D1bR5hpR8n7vTHM4r69wQilPoaiFgB2r7HIGEK65gJE=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr7898467ots.77.1631858825850;
 Thu, 16 Sep 2021 23:07:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 23:07:05 -0700
MIME-Version: 1.0
In-Reply-To: <baa5c4b4dd19e0a24d28b8bff559b868@codeaurora.org>
References: <1631798498-10864-1-git-send-email-skakit@codeaurora.org>
 <1631798498-10864-3-git-send-email-skakit@codeaurora.org> <CAE-0n53i4pU==W-dc=md_x+0Tqbd1gtwkPBFode+rtupSFi0WQ@mail.gmail.com>
 <baa5c4b4dd19e0a24d28b8bff559b868@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 23:07:05 -0700
Message-ID: <CAE-0n53x6oB+Rj1_1QDNMVJowyCUeXgGBMmZ1SW1rTMmcEwD4A@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] arm64: dts: sc7280: Add volume up support for sc7280-idp
To:     skakit@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting skakit@codeaurora.org (2021-09-16 21:08:11)
> On 2021-09-17 00:32, Stephen Boyd wrote:
> > Quoting Satya Priya (2021-09-16 06:21:38)
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> >> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> >> index 371a2a9..cbbb0ee 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> >> @@ -12,6 +12,26 @@
> >>  #include "pm8350c.dtsi"
> >>  #include "pmk8350.dtsi"
> >>
> >> +/ {
> >> +       gpio-keys {
> >> +               compatible = "gpio-keys";
> >> +               label = "gpio-keys";
> >> +
> >> +               pinctrl-names = "default";
> >> +               pinctrl-0 = <&key_vol_up_default>;
> >> +
> >> +               volume-up {
> >> +                       label = "volume_up";
> >> +                       gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> >> +                       linux,input-type = <1>;
> >> +                       linux,code = <KEY_VOLUMEUP>;
> >
> > Is there an include for this define? Looks like
> > <dt-bindings/input/input.h> should be added as well? Did you try
> > compiling?
> >
>
> Yeah, it needs <dt-bindings/input/linux-event-codes.h> to be included.
> This header was included in pmk8350.dtsi which is added in this file.

Alright, got it. If you can include this header in this dts file it
would be better so we don't rely on implicit includes from other files
to get macros. With that change you can add my

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
