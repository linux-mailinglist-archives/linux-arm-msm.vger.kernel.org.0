Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB76933C97C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 23:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhCOWmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 18:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbhCOWmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 18:42:03 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9BFC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 15:42:03 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d23so12809985plq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 15:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O6FcYdK7eW4mQHtM1YQ4TMKsirvAyRE1UkPmXpVHQ84=;
        b=P0arj125C4+CK2KsCoJnnY+ScTRLR99lBmBZNEmpOCsclftjcJVvUdOCq5Yt8ChFWS
         5rs3PUhYKu6GE/hNI96z+5kF7ItN563FPZm/USpQTDtPNsORwAstNXs0skPR4uZ+BwtN
         rnqMjppZyJ9UfF5VoCAuyPMc8hz/nPga94Afo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O6FcYdK7eW4mQHtM1YQ4TMKsirvAyRE1UkPmXpVHQ84=;
        b=SCWDrJsxY8IJHD70dv+aN0nIwhTHWOaBJ5EJThqsHUAFKbvAUg0LL1e0fc29Q4ZvKK
         SysPriTOKlqNE/yx5HV5HTiKxLUPuphMKDZMUQfx78ivQzNwJ+nBRsfY579bOEROEqTT
         xH0tzKyQIO/WGub1+IyZhayu7GfHxFJrNahSvow/VZZq8Z8nUpW2bIPzDivJpmT+3VZy
         3b5IeHGI06p47HcyGC1y0m8A5oi2w/H7TxHnB7M73QPKFnrNC7lDOf9I4EE72SGA7dcP
         //tGJZ8FXCIFSTFrAvwZc7ICi7ke+4pck8Tt1/Z+afLwTGjhwJa1o/tRvn8f3j5tDhrX
         q/1w==
X-Gm-Message-State: AOAM530KDkphtP3L99EDO7jiJKxICOnM3ovwTOGkdifQuuPTg6C7JJS0
        t3E3pJIsOdya8Pdc0y4SecxHNgpr9hOmTQ==
X-Google-Smtp-Source: ABdhPJycocydEuMSmb8FSZBaKYeBrcK8eycSjEaxf2R72hPnoSEAcD3E2goaYDYLrXy6dYwmnLQ8kw==
X-Received: by 2002:a17:90a:f40c:: with SMTP id ch12mr1401978pjb.176.1615848122751;
        Mon, 15 Mar 2021 15:42:02 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:9867:b969:5d4f:e017])
        by smtp.gmail.com with UTF8SMTPSA id g22sm647077pju.30.2021.03.15.15.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 15:42:02 -0700 (PDT)
Date:   Mon, 15 Mar 2021 15:42:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7180: lazor: Simplify
 disabling of charger thermal zone
Message-ID: <YE/iuax5T3/lH0YF@google.com>
References: <20210312183228.550779-1-mka@chromium.org>
 <20210312103211.v2.1.I6d587e7ae72a5a47253bb95dfdc3158f8cc8a157@changeid>
 <CAD=FV=Wb7Xu07M3AspNhZqRzy3H1zLy5HDbLWKOSijCV0kHM6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wb7Xu07M3AspNhZqRzy3H1zLy5HDbLWKOSijCV0kHM6Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 15, 2021 at 02:48:46PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Mar 12, 2021 at 10:32 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Commit f73558cc83d1 ("arm64: dts: qcom: sc7180: Disable charger
> > thermal zone for lazor") disables the charger thermal zone for
> > specific lazor revisions due to an unsupported thermistor type.
> > The initial idea was to disable the thermal zone for older
> > revisions and leave it enabled for newer ones that use a
> > supported thermistor. Finally the thermistor won't be changed
> > on newer revisions, hence the thermal zone should be disabled
> > for all lazor (and limozeen) revisions. Instead of disabling
> > it per revision do it once in the shared .dtsi for lazor.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> > Changes in v2:
> > - none
> >
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 9 ---------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 9 ---------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts | 9 ---------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi   | 9 +++++++++
> >  4 files changed, 9 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > index 5c997cd90069..30e3e769d2b4 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > @@ -14,15 +14,6 @@ / {
> >         compatible = "google,lazor-rev0", "qcom,sc7180";
> >  };
> >
> > -/*
> > - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> > - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> > - * to avoid using bogus temperature values.
> > - */
> > -&charger_thermal {
> > -       status = "disabled";
> > -};
> > -
> >  &pp3300_hub {
> >         /* pp3300_l7c is used to power the USB hub */
> >         /delete-property/regulator-always-on;
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> > index d9fbcc7bc5bd..c2ef06367baf 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> > @@ -14,15 +14,6 @@ / {
> >         compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
> >  };
> >
> > -/*
> > - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> > - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> > - * to avoid using bogus temperature values.
> > - */
> > -&charger_thermal {
> > -       status = "disabled";
> > -};
> > -
> >  &pp3300_hub {
> >         /* pp3300_l7c is used to power the USB hub */
> >         /delete-property/regulator-always-on;
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> > index ea8c2ee09741..b474df47cd70 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> > @@ -14,12 +14,3 @@ / {
> >         model = "Google Lazor (rev3+)";
> >         compatible = "google,lazor", "qcom,sc7180";
> >  };
> > -
> > -/*
> > - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> > - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> > - * to avoid using bogus temperature values.
> > - */
> > -&charger_thermal {
> > -       status = "disabled";
> > -};
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > index 6b10b96173e8..6d540321b4a5 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > @@ -41,6 +41,15 @@ ap_ts: touchscreen@10 {
> >         };
> >  };
> >
> > +/*
> > + * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> > + * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> > + * to avoid using bogus temperature values.
> > + */
> > +&charger_thermal {
> > +       status = "disabled";
> > +};
> 
> So this always confuses me too, but the sort order is wrong.  :(
> 
> While it _looks_like the node above you is "ap_ts", I believe the
> convention for sorting is not to use labels added in this file. Yeah,
> we gotta document this somewhere. Thus, this node should be sorted as
> "charger_thermal" (using a label not defined in this file) and the
> node above should be sorted as "touchscreen@10" and thus we should go
> above it.

"ap_ts" is a sub-node of "ap_ts_pen_1v8" (aka "i2c4"), so I think it is
irrelevant here. However IIUC the sort order should still change, since
"charger_thermal" should be before "i2c4" (ignoring "ap_ts_pen_1v8"
defined in this file).

> In general I think the reason we tend to use the node name and not any
> labels is that it keeps us from having to redo the sort ordering if we
> give something a new label. It also helps keep the i2c busses
> together, the SPI busses together, etc.

Yeah, at least for the busses it makes sense. There could also be
conflicts for nodes with multiple labels, though one could use the
convention of using the first label for sorting.
