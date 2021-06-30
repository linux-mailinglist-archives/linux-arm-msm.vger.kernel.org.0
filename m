Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B283B82D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 15:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234723AbhF3N21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 09:28:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234718AbhF3N21 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 09:28:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CEF461356;
        Wed, 30 Jun 2021 13:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625059557;
        bh=pRhoVxlakzjKTDZATJX0RBmkzXc/Et5u5tXuaooYvmE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TtS1IQVYWhlv5akhEgO1oz7Ti4RAmmmQ/cZVK9hPwByYRFeFKJyMRwlor3jLEdk6f
         7YMC8RYS4YLMEQQ7LoviuJbLbXc3URJrqN0nTeVGHFPZ1AjUV5hSmCIj1dYQhFGrU0
         BL/qXPWm5N4icmsjOLnA54MCN4pkgN9six8kcTgw=
Date:   Wed, 30 Jun 2021 15:25:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH 00/10] MHI patches for v5.14 - Take 2
Message-ID: <YNxw4wc1nvwMnaS6@kroah.com>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
 <20210630131656.GA18484@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630131656.GA18484@workstation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 30, 2021 at 06:46:56PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> On Fri, Jun 25, 2021 at 06:03:45PM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > Please find the remaining MHI patches for v5.14. This series has the left over
> > patches from the previous patchset and one new series that was reviewed a
> > while ago and put on hold for Ack from Kalle Valo for ath11k.
> > 
> > Summary:
> > 
> > 1. Added validation for the channel ID read from event ring. If we get events
> > from an invalid channel, we throw an error message and skip the event.
> > 
> > 2. Fixed the MHI wake routines used for the newer modems such as SDX55 and
> > SDX65 by using no-op routines only for the older modems and then relying on
> > the default routines provided by MHI stack for newer ones.
> > 
> > 3. Added support for processing the events based on the priorities. Earlier
> > a fixed priority was used for all events.
> > 
> > 4. Added a dedicated flag to the MHI client transfer APIs for inbound
> > buffer allocation by the MHI stack. Since this patch modifies the MHI
> > client drivers under "net/", Ack has been collected from the netdev
> > maintainer.
> > 
> > 5. Added support for Cinterion MV31-W modem in pci_generic controller:
> > https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high
> > 
> > 6. Rearranged the setting of BHI/BHIe offsets for better validation of the
> > register values read from MMIO
> > 
> > 7. Cleanup of the BHI/BHIe pointers by setting them to NULL to prevent access
> > after power down.
> > 
> > 8. Added support for getting the MMIO register length from the controller
> > drivers. This helps in validation of the read offsets from MMIO registers.
> > Since this patch touches ath11k, Ack has been collected from Kalle Valo.
> > 
> > 9. With the help of above register length, added check for BHI/BHIe offsets.
> > 
> 
> Is this series on your queue for 5.14?

It's too late for 5.14-rc1, patches had to be in linux-next way before
5.13-final was out.

I can take these after 5.14-rc1 is out for 5.15-rc1, or you can split
them up into bugfixes and features and resend two series, one for
5.14-final and one for 5.15-rc1, which ever you want.

thanks,

greg k-h
