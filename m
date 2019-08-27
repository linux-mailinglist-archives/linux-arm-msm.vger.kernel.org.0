Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E95A69EB75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 16:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfH0OtA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 10:49:00 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46780 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfH0Os7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 10:48:59 -0400
Received: by mail-lf1-f68.google.com with SMTP id n19so15400649lfe.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7a/OLOPcOZSlvhkIopmFtdKC63x8DyVHJSn0hSTbfvc=;
        b=Vvu9dxa9eI6ZfI76dLHUz1pA4uteEG1BHHaVBjsbGpNynEw+dbnfAqzFAEO8d/4Kio
         IXjYsOp9OILFBSYTsufUjXUSaSLKNgNaRiOCwcJyCU8EyF4WsJoPb9isaT/g99TR4g3z
         PZyPQBxkKEvlUP3J9qAX2v88PJ17CDPPtaZ16lPQVYqEz+ZZQIIymaTbBbizeakGMyuu
         3j3IMkDQbo5MLZfTnmlIAeYFyFhGHzoTDhI+JkmzhsobE49HzZyxWiUphXMWMHWz7GqT
         7xvFc5udxtThPKLNP3i6U5oxx7evhc97qy/Xwpd7RaGHQBon16438mSR2wa+cv04UP0c
         uxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7a/OLOPcOZSlvhkIopmFtdKC63x8DyVHJSn0hSTbfvc=;
        b=HaQXqFILZH6XpK+1+sTXDaWvrPID0wAKCux6fdBss4MMDhKOJzB7B/0lpOxRMzNcjE
         k/vlIYMYRtzUfclZIs9hx7GULq7v6Ymh2CNewZXMYC0CQXXqYtOrj6ZtJtYupJ+Db7w2
         SMWQZThkqS9am9I99izD92dUXT9s7dusFL8atVtY3b3hFSCZJk7H2JFvcV62ECkJF31+
         kavzfi109PwxDejGpPbKInPJS/S4CFgHWNBIK1IWWNx38wviia1FzfxJkLdL65gVBVK8
         otPyptS2CaJ9Yeu+CiR632SyPKvS4edvSSuqUp9rDy0Yl1Ur8NnEoxv5Sb8AFAp5sLq3
         +/Nw==
X-Gm-Message-State: APjAAAUn8CBUaTQbWAzZDF87FtA4wfs3B5XNhLYXepZdrxn0HUEgYfkp
        tikFvYr9HGo463vHRnKe7LNGjA==
X-Google-Smtp-Source: APXvYqwo0sRAJcq83xtcRLc4IE6dHUk4NS2LqFi8LcgUEzkHHh1U/k6+CGsi0LZTJCv1knSsRL7wKA==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr14294268lfm.77.1566917338150;
        Tue, 27 Aug 2019 07:48:58 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id t82sm1728876lff.58.2019.08.27.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 07:48:57 -0700 (PDT)
Date:   Tue, 27 Aug 2019 16:48:55 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
Message-ID: <20190827144855.GA17311@centauri>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
 <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
 <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
 <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com>
 <d8cf720c-b44f-f4ea-1c26-92ce34fd31e6@free.fr>
 <20190808042925.90F3721743@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808042925.90F3721743@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 07, 2019 at 09:29:24PM -0700, Stephen Boyd wrote:
> Quoting Marc Gonzalez (2019-07-03 07:00:31)
> > On 24/06/2019 15:57, Amit Kucheria wrote:
> > 
> > > On Mon, Jun 24, 2019 at 6:56 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
> > >>
> > >> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
> > >> in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
> > >> the 'default ARCH_QCOM' directive.
> > >>
> > >> Add the two options explicitly in the arm64 defconfig, to avoid
> > >> functional regressions.
> > >>
> > >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > > 
> > > Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
> > 
> > Stephen,
> > 
> > Can you take the following two patches through the clk tree?
> > 
> > [PATCH v2] clk: qcom: msm8916: Don't build by default
> > [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
> > 
> 
> Did Andy pick up this defconfig change? The subject is misleading.
> defconfig changes should be something like

Neither Andy nor Bjorn has picked this.

Could you please pick it up? (possibly with subject fixed up)

> 
> 	arm64: defconfig: Add qcom clk options
> 
> I don't think I need to pick up the defconfig change. It can go through
> Andy and arm-soc. So I'll just grab the first one and guess it won't
> break much on the way in.
> 
