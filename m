Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B19010778D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 19:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKVSqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 13:46:21 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37916 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfKVSqV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 13:46:21 -0500
Received: by mail-pj1-f67.google.com with SMTP id f7so3398382pjw.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 10:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9XnDb7Q/IygLgTSRY7SeZwvkE08Zst4cGrNTkzkS96o=;
        b=adtUzSvCsWX468rx5R8F7PruMHga/0PUW/ZE3rqPEUxn/YxLoh/JKlMiy9+nZ4XhCj
         6jqSdenfcrsTGyG+hYUE7GJpzq8RKsyU+3vguQ+JT40Xx/BRPhxR5hNa9tvKYAQJJEmx
         ug2U1ijvy9ktHQKXm0Q8wKNrkpfiA26bGEy08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9XnDb7Q/IygLgTSRY7SeZwvkE08Zst4cGrNTkzkS96o=;
        b=hiDYVPsCgpsoCpgAPLFgpyBILRjH5O3HUItdd0x/3JCV9fDuNd1I+Zg3L0rS0JWCEC
         CToJ2EafD1sX6TflB7yBZMQ91rwEg/DG9OJu6Fj+6F2kk3Qtf/toHla3tl2VtN5zk0/M
         5meIbSuBf2XJUjBMEMnYUbJd2x3mfObAlonOJ7WNA8p2JwRbyzl/1/8xu99A2FzKcTsc
         V4nflE7C6Hw3SdVH+j4De4Ye6KuXlhfdRy4hd3zG/vc9JHxIrp3fyuJn1aPszO41IlPS
         N3ER1Ttknccm6AmYVElOTB50E3mHv8o5SUqRDmO04NDBclsXPz8e94wISKM9Ql5gSmfD
         nAlQ==
X-Gm-Message-State: APjAAAUqqRQai7P+9rFBw+XHLAg2yjStl96141JtohQI/y8wLtjTkWSF
        iHwlDELFLnMTfNbTQ5B+IKf5Rw==
X-Google-Smtp-Source: APXvYqxdSCDY1pz30iWJARX7yjsOYRJC+q3IVnarA7giUUrnGrvRUXePwiklSmlBDTvlpPAVjwIaAg==
X-Received: by 2002:a17:902:b945:: with SMTP id h5mr15631521pls.291.1574448380152;
        Fri, 22 Nov 2019 10:46:20 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z1sm3893020pju.27.2019.11.22.10.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2019 10:46:19 -0800 (PST)
Date:   Fri, 22 Nov 2019 10:46:18 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 3/5] tty: serial: qcom_geni_serial: IRQ cleanup
Message-ID: <20191122184618.GN27773@google.com>
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
 <0101016e937a3e05-f74c5c73-a964-45f2-ae71-6daed292e8ee-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016e937a3e05-f74c5c73-a964-45f2-ae71-6daed292e8ee-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 22, 2019 at 02:18:12PM +0000, Akash Asthana wrote:
> Move ISR registration from startup to probe function to avoid registering
> it everytime when the port open is called for driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in v6:
>  - Rebased on tty-next branch
> 
> Changes in v5:
>  - No change.
> 
> Changes in v4:
>  - As per Stephen's comment, move ISR registration(later in probe) after
>    registering uart port with serial core.
>  - As per Greg's comment, corrected returning of PTR value from integer type
>    function(probe).
> 
> Changes in v3:
>  - As per Stephen's comment, using devm_kasprintf instead of scnprintf API.
> 
>  drivers/tty/serial/qcom_geni_serial.c | 38 ++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 14c6306..634054a 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
>
> ...
>
> @@ -1307,7 +1307,21 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
>  	if (!console)
>  		device_create_file(uport->dev, &dev_attr_loopback);
> -	return uart_add_one_port(drv, uport);
> +
> +	ret = uart_add_one_port(drv, uport);
> +	if (ret)
> +		return ret;
> +
> +	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
> +	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
> +			IRQF_TRIGGER_HIGH, port->name, uport);
> +	if (ret) {
> +		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> +		uart_remove_one_port(drv, uport);
> +		return ret;

nit: could fall through

> +	}
> +
> +	return ret;

nit: if not falling through above this could/should be 0.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
