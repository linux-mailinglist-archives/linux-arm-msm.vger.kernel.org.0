Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A6717F6CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 12:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgCJLzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 07:55:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:44552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgCJLzO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 07:55:14 -0400
Received: from localhost (unknown [122.167.84.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78E1E2464B;
        Tue, 10 Mar 2020 11:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583841314;
        bh=cbPCeEem6JKklbB2VzqM30QCCT/AI0cLXshnbw7OmZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y7o+ENJe1AEFpzFL1pxznbCeXnEIoUV+ZtO1T1SnV273ank4QvKFnOqcLpjOdTXeq
         oOCzo127BFhIfqfXb3239rmTlxJcS4YnVD+kiDLCBKuCyXWJJSVn7yhGY5P3OS7Jfd
         3fIS9pR9QzySmxVqs97kcs5gwLNK9NSWmMvyxUOI=
Date:   Tue, 10 Mar 2020 17:25:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Christian Lamparter <chunkeey@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20200310115510.GE4885@vkoul-mobl>
References: <64340358-6682-4ae0-9c06-d72d5a4ff259@linux.intel.com>
 <Pine.LNX.4.44L0.2001311045470.1577-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001311045470.1577-100000@iolanthe.rowland.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31-01-20, 10:47, Alan Stern wrote:
> On Thu, 30 Jan 2020, Mathias Nyman wrote:
> 
> > I realize this can't be easily changed because usb_hcd_pci_probe() takes the
> > pci_device_id pointer as an argument, and expects id.driver_data to be a
> > HC driver pointer.
> > 
> > So this turns out to be a question for Greg and Alan:
> > 
> > Would it make sense to change usb_hcd_pci_probe() to take a HC driver pointer
> > as an argument instead of a pointer to pci_device_id?
> > pci_device_id pointer is only used to extract the HC driver handle.
> > This way the driver_data could be used for, well, driver data.
> 
> That seems like a good idea to me.  There aren't very many drivers that 
> use usb_hcd_pci_probe(); changing them all should be fairly easy.

Yup it was easy to do :) I have done this and tested it. Now we can use
driver_data for driver data.

Though couldn't compile the uhci, seems to have missing Makefile entry.

-- 
~Vinod
