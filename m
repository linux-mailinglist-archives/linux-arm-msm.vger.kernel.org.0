Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772E53194E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 22:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhBKVLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 16:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhBKVLj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 16:11:39 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5AFC061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 13:10:59 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 190so6749124wmz.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 13:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jS8uFEKJN3Q7z1nnFUZphS+85VjJXUxSu7oHf1ltyB0=;
        b=pGXBmhZfxNzpUj3DU9XcdDqUsNIvFlQva7eCXTEz7Joxs93CRthvAWsMPl1oWP2n/g
         8zadPY+2YOwrErplgbDWZMFrWbWBL1XjQLxrj4iEs/eGplAth/DV6vHCTvETe0cKQcmS
         DnNyvgOUd31g2Xs9O206WfLVjzQQpI/elwoisiJlmKGo0sihidiD+QOJZAeX0aWHphz+
         q/aK/ZU+IID6tZ1cciI7dFecLh3LfdynBqW/QIuhGGLDLfCXBY+FsmX9jpdUs1GJsG7D
         ZlymHM76hmC80hAggXMs4oaui/l/NiVXXlXes79L1BHNy9rGno3L8PVIKwoydaGf9Ra+
         qDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jS8uFEKJN3Q7z1nnFUZphS+85VjJXUxSu7oHf1ltyB0=;
        b=hkuXD5C/V7bWs8LPgNsdESzbpiNE7KHGwmnOWO18ZlADj/cpVuc9Nw0CspfQGjRTZt
         BybCRLPNygmJSHF8otFqB0dfNBc46UelYzgq/DAMtThpuPjO7plXn8WlWc0FMWJrOygV
         aiKyhmRfV3WIvHW8OmOj0iUES2qBepm1N9BH9nwn97z2EwYetVLh5Ws82t2nv23tuKAI
         TP7RH+MuG0BYWBgcumHcQiBQL7vmNM1Vds1MgfI4I95OR+gA1rqg6NrMBQWJaLx6Jdd6
         kYVmtXQvz/u5EOqR1PCzMmkSMRK4+JD5wgGcWbosfjZLwTLpsPwQKUxlam9nlDUD1Vnh
         hV/Q==
X-Gm-Message-State: AOAM531G1WlGhF/cHm/q/ThjuAOUSDm1cC+Pa4u8UxMvwRoZCnUaaXfN
        X7vmCoBnvV940bw5J5nOQu+tUg==
X-Google-Smtp-Source: ABdhPJw8JfvQOF+sCQO0uk/DNBEk4iFr6tFX4elV5/TCX1Zcujns/8wiUYi2u3IgXDuQprbG6IFt5Q==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr1885311wmb.134.1613077857539;
        Thu, 11 Feb 2021 13:10:57 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id f7sm6932559wrm.92.2021.02.11.13.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 13:10:56 -0800 (PST)
Date:   Thu, 11 Feb 2021 21:10:54 +0000
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
Message-ID: <20210211211054.GD4572@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-01-26 04:45:19)
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > This is the last set.  Clock is clean after this.
> 
> Is it possible to slam in some patch that makes W=1 the default for the
> clk directory? I'm trying to avoid seeing this patch series again.

One of my main goals of this project is that everyone (contributors,
maintainers auto-builder robots etc) will be enabling W=1 builds
*locally*.

This isn't something you'll want to do at a global (i.e. in Mainline)
level.  That's kinda the point of W=1.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
