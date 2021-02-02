Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1CD30C73A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 18:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236199AbhBBROA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 12:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236373AbhBBQZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 11:25:32 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F47C0617A7
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Feb 2021 08:23:09 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id j25so23384400oii.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Feb 2021 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nmtKOztRPU1FHLWkkh8andN7amnZAPXC6AXlDwUJfkM=;
        b=xNfXP/GMRfWtyYmR9X6j3Nh5jpiQWgvYPDyLx6wo9BR1leBdbgF/GRp292X0xCbDLo
         B8cDJzU8sTUW6RmBsm847N2mLoDOnrdopQyxp1b4Jr7gDGa+jXrvkQxO7rcu6inHKgdL
         tavjCt2VYeCDmdZL59OfjHZ9FxvBYU7rjqgTHt+M+kAn0EvcsDV1w2wOtQUkpD7Lu5wr
         mjW/+i2cCdzKU47Ya9YSlwSiVtGWlf1C3AsZSAili3iYsHJrRDhRG4k8I3jaXVG+SqGX
         +2Tal4E0nSdNaANLcxedEHeXD6p4qCN4crrT8EMJqzkaijuMhmTkN5FRbkzg4muxKKDt
         achw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nmtKOztRPU1FHLWkkh8andN7amnZAPXC6AXlDwUJfkM=;
        b=HiABL2aO34g3Nx35Ape4IGdgcl8eRbJLDtnENx7ZVBpxXDi6p/FvzWWg4JqC6K+wvB
         7LUshHINSS77XeHA59Q9kvPPV8igLCMSMqalQtWHmmWvVXvcVLrwPb+KLRj3VczaXjR4
         rbb9dx1dP5hu+/HaqjBo2D0G0eEPvR/sS4v6oN/zpc/dn1ySGMIpx8f+Zq+dv2NPGi5m
         M6cctmnzbwcFoeVSJXNNCNmG5dZ1nZqXGF+m+9OZfQnob2cj99Vefqga6GzkZhPv5rqq
         sf5c+d/+B9BEfpcWqF+9iympM3YGHrr6HtOCLAEc4S4rIrbHhe3uSt62O6Xovvt1BUst
         XsPg==
X-Gm-Message-State: AOAM530oB4Wl/LLsNerJimt7GxbLZbOidDGkSIVKD2n1ZF07Eiv+AoY/
        XnHp50egQCgGbxiw6G/dMGnjTA==
X-Google-Smtp-Source: ABdhPJztV5fpvulQl1IAaifHUQhhM0mV4tu9adu6SEVgj9qRz3WaVUCEDUhOOYl0wj0Dwz1yPDqKSA==
X-Received: by 2002:aca:308a:: with SMTP id w132mr3114257oiw.69.1612282988874;
        Tue, 02 Feb 2021 08:23:08 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q3sm4239695oih.35.2021.02.02.08.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:23:08 -0800 (PST)
Date:   Tue, 2 Feb 2021 10:23:06 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
 property by default
Message-ID: <YBl8aszdk1xgbg1i@builder.lan>
References: <1611895604-4496-1-git-send-email-wcheng@codeaurora.org>
 <1611895604-4496-5-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611895604-4496-5-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Jan 22:46 CST 2021, Wesley Cheng wrote:

> In order to take advantage of the TX fifo resizing logic, manually add
> these properties to the DWC3 child node by default.  This will allow
> the DWC3 gadget to resize the TX fifos for the IN endpoints, which
> help with performance.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d803ee9..4ea6be3 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -564,6 +564,7 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>  
>  static const struct property_entry dwc3_qcom_acpi_properties[] = {
>  	PROPERTY_ENTRY_STRING("dr_mode", "host"),
> +	PROPERTY_ENTRY_BOOL("tx-fifo-resize"),

I checked the ACPI tables for Lenovo Miix 630, Yoga C630 and Flex 5G and
neither one has this property specified. So while we could just add this
here, it would have to be done in collaboration with the people who
actually define these. And as said before, I believe we want this to
always be enabled.

>  	{}
>  };
>  
> @@ -634,6 +635,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
>  	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
>  	struct device		*dev = &pdev->dev;
> +	struct property		*prop;
>  	int			ret;
>  
>  	dwc3_np = of_get_child_by_name(np, "dwc3");
> @@ -642,6 +644,14 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	if (prop) {
> +		prop->name = "tx-fifo-resize";
> +		ret = of_add_property(dwc3_np, prop);

Can't we come up with a way where the platform driver enables this on
the core driver without modifying DT?

Regards,
Bjorn

> +		if (ret < 0)
> +			dev_info(dev, "unable to add tx-fifo-resize prop\n");
> +	}
> +
>  	ret = of_platform_populate(np, NULL, NULL, dev);
>  	if (ret) {
>  		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
