Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E7F3F9AAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 16:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbhH0OM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 10:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhH0OM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 10:12:57 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEDEC061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 07:12:08 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 7so5783478pfl.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XokpzLMEle1i3mpv2Trg+HlaPyYhvdKVEJQHpqOpgjM=;
        b=DCUTatF2l9Oj8RMTltGhJro0gf1O4XxfrgPA58HlegpdjtaHMqS4wMoL1TfWeb6F+0
         3aqHsDES2rTD6kRr/5HmjZJxyTssp7SVKY/KSx1eNVFK3BBssVO78OqkP8x1zTzJSUco
         aH8vnguGbvfRKQGS8aAHIUKb938D24M17gZ+nlScewUuuNpiwwjM67U5sPUzajDRFC4z
         fCKMvFOJSzqNJq9Mt3bk8u2MI3+Brisbm06aZ6WG6CEjI97rdMTvrnsDVUHib0koZXI0
         jHWhQJ6xRCCpHtHsxAg1JyCNf9wIwqwuzLJ5lj6k+WwAG1xi3MiL70UP9SwqmvQ+EOnD
         e5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XokpzLMEle1i3mpv2Trg+HlaPyYhvdKVEJQHpqOpgjM=;
        b=qZyETmmUTd2E9JtQ24T8ZTn7d57s3KIMfd0nvhRUuYR+VrTM1wX6aMqo9ARZayGVfd
         7ng0CM0BgS3VJyW4msdV7Mrx2CtpGQcl9Z/hd7WKWA4ItKXdA+tMWkM+5IRIgf/a6Ac+
         KFUraWiiiNvXN3/71FaE9UvG6lDhABuWQE9RHOpmdIrAbELyWaWKglu361m7hve/uNZj
         s/vQ3zLDCGQSCR1KkBj/ZCabZgG62GjAHZ8+l/vws1NMlP/R8St+T8nNAoeM/oG5JAaA
         H7TcAFKNv8M2gP5C5EM2HrjWY/nmg+xYHbomaGk5Kj8iqxyyVzLyovg87D5Gb+mgAwRa
         0aIg==
X-Gm-Message-State: AOAM531GcqoYePxC0VthZRp80+SVvGHNX4U55tnnlv1PTE9nm0+R94qA
        IFvKq9IVDZfgCi4dMWDOgqP9Pg==
X-Google-Smtp-Source: ABdhPJxbtiVYg6JcgTQESNnXAC4tE4mI1EW6K6wdKF9NcoR+T+y1JL5RBsZJ+E68Xl/CNabr7QQG6A==
X-Received: by 2002:a05:6a00:234f:b0:3eb:3ffd:6da2 with SMTP id j15-20020a056a00234f00b003eb3ffd6da2mr9189931pfj.15.1630073528059;
        Fri, 27 Aug 2021 07:12:08 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t12sm7735105pgo.56.2021.08.27.07.12.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 07:12:07 -0700 (PDT)
Date:   Fri, 27 Aug 2021 22:12:01 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
Message-ID: <20210827141200.GA4274@dragon>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
 <20210827095716.GD31229@dragon>
 <9166e1a9-5afa-7ae8-91e5-21704bc7a40f@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9166e1a9-5afa-7ae8-91e5-21704bc7a40f@somainline.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 27, 2021 at 12:46:47PM +0200, Marijn Suijten wrote:
> Hi Shawn,
> 
> On 8/27/21 11:57 AM, Shawn Guo wrote:
> > > [..]
> > > PT_LOAD specifies that the segment is to be loaded externally.  The fact
> > > that our .mdt file is a tight pack of b00 + b01 is mere convenience, but is
> > > it also a given for the future?  Can we rely on this assumption to never
> > > change?
> > 
> > My patch is trying to fix an existing issue, not anything for the
> > future.
> 
> 
> We both agree that the PT_LOAD assertion here is too strict, but removing it
> altogether makes the function too lenient and allows for possible bugs.  To
> solve your issue in the simple case I have already suggested to add an extra
> bounds check.


So you proposed to reject PT_LOAD in the else clause, which right now
handles .mbn case, are you sure hash segment in .mbn is not going to be
PT_LOAD?

Shawn
