Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57CDC2F9F55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 13:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391068AbhARMSF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 07:18:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391038AbhARMR6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 07:17:58 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC52C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 04:17:18 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id i63so3019028pfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 04:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OK+wvAIWz97i5pOfUTWYOoqWSq+gjxb55ZgsDBZNEUA=;
        b=yP3q5bnE215jn1E384+68S8WpKkBR1Z6hlcrJqXtxx8EHVNXszY6x4n99kbsq00dNs
         ZDoXaqHWgtr16JKaOWXEb30q2lD5phUJ1rBOui0xdAku0cjXD31r7CL1Bji2cS7yYjKe
         PUE7oqytiB3A09eJGiRfHs5ongISYeEOHN88oukQQNATlYSEqgKwHVLuZN6oxqK55uiz
         zqAM525e/wZWS8dItT1IJz5+6J/kuafKxBS84bJDt4SMVfVHI9CgXIp6YwFmeFhBQbet
         dyzJbN2LhMi9DOryAyj3WQho0pcKtkdcrDhCqYgj7gLR4OgbMV66K6HzEgBjeXxK2EPm
         x/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OK+wvAIWz97i5pOfUTWYOoqWSq+gjxb55ZgsDBZNEUA=;
        b=XGUYM0311Rpmzr8YYOZ/NYTSJ4rMs4xxzLDbX6fy52KEbiKty0+P2lra9O4VUBAHiQ
         5/cYP9ldkChXAXLbk1/hhcjBqF6OlJBGtqVYOVcR/XXUo2vYoCnDCug+vijwCtgoRKnP
         8NetdiwMy3RZhtq7T9DvuhNFsUIquTNQIAsGVoWCQPL4eeC7f8RgcT2HyxnR7sryCC35
         ctyjIaQ4uP5zQYGfZVYDiRypJTg9X4OD7VeMOrYEOJVOpmVl9AYD/M8anXlIYuPecwch
         79I2Mm0lip+JYBAnwOQaGMcs60My1SoR2LNnuRAZ8LF1XYUXvw4adsOyMoCZWlRuoXOJ
         Rq0w==
X-Gm-Message-State: AOAM531vu0mTzJ7l8kNuoYsykLQIhrhRgsZROpSYhSREWAmzDtVtfdg6
        qpwZiWF0Dc0cw9PehhHlNnX9PA==
X-Google-Smtp-Source: ABdhPJxUQwXWTzfvNpzdBvric1JiErYgJn0SBmCP6LDT8gJyn3YgSuMpY+a93LQfpzjCCVyGWeT34Q==
X-Received: by 2002:a63:c64:: with SMTP id 36mr25822687pgm.255.1610972237714;
        Mon, 18 Jan 2021 04:17:17 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b6sm15178100pfd.43.2021.01.18.04.17.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jan 2021 04:17:17 -0800 (PST)
Date:   Mon, 18 Jan 2021 20:17:12 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: add missing devm_release_mem_region()
 call
Message-ID: <20210118121710.GD2479@dragon>
References: <20210112095236.20515-1-shawn.guo@linaro.org>
 <X/210llTiuNt3haG@builder.lan>
 <20210113043143.y45mmnw3e2kjkxnl@vireshk-i7>
 <X/5+GbueKg66DoEE@builder.lan>
 <20210113050651.q2txref3d6bifrf3@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113050651.q2txref3d6bifrf3@vireshk-i7>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 13, 2021 at 10:36:51AM +0530, Viresh Kumar wrote:
> On 12-01-21, 22:59, Bjorn Andersson wrote:
> > But that said, why are the ioremap done at init and not at probe time?
> 
> These are some hardware registers per cpufreq policy I believe, and so
> they did it from policy init instead.
> 
> And yes I agree that we shouldn't use devm_ from init() for the cases
> where we need to put the resources in exit() as well. But things like
> devm_kzalloc() are fine there.

I'm not sure why devm_kzalloc() is fine there.  IIUIC, the memory
allocated by devm_kzalloc() in init() is not freed up from exit(), as
&pdev->dev is alive across init/exit cycles and will not trigger devres
auto free-up.

Shawn
