Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF5F30D540
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 09:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhBCIcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 03:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbhBCIcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 03:32:41 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A817C061786
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 00:32:00 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q7so23126008wre.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 00:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=apdTNF0/dDjo33JlirY30dcPy0Mdluii8JVXQCZ3crc=;
        b=syr1cgUVeq439dK2HvZMZmbfC0UuGaMMCA60P47g+FK8dOmODlRmxxVaAUDY8MYNpr
         oDyV97fWiHkRG9DoaUDEiS2vjDh/KEvDgjdfqv/UQvT/PQwBXmMM9bQ9TIemNZtPxwpw
         ie2B+QeaibDHT0kHWFx4wGlZJtlMIgMt9V8XFesnpXrp0pCktbzGUCzB0Nq3iVZL8Mwn
         7VsbFHLub8C16FyatrIkBGNTGkmQybZphlYdJRvQ80x1eA8vfyW2xELf3aIc6AW1MCpw
         cCgk0ZcwNzyvBKV3S3FdZbrmWMrI9KftrGniHiIQ1/9OoeZE4DimhVc3mF3m8YYgoiZ8
         1bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=apdTNF0/dDjo33JlirY30dcPy0Mdluii8JVXQCZ3crc=;
        b=RPM0ordEex1jarerE1CUvLSp0nTdNmz4Y623MM5uuSgtieBqqTSIukHGDZdg7EAD4K
         bTJXeSmZGI9rE9UMx57E/U4qMAHkDMnwT6Czj00TEDd2bcEBNmDA4AzibWHiubOVPyqa
         IjVKe3Ag+i87eFr1I92YX1KjSFFlpBeZSJEOAZF9dMKDwKSe1QIBT12uziP0mHvmBjVP
         NmssO2E2kYYMnDMNBO5dIBIbMWz2lDumSPIeMZx+N60xhbJaNXpDwOWO0vfMQHJkWlis
         eSl6eZfxhxNLOSQgCUa4kLLVKHUJ0fjDmEULN5H/xRUCCZdVUPCb7Xz4LabYq6Pnejx1
         94PQ==
X-Gm-Message-State: AOAM531NjTbQ0narRxCVJNIs82h9OzTWL9EIeDRlYNkrYAIBnlij6xYK
        7HXZgDJAFMZXpC1ljjnR8Idx1160sDMMgcgT
X-Google-Smtp-Source: ABdhPJzYVcDMbwFXa6BCs9Ojta/M4taYxxIoBb83B8dxZ0oM1QClmWS0uM8CMmL56lRXDZcoUBVp9A==
X-Received: by 2002:a5d:4528:: with SMTP id j8mr2190089wra.352.1612341118982;
        Wed, 03 Feb 2021 00:31:58 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id s23sm1646538wmc.35.2021.02.03.00.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 00:31:58 -0800 (PST)
Date:   Wed, 3 Feb 2021 08:31:55 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-kernel@vger.kernel.org,
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
        Stephen Boyd <sboyd@kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Tero Kristo <kristo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210203083155.GA2329016@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Jan 2021, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> This is the last set.  Clock is clean after this.

Out of interest, what normally happens to the patches which aren't
picked up by individual driver Maintainers?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
