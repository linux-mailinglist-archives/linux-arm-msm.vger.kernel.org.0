Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC601495EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2020 14:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgAYN3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jan 2020 08:29:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:40316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgAYN3b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jan 2020 08:29:31 -0500
Received: from localhost (unknown [145.15.244.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 484E2206F0;
        Sat, 25 Jan 2020 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579958971;
        bh=ZlARgGBv0efHgDPaj5HZbh4hEPn9xIvhPiiZnur8dEI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B33H/q9u6nNS8fgmrR+xa9fC0LuzjgUzLU49IWbQm3xmL5ZpLOuYL7uWBgZ5iCAHn
         uNj2zoQd0jfz/sHHeNYBl4TRRRYykecoTvtmTT/foX9/2XHuIsoUPGLexAq/+vWD1k
         AbZp4FkwgfWJotDe6rziQVLRSOH6S/LE2zrYOaMM=
Date:   Sat, 25 Jan 2020 14:26:15 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        arnd@arndb.de, smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200125132615.GA3516435@kroah.com>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <20200124082939.GA2921617@kroah.com>
 <42c79181-9d97-3542-c6b0-1e37f9b2ff39@codeaurora.org>
 <20200124174707.GB3417153@kroah.com>
 <e32b0a53-ce95-6d73-46c6-76d17af37146@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e32b0a53-ce95-6d73-46c6-76d17af37146@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 24, 2020 at 11:12:57AM -0700, Jeffrey Hugo wrote:
> On 1/24/2020 10:47 AM, Greg KH wrote:
> > On Fri, Jan 24, 2020 at 07:24:43AM -0700, Jeffrey Hugo wrote:
> > > > > +/**
> > > > > + * struct mhi_result - Completed buffer information
> > > > > + * @buf_addr: Address of data buffer
> > > > > + * @dir: Channel direction
> > > > > + * @bytes_xfer: # of bytes transferred
> > > > > + * @transaction_status: Status of last transaction
> > > > > + */
> > > > > +struct mhi_result {
> > > > > +	void *buf_addr;
> > > > 
> > > > Why void *?
> > > 
> > > Because its not possible to resolve this more clearly.  The client provides
> > > the buffer and knows what the structure is.  The bus does not. Its just an
> > > opaque pointer (hence void *) to the bus, and the client needs to decode it.
> > > This is the struct that is handed to the client to allow them to decode the
> > > activity (either a received buf, or a confirmation that a transmitted buf
> > > has been consumed).
> > 
> > Then shouldn't this be a "u8 *" instead as you are saying how many bytes
> > are here?
> 
> I'm sorry, I don't see the benefit of that.  Can you elaborate on why you
> think that u8 * is a better type?
> 
> Sure, its an arbitrary byte stream from the perspective of the bus, but to
> the client, 99% of the time its going to have some structure.

So which side is in control here, the "bus" or the "client"?  For the
bus to care, it's a bytestream and should be represented as such (like
you have) with a number of bytes in the "packet".

If you already know the structure types, just make a union of all of the
valid ones and be done with it.  In other words, try to avoid using void
* as much as is ever possible please.

thanks,

greg k-h
