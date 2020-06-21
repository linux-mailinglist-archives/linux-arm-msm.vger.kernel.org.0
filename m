Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E2F202939
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 09:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729346AbgFUHCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 03:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729374AbgFUHCm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 03:02:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0FDC061794
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 00:02:41 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d10so4182304pls.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 00:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xb0+Y9vPTMcQDkSeRLOyeGz2sjTq3LszBLNa3wwZ2Xw=;
        b=jZ+AS67ccgmGi4FrmKHcY1PNqxhnaxte2S5HSfVcT7Pfkz1P8RYqoy8TTJRwmQkLyS
         IAPUbVc0TD0ZtWjDbw/7Czq3so2zJrkqJe7c9ES6epijdMzp093PEx5f1VRcWH6fpiIS
         jZGRk8omBDEppBF+LjD1+OPxhu/6sjD9AokO9+DHzTA6AADt7sAgyXsmOrDDwvX/kCnC
         YO/KSC5dRqXfn+U+X+Xi5tJ1lJrGijxAwWMZEJkkKZBhEyLxI/y+/NDpbjK2LhLTFX0H
         K2wVd+cZFz8Lb7PR5TOcoZOYVLALah4Xj1oQTjnwOsFRIEP13a80H91QHaHfxfAFvQfX
         0vaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xb0+Y9vPTMcQDkSeRLOyeGz2sjTq3LszBLNa3wwZ2Xw=;
        b=gZ2SR5/Y7Tv8fPASlPr90LbwLI5Z/fyZL7eeBNmnDs/xqrgdGXeEKP5aH8wBoWPJlu
         QSielxdgxb3LOb9k9TFOv1G4un7PouDYER8onNJMP6TtdYBFk6JGjfKyfEnABE22ZPcu
         MQ/qu3pM5ESN6BSDpGMmAFv3f2wacsbHy/2ZZumeGRLh656xwl4pox8JAGjfbOCvX0UI
         DzpjVquMUV1JvCrpgWTl48VArp8TGADyWn0fROF1pVZYvH8pcdzMQF5jWJuZPQodUF72
         hbEy7OX/UC7WDjf4CnwRZE5o/g5WlL2IzXbaSGZQUmcY3kJVfby9Eh3OTow8/VMU8b8T
         bKrQ==
X-Gm-Message-State: AOAM532SF6pesUtz4Uzihwc/UUo0/dzNiKE1W9gB4fKNl3GY1enAz4Dz
        +dGo70lHX3kmKiguGsc8fjD7dA==
X-Google-Smtp-Source: ABdhPJwhAxNCfYKm7nQ0HvekdSEgQ5WgWWGYkMjG5eGC74+taPARCNb3JZY0EPMgnZ8gxGDrBZgEuA==
X-Received: by 2002:a17:90a:1546:: with SMTP id y6mr12546523pja.92.1592722960975;
        Sun, 21 Jun 2020 00:02:40 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 4sm10250231pfn.205.2020.06.21.00.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 00:02:40 -0700 (PDT)
Date:   Sat, 20 Jun 2020 23:59:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: Add CPU clock driver for msm8996
Message-ID: <20200621065953.GB128451@builder.lan>
References: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org>
 <1591266927-24976-3-git-send-email-loic.poulain@linaro.org>
 <159261287558.62212.16649006403982628548@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159261287558.62212.16649006403982628548@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 19 Jun 17:27 PDT 2020, Stephen Boyd wrote:

