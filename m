Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1899320438
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Feb 2021 07:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhBTGfn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Feb 2021 01:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhBTGfk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Feb 2021 01:35:40 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B280EC061574;
        Fri, 19 Feb 2021 22:35:00 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id u11so4569643plg.13;
        Fri, 19 Feb 2021 22:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4RIxyBHK+8zO4I11nCRFeoVahQ/6VE8SCYvUVT1y3Pw=;
        b=ePmGQ0GUUpe1Iv2EihgVd96SrZilVHwLdq+f9zcM1fb1wpqArFbnj7UjewiPNq7u+3
         CUgSceUeUQVj2329n4J7frIlOnfDBXdhetbQUKsb5DU/XAweDOyXvRzB9Vv+pWyO4CYM
         hTsUL+6IKzrVWWCCsBODI/nCPw/xXCPaZ76vS0CIatq4QX9fHHMN5BtKs7PR9UL63+Lw
         HrCWAzA6sAzW6iwZ6OvZWsbj4zgsG2frQThhWJix0uTAnjT0WTMJ9msysfCMCwZxPTm1
         vYJsCPOTEKW6lkjxLb0B9sO4s8wTpeFsVBYe13kV7Mb6oFemrVVVYiYTZVBuo/ZfMKxH
         6iIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4RIxyBHK+8zO4I11nCRFeoVahQ/6VE8SCYvUVT1y3Pw=;
        b=h7i5cDW/kvSfAyhIoxUDJkCBlyN4yLC+2s/vgicM6OvDa1DoFkr9r1xFaNhgPZAri3
         vJXV0JltWnCNwcbGl1Lpu+wSvN4rzAmZu5a0ScR1GjHanzvaZ6u512c2y5+TuqW8WLXU
         4ttGuBFdvGvz0bmZrwncgN4/PKyQY0N8H/W0g6ci+12hda3G1klHIw+sRmWuY/D/svKb
         jn9nFhKdcbh9p9nerDARAInlCoA+/XPXIcEMG/knxor/KhER6xQb+NwC7nBs6i0uOXms
         qQt95JM6CiNByftbekCps8ys0CxttjKZzVyD/uo+G4dxUI5GYJ6EUsjFCwjuANtqZhxG
         cu8A==
X-Gm-Message-State: AOAM531OiLb7It1oMHk0yItLS0+kPGEGVi25GtpAOGjgrnQSy832GUtX
        jCDusP1SGXmn2X9iZt/C+ws=
X-Google-Smtp-Source: ABdhPJzm9Yc8vZbVrF3qKt4T4efG58Ks+gaKo+YUcZB1BVsEwMAOiECEaXyGFSmNjN8op36zNjhbew==
X-Received: by 2002:a17:90b:1b4a:: with SMTP id nv10mr12561642pjb.169.1613802899483;
        Fri, 19 Feb 2021 22:34:59 -0800 (PST)
Received: from [172.30.1.11] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id n21sm11837181pgf.26.2021.02.19.22.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 22:34:58 -0800 (PST)
Subject: Re: [RESEND PATCH v6 3/3] extcon: qcom-spmi: Add support for VBUS
 detection
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Kavya Nunna <knunna@codeaurora.org>
References: <cover.1611621365.git.gurus@codeaurora.org>
 <683693bdfaa14a72550f466da8b26a6126317c4d.1611621365.git.gurus@codeaurora.org>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <7f45f184-1a8f-df08-5b45-0e88426c549d@gmail.com>
Date:   Sat, 20 Feb 2021 15:34:52 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <683693bdfaa14a72550f466da8b26a6126317c4d.1611621365.git.gurus@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Please use get_maintainer.pl script when you send the patches.
I didn't receive the patches.  I'll review.

Thanks,
Chanwoo Choi

