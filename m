Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 724624FCB8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2019 18:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfFWQin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jun 2019 12:38:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbfFWQin (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jun 2019 12:38:43 -0400
Received: from localhost (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E0892073F;
        Sun, 23 Jun 2019 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561307922;
        bh=oty7YWPdXvfYhqoDo8MNJH/4PkqB2xDgQ06sCbgUZ7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PIFDyhGrATZA7UWxJUVCKa8yKq3lqodyll1qpq2ZM4ND7A9qUY8Mn+4+8nkE3Ez6Z
         ISVoR4NOPbWpvsc62dH2lsw0xITzhPFMDLal38QeR5YNZGF0JnFgNQlrCslv9IaV5I
         l/wtEOldl+B8/sksLdEtMqoDzsy26APf9Ps0gtdU=
Date:   Sun, 23 Jun 2019 22:05:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] usb: xhci: handle uPD720201 and uPD720202 w/o ROM
Message-ID: <20190623163533.GS2962@vkoul-mobl>
References: <20190621085913.8722-1-vkoul@kernel.org>
 <20190621085913.8722-3-vkoul@kernel.org>
 <2243374.tJjtY2ZRGj@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2243374.tJjtY2ZRGj@debian64>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-06-19, 21:53, Christian Lamparter wrote:
> On Friday, June 21, 2019 10:59:10 AM CEST Vinod Koul wrote:
> > From: Christian Lamparter <chunkeey@googlemail.com>
> > 
> > This patch adds a firmware check for the uPD720201K8-711-BAC-A
> > and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> > in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> > devices which need a firmware in order to work as they do not have
> > support to load the firmware from an external ROM.
> > 
> > Currently, the xhci-pci driver is unable to initialize the hcd in
> > this case. Instead it will wait for 30 seconds and cause a timeout
> > in xhci_handshake() and fails.
> > 
> > [    5.116990] xhci_hcd 0000:45:00.0: new USB bus registered ...
> > [   32.335215] xhci_hcd 0000:45:00.0: can't setup: -110
> > [   32.340179] xhci_hcd 0000:45:00.0: USB bus 2 deregistered
> > [   32.345587] xhci_hcd 0000:45:00.0: init 0000:45:00.0 fail, -110
> > [   32.351496] xhci_hcd: probe of 0000:45:00.0 failed with error -110
> > 
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> >From what I remember, this was the "backup" patch that just prevented
> a stuck device (since the xhci-pci would trigger the watchdog on the
> powerpc APM82181). I posted because it because I didn't get any reply
> from Greg or Felipe. This patch should be skipable since patch 1/5 adds
> the full loader.

Okay let me drop this then!

-- 
~Vinod