> Quoting Loic Poulain (2020-06-04 03:35:25)
> > Each of the CPU clusters (Power and Perf) on msm8996 are
> > clocked via 2 PLLs, a primary and alternate. There are also
> > 2 Mux'es, a primary and secondary all connected together
> > as shown below
> > 
> >                              +-------+
> >               XO             |       |
> >           +------------------>0      |
> >                              |       |
> >                    PLL/2     | SMUX  +----+
> >                      +------->1      |    |
> >                      |       |       |    |
> >                      |       +-------+    |    +-------+
> >                      |                    +---->0      |
> >                      |                         |       |
> > +---------------+    |             +----------->1      | CPU clk
> > |Primary PLL    +----+ PLL_EARLY   |           |       +------>
> > |               +------+-----------+    +------>2 PMUX |
> > +---------------+      |                |      |       |
> >                        |   +------+     |   +-->3      |
> >                        +--^+  ACD +-----+   |  +-------+
> > +---------------+          +------+         |
> > |Alt PLL        |                           |
> > |               +---------------------------+
> > +---------------+         PLL_EARLY
> > 
> > The primary PLL is what drives the CPU clk, except for times
> > when we are reprogramming the PLL itself (for rate changes) when
> > we temporarily switch to an alternate PLL. A subsequent patch adds
> > support to switch between primary and alternate PLL during rate
> > changes.
> > 
> > The primary PLL operates on a single VCO range, between 600MHz
> > and 3GHz. However the CPUs do support OPPs with frequencies
> > between 300MHz and 600MHz. In order to support running the CPUs
> > at those frequencies we end up having to lock the PLL at twice
> > the rate and drive the CPU clk via the PLL/2 output and SMUX.
> > 
> > So for frequencies above 600MHz we follow the following path
> >  Primary PLL --> PLL_EARLY --> PMUX(1) --> CPU clk
> > and for frequencies between 300MHz and 600MHz we follow
> >  Primary PLL --> PLL/2 --> SMUX(1) --> PMUX(0) --> CPU clk
> > 
> > ACD stands for Adaptive Clock Distribution and is used to
> > detect voltage droops.
> > 
> > Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
> > Co-developed-by: Ilia Lin <ilialin@codeaurora.org>
> 
> Co-developed-by should be combined with Signed-off-by tags.
> 
> From Documentation/process/submitting-patches.rst
> 
> "Co-developed-by: states that the patch was co-created by multiple developers;
> it is a used to give attribution to co-authors (in addition to the author
> attributed by the From: tag) when several people work on a single patch.  Since
> Co-developed-by: denotes authorship, every Co-developed-by: must be immediately
> followed by a Signed-off-by: of the associated co-author."  
> 

...which is not what happened here.

By using Co-developed-by and a Signed-off-by one would state that
Rajendra certifies the origin of any additions done by Ilia and Loic.


Instead, Rajendra certified the origin of the original patch
(presumably) per 11.a by his s-o-b, then Ilia took the patch in whole or
part and certified that he can contribute it per 11.a or 11.c with his
s-o-b, then finally Loic should do the same, by adding his s-o-b.

As such we should see three Signed-off-by here, preferably with [name:
changelog] entries inbetween to document any modifications done to the
patch.

Regards,
Bjorn

> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/clk/qcom/Kconfig         |   8 +
> >  drivers/clk/qcom/Makefile        |   1 +
> >  drivers/clk/qcom/clk-alpha-pll.h |   6 +
> >  drivers/clk/qcom/clk-cpu-8996.c  | 538 +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 553 insertions(+)
> >  create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
> > 
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index abb121f..87b515d 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -37,6 +37,14 @@ config QCOM_CLK_APCS_MSM8916
> >           Say Y if you want to support CPU frequency scaling on devices
> >           such as msm8916.
> >  
> > +config QCOM_CLK_APCC_MSM8996
> > +       tristate "MSM8996 CPU Clock Controller"
> > +       select QCOM_KRYO_L2_ACCESSORS
> 
> This needs to depend on ARM || ARM64 because it uses the kryo accessors which
> are architecture specific instructions.
> 
> > +       help
> > +         Support for the CPU clock controller on msm8996 devices.
> > +         Say Y if you want to support CPU clock scaling using CPUfreq
> > +         drivers for dyanmic power management.
> > +
> >  config QCOM_CLK_RPM
> >         tristate "RPM based Clock Controller"
> >         depends on MFD_QCOM_RPM
