Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9054531C74A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 09:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhBPIWb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 03:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbhBPIWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 03:22:18 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EE0C06178A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 00:20:50 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id v15so11909403wrx.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 00:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KKS3mm60WVea5SPhQi4hdtnoG3z+A2HjNVoJZwC0MIY=;
        b=V+USs4SNTFDKkTKblk5EQSbgBy9+OQlZ7dMb5/oxFQ8yc930tIWzrfZeEYnXoEuEUX
         8KyzcXaqo9XY2Pj2wNoXPdWT68qxIxf2c8fhkc9H3Sas+S+8ZEm+VLVTzO0LDz5bk9EF
         rwGKBdpgyBRzhSD762tKTqJ5UwrKtFMj6udokMjDGhrDyuRqSYgyNbyk/xMr0kYHofjD
         rQHOw5KHcQSff1rpA2z+dTbcTpfiPuuwWY9HPH6qq9Rowd/Jw4y5OHSicLNzs27EKLV8
         8cRO/HOFzG3l4CvsDtG8VsV8EVbgs9ikc7BCqoX4peqYpnb9w4ktGh1DH6xiH54NlRCB
         RrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KKS3mm60WVea5SPhQi4hdtnoG3z+A2HjNVoJZwC0MIY=;
        b=cPwwYEZsmJzLtPflXIKmbxxHtxqDjLOl83eLMbCCuI2S+iexRvn59nHR0jal23QvbM
         a3sbk10eRgy4EwCddrCoDQ1LV2qz7VaXv91JK5+xb8NkSMjdHL1NHrg5TjUAoLL/oWc2
         dMRnTfCB4Wah/TMfpFRJBLALqdIE/zPE0h4cfD8WOt9eZ2tW4lrePqYB6e6OKYnP8bRb
         l2UXT0vOrnQpZR/6eAOKVQVZzUfZb1C1fu4YlF2H1gNVjZ/YyuB0BG3Ngwri0G4DWvIO
         VwTckjK3VZ7UFBLlL8cVSsJB9TIzTlw1q1+wxjWSxl6EwxId0piFIXskspf0wQy53wWp
         Lqnw==
X-Gm-Message-State: AOAM530Q5s2FdaTfncuA02jzgHOk+53oePWeYXi4gfs1/0bBfPZzZEat
        oc7wj5wVJAhL87tpFLEF11GSmQ==
X-Google-Smtp-Source: ABdhPJzmArPGlwjG+vZMBP5b+78FxkLwYjxyYaijAK0x7nUBtsPckPTKlS5li+Bv3M/6zI/ofh8kxw==
X-Received: by 2002:adf:ab11:: with SMTP id q17mr22837604wrc.192.1613463649320;
        Tue, 16 Feb 2021 00:20:49 -0800 (PST)
Received: from dell ([91.110.221.165])
        by smtp.gmail.com with ESMTPSA id c22sm29673333wrb.91.2021.02.16.00.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 00:20:48 -0800 (PST)
Date:   Tue, 16 Feb 2021 08:20:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>, Stephen Boyd <sboyd@kernel.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>,
        Jan Kotas <jank@cadence.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Benjamin Fair <benjaminfair@google.com>,
        Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
        Viresh Kumar <vireshk@kernel.org>, openbmc@lists.ozlabs.org,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>,
        Andy Gross <agross@kernel.org>, Loc Ho <lho@apm.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Richard Woodruff <r-woodruff2@ti.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Tero Kristo <kristo@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210216082046.GA4803@dell>
References: <20210212212503.GC179940@dell>
 <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
 <20210212223739.GE179940@dell>
 <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
 <YCf4kkMsX+Ymgy6N@lunn.ch>
 <161333644244.1254594.4498059850307971318@swboyd.mtv.corp.google.com>
 <YCmUOHTtc+j4eLkO@lunn.ch>
 <20210215084952.GF179940@dell>
 <20210215094509.0b1f0bbf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210215094509.0b1f0bbf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Feb 2021, Jakub Kicinski wrote:

> On Mon, 15 Feb 2021 08:49:52 +0000 Lee Jones wrote:
> > > Jakub can explain how he added these checks.  
> > 
> > Yes, please share.
> 
> https://github.com/kuba-moo/nipa

Thanks for this.

Oh, I see.  So you conduct tests locally, then post them up in a
section called 'Checks' using the provided API.  I assume that
Patchwork does not alert the user when something has gone awry?  Is
this something Nipa does?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
