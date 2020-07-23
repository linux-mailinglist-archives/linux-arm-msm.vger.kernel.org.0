Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A2322B62A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 20:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGWSv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 14:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbgGWSv0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 14:51:26 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24130C0619DC
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 11:51:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so3607124pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 11:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L1u1/EP612atHM51MLfxnclzjBCkmv7rza24Rpog9OU=;
        b=ImXSJ2Zx/AD2cuVUklyjgXZcToxYG0YMH42R7JppafBiBcde2wlGcA5qyps8YUchMY
         TcIfgj1LAeYBMHSo2q/znhkEP0nhXul6Io95EwzMUUL33nNvW8Rdh16Ni/bsEk3M3I69
         xKNyLKxVB1PlIo9EGl0u/N6l7cd4NMHstkHK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L1u1/EP612atHM51MLfxnclzjBCkmv7rza24Rpog9OU=;
        b=VN51rPshq3oLI2KjMIXakjkCdEQGVkHs6bcwQ/GqiJedzdDHuDklnqfYAaxElP8TXI
         qXwPciq+q2VfD2CShgYehhboS7mQXgberTtPyeZw+YW1Kq8BAVBFyqTIbfyNKMyqoRxJ
         rQ+nDPQhJUBvlfx9GJ+CYOVsd/W1/42B3EMtEyNMPYqiKZQTfp1+BIYKMBggW5o+s2t3
         EhjsjFL+azGH7Xr/7SYBubKhBwP2Lc9Y0wnXutwGGd7AcfjGJSRz004Eqtu5bM+JZVG5
         V0hb8+HM+80Iuwkvl6F35auLyEWwPsMXWvOrO0kLefBz+QY3CRgDizijeqbt2KtKtj+t
         C6mQ==
X-Gm-Message-State: AOAM532XMvMFi9GnFKchLDdgeAD/3U4Iqv66QoL2tSqYc0pBlAIDiYYu
        QcbarQXVSZntA9xrtrUZCIf99g==
X-Google-Smtp-Source: ABdhPJzyj7yK2JTK1AOjG2mh6QKyzyYvBoP2CT7/5OcHK0sZ5dR0bE0p7llSMAC/hJIBfgCGbhzr4w==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr4820147plp.11.1595530285601;
        Thu, 23 Jul 2020 11:51:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id p12sm3668537pgk.40.2020.07.23.11.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 11:51:24 -0700 (PDT)
Date:   Thu, 23 Jul 2020 11:51:23 -0700
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
Subject: Re: [PATCH v10 1/2] usb: dwc3: qcom: Add interconnect support in
 dwc3 driver
Message-ID: <20200723185123.GY3191083@google.com>
References: <1595528857-25357-1-git-send-email-sanm@codeaurora.org>
 <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

On Thu, Jul 23, 2020 at 11:57:36PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB to
> DDR. The other is from APPS to USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 127 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 125 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index e1e78e9..712efb7 100644
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
> @@ -190,6 +201,103 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
>  	return 0;
>  }
>  
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
> +		return icc_disable(qcom->icc_path_ddr);

You are returning the result of icc_disable(), but it should be the
previous error. Just do

		icc_disable(qcom->icc_path_ddr);

and use the below statement for returning (if not it should be 'return 0').

> +
> +	return ret;
> +}
> +
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
> +		goto err_reenable_memory_path;

Please make the error handling in _enable() and _disable() symmetrical, either
call icc_enable/disable() directly or use a goto in both functions (IMO the goto
is not needed in this case, it makes the code more complex rather than
simplifying it).

> +
> +	return 0;
> +
> +	/* Re-enable things in the event of an error */
> +err_reenable_memory_path:
> +	dwc3_qcom_interconnect_enable(qcom);

Why this function which disables both paths and not just
icc_enable(qcom->icc_path_ddr), analogous to dwc3_qcom_interconnect_enable()?

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

nit: remove empty line, the call and the if block belong together.

> +	if (ret) {
> +		dev_err(dev, "failed to set bandwidth for apps-usb path: %d\n", ret);
> +		return ret;
> +	}
