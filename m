Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D836B0F29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 14:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731283AbfILMy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 08:54:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43505 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731545AbfILMy2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 08:54:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id q17so23631319wrx.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 05:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J+Yj9nyrgo95/FhcjBiegG4ol1PycGVjpnMkbdoMg9Y=;
        b=cEgrJ7KAXn0VgbIstyH/w0zqDdvcXNCIh8Qi3oyCJxvbhpux4nqyMz3MSVfFlNkptq
         Qg6HNrorQoQ+64mMKfDvlkqACrLIBDblw1IO8wDqLZG9LObFkNj9Px0T7KXL7u1azpYn
         tvZG9Qouo/FWYvSefXHTa8i8C/oM9EcnJPrk671MaMxZPC8D+Z4P8CJqO/O3rp+k2ANt
         6QdlriJ2H1tvo6PizXYQT3qa9iCk+w1Oa+bpDmTHCmq5uVwCEkw9GjL5ciFV1kBjzfha
         dFK0BGyF7ZEp1Gea3KUNGXBQIEmN5n3DOUsL4l7clzsuLZekxYVnDMYN6vy6hwo63N41
         ji4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J+Yj9nyrgo95/FhcjBiegG4ol1PycGVjpnMkbdoMg9Y=;
        b=am8oinGeFAX0CJkdOLwRHk78C0ALqbPVz0iIJp3A0mIyEAXtODwvoY3TKbVZgLYAlo
         UTp/FQqiAGAQ65jZ6U7hdJOTVQZ5rWKvXhBnNeK8cJA5Q53hgvt4lm2TrOqmUIrZ8zBU
         RJZEdxdU4WnDsd6gfQlKp7CBlJp8S+KryWhtjvQCspTwGC/Q1i/0DxmYGEQlxHLnfma3
         178pl+uIaLpuikOCsBVUjBYKgiX5Y7hY78s3qXHcGsqSYhb7EWOYHutDQNFrJnwVa+a4
         rimhdvQkNZ39yNhMk8JdNAiTINUdAaXi1B7hbzLh6A2M7mHX7O8qIcbuLTtfQ5YCuDcN
         X/ng==
X-Gm-Message-State: APjAAAUDRivieA68j0CwmssqrNQ+GjzKPs0wWjweph8Lolttw/2ZJRzk
        a8fZDD2Bpj4xlk5AFJcg/KYE1ZeEIRQQgA==
X-Google-Smtp-Source: APXvYqxncfqoAPnf4sIWROy5kXc5vo9x3/Yr6zEbbUOFGzTM4twlN/QAFIrdcUmH4ROq3e1e+JB3tg==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr3160844wrm.112.1568292862211;
        Thu, 12 Sep 2019 05:54:22 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id y72sm9592815wmc.26.2019.09.12.05.54.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 05:54:21 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        balbi@kernel.org, agross@kernel.org
Cc:     david.brown@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1568177675-18764-1-git-send-email-cchiluve@codeaurora.org>
 <1568177675-18764-3-git-send-email-cchiluve@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <fdb549f7-4d6b-88ae-2f97-3b9b9bd3de4e@linaro.org>
Date:   Thu, 12 Sep 2019 15:54:19 +0300
MIME-Version: 1.0
In-Reply-To: <1568177675-18764-3-git-send-email-cchiluve@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Chandana,

Thank you for the patch!

On 9/11/19 07:54, Chandana Kishori Chiluveru wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB master to
> DDR slave. The other is from APPS master to USB slave.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 147 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 145 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 184df4d..4b8c2ae 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -14,6 +14,7 @@
>  #include <linux/extcon.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/interconnect.h>
>  #include <linux/phy/phy.h>
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
> @@ -38,6 +39,9 @@
>  #define PWR_EVNT_LPM_IN_L2_MASK			BIT(4)
>  #define PWR_EVNT_LPM_OUT_L2_MASK		BIT(5)
>  
> +#define USB_DDR "usb-ddr"
> +#define APPS_USB "apps-usb"

What is the benefit of adding these defines? Please remove them.

>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
> @@ -59,8 +63,13 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	struct icc_path *usb_ddr_icc_path;
> +	struct icc_path *apps_usb_icc_path;

