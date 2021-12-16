Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E34477580
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 16:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238317AbhLPPPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 10:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238285AbhLPPPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 10:15:00 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8014C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 07:14:59 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id f18-20020a17090aa79200b001ad9cb23022so22939999pjq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 07:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/twgQonJ/W0+Kkqw2C0d502QQdIkq0UdKRFheQPPK/o=;
        b=gxtHBQa2+VYqpaej3NFEOhD36tg7y02X6+dv87CoB9HklI/ayoFruRPWpwTZk62wxU
         H9tA+JCWH5gIQkLNmdDrvIzkah0yatiPJKlHjIZrzT+JDSeoyphHPsGZ+00mBLa/WC/L
         eT/VHnOiFBvJpv89l/qHyDhqE4qHkCb8N0P4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/twgQonJ/W0+Kkqw2C0d502QQdIkq0UdKRFheQPPK/o=;
        b=lrTQqc4U8fGBTROx8EfyJB6+UGRCUsq/Eu/akGdgys+EkNLT1mAQNpueqZrgl3Uj/9
         jmXaHOEMwVVmTQfS5q/h8qKZV+UBiT4cCsdlAD3Og6CJcHV9qZA5ss9g18tJuR9E+zIR
         EmsnUHA4S7r/KnQ6WLerAzjSgG5mYBwW/T7cpUyqa/Q1vCGRCI5aUple0aFrde9NK9ML
         s5/XThiPCwGLkOROXPByNznLFN16VOgROcUcPcmQbJfgjIv+FpekmJhkR/LdZcl5F/rH
         MYBJM2gGKiK276xSRettcUNppB6XMXXV72yEsMYEWp+n4Kx60FZsNzKrXlMyPUzHWr8z
         V3TQ==
X-Gm-Message-State: AOAM531vUbHgqRBYdIRx3zPmiF0JO0OZ0fNUHxcoPMNVvNyW78xvQR1s
        mvGBAptynvMUZ5Vpu6GqL94qTg==
X-Google-Smtp-Source: ABdhPJy03HEa/VaOQphfX6yK7uiLx4U5Iw5QqKN79qM2AIGZCvyA0g2VRPTu3m6QRfbxCp1JhFCRTw==
X-Received: by 2002:a17:902:e891:b0:148:a4e1:4fb2 with SMTP id w17-20020a170902e89100b00148a4e14fb2mr9508144plg.131.1639667697610;
        Thu, 16 Dec 2021 07:14:57 -0800 (PST)
Received: from localhost ([2620:15c:202:201:81:c257:d961:22b7])
        by smtp.gmail.com with UTF8SMTPSA id u71sm5538392pgd.68.2021.12.16.07.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 07:14:56 -0800 (PST)
Date:   Thu, 16 Dec 2021 07:14:55 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: sc7180: Add board regulators for MIPI camera
 trogdor boards
Message-ID: <YbtX7/fd61OCnv8r@google.com>
References: <20211215003639.386460-1-swboyd@chromium.org>
 <YbqlDQogwdi52FpK@google.com>
 <CAE-0n53z=CVMx=zmh6Up57E-yVG7iU3oMiM7cLPfsQwriM=+=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE-0n53z=CVMx=zmh6Up57E-yVG7iU3oMiM7cLPfsQwriM=+=w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 15, 2021 at 08:43:21PM -0800, Stephen Boyd wrote:
> Quoting Matthias Kaehlcke (2021-12-15 18:31:41)
> > On Tue, Dec 14, 2021 at 04:36:38PM -0800, Stephen Boyd wrote:
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > index d4f4441179fc..1dd8e35093a8 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > @@ -113,6 +113,40 @@ src_vph_pwr: src-vph-pwr-regulator {
> > >               vin-supply = <&ppvar_sys>;
> > >       };
> > >
> > > +     pp1800_uf_cam: pp1800-uf-cam-regulator {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "pp1800_uf_cam";
> > > +             status = "disabled";
> > > +
> > > +             regulator-min-microvolt = <1800000>;
> > > +             regulator-max-microvolt = <1800000>;
> > > +
> > > +             gpio = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&uf_cam_en>;
> > > +
> > > +             vin-supply = <&pp1800_ldo>;
> > > +             regulator-enable-ramp-delay = <1000>;
> > > +     };
> > > +
> > > +     pp1800_wf_cam: pp1800-wf-cam-regulator {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "pp1800_wf_cam";
> > > +             status = "disabled";
> > > +
> > > +             regulator-min-microvolt = <1800000>;
> > > +             regulator-max-microvolt = <1800000>;
> > > +
> > > +             gpio = <&tlmm 7 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&wf_cam_en>;
> > > +
> > > +             vin-supply = <&pp1800_ldo>;
> > > +             regulator-enable-ramp-delay = <1000>;
> > > +     };
> > > +
> >
> > Shouldn't 'pp1800_ldo' be defined before these ("FIXED REGULATORS
> > - parents above children")?
> 
> Good catch! Fixed it.
> 
> >
> > I suggest to move these two below the top level regulators, i.e.
> > somwhere after pp3300_a (probably pp3300_a and pp5000_a should be
> > swapped, but that's beyond the scope of this patch).
> >
> > >       pp5000_a: pp5000-a-regulator {
> > >               compatible = "regulator-fixed";
> > >               regulator-name = "pp5000_a";
> > > @@ -1517,4 +1611,32 @@ pinconf-sd-cd {
> > >                       drive-strength = <2>;
> > >               };
> > >       };
> > > +
> > > +     uf_cam_en: uf-cam-en {
> > > +             pinmux {
> > > +                     pins = "gpio6";
> > > +                     function = "gpio";
> > > +             };
> > > +
> > > +             pinconf {
> > > +                     pins = "gpio6";
> > > +                     drive-strength = <2>;
> > > +                     /* External pull down */
> >
> > Is there actually an external pull down?
> 
> My understanding is that there's an internal pull down in the LDO so
> while it isn't exactly "external" in the sense there's a pull down on
> the net via a resistor, there's still a pull down that you can't see in
> the schematic in the IC.

Thanks for the clarification!
