Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DC72CC439
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 18:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgLBRsb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 12:48:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:49646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgLBRsb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 12:48:31 -0500
Date:   Wed, 2 Dec 2020 18:48:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606931270;
        bh=in9+HhrSHbUIazSnYyXaNQUMHBqliz2pSrRo7QJUi5g=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=OMN9aGO9Ra9OWByl2hXXvMB9kPgOW3X3j7sPix+QfsKt8KL69sPoGbXbHwlfvf90q
         /K3/1q9mUR4Lq7O2mNBZMwt6MWKIUYYXPGRyzLIfV+1cVidIXOV3th/+sZj2SRgI4i
         dzi0vtvxOPYusI3U+teud2+Rx7oqJGJJTbId1KAE=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH 01/29] bus: mhi: Remove auto-start option
Message-ID: <X8fTiyyp30uFU5Bd@kroah.com>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
 <20201202094159.107075-2-manivannan.sadhasivam@linaro.org>
 <87pn3si4fu.fsf@codeaurora.org>
 <20201202162716.GA3033@thinkpad>
 <87eek8i1sk.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eek8i1sk.fsf@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 02, 2020 at 06:57:15PM +0200, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > On Wed, Dec 02, 2020 at 06:00:05PM +0200, Kalle Valo wrote:
> >> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> >> 
> >> > From: Loic Poulain <loic.poulain@linaro.org>
> >> >
> >> > There is really no point having an auto-start for channels.
> >> > This is confusing for the device drivers, some have to enable the
> >> > channels, others don't have... and waste resources (e.g. pre allocated
> >> > buffers) that may never be used.
> >> >
> >> > This is really up to the MHI device(channel) driver to manage the state
> >> > of its channels.
> >> >
> >> > While at it, let's also remove the auto-start option from ath11k mhi
> >> > controller.
> >> >
> >> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> >> > Acked-by: Kalle Valo <kvalo@codeaurora.org>
> >> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> > [mani: clubbed ath11k change]
> >> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> 
> >> Hmm, didn't we apply this already? At least I pulled the immutable
> >> branch to my tree:
> >> 
> >> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=526740b495059ebbc0c3c086dceca1263820fa4f
> >> 
> >> So if there's a new version of this patch (and a new commit id) the
> >> immutable branch I pulled is not immutable anymore.
> >
> > This is not a new version of the patch. The commit SHA of this patch in
> > immutable branch is ed5298c7d500abaf34ed7783969e953a1f028e5b and that is same
> > in mhi-next as well.
> >
> > Now I'm funneling all patches in mhi-next to mainline through Greg, so this
> > patch is part of the (MHI changes for v5.11) patch series. Perhaps you might be
> > dealing with pull requests to Dave/Jakub but since the MHI patch flow is usually
> > fairly low, Greg is happy with patch series.
> >
> > But since we are dealing with immutable branch I should send the pull request
> > to Greg now.
> 
> Yes, I very much prefer you send a pull request so that we can avoid
> conflicts between ath11k and mhi. If Greg would apply this patch as is,
> we would have two versions of the same commit (with different commit
> ids) and git would get confused.

git wouldn't get confused, we do merges like this all the time.

It would confuse developers, I get confused by this type of thing all
the time :)

I'll just do the pull instead to keep my sanity, git is fine...

thanks,

greg k-h
