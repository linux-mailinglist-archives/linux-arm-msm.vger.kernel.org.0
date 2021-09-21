Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB18413513
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 16:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233352AbhIUOOF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 10:14:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:53946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231781AbhIUOOB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 10:14:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A7E561156;
        Tue, 21 Sep 2021 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632233551;
        bh=tPA3el9irNElL1kdVA4YUgpKpVtEb9WJ+dYaBXABR08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TesjUNQqhg1fpjbuKkY32BUxHO740dsFrOOPxRx2m0EV7CxVdQcvCxgsqjgg41iya
         rkWUb8DY9Y+6ltFSM8EbIepuQucvlVjJ2gJ6YeiPnd+bPfqPVJckUnajb/Qwo13Vyj
         ZKfTJbqmhNUXKjnt9tIDPnjsG8xM3cnHELEOIE+g=
Date:   Tue, 21 Sep 2021 16:12:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Jeya R <jeyr@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] misc: fastrpc: Update number of max fastrpc sessions
Message-ID: <YUnoS04YWVtaxcDr@kroah.com>
References: <1632123274-32054-1-git-send-email-jeyr@codeaurora.org>
 <YUg9dmThHg9s8XAy@kroah.com>
 <88370a7c-9e28-ae1b-2f48-bc38a8cff78f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88370a7c-9e28-ae1b-2f48-bc38a8cff78f@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 20, 2021 at 01:53:39PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 20/09/2021 08:51, Greg KH wrote:
> > On Mon, Sep 20, 2021 at 01:04:34PM +0530, Jeya R wrote:
> > > For latest chipsets, upto 13 fastrpc sessions can be
> > > supported. This includes 12 compute sessions and 1 cpz
> > > session. Not updating this might result to out of bounds
> > > memory access issues if more than 9 context bank nodes
> > > are added to the DT file.
> > > 
> > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
> > > ---
> > >   drivers/misc/fastrpc.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index beda610..bd7811e 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -24,7 +24,7 @@
> > >   #define SDSP_DOMAIN_ID (2)
> > >   #define CDSP_DOMAIN_ID (3)
> > >   #define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
> > > -#define FASTRPC_MAX_SESSIONS	9 /*8 compute, 1 cpz*/
> > > +#define FASTRPC_MAX_SESSIONS	13 /*12 compute, 1 cpz*/
> > >   #define FASTRPC_ALIGN		128
> > >   #define FASTRPC_MAX_FDLIST	16
> > >   #define FASTRPC_MAX_CRCLIST	64
> > > -- 
> > > 2.7.4
> > > 
> > 
> > What happens if you run this on "older" chipsets?
> 
> This change should not have any implications on the older chips, as the
> existing compute context bank device tree entries will not exceed 9.
> 
> > 
> > And is this an issue now, or can this wait to 5.16-rc1?
> 
> We could wait take in 5.16-rc1, as its an enhancement to allow more compute
> context banks.

Ok, can I get a reviewed-by: for this?
