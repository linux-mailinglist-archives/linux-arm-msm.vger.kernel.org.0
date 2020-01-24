Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6158148D43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 18:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390811AbgAXRvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 12:51:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:37690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390609AbgAXRvM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 12:51:12 -0500
Received: from localhost (unknown [84.241.198.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99C9F2071A;
        Fri, 24 Jan 2020 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579888272;
        bh=9hbmPEgHXRr8v1nxwUdlwfTPAg3pc8TX2Au28qS0i4g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FH87yV97mOBhgZ9nhlA0nI77nM+HmKCJm2gdezoEjwtiTfgad6yje5Dm+Y8ZfS0Yh
         uiAdMxo9t220kz/g7dT/vZWIUqdwT4tBqoy7e3o2zocmzigWn1lhe3d9NoioWnG2x+
         ZR+KaaZ+Y4gAg9mX/WOsFMXYmAsiuT30T/8UpJF4=
Date:   Fri, 24 Jan 2020 18:47:07 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        arnd@arndb.de, smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200124174707.GB3417153@kroah.com>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <20200124082939.GA2921617@kroah.com>
 <42c79181-9d97-3542-c6b0-1e37f9b2ff39@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42c79181-9d97-3542-c6b0-1e37f9b2ff39@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 24, 2020 at 07:24:43AM -0700, Jeffrey Hugo wrote:
> > > +/**
> > > + * struct mhi_result - Completed buffer information
> > > + * @buf_addr: Address of data buffer
> > > + * @dir: Channel direction
> > > + * @bytes_xfer: # of bytes transferred
> > > + * @transaction_status: Status of last transaction
> > > + */
> > > +struct mhi_result {
> > > +	void *buf_addr;
> > 
> > Why void *?
> 
> Because its not possible to resolve this more clearly.  The client provides
> the buffer and knows what the structure is.  The bus does not. Its just an
> opaque pointer (hence void *) to the bus, and the client needs to decode it.
> This is the struct that is handed to the client to allow them to decode the
> activity (either a received buf, or a confirmation that a transmitted buf
> has been consumed).

Then shouldn't this be a "u8 *" instead as you are saying how many bytes
are here?

thanks,

greg k-h
