Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B817491F4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 07:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239738AbiARGMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 01:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiARGMd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 01:12:33 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6673BC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jan 2022 22:12:33 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id v8-20020a9d6048000000b005960952c694so12397457otj.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jan 2022 22:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=f3VawGmozyunnfA2iQeu0QUYA180FehEfQsU6i2pC6U=;
        b=UsrzyLUh9AckId6pX6SbnLwNe3EaFmW0gxMM5GgGoPbm50EqE1LaCMgIvoleQoksMv
         40WmEqNHx6e4j38KMLBk8abIlyDaOJX5yTh+mXUfwPb8qjgMjla7zI2e580aLg2drhV9
         GCGivBn8VQD1TTPQ1EEU92TAjQV+KmsAgoZExM+xusclJwCZEvJ8DWFWr6DHHuDf09EA
         plpbTUgqA3hvMTHsQafC+ept9b/SXZuGIiixiNe0Kc1scgBS0c0HzF29NEBv4uesVwfO
         cuxTS0mxTMX1oCSQ2OrWRnBEmjYZqpyFULsO02fpxhoxgbOUWrZY5mhFPHbTbcHJgBPC
         NbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f3VawGmozyunnfA2iQeu0QUYA180FehEfQsU6i2pC6U=;
        b=itliLk0koCUlAx/1HjlbKPyNfhNuN9WVxamHw8NIrnpETi0w7q8Oh/Zd6T8Yx4Ojt8
         WYQhBX5rAagJXUO4yy5IpXNhmkOf3tv/UENX7SDV/V4sb3osUAU6fM5+FwO4c7OscWlz
         HTm3XtyyqRgeS7AgIeOlsTUjt/GrEQG0/e2VRSiOqr6ICV/q7l/q9UA/fs3gtZS0GBMp
         OrUHXercVRl7KYiOcXIDw9FKIknQcbA/jRJbdoBoaD3rohwWHkrgG3K/96eTTQfsm++n
         kjCoSW8kDVOVO+xG6PeJ83OKJTUZWnQDTnXFK3RnWRcuainvKzB0mnKoDTTHj0cHjfQd
         ll4g==
X-Gm-Message-State: AOAM5303Dsyv3eErkCHprrJCrCgCXNHjOWrfHnz+VDraeyYthfn6KYuH
        X2TlFqL0jS2Quc3lalFkj2yL3Q==
X-Google-Smtp-Source: ABdhPJzo76aeGfduuiHgCmr4oAPQCfnPVPJ3HRAW2RC1IRxdD1GIoM8ERCjWZwuHnyiqElmkWeGopw==
X-Received: by 2002:a9d:25:: with SMTP id 34mr15421703ota.113.1642486352809;
        Mon, 17 Jan 2022 22:12:32 -0800 (PST)
Received: from [192.168.11.55] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id y9sm6427427oti.62.2022.01.17.22.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 22:12:32 -0800 (PST)
Message-ID: <93b68251-7e7e-ac92-fb47-346c410744b2@kali.org>
Date:   Tue, 18 Jan 2022 00:12:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v10 6/6] usb: dwc3: qcom: Enable the interrupts during
 probe
Content-Language: en-US
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
References: <1642398248-21753-1-git-send-email-quic_c_sanm@quicinc.com>
 <1642398248-21753-7-git-send-email-quic_c_sanm@quicinc.com>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <1642398248-21753-7-git-send-email-quic_c_sanm@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/16/22 11:44 PM, Sandeep Maheswaram wrote:
> Enable the interrupts during probe and remove the disable interrupts
> function.
>
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 28 ++++------------------------
>   1 file changed, 4 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 54dc3d3..7c5e636 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -306,25 +306,7 @@ static void dwc3_qcom_enable_wakeup_irq(int irq)
>   	enable_irq_wake(irq);
>   }
>   
> -static void dwc3_qcom_disable_wakeup_irq(int irq)
> -{
> -	if (!irq)
> -		return;
> -
> -	disable_irq_wake(irq);
> -	disable_irq_nosync(irq);
> -}
>   
> -static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
> -{
> -	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
> -
> -	dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> -
> -	dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> -
> -	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
> -}
>   
>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   {
> @@ -356,9 +338,6 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>   	if (ret)
>   		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
>   
> -	if (device_may_wakeup(qcom->dev))
> -		dwc3_qcom_enable_interrupts(qcom);
> -
>   	qcom->is_suspended = true;
>   
>   	return 0;
> @@ -372,9 +351,6 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>   	if (!qcom->is_suspended)
>   		return 0;
>   
> -	if (device_may_wakeup(qcom->dev))
> -		dwc3_qcom_disable_interrupts(qcom);
> -
>   	for (i = 0; i < qcom->num_clocks; i++) {
>   		ret = clk_prepare_enable(qcom->clks[i]);
>   		if (ret < 0) {
> @@ -832,6 +808,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   	genpd->flags |= GENPD_FLAG_ALWAYS_ON;
>   
>   	device_init_wakeup(&pdev->dev, 1);
> +
> +	if (device_may_wakeup(qcom->dev))
> +		dwc3_qcom_enable_interrupts(qcom);
> +
>   	qcom->is_suspended = false;
>   	pm_runtime_set_active(dev);
>   	pm_runtime_enable(dev);

Hi Sandeep,

I was testing this series on my Lenovo Yoga C630, and with this patch in 
particular applied, my system will no longer boot. Unfortunately I don't 
get any sort of good output at all, I just get hung tasks when trying to 
probe things it would seem.


With the other 5 patches in the series applied, the system still boots 
and works correctly.


-- Steev

