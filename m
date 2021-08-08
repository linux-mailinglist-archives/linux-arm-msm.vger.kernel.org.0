Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7523E3A1F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Aug 2021 14:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhHHMEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Aug 2021 08:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbhHHMEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Aug 2021 08:04:41 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095B2C061760
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Aug 2021 05:04:20 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso1558062pjy.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Aug 2021 05:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DzOUOaS540Cron5XlLhz1i69/y58EIYipvvUh9fco7I=;
        b=ydBKzvhbo8Zunvu0ScJ1TBFgq+3iiG8fbjKF+gXXK3BfDi13tfU3H+XdwYGxKuavBW
         z9Qzx+JCsLeVLWoK2AZ7pOkopIn+Bqlke4bcd2/z07t52RkRF4fDliiTdFH8gth4Zyco
         EMXXzqP6R09M9QIeiXEtT0kci+WJE4XOOCVMfhs9OKpAUqYO/wq2LUyyqJNwytGfYUtq
         lDfdXkciTk2m2f7mE0AsAysFr/mY8/W9wIbsmO1LCwDiks3yJb4VnRXNGrDvOkqaKHhc
         kjzQ5wGo/IVk8vwoBKiRLDa4H/NQF8s7Mfo4y1V2sAYy7xfQYinMfswpFXRCwm/M2G6J
         RHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DzOUOaS540Cron5XlLhz1i69/y58EIYipvvUh9fco7I=;
        b=m6ggucTc9JedrUxOqAKD1h6H3C1DeM1tiCW145TMGx8TdW96HRF7y6S14WfxUVoFoH
         hO3k6yz9lqtFXLqpqhwzciPJv+DciDG/D5wEjrcoPjeTR8G0cxYJtK68e70k/UuYPi9C
         om6FyjZzJWUjWkBnc46ThLVGesx4V1HKd0JvBltXDcfrnHULABaYI2D3LM3SB1zeRxRF
         f+3XIbdUzJN9UDY2pAxZ8XwOjwKa8bXO0gOtK4iuwu9vFMzAll8yYbu8PRfUWhC0HR/J
         wptoHieqxYGf1UNokwreWseP6kv9NOAqmJhpdaFAQAZwN3twLmfDIdLYFMe3671x87D3
         dwfQ==
X-Gm-Message-State: AOAM5320YDGdIumePwDqWvwzo7ADAn6NiLU3aQEfuw2hpRi2wLZs48Hn
        C3yv9PCtRs7OoMbu8esEg78F+Q==
X-Google-Smtp-Source: ABdhPJwc2ghN3JZOLInzhYcoPLdSwuBpmKo4THl4e7PriYyB3yqvcNXd+CJwhsSPA6v8s/TJrM7Vzw==
X-Received: by 2002:a17:90a:4812:: with SMTP id a18mr30565965pjh.40.1628424259593;
        Sun, 08 Aug 2021 05:04:19 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id u190sm17253360pfb.95.2021.08.08.05.04.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Aug 2021 05:04:19 -0700 (PDT)
Date:   Sun, 8 Aug 2021 20:04:13 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Truly NT35521 panel
 support
Message-ID: <20210808120412.GA6795@dragon>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-2-shawn.guo@linaro.org>
 <YQq6ascrSCtErWrf@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQq6ascrSCtErWrf@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 04, 2021 at 06:03:54PM +0200, Sam Ravnborg wrote:
> Hi Shawn,
> 
> On Wed, Aug 04, 2021 at 04:13:51PM +0800, Shawn Guo wrote:
> > The Truly NT35521 is a 5.24" 1280x720 DSI panel, and the backlight is
> > managed through DSI link.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> Please consider adding an optional port node, so we can use this panels
> in a setup using a graph.

Sure, will do in v2.

> A simple port: true would do the trick.
> I am aware that it may not be used today, this is a preparation for
> potential future use.
> 
> With this fixed,
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, Sam!

Shawn
