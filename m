Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D635B2610FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 13:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbgIHLwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 07:52:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729275AbgIHLtt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 07:49:49 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AC1F21D20
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599565727;
        bh=fpBhZdcFA2nT+LOHlmWJkzA7pUhfRv3Z0z4/r76r8sE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GxvyckKncdsWAYWdYCyBqzngQ5pJQGCl289UYedohvd+GwMQt9XRY5BeOXHIuWsDV
         Prg27ExRq9IgNFodmQtcOzZz/0NykeGclT7Ygs5XYJXiGKgVP/33bvTHF0xKyPsn+K
         TNGsFQ/mF6M8nnw049ryQE3R6u88pLzaBybumWpA=
Received: by mail-ua1-f48.google.com with SMTP id v20so4962877ual.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 04:48:47 -0700 (PDT)
X-Gm-Message-State: AOAM533UIqrbVqmLuq8814yxQXh4PTlMOiQd82YIPT+3BBdNSbwwBFM0
        czEkZ8nfjDh5dGNevyCL9BRbPdXqfbyoPhadi95Rsg==
X-Google-Smtp-Source: ABdhPJx0wlUX+AQkSiu88mLr5YZA/jqNUjgJG4PaAMfX+zdUKEsVE128TkEJSrqRWaIZi+Bjj2vKcKUmDpZ88sxxaao=
X-Received: by 2002:ab0:384a:: with SMTP id h10mr5000472uaw.77.1599565726623;
 Tue, 08 Sep 2020 04:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
 <20200908075716.30357-6-manivannan.sadhasivam@linaro.org> <20200908103444.5e526uawa45om6lt@vireshk-i7>
 <20200908111141.GB23095@mani> <20200908111813.bbgfxo5v7qt6ujpc@vireshk-i7>
In-Reply-To: <20200908111813.bbgfxo5v7qt6ujpc@vireshk-i7>
From:   Amit Kucheria <amitk@kernel.org>
Date:   Tue, 8 Sep 2020 17:18:35 +0530
X-Gmail-Original-Message-ID: <CAHLCerMndYeEBOxtj8mV7OdOP9pufx+C7n1F9m+CFAneuh8DnA@mail.gmail.com>
Message-ID: <CAHLCerMndYeEBOxtj8mV7OdOP9pufx+C7n1F9m+CFAneuh8DnA@mail.gmail.com>
Subject: Re: [PATCH 5/7] cpufreq: qcom-hw: Use regmap for accessing hardware registers
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 8, 2020 at 4:48 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 08-09-20, 16:41, Manivannan Sadhasivam wrote:
> > On 0908, Viresh Kumar wrote:
> > > On 08-09-20, 13:27, Manivannan Sadhasivam wrote:
> > > > Use regmap for accessing cpufreq registers in hardware.
> > >
> > > Why ? Please mention why a change is required in the log.
> > >
> >
> > Only because it is recommended to use regmap for abstracting the hw access.
>
> Yes it can be very useful in abstracting the hw access in case of
> busses like SPI/I2C, others, but in this case there is only one way of
> doing it with the exact same registers. I am not sure it is worth it
> here. FWIW, I have never played with regmaps personally, and so every
> chance I can be wrong here.

One could handle the reg offsets through a struct initialisation, but
then you end up with lots of #defines for bitmasks and bits for each
version of the IP. And the core code becomes a bit convoluted IMO,
trying to handle the differences.

regmap hides the differences of the bit positions and register offsets
between several IP versions.

> > Moreover it handles the proper locking for us in the core (spinlock vs mutex).
>
> What locking do you need here ?

Right, locking isn't the main reason here.

>
> > I've seen many subsystem maintainers prefer regmap over plain readl/writel
> > calls. I'll add the reason in commit log.
>
> I am not sure if it is worth it here.
