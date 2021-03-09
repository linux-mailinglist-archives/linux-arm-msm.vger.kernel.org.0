Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D5D331D71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 04:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhCIDXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 22:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhCIDXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 22:23:07 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3C7C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 19:22:55 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id 30so1312166ple.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 19:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a3Pw9lp9/ZAFdwTOb1S2bgPAA0lghUNsk5cDPcxdpiE=;
        b=HZ7pbJEU03fnCJVoGWA8n8LnqM9Cu8S1Dt1tymQgzPGukeBPr2LKfb6wftHAiTkTtq
         JlkM307WAYUqGovnS2lW6zVlkdvIKcRRK6SoFkXMFF13T1JZWpQHDcd70/2I9JuoAw0i
         9B/IWqqsKBoTbFxgc7oQXffml4ndEOPM3ZvhN5etLOFHLJhSF+B2Ew0l8l60xDFGSXzC
         WA/hcO1NbGoUt/SdJjyVQMpRj9ZSzsb7p9OyzVUa+NYJWAgyS534CSRR9uDUwiZ5bMz5
         /AQtaXRmWa+TbTeXniOFa7q0qV+B4LRdtH3DyPHghKdSE3KmSPIk2TH3RwMg9fujJnIB
         BLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a3Pw9lp9/ZAFdwTOb1S2bgPAA0lghUNsk5cDPcxdpiE=;
        b=BnUhbpjHperd6s79jCSL6ijAjie6B2rnawWmZAz0T26hOQqrXmI1Sv/+FGAOw86gGp
         TIQ96WKVYC5Z/qW7JXdTzMhSkdoCC3940HXGz1a3icfg8ggAF5/CWiqmZUyqQtOYxHZL
         PA6MEMyPbGf55GCXXLOV9ZouMeEAVCjkhfcPulaGs0l7pfWDB69LjIKAP7o+I2zIsEWw
         4nLBoQDIGV8a4c/KFo/Ki5wNfVv/wxyYNf8OpMqQg+UoJ/ZeBwP76HTZppjkawOysnWV
         FrTZKeXiJSADK+9+stBxzx8+Upcx2tdJX/o0o5ZayT+wr5rpE4JTY0OoQZCgnrlm/J/X
         fX1w==
X-Gm-Message-State: AOAM530nk9tgFZ1Huf8fjafpKJ5k5+9c4ki8u+M8xlyB53HAw9v4Ltsh
        +/jmrv06SnyKMusiFDwZY5nSqA==
X-Google-Smtp-Source: ABdhPJzQPN6qOWYJpZXhJTkprosApnqdCWirOWsTJcBeXA7z5PufsomIQdiU4i39K54G/14+pKSS8Q==
X-Received: by 2002:a17:90a:a789:: with SMTP id f9mr2446391pjq.192.1615260175264;
        Mon, 08 Mar 2021 19:22:55 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p17sm3324377pfn.62.2021.03.08.19.22.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 19:22:54 -0800 (PST)
Date:   Tue, 9 Mar 2021 11:22:49 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-efi <linux-efi@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Leif Lindholm <leif@nuviainc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] efi: stub: override RT_PROP table supported mask based
 on EFI variable
Message-ID: <20210309032248.GR17424@dragon>
References: <20210306113519.294287-1-ardb@kernel.org>
 <20210307110228.GP17424@dragon>
 <CAMj1kXFiqXwCqJE9Wxu-tc3HYSh1qCqPLL_Csc=gW6SOYrweWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFiqXwCqJE9Wxu-tc3HYSh1qCqPLL_Csc=gW6SOYrweWw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 08, 2021 at 02:34:48PM +0100, Ard Biesheuvel wrote:
> On Sun, 7 Mar 2021 at 12:02, Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > On Sat, Mar 06, 2021 at 12:35:19PM +0100, Ard Biesheuvel wrote:
> > > Allow EFI systems to override the set of supported runtime services
> > > declared via the RT_PROP table, by checking for the existence of a
> > > 'OverrideSupported' EFI variable of the appropriate size under the
> > > RT_PROP table GUID, and if it does, combine the supported mask using
> > > logical AND. (This means the override can only remove support, not
> > > add it back).
> > >
> > > Cc: Jeffrey Hugo <jhugo@codeaurora.org>,
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Shawn Guo <shawn.guo@linaro.org>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Leif Lindholm <leif@nuviainc.com>
> > > Cc: linux-arm-msm@vger.kernel.org
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Awesome, Ard!  On both Lenovo Yoga C630 and Flex 5G latops:
> >
> > Tested-by: Shawn Guo <shawn.guo@linaro.org>
> >
> > With 'OverrideSupported' EFI variable added from UEFI Shell, we can drop
> > 'efi=novamap' kernel cmdline and get around the broken poweroff runtime
> > services nicely.  Thanks!
> >
> 
> Thanks for confirming.
> 
> However, I am not going to merge this without some justification, and
> hopefully some input from other folks (Leif?)
> 
> RTPROP already provides what we need on all platforms that use
> DtbLoader, and the patch for that is queued up for v5.12-rcX, with a
> cc:stable to v5.10. This allows any RT service to be marked as
> disabled, including SetVirtualAddressMap().
> 
> So afaict, that means that this patch would be a special case for
> Flex5G, right?

It's for all Snapdragon based laptops, as we need to disable
SetVirtualAddressMap runtime services on all of them.

> So how are platforms such as this one going to load the
> DTB? If some loader will be involved (or even just GRUB),

Yes, GRUB.

> shouldn't it
> be that component that sets RTPROP like DtbLoader will, not the kernel
> itself.
> 
> Btw I don't think ACPI boot is a use case here. I don't see a software
> framebuffer with no wifi support as a usage mode that justifies
> carrying EFI stub hacks for everyone.

Okay.  I'm fine to carry it as an out-of-tree patch until someday you
consider ACPI boot is useful for everyone.  But I do boot these laptops
with ACPI at daily basis right now as arm64 native build machine, with
USB Ethernet adapter.

Shawn
