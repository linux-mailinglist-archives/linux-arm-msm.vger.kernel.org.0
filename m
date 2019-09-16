Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E493EB43EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 00:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733183AbfIPWYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 18:24:51 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42114 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfIPWYu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 18:24:50 -0400
Received: by mail-pl1-f194.google.com with SMTP id e5so519191pls.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2019 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g4mdnlTpKH063Bwavs1TQT240NfRxaGQCeG+1abAo/k=;
        b=HfLX+S/C7Qmtr8+a8flAM790J/TUzoYPiNsrdb5f8W8+8Jh88g3cYfjbyDBuj7Ae6X
         XjcvuxYb5M/sS9bP9CjJjz+Sfzi4KhD+28+xaABJQckAl0s9FM8vl1OACXnwPKgOHTSU
         OciazszRG2oiFIzztDFymIhBH+ow7TOvGRHDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g4mdnlTpKH063Bwavs1TQT240NfRxaGQCeG+1abAo/k=;
        b=ry56HeJRVYxd2YGmhp8JHvtmO6a91IGaT+EW3wQL0+cdnAeRqig62dhyKkNBbul+8m
         HpV/VVYpGUlUSFOOFeXMdN7Bn1GqMWBNi7OuOratKsRF43VrAs1TjUaGKL/8q84wMNdw
         sqtr7en1dLF4oJzDaS+TgZP1FbWwgmp6mk4wBM6suHf28nc62gQCqybwDCdD9e1FM48i
         u4qdPz7e5TkYiZ3HdAr5kOCTpzfoFr6bOHbCTAXCTGvgEhW9iy4NlhyzkGe7t3eXhpaQ
         IiF2sS91I/8zpeJrUouJ6cV6eT0mvxpRxnIMxZY7OEHPB2EvRcxfLnPx8IOg0GN/lSxB
         5/jw==
X-Gm-Message-State: APjAAAXWKZxEPjCk4Vp9xgPKMThVmWY5an3o2NGTIUgk1SNgYna25CWC
        c1v4U9kD2oZp/QGhFDVbQYkwW7Vbu0E=
X-Google-Smtp-Source: APXvYqy3/B4zxmhDJKtgIMXua93/1OX7igMmvi/Iu5W4myyw/lJH+zMjZHmPUe0detJr9u04S3rROQ==
X-Received: by 2002:a17:902:6b47:: with SMTP id g7mr437482plt.198.1568672689866;
        Mon, 16 Sep 2019 15:24:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id z10sm172820pjr.15.2019.09.16.15.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2019 15:24:49 -0700 (PDT)
Date:   Mon, 16 Sep 2019 15:24:46 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 2/3] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20190916222446.GG133864@google.com>
References: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
 <1568634061-14455-3-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568634061-14455-3-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Chandana,

On Mon, Sep 16, 2019 at 05:11:00PM +0530, Chandana Kishori Chiluveru wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB master to
> DDR slave. The other is from APPS master to USB slave.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 145 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 143 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 184df4d..4f6c9736 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -14,6 +14,7 @@
>  #include <linux/extcon.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/interconnect.h>

please use alphabetical order, i.e. this should be after 'linux/extcon.h'.

>  #include <linux/phy/phy.h>
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
> @@ -59,8 +60,13 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	struct icc_path		*usb_ddr_icc_path;
> +	struct icc_path		*apps_usb_icc_path;
>  };
>  
> +static int usb_interconnect_enable(struct dwc3_qcom *qcom);
> +static int usb_interconnect_disable(struct dwc3_qcom *qcom);
> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>  	u32 reg;
> @@ -222,7 +228,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
> -	int i;
> +	int i, ret;
>  
>  	if (qcom->is_suspended)
>  		return 0;
> @@ -234,6 +240,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  	for (i = qcom->num_clocks - 1; i >= 0; i--)
>  		clk_disable_unprepare(qcom->clks[i]);
>  
> +	/* Remove bus voting */

IMO the comment doesn't add much, especially since there is a log in
case of failure.

> +	ret = usb_interconnect_disable(qcom);
> +	if (ret)
> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);

This should probably be a warning, since the function continues with
normal execution.

nit: the function is called usb_interconnect_disable(), but the
message says "bus bw voting failed". The function name encapsulates
what the function does, but the message talks about implementation
details. To be consistent either the function should have something
about 'voting' in it's name, or the message should be "failed to
disable interconnect" or similar.

> +
>  	qcom->is_suspended = true;
>  	dwc3_qcom_enable_interrupts(qcom);
>  
> @@ -259,6 +270,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  		}
>  	}
>  
> +	/* Add bus voting */
> +	ret = usb_interconnect_enable(qcom);
> +	if (ret)
> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
> +

same comments as for suspend()

