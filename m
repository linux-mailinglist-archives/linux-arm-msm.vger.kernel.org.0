Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBBF31E953
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 12:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhBRLv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 06:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbhBRJbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 04:31:55 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCD3C061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 01:31:14 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id l12so2149078wry.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 01:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VaSKa4DdnHoyZyCFHmPaCow3KCxH2Ne1C09ADbZ1yus=;
        b=dRsXTrRzk7Wc31VNcTbJfc4NgGYL0oYa4TrPkTQZMezCPZJix76Gti85Vp4Yt4U+uY
         qvfk2XL5qC9qgVqCHKJ9gGyJh/v2yDaSoxO5sAkmaNzasrphNDslGJIOOjdGbKAz1QQK
         4xghW/rirIb3npghDbJJSNGXUipsbkyVznUa4nXfrFhP8ZjY8c+Ngpd8ML3l765bhShk
         uP8iWjoRLeekT1gz2uN5nT6zKWr0JErbR50lvlx6YtfOcFshe+PTQqtahpMP8imSEncX
         8m2OjhT/DZN+hMQTXLqi/ott3uA8MLN18PbnxALj4/JHkwpwuvmJoM83JRMCZM5wrFlR
         rwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VaSKa4DdnHoyZyCFHmPaCow3KCxH2Ne1C09ADbZ1yus=;
        b=PDimMXe1lf6UaPyfKBepxdunyFZe4G/2oR+ldBfpGhV7WHXfmGT7xh49aIsSXi9F2K
         TbCefftLGaACXrEH+etO+EaVXZvSqsG4SGLJh0n7K3JiGsyJKYU3y17ot/tdJPwR9/t5
         jZ3JF8xR1joGv9RY8REAPq6E7LdEfPnwvfBeWAnUhevvHnvUPPTy9b8JUtFz9Rnr3RvT
         w5TVD1NqicOwjNT6iDlBxXAYMV4s9VjJcOaLw4vDNsmTDxhdL42tBkp8tTpYpovYc8Dj
         gISL0NJ+N0nBBh7ERaErSkMQetp2xojr361lgLT6vz069CMeqjdAD0Y2LDEMFYZvK/SQ
         XX/Q==
X-Gm-Message-State: AOAM53017xhyfkKYBkG7arS/GX12+cozYaWpYkB+T3tNlSnG5jRQ6r+F
        m++5854iWQgC9CB0zFuZz+BIFw==
X-Google-Smtp-Source: ABdhPJxE8kmixkGOJBaQqpcOpvjiGzXrQRnCSlhlsVN/0EM3RqJlhWDEhhKX5MEo/csg0r4Y/dUISA==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr3340189wrd.329.1613640671985;
        Thu, 18 Feb 2021 01:31:11 -0800 (PST)
Received: from dell ([91.110.221.153])
        by smtp.gmail.com with ESMTPSA id m24sm8233954wml.36.2021.02.18.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 01:31:11 -0800 (PST)
Date:   Thu, 18 Feb 2021 09:31:08 +0000
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
Message-ID: <20210218093108.GA62231@dell>
References: <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
 <20210212223739.GE179940@dell>
 <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
 <YCf4kkMsX+Ymgy6N@lunn.ch>
 <161333644244.1254594.4498059850307971318@swboyd.mtv.corp.google.com>
 <YCmUOHTtc+j4eLkO@lunn.ch>
 <20210215084952.GF179940@dell>
 <20210215094509.0b1f0bbf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210216082046.GA4803@dell>
 <20210217100830.50db2195@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217100830.50db2195@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 17 Feb 2021, Jakub Kicinski wrote:

> On Tue, 16 Feb 2021 08:20:46 +0000 Lee Jones wrote:
> > On Mon, 15 Feb 2021, Jakub Kicinski wrote:
> > > On Mon, 15 Feb 2021 08:49:52 +0000 Lee Jones wrote:  
> > > > Yes, please share.  
> > > 
> > > https://github.com/kuba-moo/nipa  
> > 
> > Thanks for this.
> > 
> > Oh, I see.  So you conduct tests locally, then post them up in a
> > section called 'Checks' using the provided API.  
> 
> For some definition of "locally" - NIPA runs on a rented VM.

Right.  Infrastructure that you control vs by Patchwork.

> > I assume that Patchwork does not alert the user when something has
> > gone awry?  Is this something Nipa does?
> 
> The way we run it on netdev is maintainer-centric, IOW we see 
> the failures in patchwork and complain to people manually.
> The netdev mailing list gets too many messages as is, if NIPA 
> responded with results automatically (which is not that hard
> technically) my concern is that people would be more likely to
> send untested patches to the mailing list and rely on the bot.

That makes sense.  Thank you for the explanation.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
