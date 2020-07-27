Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2561122E8A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 11:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgG0JPZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 05:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0JPZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 05:15:25 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2420EC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 02:15:25 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id b24so5190571uak.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3lXFk4OkKW0RhlCVfH/wg1VKJylO9Hv/KMUScr2Ti0E=;
        b=egtV1aXY3u/TJmL7NXsxrT/SgrePqFIhMC2CyIDQqAU7eILw1wihstpqr5jptZXfFx
         x3krESYFTHGM2SEz7OMPQh76J975VsWLCEvPyoqGl9OehOON0JEBjvXd46JMVCCY/zZZ
         dJgzPagqtx3pxJY4bYxfRpXifXAwhK+76s9UrIr0Hzh3TvNxjkXDiTQ8/f6A40ACKPbQ
         th7GtpOCrzut5eNdbpfUHRTBhcptUa/JVUoeLQDoW4kR+w73zJW3RIgifOLRAd/C+kZm
         vfPEnmHlUiWCevWCSh5koKKxnl2mUnfg+NE21FJzmH8l28dJ0c85O7zFQo3Nyzz7wWii
         ko6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3lXFk4OkKW0RhlCVfH/wg1VKJylO9Hv/KMUScr2Ti0E=;
        b=FAXe2MFSartQTyfcyZHwJKr8qWJEHonmo8lYx3kfQ4y0z715e1RUkMGv/FsR1+zwtK
         Wi/X7mx+yHIt1/yg8jIlLj/+DQl9h65VDt/OKv1xhmOZeTU87ArHpp9l73pRhfNCVHTo
         clZ7cURdI6M9ahPZ5kNRn0EHv1ExlZpE1g7qx8v9tZVyZ68YHNqQchRVDUqM+ZLJOuF1
         w9MEB/UmqRLND91uRJvR0RP46aP05yiCRSdGjOu/fowKwaBDxa78u7XwdovWE6ufFERp
         MPnectTV7pP4UQfXOEU9ii6w5VOvWrf0WfOtu3XHzrTObqE2qS++KZ0zPLkZ4r2o+OI5
         kXZw==
X-Gm-Message-State: AOAM532jQebptoZ/v74ApM5cuajZ82yuhr1xgdAeCBN9CLaljRTaxLl6
        pAkYlIN0gjzsrHd+hiNtUp9dkXxtpKrckc9Kjvfs603D/ho=
X-Google-Smtp-Source: ABdhPJxNDSLsXIXsDG35VGWFqbQrbNQyXIwMD2fJdLXGnXGrMzAvcDYVd4Hz3cCpuYP6CvnckHIHZ2vyAMLI34aeqoQ=
X-Received: by 2002:a9f:2742:: with SMTP id a60mr188119uaa.48.1595841324120;
 Mon, 27 Jul 2020 02:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200629144926.665-1-shawn.guo@linaro.org> <20200629144926.665-3-shawn.guo@linaro.org>
 <CAHLCerMyEsvuhNPnwDow5JYVAbem0Rzs+5-uzKZNeFt+3rYHQg@mail.gmail.com>
 <CAHLCerPEPEOkkBd8MZq8T99eS7nE2pMio6ojnMn7bc54ian-3A@mail.gmail.com> <20200727083322.GA12266@dragon>
In-Reply-To: <20200727083322.GA12266@dragon>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 27 Jul 2020 14:45:13 +0530
Message-ID: <CAHLCerNXtEDONQqXeeCbo3jSL8HNpP-OxW0es0ZQuWNnaAaPFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] thermal: qcom: tsens-v0_1: Add support for MSM8939
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 2:03 PM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> Hi Amit,
>
> On Mon, Jul 27, 2020 at 12:06:54PM +0530, Amit Kucheria wrote:
> > On Mon, Jul 27, 2020 at 11:56 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > >
> > > On Tue, Jun 30, 2020 at 1:09 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> > > >
> > > > The TSENS integrated on MSM8939 is a v0_1 device with 10 sensors.
> > > > Different from its predecessor MSM8916, where 'calib_sel' bits sit in
> > > > separate qfprom word, MSM8939 has 'cailb' and 'calib_sel' bits mixed and
> > > > spread on discrete offsets.  That's why all qfprom bits are read as one
> > > > go and later mapped to calibration data for MSM8939.
> > > >
> > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > >
> > > Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
> >
> > Shawn,
> >
> > Have you not sent the change to the tsens.yaml and 8939 DT yet or did
> > I miss them?
>
> You were copied on '[PATCH 1/2] dt-bindings: tsens: qcom: Document
> MSM8939 compatible'.

