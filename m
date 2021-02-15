Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9024231B5FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 09:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhBOIul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 03:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhBOIuh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 03:50:37 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB587C061788
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 00:49:56 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id t15so7856696wrx.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 00:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/rH+YIEvuGeVBC9R5oz2oGMVMVZR0r1QY2ZB5B8+/9o=;
        b=QElcvSo2Qv1gpUhrggGEBhMfVDFIiJErGnpOzPBq7Y1hK7ebTnUVO4yrQ6+BZToA8P
         LeBi2VldpEIICxzmwlCdbaWUYxgl6A43254lN07jWS9V4f9k9WWMl3zaK59M8ftA8kYi
         FxX6NZUUrIeAX1NqEVylT9X9LJBoMdQeA5ZLZAmVxb4eDMcTioSMerbG6rDRRIQ8wQOg
         GtY3lOmcmeYhT9uG2zWjqTM1DEXVN7Si2ErvqnmxKPq84J1u43yRAQcycmhMRQDJD66c
         r2a1ekDorwBQyIFCtiRmMxy3JCieZeO97HT+zpC69Elq7MWTh5QElJKfDQZjaVcsKQk1
         n5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/rH+YIEvuGeVBC9R5oz2oGMVMVZR0r1QY2ZB5B8+/9o=;
        b=gSNcT8EjrDJEhAt5ONAHsZ7CJ228GYRLREP/2iqq9P75sDnycJewF8ugJzWSnBTorz
         eTtK2UDbxFatoBIbUB9jtUjapYaJ6RKS54B7+9wgzuVXPhJU31Dh+nTtb1uQzd6YYWfl
         lSJGa+xcNirxzFyMluii8I0+eV5TkebgKV1wIkHiycjC/wiaZR5bzGu0LdN9ToFBiA0u
         h1LeYm7ZMIN++pXvBbhx3t9RQx6DNXoHE7a1tQz+ytIa8zkLzy30E920jLe1FQ9CmEon
         g5qc1lzRxnClBZaflo1jBvSEZvpbx2Fg2/FwiHYK8SznzGgxISTsQeh+ij8tIGdcV3Ir
         Ectw==
X-Gm-Message-State: AOAM533WotQskAguNv3wSSbuiWNHRq8WDqYnmBgt2BqsaLg3TpgeBtyJ
        j/vKn8vDGPFGiEybcI7zFOa/Pg==
X-Google-Smtp-Source: ABdhPJxhaNjeFloYjkS8tVt5DeKpLQ+BaxHlwfJeH3jEEaYMRN3v4bXqekkv2M0W9w0ynZuJJwcArQ==
X-Received: by 2002:adf:f543:: with SMTP id j3mr17591804wrp.203.1613378995318;
        Mon, 15 Feb 2021 00:49:55 -0800 (PST)
Received: from dell ([91.110.221.146])
        by smtp.gmail.com with ESMTPSA id p12sm21981604wmq.1.2021.02.15.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 00:49:54 -0800 (PST)
Date:   Mon, 15 Feb 2021 08:49:52 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Stephen Boyd <sboyd@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
Message-ID: <20210215084952.GF179940@dell>
References: <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell>
 <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
 <20210212223739.GE179940@dell>
 <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
 <YCf4kkMsX+Ymgy6N@lunn.ch>
 <161333644244.1254594.4498059850307971318@swboyd.mtv.corp.google.com>
 <YCmUOHTtc+j4eLkO@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCmUOHTtc+j4eLkO@lunn.ch>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 14 Feb 2021, Andrew Lunn wrote:

> On Sun, Feb 14, 2021 at 01:00:42PM -0800, Stephen Boyd wrote:
> > Quoting Andrew Lunn (2021-02-13 08:04:34)
> > > > I'm trying to see if we can make lives better for everyone by exposing
> > > > the warnings by default in the drivers/clk/ directory now that there are
> > > > supposedly none left. Shouldn't we tighten the screws now that we've
> > > > cleaned them?
> > > 
> > > Do you use patchwork? netdev has a bot attached which applies the
> > > patch and does a W=1 build, and will report any new warnings. But it
> > > does not email the developer, as far as i know. It is up to you as the
> > > maintainer to reject the patch and say why.
> > > 
> > 
> > Yes the kernel.org patchwork instance is used but I don't see any bot
> > putting test results there. How is that done?
> > 
> > https://patchwork.kernel.org/project/linux-clk/list/
> 
> Compare this with for example:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20210213175257.28642-1-ap420073@gmail.com/

Oh, that's nice.

> Jakub can explain how he added these checks.

Yes, please share.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
