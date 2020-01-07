Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C67B132A46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 16:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgAGPod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 10:44:33 -0500
Received: from 8bytes.org ([81.169.241.247]:59260 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbgAGPod (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 10:44:33 -0500
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 5DF506A3; Tue,  7 Jan 2020 16:44:31 +0100 (CET)
Date:   Tue, 7 Jan 2020 16:44:29 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, bjorn.andersson@linaro.org, agross@kernel.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/qcom: fix NULL pointer dereference during probe
 deferral
Message-ID: <20200107154429.GE30750@8bytes.org>
References: <20200101033949.755-1-masneyb@onstation.org>
 <20200107132530.GC30750@8bytes.org>
 <20200107140013.GA9084@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107140013.GA9084@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 07, 2020 at 09:00:14AM -0500, Brian Masney wrote:
> On Tue, Jan 07, 2020 at 02:25:30PM +0100, Joerg Roedel wrote:
> > On Tue, Dec 31, 2019 at 10:39:49PM -0500, Brian Masney wrote:
> > >  drivers/iommu/qcom_iommu.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > Shortened commit-message a bit and applied for v5.5, thanks.
> 
> You might want to hold off on applying this since it looks like Robin
> Murphy has a better fix.
> 
> https://lore.kernel.org/lkml/fc055443-8716-4a0e-b4d5-311517d71ea0@arm.com/

Alright, thanks for the heads-up. I dropped that patch from my fixes
branch.

Regards,

	Joerg
