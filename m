Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E05D195A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 01:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfEIXWZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 19:22:25 -0400
Received: from gate.crashing.org ([63.228.1.57]:58675 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726108AbfEIXWZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 19:22:25 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x49NMF3O027885;
        Thu, 9 May 2019 18:22:16 -0500
Message-ID: <73b783e634551420dfa249816514fb31ed3487b6.camel@kernel.crashing.org>
Subject: Re: [PATCH] driver core: Fix use-after-free and double free on glue
 directory
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Gaurav Kohli <gkohli@codeaurora.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Muchun Song <smuchun@gmail.com>
Cc:     rafael@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
        zhaowuyun@wingtech.com, linux-arm-msm@vger.kernel.org
Date:   Fri, 10 May 2019 09:22:14 +1000
In-Reply-To: <e79201c2-a00b-d226-adc2-62769ae1ad81@codeaurora.org>
References: <20190423143258.96706-1-smuchun@gmail.com>
         <24b0fff3775147c04b006282727d94fea7f408b4.camel@kernel.crashing.org>
         <CAPSr9jHhwASv7=83hU+81mC0JJyuyt2gGxLmyzpCOfmc9vKgGQ@mail.gmail.com>
         <a37e7a49c3e7fa6ece2be2b76798fef3e51ade4e.camel@kernel.crashing.org>
         <CAPSr9jHCVCHNK+AmKkUBgs4dPC0UC5KdYKqMinkauyL3OL6qrQ@mail.gmail.com>
         <79fbc203bc9fa09d88ab2c4bff8635be4c293d49.camel@kernel.crashing.org>
         <CAPSr9jHw9hgAZo2TuDAKdSLEG1c6EtJG005MWxsxfnbsk1AXow@mail.gmail.com>
         <20190504153440.GB19654@kroah.com>
         <e79201c2-a00b-d226-adc2-62769ae1ad81@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2019-05-09 at 20:08 +0530, Gaurav Kohli wrote:
> Hi ,
> 
> Last patch will serialize the addition of child to parent directory, 
> won't it affect performance.

I doubt this is a significant issue, and there's already a global lock
taken once or twice in that path, the fix is purely to make sure that
the some locked section is used both for the lookup and the addition as
the bug comes from the window in between those two operations allowing
the object to be removed after it was "found".

Cheers,
Ben.
 
> 
> Regards
> Gaurav
> 
> On 5/4/2019 9:04 PM, Greg KH wrote:
> > On Sat, May 04, 2019 at 10:47:07PM +0800, Muchun Song wrote:
> > > Benjamin Herrenschmidt <benh@kernel.crashing.org> 于2019年5月2日周四
> > > 下午2:25写道：
> > > 
> > > > > > The basic idea yes, the whole bool *locked is horrid
> > > > > > though.
> > > > > > Wouldn't it
> > > > > > work to have a get_device_parent_locked that always returns
> > > > > > with
> > > > > > the mutex held,
> > > > > > or just move the mutex to the caller or something simpler
> > > > > > like this
> > > > > > ?
> > > > > > 
> > > > > 
> > > > > Greg and Rafael, do you have any suggestions for this? Or you
> > > > > also
> > > > > agree with Ben?
> > > > 
> > > > Ping guys ? This is worth fixing...
> > > 
> > > I also agree with you. But Greg and Rafael seem to be high
> > > latency right now.
> > 
> > It's in my list of patches to get to, sorry, hopefully will dig out
> > of
> > that next week with the buffer that the merge window provides me.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> 

