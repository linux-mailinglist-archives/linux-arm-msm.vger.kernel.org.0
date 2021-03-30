Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B7234F0E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 20:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbhC3SUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 14:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbhC3ST7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 14:19:59 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4416C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 11:19:58 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d8so6595647plh.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WHchZG6549lZnK2kQdDfhR3FaPwoZ53Vy9/22lDQ8HI=;
        b=CHiCE7jr6du/CACgfYw14mDYVS9as3YPHpJDYHHe1RERaB7ne7MXrXeLirZA+KOKWS
         53HF+gtkrU/OIQIqteuwl9YnDqvsM4IQjZq4PGbCFGCPM3xM8vzD/8BkHiI+YXgyDrYc
         4TsqwWSEfCQqSZuGhEl2PfRTPKqvs7xjmwW30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WHchZG6549lZnK2kQdDfhR3FaPwoZ53Vy9/22lDQ8HI=;
        b=FTpekBJJJ9mmBIz/yLcKF6SHfH4vKw0TAOVMTzdxpbM6ZMdzK9+MNCAT9nprMJVm1Z
         ZepW4pKkGQvPheKhHL8GHuzj9mUrOFmKDU9CF1OQqPeEpA8KLwe+ual/EpNHTGnnkVu4
         k1Xzd8bXx2pk2haqvgcWqxrvqprBut9TZ6xslSurWaSB2kzJqIJeOgTcHBcbh7hxCaam
         mFu+RYqRzB01bU4U8gmqqBdzrb6IDKAp1m9iT/lPriq04s6QJTOn4+oGjTgM6u3Zk9gK
         g+5ITv6jxDGKXZAqNwh3w8fyT0/5JlHwp9UZw+lcbyzZUSl0CBfSerUBV955L6YOtKiP
         xEDg==
X-Gm-Message-State: AOAM531/Oqmb6cAPpwFhqCDeVVhio0CbIVJB0ovCZ0jnbqERTv0zyFRk
        C8mgDfyNl962k0rJ8eTKYM+55gkFrT45aQ==
X-Google-Smtp-Source: ABdhPJzyxxR3xZRio9vD8chWNpVR7OitZ728kBIezXGD6Y3qo3a3VTygwIpyEUaSRgXHKTXbfT8EfQ==
X-Received: by 2002:a17:902:f24a:b029:e6:3d73:f90e with SMTP id j10-20020a170902f24ab02900e63d73f90emr8866841plc.63.1617128398370;
        Tue, 30 Mar 2021 11:19:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:74b3:8070:8b1:c494])
        by smtp.gmail.com with UTF8SMTPSA id m7sm3419399pjc.54.2021.03.30.11.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 11:19:57 -0700 (PDT)
Date:   Tue, 30 Mar 2021 11:19:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     skakit@codeaurora.org
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
Message-ID: <YGNry9mxHVwZn6Z0@google.com>
References: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
 <YEvR1kDm32tE7mK3@google.com>
 <4dc784eb3c00a9805141148732476838@codeaurora.org>
 <YFjVEjcx36J97hVW@google.com>
 <e8af9692a9a54e44ad687bb8984fad7a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e8af9692a9a54e44ad687bb8984fad7a@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 25, 2021 at 10:50:57AM +0530, skakit@codeaurora.org wrote:
> Hi Matthias,
> 
> On 2021-03-22 23:04, Matthias Kaehlcke wrote:
> > Hi Satya,
> > 
> > On Mon, Mar 22, 2021 at 06:50:47PM +0530, skakit@codeaurora.org wrote:
> > > Hi Matthias,
> > > 
> > > On 2021-03-13 02:10, Matthias Kaehlcke wrote:
> > > > Hi Satya,
> > > >
> > > > On Thu, Mar 11, 2021 at 04:10:29PM +0530, satya priya wrote:
> > > > > Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
> > > > > GPIOs, RTC and other PMIC infra modules for SC7280.
> > > > >
> > > > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > > > ---
> > > > > This patch depends on base DT and board files for SC7280 to merge
> > > > > first
> > > > > https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
> > > > >
> > > > >  arch/arm64/boot/dts/qcom/pm7325.dtsi  |  60 ++++++++++++++++++++
> > > > >  arch/arm64/boot/dts/qcom/pm8350c.dtsi |  60 ++++++++++++++++++++
> > > > >  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 104
> > > > > ++++++++++++++++++++++++++++++++++
> > > > >  arch/arm64/boot/dts/qcom/pmr735a.dtsi |  60 ++++++++++++++++++++
> > > > >  arch/arm64/boot/dts/qcom/sc7280.dtsi  |   8 +++
> > > > >  5 files changed, 292 insertions(+)
> > > > >  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
> > > > >  create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > > >  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
> > > > >  create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi
> > > > > b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> > > > > new file mode 100644
> > > > > index 0000000..393b256
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> > > > > @@ -0,0 +1,60 @@
> > > >
> > > > ...
> > > >
> > > > > +		polling-delay-passive = <100>;
> > > > > +		polling-delay = <0>;
> > > >
> > > > Are you sure that no polling delay is needed? How does the thermal
> > > > framework
> > > > detect that the temperatures is >= the passive trip point and that it
> > > > should
> > > > start polling at 'polling-delay-passive' rate?
> > > >
> > > 
> > > As the temp-alarm has interrupt support, whenever preconfigured
> > > threshold
> > > violates it notifies thermal framework, so I think the polling delay
> > > is not
> > > needed here.
> > 
> > From the documentation I found it's not clear to me how exactly these
> > interrupts work. Is a single interrupt triggered when the threshold is
> > violated or are there periodic (?) interrupts as long as the temperature
> > is above the stage 0 threshold?
> > 
> > Why is 'polling-delay-passive' passive needed if there are interrupts?
> > Maybe
> > to detect that the zone should transition from passive to no cooling
> > when the
> > temperature drops below the stage 0 threshold?
> 
> The PMIC TEMP_ALARM peripheral maintains an internal over-temperature stage:
> 0, 1, 2, or 3.  Stage 0 is normal operation below the lowest (stage 1)
> threshold [usually 95 C].  When in stage 1, the temperature is between the
> stage 1 and 2 thresholds [stage 2 threshold is usually 115 C].  Upon hitting
> the stage 3 threshold [usually 145 C], the PMIC hardware will automatically
> shut down the system.
> 
> The TEMP_ALARM IRQ fires on stage 0 -> 1 and 1 -> 0 transitions.  We
> therefore set polling-delay = <0> since there is no need for software to
> monitor the temperature periodically when operating in stage 0.  Upon
> crossing the stage 1 threshold, SW receives the IRQ and the thermal
> framework hits its first trip changing the thermal zone to passive mode.
> This then engages the 100 ms polling enabled via polling-delay-passive =
> <100>.  If the temperate keeps climbing and passes the stage 2 threshold,
> the thermal framework hits the second trip (which is critical) and it
> initiates an orderly shutdown.  If the temperature drops below the stage 1
> threshold, then the thermal framework exits passive mode and stops polling.
> This approach reduces/eliminates the software overhead when not at an
> elevated temperature.

Thanks for the clarification. With the interrupt only firing on stage 0 -> 1
and stage 1 -> 0 it makes sense. I was expecting interrupts on the other
transitions too.
