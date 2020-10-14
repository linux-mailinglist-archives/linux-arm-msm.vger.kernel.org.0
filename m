Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2271228DFD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 13:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbgJNLdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 07:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730715AbgJNLdS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 07:33:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E9FC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 04:33:17 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e17so3343231wru.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 04:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7E5unWXYfNjo3l9dfHagbIRdGz1IhdYHa4SUGlhtAf8=;
        b=LqGO70uj/qqLaMgv80tbPKa3iqi6XkbEpPuaCz+gSsLQsuTRzjuy8uZDrZt+k3TFmc
         8mVVA2vzI1qf5wmpfqMyk6iD+wJdhwAlaaLvgQpDoeyDUMynxG4LCwQ3GP0wWpzM9lGj
         BDrTFWgfB40tq8cGZkYIwTzfvIttD6sj7KTP7u+it5awUVq/MhrSw1srFz1ZuxecD01m
         XvjfI0ybKXuGBz/C7jyGYdQxHAY3RCV4hpayKMVtZI9JoQSpX+VMICc3DVLlVDXxTD/+
         8blDf3zs5wjwHN7UB09peOYrrRZleAkgPPMLsUfulqH6dapFW1DRvAvzD1fMBxewLJ0h
         zuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7E5unWXYfNjo3l9dfHagbIRdGz1IhdYHa4SUGlhtAf8=;
        b=PEGFTKfd3MMLuZuHszQIp7GQWe3/KgrLgG3BaX9yhyDc6Acwlr9Qzm55zI6KhPzGpo
         kN0KYcOz+HHrGqB2kmZcGCAvzOfdSwEIUYnrvZ5SaqEHGIVdfX6GUV1a1F9bFtt2PPVa
         fWKdPMYUdqNsRs21rw13Vx1sNpg5nSnMPDKu7AOTIv7ssCi6KPDxjsBqXp6CenHK4grt
         FuGzOhgIfkF23sotXo3juIvncfXnjaoqWmit8fxWu7lovHGGML5zClmqz9GEgiiUnB7V
         Kf+o7D9vajI8mfqOFeM5x1xk3VbobKqflIsJCC2XNuQsD9dismAICN55F7TZu8nKShpd
         O8kg==
X-Gm-Message-State: AOAM5338tyioxErg4WGqOx0dkggT3j/036V1a4yq/uMOJF/wzsycFNdG
        TyRssyZJKmaldSE37l37mYjnPw==
X-Google-Smtp-Source: ABdhPJxap4UjlENdISn1XJARr/Xddy9QWqP8k//IXOEm7gCulIFQjOE8Opa11rlzTd0t5RSJfMGZeg==
X-Received: by 2002:adf:ed45:: with SMTP id u5mr4827892wro.48.1602675195831;
        Wed, 14 Oct 2020 04:33:15 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id r1sm4873375wro.18.2020.10.14.04.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 04:33:14 -0700 (PDT)
Date:   Wed, 14 Oct 2020 12:33:13 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Alexandru Stan <amstan@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: trogdor: Add brightness-levels
Message-ID: <20201014113313.y5uzugw5lpcbo46p@holly.lan>
References: <20201013080103.410133-1-amstan@chromium.org>
 <20201013010056.v2.3.Ie4d84af5a85e8dcb8f575845518fa39f324a827d@changeid>
 <CAD=FV=W4fv_AdS7G2FFe2Kan3YYJ4D0MVJD90aJMrgCja5N4vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=W4fv_AdS7G2FFe2Kan3YYJ4D0MVJD90aJMrgCja5N4vg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 13, 2020 at 09:28:38AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 13, 2020 at 1:01 AM Alexandru Stan <amstan@chromium.org> wrote:
> >
> > Now that we have better interpolation for the backlight
> > ("backlight: pwm_bl: Fix interpolation"), we can now add the curve to
> > the trogdor boards, being careful to crop the low end.
> 
> Just to make it clear, the patch this depends on hasn't landed yet.
> Presumably it will land in the v5.10 timeframe?  That means that
> without extra coordination this patch can target v5.11.

You're talking about patch 1 from this set? Despite the title I view
the patch as changing policy (albeit one that does also fix some annoying
quantization errors at the same time) so it's not necessarily a
candidate for merging outside the merge window (I've not checked with
Lee but I think it likely the shutter is already down for features).

Moreover I'm not clear why there a dependency here that would stop the
changes landing in different trees.


Daniel.


> > Signed-off-by: Alexandru Stan <amstan@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index bf875589d364..ccdabc6c4994 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -179,6 +179,15 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
> >         backlight: backlight {
> >                 compatible = "pwm-backlight";
> >
> > +               /* The panels don't seem to like anything below ~ 5% */
> > +               brightness-levels = <
> > +                       196 256 324 400 484 576 676 784 900 1024 1156 1296
> > +                       1444 1600 1764 1936 2116 2304 2500 2704 2916 3136
> > +                       3364 3600 3844 4096
> > +               >;
> > +               num-interpolated-steps = <64>;
> > +               default-brightness-level = <951>;
> 
> I haven't done lots of digging here, but this matches what Alexandru
> and Matthias agreed upon for the downstream tree and seems sane.
> Thus:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
