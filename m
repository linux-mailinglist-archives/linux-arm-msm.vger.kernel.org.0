Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC9934FCBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2019 18:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfFWQjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jun 2019 12:39:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:50730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbfFWQjy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jun 2019 12:39:54 -0400
Received: from localhost (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 611AF2073F;
        Sun, 23 Jun 2019 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561307993;
        bh=EbPSEBX2/Vz3/4Tik7hYPX8JPEk5Jr1v73rmvGLknOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TWbG0d3op4NpLBfu7NbdMSAgsV1FiDentR9fJhUm6tnqA4071m1FF8v/uVgrEM4mp
         KCmSloD+oa47zyhIx/0tRXRfvPlTau7CHZsEpwarNWC5bPT3MY0BURhhAJqi02xK7A
         pC5tpkYzzlAxmb/5EWijcQmtp9Xd3DNvuiycsqwU=
Date:   Sun, 23 Jun 2019 22:06:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] usb: xhci: allow multiple firmware versions
Message-ID: <20190623163643.GT2962@vkoul-mobl>
References: <20190621085913.8722-1-vkoul@kernel.org>
 <20190621085913.8722-6-vkoul@kernel.org>
 <4561421.lKpHrRjrp5@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4561421.lKpHrRjrp5@debian64>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-06-19, 21:46, Christian Lamparter wrote:
> On Friday, June 21, 2019 10:59:13 AM CEST Vinod Koul wrote:
> > Allow multiple firmware file versions in table and load them in
> > increasing order as we find them in the file system.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: Christian Lamparter <chunkeey@googlemail.com>
> > ---
> >  drivers/usb/host/xhci-pci.c | 46 +++++++++++++++++++++++++++++++++++--
> >  1 file changed, 44 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index 771948ce3d38..1fb890984d6d 100644
> > --- a/drivers/usb/host/xhci-pci.c
> > +++ b/drivers/usb/host/xhci-pci.c
> > @@ -336,13 +336,19 @@ static const struct renesas_fw_entry {
> >  	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
> >  	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> >  	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> > +	 *
> > +	 *  Entry expected_version should be kept in increasing order for a
> > +	 *  chip, so that driver will pick first version and if that fails
> > +	 *  then next one will be picked
> 
> Wouldn't it be better to do that in reverse order and try the latest
> firmware first? And then fall back to the older ones?

Yeah that seems better will update the order.
> 
> >  	 */
> >  	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
> >  	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
> > +	{ "K2026090.mem", 0x0014, 0x03, 0x2026 },
> >  	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },
> The uPD720202 (ProductID 0x0015 with rev 0x02) also
> works with the K2026090.mem I found online.
> 
> so,
> 
> +  	{ "K2026090.mem", 0x0015, 0x02, 0x2026 },

Thanks for checking out, I will add this add send updated patch
-- 
~Vinod
