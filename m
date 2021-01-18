Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E812FACD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 22:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394850AbhARVj7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 16:39:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:53238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394848AbhARVj4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 16:39:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A445F22228;
        Mon, 18 Jan 2021 21:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611005955;
        bh=hZGvlx0rTFWGHIvxW7kbih2fSYuihcEgOha/kURQuPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jp06HBfropG91/R5WFdHNzu0EWvsb+pj9GWKZ8IlRJ0qrRse6XSSOJFucNFaOcnam
         KBWT79MxSF01dkdzcWpp6IDTGDwqxuK4veFoy25IWvhVTDi08ZrR0BJzzLE8bhvylu
         rJM/iUpTZL6WtelaHw511Ovsgbpn0RnNExD/qQjFcC9hAC/yQAGUsX6iS7J+Rd3A08
         fdt4RZS1rS6ZYDJy/HX+KaYrBJUQZJwuLTy1QE8ZTtMkEaqx7Yshj+6gCllk+9uM+r
         C4nqmsfz0AeiHO0wUQP9XZuOEHdRRThA5QmhYwubDsqbOfQGNAn4esiuGhxXaRb9Cb
         PZiZFELeYw6xg==
Date:   Mon, 18 Jan 2021 21:39:10 +0000
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        pdaly@codeaurora.org,
        Android Kernel Team <kernel-team@android.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Pratik Patel <pratikp@codeaurora.org>
Subject: Re: [PATCH v2 5/7] drm/msm: Add dependency on io-pgtable-arm format
 module
Message-ID: <20210118213909.GA17971@willie-the-truck>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-6-git-send-email-isaacm@codeaurora.org>
 <CAF6AEGunsv5r_DmNsMbYwa4KQxRmK9J+5Bd12LYG4pQ=hrCe4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGunsv5r_DmNsMbYwa4KQxRmK9J+5Bd12LYG4pQ=hrCe4Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 18, 2021 at 01:16:03PM -0800, Rob Clark wrote:
> On Mon, Dec 21, 2020 at 4:44 PM Isaac J. Manjarres
> <isaacm@codeaurora.org> wrote:
> >
> > The MSM DRM driver depends on the availability of the ARM LPAE io-pgtable
> > format code to work properly. In preparation for having the io-pgtable
> > formats as modules, add a "pre" dependency with MODULE_SOFTDEP() to
> > ensure that the io-pgtable-arm format module is loaded before loading
> > the MSM DRM driver module.
> >
> > Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> 
> Thanks, I've queued this up locally

I don't plan to make the io-pgtable code modular, so please drop this patch.

https://lore.kernel.org/r/20210106123428.GA1798@willie-the-truck

Will
