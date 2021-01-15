Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E8E2F715B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 05:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732845AbhAOEDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 23:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729761AbhAOEDG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 23:03:06 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5395EC061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 20:02:26 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id n42so7344512ota.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 20:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ldAmvmnxMD0Jw6zPOH3cGSkkAH8B3sX/EQd75/G60fg=;
        b=ra6iegm7u9dRGUFWV5n6V9ET5zprjEfL37odcKV4QWJc39+eFR3F6F/AntZdnUb6ow
         1Z8GEu1BhGf/K6Ko+zYpLYBjpAAeNPPALPSoQ4XxK5/bs3CVisXC1I9QVW5ga64mW93W
         oQ2eX88xQYHcaJRo8IxN+fT5eLkVhYe8ai+wfBbtlGOHjGVLIm2o6MoaIbBzSGFJu3/8
         0jSFfm8iLESuyrKZEFZGm91bC9+HBXvfjhYCeQOkO7/Vt70Q1iWxRrskMW1OpJLhd0qH
         o9w5mDMg/0mQ7M5+Zl/ALpY0IkT1L8hHPw2VrnAY4y7GciZ0uSJWwJ8dJ6GMQiIZwDG7
         PzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ldAmvmnxMD0Jw6zPOH3cGSkkAH8B3sX/EQd75/G60fg=;
        b=n2VWKasEk+eys8Qv/vi8J0LtdWwtElvYZSlp93tLCRrpHyaRCnGSppMbIryKCKwRCC
         +Hoh2g9CmYL3vGSbkh6UeP+y6kSNWgnOwTQ2fFajbkYTEcDhTtOPh+E+nBAhe2jrf4kE
         bMZ4cFkN5/s6uEBAMYXR/zE8X8Z5GsBSx6kacaKnNcEOBR87j857VjXEj6VcM6Zk/DAV
         ptqKd/fqUMnBqhWbl42xZN2sUglhuv5OcUBlmM6DdIjHZDVQ7l1BpiUduUMiSl/vWza4
         Rs+m6h+B9qXvlhrEqUQLyaAIoLZFV3LqpZakBmCE/Pt+J+BoacAlu/PFjxhneXudvw0Z
         br7w==
X-Gm-Message-State: AOAM531WybLpoAg8qo9+93WSXKl/+M1dscJ87mBLf6YMKNTbHTePUqgZ
        F9t8L08uT8vnh15Zy7phRvDfHA==
X-Google-Smtp-Source: ABdhPJw+w4rUfErAnomXQxHBz0L6vzp+Y0xrfWQ29SiFiruXgjbSRkb0tTya/YRt+6tz+gM6Ix/BYA==
X-Received: by 2002:a9d:6c8:: with SMTP id 66mr7128776otx.257.1610683345736;
        Thu, 14 Jan 2021 20:02:25 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p28sm1545789ota.14.2021.01.14.20.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 20:02:25 -0800 (PST)
Date:   Thu, 14 Jan 2021 22:02:23 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: add URS Host support for sdm845 ACPI
 boot
Message-ID: <20210115040223.GA1241218@yoga>
References: <20210115035057.10994-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115035057.10994-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 Jan 21:50 CST 2021, Shawn Guo wrote:

> For sdm845 ACPI boot, the URS (USB Role Switch) node in ACPI DSDT table
> holds the memory resource, while interrupt resources reside in the child
> nodes USB0 and UFN0.  It adds USB0 host support by probing URS node,
> creating platform device for USB0 node, and then retrieve interrupt
> resources from USB0 platform device.
> 

