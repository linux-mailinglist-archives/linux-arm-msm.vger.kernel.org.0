Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB59456F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 13:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbhKSM4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 07:56:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:39722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231877AbhKSM4s (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 07:56:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45B0A604DC;
        Fri, 19 Nov 2021 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637326426;
        bh=+Kt93THZnyzv4oTsiBnwCrWWk1U7yDOV2BzetDj91v4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WgV86sF16EWK8Mhim/6jUIGPjyddpha6JOu21Al3eeCwrtfpS/X91+CBVrz6MvVWf
         pq8xI/35ntNHpjwaQGTnI/Scyp8LFYlIcmHTeTN2VHsNAAJx9bfCWznzTAy0a3lxnO
         w3W/5nmPIm+KulYk2NwWF7qvvM4NOfjDoD95HlR8=
Date:   Fri, 19 Nov 2021 13:53:44 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jeyr@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH v3] misc: fastrpc: fix improper packet size calculation
Message-ID: <YZeeWMGFev2D+4zr@kroah.com>
References: <1632224895-32661-1-git-send-email-jeyr@codeaurora.org>
 <YUnHbiQDZK/+tTAp@kroah.com>
 <9c5c13a393b64a4527f7be7ca42734d2@codeaurora.org>
 <YUnSt9B4hAe3y2k2@kroah.com>
 <df24334190f8b7cb517e440bee8f2784@codeaurora.org>
 <56123f5e39e4cc7691da5d0d61468a97@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56123f5e39e4cc7691da5d0d61468a97@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 19, 2021 at 06:19:27PM +0530, jeyr@codeaurora.org wrote:
> On 2021-09-21 18:43, jeyr@codeaurora.org wrote:
> > On 2021-09-21 18:10, Greg KH wrote:
> > > On Tue, Sep 21, 2021 at 06:03:42PM +0530, jeyr@codeaurora.org wrote:
> > > > On 2021-09-21 17:22, Greg KH wrote:
> > > > > On Tue, Sep 21, 2021 at 05:18:15PM +0530, Jeya R wrote:
> > > > > > The buffer list is sorted and this is not being considered while
> > > > > > calculating packet size. This would lead to improper copy length
> > > > > > calculation for non-dmaheap buffers which would eventually cause
> > > > > > sending improper buffers to DSP.
> > > > > >
> > > > > > Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke
> > > > > > method")
> > > > > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
> > > > > > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > > >
> > > > > Does this also need to go to the stable kernels?
> > > > Yes, this needs to go to stable kernels also as this fixes a
> > > > potential issue
> > > > which is easily reproducible.
> > > 
> > > 
> > > 
> > > > 
> > > > >
> > > > > > ---
> > > > > > Changes in v3:
> > > > > > - relocate patch change list
> > > > > >
> > > > > > Changes in v2:
> > > > > > - updated commit message to proper format
> > > > > > - added fixes tag to commit message
> > > > > > - removed unnecessary variable initialization
> > > > > > - removed length check during payload calculation
> > > > > >
> > > > > >  drivers/misc/fastrpc.c | 10 ++++++----
> > > > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > > > > index beda610..69d45c4 100644
> > > > > > --- a/drivers/misc/fastrpc.c
> > > > > > +++ b/drivers/misc/fastrpc.c
> > > > > > @@ -719,16 +719,18 @@ static int fastrpc_get_meta_size(struct
> > > > > > fastrpc_invoke_ctx *ctx)
> > > > > >  static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx,
> > > > > > int metalen)
> > > > > >  {
> > > > > >  	u64 size = 0;
> > > > > > -	int i;
> > > > > > +	int oix;
> > > > >
> > > > > What does "oix" stand for?  What was wrong with i?
> > > > It is just a general convention we use. "oix" is used to iterate
> > > > through
> > > > sorted overlap buffer list and use "i" to get corresponding
> > > > unsorted list
> > > > index. We follow the same convention at other places also, for
> > > > example:
> > > > fastrpc_get_args function.
> > > 
> > > That is the only place it is used in all of the whole kernel tree.  It
> > > is not a normal variable for a loop, so who is "we" here?
> > The convention was followed for the same file(fastrpc.c). As part of
> > fastrpc_get_args
> > function, while iterating through sorted buffer list, oix is used as
> > index and to
> > get unsorted index "raix", it is using "i". Just following the same way
> > here to
> > have better understanding. Please let me know if this is a concern, it
> > can be updated
> > to "i", "j" etc.
> > 
> > -- Thanks
> > > 
> > > thanks,
> > > 
> > > greg k-h
> Hello Greg,
> 
> Is this bug-fix patch planned to be released?

Released in what way?

I do not see it in any tree anywhere, perhaps it needs to be resubmitted
to be accepted?

thanks,

greg k-h
