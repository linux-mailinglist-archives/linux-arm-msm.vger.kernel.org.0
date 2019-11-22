Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB061077DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 20:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfKVTLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 14:11:50 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40652 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfKVTLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 14:11:50 -0500
Received: by mail-pg1-f196.google.com with SMTP id e17so3746639pgd.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X6T8jh75kv5LWSo+UNNPBZVnFupPL5czoWauArGgGKw=;
        b=mOqAJB2CxIztxN2sk8RDyIDNs44dK7Cy//x/KCo4IxAZpuis2o2GmjZ+NjBo2A79AG
         vytU+RgWJaWyqyPCDVjDYSifLxcUuQypzqncAWjB6jyyRJrFXhX8cNw4fcutsgBJVlx7
         tqGwZ+IF6txm1zUXm2R78DCKRMblQzMbpLGl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X6T8jh75kv5LWSo+UNNPBZVnFupPL5czoWauArGgGKw=;
        b=uMOGpYdR0yNtYbbpPfih4bOrXQxWqDZ4U0vtr0gmbNQ1q9QB6lraPmYeRvFVkXCIQu
         gKwAQUZDIoIGz/W05yO+mFj2wJqhg6SdxGn+pAsGdpOjCOA2ojL214iXa5gbwDbrVRJf
         M/TYgrj5KtDFKUDns0Hvo6iTNQZDBvsjxRCSqaBPxGW7ESxUHVGk0SDKD3sNQ8pQFlNq
         HAoOllHqHiliVH1pRhM69J36poGoqfCBngV7aBPFDtUjztKaZh6er1g5Q10tDmPsEn0d
         QbkodTNSj4+Bq41Bkgj21LoKEW/8JsF6h2NLMS16IfK2uypOIVc777/mgvU/JiR3JJwG
         onYA==
X-Gm-Message-State: APjAAAUnQXpZOkw5XHRnL1zt0FYYWf9yBP7ORRjD9YpaCx+ikQeY7TJ6
        oKk1CbJygdsiC5y/LQzVTWm+tiWiThA=
X-Google-Smtp-Source: APXvYqxKbM585TdN5jAJnomxPNKhS7MWBQsCODefOV5tbkNXI+2vxaaAM8Xt/xUNVyd3Vq172xxbPw==
X-Received: by 2002:a63:3c6:: with SMTP id 189mr17462191pgd.4.1574449909258;
        Fri, 22 Nov 2019 11:11:49 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 206sm9354381pfu.45.2019.11.22.11.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2019 11:11:48 -0800 (PST)
Date:   Fri, 22 Nov 2019 11:11:47 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 4/5] tty: serial: qcom_geni_serial: Wakeup over UART RX
Message-ID: <20191122191147.GO27773@google.com>
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
 <0101016e937a5b83-1c5c4e0e-ae63-447a-8724-52477b11dff4-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016e937a5b83-1c5c4e0e-ae63-447a-8724-52477b11dff4-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 22, 2019 at 02:18:19PM +0000, Akash Asthana wrote:
> Add system wakeup capability over UART RX line for wakeup capable UART.
> When system is suspended, RX line act as an interrupt to wakeup system
> for any communication requests from peer.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V6:
>  - Rebased on top of tty-next branch.
>  - As per stephen's comment mark devices runtime status as active
>    irrespective of wakeup feature.
> 
> Changes in V5:
>  - No change.
> 
> Changes in V4:
>  - As per Greg's comment, removed extra dev_err logging.
>  - As per Stephen's comment, using common code that manage wakeirq irqs for
>    devices. Using dev_pm_set_dedicated_wake_irq API that will take care of
>    requesting and attaching wakeup irqs for devices. Also, it sets wakeirq
>    status to WAKE_IRQ_DEDICATED_ALLOCATED as a result enabling/disabling of
>    wake irq will be managed by suspend/resume framework so, removed the code
>    for enabling and disabling of wake irq from the driver.
> 
> Changes in V3:
>  - As per Stephen's comment, using platform_get_irq_optional API to get wakeup
>    IRQ for device.
> 
> Changes in V2:
>  - As per Stephen's comment, splitted V1 patch into 2 seperate patch.
>    a) Clean up of core IRQ registration b) Add wakeup feature.
> 
>  drivers/tty/serial/qcom_geni_serial.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 634054a..b952509 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -14,6 +14,8 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/qcom-geni-se.h>
>  #include <linux/serial.h>
>  #include <linux/serial_core.h>
> @@ -116,6 +118,7 @@ struct qcom_geni_serial_port {
>  	bool brk;
>  
>  	unsigned int tx_remaining;
> +	int wakeup_irq;
>  };
>  
>  static const struct uart_ops qcom_geni_console_pops;
> @@ -1302,6 +1305,9 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		return irq;
>  	uport->irq = irq;
>  
> +	if (!console)
> +		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
> +
>  	uport->private_data = drv;
>  	platform_set_drvdata(pdev, port);
>  	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
> @@ -1321,6 +1327,24 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	/*
> +	 * Set pm_runtime status as ACTIVE so that wakeup_irq gets
> +	 * enabled/disabled from dev_pm_arm_wake_irq  during  system

nit: remove one of the two blanks before/after 'during'.

> +	 * suspend/resume respectively.
> +	 */
> +	pm_runtime_set_active(&pdev->dev);
> +
> +	if (port->wakeup_irq > 0) {
> +		device_init_wakeup(&pdev->dev, true);
> +		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
> +						port->wakeup_irq);
> +		if (ret) {
> +			device_init_wakeup(&pdev->dev, false);
> +			uart_remove_one_port(drv, uport);
> +			return ret;
> +		}
> +	}
> +
>  	return ret;
>  }
>  
> @@ -1330,6 +1354,10 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
>  	struct uart_driver *drv = port->uport.private_data;
>  
>  	uart_remove_one_port(drv, &port->uport);
> +
> +	device_init_wakeup(&pdev->dev, false);
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +
>  	return 0;
>  }

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
