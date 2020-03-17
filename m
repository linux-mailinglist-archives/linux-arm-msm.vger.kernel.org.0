Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB511879B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 07:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgCQGcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 02:32:19 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43204 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgCQGcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 02:32:19 -0400
Received: by mail-pg1-f195.google.com with SMTP id u12so11162513pgb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 23:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fPDZ6+w3BtfImipFJW5a3OXasS2gBUMcdAat0qMbiEc=;
        b=OvKKPAvUHrZ77ivg3BKzoibsavHaTXRrH/rGlfi8ebKoWd5cUH/7os3vHM/Xg1/X6q
         Q3+DZF4FpIHaVdLLW7dEj8z4Oa7Tn+UX3wd5NNgomrhZp/nRpqXTv5hZ6aeRkP8MTit8
         XRd9j98xVwJj8J+Qw6WriSsnIZD2GFwbqTfRYGVYuzV36QdeTPTWjtD0E9ZhC1thydCL
         2j/cJItEeb1aA1ymBIVQxikl1YA/JYQ3SXki3OnflCHcVs68tX/fVTmIyJHFto+pYCLY
         1VmNPMnaiLStOH+kFQ0MbHALwcfeH7Q60mFKWjapyc8rGSCSJOq8qskMXac1Xl53BGvs
         0TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fPDZ6+w3BtfImipFJW5a3OXasS2gBUMcdAat0qMbiEc=;
        b=D0CO5wILTmc+vqFuaQSZCPqItKzzrCLZq1/4DerD8ACKF2mzP+g4tIUixVWb2+KIgJ
         qYPYj3gthGjPpYrvH5cZyqzZ9TIIy3BSaFPymjxZssHWO5Gfn7hlPoGxnSblksppimZZ
         Lw2Cn1SHiPgtwDaeN1to4MNGbh+fOGJMNz2ong4CeKiHjMfSy/CgZJPhT7mVWV+eCk+F
         rJOAaegalcszRF+yFPhuNVX8zWQXKR1BPDbEubEtAaJlJgjuzfvwaY5iKZfz1LhBF09U
         dC7ES9r1SbOTM0ZzttkgwFLSY/RuESo29i8kAeO6AzWryuZM9DODSY45Ds0hxR3a+S8y
         xKSg==
X-Gm-Message-State: ANhLgQ1pAZdJdI1VZzg1/Aw7npjVj9zsRiQOr01KJJ/m0BFeaHNrCK23
        aM445vTnR73S9otmiLe/+ueBag==
X-Google-Smtp-Source: ADFU+vtDVHGVGhRWc3b5Kbe7ELrzDJfeMmJctyiPAwyCZXURX7JHPZ/jPhFVH4Ab0yU9LkBak47NPg==
X-Received: by 2002:a63:68a:: with SMTP id 132mr3603572pgg.12.1584426738234;
        Mon, 16 Mar 2020 23:32:18 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm1793802pfb.41.2020.03.16.23.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 23:32:17 -0700 (PDT)
Date:   Mon, 16 Mar 2020 23:31:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jackp@codeaurora.org,
        robh@kernel.org, Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 7/7] usb: dwc3: qcom: Enable gpio-usb-conn based
 role-switching
Message-ID: <20200317063101.GA2778164@ripper>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
 <20200311191501.8165-8-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311191501.8165-8-bryan.odonoghue@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Mar 12:15 PDT 2020, Bryan O'Donoghue wrote:

> This patch adds the ability to receive a notification from the DRD code for
> role-switch events and in doing so it introduces a disjunction between
> gpio-usb-conn or extcon mode.
> 
> This is what we want to do, since the two methods are mutually exclusive.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Jack Pham <jackp@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 6f4b2b3cffce..f6a7ede5953e 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -571,6 +571,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	struct device		*dev = &pdev->dev;
>  	struct dwc3_qcom	*qcom;
>  	struct resource		*res, *parent_res = NULL;
> +	struct dwc3		*dwc;
>  	int			ret, i;
>  	bool			ignore_pipe_clk;
>  
> @@ -669,8 +670,16 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
>  		dwc3_qcom_vbus_overrride_enable(qcom, true);
>  
> -	/* register extcon to override sw_vbus on Vbus change later */
> -	ret = dwc3_qcom_register_extcon(qcom);
> +	if (dwc3_qcom_find_gpio_usb_connector(qcom->dwc3)) {
> +		/* Using gpio-usb-conn register a notifier for VBUS */
> +		dwc = platform_get_drvdata(qcom->dwc3);

As I was testing some other things on my qcs404 board this
suddenly failed.

The of_platform_populate() in dwc3_qcom_of_register_core() will create a
struct platform_device and attempt to probe this. But as my PHY(s) isn't
ready that returns with -EPROBE_DEFER - i.e. it will not reach the
platform_set_drvdata().

The check in dwc3_qcom_of_register_core() successfully resolves the
struct platform_device (it's sitting there waiting to be reprobed
later).

So qcom->dwc3 will be valid, but dwc here will be NULL.

> +		qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
> +		ret = dwc3_role_switch_notifier_register(dwc, &qcom->vbus_nb);

So here we pass NULL to dwc3_role_switch_notifier_register(), which
dereferences it and we get an oops.


I don't yet have a sane suggestion on how to redesign the dependency
between the two drivers in order to avoid this, but it's at least not
possible to access the child's state data from dwc3_qcom_probe().

Regards,
Bjorn

> +	} else {
> +		/* register extcon to override sw_vbus on Vbus change later */
> +		ret = dwc3_qcom_register_extcon(qcom);
> +	}
> +
>  	if (ret)
>  		goto depopulate;
>  
> @@ -702,8 +711,11 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
>  {
>  	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>  	int i;
>  
> +	dwc3_role_switch_notifier_unregister(dwc, &qcom->vbus_nb);
> +
>  	of_platform_depopulate(dev);
>  
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
> -- 
> 2.25.1
> 
