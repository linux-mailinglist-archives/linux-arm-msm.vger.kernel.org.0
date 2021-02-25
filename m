Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F940324F5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 12:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhBYLp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 06:45:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:59660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231414AbhBYLp0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 06:45:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B84764F17;
        Thu, 25 Feb 2021 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614253486;
        bh=xy4njwEXwUHtCcofc5JLTqOxp8GdsOi4wj5TWjxjKKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F8rxJ2I19KhVJGHdH8FpTcgTrLzwoX8Zj3CKwSTeurQ/0OQ6s9Y1W/MuuE4Y4Z05u
         ugP/QuTV5ft4GxLvP8rkR9QVAGVeyaBPGWnebcLCHbir6hpmGLLSPa7UOKo6mvNs5g
         JPiKEq2MZ1CDI8T5xjogXlhZfr0RyHdAkHQ3eMys=
Date:   Thu, 25 Feb 2021 12:44:43 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yogesh Lal <ylal@codeaurora.org>
Cc:     rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, pkondeti@codeaurora.org,
        neeraju@codeaurora.org
Subject: Re: [PATCH] driver core: Use unbound workqueue for deferred probes
Message-ID: <YDeNq+mBXDlHUlG4@kroah.com>
References: <1614167749-22005-1-git-send-email-ylal@codeaurora.org>
 <YDZKCk+it/7RpgUJ@kroah.com>
 <a40db2a2-f58a-aaec-6976-977d4b9f9e0e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a40db2a2-f58a-aaec-6976-977d4b9f9e0e@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 04:03:50PM +0530, Yogesh Lal wrote:
> Hi Greg,
> 
> 
> On 2/24/2021 6:13 PM, Greg KH wrote:
> > On Wed, Feb 24, 2021 at 05:25:49PM +0530, Yogesh Lal wrote:
> > > Queue deferred driver probes on unbounded workqueue, to allow
> > > scheduler better manage scheduling of long running probes.
> > 
> > Really?  What does this change and help?  What is the visable affect of
> > this patch?  What problem does it solve?
> > 
> 
> We observed boot up improvement (~400 msec) when the deferred probe work is
> made unbound. This is due to scheduler moving the worker running deferred
> probe work to big CPUs. without this change, we see the worker is running on
> LITTLE CPU due to affinity.

Why is none of this information in the changelog text?  How are we
supposed to know this?  And is this 400msec out of 10 seconds or
something else?  Also, this sounds like your "little" cpus are really
bad, you might want to look into fixing them first :)

But if you really want to make this go faster, do not deferr your probe!
Why not fix that problem in your drivers instead?

> Please let us now if there are any concerns/restrictions that deferred probe
> work should run only on pinned kworkers. Since this work runs deferred probe
> of several devices , the locality may not be that important

Can you prove that it is not important?  I know lots of gyrations are
done in some busses to keep probe happening on the same CPU for very
good reasons.  Changing that should not be done lightly as you will
break this.

thanks,

greg k-h
