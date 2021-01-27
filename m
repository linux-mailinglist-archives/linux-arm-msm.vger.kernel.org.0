Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658FC305658
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 10:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhA0JAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 04:00:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:33802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233746AbhA0I60 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 03:58:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC32120759;
        Wed, 27 Jan 2021 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611737863;
        bh=CRsnxHURAngp2eekJSNGPVdgsCZ9RsnCKwPFaU4Sd6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zRObluJJlLWARaRpMYCN84a10arkVxS14A/oUfJ5UIAc5qjUwDPxyTz0p+S3i6468
         yO4j8HagADFhCkb5Bk9l0N7MJm/Npg12rxCX0U/rkl0ZxNxWpuHIGwOALhrSmqaNgs
         Hm/BAwV6hQrGeMdJhC2OPnaeyEP2lg2iCtSMs8HI=
Date:   Wed, 27 Jan 2021 09:57:40 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Mayulong <mayulong1@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-arm-msm@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Colin Ian King <colin.king@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 00/21] Move Hisilicon 6421v600 SPMI driver set out of
 staging
Message-ID: <YBErBByYD8lNIWAX@kroah.com>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
 <20210126175752.GF4839@sirena.org.uk>
 <YBBZP9LjXPi/rzfP@kroah.com>
 <20210126181124.GG4839@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126181124.GG4839@sirena.org.uk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 26, 2021 at 06:11:24PM +0000, Mark Brown wrote:
> On Tue, Jan 26, 2021 at 07:02:39PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Jan 26, 2021 at 05:57:52PM +0000, Mark Brown wrote:
> 
> > > Is there a branch we can pull from?
> 
> > Once 0-day passes, you can pull from my staging-testing branch from
> > staging.git on git.kernel.org if you want.  Give it 24 hours to pass
> > before it hits that location.
> 
> Thanks.

Should be out there now if you want to pull.

> > Do you need a tag to pull from?
> 
> It'd be nice but not essential.

Why do you want/need this?  Having these changes in your tree is good,
but what about other coding style cleanups that I will end up applying
over time before the 5.12-rc1 merge window opens?  Are you wanting to
take the moved driver in your tree, or something else?

Traditionally moving drivers out of staging can be done 2 ways:
	- all happens in the staging tree, I take an ack from the
	  subsystem maintainer that this is ok to do.
	- A new driver enters the "real" subsystem tree, and then I
	  delete the driver in the staging tree.  This doesn't preserve
	  history as well (not at all), but can be easier for trees that
	  move quickly (like networking.)

Which ever works for you is fine with me, but relying on the code to
stay "not touched" in my tree after you pull it almost never happens due
to the number of drive-by coding style cleanups that end up in the
staging tree every week.

thanks,

greg k-h
