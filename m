Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8CD331D2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 03:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhCIC4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 21:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhCIC4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 21:56:11 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A8AC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 18:56:11 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id n10so7773135pgl.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 18:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MTVRu5yw/uigruS/X6nQpYJMpGUlZBH0fqHFAAjdGBk=;
        b=QVGUGB5wW80JZiTEWVUJ1QjWJprQu9OwtqDNCJ4x9a31PT/+mPZuefl6gkIQV0v7zb
         2cZZL9JROl8aQD6lFxbKJhsv51lQKiqS9xRMKXtABItJCWHYzSEkaghs7Ld3WcYtKL+A
         bAZjphIu7tOOud4/LT8KVvDD8/tVCxQ9AC8Uz8FfoywQ8IVVAnGD90IeoLFNPDG2xL6V
         vcIKgAET+1VX0IBuMa9HHLFzzuVBIUZmLZBktchtB0/tPJSoE9sftcPkz9KXGwmTtBk4
         yJf9h4WpnBUpuwce3AicZ3st40Hw8BrsgDXUbOY2dcm4BkVTuo7VZFrZTZURv2ByLPge
         4NKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MTVRu5yw/uigruS/X6nQpYJMpGUlZBH0fqHFAAjdGBk=;
        b=hEtpD3SqBehycbXp8TkfNAHHQ4jz7yKZ/w632g0l7TfCaldwpEBVgys4Q8T3V7W8X8
         Q/mUjn7riLpcPoKL54BUemyXKCX8ATM5E/KGM/ClpueV7pCAHpuWk/mB5H3HiLPr0Sxh
         aDcFUsLNdALgLkD0Ub8QxopYPD1Vwl0JfY/xRWvZYS+44b9ui7T8BMrYean4LuUranCn
         +Yh6RcU9MZW/QICw4NcpYvvY25EZ0jaEtdUATNi+8z1FfRKiwqQUDHDYZdXHH7uH0xvc
         +bmNSIlx2NWFb/BWA1LAeu6XcENALXH9igJmUbXsdIeHpQyR796Msg+qB5dr2KNLj064
         L/1Q==
X-Gm-Message-State: AOAM530tMF089wrhsNS8ygQXNkbuRdXk0yXjU3DqeAbFN4RNV2N55O8o
        srvJ0Dt1aMX3wvbJMOPL+Q2eOw==
X-Google-Smtp-Source: ABdhPJw+2mldQAb6JMJ35KRdSOcpZPGxbTNkRRYgTRtl6NnFsp2B5a8DfrCGyMIVthwps542geKkig==
X-Received: by 2002:a63:cb0e:: with SMTP id p14mr23065574pgg.370.1615258571020;
        Mon, 08 Mar 2021 18:56:11 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id mu6sm644585pjb.35.2021.03.08.18.56.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 18:56:10 -0800 (PST)
Date:   Tue, 9 Mar 2021 10:56:05 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: sc8180x: drop the use of tiles
Message-ID: <20210309025604.GQ17424@dragon>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
 <20210304060520.24975-2-shawn.guo@linaro.org>
 <YEbKcOwr/c1fPFLQ@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEbKcOwr/c1fPFLQ@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 08, 2021 at 07:08:00PM -0600, Bjorn Andersson wrote:
> On Thu 04 Mar 00:05 CST 2021, Shawn Guo wrote:
> 
> > To support both ACPI and DT, it makes more sense to not use tiles for
> > pinctrl-sc8180x driver, as ACPI table describes TLMM block with one
> > single memory resource.  Since DTS of SC8180X hasn't landed, there is
> > still chance to align DT description with ACPI.
> > 
> 
> I don't like the idea that we make up addresses to put in the DT to fit
> what was put in the DSDT. It is 3 different memory regions, with things
> in-between that Linux shouldn't touch.

This is not a new idea but something pinctrl-sdm845 has been doing for
years.  And IMHO, it's not a bad idea but a reasonable compromise.

> Isn't it possible to during ACPI probe take reg 0 and register the 3
> named regions instead?

It is possible.  But let's see what it takes.  We will need to have some
quirk handling in the ACPI core to detect TLMM device on Flex 5G
machine, and then override the memory resource registration for that
device.  Myself is not even convinced this is a good solution, not
mentioning whether ACPI maintainers will accept it.

Shawn
