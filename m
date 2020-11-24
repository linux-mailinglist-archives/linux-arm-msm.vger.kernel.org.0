Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E212C336F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 22:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733221AbgKXVnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 16:43:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:44000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732980AbgKXVnj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 16:43:39 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59B54206E5;
        Tue, 24 Nov 2020 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606254218;
        bh=i6hbvXSQGJaCxcemC8oeN03qQ1XDrz8RB9bbPy6ICHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2o5Kf7D1A5gTiV8Nhz1O+8BEQi/wWC34FzTS5PI3TQQZffxbXmWetS43a7L52YofA
         KWSYuuapjz1kmlStNLltWbt79U8cNM/VUtLsX7fa9Zj5pHGuEU8z8L2GSmtyFijpKM
         mFULM7VSP0LZjXlRQml8/M2XHFMwVBmMHN4lmqng=
Date:   Tue, 24 Nov 2020 21:43:33 +0000
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
Message-ID: <20201124214332.GC14252@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
 <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
 <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
 <1c665e33d1d27263fb5056c16d30b827@codeaurora.org>
 <20201124111027.GA13151@willie-the-truck>
 <CAF6AEGuZ2YbY=ATFBX1KJw=LwhcpH8n+zzxckTHPwwopi6mOqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuZ2YbY=ATFBX1KJw=LwhcpH8n+zzxckTHPwwopi6mOqw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 24, 2020 at 11:05:39AM -0800, Rob Clark wrote:
> On Tue, Nov 24, 2020 at 3:10 AM Will Deacon <will@kernel.org> wrote:
> > On Tue, Nov 24, 2020 at 09:32:54AM +0530, Sai Prakash Ranjan wrote:
> > > On 2020-11-24 00:52, Rob Clark wrote:
> > > > On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
> > > > <saiprakash.ranjan@codeaurora.org> wrote:
> > > > > On 2020-11-23 20:51, Will Deacon wrote:
> > > > > > Modulo some minor comments I've made, this looks good to me. What is
> > > > > > the
> > > > > > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
> > > > > > the
> > > > > > MSM GPU driver and I'd like to avoid conflicts with that.
> > > > > >
> > > > >
> > > > > SMMU bits are pretty much independent and GPU relies on the domain
> > > > > attribute
> > > > > and the quirk exposed, so as long as SMMU changes go in first it
> > > > > should
> > > > > be good.
> > > > > Rob?
> > > >
> > > > I suppose one option would be to split out the patch that adds the
> > > > attribute into it's own patch, and merge that both thru drm and iommu?
> > > >
> > >
> > > Ok I can split out domain attr and quirk into its own patch if Will is
> > > fine with that approach.
> >
> > Why don't I just queue the first two patches on their own branch and we
> > both pull that?
> 
> Ok, that works for me.  I normally base msm-next on -rc1 but I guess
> as long as we base the branch on the older or our two -next branches,
> that should work out nicely

Turns out we're getting a v10 of Sai's stuff, so I've asked him to split
patch two up anyway. Then I'll make a branch based on -rc1 that we can
both pull.

Will
