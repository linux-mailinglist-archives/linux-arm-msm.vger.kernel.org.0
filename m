Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B0A55D21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 02:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfFZA4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 20:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:33128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbfFZA4s (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 20:56:48 -0400
Received: from localhost (unknown [172.104.248.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63D47208E3;
        Wed, 26 Jun 2019 00:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561510607;
        bh=IEdgHhVzO/KXfl1rhl0JQGR+FXQJwlwYb+hfIotRyw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OhyEESFkeURnMcVE7e+cjQoAuBwJalH3DtvaFQF6w5ZQwd6ohSqVQL+Z90iZ4CYoh
         bHHhX0ZUlxZo+KJ/YPDB1kvkZZU5HwHvBn/yDQRuUnPpzUITcW3M7S3+zD8Gc3GwgG
         IN6nZktvwZEW7/nALQ9AovCkj94cO3cOZ7Qi/EKs=
Date:   Wed, 26 Jun 2019 08:55:05 +0800
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     Muchun Song <smuchun@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Prateek Sood <prsood@codeaurora.org>,
        Mukesh Ojha <mojha@codeaurora.org>, gkohli@codeaurora.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        zhaowuyun@wingtech.com
Subject: Re: [PATCH v4] driver core: Fix use-after-free and double free on
 glue directory
Message-ID: <20190626005505.GD21530@kroah.com>
References: <20190516142342.28019-1-smuchun@gmail.com>
 <20190524190443.GB29565@kroah.com>
 <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
 <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
 <20190618152859.GB1912@kroah.com>
 <CAPSr9jFMKb1bQAbCFLqP2+fb60kcbyJ+cDspkL5FH28CNKFz3A@mail.gmail.com>
 <20190618161340.GA13983@kroah.com>
 <e3e064d85790a56b661ef9641e02c571540c6f44.camel@kernel.crashing.org>
 <CAPSr9jExG2C6U0D2TN-PUxgi9waD5QkSR-icxNPP1w9nJx3GUQ@mail.gmail.com>
 <ef566c4c2881c70d673e8a76c47084c2a024cd5e.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef566c4c2881c70d673e8a76c47084c2a024cd5e.camel@kernel.crashing.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 26, 2019 at 08:56:00AM +1000, Benjamin Herrenschmidt wrote:
> On Tue, 2019-06-25 at 23:06 +0800, Muchun Song wrote:
> > Benjamin Herrenschmidt <benh@kernel.crashing.org> 于2019年6月19日周三
> > 上午5:51写道：
> > > 
> > > On Tue, 2019-06-18 at 18:13 +0200, Greg KH wrote:
> > > > 
> > > > Again, I am totally confused and do not see a patch in an email
> > > > that
> > > > I
> > > > can apply...
> > > > 
> > > > Someone needs to get people to agree here...
> > > 
> > > I think he was hoping you would chose which solution you prefered
> > > here
> > 
> > Yeah, right, I am hoping you would chose which solution you prefered
> > here.
> > Thanks.
> > 
> > > :-) His original or the one I suggested instead. I don't think
> > > there's
> > > anybody else with understanding of sysfs guts around to form an
> > > opinion.
> > > 
> 
> Muchun, I don't think Greg still has the previous emails. He deals with
> too much to keep track of old stuff.
> 
> Can you send both patches tagged as [OPT1] and [OPT2] along with a
> comment in one go so Greg can see both and decide ?

That would be wonderful, thank you as I can't really find the "latest"
versions of both options.

> I think looking at the refcount is fragile, I might be wrong, but I
> think it mostly paper over the root of the problem which is the fact
> that the lock isn't taken accross both operations, thus exposing the
> race. But I'm happy if Greg prefers your approach as long as it's
> fixed.

I'll look at them and try to figure this out next week, thanks.

greg k-h
