Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD8F41649B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 19:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242582AbhIWRpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 13:45:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:48196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233669AbhIWRpA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 13:45:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C840B60F4C;
        Thu, 23 Sep 2021 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632419008;
        bh=2pB6+rQ1KDZ58hG85EpwUaTjBgEVnhSiiN/dICRDX0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TcqGwPZ2yJSYhj+2XwfJI9SKh/1wdSZcDO4YrDj5FYSI1KJ3D1HsiUl+Ufj+vAMD1
         Ny4uX2qOLkAYLBUmuIeuUjIDC/KM99atliXBgXo7Xw9IJNN3KUnY51rgqVJRYngEmo
         Dvj4kZH+UQga8MbdrzzoE0+GFoVAFuwQKOpJK9qw=
Date:   Thu, 23 Sep 2021 19:43:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jeyr@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] misc: fastrpc: copy to user only for non-DMA-BUF heap
 buffers
Message-ID: <YUy8vuEjuams8TCV@kroah.com>
References: <1632386272-18139-1-git-send-email-jeyr@codeaurora.org>
 <YUw/k1PdjfYmufQP@kroah.com>
 <f3333ba748b0b7aacfa6ec87888ccb6c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3333ba748b0b7aacfa6ec87888ccb6c@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 23, 2021 at 03:54:15PM +0530, jeyr@codeaurora.org wrote:
> On 2021-09-23 14:19, Greg KH wrote:
> > On Thu, Sep 23, 2021 at 02:07:52PM +0530, Jeya R wrote:
> > > fastrpc_put_args is copying all the output buffers to user. For large
> > > number of output context buffers, this might cause performance
> > > degradation. Copying is not needed for DMA-BUF heap buffers.
> > 
> > What does "performance degradation" really mean?
> 
> Unnecessary copying for large number of buffers would cause some
> additional time which would get added to overall fastrpc call cost.
> 
> > 
> > > 
> > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
> > > ---
> > >  drivers/misc/fastrpc.c | 18 ++++++++++--------
> > >  1 file changed, 10 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index beda610..536eabf 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -890,15 +890,17 @@ static int fastrpc_put_args(struct
> > > fastrpc_invoke_ctx *ctx,
> > >  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> > > 
> > >  	for (i = inbufs; i < ctx->nbufs; ++i) {
> > > -		void *src = (void *)(uintptr_t)rpra[i].pv;
> > > -		void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
> > > -		u64 len = rpra[i].len;
> > > +		if (!ctx->maps[i]) {
> > > +			void *src = (void *)(uintptr_t)rpra[i].pv;
> > > +			void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
> > 
> > uintptr_t is not a kernel variable type.  Please use the real kernel
> > type for this as you are touching these lines.
> > 
> 
> Sure, thanks for pointing this. Will update this in the next patch.
> 
> > > +			u64 len = rpra[i].len;
> > > 
> > > -		if (!kernel) {
> > > -			if (copy_to_user((void __user *)dst, src, len))
> > > -				return -EFAULT;
> > > -		} else {
> > > -			memcpy(dst, src, len);
> > > +			if (!kernel) {
> > > +				if (copy_to_user((void __user *)dst, src, len))
> > > +					return -EFAULT;
> > > +			} else {
> > > +				memcpy(dst, src, len);
> > > +			}
> > 
> > So you were copying buffers that didn't need to be copied?  So you are
> > now doing less work?  Or is this fixing a bug where you were copying
> > things that you should not have been copying?
> > 
> > What commit does this fix?  Does this need to go to the stable kernel
> > trees?
> > 
> 
> Yes, not all buffer needs to be copied. This change would avoid unnecessary
> copying of buffers. Not adding fix tag as it's not exactly fixing any bug.
> This should go to stable kernel trees.

If it's not fixing a bug, why should it go into the stable trees?
