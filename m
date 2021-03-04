Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0625632CA73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 03:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhCDCZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 21:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbhCDCZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 21:25:46 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF4CC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 18:25:06 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id z7so15248966plk.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 18:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aRTindZj5rFMg3BpBmEABxaVuwreQ5iWx3kEwidtz5c=;
        b=AIwjAv4SC8Wdveml/iI74PmqC97boTcPuk5Vs6MXvLJxAK++SPNq4MnoLgbi7WCk0I
         IHf3ZN8m3JPvvpSepTI5mVC9GJakxgl0OFhge0gvxOXINYZeGqokYUhINh04y+2CiJAq
         9qajfPCU5modCmp2Pqsmvo4KHtjlWtVFbXgABhwPAh6tfFmay8ioOwPq0TZQVuUB3URM
         Kpp5N8eIVvamT6FT+XeIy5Qa3desRVASDohBEOhdgVhyEtGxziTxD0qACtFJ/nOM77bH
         6vYtOOg0YtGowl6llimjBSHDcoXG9rvPnwX2NiFg03IlxPtUqew7ddmHH3ABVS7Q+30n
         MOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aRTindZj5rFMg3BpBmEABxaVuwreQ5iWx3kEwidtz5c=;
        b=HPUJng8bt1RIrMFVG43HvSeBCmkhYu6fvfmsqPG4yUtBXQa6t3+XY/y3ekbtrxsUcW
         oHJJnxwOUBjOzpWGTgfeewqYE7ioTxQi7q/A28UZfc2PMEEZxCCWV/g0CD/6BKHCgmVP
         H14HHaHbRhy0MsxEeVObTmXKv9bhhy0hqjBVzqjlz2EfCMi2GqOjiJoRgDSzy/4zdbKX
         rGFcN/UHoH047NyqsNITNisNkW5jYIHe5CipVQkF9Kt+iWfC2lOxlmmXDxWYxQWgc9lN
         nDmQvAF4T9hK0eG2gz5gGBgZkDrGjBhcdJEDvbkRvF1sXwuCT4Mk1wH8ptcNcuNgrz6C
         8MqA==
X-Gm-Message-State: AOAM5301aECaYI/nw932zR2LHil9HbBZkgojtPyZvdv7V7lZiXe5tyxy
        0ThVcYLkkORZ4gmM/jLnftBeBw==
X-Google-Smtp-Source: ABdhPJwqSBieGEVi5vqu+pd9RNJljBzo4yi5v6PPVaSomtsnxZGz7tN40ZQh8v2xIk1pzCeMNJ+9lQ==
X-Received: by 2002:a17:903:2082:b029:e3:df7c:f30 with SMTP id d2-20020a1709032082b02900e3df7c0f30mr1901724plc.71.1614824705655;
        Wed, 03 Mar 2021 18:25:05 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id j3sm23933278pgk.24.2021.03.03.18.25.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 18:25:05 -0800 (PST)
Date:   Thu, 4 Mar 2021 10:24:59 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <20210304022459.GD17424@dragon>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
 <YD+iWuLS/9knWLFb@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YD+iWuLS/9knWLFb@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 03, 2021 at 08:51:06AM -0600, Bjorn Andersson wrote:
> > @@ -717,6 +731,7 @@ static const struct gpio_chip msm_gpio_template = {
> >  	.get_direction    = msm_gpio_get_direction,
> >  	.get              = msm_gpio_get,
> >  	.set              = msm_gpio_set,
> > +	.set_config       = gpiochip_generic_config,
> 
> Generally the pinconf/pinmux part of the driver deals with groups, and
> the gpio_chip deals with gpio numbers. So I think that either
> gpiochip_generic_config() should somehow do the translation, or we
> should use a different function that does it (even though there's no
> translation).

The transition from GPIO to PINCTRL world is being done by
pinctrl_gpio_set_config() which is wrapped by gpiochip_generic_config().
This is nothing new from gpiochip_generic_request() and
gpiochip_generic_free() right below.

> >  	.request          = gpiochip_generic_request,
> >  	.free             = gpiochip_generic_free,
> >  	.dbg_show         = msm_gpio_dbg_show,

Shawn
