Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B7632CBFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 06:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhCDFZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 00:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbhCDFZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 00:25:24 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83033C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 21:24:44 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id u11so15451423plg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 21:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eF3ouK2tt5RggVqVE4tZ8JPzVe8Y7mIM7tF/ZggEiY8=;
        b=hdbTIegP1vwRxV46VZzfJgU0cNqGnWP/UjMRcKYRZAClQyp6SYjuMkVrndTK/7la7g
         SVTk1mlp92vWAyNIMQDgjfWTfUsWjjK85sErjxdCivQBnqnWBR8iUKiDl8iRcdOk85gB
         EqFuVgnVJrhrdRsUGuOJkOz4ZcYufuzk/MpfkaNAaX1d3qrR+0fKRewIyUD+A7aHozpW
         5iVQsdw89sqMPGVwXKX5PwRia3b7TDHYQsf7OQebhleK9M+4nltG3IKVRSHmRw43la/U
         81+o/e795XL8UizwJ7D9/9t2O6RZV8sQBXJF70YpAIeJZwbsEDeBndSQzsBVVv8jKZir
         psRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eF3ouK2tt5RggVqVE4tZ8JPzVe8Y7mIM7tF/ZggEiY8=;
        b=YPLCvUEJQhxC8HVlFkUlFEdZbX3j0XXn9o69Bu4YHCIH8Hw43RG3ZjPx2ah8YtJW+B
         n0j+OgE6SbYXeusDKMbKG6XjOVmpvJW+Dap6hpj9WFPd8VXSLEHjuu0I0tBwfgGxkDuC
         tK6pbe1afjq8nOC8cuufmIC0qO3sXUTVdKiARPyDeLqlsmIclDElAqJku75vR1DkaTLQ
         ZqUUNlpmESMj6zulg4iksGaJ0no8ILnsmUgJbQSbUW4kfFoG6V+eUFkEaj14ui8zBoqO
         w5zmVYVmTNcco5T/AYXlNKiCLAkvLuWc3hPnBP2X/MgY2zfIRBTSxmAzJwKTMTrQbRrZ
         Oyww==
X-Gm-Message-State: AOAM532cpJypz1MCHxPWfoSTRRM/qwZnBgerAyRoub96KBfEeo4U7vgT
        NzISC0NmAdQhoUHwQl59rPT7gA==
X-Google-Smtp-Source: ABdhPJwV+8E5f6x7ijD6rKI2G4thN4e1CZ83qzpkuhoNGfzMuhUCHk7GJ8ZPHqExxqf273LGRIEASw==
X-Received: by 2002:a17:90a:d585:: with SMTP id v5mr2716351pju.206.1614835484122;
        Wed, 03 Mar 2021 21:24:44 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id x9sm8261323pjp.3.2021.03.03.21.24.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 21:24:43 -0800 (PST)
Date:   Thu, 4 Mar 2021 13:24:38 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: handle tiles for ACPI boot
Message-ID: <20210304052437.GE17424@dragon>
References: <20210303132622.4115-1-shawn.guo@linaro.org>
 <20210303132622.4115-2-shawn.guo@linaro.org>
 <YD+YSS/s79gqwEpS@smile.fi.intel.com>
 <20210303144526.GC17424@dragon>
 <YD+10cmeWfppgj0I@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YD+10cmeWfppgj0I@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 03, 2021 at 06:14:09PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 03, 2021 at 10:45:27PM +0800, Shawn Guo wrote:
> > On Wed, Mar 03, 2021 at 04:08:09PM +0200, Andy Shevchenko wrote:
> > > On Wed, Mar 03, 2021 at 09:26:21PM +0800, Shawn Guo wrote:
> > > > It's not always the case that DT and ACPI describe hardware resource in
> > > > the same schema, even for a single platform.  For example, on SC8180X,
> > > > DT uses the tiles schema while ACPI describe memory resource as a single
> > > > region.  It patches msm_pinctrl_probe() function to map tiles regions
> > > > only for DT.  While for ACPI, it maps the single memory resource and
> > > > calculate tile bases with offsets passed from SoC data.
> > > 
> > > ...
> > > 
> > > > +#include <linux/acpi.h>
> > > 
> > > There are at least two possibilities to avoid this:
> > 
> > So could you explain why we should avoid including this header?
> 
> Here you can include it, but it's quite huge in order to have just one little
> function out of it. But main point is it seems that relying on firmware type
> for the tiles support is fragile.

Okay, I'm not entirely happy about the tiles checking for so many
conditions, so looked for other way around.  It turns out that
pinctrl-sdm845 driver sets an example for not using tiles at all.  I
will send v3 to drop this tiles thing completely.

Shawn
