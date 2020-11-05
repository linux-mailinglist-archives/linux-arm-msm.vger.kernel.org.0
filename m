Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCCE2A8617
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 19:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgKES2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 13:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgKES2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 13:28:37 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC5CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 10:28:37 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id r9so499908pjl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 10:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YTZesUGnJn+6MgErPofDWillAKENIP3MmT4yUm+LnpY=;
        b=kQKjxp5izjpM3xx2e+4N1ndVX7lWDj8NSy33q2Za1NZBw/jk7U8NgcBKD0DlAtnSc/
         You6ku1Y7uY4C8I0HbyGkaZxgBDjLK43P72S5D3T8AAFXYJGA//rfBYrJhwWafePxpgm
         Dcz/4OrTF03uqUduSRwQFzgFcE7Uj3XOMkAFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YTZesUGnJn+6MgErPofDWillAKENIP3MmT4yUm+LnpY=;
        b=Zl7vmyrnkFCRRbd7JYsAefHuioS/2CzZlH9VNTf0IdiToZVFOiAbioY3tarygKaZDp
         cTzIuT/uNH0a//Fdk5lKjHebjf3SBYgBvKjZQvQopFsC8BWYdC3XM6/vALoLmFxPP/tF
         r6bMDAsA2UE5f4Am60bHC1LqgXG68Axkh2zRjGm+C6JP0IE4SxdXgk1nG8ZZuidD5Mwb
         sFuFxhVoFk2WqdoiMR/YwhvtPNTOGs4OYtvfVdI6qnxeSbX8+73N8IbQEEuArxwL3eGh
         x11SHYt9C0X+z2aiGMIsjlTg7wmpU3tlmNIJ+EiRC2XFU2uupmg9RuYlGzTTeOjwzy8E
         oJbA==
X-Gm-Message-State: AOAM533hqsESRBvrPDjNWDQhggPSwEOJ+uCOVF37HChv4uhI7cfm/FYI
        m/VjfAAJ2xfybJRstFv3E0hMSwIZTAUNsw==
X-Google-Smtp-Source: ABdhPJy8FxBauEXAh5+nTi/O24YjuFAZOlFk6qqMnlnKBbr0wHFlAguOOv/PkuT5LDDpwdSlQLiXIg==
X-Received: by 2002:a17:90a:da01:: with SMTP id e1mr3633114pjv.215.1604600917030;
        Thu, 05 Nov 2020 10:28:37 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id j9sm3076306pjl.48.2020.11.05.10.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 10:28:36 -0800 (PST)
Date:   Thu, 5 Nov 2020 10:28:35 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the
 default supply for pp3300_hub
Message-ID: <20201105182835.GB3079843@google.com>
References: <20201103103749.1.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
 <CAD=FV=Wc-b75a-QSX8qLq0+fCbcnvh_6q+N6azL=+Tk+rMie1g@mail.gmail.com>
 <20201105015501.GA3079843@google.com>
 <CAD=FV=W=L=gjue69UCnC-xbkQYwMaqCUoaGGJsarLxxjagZPpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=W=L=gjue69UCnC-xbkQYwMaqCUoaGGJsarLxxjagZPpA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 05, 2020 at 07:57:42AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Nov 4, 2020 at 5:55 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > > index bf875589d364..2d64e75a2d6d 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > > @@ -174,6 +174,21 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
> > > >                 vin-supply = <&pp3300_a>;
> > > >         };
> > > >
> > > > +       pp3300_hub: pp3300-hub {
> > > > +               compatible = "regulator-fixed";
> > > > +               regulator-name = "pp3300_hub";
> > > > +
> > > > +               regulator-min-microvolt = <3300000>;
> > > > +               regulator-max-microvolt = <3300000>;
> > > > +
> > > > +               gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> > > > +               enable-active-high;
> > > > +               pinctrl-names = "default";
> > > > +               pinctrl-0 = <&en_pp3300_hub>;
> > > > +
> > > > +               vin-supply = <&pp3300_a>;
> > >
> > > You're leaving things in a bit of an inconsistent state here.  The
> > > "pp3300_hub_7c" is always_on / boot_on.  This new one isn't.
> >
> > Actually the new "pp3300_hub" it is also on at boot, the Chrome OS bootloader
> > asserts the GPIO.
> >
> > > I know this is slightly more complicated due to the fact that downstream we
> > > have a way to control the hub power but didn't quite get that resolved
> > > upstream, but the way you have it now, on new hardware upstream will
> > > power off the hub but also keep "pp3300_hub_7c" powered on for no
> > > reason.  Seems like that should be fixed?
> >
> > Our EEs told me that it would be ok in terms of power to keep "pp3300_hub_7c"
> > powered, since there would be no significant power consumption without load.
> >
> > In any case unused RPMH regulators are switched off by the kernel ~30s after
> > boot, so I think we are ok:
> >
> > [   31.202219] ldo7: disabling
> >
> > The above is from the l7c regulator on a Lazor rev2.
> 
> I assume this is with the downstream codebase, though?  With what you
> have posted upstream I don't think ldo7 will ever get disabled because
> it's marked "always-on"?
>
> Similarly, with what you've posted upstream I think your new
> "pp3300_hub" _will_ get disabled ~30 seconds after boot because it's
> not marked "always-on" and it has no clients.

Ah, now I see what you mean, thanks for the clarification. I associated
the ~30 seconds disabling with the RPMH regulators, but you're right, it's
generic regulator behavior (regulator_late_cleanup()).

So yeah, it seems some reshuffling of "always-on" and "boot-on" properties
is needed.
