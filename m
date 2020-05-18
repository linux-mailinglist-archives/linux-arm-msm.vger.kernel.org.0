Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688F11D863A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730912AbgERSYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgERSX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:23:58 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F807C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:23:58 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id c17so3822074uaq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=66BENZkKJdscrKXw0ODwzFcr1IXdRBxhdFQSFMOWssw=;
        b=BbisGLjf3FNDMjbQcmYHxKKASqShM9Q38fh+ZAm2fNnRRbEZE92f5+zgkfkWsT6lzP
         Y6UYWsK2IzFEBWi0s8uR39LnFO7d6cgo+9iao9K8JC9jHGO0f5tSauFodWvkfSjYOpST
         bff0D8UDAWveJEHNLUFT1N2rh+cvyKIZNzXVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=66BENZkKJdscrKXw0ODwzFcr1IXdRBxhdFQSFMOWssw=;
        b=XVu5fHX8uWyxJqbVGxAUTvLoyzYQiII7wR1yvVPQASuDD79Px0SGf0wyzzFhBox2W8
         w7IyK1w+retZPS7eqQ+H0/COMRhp0jIoPd/tkOHnj9wd+6FErV1deD4IdsBqr/HrWrR8
         hVD0K4QMIrB8W7D/SXBdAra6uKJCXqQKyy5T8lkKUDCRGhq509306C+Vzj3kE/l99vH9
         Hj2oUHkPuLREFw1IDPDC7U4Yd80mKqbTr7yV/VI60wNYE5IF8elvCAK1KUusEQ8bfm9z
         5v5w4VGTp8rhNaeZBXjPXhC1YXJSw5xw/2MDPiK7odUgKbI6mzBqpwMzXjx7MtC0fLXP
         IG2w==
X-Gm-Message-State: AOAM5302CuEsZph+AmFZcqUYuftpueJsxUSLkLNk2rJDlcWi3vqHwply
        HD/+1fsONgsu5Cww5P4WlD0UkXwP4wU=
X-Google-Smtp-Source: ABdhPJwHU4JYN2cxSgn+Ao4AYHJAR16xkCtco/lAlx3L1s6avUNmYrQKd32fioN7OfHxJgnLa+eQTA==
X-Received: by 2002:ab0:6f08:: with SMTP id r8mr6811070uah.111.1589826237083;
        Mon, 18 May 2020 11:23:57 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id k5sm1494402vkk.10.2020.05.18.11.23.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 11:23:56 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id u2so2430967vsi.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:23:55 -0700 (PDT)
X-Received: by 2002:a67:e952:: with SMTP id p18mr5212098vso.73.1589826235405;
 Mon, 18 May 2020 11:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
 <CAF6AEGs0qpzgGW8rYdmFqKW=QBbRxxzCWjO0LXsbm6hA0AJNyQ@mail.gmail.com>
In-Reply-To: <CAF6AEGs0qpzgGW8rYdmFqKW=QBbRxxzCWjO0LXsbm6hA0AJNyQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 May 2020 11:23:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQ2HtnWFyhachm9QyhkXVhMzRoiR=rWbmukmVYciL3Gw@mail.gmail.com>
Message-ID: <CAD=FV=WQ2HtnWFyhachm9QyhkXVhMzRoiR=rWbmukmVYciL3Gw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock choice
To:     Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sam,

On Fri, May 15, 2020 at 2:49 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 4, 2020 at 9:32 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > If the rate in our table is _equal_ to the rate we want then it's OK
> > to pick it.  It doesn't need to be greater than the one we want.
> >
> > Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

...and I think this is the last of the patches I stupidly didn't CC
you on that's ready to go.

-Doug
