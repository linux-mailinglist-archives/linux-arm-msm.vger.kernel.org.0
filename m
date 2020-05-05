Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABDD1C6304
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 23:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbgEEVYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 17:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726350AbgEEVYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 17:24:38 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C51AC061A10
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 14:24:37 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id j1so101495vkc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 14:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xD9oC230/p7xdIyNhq/DI72VMWwLQ0pXEid/2VB2RIE=;
        b=mjnNLkkpMuBQM4TIComyfZixfgQHhE7tuFWValYOOMp5lib8ve2bEYRSkPoc6w3DfW
         x+MXBWW0cMkQbuC/d4jz2iCfV4rJYanNXcJZAoAycgsG6CSrTebEpKdKS1Jiumphdr4L
         iCabexNFAQFv7/oUMBhn7gE3sdcfhe6/b55/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xD9oC230/p7xdIyNhq/DI72VMWwLQ0pXEid/2VB2RIE=;
        b=K+76dyWCfnvIx6G9qffTCXc74NNyHCRhKtO2LPpH/WiGptQY7jSQ1Il9xSD9FpzArb
         F80oTI8fmdkc88IoX7E1apuStTJ5pKSpdk/aAMM6sV9bJCbpNOgM34/3HJudtLfqtaVd
         CIYpxzDhOj4FkJ0oE/WCxTorLioa9X9ijsUiug2NDcHrkuP93J15DqdU89zlmvhfDYsQ
         xQD4csawTQZfCakenEXN5xWNAOQQ0TT/bfzpII217gYqDOY8c6wCvC9/RayXFScxGHEc
         T4sBDqc2zndjgDK603ChZrVwuaIMOB+QX3uTqg6ktnK/5ZadyVzeo/rQtd0HypaAB6Ip
         2dqA==
X-Gm-Message-State: AGi0Puas5CtlJpozd2EpT9/MiP53SmwGBTT3qgPv9LjWpvZVMUUmUAN7
        NZh6q78VJj27vC2jdH+N626IPUbqMvw=
X-Google-Smtp-Source: APiQypJscmRuEBqW31Yq0OdpA4xmQ/Sjtnwx9s+c7uAziuef+K55OSh5f/+jLTVmc8IKvt/Z3ioSsQ==
X-Received: by 2002:a1f:c643:: with SMTP id w64mr4595788vkf.0.1588713876602;
        Tue, 05 May 2020 14:24:36 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id h65sm111665vka.13.2020.05.05.14.24.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 14:24:35 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id l25so141291vso.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 14:24:35 -0700 (PDT)
X-Received: by 2002:a05:6102:4d:: with SMTP id k13mr4884961vsp.198.1588713874617;
 Tue, 05 May 2020 14:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200505082436.GD9658@pendragon.ideasonboard.com> <CAD=FV=WjUpwu5204K8yHzqsJv4vQX5S5CArH1Kj_kqjhZzTc9A@mail.gmail.com>
 <20200505210609.GA6094@pendragon.ideasonboard.com> <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
 <20200505211401.GC6094@pendragon.ideasonboard.com>
In-Reply-To: <20200505211401.GC6094@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 May 2020 14:24:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
Message-ID: <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
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

On Tue, May 5, 2020 at 2:14 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > I'll add this documentation into the comments of the yaml, but I'm not
> > going to try to implement enforcement at the yaml level.
>
> Why not ? :-)

Because trying to describe anything in the yaml bindings that doesn't
fit in the exact pattern of things that the yaml bindings are designed
to check is like constructing the empire state building with only
toothpicks.

If you want to suggest some syntax that would actually make this
doable without blowing out the yaml bindings then I'm happy to add it.
Me being naive would assume that we'd need to do an exhaustive list of
the OK combinations.  That would be fine for the 1-land and 2-lane
cases, but for 4 lanes that means adding 256 entries to the bindings.

I think the correct way to do this would require adding code in the
<https://github.com/devicetree-org/dt-schema> project but that's
really only done for generic subsystem-level concepts and not for a
single driver.

-Doug
