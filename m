Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7818230583B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 11:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbhA0KWZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 05:22:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:49904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235793AbhA0KUU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 05:20:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7AF320723;
        Wed, 27 Jan 2021 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611742779;
        bh=d2h1EgBQMOjE5+8onjr7Xk6n8e+j+afxZeaitVsthDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d3XzXb/8FnxZ1Z+z/5HUsE1VWiFD1iFv7la249QYlq0mttvihgZY54uYl71wX/v3J
         rZnaGR6hUIp5u8D7f9DT9gQ1py/w3RRjWVJ96amv9pSOuUeGKhWT2FHh4iLA7tSVxv
         VYBz7WHULvVOjJ0hVgvY+RJayodaHXT6vS0A7tgE=
Date:   Wed, 27 Jan 2021 11:19:36 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mayulong <mayulong1@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-arm-msm@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 00/21] Move Hisilicon 6421v600 SPMI driver set out of
 staging
Message-ID: <YBE+OFwLj31qo/ss@kroah.com>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
 <20210126175752.GF4839@sirena.org.uk>
 <YBBZP9LjXPi/rzfP@kroah.com>
 <20210126181124.GG4839@sirena.org.uk>
 <YBErBByYD8lNIWAX@kroah.com>
 <20210127100816.GH4903@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127100816.GH4903@dell>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 27, 2021 at 10:08:16AM +0000, Lee Jones wrote:
> On Wed, 27 Jan 2021, Greg Kroah-Hartman wrote:
> 
> > On Tue, Jan 26, 2021 at 06:11:24PM +0000, Mark Brown wrote:
> > > On Tue, Jan 26, 2021 at 07:02:39PM +0100, Greg Kroah-Hartman wrote:
> > > > On Tue, Jan 26, 2021 at 05:57:52PM +0000, Mark Brown wrote:
> > > 
> > > > > Is there a branch we can pull from?
> > > 
> > > > Once 0-day passes, you can pull from my staging-testing branch from
> > > > staging.git on git.kernel.org if you want.  Give it 24 hours to pass
> > > > before it hits that location.
> > > 
> > > Thanks.
> > 
> > Should be out there now if you want to pull.
> > 
> > > > Do you need a tag to pull from?
> > > 
> > > It'd be nice but not essential.
> > 
> > Why do you want/need this?  Having these changes in your tree is good,
> > but what about other coding style cleanups that I will end up applying
> > over time before the 5.12-rc1 merge window opens?  Are you wanting to
> > take the moved driver in your tree, or something else?
> > 
> > Traditionally moving drivers out of staging can be done 2 ways:
> > 	- all happens in the staging tree, I take an ack from the
> > 	  subsystem maintainer that this is ok to do.
> > 	- A new driver enters the "real" subsystem tree, and then I
> > 	  delete the driver in the staging tree.  This doesn't preserve
> > 	  history as well (not at all), but can be easier for trees that
> > 	  move quickly (like networking.)
> > 
> > Which ever works for you is fine with me, but relying on the code to
> > stay "not touched" in my tree after you pull it almost never happens due
> > to the number of drive-by coding style cleanups that end up in the
> > staging tree every week.
> 
> I would have expected the whole set to be merged as a set into a
> single tree, placed on an immutable branch and a pull-request to be
> sent out for the other maintainers to pull from (if they so wished).
> 
> This would ensure development could continue on any/all of the
> affected drivers/files.
> 
> If it's not too late, I'd be more than happy to facilitate.

Given these patches are already in my public tree, that might be a bit
harder, why the huge work for this?  Worst case, I just keep all of the
patches that do not actually move the code in my tree, and then things
can move after 5.12-rc1.

thanks,

greg k-h
