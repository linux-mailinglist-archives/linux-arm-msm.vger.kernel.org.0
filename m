Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4799D1D86F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732054AbgERS2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:28:34 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:44046 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgERS2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:28:33 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 4C81380674;
        Mon, 18 May 2020 20:28:27 +0200 (CEST)
Date:   Mon, 18 May 2020 20:28:25 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Sandeep Panda <spanda@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for
 Hot Plug Detect
Message-ID: <20200518182825.GA862982@ravnborg.org>
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200509201511.GD30802@ravnborg.org>
 <CAD=FV=VBU7JmTdvgWjyj_ytrFmz6Gkx2OjVr1FxLh9DBG_jN6w@mail.gmail.com>
 <CAD=FV=UNuwb+YYJKw9+HNMKUNfuNFxj+Gr+yB9tXANbXAvDgCg@mail.gmail.com>
 <20200518175939.GA770425@ravnborg.org>
 <CAD=FV=XmUrF3nCZF4dDom5RrWrdVe-iJocenU3cJEDx-gGkDRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XmUrF3nCZF4dDom5RrWrdVe-iJocenU3cJEDx-gGkDRA@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
        a=hm5wBbS1sMirQhL_k6wA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Douglas,
On Mon, May 18, 2020 at 11:05:58AM -0700, Doug Anderson wrote:
> Sam,
> 
> On Mon, May 18, 2020 at 10:59 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Douglas.
> >
> > > > Given the previous feedback from Linus W, Stephen, and Laurent I
> > > > expect things are good enough to land now, but it'd be good to get
> > > > confirmation (I removed some of the previous tags just to get
> > > > confirmation).  If we can get review tags early next week maybe it'll
> > > > still be in time to land for 5.8?
> > >
> > > I think all the others have reviews now.  Is there anything blocking
> > > them from getting applied?
> > Applied, including the small fix pointed out by Linus.
> 
> Thanks!  Ugh, I just realized what the problem was.  I posted a v6
> with this fix but insanely somehow didn't CC you (!!!).  It was here:
> 
> https://lore.kernel.org/r/20200513215902.261547-1-dianders@chromium.org
> 
> I'm super sorry about that and thanks for fixing the nit.  That was
> the only difference between v5 and v6.  I just checked what you pushed
> and it looks great, thank you.
No worries as long as what hits drm-misc-next is OK, which it was in
this case.

	Sam
