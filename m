Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722BF1C64F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 02:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgEFATG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 20:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgEFATD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 20:19:03 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF22C061A10
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 17:19:03 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id z1so28521vsn.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 17:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uxf7PIfuQA1AmzwbgiAc6qi52bK5LTEy5mM67o299pg=;
        b=YP9DojNnvL0GKT59bxFJk7GMLrsEk2LCd5aowl6qLFcQdpPAxIs6zTVGg2i6fYhDJz
         dyvRxqWVH9vP7aAeBY2R+7ovwrMKFqgr+zf5hfdg2ome+cQL9T+tX2oEiMp15mZ3FxB7
         qL0Sg3ZHqsoiZp8InrBjMlJzG2kBeeYmEkBsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uxf7PIfuQA1AmzwbgiAc6qi52bK5LTEy5mM67o299pg=;
        b=KxZORL4jCHepow90rl0RRday4lFB+teZlMgtGkuW4WyeIJ40kpwo8otb7dwLGTtqi4
         bkmuLYwNcCxV2Ds3cci+E5dyKEhlX8SN9FhjCzYByah0/Jm2CNUq4pj/Ob+33TqN8u0a
         bnSk3Vs7EL+nRx8gCvuQhLTsL/QjIHLRCJ/r2QOok9s5xTxTPQed3joqy/0Q4V1eXutL
         m0LaBru6N7SPXiWkVp9JfWSfV5X2ZbxCRIps6+xuEudKaLTF8P3umptnvJzoGYd4yO8f
         GpXS+g/+4LSeIbd/i+3PxO+uNn2TQhqZa7Mwvy/DlkBbOabcC9MmOymw/TVnm/wlg5wX
         59jQ==
X-Gm-Message-State: AGi0PuaZdsd0dOJ/SK1vTCMVod8Gtid1RVJfj7sqkroUnNaqsnZi+p5j
        XoXNtTwu1aaq9nRey1RLZG5oLiwZFwA=
X-Google-Smtp-Source: APiQypJELeZ8X2CZJCUgqrefhltCKaGs1I0+T2ck0ju2RL5ofjsbFjMNqvYIZrv+jzBYzgkwNFqstw==
X-Received: by 2002:a67:ec8e:: with SMTP id h14mr5533298vsp.5.1588724342017;
        Tue, 05 May 2020 17:19:02 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id l9sm30158vsr.21.2020.05.05.17.19.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 17:19:00 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id s11so8641vsm.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 17:19:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4d:: with SMTP id k13mr5406597vsp.198.1588724340078;
 Tue, 05 May 2020 17:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200505082436.GD9658@pendragon.ideasonboard.com> <CAD=FV=WjUpwu5204K8yHzqsJv4vQX5S5CArH1Kj_kqjhZzTc9A@mail.gmail.com>
 <20200505210609.GA6094@pendragon.ideasonboard.com> <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
 <20200505211401.GC6094@pendragon.ideasonboard.com> <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
In-Reply-To: <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 May 2020 17:18:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U8_Krob9oftJjzrYs1zrbLr9WZ-HSStv5_rbq9MpTChw@mail.gmail.com>
Message-ID: <CAD=FV=U8_Krob9oftJjzrYs1zrbLr9WZ-HSStv5_rbq9MpTChw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 5, 2020 at 2:24 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, May 5, 2020 at 2:14 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > > I'll add this documentation into the comments of the yaml, but I'm not
> > > going to try to implement enforcement at the yaml level.
> >
> > Why not ? :-)
>
> Because trying to describe anything in the yaml bindings that doesn't
> fit in the exact pattern of things that the yaml bindings are designed
> to check is like constructing the empire state building with only
> toothpicks.
>
> If you want to suggest some syntax that would actually make this
> doable without blowing out the yaml bindings then I'm happy to add it.
> Me being naive would assume that we'd need to do an exhaustive list of
> the OK combinations.  That would be fine for the 1-land and 2-lane
> cases, but for 4 lanes that means adding 256 entries to the bindings.
>
> I think the correct way to do this would require adding code in the
> <https://github.com/devicetree-org/dt-schema> project but that's
> really only done for generic subsystem-level concepts and not for a
> single driver.

OK.  Looked at your review of the .yaml and the "uniqueItems" is
probably the bit I didn't think of.  With that I can limit this but
it's still a little awkward.  I still haven't figured out how to force
data-lanes and lane-polarities to have the same number of items, too.
I'll add this as an add-on patch to my v2 and folks can decide if they
like it or hate it.

# See ../../media/video-interface.txt for details.
data-lanes:
  oneOf:
    - minItems: 1
      maxItems: 1
      uniqueItems: true
      items:
        enum:
          - 0
          - 1
      description:
        If you have 1 logical lane it can go to either physical
        port 0 or port 1.  Port 0 is suggested.

    - minItems: 2
      maxItems: 2
      uniqueItems: true
      items:
        enum:
          - 0
          - 1
      description:
        If you have 2 logical lanes they can be reordered on
        physical ports 0 and 1.

    - minItems: 4
      maxItems: 4
      uniqueItems: true
      items:
        enum:
          - 0
          - 1
          - 2
          - 3
      description:
        If you have 4 logical lanes they can be reordered on
        in any way.

-Doug
