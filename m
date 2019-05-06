Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67529144FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2019 09:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbfEFHHd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 May 2019 03:07:33 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34052 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbfEFHHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 May 2019 03:07:33 -0400
Received: by mail-lj1-f194.google.com with SMTP id s7so4691195ljh.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2019 00:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CwhE2uGZiLqXEkI99lHZnisKdDy8+j12/x0rEBhmeMM=;
        b=l2L8hf9litttSO44g7UtX5hvurVX6oUBgrgVujLll+Rl/TJbvf3yhbIMo9EhmEZ9Rk
         Wa2kzhcPXWJ1bcoLMsvfOY2kCOo0Dp9p+w3OEZsKkK4mKLpsiY1e935zU70ZGM5BvbjH
         WQHijhdwJToIsiTpW66nmXUpeAGgGsTgL2YH9b3xSEgDX996kJl1VxdiNLu3a54gq9y8
         s6bqhRSSGn90aGEWOpIXvBqEf1+xLT9YdV6OpKZyCSTnbF8IYG0R1/R/nVPrV3mzSSUr
         r+RrzSE2Cwn8yJsRl+MCGGc+Nv8WEiF/H4gRbUC007pQnjF5URyBaMLARwq1JvbYca1w
         IVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CwhE2uGZiLqXEkI99lHZnisKdDy8+j12/x0rEBhmeMM=;
        b=jrphvfYHvgbBYPj2QxJ2sZpMu9aONsITQv5CVWua1GnQvnwI0+3U+ZmR8fYJ/VWLrs
         eAWZ3QNcQmw1vt4DXRY5n51p/0ldCkEBOFERCd1lpGtDGyQZlY4uifUjlxMxqcJHVweL
         lHbMIS9knIYs3ejcCGhR2p5UtBhvJBid/jUK2dhS5GPFlXvx4Lj7aumwweJgQohFjC2U
         mtAakENVDCCByZIGAOr/laew7JW/AEkINvwWmPYiFo1/jbUnvxGM6wXgaJAC4fPkgx+v
         Zgm+MOF5KLTtDkA67+yA+KUVG0YY1RuzL9GzG6Ls0djs06eUz2vT0M+TgwBAoi6famXk
         FjSA==
X-Gm-Message-State: APjAAAVREEcETr3TRMdMekVAXx4o1leQSyLaW24UHYR0mR4aJENFK4pY
        PbUjsiPQC8GHM+6zqSKvRfTN0ErvwJT03wUFKBOJjQ==
X-Google-Smtp-Source: APXvYqy5QhAAjdwvG22vzOX8m6OHCd2VKpL1I6A8CX0v3BiwyS6su6YLuw04TDhpCSaHEIZ/H1RuHvzvAIH2QzK179o=
X-Received: by 2002:a2e:834d:: with SMTP id l13mr13133044ljh.97.1557126451228;
 Mon, 06 May 2019 00:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org> <20190505130413.32253-5-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-5-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 May 2019 09:07:19 +0200
Message-ID: <CACRpkdY_SwZMudmKaC90Q8O4OnhjVLeGN2ZU29xGw3FGG3uYiQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 5, 2019 at 3:04 PM Brian Masney <masneyb@onstation.org> wrote:

> Add the MDP5, DSI and DSI PHY blocks for the display found on the
> msm8974 SoCs. This is based on work from msm8916.dtsi and Jonathan
> Marek.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

From my limited understanding it looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
