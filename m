Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27F42EADF7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbhAEPKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbhAEPKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:10:53 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5815BC06179A
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 07:10:00 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id y19so73127655lfa.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 07:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hpiie2eScIu2s/uuXEyv9UhVbNMVnQLt+9qP9Zzdslg=;
        b=SNXGbPp2no06aMPooUZfjhBv2yx8ZCRuuzOVgMeXO747C//2P3yIp3cZGMWM+h340l
         7V+UCfmLDjwfv/uPVx1mloSd6IjRQf1kwRE3dEImVTGiDO8aiAAtV6zxa75B5k6rp2Wo
         tGq3SchCZJ4KkTLse10V+yp6Sv/I0aO/iLhSiiNGC2HzUq9PALGqJK9/w0g39IdstPw/
         KvWbVRujx/bbX6a7yC6bmNE5cKgbS16lH+F9vv72taKgtvHbXpSSwrGyDf1F/Vf2kT10
         eyv/DElect6IgOyBhwK989ccFDKsFR519M8b0qk58ZEBZmZ3M2Vz6DwvsI0u5dndwWYb
         ieBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hpiie2eScIu2s/uuXEyv9UhVbNMVnQLt+9qP9Zzdslg=;
        b=HILRtSB6c89y/cXvKvtqI2xFWmYuci/vkMmBfTfP2gyXQyi9WfgGKV1pEreQAFh1Ib
         V1JD4F6RfKnzGOk9HFZ42dHIISCXXnfXAjrMV0ucqKHjrvJADvgzx6EqvBHHSgS+OOIs
         0clF0LTk7grSVxxmKf0JySwd3CI4iXhiOJV/SEWP8V0WK+Uu0bct6v4SlK8z7sRazuJh
         TZqp/OFh9Sw9l1ucZnRr0IvGSXGPDaEY+34WeplQYRu4eBcGaIes1i8qDE3sKYKd1CCD
         RYTWQlyh1Vi5lrwEG3mVRKM+4X9Oxs7cfGo2EGqHa4QCc+lgYSDdafurUm27ACC5OWPW
         I/jw==
X-Gm-Message-State: AOAM531T5F9L2tmnBy61Ws6vm6F1ayX1n45JBSTIqu6omLYGOdmBYJY0
        HSZ0pcoeog5lRTeMRcVdh5omNAJ+YlQZNkw7K2iHig==
X-Google-Smtp-Source: ABdhPJyGva5zXeaOmIEQqoYoJer37k5jmHl9i/j6Dhp6JIYx4Yofcosj36VXFcf+6bmITwznEOHzyR4VGrfsU18QvDc=
X-Received: by 2002:a19:495d:: with SMTP id l29mr33226699lfj.465.1609859397331;
 Tue, 05 Jan 2021 07:09:57 -0800 (PST)
MIME-Version: 1.0
References: <X98NP6NFK1Afzrgd@manjaro>
In-Reply-To: <X98NP6NFK1Afzrgd@manjaro>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Jan 2021 16:09:46 +0100
Message-ID: <CACRpkdbLtcPY++DZv2LLkGrW=T83ByqeB+fx3Li0E=TJMYfLCA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: remove empty lines in pinctrl subsystem
To:     Zhaoyu Liu <zackary.liu.pro@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Patrice CHOTARD <patrice.chotard@st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Dec 20, 2020 at 9:37 AM Zhaoyu Liu <zackary.liu.pro@gmail.com> wrote:

> Remove all empty lines at the end of functions in pinctrl subsystem,
> and make the code neat.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Zhaoyu Liu <zackaryliu@yeah.net>

Patch applied.

Yours,
Linus Walleij
