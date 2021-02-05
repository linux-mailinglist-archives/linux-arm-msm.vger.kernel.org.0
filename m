Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1412F31110F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 20:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbhBERlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 12:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233591AbhBERiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 12:38:10 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33975C06178A
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 11:19:53 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id c12so8889948wrc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 11:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jKpWYq7VIIL6VYUoIW5OckVXatPGRV104LzvjFGIr1c=;
        b=HwIpaNjwBxYkUwux2fQ5Do8bhE9RIxKGf3pBtqircLjR/ltu3YBNFOqrISVA9cKWcR
         9LZ/kEg7RcmLgK7zzuGM6Ws9pPX2PHkVBWjx7IaAGU/LGoLG4WajR2fEp/7WTQlSp7Ad
         Qm2lM6PHf5+u73jqSb5tFR4dD3MD2z/riun81VWe0cKVIlc0Ddfjp7OiBOmLWFjVOrZF
         EabzDIVnsRVobIqrdK9/T4ed2N0Y+9XPWyFj+AimPzyyzBk+I1nxbBwpskI6zwL8GDSt
         aDbX+8HiSKRQ4DZoeaTXWnA7xfkWaLrWQdZj0Tysv6O9oTbtpPZD6bTpfDxJJNyB+kiD
         Gswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jKpWYq7VIIL6VYUoIW5OckVXatPGRV104LzvjFGIr1c=;
        b=qe+jyoYQguaGMIgYYErC0XUr5UTtDVP98sSaIsnUVoMjKK+Bex3ZaQg/qvsD5An3I/
         a6ML9cNiqhyzugWJEcx9EHVPlw4KX7WoLJ/P6sydpM6+1FkGleX6y8ZFqTiVEM5RzB25
         5XPQhCnlGuZADP2gQd5E5qeAR/Beyy+MvcSjg9vHd08KGCQr3Lnk2wI22smf8rObzzko
         tRFQp8u9tGtv6DYdou0Cn8X3jHG+3kg7YKPzqtcXt+FmRui8GXfU7dvletg1e0U15vYc
         mp96jZvJVoVVqoy6ekisnCY+tQKJSjLFlDennll7lBYCig04Egtt0kDpHqDTR03kI4ii
         6jfQ==
X-Gm-Message-State: AOAM532jcMlTIInplX/LIpZdnQA8RoM/tbiXJ4ZJZDDdW/XDMmMsXNMC
        +IyR74igNZw6uLZkX6lCVyUQpA==
X-Google-Smtp-Source: ABdhPJzCBGvv1VGUurr+4N/vSECBVMAquwr4j/9tJjZbqQkfy05JU+uYe9sEdOTVfMMZi1qhBeuO9w==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr6639112wru.304.1612552791820;
        Fri, 05 Feb 2021 11:19:51 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id k4sm14244388wrm.53.2021.02.05.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 11:19:51 -0800 (PST)
Date:   Fri, 5 Feb 2021 19:19:48 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
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
        Jonathan Hunter <jonathanh@nvidia.com>, Loc Ho <lho@apm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nancy Yuen <yuenn@google.com>,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        Patrick Venture <venture@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        P rashant Gaikwad <pgaikwad@nvidia.com>,
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
        Viresh Kumar <vireshk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210205191948.GS2789116@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210203083155.GA2329016@dell>
 <161255130506.76967.8682382463883809207@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161255130506.76967.8682382463883809207@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 05 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-02-03 00:31:55)
> > On Tue, 26 Jan 2021, Lee Jones wrote:
> > 
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > > 
> > > This is the last set.  Clock is clean after this.
> > 
> > Out of interest, what normally happens to the patches which aren't
> > picked up by individual driver Maintainers?
> > 
> 
> I have to go in and figure it out! :)

Thanks mate, much obliged.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
