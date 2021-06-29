Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F2C3B75E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 17:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234094AbhF2Py0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 11:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234044AbhF2Py0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 11:54:26 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170AEC061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:51:58 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id m6-20020a9d1d060000b029044e2d8e855eso21170870otm.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bx5EH9ViVKWoBCUMt4UHZKnr8Bc45TDqqBXwDERlL8U=;
        b=K87CC5IGLbinlwv9r2vXlabbSQLaSaaJ1bQqU/lnYEr5deoayg7lwVAPqL4pxm50Go
         sOQgsw14zv16YWz6thUv3m0VlczuXdcGKC2kFfMPGy31tsrbU99DLqH9oUQQbfiISh4C
         2IsQTMMsVZ4/ZE1+5GBXsgZSIGy9vsBOM5hWC2u/odhmtwqnt4eo4/ocuvnce0REn6C0
         IfN2L3ndtI1H8h1jaDDk6OkO8frmYodxv8WcEtz4BLscA3NAYAcAMPieVSOjZM1+yCgW
         sBq1D9i5UxJAuPXlkECtJsHuVO6lPZXER4/qH59kI8e3dMWP6FMSeHD/wQZVT4IU9yUE
         Slag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bx5EH9ViVKWoBCUMt4UHZKnr8Bc45TDqqBXwDERlL8U=;
        b=fWYj3raX7ZtKf6q9UOr8rWn0DJ8WBfwnAg9fTFBjmSfFoyYgcPVq25cyDOkc+rqTfx
         vAEhWjfEOo7hE/UXV/IvHzDA8FslTVoUBZsruBizAlJollzF6x2VXEm9c98yGAAilrkZ
         g5Uz3kw+aybuosSDYsBelwdTFXtzsugcxug2YZJ6ss5YsC22B3L13xJ5U+sMmH8VmkJ5
         iW+kbO2xWAEke0VLAsWGPWPold8Os1Bf6FtS0KmUwsAdsMgCgC0mtDKInH+05MRZk0Mb
         Wyzm8ADyvq0I2Qj/l3ZF0UtFhmj/D0nRVI6EExg1skMufAporQwthUw8uARIqhtfeTJc
         4DFg==
X-Gm-Message-State: AOAM532arwinrrj0GfzXVRLgvUiYDsVRt62WiDmKbqHnM2VQoXFjn6bb
        fdetaquUmd7o/UcORzLiDc2rLw==
X-Google-Smtp-Source: ABdhPJz6MIw2jmQ5DVQmlF5uzPzigACSaiaGVWPXn6LRx748KZfmipv2qt7eIIeTXUwz5ZzN2kq99Q==
X-Received: by 2002:a05:6830:10c1:: with SMTP id z1mr5349377oto.98.1624981917456;
        Tue, 29 Jun 2021 08:51:57 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g1sm3739870ooi.34.2021.06.29.08.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 08:51:57 -0700 (PDT)
Date:   Tue, 29 Jun 2021 10:51:55 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [PATCH 2/2] usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus
 override API
Message-ID: <YNtBm2AKYaSziRXf@yoga>
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629144449.2550737-3-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Jun 09:44 CDT 2021, Bryan O'Donoghue wrote:

> From: Wesley Cheng <wcheng@codeaurora.org>
> 
> There was an extra character in the dwc3_qcom_vbus_override_enable()
> function.  Removed the extra character.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

But I think you should have sent the two patches in opposite order,
because this could have been merged, but now it depends on patch 1.

Regards,
Bjorn

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 4491704503ab..541e2626294a 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -120,7 +120,7 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>  	readl(base + offset);
>  }
>  
> -static void dwc3_qcom_vbus_overrride_enable(struct dwc3_qcom *qcom, bool enable)
> +static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>  {
>  	if (enable) {
>  		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_SS_PHY_CTRL,
> @@ -141,7 +141,7 @@ static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
>  	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
>  
>  	/* enable vbus override for device mode */
> -	dwc3_qcom_vbus_overrride_enable(qcom, event);
> +	dwc3_qcom_vbus_override_enable(qcom, event);
>  	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
>  
>  	return NOTIFY_DONE;
> @@ -153,7 +153,7 @@ static int dwc3_qcom_host_notifier(struct notifier_block *nb,
>  	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
>  
>  	/* disable vbus override in host mode */
> -	dwc3_qcom_vbus_overrride_enable(qcom, !event);
> +	dwc3_qcom_vbus_override_enable(qcom, !event);
>  	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
>  
>  	return NOTIFY_DONE;
> @@ -329,7 +329,7 @@ static int dwc3_qcom_usb_role_switch_set(struct usb_role_switch *sw,
>  
>  	qcom->mode = (role == USB_ROLE_HOST) ? USB_DR_MODE_HOST :
>  					       USB_DR_MODE_PERIPHERAL;
> -	dwc3_qcom_vbus_overrride_enable(qcom, enable);
> +	dwc3_qcom_vbus_override_enable(qcom, enable);
>  	return 0;
>  }
>  
> @@ -917,7 +917,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	/* enable vbus override for device mode */
>  	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
> -		dwc3_qcom_vbus_overrride_enable(qcom, true);
> +		dwc3_qcom_vbus_override_enable(qcom, true);
>  
>  	if (dwc3_qcom_find_usb_connector(pdev)) {
>  		ret = dwc3_qcom_setup_role_switch(qcom);
> -- 
> 2.30.1
> 
