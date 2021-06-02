Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DA4399042
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 18:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFBQqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 12:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhFBQqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 12:46:40 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5EAC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 09:44:41 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 29so2697816pgu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v1f6CY6XzYIBDy4/kZuiiMp2Rh7Gg1cKpg7RU77/HAg=;
        b=Plf/wGF5S49Noco4Lig+ZtpLaf/nj2FWSq4m/6+/1iRatd/EzSpCq3HI3yM/phuTDg
         yLlOMxzhO3nO4qurZzgww8yeslx0ID5Oft7SF536Et0+q9iaUveoiSGuGprHU2r5aU9N
         tDK89CSSG06nSXiuhleCfCjYeyYcrSXSCVubM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v1f6CY6XzYIBDy4/kZuiiMp2Rh7Gg1cKpg7RU77/HAg=;
        b=kqQkdBbP2PFQJVPOdLpHdnEjwmwTrMxpSQ2Som0q/MLh5QPQHb6+MY1xHgLTO1tgOt
         wEdlNcja3IY6Pd92btxNdENDxk85uKTNSo7q6PVt1B7MJGaZmriePJ9gRegUbXKswsPD
         ey67vHHmlm6ZIlylGmKpB6dbKBdgQbTR445DcLsiE4OgDypUUJrqliGOQ/a2bDhzu7oe
         96ELhXr+hBBOdZZV2NIUBmwAHoCUIRozaccD1xEaJOWu6/5w//UIOLcg9qKoO6s1JLsB
         oBVfXI5a1+tpvrpelesevbzXyMyn2JVn4DLDbKdbOVT1bTQKlQHIY2uPrbjBvbsOEHZW
         VU6Q==
X-Gm-Message-State: AOAM532WGlrahv5KlL04VMbPRW3QBnci5fkM3beQkxC/KU/0jrx3JD4v
        la/gb+9GzpeS9RZyQbEb+qCr5A==
X-Google-Smtp-Source: ABdhPJyXVRE3MD31LcQEETFgTuL3GaZyuB8KTIU0GRkdXTHFP3v/4uWJaCnCXuP/7U112M4am8+zlA==
X-Received: by 2002:aa7:8b44:0:b029:2dd:4cfc:7666 with SMTP id i4-20020aa78b440000b02902dd4cfc7666mr28339371pfd.73.1622652281039;
        Wed, 02 Jun 2021 09:44:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d737:2805:1403:7c09])
        by smtp.gmail.com with UTF8SMTPSA id z7sm275711pgr.28.2021.06.02.09.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 09:44:40 -0700 (PDT)
Date:   Wed, 2 Jun 2021 09:44:38 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: pm6150: Add thermal zone for PMIC
 on-die temperature
Message-ID: <YLe1dmEWq9+MjfTR@google.com>
References: <20210602090525.1.Id4510e9e4baaa3f6c9fdd5cdf4d8606e63c262e3@changeid>
 <CAD=FV=XcoLLCn+H6h9cX+qPjoueVFgK8BssvUXQ6WjVAapRyMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=XcoLLCn+H6h9cX+qPjoueVFgK8BssvUXQ6WjVAapRyMg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On Wed, Jun 02, 2021 at 09:36:07AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 2, 2021 at 9:06 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Add a thermal zone for the pm6150 on-die temperature. The system should
> > try to shut down orderly when the temperature reaches 95degC, otherwise
> > the PMIC will power off at 115degC.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/pm6150.dtsi | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
> > index 8ab4f1f78bbf..de7fb129f739 100644
> > --- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
> > @@ -7,6 +7,30 @@
> >  #include <dt-bindings/spmi/spmi.h>
> >  #include <dt-bindings/thermal/thermal.h>
> >
> > +/ {
> > +       thermal-zones {
> > +               pm6150_thermal: pm6150-thermal {
> > +                       polling-delay-passive = <100>;
> > +                       polling-delay = <0>;
> > +                       thermal-sensors = <&pm6150_temp>;
> > +
> > +                       trips {
> > +                               pm6150_trip0: trip0 {
> > +                                       temperature = <95000>;
> > +                                       hysteresis = <0>;
> > +                                       type = "passive";
> > +                               };
> > +
> > +                               pm6150_crit: pm6150-crit {
> 
> Nit that the node names are not symmetric. One is "trip0" and the
> other is "pm6510-crit". Seems like you can remove the "pm6150-" prefix
> from this one (but keep it in the label?)

Sounds good.

> > +                                       temperature = <115000>;
> > +                                       hysteresis = <0>;
> > +                                       type = "critical";
> > +                               };
> > +                       };
> > +               };
> 
> Correct me if I'm misunderstanding, but I don't think that the
> description of this patch matches the contents. You're saying that the
> PMIC will power itself off at 115C and that we want to do an orderly
> shutdown _before_ the PMIC powers off. Doesn't that mean that the
> "critical" trip needs to be at some temperature _lower_ than 115C? As
> I remember it the system performs an orderly shutdown starting when it
> sees the critical temperature.

Yeah, you are right. Polling starts at 95degC, the system should try to
shutdown at 115degC and based on that configuration the emergency
shutdown would happen at 145degC:

  static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
        {  90000, 110000, 140000 },
  	{  95000, 115000, 145000 },
  	{ 100000, 120000, 150000 },
  	{ 105000, 125000, 155000 },
  };

I'll fix the commit message in the v2.
