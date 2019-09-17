Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5C7B565E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 21:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfIQTpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 15:45:04 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45255 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfIQTpE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 15:45:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id 4so2519702pgm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Tgg2KV4/EfN+uMmiVDhI108boK8SBjqK7o3+PbMCrCI=;
        b=Gax5dwcaedmEQcUPRLs3NtZVA81kF/AfrQ45bLDX1BwPZ21Ler+XLbfh4zFY9jr6k7
         nSMFXqsSY3Eu/Ff9B3tIad+HkZbIxfIFxcrpCD2/1sAjrg/JK/JM0SnvVHv7a9yJTEwT
         XeRLeOd0sl+4ky4EPSysETsBbBLoeTIRzGiuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tgg2KV4/EfN+uMmiVDhI108boK8SBjqK7o3+PbMCrCI=;
        b=AIKw+HfmGrHDV40PidA5DIOojkZRgiYnwSXlD4D+eWwpmk+c3yJ78xpyqMXB7izDpS
         V+n/w0+4zaJCo+/DESuElx2A+h9fYV1/QOJXuVtKubULvNiSAYOjXcmTRTBElNA0BmQm
         lccwmjHqY3kUVffKVaglKTvyQjLrEuOwsya15d3HazgBBs3d5GK0WZGUUYZ8GP/CIRXf
         zKvLYdvkPnUPXZ9qg2fzNEaAxL6IBZzw9jl1ib8N/uBaYAmG8031JGrREnyFHjWaJHu+
         BVS2jsXNvD5xStBJ+xjEeqYLBKW5BqgYLMzV54dduK90c8BiYxV3/IP95AV4TOdnc4Lo
         Sdmg==
X-Gm-Message-State: APjAAAVWnlloXdhUP6+KGB1owcxYXe04KbytWMJHe8ik4rcNEKGGy3Yl
        KlgLx78UY9zMC5zFf7IbnbVBIQ==
X-Google-Smtp-Source: APXvYqwrZzEmLy6eO6PsNKzFBDcGp2OXEi0+GJ13UPfgamTyrLgYSPrOjFB9fJ4t+9h46xvAnPZClA==
X-Received: by 2002:a65:5309:: with SMTP id m9mr510537pgq.266.1568749503244;
        Tue, 17 Sep 2019 12:45:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id 31sm3435103pgr.55.2019.09.17.12.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 12:45:01 -0700 (PDT)
Date:   Tue, 17 Sep 2019 12:44:59 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 2/3] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20190917194459.GK133864@google.com>
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
 <1568718649-20124-3-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568718649-20124-3-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 17, 2019 at 04:40:48PM +0530, Chandana Kishori Chiluveru wrote:
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
> index 184df4d..2a2f5af 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>
> ...
>
> +/**
> + * dwc3_qcom_interconnect_init() - Get interconnect path handles

nit: "Initialize the interconnect" or similar?

> + * @qcom:			Pointer to the concerned usb core.
> + *
> + */
> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +	struct device *dev = qcom->dev;
> +	int ret;
> +
> +	qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
> +	if (IS_ERR(qcom->usb_ddr_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting usb-ddr path\n",
> +			PTR_ERR(qcom->usb_ddr_icc_path));
> +		return PTR_ERR(qcom->usb_ddr_icc_path);
> +	}
> +
> +	qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
> +	if (IS_ERR(qcom->apps_usb_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting apps-usb path\n",
> +				PTR_ERR(qcom->apps_usb_icc_path));
> +		return PTR_ERR(qcom->apps_usb_icc_path);
> +	}
> +
> +	ret = dwc3_qcom_interconnect_enable(qcom);
> +	if (ret) {
> +		dev_err(dev, "failed to enable interconnect %d\n", ret);

nit: 'interconnect: %d', otherwise the message could be read as
'failed to enable interconnect number N'.

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
> +/* Currently we only use bandwidth level, so just "enable" interconnects */
> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
> +{
> +	struct dwc3 *dwc;
> +	int ret;
> +
> +	dwc = platform_get_drvdata(qcom->dwc3);
> +	if (!dwc) {
> +		dev_err(qcom->dev, "Failed to get dwc3 device\n");
> +		return -EPROBE_DEFER;
> +	}

I understand the need for the/some check (see
https://patchwork.kernel.org/patch/11146903/#22885491 and my reply),
but I'm not convinced it should be done here. The function can be
called from other contexts than _probe(), so returning -EPROBE_DEFER
seems wrong, although I understand that you want _probe() to return
this value.

I would suggest to do this (or another) check early in
_probe(). Returning -EPROBE_DEFER from that context makes sense, and
it should be the only time the check is actually needed.

As commented on v2 I don't particularly like the idea of using a half
initialized struct (dwc3), even more when what is initialized or not
varies at runtime (since dwc3_probe() and qwc3_qcom_probe() appear to
run in parallel). IIUC device_is_bound() returns true when a device is
fully initialized (i.e. it's _probe() completed), I'd suggest to
evaluate to use it instead of checking the drvdata. In this case the
drvdata check should be ok, but in general these kind of races don't
seem a good idea, maybe tomorrow someone wants to access another
struct member, which isn't always initialized.

Others: please correct me if using half-initialized structs is
routine in kernel drivers or device_is_bound() is the wrong tool.

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
> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
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

This is essentially the same as in _interconnect_enable(). You could
consider a helper function (inline?) for 'enabling' the memory path,
which would make things more compact and also allow to get rid of the
goto:

if (ret)
	qcom_dwc3_interconnect_enable_mempath(qcom);

return ret;

> +
> +	return ret;
> +}
> +
>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  {
>  	struct dwc3_qcom *qcom = data;
> @@ -494,6 +626,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto depopulate;
>  	}
>  
> +	ret = dwc3_qcom_interconnect_init(qcom);
> +	if (ret) {
> +		dev_err(dev, "failed to init interconnect handles %d\n", ret);

nit: remove 'handles' (and add ':' before the error code), it's an
implementation detail, and now _icc_init() also calls _icc_enable(),
hence it's not only the handles.
