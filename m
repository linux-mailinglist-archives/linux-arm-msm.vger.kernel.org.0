Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F6521A5AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 19:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgGIRTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 13:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgGIRTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 13:19:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47327C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 10:19:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j20so1298654pfe.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/eYaAi29Ge9mMMcdJXujZA7mib2mBduzBB40dVilT1E=;
        b=XVRu6yu412h+RQda3LXf4LYgFPOLXwRgQzdEKSGM9oS9yBeFI50OrEM9Ip4ytwe+Xc
         HsQZR/xPSzesUemqfFYe0hm3x1dI983T+pkTB5AYu4zVjeeUvhuxEfhPyR3h6o53hL3b
         KCVMGjS+2yY2aPcDFHdh7qmIuZibtQYZanmXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/eYaAi29Ge9mMMcdJXujZA7mib2mBduzBB40dVilT1E=;
        b=iZvUn2XpAXTnh200s1/GpP0W3EwzcP50uVeCw7u6j15J08Biy5YCjSuA2Ohz23zwYi
         6M2QKFIbSNr2cBduM/TPwPi/DZZFVRY57ZsD5dMHDO9HibeWhGGKZO5PuRYW8xx6pMiN
         +z8frAaghU59F6aY2tE1WCJ+2/JU2HdiowjoQpBQFVP9o5HCcowkGWp3PMoutH7TTNW3
         2hquG/BxEFO0svk1Fo5Hom+7PvAwru8jNrmSwQb+OgJtGW4fwy9R9qe6yW289T1Foxf2
         bqRF7fryhvSzR6A7T4t5VXCvinfYP2NgMj3eiEHrbgFoEAegKTQaRdiHJAS9tYICEQnA
         zgng==
X-Gm-Message-State: AOAM533JYbssvFdPItCBrrxNmTULlLzWxH+8EPMIWVrMNfyVgsAZEUV9
        DU/VJptxvyuLCmqwVgHy1ki14w==
X-Google-Smtp-Source: ABdhPJzbtIPSoHC3fKO8iaAuc/9xNExb0OC4k9706FMm6y5sKrrQtQNGQAjUHAQ0o0Ssu20peEr0qQ==
X-Received: by 2002:a63:6442:: with SMTP id y63mr52746649pgb.18.1594315146665;
        Thu, 09 Jul 2020 10:19:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id x9sm3138814pgr.57.2020.07.09.10.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 10:19:05 -0700 (PDT)
Date:   Thu, 9 Jul 2020 10:19:04 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v8 1/2] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200709171904.GK3191083@google.com>
References: <1594310413-14577-1-git-send-email-sanm@codeaurora.org>
 <1594310413-14577-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594310413-14577-2-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

