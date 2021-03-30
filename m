Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC52734E480
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 11:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhC3JfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 05:35:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231802AbhC3Jej (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 05:34:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 517D96196A;
        Tue, 30 Mar 2021 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617096878;
        bh=sHCKH0VrxIQRknBZUe53hpu6+EWa87sqvxZc/EQqBWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=irmAXxbnLzYb3QuyRYDJ+n/7qzDQ3+YVJbjzYT9Ux6oij7W/7ziAd7JJvQQLofZBO
         aOBM8wDdjL7MOOuFnmAUQkxEdDq4EX6TPRWkdu1ldABibJPam7o3aIzbYyGKI6gXrj
         XIPwOXR882gwj4oAgO8xNctjRaA6crsK+VREY8AAFC7rZDMSaYohZ1U3rbVCimPcSX
         wSw5xmz15x5ljjEHxJ3oBbc1dA1QJpcgboyvDgQ0xBonEicG/X5+ZU6dmFsdeZLm6K
         eaXRRpn4jaTfwvePjhzdqBz8qn+/30gMI9v5LTCV9vVIqfGKFL60BctrE8c5rW3SDK
         oWVCTARuQY58g==
Date:   Tue, 30 Mar 2021 10:34:33 +0100
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
Message-ID: <20210330093432.GB5281@willie-the-truck>
References: <20210326231303.3071950-1-eric@anholt.net>
 <20210329144729.GB4203@willie-the-truck>
 <CAF6AEGugpEk396DVtWX=W+uf3p-wcgBfCSpSLWGQJE1vKpJ4aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGugpEk396DVtWX=W+uf3p-wcgBfCSpSLWGQJE1vKpJ4aw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 29, 2021 at 09:02:50PM -0700, Rob Clark wrote:
> On Mon, Mar 29, 2021 at 7:47 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> > > db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> > > the GPU from wedging and then sometimes wedging the kernel after a
> > > page fault), but it doesn't have separate pagetables support yet in
> > > drm/msm so we can't go all the way to the TTBR1 path.
> >
> > What do you mean by "doesn't have separate pagetables support yet"? The
> > compatible string doesn't feel like the right way to determine this.
> 
> the compatible string identifies what it is, not what the sw
> limitations are, so in that regard it seems right to me..

Well it depends on what "doesn't have separate pagetables support yet"
means. I can't tell if it's a hardware issue, a firmware issue or a driver
issue.

Will
