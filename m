Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9CA63B75D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 17:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbhF2Puk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 11:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbhF2Puj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 11:50:39 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1DCC061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:48:11 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id k206so7886331oif.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eSKZnNIRUKzRzjpfV+QcfterYDHeolkGTCLO2ji6H8A=;
        b=i8SQMR5FUR5xDa2jEPOQ2quIWgzt2DGPCXtNycZFZtGLAsn5kVfSRBayMX5TrrWXst
         K48ZMv0pgmBbh7Pes3MN9U4bi6TVXM8u3OkDt0B3xVdO7zKcBFHQ0zQpsG/GozvphQEF
         CaN1MbcoWBn0h8ohFaArbNWkSbzyILiVdt0GeC6nn+x10J0yLxuPGQEBT8WFWsyPwgou
         m++nZlK+efHnkiaCueQtoB03Kkz7PN1DK5IVkpP/bSkmlrFrqvq85Lh2BkAxZdjr/CaI
         HbLfIT28mZF73RMBW6ud1K7n5ppPHxMBsyT81iIYfnnz4l/jX6Jkt3UECqaItgFKVZqu
         HGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eSKZnNIRUKzRzjpfV+QcfterYDHeolkGTCLO2ji6H8A=;
        b=oqeYfrRTUMzsL4IkKtHSyDSbuFPv9DGOXfJv9QE0M4eDBl2iZ09Bwh66Xsq51i7XkA
         x7/TlkDyqRvHiwT2d/jXwfYJIogMwI6REt6qNCkBrLnPQ4mATz4v31kfN93WZXqHCNcD
         Ym8gBdyKxjLewfd2ydlGHDxzM5B7WnxifKFdI8oOOIJUV0G3qypXRzK+1DHNs9JgtAnU
         pEHLiEwGRGJ+FIS/8ewOb1m+KGd3xq/nOvKUOwHcbCK1uCbOkilcB56PaLM4dQ8EsaQf
         29w5jt/kP9gdI3UpWUrPrp4h5bJX/+udINuFl/41maeusMXc57dqrugQoxVUD1xKDGOu
         17vQ==
X-Gm-Message-State: AOAM5323pHGCeiYiE7WmJKH0hJdAQFc+Dg4WlHs2Uro8NNPefQQ0Bwpc
        jhXEIJVcRQ5lNUOoC1oGz0Cmmg==
X-Google-Smtp-Source: ABdhPJyzyfgjGm3FcunjCc/AqchnZJt1m+JFIFwhyipeErRomqrEarC009tJmz/gKKNM4eu9ZSP++A==
X-Received: by 2002:a05:6808:148:: with SMTP id h8mr15601147oie.12.1624981690556;
        Tue, 29 Jun 2021 08:48:10 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f25sm4157929oto.26.2021.06.29.08.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 08:48:09 -0700 (PDT)
Date:   Tue, 29 Jun 2021 10:48:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and
 register role switch
Message-ID: <YNtAt3dCGGyj5DU/@yoga>
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629144449.2550737-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Jun 09:44 CDT 2021, Bryan O'Donoghue wrote:

> From: Wesley Cheng <wcheng@codeaurora.org>
> 
> If registering a USB typeC connector, the connector node may not be a child
> of the DWC3 QCOM device.  Utilize devcon graph search to lookup if any
> remote endpoints contain the connector.  If a connector is present, the
> DWC3 QCOM will register a USB role switch to receive role change events, as
> well as attain a reference to the DWC3 core role switch to pass the event
> down.
> 

What's wrong with the switch that dwc3_setup_role_switch() sets up?

That's what I've been using in my UCSI hacking on Snapdragon 888 and it
seems to work...

Regards,
Bjorn

> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 118 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 49e6ca94486d..4491704503ab 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -20,6 +20,8 @@
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
>  #include <linux/iopoll.h>
> +#include <linux/fwnode.h>
> +#include <linux/usb/role.h>
>  
>  #include "core.h"
>  
> @@ -82,6 +84,9 @@ struct dwc3_qcom {
>  	struct notifier_block	vbus_nb;
>  	struct notifier_block	host_nb;
>  
> +	struct usb_role_switch *role_sw;
> +	struct usb_role_switch *dwc3_drd_sw;
> +
>  	const struct dwc3_acpi_pdata *acpi_pdata;
>  
>  	enum usb_dr_mode	mode;
> @@ -296,6 +301,73 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
>  	icc_put(qcom->icc_path_apps);
>  }
>  
> +static int dwc3_qcom_usb_role_switch_set(struct usb_role_switch *sw,
> +					 enum usb_role role)
> +{
> +	struct dwc3_qcom *qcom = usb_role_switch_get_drvdata(sw);
> +	struct fwnode_handle *child;
> +	bool enable = false;
> +
> +	if (!qcom->dwc3_drd_sw) {
> +		child = device_get_next_child_node(qcom->dev, NULL);
> +		if (child) {
> +			qcom->dwc3_drd_sw = usb_role_switch_find_by_fwnode(child);
> +			fwnode_handle_put(child);
> +			if (IS_ERR(qcom->dwc3_drd_sw)) {
> +				qcom->dwc3_drd_sw = NULL;
> +				return 0;
> +			}
> +		}
> +	}
> +
> +	usb_role_switch_set_role(qcom->dwc3_drd_sw, role);
> +
> +	if (role == USB_ROLE_DEVICE)
> +		enable = true;
> +	else
> +		enable = false;
> +
> +	qcom->mode = (role == USB_ROLE_HOST) ? USB_DR_MODE_HOST :
> +					       USB_DR_MODE_PERIPHERAL;
> +	dwc3_qcom_vbus_overrride_enable(qcom, enable);
> +	return 0;
> +}
> +
> +static enum usb_role dwc3_qcom_usb_role_switch_get(struct usb_role_switch *sw)
> +{
> +	struct dwc3_qcom *qcom = usb_role_switch_get_drvdata(sw);
> +	enum usb_role role;
> +
> +	switch (qcom->mode) {
> +	case USB_DR_MODE_HOST:
> +		role = USB_ROLE_HOST;
> +		break;
> +	case USB_DR_MODE_PERIPHERAL:
> +		role = USB_ROLE_DEVICE;
> +		break;
> +	default:
> +		role = USB_ROLE_DEVICE;
> +		break;
> +	}
> +
> +	return role;
> +}
> +
> +static int dwc3_qcom_setup_role_switch(struct dwc3_qcom *qcom)
> +{
> +	struct usb_role_switch_desc dwc3_role_switch = {NULL};
> +
> +	dwc3_role_switch.fwnode = dev_fwnode(qcom->dev);
> +	dwc3_role_switch.set = dwc3_qcom_usb_role_switch_set;
> +	dwc3_role_switch.get = dwc3_qcom_usb_role_switch_get;
> +	dwc3_role_switch.driver_data = qcom;
> +	qcom->role_sw = usb_role_switch_register(qcom->dev, &dwc3_role_switch);
> +	if (IS_ERR(qcom->role_sw))
> +		return PTR_ERR(qcom->role_sw);
> +
> +	return 0;
> +}
> +
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	if (qcom->hs_phy_irq) {
> @@ -698,6 +770,40 @@ dwc3_qcom_create_urs_usb_platdev(struct device *dev)
>  	return acpi_create_platform_device(adev, NULL);
>  }
>  
> +static int dwc3_qcom_connector_check(struct fwnode_handle *fwnode)
> +{
> +	if (fwnode && (!fwnode_property_match_string(fwnode, "compatible",
> +						     "gpio-usb-b-connector") ||
> +	    !fwnode_property_match_string(fwnode, "compatible",
> +					  "usb-c-connector")))
> +		return 1;
> +
> +	return 0;
> +}
> +
> +static void *dwc3_qcom_find_usb_connector_match(struct fwnode_handle *fwnode,
> +						const char *id, void *data)
> +{
> +	/* Check if the "connector" node is the parent of the remote endpoint */
> +	if (dwc3_qcom_connector_check(fwnode))
> +		return fwnode;
> +
> +	/* else, check if it is a child node */
> +	fwnode = fwnode_get_named_child_node(fwnode, "connector");
> +	if (dwc3_qcom_connector_check(fwnode))
> +		return fwnode;
> +
> +	return 0;
> +}
> +
> +static bool dwc3_qcom_find_usb_connector(struct platform_device *pdev)
> +{
> +	struct fwnode_handle *fwnode = pdev->dev.fwnode;
> +
> +	return fwnode_connection_find_match(fwnode, "connector", NULL,
> +					    dwc3_qcom_find_usb_connector_match);
> +}
> +
>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct device_node	*np = pdev->dev.of_node;
> @@ -813,8 +919,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
>  		dwc3_qcom_vbus_overrride_enable(qcom, true);
>  
> -	/* register extcon to override sw_vbus on Vbus change later */
> -	ret = dwc3_qcom_register_extcon(qcom);
> +	if (dwc3_qcom_find_usb_connector(pdev)) {
> +		ret = dwc3_qcom_setup_role_switch(qcom);
> +	} else {
> +		/* register extcon to override sw_vbus on Vbus change later */
> +		ret = dwc3_qcom_register_extcon(qcom);
> +	}
> +
>  	if (ret)
>  		goto interconnect_exit;
>  
> @@ -850,6 +961,9 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	int i;
>  
> +	usb_role_switch_unregister(qcom->role_sw);
> +	usb_role_switch_put(qcom->dwc3_drd_sw);
> +
>  	device_remove_software_node(&qcom->dwc3->dev);
>  	of_platform_depopulate(dev);
>  
> -- 
> 2.30.1
> 
