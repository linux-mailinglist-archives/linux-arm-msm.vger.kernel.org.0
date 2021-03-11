Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60971337A48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 18:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhCKRAd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 12:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhCKRAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 12:00:22 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BD9C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 09:00:22 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id j8so2136534otc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 09:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=opGBE+10vyFaw9yXptg7nxWBvuTnyAQM8hdaMx9w63c=;
        b=brsWF+hhAjGXFFBDF/+wE9hkQEfxCxVG9WwxUYGy0YrIruOCy/gpJr1OTPPPQp6TFX
         pimPD/7tOSiiErUv0ZHaOzqZH7N17QLIqjEbQMh4YjgkVe7i4GfcXScqpisWEe51wGCe
         szgDZvd8S2j6aEQ3W+xcFs9PlC0JkJtK0t0Geq/Y/lE0LVyzwrTtZwcs/uEwrwBXEYZn
         awU/zYxTi79Hyp5BOftlNMELaOgbldq3DXkUuVd3wmUxmuAGyZFr2hXDw3S0rO0EWKFT
         OPmXNgmIbZ2CTq0FjvRIRA47m7fmieCHb3QtXRy4le1tr0A78eyFwC2WArzrTwcdTx0N
         2/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=opGBE+10vyFaw9yXptg7nxWBvuTnyAQM8hdaMx9w63c=;
        b=bAu4T7C/s0NJeFgz5GLo+ZJtoKuFGaUVd+6toikhSki7iKVkCU2Qf1gUcHA19jSGOX
         1NfBSHcNReHP0PGu8sNQeHusB1uBgBhAMj0/LIBRlSG3wMD/HXBsGozbeh9LirYuTS3U
         urx/EUcEGf1n222jFYC5abU1hSPdxn8emJ0/ikkGd42yMOWSBGbAnbcYKThCwj97Ycq+
         rXJ33aOGVn8xt2FP4PzrYxTYHu8fLLySvNkCMWwpzdqNBcNnR4oRqdWX9doUD6Eb8DYt
         LXjNQ6LAqEc7NWTKgzSBPLMe34XaktGXF4pfV3g5zwwl4nuGG3lJfZqB8edswtJWwxP/
         OyOw==
X-Gm-Message-State: AOAM531fSG1q/5g5cIkFX0R+qzaSA795EBHpMdeJjTz1dV3e9mZCK6pb
        vQtgdZlJCDdwjxfzIfQPA8gSwA==
X-Google-Smtp-Source: ABdhPJxb/Ex4VAjYa21hjLYf0d1Ge004JUzrWfI/sBuWi06jxYSkVf7WHk4QVjENxnVkm0u/bx0vZw==
X-Received: by 2002:a9d:7f1a:: with SMTP id j26mr7543565otq.244.1615482019502;
        Thu, 11 Mar 2021 09:00:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k9sm757214ots.24.2021.03.11.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:00:18 -0800 (PST)
Date:   Thu, 11 Mar 2021 11:00:16 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 1/3] rtc: pm8xxx: Add RTC support for PMIC PMK8350
Message-ID: <YEpMoP5Efk19YJAA@builder.lan>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
 <1615447798-6959-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615447798-6959-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 01:29 CST 2021, satya priya wrote:

> Add the comaptible string for PMIC PMK8350.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index eb20659..29a1c65 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -445,6 +445,16 @@ static const struct pm8xxx_rtc_regs pm8941_regs = {
>  	.alarm_en	= BIT(7),
>  };
>  
> +static const struct pm8xxx_rtc_regs pmk8350_regs = {
> +	.ctrl		= 0x6146,
> +	.write		= 0x6140,
> +	.read		= 0x6148,
> +	.alarm_rw	= 0x6240,
> +	.alarm_ctrl	= 0x6246,
> +	.alarm_ctrl2	= 0x6248,
> +	.alarm_en	= BIT(7),
> +};
> +
>  /*
>   * Hardcoded RTC bases until IORESOURCE_REG mapping is figured out
>   */
> @@ -453,6 +463,7 @@ static const struct of_device_id pm8xxx_id_table[] = {
>  	{ .compatible = "qcom,pm8018-rtc", .data = &pm8921_regs },
>  	{ .compatible = "qcom,pm8058-rtc", .data = &pm8058_regs },
>  	{ .compatible = "qcom,pm8941-rtc", .data = &pm8941_regs },
> +	{ .compatible = "qcom,pmk8350-rtc", .data = &pmk8350_regs },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
