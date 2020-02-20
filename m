Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6F416539C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 01:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgBTAb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 19:31:56 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39944 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgBTAb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 19:31:56 -0500
Received: by mail-pg1-f195.google.com with SMTP id z7so974898pgk.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 16:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nh/PXJt5LIK6knlDEBV+szof//jRNZ6d+fFEe23/31U=;
        b=x6gNshASw2xBuVQruMd2+i0AlOaA3fYhjwWuGLZwAM7FObTbKD0cIU7WwozKq5LG9N
         QKe9K0IhRl08tPACnnQqAKOjsAP0EKLwMIAAeFNX2Hqyfvw7ZwVtdqkytJgJfm05KkkU
         vr+c3vvs34c/xw+v9D5qMrCQTjnyAFfRmsWviBm5E/xCjJm0Jvl8XsAwc1dricxMw+Lh
         upktjdIBtqcUH1E7t80m8dTkzVHqMqBoiQ3tgZ8lvNovnpIuzSMNmUo1maXZzESmZFxB
         5npZjsYrYatMHb+gEJLgHK9gx5nHlf9LGlzzGapKcmhf8UMyBdHYl7cBOl1diX66k54k
         K6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nh/PXJt5LIK6knlDEBV+szof//jRNZ6d+fFEe23/31U=;
        b=YXbJX8IaHdBL2Zx3uTy5l1XTjVhKXedNGzRYT7sugkeUO20loIertSr9GenN6Cukh+
         JABguFZrot6pqlWubJsvZrSo9mrJNJKS5p3R7gemxdO2L/WXpL2fzGhKPFnmgxcGidAT
         ctzdXHnJNsd8GmgR6iIi94QMHvv+yBrAH10tFAkhsrYIRnctRYMKRjbR2N6Al0r+sdeK
         lAX08MQ722FBiaVUIi5L4D9QmpKBLSVyIRqVUYJJ0OZCSFtpTOlexjaVs0PjoEsOxg6Y
         CFNUYqcu7lIxFZhD7naiMvo2rdnY1VmOMi1nMf6viHd3rOoyIeju1Rma3sJlySgzx3VC
         HyDA==
X-Gm-Message-State: APjAAAUKPMG+yHLH6R+PR9Ulor8AZqjyOEHN9kxpxnY6+iwbHRlAjU+w
        nbDb3AX1SqtnGtRASmEZuQGOiA==
X-Google-Smtp-Source: APXvYqxoGLXHiH+nbn5V/5/GaH/0ND+3nZ09GJR+kv3Z8JEcxf2VsZSpJjwFzPRRtnBZkQZ+r9FL6w==
X-Received: by 2002:a63:7417:: with SMTP id p23mr29631359pgc.277.1582158715148;
        Wed, 19 Feb 2020 16:31:55 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t186sm866470pgd.26.2020.02.19.16.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:31:54 -0800 (PST)
Date:   Wed, 19 Feb 2020 16:31:52 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] watchdog: qcom: Use irq flags from firmware
Message-ID: <20200220003152.GC99370@yoga>
References: <20200220002047.115000-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220002047.115000-1-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 19 Feb 16:20 PST 2020, Stephen Boyd wrote:

> The DT or ACPI tables should tell the driver what the irq flags are.
> Given that this driver probes only on DT based platforms and those DT
> platforms specify the irq flags we can safely drop the forced irq flag
> setting here.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/watchdog/qcom-wdt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index eb47fe5ed280..c70e89013101 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -248,8 +248,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	/* check if there is pretimeout support */
>  	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq > 0) {
> -		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
> -				       IRQF_TRIGGER_RISING,
> +		ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>  				       "wdt_bark", &wdt->wdd);
>  		if (ret)
>  			return ret;
> -- 
> Sent by a computer, using git, on the internet
> 
