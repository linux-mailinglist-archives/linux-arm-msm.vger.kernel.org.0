Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4948644C375
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 15:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhKJPAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 10:00:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbhKJPAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 10:00:10 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F726C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 06:57:22 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so4301535otf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 06:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IVWIafG6+i9xxjsT6NKZgVi6v4U8498TFF3OthQIW6Y=;
        b=wLsddjtemJvbZuWvnkRiu3a4Emu2EPb9yImANBdNpxFCYrzvCaaaP9FcygHgEO8WSC
         w8fTQCFN6W7isD+uwVmaUoom3hXJb1+RICWc6LnEMjSoY48VC80jVUB3SAoUmoGF3GXS
         n9Qw1WpO34h52wM66sv1NjIemiIWjxhBxoTAIyoPEMOLY8J08lcakE8GbOrBz13yAUkx
         a43jWXqfKwCOwpM+V/LhaNBl5doCaCypefXfuXuID/5Z3XsDtU8JAHielqzfIRQcm7h2
         DKBwsyQeDeZ/33jJNU0YrrqrAr+Imbmab3Ow9xp9ZTFn/b76QoNJ6KwJHtiNlzxSxOGl
         g3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IVWIafG6+i9xxjsT6NKZgVi6v4U8498TFF3OthQIW6Y=;
        b=Fp7TG4de710YfqPjSgZVsmA0rmLu89mGeoU2DnDziyCKhMtxc3N2yZ1+nxp4tmL7CJ
         zUHGt5MYzQ/BWCnVX4P+07WgbKC2jaW3BUW3bSnyNKrxojmEcoZDWBcGnDaxgvn50rGq
         nYco8UOMYMd89J+Cyb2qF+x1yVNKK7PyHYZaBw9MMVuIXimIkzDbG7KMEgRSrDmLpX8c
         a56vAw0TZ14goeKaoHkX82tyhYN6GZfljAfZmylYLnTAmNMnCE6FD4b/otZ4rCiy9N1T
         F1DpraSKtDlqEy5WX99BUEy8e5kw2MgCqbTIwThdoXDNNRtypm1Zn6bBqA/zsj0upoHM
         zTIg==
X-Gm-Message-State: AOAM531pyzsWyDaNNWi5hSUzra7xgARc3vs3AxdRl/aGpn3NGU/1Jk2V
        ZbMwrV4iNqJc4xBqS4nWZsMMbA==
X-Google-Smtp-Source: ABdhPJwJAXzABpKw5ehc6yIDRRZ/JrOG6RbToMjsgBB+lI48bP9ZxSWINSfd8FbgNNITxP408uC1Fg==
X-Received: by 2002:a9d:7302:: with SMTP id e2mr401519otk.52.1636556241870;
        Wed, 10 Nov 2021 06:57:21 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u136sm4064oie.13.2021.11.10.06.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 06:57:21 -0800 (PST)
Date:   Wed, 10 Nov 2021 06:58:54 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Message-ID: <YYveLqgDUrizgC/Q@ripper>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
 <YYpMzau3CWRQYlkJ@gerhold.net>
 <20211110131507.GJ7231@dragon>
 <YYvSmEr/Fo2LPJwu@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYvSmEr/Fo2LPJwu@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Nov 06:09 PST 2021, Stephan Gerhold wrote:

> On Wed, Nov 10, 2021 at 09:15:11PM +0800, Shawn Guo wrote:
> > On Tue, Nov 09, 2021 at 11:26:21AM +0100, Stephan Gerhold wrote:
> > > On Tue, Nov 09, 2021 at 10:25:55AM +0800, Shawn Guo wrote:
> > > > Currently the enable state of smd-rpm clocks are not properly reported
> > > > back to framework due to missing .is_enabled and .is_prepared hooks.
> > > > This causes a couple of issues.
> > > > 
> > > > - All those unused clocks are not voted for off, because framework has
> > > >   no knowledge that they are unused.  It becomes a problem for vlow
> > > >   power mode support, as we do not have every single RPM clock claimed
> > > >   and voted for off by client devices, and rely on clock framework to
> > > >   disable those unused RPM clocks.
> > > > 
> > > 
> > > I posted a similar patch a bit more than a year ago [1].
> > 
> > Ouch, that's unfortunate!  If your patch landed, I wouldn't have had to
> > spend such a long time to figure out why my platform fails to reach vlow
> > power mode :(
> > 
> 
> Sorry, I was waiting for Stephen to reply and eventually decided to
> shift focus to other things first. :)
> 
> The whole low-power topic is kind of frustrating on older platforms
> because they currently still lack almost everything that is necessary to
> reach those low power states. Even things that you already consider
> natural for newer platforms (such as interconnect) are still very much
> work in progress on all older ones.
> 
> > > Back then one
> > > of the concerns was that we might disable critical clocks just because
> > > they have no driver using it actively. For example, not all of the
> > > platforms using clk-smd-rpm already have an interconnect driver.
> > > Disabling the interconnect related clocks will almost certainly make the
> > > device lock up completely. (I tried it back then, it definitely does...)
> > > 
> > > I proposed adding CLK_IGNORE_UNUSED for the interconnect related clocks
> > > back then [2] which would allow disabling most of the clocks at least.
> > > Stephen Boyd had an alternative proposal to instead move the
> > > interconnect related clocks completely out of clk-smd-rpm [3].
> > > But I'm still unsure how this would work in a backwards compatible way. [4]
> > > 
> > > Since your patches are more or less identical I'm afraid the same
> > > concerns still need to be solved somehow. :)
> > 
> > I do not really understand why smd-rpm clock driver needs to be a special
> > case.  This is a very common issue, mostly in device early support phase
> > where not all clock consumer drivers are ready.  Flag CLK_IGNORE_UNUSED
> > and kernel cmdline 'clk_ignore_unused' are created just for that.  Those
> > "broken" platforms should be booted with 'clk_ignore_unused' until they
> > have related consumer drivers in place.  IMHO, properly reporting enable
> > state to framework is definitely the right thing to do, and should have
> > been done from day one.
> > 
> 
> ... And therefore I think we should be careful with such changes,
> especially if they would prevent devices from booting completely.
> Unfortunately the users trying to make use of old platforms are also
> often the ones who might not be aware that they suddenly need
> "clk_ignore_unused" just to boot a system that was previously working
> (mostly) fine, except for the whole low-power topic.
> 
> I fully agree with you that disabling the unused clocks here is the
> right thing to do, but I think we should try to carefully flag the most
> important clocks in the driver to avoid causing too many regressions.
> 

I don't fancy the idea of forcing everyone to run with specific kernel
command line parameters - in particular not as a means to avoid
"regressions".

I think the only way around this problem is to figure out how to move
the clk disablement to sync_state - probably per clock driver.

Regards,
Bjorn
