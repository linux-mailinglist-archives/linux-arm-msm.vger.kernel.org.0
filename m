Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0333B9BE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jul 2021 07:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhGBFJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 01:09:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234791AbhGBFJa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 01:09:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2278613CD;
        Fri,  2 Jul 2021 05:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625202418;
        bh=6jOck3IDNnAka4Y2nPhVKvfxYF7mCEWowFbLzPZzxNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MFoumE/MfVpzIMhhLm6bt7ojBm0KKhgT3aQU+4EPxUyguwguUcSLYBzZV/I2MeruA
         DPIwEhcL4N+2gtqrnpsiDGZz8N7xoyaAtYXA3jiCxufjOYrn4HEW0F6ZgOpZIYz3eQ
         YwKLk17fb4zqlKX6MjA2cBqLklUMR3VveKLHSFX4=
Date:   Fri, 2 Jul 2021 07:06:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        fntoth@gmail.com
Subject: Re: [PATCH v11 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
 property by default
Message-ID: <YN6e8G1e9cZBBMr7@kroah.com>
References: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
 <1625043642-29822-5-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625043642-29822-5-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 30, 2021 at 02:00:41AM -0700, Wesley Cheng wrote:
> In order to take advantage of the TX fifo resizing logic, manually add
> these properties to the DWC3 child node by default.  This will allow
> the DWC3 gadget to resize the TX fifos for the IN endpoints, which
> help with performance.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 49e6ca9..cec4f4a 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -640,6 +640,25 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +#ifdef CONFIG_OF
> +static void dwc3_qcom_add_dt_props(struct device *dev, struct device_node *np)
> +{
> +	struct property		*prop;
> +	int ret;
> +
> +	prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
> +	if (prop) {
> +		prop->name = "tx-fifo-resize";
> +		ret = of_add_property(np, prop);
> +		if (ret < 0)
> +			dev_info(dev, "unable to add tx-fifo-resize prop\n");

Is that really an "informational" error?  :(


> +	}

So if you can not allocate memory, you just fail quietly?  Are you sure
that is ok?

Please properly handle errors.

greg k-h
