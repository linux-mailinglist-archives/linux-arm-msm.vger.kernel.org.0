Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD83912AF61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 23:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfLZWmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 17:42:12 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39965 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbfLZWmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 17:42:12 -0500
Received: by mail-pg1-f196.google.com with SMTP id k25so13509678pgt.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 14:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=id6gZntwEodgGYB59zQkWhTpj797ws8bHZpOKaKwYJ8=;
        b=PqY30As1HVeTsX24x5Wj6WCdolUj9fYeWJEBcnm/4JCPDvmyvH9x1QTfXP2eGTVZQ1
         SgT5ceOX/76pPplSxkAm83FKnrlB0KO9vDgkjmRMxA7AGFm6y0hlQYFai34ljisdikcR
         OfO/U/usnsywyWLeTs4/d3vweZC8vywjC+KC07FSb50e33UhRcnWi3qM2vICFfDnw71q
         kRlSgrhcyP9Z76tdaFIfxXq1GMQKOdBoz+1W6xSjpL+p3m1/TaKMZIhESojfWOV7uYd7
         rnPRwsLoA53FXbRj0og5CCL7AQpw4wM9LINfJULA7095mS9a2b2CU+AvGFQaoXOpFLWm
         IxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=id6gZntwEodgGYB59zQkWhTpj797ws8bHZpOKaKwYJ8=;
        b=QbbvbtfJSB3swuUEI0uBI5u3rlnVVvqx998AGc9jxs9xSUn40phYwD8K7kFKdqXWZj
         OXpdI41lOS0ZVCo+P/HKRQAzZaQv9d8o0T+CBSyq+U9iutvZaq1s/wRT47A45YwPsCNS
         LIoFPyix7S2az4mIGTyP8l+GVQExUg5nFByT2sQoaON+Xt2g3jVf50RCKtyFZysMXlWg
         SwE5LKqOnjKJ3wgJQ/PerGPKFgC02p9x82IbaXlh/6e4XOhH7GL6QwEy2/T4buVunoGH
         nRSSLGWlhP9oGbgvpyCV8Dd9lIQsYWOOtyQ10/dws+jZgg8uegkl/+oarqQiM75UxJlp
         r88A==
X-Gm-Message-State: APjAAAWgRlk9Blvuq5uQjw3oCY2Gw6Rhp9Rz4vmpkPad7sRJm88rAK+4
        8bwkoytjMLGq93HCPh7xKUSGBg==
X-Google-Smtp-Source: APXvYqxSDVbs2vOYOg9yW7JRrsiG0gRtxLuW9Zc6TrdhfBj3WsbSXbIYpDKPF1Q7zUKCs+ontwnuvg==
X-Received: by 2002:a63:6c09:: with SMTP id h9mr50054003pgc.34.1577400131224;
        Thu, 26 Dec 2019 14:42:11 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id bo19sm11591246pjb.25.2019.12.26.14.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 14:42:10 -0800 (PST)
Date:   Thu, 26 Dec 2019 14:41:56 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
Message-ID: <20191226224156.GE1908628@ripper>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
 <20191207203603.2314424-2-bjorn.andersson@linaro.org>
 <20191219063719.5AF942146E@mail.kernel.org>
 <20191220023427.GL448416@yoga>
 <20191224022042.7DDB120709@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224022042.7DDB120709@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 23 Dec 18:20 PST 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-12-19 18:34:27)
> > On Wed 18 Dec 22:37 PST 2019, Stephen Boyd wrote:
> > 
> > > Quoting Bjorn Andersson (2019-12-07 12:36:02)
> > > > The CLKREF clocks are all fed by the clock signal on the CXO2 pad on the
> > > > SoC. Update the definition of these clocks to allow this to be wired up
> > > > to the appropriate clock source.
> > > > 
> > > > Retain "xo" as the global named parent to make the change a nop in the
> > > > event that DT doesn't carry the necessary clocks definition.
> > > 
> > > Something seems wrong still.
> > > 
> > > I wonder if we need to add the XO "active only" clk to the rpm clk
> > > driver(s) and mark it as CLK_IS_CRITICAL. In theory that is really the
> > > truth for most of the SoCs out there because it's the only crystal that
> > > needs to be on all the time when the CPU is active. The "normal" XO clk
> > > will then be on all the time unless deep idle is entered and nobody has
> > > turned that on via some clk_prepare() call. That's because we root all
> > > other clks through the "normal" XO clk that will be on in deep
> > > idle/suspend if someone needs it to be.
> > > 
> > 
> > The patch doesn't attempt to address the fact that our representation of
> > XO is incomplete, only the fact that CXO2 isn't properly described.
> > 
> > Looking at the clock distribution, we do have RPM_SMD_BB_CLK1_A which
> > presumably is the clock you're referring to here - i.e. the clock
> > resource connected to CXO.
> 
> I don't mean the buffer clks, but the XO resource specifically. It's the
> representation to the RPM that deep sleep/deep idle should or shouldn't
> turn off XO and achieve "XO shutdown". Basically it can never be off
> when the CPU is active because then the CPU itself wouldn't be clocked,
> but when the CPU isn't active we may want to turn it off if nothing is
> using it during sleep to clock some sort of wakeup logic or device that
> is active when the CPU is idle.
> 

I see. So we're missing the representation of the "raw" CXO in
clk-smd-rpm.c, and I'm lacking some understanding of how these pieces
should be tied together for us to realize the "XO shutdown"...

> > 
> > > Did the downstream code explicitly enable this ln_bb_clk in the phy
> > > drivers? I think it may have?
> > > 
> > 
> > Yes, afaict all downstream drivers consuming a CLKREF also consumes
> > LN_BB and ensures that this is enabled. So we've been relying on UFS to
> > either not have probed yet or that UFS probed successfully for PCIe and
> > USB to be functional.
> > 
> > So either we need this patch to ensure that the requests propagates
> > down, or I need to patch up the PHY drivers to ensure that they also
> > vote for the PMIC clock - and I do prefer this patch.
> 
> Cool. Yeah seems better to just indicate that the reference clks are
> clocked by something else and fix that problem now.
> 

Let me know if I shouldn't interpret this sentence as "let's merge this
for now".

Regards,
Bjorn
