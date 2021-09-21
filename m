Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE709413370
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 14:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbhIUMly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 08:41:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:50428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230052AbhIUMly (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 08:41:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 687CF60EE4;
        Tue, 21 Sep 2021 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632228025;
        bh=vnQtIdfALMpaBJcqOxeMIYV1/XVbzBlFUwV0+5xXDHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hfPgZ+/hwaSovUFOgATGC1QVqr0Yk4QLB+UyjmRiqLffZ/bMb5VWnk5gOEmLo7/08
         Mf3/7gM15uwnogJtmCwqIQUkdUB6zVZS7U9rR7deLGGf1ulpxTeHvtTN9zbOpFzXf2
         UnJCniKlAP37Krjbg1woMn77MpZHsCqPKjXjKNIk=
Date:   Tue, 21 Sep 2021 14:40:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jeyr@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH v3] misc: fastrpc: fix improper packet size calculation
Message-ID: <YUnSt9B4hAe3y2k2@kroah.com>
References: <1632224895-32661-1-git-send-email-jeyr@codeaurora.org>
 <YUnHbiQDZK/+tTAp@kroah.com>
 <9c5c13a393b64a4527f7be7ca42734d2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c5c13a393b64a4527f7be7ca42734d2@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 21, 2021 at 06:03:42PM +0530, jeyr@codeaurora.org wrote:
> On 2021-09-21 17:22, Greg KH wrote:
> > On Tue, Sep 21, 2021 at 05:18:15PM +0530, Jeya R wrote:
> > > The buffer list is sorted and this is not being considered while
> > > calculating packet size. This would lead to improper copy length
> > > calculation for non-dmaheap buffers which would eventually cause
> > > sending improper buffers to DSP.
> > > 
> > > Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke
> > > method")
> > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
> > > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > 
> > Does this also need to go to the stable kernels?
> Yes, this needs to go to stable kernels also as this fixes a potential issue
> which is easily reproducible.



> 
> > 
> > > ---
> > > Changes in v3:
> > > - relocate patch change list
> > > 
> > > Changes in v2:
> > > - updated commit message to proper format
> > > - added fixes tag to commit message
> > > - removed unnecessary variable initialization
> > > - removed length check during payload calculation
> > > 
> > >  drivers/misc/fastrpc.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index beda610..69d45c4 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -719,16 +719,18 @@ static int fastrpc_get_meta_size(struct
> > > fastrpc_invoke_ctx *ctx)
> > >  static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx,
> > > int metalen)
> > >  {
> > >  	u64 size = 0;
> > > -	int i;
> > > +	int oix;
> > 
> > What does "oix" stand for?  What was wrong with i?
> It is just a general convention we use. "oix" is used to iterate through
> sorted overlap buffer list and use "i" to get corresponding unsorted list
> index. We follow the same convention at other places also, for example:
> fastrpc_get_args function.

That is the only place it is used in all of the whole kernel tree.  It
is not a normal variable for a loop, so who is "we" here?

thanks,

greg k-h
