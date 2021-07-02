Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF2F3B9D74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jul 2021 10:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhGBIWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 04:22:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:51742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230149AbhGBIWW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 04:22:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B826A61289;
        Fri,  2 Jul 2021 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625213990;
        bh=AWYQNC3rvZNhl/Ddxs99aViYr0yWm46slFcCjx7kqXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gas3jGgIvaPUEQyKIr48k7mGCCG5RB1q99BQKo7aK9V6pFhTNZgQT2JV+TV0Ypviq
         dFhYcV1jhdLLU1rUAsMlGEEYGGUq6fwnsSln6y+Bf2v+j8H85ZUCKInf5mJA0aVc+T
         Hn35Lji5TWliVcthck2rEDYlEE29JtuRP4TQUrTM=
Date:   Fri, 2 Jul 2021 10:19:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        fntoth@gmail.com
Subject: Re: [PATCH v11 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
 property by default
Message-ID: <YN7MIzqOxf/3b8zl@kroah.com>
References: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
 <1625043642-29822-5-git-send-email-wcheng@codeaurora.org>
 <YN6e8G1e9cZBBMr7@kroah.com>
 <83237faa-9840-5d31-43da-8ce551e75067@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83237faa-9840-5d31-43da-8ce551e75067@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 02, 2021 at 01:10:13AM -0700, Wesley Cheng wrote:
> 
> 
> On 7/1/2021 10:06 PM, Greg KH wrote:
> > On Wed, Jun 30, 2021 at 02:00:41AM -0700, Wesley Cheng wrote:
> >> In order to take advantage of the TX fifo resizing logic, manually add
> >> these properties to the DWC3 child node by default.  This will allow
> >> the DWC3 gadget to resize the TX fifos for the IN endpoints, which
> >> help with performance.
> >>
> >> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> >> ---
> >>  drivers/usb/dwc3/dwc3-qcom.c | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >>
> >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> >> index 49e6ca9..cec4f4a 100644
> >> --- a/drivers/usb/dwc3/dwc3-qcom.c
> >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> >> @@ -640,6 +640,25 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
> >>  	return ret;
> >>  }
> >>  
> >> +#ifdef CONFIG_OF
> >> +static void dwc3_qcom_add_dt_props(struct device *dev, struct device_node *np)
> >> +{
> >> +	struct property		*prop;
> >> +	int ret;
> >> +
> >> +	prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
> >> +	if (prop) {
> >> +		prop->name = "tx-fifo-resize";
> >> +		ret = of_add_property(np, prop);
> >> +		if (ret < 0)
> >> +			dev_info(dev, "unable to add tx-fifo-resize prop\n");
> 
> Hi Greg,
> > 
> > Is that really an "informational" error?  :(
> > 
> >
> We can remove it.  If anything we can always check the sysfs if the
> property is present or not.

Sorry for being vague.  That message should be dev_err(), and not
dev_info(), right?

> >> +	}
> > 
> > So if you can not allocate memory, you just fail quietly?  Are you sure
> > that is ok?
> > 
> > Please properly handle errors.
> > 
> OK, will handle the case where we can't allocate memory for the property.

And the case for when of_add_property() fails.

thanks,

greg k-h
