Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD552416C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 08:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244273AbhIXG5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 02:57:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:56844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244234AbhIXG5Q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 02:57:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E72E61214;
        Fri, 24 Sep 2021 06:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632466543;
        bh=OTaWo/pN6da5XpJ2K3POrQMeNAjTayJek3y+Pn8wrLk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dch8VWuX+ydB9AwQpYBVSTT+ZsoWGj3Epj/GXAxNWZsO5Wt0R0+fju7gnu4YWQD1l
         HRh1URkCICH8f6cogpjRd+6T1cLrRA9vhi56FXmNnxS9eryS79Fv0EYGC2V1aYGWYE
         2UqieiW+QiLeZraDczi3dmrQTQXFDh0ixHOwwkoA=
Date:   Fri, 24 Sep 2021 08:55:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jeyr@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] misc: fastrpc: copy to user only for non-DMA-BUF heap
 buffers
Message-ID: <YU12beZoXvEkpi99@kroah.com>
References: <1632386272-18139-1-git-send-email-jeyr@codeaurora.org>
 <YUw/k1PdjfYmufQP@kroah.com>
 <f3333ba748b0b7aacfa6ec87888ccb6c@codeaurora.org>
 <YUy8vuEjuams8TCV@kroah.com>
 <c59a764c653569e2ca74b60ae952f749@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c59a764c653569e2ca74b60ae952f749@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 24, 2021 at 11:55:32AM +0530, jeyr@codeaurora.org wrote:
> On 2021-09-23 23:13, Greg KH wrote:
> > On Thu, Sep 23, 2021 at 03:54:15PM +0530, jeyr@codeaurora.org wrote:
> > > On 2021-09-23 14:19, Greg KH wrote:
> > > > On Thu, Sep 23, 2021 at 02:07:52PM +0530, Jeya R wrote:
> > > > > fastrpc_put_args is copying all the output buffers to user. For large
> > > > > number of output context buffers, this might cause performance
> > > > > degradation. Copying is not needed for DMA-BUF heap buffers.
> > > >
> > > > What does "performance degradation" really mean?
> > > 
> > > Unnecessary copying for large number of buffers would cause some
> > > additional time which would get added to overall fastrpc call cost.
> > > 
> > > >
> > > > >
> > > > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
> > > > > ---
> > > > >  drivers/misc/fastrpc.c | 18 ++++++++++--------
> > > > >  1 file changed, 10 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > > > index beda610..536eabf 100644
> > > > > --- a/drivers/misc/fastrpc.c
> > > > > +++ b/drivers/misc/fastrpc.c
> > > > > @@ -890,15 +890,17 @@ static int fastrpc_put_args(struct
> > > > > fastrpc_invoke_ctx *ctx,
> > > > >  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> > > > >
> > > > >  	for (i = inbufs; i < ctx->nbufs; ++i) {
> > > > > -		void *src = (void *)(uintptr_t)rpra[i].pv;
> > > > > -		void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
> > > > > -		u64 len = rpra[i].len;
> > > > > +		if (!ctx->maps[i]) {
> > > > > +			void *src = (void *)(uintptr_t)rpra[i].pv;
> > > > > +			void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
> > > >
> > > > uintptr_t is not a kernel variable type.  Please use the real kernel
> > > > type for this as you are touching these lines.
> > > >
> > > 
> > > Sure, thanks for pointing this. Will update this in the next patch.
> > > 
> > > > > +			u64 len = rpra[i].len;
> > > > >
> > > > > -		if (!kernel) {
> > > > > -			if (copy_to_user((void __user *)dst, src, len))
> > > > > -				return -EFAULT;
> > > > > -		} else {
> > > > > -			memcpy(dst, src, len);
> > > > > +			if (!kernel) {
> > > > > +				if (copy_to_user((void __user *)dst, src, len))
> > > > > +					return -EFAULT;
> > > > > +			} else {
> > > > > +				memcpy(dst, src, len);
> > > > > +			}
> > > >
> > > > So you were copying buffers that didn't need to be copied?  So you are
> > > > now doing less work?  Or is this fixing a bug where you were copying
> > > > things that you should not have been copying?
> > > >
> > > > What commit does this fix?  Does this need to go to the stable kernel
> > > > trees?
> > > >
> > > 
> > > Yes, not all buffer needs to be copied. This change would avoid
> > > unnecessary
> > > copying of buffers. Not adding fix tag as it's not exactly fixing
> > > any bug.
> > > This should go to stable kernel trees.
> > 
> > If it's not fixing a bug, why should it go into the stable trees?
> 
> This is not a bug fix, it can be considered as an enhancement and it can go
> in
> to new release.

Ok, please update and send a v2 with the needed changes.

thanks,

greg k-h
