Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D8F2EB60A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 00:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbhAEXTX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 18:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbhAEXTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 18:19:22 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2ECC061796
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 15:18:42 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o19so2519268lfo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 15:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f1kIGsmlZWUnm0eNGp2YOwyYVCXEP678oYFzp03SZFI=;
        b=rnHdyyVftcEE7l7n8QrU0td4/OZrwidg5QjguzxzL+t8RKl/3VPiOzvTNZ2BoKvWUf
         0oxXbwipp5JliKi76dXXNv/pSOUpi0HSeKdxGq/99f6rmeLB9vVx8D70QVFZg7kDTLse
         f4g0p/PVckCZod9ikA9zvAXf0egHHKIpQRzbghxSX2vclcjBPKgMHngQZgArP4gQGPHd
         GA89XBQTfvpgw3a4rF4geFNVMU418Q/mY7zqALXO9oWkS2LoHpVhf1v4VfmstuMUE3WE
         LJhtYTGElft+/FldH7rg6iUHqvtpnXqJKIJd3Dtcj8xxwH+mKlXa6Q46TcuEknGHL8OP
         Z0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f1kIGsmlZWUnm0eNGp2YOwyYVCXEP678oYFzp03SZFI=;
        b=N86syicbW3UxElUtoCw0xYq+ZDifpAXAGfRny9m2LYhrOgbfKecFJ2N5YCiwuB68hI
         KsBO6w3dpkQTWl/MfljiiVO84RT8HBKszH/99hgL4Opond9KauEdTEvpBIDwTrwvri17
         floCHPdHwEnbkPxMR3q34TaHd4S6jXz6j0w6e1tro33UOavoiVpybPcM7icqbdvMA3mi
         /20F4HA63Gk0HEAzSBX7p9d4+vpXm5ydM42UOPYYYprHHdnFPW4EPrAd2JQycrfXZqT8
         MUpdup8PnqwtJmTxngTeNSZS/CeXMeHYl6jLrVS9J4psdvgjGnk5KXrsoui5yf3zovpT
         xDkg==
X-Gm-Message-State: AOAM530kv7MvvR0XUHAt7Hp9fHk4mnLCvX9mnwQUF6WEgHez4oSL9NNF
        QOS6c+0EONgdzS9Rv0iEORUuggqJWLUIoR+vZ1IjcA==
X-Google-Smtp-Source: ABdhPJwl1fDf3fY4Y+gWKMuQwKAvot59gPqwZ5QoeTO2q/OZcfomVBoDui6Gw4od7ko0KnEExWCilAT9V5Mr25TxCtE=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr614391lfg.649.1609888720651;
 Tue, 05 Jan 2021 15:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20201208085748.3684670-1-vkoul@kernel.org> <20201210135253.GA2405508@robh.at.kernel.org>
 <X/NgUp/pm9T0JlTw@builder.lan> <20210105061415.GA2771@vkoul-mobl>
In-Reply-To: <20210105061415.GA2771@vkoul-mobl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Jan 2021 00:18:29 +0100
Message-ID: <CACRpkdZWRjNt+fRbF2uO8sg551kytM+ZH5Zs_6QUrhRX0a5ATQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 5, 2021 at 7:14 AM Vinod Koul <vkoul@kernel.org> wrote:
> On 04-01-21, 12:37, Bjorn Andersson wrote:
>
> > > > +properties:
> > > > +  compatible:
> > > > +    const: qcom,sm8350-pinctrl
> > >
> > > If this block is called TLMM, then I'd expect that to be in the
> > > compatible string. But I guess this is consistent with the others.
> > >
> >
> > This is my mistake 7 years ago and it bothers me every time we write a
> > new one of these - in particular since we now support a few different
> > "Qualcomm pinctrl" blocks.
> >
> > It would be ugly for a while, but I'm in favor of naming these
> > "qcom,<platform>-tlmm" going forward.
> >
> > PS. And we can solve the ugliness by introducing the "proper" naming
> > (and keeping the old one for backwards compatibility) as we migrate the
> > binding documents to yaml.
>
> Okay I will update this one to qcom,sm8350-tlmm. Also we use
> sm8350_pinctrl few places in the driver, will update that to sm8350_tlmm
> as well

Go for it, it's a much better to the point name.

Yours,
Linus Walleij
