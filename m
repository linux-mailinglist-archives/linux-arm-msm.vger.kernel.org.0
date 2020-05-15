Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D92D1D4386
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 04:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgEOC34 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 22:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726140AbgEOC34 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 22:29:56 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344D2C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 19:29:56 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id s85so181307vks.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 19:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3JifzVBQeOFFZWECIooC1r1MBLb2LpZu3OhDsGzyQwI=;
        b=ZkBlAm2iPlEcr/Yn4qDW9Yq6BXZNd/Rv6CWBamTR7L/fNW4uy8Bxdam5xyBgH6mbo1
         T9Ggd5HVo4MANHIcEtjG+/EYbItWYAcFGy6VOaG4l12Ns/5lLWeKwxJvDB7zq3rfA+q8
         W+9nwtTERzKqQY51VK5fKIGpSe5CpsH5S4Cxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3JifzVBQeOFFZWECIooC1r1MBLb2LpZu3OhDsGzyQwI=;
        b=lhcK28tWleewgMLndpkg1Lpg2dZNe5Z3Po+j30GF/psoSyneQsYSz8XtKXJtgq3VmF
         cgGR6E+jLTHaQJMr3fB5bPHzgLfvBXBEG+rDqnEywQxnsndvTgRj5zar5lSeUh7PlKYL
         G+ow0+cGVBxkGLA2wLl1iOv+QYzgHZvPTK27A71UHqG6FummmPmz6vuI86O+qxAdWOtF
         H8G1LRjewE9fpUdthLnpy8OAIyyNQkwhORUqV6+e75c2kvfdl6H4ccLqJfj3Akqch6R0
         /BgsL3z6R8IMCIVVXoTLFVdagaG3BzsSGhcKTgYemuS/naMmrlJnToaeko/dc0MlZa+6
         /BEQ==
X-Gm-Message-State: AOAM533b+oSgK26CAUsgGXqiJKIQl2VRPlH1CMOHJqQY22jSzllHVHOQ
        EtpezWw8mmtzTfRiKKhj+DbTRkSiwU4=
X-Google-Smtp-Source: ABdhPJzS2Ux580nGgj3eAdEUnEVd/liDgr5Jtaz8tLaMdbjVwScQ/fccp0w55NZLe9+JB5ktePjWyw==
X-Received: by 2002:a1f:a150:: with SMTP id k77mr1147411vke.88.1589509794980;
        Thu, 14 May 2020 19:29:54 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id n22sm241426vkf.13.2020.05.14.19.29.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 19:29:53 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id m18so184813vkk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 19:29:52 -0700 (PDT)
X-Received: by 2002:a1f:2c41:: with SMTP id s62mr1100387vks.40.1589509792456;
 Thu, 14 May 2020 19:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
In-Reply-To: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 May 2020 19:29:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UbcUersNDYK9LQiGb55PUN-HSwxjCZdxo6QqUV=N=UTQ@mail.gmail.com>
Message-ID: <CAD=FV=UbcUersNDYK9LQiGb55PUN-HSwxjCZdxo6QqUV=N=UTQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] soc: qcom: rpmh-rsc: Correctly ignore
 CPU_CLUSTER_PM notifications
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 4, 2020 at 10:50 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Our switch statement doesn't have entries for CPU_CLUSTER_PM_ENTER,
> CPU_CLUSTER_PM_ENTER_FAILED, and CPU_CLUSTER_PM_EXIT and doesn't have
> a default.  This means that we'll try to do a flush in those cases but
> we won't necessarily be the last CPU down.  That's not so ideal since
> our (lack of) locking assumes we're on the last CPU.
>
> Luckily this isn't as big a problem as you'd think since (at least on
> the SoC I tested) we don't get these notifications except on full
> system suspend.  ...and on full system suspend we get them on the last
> CPU down.  That means that the worst problem we hit is flushing twice.
> Still, it's good to make it correct.
>
> Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v6:
> - Release the lock on cluster notifications.
>
> Changes in v5:
> - Corrently => Correctly
>
> Changes in v4:
> - ("...Corrently ignore CPU_CLUSTER_PM notifications") split out for v4.
>
> Changes in v3: None
> Changes in v2: None
>
>  drivers/soc/qcom/rpmh-rsc.c | 3 +++
>  1 file changed, 3 insertions(+)

The bugfixes in this series seem somewhat important to land.  Is there
something delaying them?  Are we waiting for some tags from Maulik?

-Doug