Nit: Maybe try to make the indentation style consistent with the existing code?

>  };
>  
> +static int usb_interconnect_enable(struct dwc3_qcom *qcom);
> +static int usb_interconnect_disable(struct dwc3_qcom *qcom);
> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>  	u32 reg;
> @@ -222,7 +231,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
> -	int i;
> +	int i, ret;
>  
>  	if (qcom->is_suspended)
>  		return 0;
> @@ -234,6 +243,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  	for (i = qcom->num_clocks - 1; i >= 0; i--)
>  		clk_disable_unprepare(qcom->clks[i]);
>  
> +	/* Remove bus voting */
> +	ret = usb_interconnect_disable(qcom);
> +	if (ret)
> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
> +
>  	qcom->is_suspended = true;
>  	dwc3_qcom_enable_interrupts(qcom);
>  
> @@ -259,6 +273,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  		}
>  	}
>  
> +	/* Add bus voting */
> +	ret = usb_interconnect_enable(qcom);
> +	if (ret)
> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
> +
>  	/* Clear existing events from PHY related to L2 in/out */
>  	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
>  			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
> @@ -409,6 +428,116 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>  	return 0;
>  }
>  
> +/* Interconnect path bandwidths in KBps */
> +#define USB_MEMORY_AVG_HS_BW 240000
> +#define USB_MEMORY_PEAK_HS_BW 700000
> +#define USB_MEMORY_AVG_SS_BW  1000000
> +#define USB_MEMORY_PEAK_SS_BW 2500000
> +#define APPS_USB_AVG_BW 0
> +#define APPS_USB_PEAK_BW 40000

I would suggest to wrap the values with kBps_to_icc() or MBps_to_icc() macro.

> +
> +/**
> + * usb_interconnect_init() - Request to get interconnect path handle
> + * @qcom:			Pointer to the concerned usb core.
> + *
> + */
> +static int usb_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +	struct device *dev = qcom->dev;
> +
> +	qcom->usb_ddr_icc_path = of_icc_get(dev, USB_DDR);
> +	if (IS_ERR(qcom->usb_ddr_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting %s path\n",
> +			PTR_ERR(qcom->usb_ddr_icc_path), USB_DDR);
> +		return PTR_ERR(qcom->usb_ddr_icc_path);
> +	}
> +
> +	qcom->apps_usb_icc_path = of_icc_get(dev, APPS_USB);
> +	if (IS_ERR(qcom->apps_usb_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting %s path\n",
> +				PTR_ERR(qcom->apps_usb_icc_path), APPS_USB);
> +		return PTR_ERR(qcom->usb_ddr_icc_path);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * geni_interconnect_exit() - Request to release interconnect path handle
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
> +/* To disable an interconnect, we just its bandwidth to 0 */

Missing the word "set"?

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
> +	return 0;       /* Success */

Nit: This comment seems useless.

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
>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
> @@ -494,6 +623,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto depopulate;
>  	}
>  
> +	ret = usb_interconnect_init(qcom);
> +	if (ret) {
> +		dev_err(dev, "failed to get interconnect handle ret:%d\n", ret);
> +		goto depopulate;
> +	}
> +	ret = usb_interconnect_enable(qcom);
> +	if (ret) {
> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
> +		goto interconnect_exit;
> +	}
> +
>  	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
>  
>  	/* enable vbus override for device mode */
> @@ -503,7 +643,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	/* register extcon to override sw_vbus on Vbus change later */
>  	ret = dwc3_qcom_register_extcon(qcom);
>  	if (ret)
> -		goto depopulate;
> +		goto interconnect_exit;
>  
>  	device_init_wakeup(&pdev->dev, 1);
>  	qcom->is_suspended = false;
> @@ -513,6 +653,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +interconnect_exit:
> +	usb_interconnect_exit(qcom);
>  depopulate:
>  	of_platform_depopulate(&pdev->dev);
>  clk_disable:
> @@ -540,6 +682,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
>  	}
>  	qcom->num_clocks = 0;
>  
> +	usb_interconnect_exit(qcom);
>  	reset_control_assert(qcom->resets);
>  
>  	pm_runtime_allow(dev);
>
The patch looks ok, but does not apply to neither mainline or linux-next.

Thanks,
Georgi
