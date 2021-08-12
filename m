Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3D93EAB82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 22:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbhHLUIy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 16:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhHLUIw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 16:08:52 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B9BC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 13:08:26 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id w6so3392493ill.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1bGQrduUL+m7VKRi0v0z85Q4dsnPpu6fOOpwbY1ffcA=;
        b=VkYCJom5pQdEVeQHfD3XlI4ousGOTHyxeSAvOpfTqiA6czSNTcbk54qIadf6AzTflf
         tuEyhtjXasOIcoOn/irN1qhAoj5mL8+7JP3Rmt1aqlq9OrRyvlUJ/JFa2Yo1lYJkNVUW
         aiVQWCBmqdke9ohe/yMCVhVBFLWk1Eag9+qWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bGQrduUL+m7VKRi0v0z85Q4dsnPpu6fOOpwbY1ffcA=;
        b=omRKMRdyTN0p4QzbMjljNJmzwrk6JIyJKl/3xaKBp8iFZW4bl39ij2U2jYKHt6S/AX
         FS2Pu5q6KHxsQKRtrN0auwWhxVjcryJzjCv9wpHwKBHUm89IXksZpmMBsNxSK22k2p/t
         jRt1LucU5o3yL3aQNfwgeMWLzy7prLODZwHhxqxU/R3i/0yoWHHY7nS/4VNrznjbm2Sf
         Cl1MEPMyxecc5mpkIhsjcKY65reMJkg+gLMnNFi2zcF7gXz97Vlp51QlE32/fE4qp468
         ymQBBIHRiQ1n75zvWjRNplKf4ErA4g8MlnRb+x2wJGkjfTVwiJrwIBdPxlSZMyoztJBT
         JwBw==
X-Gm-Message-State: AOAM5339/59viLTQFF4+iqrOEF4KXsVHfrWl5G7ACqt1TaSKSFG1Nvcm
        kXzsF4nVz02r5Qg8knhW7KsHMQij2O87XQ==
X-Google-Smtp-Source: ABdhPJwkWrxeZL9AM+4oUpH6iBH5xKgW/JAq5VEocZRDarNUd4vzN6Dc8HqUEhZQ9giEbXHm6VDYng==
X-Received: by 2002:a05:6e02:1d0b:: with SMTP id i11mr242389ila.252.1628798905581;
        Thu, 12 Aug 2021 13:08:25 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id c1sm2135675ilm.62.2021.08.12.13.08.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 13:08:25 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id i4so8378834ila.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 13:08:24 -0700 (PDT)
X-Received: by 2002:a05:6e02:d49:: with SMTP id h9mr223667ilj.229.1628798904325;
 Thu, 12 Aug 2021 13:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com> <20210811235253.924867-5-robdclark@gmail.com>
 <YRV10ew/Lr8GPzEv@pendragon.ideasonboard.com>
In-Reply-To: <YRV10ew/Lr8GPzEv@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Aug 2021 13:08:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com>
Message-ID: <CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Laurent,

On Thu, Aug 12, 2021 at 12:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Wed, Aug 11, 2021 at 04:52:50PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Slightly awkward to fish out the display_info when we aren't creating
> > own connector.  But I don't see an obvious better way.
>
> We need a bit more than this, to support the NO_CONNECTOR case, the
> bridge has to implement a few extra operations, and set the bridge .ops
> field. I've submitted two patches to do so a while ago:
>
> - [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge connector operations ([1])

Rob asked me about this over IRC, so if he left it out and it's needed
then it's my fault. However, I don't believe it's needed until your
series making this bridge chip support full DP. For the the eDP case
the bridge chip driver in ToT no longer queries the EDID itself. It
simply provides an AUX bus to the panel driver and the panel driver
queries the EDID. I think that means we don't need to add
DRM_BRIDGE_OP_EDID, right?

I was also wondering if in the full DP case we should actually model
the physical DP jack as a drm_bridge and have it work the same way. It
would get probed via the DP AUX bus just like a panel. I seem to
remember Stephen Boyd was talking about modeling the DP connector as a
drm_bridge because it would allow us to handle the fact that some TCPC
chips could only support HBR2 whereas others could support HBR3. Maybe
it would end up being a fairly elegant solution?

> - [RFC PATCH 09/11] drm/bridge: ti-sn65dsi86: Make connector creation optional ([2])
>
> The second patch is similar to the first half of this patch, but misses
> the cleanup code. I'll try to rebase this and resubmit, but it may take
> a bit of time.

Whoops! You're right that Rob's patch won't work at all because we'll
just hit the "Fix bridge driver to make connector optional!" case. I
should have noticed that. :(

-Doug
