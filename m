Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7C431A7EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 23:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbhBLWmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 17:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbhBLWkI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 17:40:08 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B37C06178B
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Feb 2021 14:37:43 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id o15so997133wmq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Feb 2021 14:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gabp5PA91SwinpJ0/myZDDPAWJJmDGhuF5vT4HNQofk=;
        b=lzptYNv+Z/QkUjO1dor3sL5BlvgIRzJT0h3tMKe+AEsBnXH7z9s3DEjUf4ogNn07Bm
         SYkfEK7DEk7HbO6bs2GfyVnUPJuIbwvSYRQZU3qm/ENvlPlqYZYeeFUmElt8hp9808Gh
         jHiPsPRyuDq4vcSW3ZynoMmbn8t/Vf83Qeij8ATKKgXsvBiBStVp2M/aogaFGZo2G9l9
         KOksv/RBoVdxTB+BnnfIFJzEKw94Qm6UwwU4X4q4w6Xrx3QHpWeTjpL/uS9dH4q0UvT/
         nOAIOypn0sTekthhwXWei2O6M2wnbBdsYnwxj2Gp697y/os3Rxes6rNclui8jYxeeUvD
         fA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gabp5PA91SwinpJ0/myZDDPAWJJmDGhuF5vT4HNQofk=;
        b=Jn+qOgzwxREfMJWfdzgwY4D0R/fsg4XVCW5/bB4QvlJlvH8n8wqcokAzbBY71syCgN
         Sx83IuN7xkZq5QkWAGpDmxjTLCHtccSs9qW/OyjsTX0xfw9MriBpHnKQdFnyusH73aoj
         fAg+gf+bL/dUo/tT6Q92pdW4YCFgJOVQF+oybhWrRmGbQfO+3QLtc69Ezs16w2fRgCt9
         DhGqLTLdViLjbJKzuJ8ESy7d82KwoSieRH72cvk5LhlwqaIqfbaxk4C7naiW2D5B8zaP
         f0Mv/HMa7IKKBMZehKtJ55LYdGHYCvoXcshTZ1lzxCF3ohhuPR+rqRYd30o0m1P9OQF0
         aeBg==
X-Gm-Message-State: AOAM5305iM7hOTNpEtX3WjUP5P5lQ6whrB5RaiHEBpV3LX6vYfsOCaIj
        88OiotGWbuF3SN3oBb/99Fsoig==
X-Google-Smtp-Source: ABdhPJw/W7aXURMUdb+FiiPcMWZ20hidPBYo6T7ZCqELCNUFf+nZRpp16Lmp3XkUiPvFeKkrd7BkhQ==
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr4450894wmf.93.1613169462215;
        Fri, 12 Feb 2021 14:37:42 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id l5sm11839112wrv.44.2021.02.12.14.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 14:37:41 -0800 (PST)
Date:   Fri, 12 Feb 2021 22:37:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, Loc Ho <lho@apm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Nancy Yuen <yuenn@google.com>,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        NXP Linux Team <linux-imx@nxp.com>, openbmc@lists.ozlabs.org,
        Patrick Venture <venture@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>,
        Richard Woodruff <r-woodruff2@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Tero Kristo <kristo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210212223739.GE179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell>
 <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 12 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-02-12 13:26:30)
> > On Fri, 12 Feb 2021, Lee Jones wrote:
> > 
> > > The alternative is to not worry about it and review the slow drip of
> > > fixes that will occur as a result.  The issues I just fixed were built
> > > up over years.  They won't get to that level again.
> > > 
> > > In my mind contributors should be compiling their submissions with W=1
> > > enabled by default.  I'm fairly sure the auto-builders do this now.
> 
> That's good.
> 
> > > 
> > > Once W=1 warnings are down to an acceptable level in the kernel as a
> > > whole, we can provide some guidance in SubmittingPatches (or similar)
> > > on how to enable them (hint: you add "W=1" on the compile line).
> > > 
> > > Enabling W=1 in the default build will only serve to annoy Linus IMHO.
> > > If he wants them to be enabled by default, they wouldn't be W=1 in the
> > > first place, they'd be W=0 which *is* the default build.
> > 
> > Just to add real quick - my advice is to enable them for yourself and
> > send back any issues along with your normal review.  A W=1 issue is no
> > different to a semantic or coding style one.
> > 
> 
> I'd like to enable it for only files under drivers/clk/ but it doesn't
> seem to work. I'm not asking to enable it at the toplevel Makefile. I'm
> asking to enable it for drivers/clk/ so nobody has to think about it now
> that you've done the hard work of getting the numbers in this directory
> down to zero or close to zero.

I'm not sure which one of us is confused.  Probably me, but ...

Even if you could enable it per-subsystem, how would that help you?

How can you ensure that contributors see any new W=1 warnings, but
Linus doesn't?  When Linus conducts his build-tests during the merge
window, he is also going to build W=1 for drivers/clk.

All that's going to achieve is put you in the firing line.

From my PoV W=1 builds should be enabled during the development phase
(i.e. contributor, auto-builder, maintainer).  By the time patches get
make it into Mainline the review/testing stage is over and only the
default W=0 warnings are meaningful.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
