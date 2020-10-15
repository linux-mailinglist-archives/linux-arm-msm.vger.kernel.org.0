Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D49A28F2BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 14:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgJOMy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 08:54:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:52478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgJOMy2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 08:54:28 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48B7D22255;
        Thu, 15 Oct 2020 12:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602766467;
        bh=NcUL1CTctdE7P/Sj8XsgJi8V3Z0bZe+mgD0cuXp52DQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M1mYj4CzGCgMh9p2hUTnktuqWiAKyeNB7WQrv5jgEqX0PaMvspxq+c0nv6+BQ5rJ/
         1FiRegvPIrZ8pVBCaGaohLiN51MH2T3yTqbBrv0tUP32dEZ0d9BlIw/lDu6gZJlfB4
         jEf6ZUUniXW3Nr2GA7zO+JqjzUqA4b74kuBTC08o=
Date:   Thu, 15 Oct 2020 14:55:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Some small cleanup/fixes for SPMI driver
Message-ID: <20201015125500.GA4026727@kroah.com>
References: <cover.1601360391.git.mchehab+huawei@kernel.org>
 <160167373743.310579.11803841154320142421@swboyd.mtv.corp.google.com>
 <20201003105653.GA117381@kroah.com>
 <160271079652.884498.2384315265584338952@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160271079652.884498.2384315265584338952@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 14, 2020 at 02:26:36PM -0700, Stephen Boyd wrote:
> Quoting Greg Kroah-Hartman (2020-10-03 03:56:53)
> > On Fri, Oct 02, 2020 at 02:22:17PM -0700, Stephen Boyd wrote:
> > > Quoting Mauro Carvalho Chehab (2020-09-28 23:22:11)
> > > > Hi Stephen,
> > > > 
> > > > While double-checking against yesterday's linux-next, I noticed
> > > > that those two patches weren't merge yet. 
> > > > 
> > > > As you replied to both with your Reviewed-by:, are you expecting
> > > > them to be merged via someone's tree, or are you intending
> > > > to merge them via your tree?
> > > 
> > > Per the maintainers file I am a reviewer not a maintainer of SPMI.
> > > Usually Greg applies patches here. I can collect patches and send them
> > > on up if that helps.
> > 
> > Who is the maintainer?  Having a "reviewer only" is confusing to
> > everyone involved, as you might have someone who can review patches, but
> > no one to actually merge them anywhere?
> > 
> > Not a good situation :(
> > 
> 
> Ok. I can spin up an SPMI tree on kernel.org and make this change to the
> MAINTAINERS file (plus whatever tree path I can make). Do you want me to
> send you patches in email form as a pull request? I imagine the patch
> load will be fairly low.

email form is great, I can handle those easily.  IF you really want to
create a git tree, I can pull from that too, but for low-volume stuff,
it's usually not worth it.

thanks,

greg k-h
