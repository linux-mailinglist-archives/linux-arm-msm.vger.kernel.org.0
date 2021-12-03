Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FF9466F45
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 02:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237460AbhLCBxw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 20:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236759AbhLCBxw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 20:53:52 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D86C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 17:50:29 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id r26so2865708oiw.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 17:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XNwfOn9vmY3VbdnDca+JfZ16hyf72zuU1wTESMaGj7Y=;
        b=YAntr2tAT7sEIv605evLopqYP/xpOtx2dHSl2V0NHNjkGy8RR+F5tjXLmFQXIUVLX/
         HdFEhTBkzzIchrj3sZSsnqicRNOhNXrh0NXsuJeaIXDSQW9IAKOI0AfQNR6d/JNyu8/i
         QOk+EKYEzPP02uFhgkcLLjSph61McgnnSer5a7ApLRudN77ULzy5Uy4qnyetNDjH4ZgS
         gxA5TkDl0AF5WzZSyfV0lH/Hfws/VXLcCJzBL+bvt3YWkFXdg8wLseqHWubH7FWTJEWx
         k5j1rim5sGqc4f9C1kqnPBX7vHDHOPPJE/htVnD+KcxPYVMWvUKRhS/iv+1otnNgVyJz
         5JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XNwfOn9vmY3VbdnDca+JfZ16hyf72zuU1wTESMaGj7Y=;
        b=xVxY8YBbjqQHiPSFcxlGOjyUYtU+hIdj2BEaWpeoUrT94JxSzjeiEJGvsC9ZxmAimm
         XROmUlpclRk6ktLrqeRy0Dun/7+PJpZhQxn9cQGq3gYXzkxD32QklscZdlNkVf64Vjr7
         vBLRpoKHphgEkhEBoVe5LA6R7++WMlF7zPZ9cOuw+qVTtgk6nuukOM/bltKgZgUuySYQ
         O/OUbY6rYfy+vDOMiRb/Y56Lnyn+LwY1JCnXO2slhoVQKzqva87pFzOvNTiV418u2lQM
         uJIw+HwByAeUumvg8D6z1r15P5GuwQCrX9YiWQVrUVoyHwztTL50sSHeTyytLfMbijkv
         TqEA==
X-Gm-Message-State: AOAM533xNTU78c9E5mwu7QmJi6P67lsPvut1M4P1Cqu1XbbPUjOA3zir
        bgRY6k14U8l7W9DpjqiSdRAi/Pqvw1yGCG2EuwZ/bQ==
X-Google-Smtp-Source: ABdhPJx7nuu2YlyCnPSegJgOpuOgC5CE+wFxLhOMv5rAZOIPRLBb6QItoG/svVYhG6+xrtvREGHlHYeZM0on16MQM/E=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr7264529oih.162.1638496228531;
 Thu, 02 Dec 2021 17:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20211202222732.2453851-1-swboyd@chromium.org> <20211202222732.2453851-29-swboyd@chromium.org>
In-Reply-To: <20211202222732.2453851-29-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 Dec 2021 02:50:16 +0100
Message-ID: <CACRpkdZs3cBT_SX3-qAUSmgCdFywJAxGDSCFjoG+FebEojYL6Q@mail.gmail.com>
Subject: Re: [PATCH v4 28/34] power: supply: ab8500: Migrate to aggregate driver
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 2, 2021 at 11:27 PM Stephen Boyd <swboyd@chromium.org> wrote:

> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to all
> the component devices that make up the aggregate device.
>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Cc: <linux-pm@vger.kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Pulled in that patches and tested. Works!
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