On Thu, Jul 09, 2020 at 09:30:11PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB master to
> DDR slave. The other is from APPS master to USB slave.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 127 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 125 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..5532988 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/extcon.h>
> +#include <linux/interconnect.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> @@ -43,6 +44,14 @@
>  #define SDM845_QSCRATCH_SIZE			0x400
>  #define SDM845_DWC3_CORE_SIZE			0xcd00
>  
> +/* Interconnect path bandwidths in MBps */
> +#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
> +#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
> +#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> +#define APPS_USB_AVG_BW 0
> +#define APPS_USB_PEAK_BW MBps_to_icc(40)
> +
>  struct dwc3_acpi_pdata {
>  	u32			qscratch_base_offset;
>  	u32			qscratch_base_size;
> @@ -73,9 +82,12 @@ struct dwc3_qcom {
>  
>  	const struct dwc3_acpi_pdata *acpi_pdata;
>  
> +	enum usb_device_speed   max_speed;
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	struct icc_path		*usb_ddr_icc_path;
> +	struct icc_path		*apps_usb_icc_path;

nit: the names are a bit clunky, the 'usb' part is redundant. You could name
'icc_path_ddr' and 'icc_path_apps' or add an anonymous struct:

	struct {
	       struct icc_path ddr;
	       struct icc_path apps;
        };

not super-important, but since it looks like you have to respin anyway it's
something to consider.

>  };
>  
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
> @@ -190,6 +202,99 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
>  	return 0;
>  }
>  
> +/* Currently we only use bandwidth level, so just "enable" interconnects */
> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
> +{
> +	int ret;
> +
> +	if (qcom->max_speed >= USB_SPEED_SUPER)
> +		ret = icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +	else
> +		ret = icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = icc_set_bw(qcom->apps_usb_icc_path,
> +		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
> +	if (ret)
> +		icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> +

The helpers icc_enable/disable() were recently added. With that you only
have to set the bandwidth once (unless it changes) and then use icc_disable()
to set it to 0 and icc_enable() to restore it.

With icc_enable/disable() the above code would move to
dwc3_qcom_interconnect_init(). It would also make it unnecessary to
have a 'max_speed' field in struct dwc3_qcom.

With that it might not be worth to keep dwc3_qcom_interconnect_enable/disable(),
since they will be relatively short and only have a single caller.

> +	return ret;
> +}
> +
> +/* To disable an interconnect, we just set its bandwidth to 0 */
> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
> +{
> +	int ret;
> +
> +	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
> +	if (ret)
> +		goto err_reenable_memory_path;
> +
> +	return 0;
> +
> +	/* Re-enable things in the event of an error */
> +err_reenable_memory_path:
> +	dwc3_qcom_interconnect_enable(qcom);
> +
> +	return ret;
> +}
> +
> +/**
> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> + * @qcom:			Pointer to the concerned usb core.
> + *
> + */
> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +	struct device *dev = qcom->dev;
> +	int ret;
> +
> +	if (!device_is_bound(&qcom->dwc3->dev))
> +		return -EPROBE_DEFER;

This is the main reason you need to respin. The outcome of earlier
discussions with Greg KH and Rob Herring was that using device_is_bound()
isn't the correct solution, which is why you call usb_get_maximum_speed()
in _probe().

> +
> +	qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
> +	if (IS_ERR(qcom->usb_ddr_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting usb-ddr path\n",

nit: the "Error ... failed" is a bit redundant, the message is also
inconsistent with the format used when dwc3_qcom_interconnect_enable()
fails (a few lines further below). I would suggest to use "failed to
<whatever failed>: %d\n".

> +			PTR_ERR(qcom->usb_ddr_icc_path));
> +		return PTR_ERR(qcom->usb_ddr_icc_path);
> +	}
> +
> +	qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
> +	if (IS_ERR(qcom->apps_usb_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting apps-usb path\n",
> +				PTR_ERR(qcom->apps_usb_icc_path));

ditto

> +		return PTR_ERR(qcom->apps_usb_icc_path);
> +	}
> +
> +	ret = dwc3_qcom_interconnect_enable(qcom);
> +	if (ret) {
> +		dev_err(dev, "failed to enable interconnect %d\n", ret);

nit: add ':' after 'interconnect'

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * dwc3_qcom_interconnect_exit() - Release interconnect path handles
> + * @qcom:			Pointer to the concerned usb core.
> + *
> + * This function is used to release interconnect path handle.
> + */
> +static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
> +{
> +	icc_put(qcom->usb_ddr_icc_path);
> +	icc_put(qcom->apps_usb_icc_path);
> +}
> +
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	if (qcom->hs_phy_irq) {
> @@ -239,7 +344,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
> -	int i;
> +	int i, ret;
>  
>  	if (qcom->is_suspended)
>  		return 0;
> @@ -251,6 +356,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  	for (i = qcom->num_clocks - 1; i >= 0; i--)
>  		clk_disable_unprepare(qcom->clks[i]);
>  
> +	ret = dwc3_qcom_interconnect_disable(qcom);
> +	if (ret)
> +		dev_warn(qcom->dev, "failed to disable interconnect %d\n", ret);

nit: add ':' after 'interconnect'.

> +
>  	qcom->is_suspended = true;
>  	dwc3_qcom_enable_interrupts(qcom);
>  
> @@ -276,6 +385,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  		}
>  	}
>  
> +	ret = dwc3_qcom_interconnect_enable(qcom);
> +	if (ret)
> +		dev_warn(qcom->dev, "failed to enable interconnect %d\n", ret);

ditto
