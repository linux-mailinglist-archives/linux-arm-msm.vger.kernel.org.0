Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C234345B58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 10:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCWJud (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 05:50:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:32908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhCWJu0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 05:50:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5CB761931;
        Tue, 23 Mar 2021 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616493026;
        bh=XoL7lOxx1ClKPZVwQ4USOCKOSOhbS3tu8JiG7MkLxBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2lopGQ/w+FThUIdy3BERwc2mIZXb6Cjg2z3XgfEr0vI0crhOd0cK4nKS7gmUFJR93
         PWwAQOKDwU1d/Wl1wl73ELhbWdcG2BbGj3Z3Xt2bPY5JxL27s3sSFvxrYf2cFoQy8k
         X4K+NHCaxWunXWlCL+oNIgNoZM3mSzRftYdbAmgw=
Date:   Tue, 23 Mar 2021 10:50:24 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yogesh Lal <ylal@codeaurora.org>
Cc:     rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, pkondeti@codeaurora.org,
        neeraju@codeaurora.org
Subject: Re: [PATCH] driver core: Use unbound workqueue for deferred probes
Message-ID: <YFm54EBqgVYdhqu4@kroah.com>
References: <1614167749-22005-1-git-send-email-ylal@codeaurora.org>
 <YDZKCk+it/7RpgUJ@kroah.com>
 <a40db2a2-f58a-aaec-6976-977d4b9f9e0e@codeaurora.org>
 <YDeNq+mBXDlHUlG4@kroah.com>
 <8061fa06-f101-e932-c67d-193e305d20b8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8061fa06-f101-e932-c67d-193e305d20b8@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 15, 2021 at 04:15:12PM +0530, Yogesh Lal wrote:
> 
> 
> On 2/25/2021 5:14 PM, Greg KH wrote:
> > On Thu, Feb 25, 2021 at 04:03:50PM +0530, Yogesh Lal wrote:
> > > Hi Greg,
> > > 
> > > 
> > > On 2/24/2021 6:13 PM, Greg KH wrote:
> > > > On Wed, Feb 24, 2021 at 05:25:49PM +0530, Yogesh Lal wrote:
> > > > > Queue deferred driver probes on unbounded workqueue, to allow
> > > > > scheduler better manage scheduling of long running probes.
> > > > 
> > > > Really?  What does this change and help?  What is the visable affect of
> > > > this patch?  What problem does it solve?
> > > > 
> > > 
> > > We observed boot up improvement (~400 msec) when the deferred probe work is
> > > made unbound. This is due to scheduler moving the worker running deferred
> > > probe work to big CPUs. without this change, we see the worker is running on
> > > LITTLE CPU due to affinity.
> > 
> > Why is none of this information in the changelog text?  How are we
> > supposed to know this?  And is this 400msec out of 10 seconds or
> 
> We wanted to  first understand the requirement of bounded deferred probe why
> it was really required.
> 
> > something else?  Also, this sounds like your "little" cpus are really
> > bad, you might want to look into fixing them first :)
> > 
> 
> ~600ms (deferred probe bound to little core) and ~200ms (deferred probe
> queued on unbound wq).
> 
> > But if you really want to make this go faster, do not deferr your probe!
> > Why not fix that problem in your drivers instead?
> > 
> 
> Yes, we are exploring in that direction as well but want to get upstream
> opinion and understand the usability of unbounded wq.
> 
> > > Please let us now if there are any concerns/restrictions that deferred probe
> > > work should run only on pinned kworkers. Since this work runs deferred probe
> > > of several devices , the locality may not be that important
> > 
> > Can you prove that it is not important?  I know lots of gyrations are
> > done in some busses to keep probe happening on the same CPU for very
> > good reasons.  Changing that should not be done lightly as you will
> > break this.
> 
> While debugging further and checking if probe are migrating found that init
> thread can potentially migrate, as it has cpu affinity set to all cpus,
> during driver probe (or there is something which prevents it, which I am
> missing?) . Also, async probes use unbounded workqueue.
> So, using unbounded wq for deferred probes looks to be similar to these,
> w.r.t. scheduling behavior.

I do not understand anymore, is this patch still needed or not?

And if so, please resubmit with a lot more description in the changelog
text describing all of this...

thanks,

greg k-h
