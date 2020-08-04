Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F22223BA1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 14:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgHDMLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 08:11:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:44392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbgHDMLC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 08:11:02 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E70462177B;
        Tue,  4 Aug 2020 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596542990;
        bh=gey3esvl8wxAFJQ2OBCATSygwLbCiyTXxmuo4omuQjo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZZOJqEZ7ULpCVvpaR+mEa6S1b07HmtrWcayO6oiJVvACUiM9YU99kR+7yCx509uj+
         PqVDfLqST8/x5f9kYzlfz0llp8qz2n58fvd10CVoYrBGEspn96gmX4MXk1wNHuwGG3
         oWqka7+RyZxNSFDocwiL3Av/TJINQWNRcXQbUhdc=
Date:   Tue, 4 Aug 2020 17:39:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        martin.botka1@gmail.com, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 4/9] drm/msm/dsi: Add phy configuration for SDM630/636/660
Message-ID: <20200804120946.GQ12965@vkoul-mobl>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-5-konradybcio@gmail.com>
 <20200803110016.GL12965@vkoul-mobl>
 <CAF6AEGtW29BtJPq1xDEtvtkPHFVWEd_QJk5FpJEQPbmofnS64Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtW29BtJPq1xDEtvtkPHFVWEd_QJk5FpJEQPbmofnS64Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-08-20, 09:06, Rob Clark wrote:
> On Mon, Aug 3, 2020 at 4:00 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 26-07-20, 13:12, Konrad Dybcio wrote:
> > > These SoCs make use of the 14nm phy, but at different
> > > addresses than other 14nm units.
> > >
> > > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > > ---
> > >  .../devicetree/bindings/display/msm/dsi.txt    |  1 +
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 18 ++++++++++++++++++
> >
> > Is there a reason why dsi phy needs to be here and not in phy subsystem
> > drivers/phy/ ?
> 
> *maybe* it would be possible to split out all of the dsi (and hdmi)
> phy to drivers/phy.  But splitting out just the new ones wouldn't be
> practical (it would duplicate a lot of code, and make the rest of the
> dsi code have to deal with both cases).  And unlike dp/usb-c I'm not
> really sure I see an advantage to justify the churn.

So the question would be if it helps in reuse if we do that and does it
result in a better solution than dsi code managing the phy. The
advantage of framework (like phy) is that different subsystems can use
a (phy) driver and common framework helps reduce duplicates.

Yes sure the question was not for a new phy but about the whole
msm/dsi/phy code and future for it.

-- 
~Vinod
