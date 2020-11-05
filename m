Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C592A82CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 16:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730854AbgKEP54 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 10:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730973AbgKEP54 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 10:57:56 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA17C0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 07:57:56 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id p201so426714vke.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m3OLwziXkpVUL0rRhQIvMEWxkGqdLLkmWdQxgDBNVWo=;
        b=WlqjJbu5WqsqgcHHy/WPzUmIAHQZZoKDO4ur2Topm5GpRIBT7rwQvPykfAgqDxIx9X
         m9JmdRsrAQvG+gckaglGfZ082+i5p/dc827N9G6sW4AaBatossGuI3s1RT+UVd5fqS8V
         Wqyez+9+Iw1ebr9kSHj44qRzdbjTrF7c4x+TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m3OLwziXkpVUL0rRhQIvMEWxkGqdLLkmWdQxgDBNVWo=;
        b=V0YIcL6JNLOR9+G7flbLP6VakwcJGmnrlVdmr4yt7EDIezNHIOIIYzu5x7tHz4iJPh
         cUtCbzWZIAM2A8VUJBRG+/6owmiSxwcdyq7m7lgCnknBCX6/m3L5rRGGFFgdhf8q97Cx
         ZP/i8meofUvoogDGlDMDCpJjYhDdSxHGZDWprRql/8g75xSJHCtECaEPttDs/wYyg0JZ
         cqOMrFMw7ADg8IlKzu9bG3Jxs/AP4GcjeUkfToSbUP4u8HfBlHh2rwFWiUT1ZZ6HX15r
         sQVQ/NCk9WQ8BGTutSKj8h7TmZkh0einleqE21c/+UKse1qburELbv7xfQJX6X+bnkZq
         D3Tg==
X-Gm-Message-State: AOAM531WX6VIoivKcLjb32OCXt/LdYDhq+GZcUhhCWXE7STeOlz6QKNt
        mP52oJsfvkDrmUGDYYOpEM+D/jyat+HwZg==
X-Google-Smtp-Source: ABdhPJxXeh9P0eJxyr9s6h5dwvvdcPDeOmy08HkPASmm0LdaXv9uHCQBT2f5lJcmklMcN6+XH0B5JA==
X-Received: by 2002:a1f:ab87:: with SMTP id u129mr1616742vke.7.1604591875212;
        Thu, 05 Nov 2020 07:57:55 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id m23sm289707vsl.0.2020.11.05.07.57.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 07:57:54 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id z123so1050127vsb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 07:57:54 -0800 (PST)
X-Received: by 2002:a67:ec9a:: with SMTP id h26mr1838173vsp.34.1604591873786;
 Thu, 05 Nov 2020 07:57:53 -0800 (PST)
MIME-Version: 1.0
References: <20201103103749.1.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
 <CAD=FV=Wc-b75a-QSX8qLq0+fCbcnvh_6q+N6azL=+Tk+rMie1g@mail.gmail.com> <20201105015501.GA3079843@google.com>
In-Reply-To: <20201105015501.GA3079843@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 Nov 2020 07:57:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W=L=gjue69UCnC-xbkQYwMaqCUoaGGJsarLxxjagZPpA@mail.gmail.com>
Message-ID: <CAD=FV=W=L=gjue69UCnC-xbkQYwMaqCUoaGGJsarLxxjagZPpA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the
 default supply for pp3300_hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 4, 2020 at 5:55 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > index bf875589d364..2d64e75a2d6d 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > @@ -174,6 +174,21 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
> > >                 vin-supply = <&pp3300_a>;
> > >         };
> > >
> > > +       pp3300_hub: pp3300-hub {
> > > +               compatible = "regulator-fixed";
> > > +               regulator-name = "pp3300_hub";
> > > +
> > > +               regulator-min-microvolt = <3300000>;
> > > +               regulator-max-microvolt = <3300000>;
> > > +
> > > +               gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> > > +               enable-active-high;
> > > +               pinctrl-names = "default";
> > > +               pinctrl-0 = <&en_pp3300_hub>;
> > > +
> > > +               vin-supply = <&pp3300_a>;
> >
> > You're leaving things in a bit of an inconsistent state here.  The
> > "pp3300_hub_7c" is always_on / boot_on.  This new one isn't.
>
> Actually the new "pp3300_hub" it is also on at boot, the Chrome OS bootloader
> asserts the GPIO.
>
> > I know this is slightly more complicated due to the fact that downstream we
> > have a way to control the hub power but didn't quite get that resolved
> > upstream, but the way you have it now, on new hardware upstream will
> > power off the hub but also keep "pp3300_hub_7c" powered on for no
> > reason.  Seems like that should be fixed?
>
> Our EEs told me that it would be ok in terms of power to keep "pp3300_hub_7c"
> powered, since there would be no significant power consumption without load.
>
> In any case unused RPMH regulators are switched off by the kernel ~30s after
> boot, so I think we are ok:
>
> [   31.202219] ldo7: disabling
>
> The above is from the l7c regulator on a Lazor rev2.

I assume this is with the downstream codebase, though?  With what you
have posted upstream I don't think ldo7 will ever get disabled because
it's marked "always-on"?

Similarly, with what you've posted upstream I think your new
"pp3300_hub" _will_ get disabled ~30 seconds after boot because it's
not marked "always-on" and it has no clients.

-Doug
