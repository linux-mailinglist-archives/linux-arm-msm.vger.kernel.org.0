Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321E525AD5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 16:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgIBOid (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 10:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbgIBOiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 10:38:02 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F03C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 07:38:01 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id b123so2656458vsd.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TadnzZ2GBx4yX2HwMOimGbeZb2PcWtu+wm80cNcN0fQ=;
        b=Gi2e6zQsylDEwMGGD9uEtv0/zSfm3ttGeUD8jtFwieUhWNz0g3Vc3c3/fWdq3Jxcl+
         wc5w1QXNLwWb/D+NAQUk301/Aa9k7cL/XXJBR3Zfjxg9R0zUvZFColuIyLnXOKEftlar
         w/s11uKYBxNLykoVFCzrHIFXavzYRCaiEFZt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TadnzZ2GBx4yX2HwMOimGbeZb2PcWtu+wm80cNcN0fQ=;
        b=dZFwmIfwxNAwJRUhdxDUI9D7lBBOETZqgRe2h9fpzR40ktdMo/ATd3OJM6RQvnIYGd
         SCmPXra6xOPkN5RDmCjvbBjG1aIrPCK5ol/Cr2PriCa8ODJFKikqeITat7Koo1BrJo61
         SXcc1PbrPhEo3hLp6L4xtagyyfZWDJxSf3V3v044zxIMLmi3YOJuwlHdPktMkONCK8ol
         uuSHdQ1E1V4IEj/2x04w4rTaIlzb0AjRwKBh31A8elLIN+st3AEN0Y+cQntb7upvC96N
         YYroVj9WPY/Po1ejb0dK9L8N4SUJA+GL4GBg6BY9EgeSHdUydlx//5u1z8tScTXuNeU8
         SCog==
X-Gm-Message-State: AOAM533xYWVFNmyZGETLMKMBy73jjZd8U7B9BDDqptIsswmcKvvJqjnS
        dSvmxIuNO1cGWIg6EEuzOAgnnl0AoBQ5Mw==
X-Google-Smtp-Source: ABdhPJxXhDmR9evHrjUjFMDDCkviidXqQK34Pc/ocU/rlRU5Cxfd+uoQjYb+WOrFvA+v0P6jOClzsw==
X-Received: by 2002:a05:6102:3133:: with SMTP id f19mr5349422vsh.107.1599057480032;
        Wed, 02 Sep 2020 07:38:00 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id j21sm795157vkn.26.2020.09.02.07.37.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 07:37:58 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id v24so1635772uaj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 07:37:58 -0700 (PDT)
X-Received: by 2002:ab0:37d3:: with SMTP id e19mr5065664uav.64.1599057477726;
 Wed, 02 Sep 2020 07:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org> <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
 <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
 <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org> <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
 <bc795659-7dd6-c667-1c93-4331510ecfbc@kali.org> <CAD=FV=VC+RP8WfS-yuc65WRN2KokNbAs-F3UdQtQoZjcMMSNFA@mail.gmail.com>
 <f81f0d22-85d6-66eb-c8d9-345757f53959@kali.org> <CAD=FV=WB_4xLe9UZX3eVemybQ1neXJVZgzrDCW-xUxbAM6hCTA@mail.gmail.com>
 <8e306b6d-246d-aa7f-cb24-923e13afcd04@kali.org> <CAD=FV=XeBLRc4v5K3vj=m9PGMuW8GVUq110ApX6xS2QaiJd=pw@mail.gmail.com>
In-Reply-To: <CAD=FV=XeBLRc4v5K3vj=m9PGMuW8GVUq110ApX6xS2QaiJd=pw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Sep 2020 07:37:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W60u2Ck6NP_k8+V1oWY7FRXs4G3e49Lp+h7Zii14nVQA@mail.gmail.com>
Message-ID: <CAD=FV=W60u2Ck6NP_k8+V1oWY7FRXs4G3e49Lp+h7Zii14nVQA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Steev Klimaszewski <steev@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 14, 2020 at 8:31 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > Hopefully BOE gets back to you soon, and there's no rush, I'm just an
> > end user who is extremely appreciative of all the work everyone on the
> > list and the kernel in general put in to make my machines usable.
>
> Just FYI that I got confirmation that the panel is truly 6 bpp but it
> will do FRC dithering if given an 8 bpp input.  That means that you
> should be getting just as good picture quality (and possibly more
> tunable) by using the dithering in the display pipeline and leaving
> the panel as 6bpp.  Thus I'm going to assume that's the route we'll go
> down.  If ever we find someone that wants to use this panel on a
> display controller that can't do its own dithering then I guess we'll
> have to figure out what to do then...
>
> In terms of the more optimal pixel clock for saving power, my proposal
> is still being analyzed and I'll report back when I hear more.  I'm
> seeing if BOE can confirm that my proposal will work both for my panel
> (the -n62 variant) and the one you have (the -n61 variant).

To close the loop here: we finally got back an official word that we
shouldn't use my proposed timings that would have allowed us to move
down to a 1.62 GHz pixel clock.  Though they work most of the time,
there are apparently some corner cases where they cause problems /
flickering.  :(  While you could certainly use the timings on your own
system if they happen to work for you, I don't think it'd be a good
idea to switch the default over to them or anything.  I'm told that
hardware makers will take this type of thing into consideration for
future hardware.

-Doug
