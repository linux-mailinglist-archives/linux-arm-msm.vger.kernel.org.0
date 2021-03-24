Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F155234733C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 09:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhCXIP6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 04:15:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43559 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232774AbhCXIP2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 04:15:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616573728; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=Y5h9gceNYtNF2VMK8tg+/n2jNlHo9HgwZ5dGzFZ5Hp4=; b=m4SDzPx9NaUknee6AJc/XKfv9sK40BZ/+tpQFmNqpUuQeKCSwJOb38J1Z5RIqL5uqr/aQbx0
 50MmH6dkZTAC2K5aAiG0T+AM1JytIM9TymbD17vXw55CZGGKIipHfuPh8jlZ6EAyEgCIcQRF
 bnID85FW9/C+p15oPlsztAELnr4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 605af5065d70193f88e29c2f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Mar 2021 08:15:02
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E236C43463; Wed, 24 Mar 2021 08:15:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EBF8C433CA;
        Wed, 24 Mar 2021 08:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5EBF8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 24 Mar 2021 01:14:57 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        kathirav=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Message-ID: <20210324081457.GB17922@jackp-linux.qualcomm.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <YCGCRQpqVNI2KZyi@builder.lan>
 <87sg64wj01.fsf@tarshish>
 <e1a05b5c6bf70e62b526a7a7d70b1a12@codeaurora.org>
 <e460e5afb0661b5867ee089b3efb0bc5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e460e5afb0661b5867ee089b3efb0bc5@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kathiravan, Baruch,

On Thu, Feb 25, 2021 at 10:17:49PM +0530, Kathiravan T wrote:
> On 2021-02-15 22:28, Kathiravan T wrote:
> > On 2021-02-10 11:40, Baruch Siach wrote:
> > > Hi Bjorn,
> > > 
> > > Thanks for your review comments.
> > > 
> > > On Mon, Feb 08 2021, Bjorn Andersson wrote:
> > > > On Mon 08 Feb 00:00 CST 2021, Baruch Siach wrote:
> > > > > From: Balaji Prakash J <bjagadee@codeaurora.org>
> > > > > 
> > > > > DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
> > > > > to control the behavior of controller with respect to SOF and ITP.
> > > > > The reset values of these registers are aligned for 19.2 MHz
> > > > > reference clock source. This change will add option to override
> > > > > these settings for reference clock other than 19.2 MHz
> > > > > 
> > > > > Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.
> > > > > 
> > > > > Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
> > > > > [ baruch: mention tested hardware ]
> > > > > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > > > > ---
> > > > >  .../devicetree/bindings/usb/dwc3.txt          |  5 ++
> > > > >  drivers/usb/dwc3/core.c                       | 52
> > > > > +++++++++++++++++++
> > > > >  drivers/usb/dwc3/core.h                       | 12 +++++
> > > > >  3 files changed, 69 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > > b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > > index 1aae2b6160c1..4ffa87b697dc 100644
> > > > > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > > @@ -89,6 +89,11 @@ Optional properties:
> > > > >   - snps,quirk-frame-length-adjustment: Value for
> > > > > GFLADJ_30MHZ field of GFLADJ
> > > > >  	register for post-silicon frame length adjustment when the
> > > > >  	fladj_30mhz_sdbnd signal is invalid or incorrect.
> > > > > + - snps,quirk-ref-clock-adjustment: Value for
> > > > > GFLADJ_REFCLK_* fields of GFLADJ
> > > > > +	register for reference clock other than 19.2 MHz is used.
> > > > 
> > > > What are typical values for this property? What unit does it
> > > > have? How
> > > > does it actually relate to the frequency of the reference clock?
> > > 
> > > Downstream codeaurora kernel (fig branch) sets 0xA87F0 for IPQ6018
> > > (24MHz reference clock), and 0x49459 for IPQ5018 (60MHz). So this
> > > value
> > > appears to correlates with clock rate. I have no access to DWC3
> > > documentation. I only tested IPQ6018 hardware.
> > > 
> > 
> > It will be written as (0xA87F0 << 7) retaining the 0-7 LSB value.
> > I could see, BIT(23) of GFLADJ register enables the functionality of
> > running SOF/ITP counters based on the reference clock. Since this bit
> > is set, we need to
> > compute the other fields as well i.e., from 8th bit to 31st bit.
> > Finally it is derived to
> > 0xA87F0 for IPQ6018.
> > 
> 
> Bjorn / All,
> 
> Any comments on this? Please do suggest if this can be handled in a better
> way.
> 
> 
> > 
> > > > > + - snps,quirk-ref-clock-period: Value for REFCLKPER filed
> > > > > of GUCTL. This field
> > > > > +	indicates in terms of nano seconds the period of ref_clk.
> > > > > To calculate the
> > > > > +	ideal value, REFCLKPER = (1/ref_clk in Hz)*10^9.
> > > > 
> > > > Can't we make the dwc3 reference this clock and use
> > > > clk_get_rate() and
> > > > then do this math in the driver?
> > > 
> > > This is doable, I believe. Though current code does not identify
> > > specific clocks, as far as I can see.

I agree it should be doable. Looks like prior to 0d3a97083e0c ("usb:
dwc3: Rework clock initialization to be more flexible") the core did
support specific clocks ("ref", "bus_early", "suspend"), but was
changed to use a simpler devm_clk_bulk_get_all() call.

> > We can mention one more clock(ref) in the USB device node and do the
> > math (NSEC_PER_SEC / clk_get_rate()) in dwc3 driver.

Yea, just need to make sure "ref" clk is specified in the DT node. Then
in the driver you can just iterate through dwc->clks and try to find one
with .id=="ref". If clk_get_rate() succeeds then you can use the value
to calculate the GUCTL.REFCLKPER and GFLADJ register fields.

Or perhaps even use a lookup table, since according to the DWC3
programming guide only 6 refclk frequencies (16, 17, 19.2, 20, 24, 39.7
MHz) are supported so that might be simpler than a few integer divide
operations that would otherwise be required.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
