Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066B1305D52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 14:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236906AbhA0Nfg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 08:35:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:59638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238502AbhA0NdS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 08:33:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C12A5207B1;
        Wed, 27 Jan 2021 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611754357;
        bh=Hvdj/TnKmUGUDvd5D0ucCsJxgPxWAmML6NC1NFEiusw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u15m2WoKpaM2iRwFCDTC0Id9jWPw061bwZFZVpyaROia9HdMUZpooYN6buBoxdlwy
         6NL+OCZ4TYv3aWLNwta4GI1HP+QQwqWP4lbYbH/HIzFjrmmoE268Uz7/dgLdi9COTS
         Kz7z8I8j1c9WoCqZbzrhR5Psr3s97OHDrK6ehxlE=
Date:   Wed, 27 Jan 2021 14:32:35 +0100
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
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 00/21] Move Hisilicon 6421v600 SPMI driver set out of
 staging
Message-ID: <YBFrc/yk7uvh9HX8@kroah.com>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
 <20210126175752.GF4839@sirena.org.uk>
 <YBBZP9LjXPi/rzfP@kroah.com>
 <20210126181124.GG4839@sirena.org.uk>
 <YBErBByYD8lNIWAX@kroah.com>
 <20210127120426.GB4387@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127120426.GB4387@sirena.org.uk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 27, 2021 at 12:04:26PM +0000, Mark Brown wrote:
> On Wed, Jan 27, 2021 at 09:57:40AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Jan 26, 2021 at 06:11:24PM +0000, Mark Brown wrote:
> 
> > > > Do you need a tag to pull from?
> 
> > > It'd be nice but not essential.
> 
> > Why do you want/need this?  Having these changes in your tree is good,
> > but what about other coding style cleanups that I will end up applying
> > over time before the 5.12-rc1 merge window opens?  Are you wanting to
> > take the moved driver in your tree, or something else?
> 
> I want to apply the regulator driver so I stop being sent this patch
> series which will help keep my backlog more manageable.
> 
> > Traditionally moving drivers out of staging can be done 2 ways:
> > 	- all happens in the staging tree, I take an ack from the
> > 	  subsystem maintainer that this is ok to do.
> > 	- A new driver enters the "real" subsystem tree, and then I
> > 	  delete the driver in the staging tree.  This doesn't preserve
> > 	  history as well (not at all), but can be easier for trees that
> > 	  move quickly (like networking.)
> 
> The whole reason the driver is in the staging tree is that Mauro has a
> requirement to do things in a way that preserves history and so won't
> send any non-incremental patches.

Ok, should we wait until after 5.12-rc1 is out then?

thanks,

greg k-h
