Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDBC622106
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 01:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiKIA4b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 19:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiKIA4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 19:56:30 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6246316D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 16:56:29 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id x21so23555779ljg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 16:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtKScdx9gnQYQmQPB7oVdBP1cHmrzQH4xwyrHnP4+9A=;
        b=D+ah90m+YnU29byKX4GGNKZHNHqjZh+KuGfStgg6l0hXgJwuXA1Rxcy3U/5SRO6kv+
         rFcCcHXwbIPFbsktS4yP2GYhAZRgUfdjebYsIGuyPbHWGgXdo8cJjU+t/Z68lT7OKceL
         9fHreuqTrK9t4Q8/xXWAEinSVrg7lVemXWIyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtKScdx9gnQYQmQPB7oVdBP1cHmrzQH4xwyrHnP4+9A=;
        b=6Ra0vb67pOaH+XH7D4Y8cq4ti+BH/6ZBbjzr3//SPcI806/n0a5nEC+dVP8ir9Pwem
         sTsgcBO8re8GenBqiRGhDgv8DtLldxo2KTR1D6YIuFsOFNRLD4EficKr6e8UU0Kvz/DY
         jgB9pKviIOoWD4NIuLveW75kUcbIw6Bv2xYyXDQLIPQlAR654bApA2mxKxQhfwU9c7PH
         jg3glsLSyzPlIw8J4VPOT97BB5Db7A+d21OwsRNWzl9bdSpacWVE9N5kzEi9FWBMwPit
         1BGrYtj/pnCIsLWVKIqEcLt9wvIKPQZdkK6iePf2lTSk6Bm/PoY5B9qoLqNJq7B/r0Sn
         wYNA==
X-Gm-Message-State: ACrzQf2mBPrYHyhtAkq4pPt3YtwRbC25JYKo4s8qLxjFMfJfEvLHwJXt
        sT9mg1dAe7CqRBrq5MQkanVl9zvHP+q1wjXTZLZNBA==
X-Google-Smtp-Source: AMsMyM4M2a1crQ3CNu1Pi8lGBslb4+eMcIAPSoFMhXpuyk12Jx9+xjd45Yn8NXBbYL9TwfsulJrnIQcbvRrW8x0mFOc=
X-Received: by 2002:a2e:9050:0:b0:277:430d:9f6d with SMTP id
 n16-20020a2e9050000000b00277430d9f6dmr19383175ljg.277.1667955387407; Tue, 08
 Nov 2022 16:56:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Nov 2022 16:56:26 -0800
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XKHftMn4Ja40fdDggwi78F2pB0A+prs94+fFBhbSvNYw@mail.gmail.com>
References: <20221107191535.624371-1-swboyd@chromium.org> <20221107191535.624371-3-swboyd@chromium.org>
 <CAD=FV=XKHftMn4Ja40fdDggwi78F2pB0A+prs94+fFBhbSvNYw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Nov 2022 16:56:26 -0800
Message-ID: <CAE-0n53yS28hwhNASP5KpgGHLAuEb4f_cUUc_iFc6LpzynR62g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Fully describe fingerprint node
 on Trogdor
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2022-11-07 17:22:51)
> On Mon, Nov 7, 2022 at 11:15 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index 4a5ea17a15ba..65601bea0797 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -894,13 +894,16 @@ ap_spi_fp: &spi10 {
> >         cs-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
> >
> >         cros_ec_fp: ec@0 {
> > -               compatible = "google,cros-ec-spi";
> > +               compatible = "google,cros-ec-fp", "google,cros-ec-spi";
> >                 reg = <0>;
> >                 interrupt-parent = <&tlmm>;
> >                 interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> >                 pinctrl-names = "default";
> > -               pinctrl-0 = <&fp_to_ap_irq_l>;
> > +               pinctrl-0 = <&fp_to_ap_irq_l>, <&fp_rst_l>, <&fpmcu_boot0>;
> > +               boot0-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> > +               reset-gpios = <&tlmm 22 GPIO_ACTIVE_LOW>;
>
> This isn't totally a no-op change since the pinctrl entries for
> fp_rst_l and fpmcu_boot0 will now be applied. I assume you've
> confirmed that it works as expected?

Yes my fingerprint still works to unlock. I also confirmed that the bios
sets these pinctrl settings so this is to be more explicit and not rely
on bootloader state.

>
> ...other than the subject (same as patch #1), this LGTM.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Cool thanks.