This looks reasonable, thanks for updating the search.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
> - Instead of assuming that USB0 is always the first child of URS0, find
>   the child using node name.
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 59 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c703d552bbcf..d803ee98c628 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -60,12 +60,14 @@ struct dwc3_acpi_pdata {
>  	int			dp_hs_phy_irq_index;
>  	int			dm_hs_phy_irq_index;
>  	int			ss_phy_irq_index;
> +	bool			is_urs;
>  };
>  
>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
>  	struct platform_device	*dwc3;
> +	struct platform_device	*urs_usb;
>  	struct clk		**clks;
>  	int			num_clocks;
>  	struct reset_control	*resets;
> @@ -429,13 +431,15 @@ static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
>  static int dwc3_qcom_get_irq(struct platform_device *pdev,
>  			     const char *name, int num)
>  {
> +	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
> +	struct platform_device *pdev_irq = qcom->urs_usb ? qcom->urs_usb : pdev;
>  	struct device_node *np = pdev->dev.of_node;
>  	int ret;
>  
>  	if (np)
> -		ret = platform_get_irq_byname(pdev, name);
> +		ret = platform_get_irq_byname(pdev_irq, name);
>  	else
> -		ret = platform_get_irq(pdev, num);
> +		ret = platform_get_irq(pdev_irq, num);
>  
>  	return ret;
>  }
> @@ -568,6 +572,8 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
>  	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
>  	struct device		*dev = &pdev->dev;
>  	struct resource		*res, *child_res = NULL;
> +	struct platform_device	*pdev_irq = qcom->urs_usb ? qcom->urs_usb :
> +							    pdev;
>  	int			irq;
>  	int			ret;
>  
> @@ -597,7 +603,7 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
>  	child_res[0].end = child_res[0].start +
>  		qcom->acpi_pdata->dwc3_core_base_size;
>  
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq(pdev_irq, 0);
>  	child_res[1].flags = IORESOURCE_IRQ;
>  	child_res[1].start = child_res[1].end = irq;
>  
> @@ -651,6 +657,33 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static struct platform_device *
> +dwc3_qcom_create_urs_usb_platdev(struct device *dev)
> +{
> +	struct fwnode_handle *fwh;
> +	struct acpi_device *adev;
> +	char name[8];
> +	int ret;
> +	int id;
> +
> +	/* Figure out device id */
> +	ret = sscanf(fwnode_get_name(dev->fwnode), "URS%d", &id);
> +	if (!ret)
> +		return NULL;
> +
> +	/* Find the child using name */
> +	snprintf(name, sizeof(name), "USB%d", id);
> +	fwh = fwnode_get_named_child_node(dev->fwnode, name);
> +	if (!fwh)
> +		return NULL;
> +
> +	adev = to_acpi_device_node(fwh);
> +	if (!adev)
> +		return NULL;
> +
> +	return acpi_create_platform_device(adev, NULL);
> +}
> +
>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct device_node	*np = pdev->dev.of_node;
> @@ -715,6 +748,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			qcom->acpi_pdata->qscratch_base_offset;
>  		parent_res->end = parent_res->start +
>  			qcom->acpi_pdata->qscratch_base_size;
> +
> +		if (qcom->acpi_pdata->is_urs) {
> +			qcom->urs_usb = dwc3_qcom_create_urs_usb_platdev(dev);
> +			if (!qcom->urs_usb) {
> +				dev_err(dev, "failed to create URS USB platdev\n");
> +				return -ENODEV;
> +			}
> +		}
>  	}
>  
>  	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
> @@ -877,8 +918,20 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
>  	.ss_phy_irq_index = 2
>  };
>  
> +static const struct dwc3_acpi_pdata sdm845_acpi_urs_pdata = {
> +	.qscratch_base_offset = SDM845_QSCRATCH_BASE_OFFSET,
> +	.qscratch_base_size = SDM845_QSCRATCH_SIZE,
> +	.dwc3_core_base_size = SDM845_DWC3_CORE_SIZE,
> +	.hs_phy_irq_index = 1,
> +	.dp_hs_phy_irq_index = 4,
> +	.dm_hs_phy_irq_index = 3,
> +	.ss_phy_irq_index = 2,
> +	.is_urs = true,
> +};
> +
>  static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
>  	{ "QCOM2430", (unsigned long)&sdm845_acpi_pdata },
> +	{ "QCOM0304", (unsigned long)&sdm845_acpi_urs_pdata },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
> -- 
> 2.17.1
> 