On 21. 1. 26. 오전 9:38, Guru Das Srinagesh wrote:
> From: Anirudh Ghayal <aghayal@codeaurora.org>
> 
> VBUS can be detected via a dedicated PMIC pin. Add support
> for reporting the VBUS status.
> 
> Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> Signed-off-by: Kavya Nunna <knunna@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>   drivers/extcon/extcon-qcom-spmi-misc.c | 99 +++++++++++++++++++++++++++-------
>   1 file changed, 80 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
> index 6b836ae..9e8ccfb 100644
> --- a/drivers/extcon/extcon-qcom-spmi-misc.c
> +++ b/drivers/extcon/extcon-qcom-spmi-misc.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /**
>    * extcon-qcom-spmi-misc.c - Qualcomm USB extcon driver to support USB ID
> - *				detection based on extcon-usb-gpio.c.
> + *			and VBUS detection based on extcon-usb-gpio.c.
>    *
>    * Copyright (C) 2016 Linaro, Ltd.
>    * Stephen Boyd <stephen.boyd@linaro.org>
> @@ -21,30 +21,56 @@
>   
>   struct qcom_usb_extcon_info {
>   	struct extcon_dev *edev;
> -	int irq;
> +	int id_irq;
> +	int vbus_irq;
>   	struct delayed_work wq_detcable;
>   	unsigned long debounce_jiffies;
>   };
>   
>   static const unsigned int qcom_usb_extcon_cable[] = {
> +	EXTCON_USB,
>   	EXTCON_USB_HOST,
>   	EXTCON_NONE,
>   };
>   
>   static void qcom_usb_extcon_detect_cable(struct work_struct *work)
>   {
> -	bool id;
> +	bool state = false;
>   	int ret;
> +	union extcon_property_value val;
>   	struct qcom_usb_extcon_info *info = container_of(to_delayed_work(work),
>   						    struct qcom_usb_extcon_info,
>   						    wq_detcable);
>   
> -	/* check ID and update cable state */
> -	ret = irq_get_irqchip_state(info->irq, IRQCHIP_STATE_LINE_LEVEL, &id);
> -	if (ret)
> -		return;
> +	if (info->id_irq > 0) {
> +		/* check ID and update cable state */
> +		ret = irq_get_irqchip_state(info->id_irq,
> +				IRQCHIP_STATE_LINE_LEVEL, &state);
> +		if (ret)
> +			return;
> +
> +		if (!state) {
> +			val.intval = true;
> +			extcon_set_property(info->edev, EXTCON_USB_HOST,
> +						EXTCON_PROP_USB_SS, val);
> +		}
> +		extcon_set_state_sync(info->edev, EXTCON_USB_HOST, !state);
> +	}
>   
> -	extcon_set_state_sync(info->edev, EXTCON_USB_HOST, !id);
> +	if (info->vbus_irq > 0) {
> +		/* check VBUS and update cable state */
> +		ret = irq_get_irqchip_state(info->vbus_irq,
> +				IRQCHIP_STATE_LINE_LEVEL, &state);
> +		if (ret)
> +			return;
> +
> +		if (state) {
> +			val.intval = true;
> +			extcon_set_property(info->edev, EXTCON_USB,
> +						EXTCON_PROP_USB_SS, val);
> +		}
> +		extcon_set_state_sync(info->edev, EXTCON_USB, state);
> +	}
>   }
>   
>   static irqreturn_t qcom_usb_irq_handler(int irq, void *dev_id)
> @@ -79,21 +105,48 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	ret = extcon_set_property_capability(info->edev,
> +			EXTCON_USB, EXTCON_PROP_USB_SS);
> +	ret |= extcon_set_property_capability(info->edev,
> +			EXTCON_USB_HOST, EXTCON_PROP_USB_SS);
> +	if (ret) {
> +		dev_err(dev, "failed to register extcon props rc=%d\n",
> +						ret);
> +		return ret;
> +	}
> +
>   	info->debounce_jiffies = msecs_to_jiffies(USB_ID_DEBOUNCE_MS);
>   	INIT_DELAYED_WORK(&info->wq_detcable, qcom_usb_extcon_detect_cable);
>   
> -	info->irq = platform_get_irq_byname(pdev, "usb_id");
> -	if (info->irq < 0)
> -		return info->irq;
> +	info->id_irq = platform_get_irq_byname(pdev, "usb_id");
> +	if (info->id_irq > 0) {
> +		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
> +					qcom_usb_irq_handler,
> +					IRQF_TRIGGER_RISING |
> +					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +					pdev->name, info);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to request handler for ID IRQ\n");
> +			return ret;
> +		}
> +	}
>   
> -	ret = devm_request_threaded_irq(dev, info->irq, NULL,
> +	info->vbus_irq = platform_get_irq_byname(pdev, "usb_vbus");
> +	if (info->vbus_irq > 0) {
> +		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
>   					qcom_usb_irq_handler,
>   					IRQF_TRIGGER_RISING |
>   					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>   					pdev->name, info);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to request handler for ID IRQ\n");
> -		return ret;
> +		if (ret < 0) {
> +			dev_err(dev, "failed to request handler for VBUS IRQ\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (info->id_irq < 0 && info->vbus_irq < 0) {
> +		dev_err(dev, "ID and VBUS IRQ not found\n");
> +		return -EINVAL;
>   	}
>   
>   	platform_set_drvdata(pdev, info);
> @@ -120,8 +173,12 @@ static int qcom_usb_extcon_suspend(struct device *dev)
>   	struct qcom_usb_extcon_info *info = dev_get_drvdata(dev);
>   	int ret = 0;
>   
> -	if (device_may_wakeup(dev))
> -		ret = enable_irq_wake(info->irq);
> +	if (device_may_wakeup(dev)) {
> +		if (info->id_irq > 0)
> +			ret = enable_irq_wake(info->id_irq);
> +		if (info->vbus_irq > 0)
> +			ret = enable_irq_wake(info->vbus_irq);
> +	}
>   
>   	return ret;
>   }
> @@ -131,8 +188,12 @@ static int qcom_usb_extcon_resume(struct device *dev)
>   	struct qcom_usb_extcon_info *info = dev_get_drvdata(dev);
>   	int ret = 0;
>   
> -	if (device_may_wakeup(dev))
> -		ret = disable_irq_wake(info->irq);
> +	if (device_may_wakeup(dev)) {
> +		if (info->id_irq > 0)
> +			ret = disable_irq_wake(info->id_irq);
> +		if (info->vbus_irq > 0)
> +			ret = disable_irq_wake(info->vbus_irq);
> +	}
>   
>   	return ret;
>   }
> 
