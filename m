Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431662285D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 18:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbgGUQhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 12:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729658AbgGUQhY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 12:37:24 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7265C0619DC
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 09:37:24 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id 72so10496516ple.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=irPBVsFwfmBtWMYINAN+ZF+oZDB8ndFJ/TQHz/wcPcU=;
        b=mLqCceOE0fI/iaBFhufmDimufyiR3SDzm84nLMtMOeTD1OPz0Y/8mMe2t0xy0f3f5m
         moAgb7huZTSvQwzJLRRF+gpGMEaw/GukZHbn9Y2ch+pgCohMUiZ/Fl/mGHALln+i3aiu
         a0IX3eHewyoqEvYJjbRVv+/HGxJ2FpoYBtIs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=irPBVsFwfmBtWMYINAN+ZF+oZDB8ndFJ/TQHz/wcPcU=;
        b=MfXuP9JweKqreDpJRJZeyOsOnUF66pD29sP4Ao7mOeXaEF7nXp0kJS88QPOIqdx1Mx
         ZGb/UkqgjnVEKnymdBVPHT0CZ8QypwzNIXuzEIQjJFB8PDpIHkD5Hsrxkv8pNd6lRRTp
         94cvilG+6WtbG+C/5Q7mTwJNKxcP997dBs9sh+zdcGLL9dGIfX0/PCMxBqzaLfIyKJkA
         1PXMqBaNetK7iueKv/PebVUPVkTbBHk3mANmnEPjGANnGtPa/mfvRHsbbch9GA37Ehrg
         h1g5r3TFkop+BlHCnI64FAiLaQ1E8ea7YBFlTnjpixmO3sP2BEtKZl5xBGZoDwMyLFLz
         LdJQ==
X-Gm-Message-State: AOAM533vbDJk9X6lu7PTWurRAMCjxheH746p0kG3wrWeqgfQVJzA6iYF
        A41Bt1uzNuHm76lrda7IyHiACw==
X-Google-Smtp-Source: ABdhPJx84M1IZmz+h4IjjQWiC52P5zjOOn8mQkkyVT0svETmWz/Wc4byqH8RV9PLzJtG9/tvVc21Yg==
X-Received: by 2002:a17:90b:19cc:: with SMTP id nm12mr5752510pjb.144.1595349443976;
        Tue, 21 Jul 2020 09:37:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id z11sm20843185pfk.46.2020.07.21.09.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 09:37:23 -0700 (PDT)
Date:   Tue, 21 Jul 2020 09:37:21 -0700
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
Subject: Re: [PATCH v9 1/2] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200721163721.GU3191083@google.com>
References: <1595317489-18432-1-git-send-email-sanm@codeaurora.org>
 <1595317489-18432-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595317489-18432-2-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

On Tue, Jul 21, 2020 at 01:14:48PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB to
> DDR. The other is from APPS to USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
  ^
Please remove this tag for now (should have requested this earlier). It
seems we are very close, but apparently the review is still/again ongoing.

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 127 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 125 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index e1e78e9..82e08ff 100644
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
> @@ -76,6 +85,8 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	struct icc_path		*icc_path_ddr;
> +	struct icc_path		*icc_path_apps;
>  };
>  
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
> @@ -190,6 +201,101 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
>  	return 0;
>  }
>  
> +/* Bandwidth levels are set in dwc3_qcom_interconnect_init ,
> + * so just "enable" interconnects.
> + */

nits:
  - the common format for functions in this file is:
    /**
     * <description>
     */
  - remove blank before the ','

That said, not all functions in this file have documentation, and this
comment doesn't seem to add much, so you could consider to just remove
it.

> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
> +{
> +	int ret;
> +
> +	ret = icc_enable(qcom->icc_path_ddr);
> +	if (ret)
> +		return ret;
> +
> +	ret = icc_enable(qcom->icc_path_apps);
> +	if (ret)
> +		return ret;

You changed the logic here: in v8 the DDR path would be disabled again
if enabling the APPS patch failed. I think it would be preferable to
keep the enable state of the two ICC paths in sync if possible.

If not, just do

   	return icc_enable(qcom->icc_path_apps);

instead of

	if (ret)
		return ret;

	return ret;

> +
> +	return ret;
> +}
> +
> +/*Disabling the interconnect, will set the bandwidth to 0 */

nit: add blank before 'Disabling'.