>  	/* Clear existing events from PHY related to L2 in/out */
>  	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
>  			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
> @@ -268,6 +284,117 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  	return 0;
>  }
>  
> +/* Interconnect path bandwidths in MBps */
> +#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
> +#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
> +#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> +#define APPS_USB_AVG_BW 0
> +#define APPS_USB_PEAK_BW MBps_to_icc(40)
> +
> +/**
> + * usb_interconnect_init() -

A function named 'usb_*' is typically associated to be a USB core
function. I would suggest to use the 'dwc3_qcom_' prefix like all
other functions in this file. Applicable to all new functions.

> Request to get interconnect path handle

nit: handles

Get rid of "Request to"?

> + * @qcom:			Pointer to the concerned usb core.
> + *
> + */
> +static int usb_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +	struct device *dev = qcom->dev;
> +
> +	qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
> +	if (IS_ERR(qcom->usb_ddr_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting %s path\n",
> +			PTR_ERR(qcom->usb_ddr_icc_path), "usb-ddr");

Why not put 'usb-ddr' in the format string, instead of using '%s'?

> +		return PTR_ERR(qcom->usb_ddr_icc_path);
> +	}
> +
> +	qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
> +	if (IS_ERR(qcom->apps_usb_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting %s path\n",
> +				PTR_ERR(qcom->apps_usb_icc_path), "apps-usb");

same comment as above.

     	     	icc_put(qcom->usb_ddr_icc_path);

> +		return PTR_ERR(qcom->usb_ddr_icc_path);

should be 'qcom->apps_usb_icc_path'

> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * geni_interconnect_exit() -

wrong prefix

> Request to release interconnect path handle

nit: handles

Get rid of "Request to"?

> + * @qcom:			Pointer to the concerned usb core.
> + *
> + * This function is used to release interconnect path handle.
> + */
> +static void usb_interconnect_exit(struct dwc3_qcom *qcom)
> +{
> +	icc_put(qcom->usb_ddr_icc_path);
> +	icc_put(qcom->apps_usb_icc_path);
> +}
> +
> +/* Currently we only use bandwidth level, so just "enable" interconnects */
> +static int usb_interconnect_enable(struct dwc3_qcom *qcom)
> +{
> +	struct dwc3 *dwc;
> +	int ret;
> +
> +	dwc = platform_get_drvdata(qcom->dwc3);
> +	if (!dwc) {
> +		dev_err(qcom->dev, "Failed to get dwc3 device\n");
> +		return -EPROBE_DEFER;
> +	}

This should never happen, drvdata is set in _probe(). If it happens
-EPROBE_DEFER doesn't seem to be an appropriate error code. I suggest
to remove the condition entirely.

> +
> +	if (dwc->maximum_speed == USB_SPEED_SUPER) {
> +		ret = icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = icc_set_bw(qcom->apps_usb_icc_path,
> +		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
> +	if (ret)
> +		goto err_disable_mem_path;
> +
> +	return 0;
> +
> +err_disable_mem_path:
> +	icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> +
> +	return ret;
> +}
> +
> +/* To disable an interconnect, we just set its bandwidth to 0 */
> +static int usb_interconnect_disable(struct dwc3_qcom *qcom)
> +{
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
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
> +	if (dwc->maximum_speed == USB_SPEED_SUPER)
> +		icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +	else
> +		icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> +
> +	return ret;
> +}
> +
>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  {
>  	struct dwc3_qcom *qcom = data;
> @@ -494,6 +621,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto depopulate;
>  	}
>  
> +	ret = usb_interconnect_init(qcom);
> +	if (ret) {
> +		dev_err(dev, "failed to get interconnect handle ret:%d\n", ret);

similar to my comment above, the function name adds an abstraction,
but the comment talks about implementation details. I'd suggest
something like 'failed to init interconnect'.

> +		goto depopulate;
> +	}
> +	ret = usb_interconnect_enable(qcom);
> +	if (ret) {
> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);

same comment as for 'dwc3_qcom_suspend' above.

I think the _interconnect_enable() call should be part of
_interconnect_init(). I was earlier considering to suggest to
change the name of _interconnect_init() to something else, since
it doesn't really do any interconnect initialization, but didn't have
a good suggestion for an alternative name. Moving the _enable() call
into _init() would make _init() and actual init routine, besides
removing clutter from _probe().

> +		goto interconnect_exit;
> +	}
> +
>  	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
>  
>  	/* enable vbus override for device mode */
> @@ -503,7 +641,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	/* register extcon to override sw_vbus on Vbus change later */
>  	ret = dwc3_qcom_register_extcon(qcom);
>  	if (ret)
> -		goto depopulate;
> +		goto interconnect_exit;
>  
>  	device_init_wakeup(&pdev->dev, 1);
>  	qcom->is_suspended = false;
> @@ -513,6 +651,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +interconnect_exit:
> +	usb_interconnect_exit(qcom);
>  depopulate:
>  	of_platform_depopulate(&pdev->dev);
>  clk_disable:
> @@ -540,6 +680,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
>  	}
>  	qcom->num_clocks = 0;
>  
> +	usb_interconnect_exit(qcom);
>  	reset_control_assert(qcom->resets);
>  
>  	pm_runtime_allow(dev);

Cheers

Matthias
