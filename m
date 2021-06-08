Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0370D3A06D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 00:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbhFHWce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 18:32:34 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:45003 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFHWcb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 18:32:31 -0400
Received: by mail-oi1-f172.google.com with SMTP id a26so2466708oie.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=22Ssm6bBidoI2OKdGgKr4Z380nMp59e0xlDapEUt3rU=;
        b=WPz6kqlJJfs8tIkZz7PYSNVeHx0zT+YXabel5UgJo2BNRuHZjWdtewaiBIcyWuOWr8
         Wqj51S0ykw9kcRp8mwWWuO3vqvOBm1PbNfgQdBEEeEBZs0RyBwGeWOV86TR9Tv8ckkH2
         CKs7FUDayZghlqqy/rxwQh+r/GAEDkjkAWRIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=22Ssm6bBidoI2OKdGgKr4Z380nMp59e0xlDapEUt3rU=;
        b=q2UWHo6AP6ZaEY2O9x0w4RbM34jmPuzT8mt1jryZHnBWa/XYViA6YX32UHc5/S7Xzs
         6gsiTK5jlajfZ9EMv1nbgp05b0GH82jO7vTnmb7/Fg1ZPhk3JrOXWUl0GTpNbmV18qEX
         I0s2iLxE5BFSfU7glcXo1Ltqj8wGazuVdpbiTeMDVJDgKU14DwvaMkZnAfH0xiXnyC4Q
         SE7YHZ4k1j/FqqkbkOqOg13CAc30VrD1LepcTSo2smrlAaUMDwL0vd1bq6MTjXQY8+UL
         f1vJFS0EsyvYFsAkzgbb2kaxWH7iGRxjzZsK0YlZsrzssfRKN2GHBYDPXoHtxhsLXDaM
         NA4A==
X-Gm-Message-State: AOAM532NmrEFTcOaCmTopb7Iv2r76KkZroFLm3PG3f0AmdiS4vaKZ4cu
        UBl/gFzQBMn09cz3qot3OaxapqmGgFsVX4Ug/VCUsQ==
X-Google-Smtp-Source: ABdhPJzPevJ+f/UberY67NRwcENdBNcopJshXKUMZZDlcap5kw7JKZSRUy35YlubQZREJJ1G5PAO5O8h0e2PmmIh9jQ=
X-Received: by 2002:a54:4501:: with SMTP id l1mr4450778oil.19.1623191367772;
 Tue, 08 Jun 2021 15:29:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jun 2021 15:29:27 -0700
MIME-Version: 1.0
In-Reply-To: <YL/uj+t+BFkII1Fh@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga> <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan> <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <YL6sY/1E5wLzMiP/@yoga> <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 8 Jun 2021 15:29:27 -0700
Message-ID: <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port dt node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     khsieh@codeaurora.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org, agross@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-06-08 15:26:23)
> On Tue 08 Jun 17:15 CDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-06-07 16:31:47)
> > > On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:
> > >
> > > > Sorry about the confusion. What I meant is that even though DP controller is
> > > > in the MDSS_GDSC
> > > > power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
> > > > impact
> > > > on the CX voltage corners. Therefore, we need to mention the CX power domain
> > > > here. And, since
> > > > we can associate only one OPP table with one device, we picked the DP link
> > > > clock over other
> > > > clocks.
> > >
> > > Thank you, that's a much more useful answer.
> > >
> > > Naturally I would think it would make more sense for the PHY/PLL driver
> > > to ensure that CX is appropriately voted for then, but I think that
> > > would result in it being the clock driver performing such vote and I'm
> > > unsure how the opp table for that would look.
> > >
> > > @Stephen, what do you say?
> > >
> >
> > Wouldn't the PHY be the one that sets some vote? So it wouldn't be the
> > clk driver, and probably not from the clk ops, but instead come from the
> > phy ops via phy_enable() and phy_configure().
> >
>
> If I understand the logic correctly *_configure_dp_phy() will both
> configure the vco clock and "request" the clock framework to change the
> rate.
>
> So I presume what you're suggesting is that that would be the place to
> cast the CX corner vote?

Yes that would be a place to make the CX vote. The problem is then I
don't know where to drop the vote. Is that when the phy is disabled?
