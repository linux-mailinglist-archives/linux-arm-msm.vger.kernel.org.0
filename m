Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F4941120B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 11:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbhITJrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 05:47:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229565AbhITJrx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 05:47:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C11260F6C;
        Mon, 20 Sep 2021 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632131186;
        bh=YEoeV/QfWDkv+OhStvmdBt8Qe0SbbH1I9HWpYSUrcO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VKb6amynafkBVDsG5kxHh/XaICyEDWQ9/gTeAfesiiZHpIM9wr33m29IKllbaeXZO
         g7ZNHplhl1TUpMMEQdrGvcLIc3laPj93uuD6JA1Khf8/C5r/tKgvvedlls5tgwvquy
         lp/uSPo23BHxFc3QtkdIrk8QCxNb3f9nN1PQLgX4=
Date:   Mon, 20 Sep 2021 11:46:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jeyr@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] misc: fastrpc: fix improper packet size calculation
Message-ID: <YUhYcFgMQ8AwB4vj@kroah.com>
References: <1632125731-18768-1-git-send-email-jeyr@codeaurora.org>
 <YUhPlj8eeszBNZTE@kroah.com>
 <6b3663fcadfdc5bc0cc82eedce533905@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b3663fcadfdc5bc0cc82eedce533905@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 20, 2021 at 03:01:07PM +0530, jeyr@codeaurora.org wrote:
> On 2021-09-20 14:38, Greg KH wrote:
> > On Mon, Sep 20, 2021 at 01:45:31PM +0530, Jeya R wrote:
> > > The buffer list is sorted and this is not being
> > > considered while calculating packet size. This
> > > would lead to improper copy length calculation
> > > for non-dmaheap buffers which would eventually
> > > cause sending improper buffers to DSP.
> > 
> > You do have the full 72 columns to use :)
> 
> Thanks, will update the commit message considering this.
> 
> > 
> > > 
> > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
> > > ---
> > >  drivers/misc/fastrpc.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > What commit does this fix?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Payload calculation function was modified to handle buffer overlapping
> calculation in this commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/misc/fastrpc.c?h=v5.15-rc2&id=25e8dfb83cda0a123bb1e091d6c3599cde050d76
> 
> Here during buffer overlap calculation, the buffer list is getting sorted.
> This needs to be considered during the calculation of payload size also by
> using unsorted buffer index "raix".

Ok, then please add a "Fixes:" tag when you resend this.

thanks,

greg k-h
