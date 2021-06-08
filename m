Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16F03A0793
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 01:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbhFHXMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 19:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234935AbhFHXMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 19:12:21 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19511C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 16:10:18 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id k10-20020a4abd8a0000b0290249ed2f2919so1687932oop.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8Fd2UnKqRp3r57f4CDJXwSiaZtMqRHFyBh9cIrJCLHc=;
        b=YVQxIh4DVDYDVOSMez79iluTdib8wNEGnSurhGWV5Sx1Yt2DoKdkChJeEswUoeSsGw
         0K00d68k/hSD0WCstFm065QnDK9rywsVn9kQw/4Kj0jMQJu8ZRDpHZMz4K4FPQnn10E4
         N08rvCo6ABfBzZhrVuzfRfm3qkKNuPPRPLa+kZFaYoNlgWkvp3nUvMsE0CxBchjX/GIB
         vXnYe965oMdOEKaqGviedRqmdY0N1l8CECcUioeXQ7O3Itu5he0GWhI7CLxMzbVsPVmj
         r+K+/JevqaG+yMYcwmhqA6BJ63t8i+MsqNQnyxgtKgYLrEkMPPCpydxSpF+pD3aDS0MU
         UgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Fd2UnKqRp3r57f4CDJXwSiaZtMqRHFyBh9cIrJCLHc=;
        b=K+u7b+4xt0CYlpFR4FDxMGFYUKCGd4bwFfMYOhw2/4LmFnx3bkSM2ymexOGlNkEnSQ
         +F5FDB2y75Uxtqb1g17lwZGfczrP+tHTwSEBpVTggUywfFpeEzqbPZxukPJpB3UeH5/5
         zVVbLCSytXmVyQU2j0t2RTn0Y9m2uaTRSLpYcgSLCapfV8tLHkCqi3E2yB0oSKHnlLec
         xzbu5JNHGhguPp4WTRBrx8eCsxFVBsqZXbd034tyGukM62UcNfQOrfTcYsj8O0LjwJ/s
         WLj4HKOQ3XzyF6LvEr6Fg4opzd7UxVnfXZKOstbCRrEQYFS9ogy2UkoMy8jPWgzKX60G
         dVUQ==
X-Gm-Message-State: AOAM532e/0t8r95k7qUAH33SiR59D3HWRsdsCLCjzzyhFq5T9TgMWSEN
        P3ysXz8w+Ceqf1UZdbvtQPOPpg==
X-Google-Smtp-Source: ABdhPJycM7QJ6UxCAKDNC7FB+QTjxDFiYOAHom/UYvJgDGXNLHmf6SoUQFIeescv/3vi8398Xn3oHg==
X-Received: by 2002:a4a:b789:: with SMTP id a9mr19171527oop.45.1623193817402;
        Tue, 08 Jun 2021 16:10:17 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c205sm3092501oob.38.2021.06.08.16.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 16:10:16 -0700 (PDT)
Date:   Tue, 8 Jun 2021 18:10:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     khsieh@codeaurora.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org, agross@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port dt node
Message-ID: <YL/41hWz8xB+jSeO@yoga>
References: <YLkI/6ItCz+SbbuJ@yoga>
 <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
 <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <YL6sY/1E5wLzMiP/@yoga>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
 <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga>
 <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Jun 17:44 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-06-08 15:34:01)
> > On Tue 08 Jun 17:29 CDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Bjorn Andersson (2021-06-08 15:26:23)
> > > > On Tue 08 Jun 17:15 CDT 2021, Stephen Boyd wrote:
> > > >
> > > > > Quoting Bjorn Andersson (2021-06-07 16:31:47)
> > > > > > On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:
> > > > > >
> > > > > > > Sorry about the confusion. What I meant is that even though DP controller is
> > > > > > > in the MDSS_GDSC
> > > > > > > power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
> > > > > > > impact
> > > > > > > on the CX voltage corners. Therefore, we need to mention the CX power domain
> > > > > > > here. And, since
> > > > > > > we can associate only one OPP table with one device, we picked the DP link
> > > > > > > clock over other
> > > > > > > clocks.
> > > > > >
> > > > > > Thank you, that's a much more useful answer.
> > > > > >
> > > > > > Naturally I would think it would make more sense for the PHY/PLL driver
> > > > > > to ensure that CX is appropriately voted for then, but I think that
> > > > > > would result in it being the clock driver performing such vote and I'm
> > > > > > unsure how the opp table for that would look.
> > > > > >
> > > > > > @Stephen, what do you say?
> > > > > >
> > > > >
> > > > > Wouldn't the PHY be the one that sets some vote? So it wouldn't be the
> > > > > clk driver, and probably not from the clk ops, but instead come from the
> > > > > phy ops via phy_enable() and phy_configure().
> > > > >
> > > >
> > > > If I understand the logic correctly *_configure_dp_phy() will both
> > > > configure the vco clock and "request" the clock framework to change the
> > > > rate.
> > > >
> > > > So I presume what you're suggesting is that that would be the place to
> > > > cast the CX corner vote?
> > >
> > > Yes that would be a place to make the CX vote. The problem is then I
> > > don't know where to drop the vote. Is that when the phy is disabled?
> >
> > We do pass qcom_qmp_phy_power_off() and power down the DP part as DP
> > output is being disabled. So that sounds like a reasonable place to drop
> > the vote for the lowest performance state.
> >
> 
> So then will the corner vote be in place when the PHY isn't actually
> powered up? That will be bad for power. The phy configure code will need
> to know if the phy is enabled and then only put in the vote when the phy
> is enabled, otherwise wait for enable to make the corner vote.
> 

If we vote for a corner based on the link rate in *_configure_dp_phy()
and put the vote for lowest corner we'd get the corner part sorted out
afaict.

We'd still have to make sure that the PHY doesn't hang on to the cx vote
beyond that though - and implicitly in the non-DP cases...

> Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
> digital logic. Probably the PLL is the hardware that has some minimum CX
> requirement, and that flows down into the various display clks like the
> link clk that actually clock the DP controller hardware. The mdss_gdsc
> probably gates CX for the display subsystem (mdss) so if we had proper
> corner aggregation logic we could indicate that mdss_gdsc is a child of
> the CX domain and then make requests from the DP driver for particular
> link frequencies on the mdss_gdsc and then have that bubble up to CX
> appropriately. I don't think any of that sort of code is in place
> though, right?

I haven't checked sc7180, but I'm guessing that it's following the other
modern platforms, where all the MDSS related pieces (including e.g.
dispcc) lives in the MMCX domain, which is separate from CX.

So the parent of MDSS_GDSC should be MMCX, while Kuogee's answer (and
the dp-opp-table) tells us that the PLL lives in the CX domain.


PS. While this goes for the QMPs the DSI and eDP/DP PHYs (and PLLs)
seems to live in MMCX.

Regards,
Bjorn
