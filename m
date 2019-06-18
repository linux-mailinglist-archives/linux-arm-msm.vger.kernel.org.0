Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 640AA4A38A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 16:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbfFROLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 10:11:18 -0400
Received: from gate.crashing.org ([63.228.1.57]:32992 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729743AbfFROLR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 10:11:17 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5IEB0wY002489;
        Tue, 18 Jun 2019 09:11:01 -0500
Message-ID: <03865a8c403d3f26aab65d758daa900ab175de08.camel@kernel.crashing.org>
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
Date:   Wed, 19 Jun 2019 00:11:00 +1000
In-Reply-To: <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
References: <20190516142342.28019-1-smuchun@gmail.com>
         <20190524190443.GB29565@kroah.com>
         <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
         <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2019-06-18 at 21:40 +0800, Muchun Song wrote:
> Ping guys ? I think this is worth fixing.

I agree :-)

My opinion hasn't changed though, the right fix isn't making guesses
based on the refcount but solve the actual race which is the mutex
being dropped between looking for the object existence and deciding to
create it :-)

Cheers,
Ben.

> Muchun Song <smuchun@gmail.com> 于2019年5月25日周六 下午8:15写道：
> 
> > 
> > Hi greg k-h,
> > 
> > Greg KH <gregkh@linuxfoundation.org> 于2019年5月25日周六 上午3:04写道：
> > > 
> > > On Thu, May 16, 2019 at 10:23:42PM +0800, Muchun Song wrote:
> > > > There is a race condition between removing glue directory and
> > > > adding a new
> > > > device under the glue directory. It can be reproduced in
> > > > following test:
> > > 
> > > <snip>
> > > 
> > > Is this related to:
> > >         Subject: [PATCH v3] drivers: core: Remove glue dirs early
> > > only when refcount is 1
> > > 
> > > ?
> > > 
> > > If so, why is the solution so different?
> > 
> > In the v1 patch, the solution is that remove glue dirs early only
> > when
> > refcount is 1. So
> > the v1 patch like below:
> > 
> > @@ -1825,7 +1825,7 @@ static void cleanup_glue_dir(struct device
> > *dev,
> > struct kobject *glue_dir)
> >                 return;
> > 
> >         mutex_lock(&gdp_mutex);
> > -       if (!kobject_has_children(glue_dir))
> > +       if (!kobject_has_children(glue_dir) && kref_read(&glue_dir-
> > >kref) == 1)
> >                 kobject_del(glue_dir);
> >         kobject_put(glue_dir);
> >         mutex_unlock(&gdp_mutex);
> > -----------------------------------------------------------------
> > ------
> > 
> > But from Ben's suggestion as below:
> > 
> > I find relying on the object count for such decisions rather
> > fragile as
> > it could be taken temporarily for other reasons, couldn't it ? In
> > which
> > case we would just fail...
> > 
> > Ideally, the looking up of the glue dir and creation of its child
> > should be protected by the same lock instance (the gdp_mutex in
> > that
> > case).
> > -----------------------------------------------------------------
> > ------
> > 
> > So another solution is used from Ben's suggestion in the v2 patch.
> > But
> > I forgot to update the commit message until the v4 patch. Thanks.
> > 
> > Yours,
> > Muchun

