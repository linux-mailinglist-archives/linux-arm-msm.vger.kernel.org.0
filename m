Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69834319BC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 10:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBLJVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 04:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhBLJVB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 04:21:01 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11CFC0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Feb 2021 01:20:20 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m1so316143wml.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Feb 2021 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bqamNlgMJwnX1NfLFZzeEkJ+qDBnsfEzOwlb2Z22/gs=;
        b=QFvzjb1GkmDAeWGmn0HBsLlJ5qWtRzXU3LQZdoxoTZf9a7D0uxaXnwTzEi3yg3K+R6
         0KxRGJAJ40ru1Jy+eFG3H628g1eUsLyx62qGM9QYm3wRfMsp2GN045FaOhN8hM++OVa6
         9FmtkdB8GGwPPcX3fBFQiEzdjM0yiklqoeJZS3RxJdYdeWoU6cxjyqVMcdmt0asZRjlD
         cWNvyF51ci/nq/9S/KpoRK3wKuMMN2LcrjgBWQ355U+hBe1RHZKPgxjejrHDvUIK/QRZ
         UUHuVY3UTJBxhEoGoYvYIDX2kMO8XxAv52ByEvaY6JnnjJacsF9cwmlvuWp1vrsd08GC
         9DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bqamNlgMJwnX1NfLFZzeEkJ+qDBnsfEzOwlb2Z22/gs=;
        b=OipZ7dC0rEmSHHAwNDs+6oXMtZK7ifuEJzd0I49dQOBzT2/Zf/S8qHRZG1yyQyO/Ae
         GFjLv3BIswOpxmisvlhAFvJK3/u6qbGnm1DgvsMAQRLaeNXtdOsnH+JfwMzIFCNgdUPc
         xn+S0/C1ukkQMoL5ba1eeCoi9IhHj29Zencg97Z3w/3LSTo03uqiKj3wxKYCoz/RRTzc
         PFdSkKet8oftK0AtCQPQmiwX8rDOp68KxS8t1zDIMA12SBft5452XFSU72ntFPht4BqU
         imzR+bLTxDy1V3LwtUpwD9Rgyt3NLwEkLV/5Z78GfheSdFa6g9jR7tSp9ROFguPHoNJ7
         zQEg==
X-Gm-Message-State: AOAM532weHRFZEgthclo7aT3BbrJuOuv45K94S1PFmcVc/tf1A/BpLRu
        CuwCbwytt+/36CyZ321G3sOoWA==
X-Google-Smtp-Source: ABdhPJzfB+2m0CuwIvKupkk6mtJvy2bOkvYMQcFwy8G4Q2gLr8baAJCjDmApyqiyqqb9nNKw9aR0fQ==
X-Received: by 2002:a1c:113:: with SMTP id 19mr1795873wmb.7.1613121619466;
        Fri, 12 Feb 2021 01:20:19 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id x4sm9178784wrn.64.2021.02.12.01.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 01:20:19 -0800 (PST)
Date:   Fri, 12 Feb 2021 09:20:16 +0000
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
Message-ID: <20210212092016.GF4572@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-02-11 13:10:54)
> > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > 
> > > Quoting Lee Jones (2021-01-26 04:45:19)
> > > > This set is part of a larger effort attempting to clean-up W=1
> > > > kernel builds, which are currently overwhelmingly riddled with
> > > > niggly little warnings.
> > > > 
> > > > This is the last set.  Clock is clean after this.
> > > 
> > > Is it possible to slam in some patch that makes W=1 the default for the
> > > clk directory? I'm trying to avoid seeing this patch series again.
> > 
> > One of my main goals of this project is that everyone (contributors,
> > maintainers auto-builder robots etc) will be enabling W=1 builds
> > *locally*.
> > 
> > This isn't something you'll want to do at a global (i.e. in Mainline)
> > level.  That's kinda the point of W=1.
> > 
> 
> Agreed, but is it possible to pass W=1 in the drivers/clk/Makefile?

That would circumvent the point of W=1.  Level-1 warnings are deemed,
and I'm paraphrasing/making this up "not worth rejecting pull-requests
over".  In contrast, if Linus catches any W=0 warnings at pull-time,
he will reject the pull-request as 'untested'.

W=1 is defiantly something you'll want to enable locally though, and
subsequently push back on contributors submitting code adding new
ones.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
