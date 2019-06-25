Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3040655BBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 00:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFYW4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 18:56:11 -0400
Received: from gate.crashing.org ([63.228.1.57]:48041 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbfFYW4L (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 18:56:11 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5PMu1jN032528;
        Tue, 25 Jun 2019 17:56:02 -0500
Message-ID: <ef566c4c2881c70d673e8a76c47084c2a024cd5e.camel@kernel.crashing.org>
Subject: Re: [PATCH v4] driver core: Fix use-after-free and double free on
 glue directory
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Muchun Song <smuchun@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Prateek Sood <prsood@codeaurora.org>,
        Mukesh Ojha <mojha@codeaurora.org>, gkohli@codeaurora.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        zhaowuyun@wingtech.com
Date:   Wed, 26 Jun 2019 08:56:00 +1000
In-Reply-To: <CAPSr9jExG2C6U0D2TN-PUxgi9waD5QkSR-icxNPP1w9nJx3GUQ@mail.gmail.com>
References: <20190516142342.28019-1-smuchun@gmail.com>
         <20190524190443.GB29565@kroah.com>
         <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
         <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
         <20190618152859.GB1912@kroah.com>
         <CAPSr9jFMKb1bQAbCFLqP2+fb60kcbyJ+cDspkL5FH28CNKFz3A@mail.gmail.com>
         <20190618161340.GA13983@kroah.com>
         <e3e064d85790a56b661ef9641e02c571540c6f44.camel@kernel.crashing.org>
         <CAPSr9jExG2C6U0D2TN-PUxgi9waD5QkSR-icxNPP1w9nJx3GUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2019-06-25 at 23:06 +0800, Muchun Song wrote:
> Benjamin Herrenschmidt <benh@kernel.crashing.org> 于2019年6月19日周三
> 上午5:51写道：
> > 
> > On Tue, 2019-06-18 at 18:13 +0200, Greg KH wrote:
> > > 
> > > Again, I am totally confused and do not see a patch in an email
> > > that
> > > I
> > > can apply...
> > > 
> > > Someone needs to get people to agree here...
> > 
> > I think he was hoping you would chose which solution you prefered
> > here
> 
> Yeah, right, I am hoping you would chose which solution you prefered
> here.
> Thanks.
> 
> > :-) His original or the one I suggested instead. I don't think
> > there's
> > anybody else with understanding of sysfs guts around to form an
> > opinion.
> > 

Muchun, I don't think Greg still has the previous emails. He deals with
too much to keep track of old stuff.

Can you send both patches tagged as [OPT1] and [OPT2] along with a
comment in one go so Greg can see both and decide ?

I think looking at the refcount is fragile, I might be wrong, but I
think it mostly paper over the root of the problem which is the fact
that the lock isn't taken accross both operations, thus exposing the
race. But I'm happy if Greg prefers your approach as long as it's
fixed.

Cheers,
Ben.