Same as above, the comment doesn't add much value, you can consider
to remove it.

> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
> +{
> +	int ret;
> +
> +	ret = icc_disable(qcom->icc_path_ddr);
> +	if (ret)
> +		return ret;
> +
> +	ret = icc_disable(qcom->icc_path_apps);
> +	if (ret)
> +		return ret;

Same as above, either reenable the DDR path in case of failure, or simplify
the code.

> +
> +	return ret;
> +}
> +
> +/**
> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> + * and set bandwidhth.
> + * @qcom:			Pointer to the concerned usb core.
> + *
> + */
> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +	struct device *dev = qcom->dev;
> +	int ret;
> +
> +	qcom->icc_path_ddr = of_icc_get(dev, "usb-ddr");
> +	if (IS_ERR(qcom->icc_path_ddr)) {
> +		dev_err(dev, "failed to get usb-ddr path: %ld\n",
> +			PTR_ERR(qcom->icc_path_ddr));
> +		return PTR_ERR(qcom->icc_path_ddr);
> +	}
> +
> +	qcom->icc_path_apps = of_icc_get(dev, "apps-usb");
> +	if (IS_ERR(qcom->icc_path_apps)) {
> +		dev_err(dev, "failed to get apps-usb path: %ld\n",
> +				PTR_ERR(qcom->icc_path_apps));
> +		return PTR_ERR(qcom->icc_path_apps);
> +	}
> +
> +	if (usb_get_maximum_speed(&qcom->dwc3->dev) >= USB_SPEED_SUPER ||
> +			usb_get_maximum_speed(&qcom->dwc3->dev) == USB_SPEED_UNKNOWN)
> +		ret = icc_set_bw(qcom->icc_path_ddr,
> +			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +	else
> +		ret = icc_set_bw(qcom->icc_path_ddr,
> +			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> +
> +	if (ret) {
> +		dev_err(dev, "failed to set bandwidth for usb-ddr path: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(qcom->icc_path_apps,
> +		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
> +
> +	if (ret) {
> +		dev_err(dev, "failed to set bandwidth for apps-usb path: %d\n", ret);
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
> +	icc_put(qcom->icc_path_ddr);
> +	icc_put(qcom->icc_path_apps);
> +}
> +
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	if (qcom->hs_phy_irq) {
> @@ -239,7 +345,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
> -	int i;
> +	int i, ret;
>  
>  	if (qcom->is_suspended)
>  		return 0;
> @@ -251,6 +357,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  	for (i = qcom->num_clocks - 1; i >= 0; i--)
>  		clk_disable_unprepare(qcom->clks[i]);
>  
> +	ret = dwc3_qcom_interconnect_disable(qcom);
> +	if (ret)
> +		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +
>  	qcom->is_suspended = true;
>  	dwc3_qcom_enable_interrupts(qcom);
>  
> @@ -276,6 +386,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  		}
>  	}
>  
> +	ret = dwc3_qcom_interconnect_enable(qcom);
> +	if (ret)
> +		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +
>  	/* Clear existing events from PHY related to L2 in/out */
>  	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
>  			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
> @@ -285,6 +399,8 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  	return 0;
>  }
>  
> +
> +

nit: remove one empty line

>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  {
>  	struct dwc3_qcom *qcom = data;
> @@ -638,6 +754,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto depopulate;
>  	}
>  
> +	ret = dwc3_qcom_interconnect_init(qcom);
> +	if (ret)
> +		goto depopulate;
> +
>  	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
>  
>  	/* enable vbus override for device mode */
> @@ -647,7 +767,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	/* register extcon to override sw_vbus on Vbus change later */
>  	ret = dwc3_qcom_register_extcon(qcom);
>  	if (ret)
> -		goto depopulate;
> +		goto interconnect_exit;
>  
>  	device_init_wakeup(&pdev->dev, 1);
>  	qcom->is_suspended = false;
> @@ -657,6 +777,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +interconnect_exit:
> +	dwc3_qcom_interconnect_exit(qcom);
>  depopulate:
>  	if (np)
>  		of_platform_depopulate(&pdev->dev);
> @@ -687,6 +809,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
>  	}
>  	qcom->num_clocks = 0;
>  
> +	dwc3_qcom_interconnect_exit(qcom);
>  	reset_control_assert(qcom->resets);
>  
>  	pm_runtime_allow(dev);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
