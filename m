Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA7F311CA7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 11:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhBFKqG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Feb 2021 05:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhBFKqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Feb 2021 05:46:03 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1258EC061756
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Feb 2021 02:45:23 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id m6so6104520pfk.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Feb 2021 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v7g6iYD4a+ldej/OxPdZv/D/jsDtfKWVskL7H6xJ7L8=;
        b=ZM+MIrBaMZDpFDE0Gjxs0SIg1PXAeHyZjLbzSwXSG9nqRU9vcb9EfYU8pMtWjDlylO
         BFck0Ub8PbEilo4FvdeWi//vADcwcGeUyDUsyiHKH8Fz9486bnSoKqVLpTLzTaScSV4D
         MC8RpDFFP0yb2FcPjBBJ4gJhkh9HVUGt/TO2P/p3aoTgBvT7v6GfmX8sL1uapVN/9FOl
         OuOCPmqEeMccarFnuMok5e6Ry4sorp+Nk2HTKEagJ8Dq/iGlNr2h6qlDXdY+sIfHAj2A
         Zv6TNEPg4lLu3lj0+uN81u903gZE7pebPqx7krtxLh4doVprIsARF+z6Uqvxr/F4+SrM
         dqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v7g6iYD4a+ldej/OxPdZv/D/jsDtfKWVskL7H6xJ7L8=;
        b=gCUKGI4+kknMZLWCXojFpnIHFfEeQGJsw2FHksgIGMZy6sPCuUT96YpQgd8vpeHMXk
         o6EPEb+cFxR2EGIbXKvb+f0G3X/2ggg9nVy25loa/2gYNVBbQ/t8cH1N7pLBne2FrNX0
         XCwyVMKAILwAd/LVroHf9F26LMi4mNjpaboG78IQP+eWuTGrqiEiZQSYZiJFGs1ad9D4
         d2BOudrZQQ5qGmQFIkv3nyVDTsT2kfL7I774gu8cOXFLf+2Imj3IQ7lBR73+M4ngCXu4
         x0v+hN+11ttrNDXJZ53Dxy9ntcdL2o6HS/c7RUr2mtVPbfZDqtCxLtfUf1Cmtz5z7Ikt
         aUnw==
X-Gm-Message-State: AOAM532fYTlPLcXRy/+heH51egSh3OJ4he5KlOTFyRnnvl53R7PDLs4m
        VZW7MUeIGNC3imPOCodFRwnQ8A==
X-Google-Smtp-Source: ABdhPJykQdePL2I4KeC4QoO1pgMj2lxWrgcUC7yiajkjRBul0O9o6VUQ0GgumH4TVAz6NtbK4IDXBQ==
X-Received: by 2002:a62:ee09:0:b029:1c0:ba8c:fcea with SMTP id e9-20020a62ee090000b02901c0ba8cfceamr8751330pfi.7.1612608322484;
        Sat, 06 Feb 2021 02:45:22 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z11sm10990642pjn.5.2021.02.06.02.45.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Feb 2021 02:45:21 -0800 (PST)
Date:   Sat, 6 Feb 2021 18:45:15 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64/acpi: disallow writeable AML opregion
 mapping for EFI code regions
Message-ID: <20210206104514.GB27503@dragon>
References: <20200626155832.2323789-1-ardb@kernel.org>
 <20200626155832.2323789-3-ardb@kernel.org>
 <20210206031145.GA27503@dragon>
 <CAMj1kXHSkBcSDuHbsFMJjC89JrO8TxYUoabDmWerNp27s45Ngw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHSkBcSDuHbsFMJjC89JrO8TxYUoabDmWerNp27s45Ngw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Feb 06, 2021 at 09:10:19AM +0100, Ard Biesheuvel wrote:
> On Sat, 6 Feb 2021 at 04:11, Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > Hi Ard,
> >
> > On Fri, Jun 26, 2020 at 05:58:32PM +0200, Ard Biesheuvel wrote:
> > > Given that the contents of EFI runtime code and data regions are
> > > provided by the firmware, as well as the DSDT, it is not unimaginable
> > > that AML code exists today that accesses EFI runtime code regions using
> > > a SystemMemory OpRegion. There is nothing fundamentally wrong with that,
> > > but since we take great care to ensure that executable code is never
> > > mapped writeable and executable at the same time, we should not permit
> > > AML to create writable mapping.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > I'm booting Lenovo Flex 5G laptop with ACPI, and seeing this change
> > causes a memory abort[1] when upgrading ACPI tables via initrd[2].
> > Dropping this change seems to fix the issue for me.  But does that
> > looks like a correct fix to you?
> >
> > Shawn
> >
> > [1] https://fileserver.linaro.org/s/iDe9SaZeNNkyNxG
> > [2] Documentation/admin-guide/acpi/initrd_table_override.rst
> >
> 
> Can you check whether reverting
> 
> 32cf1a12cad43358e47dac8014379c2f33dfbed4
> 
> fixes the issue too?

Yes, it does.

> If it does, please report this as a regression. The OS should not
> modify firmware provided tables in-place, regardless of how they were
> delivered.
> 
> BTW I recently started using my Yoga C630 with Debian, and I am quite
> happy with it! Thanks a lot for spending the time on the installer
> etc.

Cool, glad to hear that!

Shawn