Aah ok, it was threaded weirdly but I see it now.

> For DTS change, I haven't sent them out.  In case
> you want to have a look, here it is.

This looks fine from a quick glance. Thanks.

>         thermal-zones {
>                 cpu0-thermal {
>                         polling-delay-passive = <250>;
>                         polling-delay = <1000>;
>
>                         thermal-sensors = <&tsens 5>;
>
>                         trips {
>                                 cpu0_alert: trip0 {
>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
>                                 cpu0_crit: trip1 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
>
>                         cooling-maps {
>                                 map0 {
>                                         trip = <&cpu0_alert>;
>                                         cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>                                 };
>                         };
>                 };
>
>                 cpu1-thermal {
>                         polling-delay-passive = <250>;
>                         polling-delay = <1000>;
>
>                         thermal-sensors = <&tsens 6>;
>
>                         trips {
>                                 cpu1_alert: trip0 {
>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
>                                 cpu1_crit: trip1 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
>
>                         cooling-maps {
>                                 map0 {
>                                         trip = <&cpu1_alert>;
>                                         cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>                                 };
>                         };
>                 };
>
>                 cpu2-thermal {
>                         polling-delay-passive = <250>;
>                         polling-delay = <1000>;
>
>                         thermal-sensors = <&tsens 7>;
>
>                         trips {
>                                 cpu2_alert: trip0 {
>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
>                                 cpu2_crit: trip1 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
>
>                         cooling-maps {
>                                 map0 {
>                                         trip = <&cpu2_alert>;
>                                         cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>                                 };
>                         };
>                 };
>
>                 cpu3-thermal {
>                         polling-delay-passive = <250>;
>                         polling-delay = <1000>;
>
>                         thermal-sensors = <&tsens 8>;
>
>                         trips {
>                                 cpu3_alert: trip0 {
>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
>                                 cpu3_crit: trip1 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
>
>                         cooling-maps {
>                                 map0 {
>                                         trip = <&cpu3_alert>;
>                                         cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>                                 };
>                         };
>                 };
>
>                 cpu4567-thermal {
>                         polling-delay-passive = <250>;
>                         polling-delay = <1000>;
>
>                         thermal-sensors = <&tsens 9>;
>
>                         trips {
>                                 cpu4567_alert: trip0 {
>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
>                                 cpu4567_crit: trip1 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
>
>                         cooling-maps {
>                                 map0 {
>                                         trip = <&cpu4567_alert>;
>                                         cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>                                                          <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>                                 };
>                         };
>                 };
>
>         };
>
>         qfprom: qfprom@5c000 {
>                 compatible = "qcom,qfprom";
>                 reg = <0x5c000 0x1000>;
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 tsens_caldata: caldata@a0 {
>                         reg = <0xa0 0x5c>;
>                 };
>         };
>
>         tsens: thermal-sensor@4a9000 {
>                 compatible = "qcom,msm8939-tsens";
>                 reg = <0x4a9000 0x1000>, /* TM */
>                       <0x4a8000 0x1000>; /* SROT */
>                 nvmem-cells = <&tsens_caldata>;
>                 nvmem-cell-names = "calib";
>                 #qcom,sensors = <10>;
>                 interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
>                 interrupt-names = "uplow";
>                 #thermal-sensor-cells = <1>;
>         };
>
> Shawn
