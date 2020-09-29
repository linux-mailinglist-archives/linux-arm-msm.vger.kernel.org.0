Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9316227D361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 18:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgI2QNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 12:13:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728623AbgI2QNP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 12:13:15 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DDE82075E;
        Tue, 29 Sep 2020 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601395994;
        bh=sdJL9HNJixpsXXxADiyWrx4+W4E8JRZKMXkgDiS/WQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W5Yld1mUZBrN6SRmkCHjLuZseWaK/F17FpWvRNECw8In2jZAjM8Kri1C1YjSa+BDA
         7n7Un/DrdaL54+t2fs04f1CibvL8DONTVFd26QJpW/IaDaKV9F4pTuFIeERbAME/yD
         Izu2j7DSCTB10ZlbP4VZksEC2K+MbRagoyWtWCho=
Date:   Tue, 29 Sep 2020 18:13:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, kvalo@codeaurora.org,
        ath11k@lists.infradead.org
Subject: Re: [PATCH v2 00/21] MHI changes for v5.10
Message-ID: <20200929161319.GC1326743@kroah.com>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
 <20200929152834.GA17845@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929152834.GA17845@Mani-XPS-13-9360>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 29, 2020 at 08:58:34PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> On Mon, Sep 28, 2020 at 09:39:30AM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > Here is the MHI series for v5.10 cycle. Most of the patches are cleanups
> > in the MHI stack. Notable changes are below:
> > 
> > * Saving the client device hardware information obtained through the BHI
> >   protocol. This information will be exposed through sysfs to make use in
> >   the userland applications.
> > * Introduce sysfs entries to read the serial number and OEM PK hash values
> >   of the client device obtained from BHI protocol. Relevant API documentation
> >   is also added.
> > * Introduce debugfs entries to show MHI states, events, channels, register
> >   state etc... to aid debug.
> > * Remove the channel name from MHI device name as the device is not specific
> >   to channels. Used generic names instead!
> > * Fix the warning reported by Kbuild bot by using append (+=) Kbuild rule
> >   to the mhi/core Makefile.
> > * Introduce APIs to allocate and free MHI controllers. This is done to make
> >   sure that the allocated structs are initialized to NULL before passing to
> >   the MHI core.
> > * Remove the requirement to have a dedicated IRQ for each event ring.
> >   The MHI controllers can now use a single IRQ for all event rings.
> > * Remove the auto-start option for MHI channels. This is done to avoid
> >   receiving spurious uplink from MHI client device when the client driver
> >   is not up. The corresponding qrtr change is also included with Dave's ACK.
> > 
> > Please consider merging!
> > 
> 
> Can you please drop the below two patches while applying this series?
> 
> bus: mhi: Remove auto-start option
> net: qrtr: Start MHI channels during init
> 
> We realized that without these patches, net-next will be broken for QCA6390.
> Proper way to handle this is by using an immutable branch or by carrying the
> ath11k change through MHI tree. We decided to handle this in next merge window.
> 
> Or if you prefer to have a next revision of the series without these patches
> I can send it. Please let me know!

Please just send a new series, that way I "know" I got it right.

thanks,

greg k-h
