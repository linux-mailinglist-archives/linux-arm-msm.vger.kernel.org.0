Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920891D7D30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 17:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgERPp2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 11:45:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbgERPp2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 11:45:28 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E63920657;
        Mon, 18 May 2020 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589816727;
        bh=lkx1dqDKnZ+7YQ40oS1fSOiu3vaTshH77dFDIsJ7zpY=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=1R3PT4Fh7iXsD1dBKDsTA2zU+v6Fh9XxL6QeojwFzCuedeAidtnj708jw4tqa4daW
         WQzvXD/kyiA6nLQ/cGC3LCXT/X1PHq4EszC5UwDZfsIpkO7JTCeIkjtPCyXP0PWYuV
         HoXh0/YZGhjrBX0kbc703WUMPr7fTluicvDCKH8s=
Date:   Mon, 18 May 2020 16:45:23 +0100
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
Message-ID: <20200518154522.GN32394@willie-the-truck>
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
 <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <20200507125357.GA31783@willie-the-truck>
 <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
 <CAF6AEGvuHKObTR97XdSXjmjKB+qjQ8N1_wxM=ZU8bEkF=cXp-A@mail.gmail.com>
 <20200511173008.GA24282@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511173008.GA24282@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 11:30:08AM -0600, Jordan Crouse wrote:
> On Fri, May 08, 2020 at 08:40:40AM -0700, Rob Clark wrote:
> > On Fri, May 8, 2020 at 8:32 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Thu, May 7, 2020 at 5:54 AM Will Deacon <will@kernel.org> wrote:
> > > >
> > > > On Thu, May 07, 2020 at 11:55:54AM +0100, Robin Murphy wrote:
> > > > > On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
> > > > > > On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
> > > > > > > Add stall implementation hook to enable stalling
> > > > > > > faults on QCOM platforms which supports it without
> > > > > > > causing any kind of hardware mishaps. Without this
> > > > > > > on QCOM platforms, GPU faults can cause unrelated
> > > > > > > GPU memory accesses to return zeroes. This has the
> > > > > > > unfortunate result of command-stream reads from CP
> > > > > > > getting invalid data, causing a cascade of fail.
> > > > >
> > > > > I think this came up before, but something about this rationale doesn't add
> > > > > up - we're not *using* stalls at all, we're still terminating faulting
> > > > > transactions unconditionally; we're just using CFCFG to terminate them with
> > > > > a slight delay, rather than immediately. It's really not clear how or why
> > > > > that makes a difference. Is it a GPU bug? Or an SMMU bug? Is this reliable
> > > > > (or even a documented workaround for something), or might things start
> > > > > blowing up again if any other behaviour subtly changes? I'm not dead set
> > > > > against adding this, but I'd *really* like to have a lot more confidence in
> > > > > it.
> > > >
> > > > Rob mentioned something about the "bus returning zeroes" before, but I agree
> > > > that we need more information so that we can reason about this and maintain
> > > > the code as the driver continues to change. That needs to be a comment in
> > > > the driver, and I don't think "but android seems to work" is a good enough
> > > > justification. There was some interaction with HUPCF as well.
> > >
> > > The issue is that there are multiple parallel memory accesses
> > > happening at the same time, for example CP (the cmdstream processor)
> > > will be reading ahead and setting things up for the next draw or
> > > compute grid, in parallel with some memory accesses from the shader
> > > which could trigger a fault.  (And with faults triggered by something
> > > in the shader, there are *many* shader threads running in parallel so
> > > those tend to generate a big number of faults at the same time.)
> > >
> > > We need either CFCFG or HUPCF, otherwise what I have observed is that
> > > while the fault happens, CP's memory access will start returning
> > > zero's instead of valid cmdstream data, which triggers a GPU hang.  I
> > > can't say whether this is something unique to qcom's implementation of
> > > the smmu spec or not.
> > >
> > > *Often* a fault is the result of the usermode gl/vk/cl driver bug,
> > > although I don't think that is an argument against fixing this in the
> > > smmu driver.. I've been carrying around a local patch to set HUPCF for
> > > *years* because debugging usermode driver issues is so much harder
> > > without.  But there are some APIs where faults can be caused by the
> > > user's app on top of the usermode driver.
> > >
> > 
> > Also, I'll add to that, a big wish of mine is to have stall with the
> > ability to resume later from a wq context.  That would enable me to
> > hook in the gpu crash dump handling for faults, which would make
> > debugging these sorts of issues much easier.  I think I posted a
> > prototype of this quite some time back, which would schedule a worker
> > on the first fault (since there are cases where you see 1000's of
> > faults at once), which grabbed some information about the currently
> > executing submit and some gpu registers to indicate *where* in the
> > submit (a single submit could have 100's or 1000's of draws), and then
> > resumed the iommu cb.
> > 
> > (This would ofc eventually be useful for svm type things.. I expect
> > we'll eventually care about that too.)
> 
> Rob is right about HUPCF. Due to the parallel nature of the command processor
> there is always a very good chance that a CP access is somewhere in the bus so
> any pagefault is usually a death sentence. The GPU context bank would always
> want HUPCF set to 1.

So this sounds like an erratum to me, and I'm happy to set HUPCF if we
detect the broken implementation. However, it will need an entry in
Documentation/arm64/silicon-errata.rst and a decent comment in the driver
to explain what we're doing and why.

Thanks,

Will
