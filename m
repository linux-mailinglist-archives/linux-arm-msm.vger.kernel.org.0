Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24F9918F87C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 16:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbgCWPZO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 11:25:14 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58225 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727151AbgCWPZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 11:25:14 -0400
Received: (qmail 24985 invoked by uid 500); 23 Mar 2020 11:25:13 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 23 Mar 2020 11:25:13 -0400
Date:   Mon, 23 Mar 2020 11:25:13 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Vinod Koul <vkoul@kernel.org>
cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v7 1/5] usb: hci: add hc_driver as argument for
 usb_hcd_pci_probe
In-Reply-To: <20200323101121.243906-2-vkoul@kernel.org>
Message-ID: <Pine.LNX.4.44L0.2003231124190.24254-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 Mar 2020, Vinod Koul wrote:

> usb_hcd_pci_probe expects users to call this with driver_data set as
> hc_driver, that limits the possibility of using the driver_data for
> driver data.
> 
> Add hc_driver as argument to usb_hcd_pci_probe and modify the callers
> ehci/ohci/xhci/uhci to pass hc_driver as argument and freeup the
> driver_data used
> 
> Tested xhci driver on Dragon-board RB3, compile tested ehci and ohci.
> Couldn't compile uhci
> 
> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/usb/core/hcd-pci.c  |  7 ++++---
>  drivers/usb/host/ehci-pci.c |  6 ++----
>  drivers/usb/host/ohci-pci.c |  9 ++++++---
>  drivers/usb/host/uhci-pci.c |  8 ++++++--
>  drivers/usb/host/xhci-pci.c | 14 +++++---------
>  include/linux/usb/hcd.h     |  3 ++-
>  6 files changed, 25 insertions(+), 22 deletions(-)

For all but the xHCI parts:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

