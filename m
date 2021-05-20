Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FAA389AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 03:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhETB3t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 21:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhETB3s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 21:29:48 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279C0C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 18:28:27 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id e15so4875069ybc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 18:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LB+WBLKimq1VDsyQzzExbfrKHHTlBWjpszXjX8F1DeM=;
        b=MBDuHlJZI0Ib7Z6cFeiDt2vylSAMGrX+0yTM34V1TH+QSTXBxb/5XSWIxCDUB9lU6b
         BaEKzmET9CmlJu+hrVhZ+AUOcVni5/l4lfzEGclWYGY+V+8YMouqPGIyyDCjHCPASFtL
         zvCmSEpl3soEV+jKcvJcAqFR1NuRMtksFv1W02mHIgI7GuyWYBqA5/Ww7nW3KC6fRI8Q
         LafRfnY0PzMb5sdvIql/2E9coHuwTKJt2Vb44BOUzaOITFcLqLp7a+ugT7merMMksUaF
         DlBBTRH+602uP46bG1X1Hxsh1Owd7RYsOQ6T0eSaJRafQk9uwUpyHnvE26NeRwwiolBk
         7mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LB+WBLKimq1VDsyQzzExbfrKHHTlBWjpszXjX8F1DeM=;
        b=MHN+j3Ea7rEZ/ULlHjPWe/8gBdpsWzgemhrMV2KtNmbpzK322lTAQk6Vrdk/1d4o5u
         GxiE5AEE9+NJLLGJj0CKPnv8TyoU7JS6OOHjR4OTnjWVbAryAM3nRUkmFK/u+sn/zJMu
         YMdXv4FaKZlhv7ul+H9/pf/SsXDb0Zy7KreN5sSJBGuhSwvMVRdENxIxvioli3DyO+mO
         DSuWpNU8XuvejVbH66VG33vqlDgJL+Wuj500tMc/uVdVqDud0WB9OOHmZryfA2wkBMNm
         sK0DCBluav1qqHdDUKbeVw49ZZxDp88wBtKOrELWobhBjA1IXqh8CYf51h1Rj/Q8JvxT
         tvqQ==
X-Gm-Message-State: AOAM531RZH7USQvWz5vBKNocEpoaSLjCdpIKlMwQcp+iJpt7FbkoNHJc
        UXPC4ScRHZMYmZxqVZjB48BlLW+gYOtyjzN5Rdq7pxitKZ4=
X-Google-Smtp-Source: ABdhPJwxpTpNXprxmoUNYJsGpxKte2oQd/4/taQ4JqcpXcoJ4h5SlYFKD0njXw5lTpWTElhjSVKgdZQrWjoxzRoStJY=
X-Received: by 2002:a25:2fca:: with SMTP id v193mr3641856ybv.412.1621474106099;
 Wed, 19 May 2021 18:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210520002519.3538432-1-swboyd@chromium.org>
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 19 May 2021 18:27:50 -0700
Message-ID: <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] component: Make into an aggregate bus
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This series is from discussion we had on reordering the device lists for
> drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> the aggregate device onto and then we probe the device once all the
> components are probed and call component_add(). The probe/remove hooks
> are where the bind/unbind calls go, and then a shutdown hook is added
> that can be used to shutdown the drm display pipeline at the right time.
>
> This works for me on my sc7180 board, but I'm currently struggling with
> the last patch where we migrate the msm driver. It runs into a runtime
> PM problem where the parent device isn't runtime PM enabled yet. I'm
> still trying to figure out a clean solution there. Moving runtime PM
> around breaks boot and I think that's because the power domain is off.
>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
>
> [1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org
>

I skimmed through the series and in general the idea is good, but I'm
not sure why each component user needs to be converted/"modern" before
it can make use of the benefits of this series. Why not just have
wrapper functions around the component ops that the new aggregate bus
driver can just call? That'll give all the existing component users
the new ability to use the new ops without having to have two
versions. That'll also allow us to do other improvements (I have some
in mind) that'll apply to all the component users instead of only the
converted ones.

-Saravana
