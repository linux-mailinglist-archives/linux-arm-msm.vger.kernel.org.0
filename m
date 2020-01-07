Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F4E132840
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 15:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgAGOAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 09:00:15 -0500
Received: from onstation.org ([52.200.56.107]:59478 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727658AbgAGOAP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 09:00:15 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 640D53EE6F;
        Tue,  7 Jan 2020 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1578405614;
        bh=F6/bC3WaEdJIW6MX3Lz//wft6IJlpoSxsTV7q3G+ET0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OwKjuKYc5PBpQN6DascPHMtS70Wop9JG59kZqpgakYCOjrEbYgMMrxTUlcKPbz0Fm
         hTn4Idz97xS9Yb5Q/3v/HskYI0L4VttgS6RrDIxSVXNCeoCiWHDYMr+EYD1xR/+x0d
         k4qZI6kJ6yZguJHqmedjvPx9S76EAU6roaqNetnc=
Date:   Tue, 7 Jan 2020 09:00:14 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     robdclark@gmail.com, bjorn.andersson@linaro.org, agross@kernel.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/qcom: fix NULL pointer dereference during probe
 deferral
Message-ID: <20200107140013.GA9084@onstation.org>
References: <20200101033949.755-1-masneyb@onstation.org>
 <20200107132530.GC30750@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107132530.GC30750@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 07, 2020 at 02:25:30PM +0100, Joerg Roedel wrote:
> On Tue, Dec 31, 2019 at 10:39:49PM -0500, Brian Masney wrote:
> >  drivers/iommu/qcom_iommu.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> Shortened commit-message a bit and applied for v5.5, thanks.

You might want to hold off on applying this since it looks like Robin
Murphy has a better fix.

https://lore.kernel.org/lkml/fc055443-8716-4a0e-b4d5-311517d71ea0@arm.com/

Brian

