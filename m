Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12982304D16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 00:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731550AbhAZXCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 18:02:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:43752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393971AbhAZSDW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 13:03:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB63A22228;
        Tue, 26 Jan 2021 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611684161;
        bh=BK2ao5kYzXCxcy1D2owWU3STiedR0YeC1K9uvhJ1CYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SppsyU7c8vQ/1xjj/G04Hcb9QmODrvXvXO7Xm2grGJWu3FKtlbOQ7sKdV14Wy8T33
         nJu0RdiUqBSUxLBdudClYd5m8qdNlalWax5AiHlHbgTWDMdDxPNARrQVxT4ZKj9rt0
         xcINjm9FJjkOPzGSNK3rDZpppSBm3nK1aFvdZgIo=
Date:   Tue, 26 Jan 2021 19:02:39 +0100
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
Message-ID: <YBBZP9LjXPi/rzfP@kroah.com>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
 <20210126175752.GF4839@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126175752.GF4839@sirena.org.uk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 26, 2021 at 05:57:52PM +0000, Mark Brown wrote:
> On Tue, Jan 26, 2021 at 06:54:57PM +0100, Greg Kroah-Hartman wrote:
> 
> > I've applied the first 13 patches, except for patch 3, as that did not
> > apply, to my tree, thanks.
> 
> Is there a branch we can pull from?

Once 0-day passes, you can pull from my staging-testing branch from
staging.git on git.kernel.org if you want.  Give it 24 hours to pass
before it hits that location.

Do you need a tag to pull from?

thanks,

greg k-h
