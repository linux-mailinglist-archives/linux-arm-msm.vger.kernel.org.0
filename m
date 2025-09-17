Return-Path: <linux-arm-msm+bounces-73841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF7B7ED5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64B714E281D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598F61E260A;
	Wed, 17 Sep 2025 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwtomklb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CB7B67A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071733; cv=none; b=Px6/cDaDt9q07WjUp/0uLvskPutaAKfIeJsYiJlYwRoYMDhkkvd0w6zDS4+EqWRTWw2Cnq+txNtDg5O5BKye/Uv1SQh29xM8SqkAPCDGTPhD8Fub7umFeLJE5ZxmnABzCS5Jt0XFeWq8sx3dl6XNYvewefKgmQI8tF0C8ylkXT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071733; c=relaxed/simple;
	bh=/ROwOG1+QwtVzCMCs0J/xAD0Ki/DQw+LSb3U631YbCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rV935vrUsy4Ji/u32ZcwTYtYCySvSuUk+ugX9rdiHk5fSZvsqLbqfteZ/IMYbY0EFuG0utIB6YenMQaepaF6R9CcMQ0F7CiWKv+jmkX+AEo+gGaaglwSeyozFCmq5NsUSRxKl2rALKwYJ7mnuPPJjDYEUirom0sV/2fes1e73BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwtomklb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ea3e223ba2so2753641f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 18:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758071729; x=1758676529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYZK88wv9qJwhv0ole9UQ7a4Iu5msY6EoSVeSCUoLys=;
        b=zwtomklb/shu5PBA1hdImHUO8RnT90djBaTA18ZYeFWfo3gGo3k4MPcdhF3rdcKkJf
         TDFO2x8DSUdp/aIyO4FpP0F0gETlGS+0465uvW6DZZZRfo9g6Vqwr4YVGTe/T/lyvPqS
         gBute0YKm6/7ku7EjyfROcD0310wKPtuh6cTy1JJaKMEKYlTZKiZ6jrbPzXTSh95DNlf
         7CZLUC7AQlJPQ7j9NVGKsYSwbQKQkOemItULLUXqwquhmwzR+BBLnwmoPdZtjGKPx0et
         yLFZwKVUjFvJpTjt8aOQPLxCfca3iW0+7vTWBHmu0dQ1qVWZ1PMoDsWEvsH94HzIHF0J
         5b9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758071729; x=1758676529;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYZK88wv9qJwhv0ole9UQ7a4Iu5msY6EoSVeSCUoLys=;
        b=JrXk/rZEiM5EF4dFZ6QyfazykycHHRzixe79WaeR74juiMvZN7JRnLCx6XZ/S501xk
         XjA4hh3NDoSg6DmMNZRMW8WpA7+gDJlHblwyx9l9TI9eKzdOBIRGKsm+rdyhtg4ujiV1
         vC6fJdoK9Q5sANNfPX1SSXnysemn+ej7Uelk7rDVjjMbBHZYA8vI4Sth1PIj3ZMq4JbL
         KL/Fm+gHoG4gfFsJsIlWA6xTggzPKTMSfBizEindHdFrpQbMqM4BMIPT8lzD35TpJClP
         Sjl93c0qodW+RqXrg/YfnU8ClQqrjIyGgYNQqfDLCZ5qdOa+eULx3bFWmp+ZiRREeDVh
         sG4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfFJjnS/fr1X8cBxYuLO7TFXOH6vZ4uk+X5x9LybGft0Jt4iWX6J0iJqACxzSTyM2z8AvpYkF8cqGr80Ra@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr1mXSChCY4WGOzw45DSMSlj6do0MCbWqtAYHhu1AzX7UdynNM
	b1E5CIT/V4e67yzF0Pby+POQXv41lguDsuhS6VPW3D3zXZ8nNixmCQYBj5S7Y0531PM=
X-Gm-Gg: ASbGncskda9ziqGgGyeRTtEu9SAp7hib9C6x9ut3gKvnw+ep4qqgRh23ouDtW3C9Lxh
	JrDzYYyIqWuCsAfWeLvdnm2uAIs3QLEexJI/ANft1MsPL8SnqN1aLd0hgQV/hl0iEkQaaMFMcrn
	NDsaxuQOvFKWoSardSNYhGYksnbG5KZZ1d6ZGqKqBEnpx+WqKpmjjv2Hq1WBlffgKkh+f3YXT4b
	H/ll4kiU/1hDaZQD5/JmgZKyGfSUnI6/SDyHdfvAvwJjfkGPx+X7DmqK6CPrBSTFZbP/csCEwc/
	EoFo8l14fk0qk7MIQly7Pyd3Jn8D6zTlS/lkGKIz8WeJvjqzHwswIZsnW/NITyJvUao/T6yfnMS
	Sv3qopx2u4MaWSLwTtkBEHfx+SKW3X5Ir+aGjhZXObi2jBj70W/WqUavJlvoaIR5CqP3co/Fe0L
	EIWFVrotIqjm7rZgis09bi
X-Google-Smtp-Source: AGHT+IH/Z6aHRJeB4sUO/EZMSXRHlYvFPpWA55uizRWBAB3HeyicfIhzVVMxWxwpj4g1Cil6LYon2g==
X-Received: by 2002:a05:6000:22c7:b0:3e9:978e:48d7 with SMTP id ffacd0b85a97d-3ecdfa2def3mr216013f8f.48.1758071729186;
        Tue, 16 Sep 2025 18:15:29 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdfea694csm168443f8f.0.2025.09.16.18.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 18:15:28 -0700 (PDT)
Message-ID: <4467fbb3-6716-4169-ba72-81c70243b4e1@linaro.org>
Date: Wed, 17 Sep 2025 02:15:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom-geni: Fix blocked task
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Praveen Talari
 <quic_ptalari@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>
References: <20250917010437.129912-2-krzysztof.kozlowski@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250917010437.129912-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2025 02:04, Krzysztof Kozlowski wrote:
> Revert commit 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for
> serial driver") and its dependent commit 86fa39dd6fb7 ("serial:
> qcom-geni: Enable Serial on SA8255p Qualcomm platforms") because the
> first one causes regression - hang task on Qualcomm RB1 board (QRB2210)
> and unable to use serial at all during normal boot:
> 
>    INFO: task kworker/u16:0:12 blocked for more than 42 seconds.
>          Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
>    "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>    task:kworker/u16:0   state:D stack:0     pid:12    tgid:12    ppid:2      task_flags:0x4208060 flags:0x00000010
>    Workqueue: async async_run_entry_fn
>    Call trace:
>     __switch_to+0xe8/0x1a0 (T)
>     __schedule+0x290/0x7c0
>     schedule+0x34/0x118
>     rpm_resume+0x14c/0x66c
>     rpm_resume+0x2a4/0x66c
>     rpm_resume+0x2a4/0x66c
>     rpm_resume+0x2a4/0x66c
>     __pm_runtime_resume+0x50/0x9c
>     __driver_probe_device+0x58/0x120
>     driver_probe_device+0x3c/0x154
>     __driver_attach_async_helper+0x4c/0xc0
>     async_run_entry_fn+0x34/0xe0
>     process_one_work+0x148/0x290
>     worker_thread+0x2c4/0x3e0
>     kthread+0x118/0x1c0
>     ret_from_fork+0x10/0x20
> 
> The issue was reported on 12th of August and was ignored by author of
> commits introducing issue for two weeks.  Only after complaining author
> produced a fix which did not work, so if original commits cannot be
> reliably fixed for 5 weeks, they obviously are buggy and need to be
> dropped.
> 
> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Correct reference to cause (proper commit) in the commit msg.
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 176 +++-----------------------
>   1 file changed, 16 insertions(+), 160 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 0fdda3a1e70b..7c5befe5490d 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -14,7 +14,6 @@
>   #include <linux/irq.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -102,16 +101,10 @@
>   #define DMA_RX_BUF_SIZE		2048
>   
>   static DEFINE_IDA(port_ida);
> -#define DOMAIN_IDX_POWER	0
> -#define DOMAIN_IDX_PERF		1
>   
>   struct qcom_geni_device_data {
>   	bool console;
>   	enum geni_se_xfer_mode mode;
> -	struct dev_pm_domain_attach_data pd_data;
> -	int (*resources_init)(struct uart_port *uport);
> -	int (*set_rate)(struct uart_port *uport, unsigned int baud);
> -	int (*power_state)(struct uart_port *uport, bool state);
>   };
>   
>   struct qcom_geni_private_data {
> @@ -149,7 +142,6 @@ struct qcom_geni_serial_port {
>   
>   	struct qcom_geni_private_data private_data;
>   	const struct qcom_geni_device_data *dev_data;
> -	struct dev_pm_domain_list *pd_list;
>   };
>   
>   static const struct uart_ops qcom_geni_console_pops;
> @@ -1301,42 +1293,6 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
>   	return 0;
>   }
>   
> -static int geni_serial_set_level(struct uart_port *uport, unsigned int baud)
> -{
> -	struct qcom_geni_serial_port *port = to_dev_port(uport);
> -	struct device *perf_dev = port->pd_list->pd_devs[DOMAIN_IDX_PERF];
> -
> -	/*
> -	 * The performance protocol sets UART communication
> -	 * speeds by selecting different performance levels
> -	 * through the OPP framework.
> -	 *
> -	 * Supported perf levels for baudrates in firmware are below
> -	 * +---------------------+--------------------+
> -	 * |  Perf level value   |  Baudrate values   |
> -	 * +---------------------+--------------------+
> -	 * |      300            |      300           |
> -	 * |      1200           |      1200          |
> -	 * |      2400           |      2400          |
> -	 * |      4800           |      4800          |
> -	 * |      9600           |      9600          |
> -	 * |      19200          |      19200         |
> -	 * |      38400          |      38400         |
> -	 * |      57600          |      57600         |
> -	 * |      115200         |      115200        |
> -	 * |      230400         |      230400        |
> -	 * |      460800         |      460800        |
> -	 * |      921600         |      921600        |
> -	 * |      2000000        |      2000000       |
> -	 * |      3000000        |      3000000       |
> -	 * |      3200000        |      3200000       |
> -	 * |      4000000        |      4000000       |
> -	 * +---------------------+--------------------+
> -	 */
> -
> -	return dev_pm_opp_set_level(perf_dev, baud);
> -}
> -
>   static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   					 struct ktermios *termios,
>   					 const struct ktermios *old)
> @@ -1355,7 +1311,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   	/* baud rate */
>   	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
>   
> -	ret = port->dev_data->set_rate(uport, baud);
> +	ret = geni_serial_set_rate(uport, baud);
>   	if (ret)
>   		return;
>   
> @@ -1642,27 +1598,8 @@ static int geni_serial_resources_off(struct uart_port *uport)
>   	return 0;
>   }
>   
> -static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
> +static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
>   {
> -	return power_on ? geni_serial_resources_on(uport) : geni_serial_resources_off(uport);
> -}
> -
> -static int geni_serial_pwr_init(struct uart_port *uport)
> -{
> -	struct qcom_geni_serial_port *port = to_dev_port(uport);
> -	int ret;
> -
> -	ret = dev_pm_domain_attach_list(port->se.dev,
> -					&port->dev_data->pd_data, &port->pd_list);
> -	if (ret <= 0)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> -static int geni_serial_resource_init(struct uart_port *uport)
> -{
> -	struct qcom_geni_serial_port *port = to_dev_port(uport);
>   	int ret;
>   
>   	port->se.clk = devm_clk_get(port->se.dev, "se");
> @@ -1707,10 +1644,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>   		old_state = UART_PM_STATE_OFF;
>   
>   	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> -		pm_runtime_resume_and_get(uport->dev);
> +		geni_serial_resources_on(uport);
>   	else if (new_state == UART_PM_STATE_OFF &&
>   		 old_state == UART_PM_STATE_ON)
> -		pm_runtime_put_sync(uport->dev);
> +		geni_serial_resources_off(uport);
>   
>   }
>   
> @@ -1813,16 +1750,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   	port->se.dev = &pdev->dev;
>   	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>   
> -	ret = port->dev_data->resources_init(uport);
> +	ret = geni_serial_resource_init(port);
>   	if (ret)
>   		return ret;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		ret = -EINVAL;
> -		goto error;
> -	}
> -
> +	if (!res)
> +		return -EINVAL;
>   	uport->mapbase = res->start;
>   
>   	uport->rs485_config = qcom_geni_rs485_config;
> @@ -1834,26 +1768,19 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   	if (!data->console) {
>   		port->rx_buf = devm_kzalloc(uport->dev,
>   					    DMA_RX_BUF_SIZE, GFP_KERNEL);
> -		if (!port->rx_buf) {
> -			ret = -ENOMEM;
> -			goto error;
> -		}
> +		if (!port->rx_buf)
> +			return -ENOMEM;
>   	}
>   
>   	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
>   			"qcom_geni_serial_%s%d",
>   			uart_console(uport) ? "console" : "uart", uport->line);
> -	if (!port->name) {
> -		ret = -ENOMEM;
> -		goto error;
> -	}
> +	if (!port->name)
> +		return -ENOMEM;
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		ret = irq;
> -		goto error;
> -	}
> -
> +	if (irq < 0)
> +		return irq;
>   	uport->irq = irq;
>   	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
>   
> @@ -1875,18 +1802,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   			IRQF_TRIGGER_HIGH, port->name, uport);
>   	if (ret) {
>   		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> -		goto error;
> +		return ret;
>   	}
>   
>   	ret = uart_get_rs485_mode(uport);
>   	if (ret)
>   		return ret;
>   
> -	devm_pm_runtime_enable(port->se.dev);
> -
>   	ret = uart_add_one_port(drv, uport);
>   	if (ret)
> -		goto error;
> +		return ret;
>   
>   	if (port->wakeup_irq > 0) {
>   		device_init_wakeup(&pdev->dev, true);
> @@ -1896,15 +1821,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   			device_init_wakeup(&pdev->dev, false);
>   			ida_free(&port_ida, uport->line);
>   			uart_remove_one_port(drv, uport);
> -			goto error;
> +			return ret;
>   		}
>   	}
>   
>   	return 0;
> -
> -error:
> -	dev_pm_domain_detach_list(port->pd_list);
> -	return ret;
>   }
>   
>   static void qcom_geni_serial_remove(struct platform_device *pdev)
> @@ -1917,31 +1838,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>   	device_init_wakeup(&pdev->dev, false);
>   	ida_free(&port_ida, uport->line);
>   	uart_remove_one_port(drv, &port->uport);
> -	dev_pm_domain_detach_list(port->pd_list);
> -}
> -
> -static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
> -{
> -	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> -	struct uart_port *uport = &port->uport;
> -	int ret = 0;
> -
> -	if (port->dev_data->power_state)
> -		ret = port->dev_data->power_state(uport, false);
> -
> -	return ret;
> -}
> -
> -static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
> -{
> -	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> -	struct uart_port *uport = &port->uport;
> -	int ret = 0;
> -
> -	if (port->dev_data->power_state)
> -		ret = port->dev_data->power_state(uport, true);
> -
> -	return ret;
>   }
>   
>   static int qcom_geni_serial_suspend(struct device *dev)
> @@ -1979,46 +1875,14 @@ static int qcom_geni_serial_resume(struct device *dev)
>   static const struct qcom_geni_device_data qcom_geni_console_data = {
>   	.console = true,
>   	.mode = GENI_SE_FIFO,
> -	.resources_init = geni_serial_resource_init,
> -	.set_rate = geni_serial_set_rate,
> -	.power_state = geni_serial_resource_state,
>   };
>   
>   static const struct qcom_geni_device_data qcom_geni_uart_data = {
>   	.console = false,
>   	.mode = GENI_SE_DMA,
> -	.resources_init = geni_serial_resource_init,
> -	.set_rate = geni_serial_set_rate,
> -	.power_state = geni_serial_resource_state,
> -};
> -
> -static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
> -	.console = true,
> -	.mode = GENI_SE_FIFO,
> -	.pd_data = {
> -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> -		.pd_names = (const char*[]) { "power", "perf" },
> -		.num_pd_names = 2,
> -	},
> -	.resources_init = geni_serial_pwr_init,
> -	.set_rate = geni_serial_set_level,
> -};
> -
> -static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
> -	.console = false,
> -	.mode = GENI_SE_DMA,
> -	.pd_data = {
> -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> -		.pd_names = (const char*[]) { "power", "perf" },
> -		.num_pd_names = 2,
> -	},
> -	.resources_init = geni_serial_pwr_init,
> -	.set_rate = geni_serial_set_level,
>   };
>   
>   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> -	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> -			   qcom_geni_serial_runtime_resume, NULL)
>   	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>   };
>   
> @@ -2027,18 +1891,10 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
>   		.compatible = "qcom,geni-debug-uart",
>   		.data = &qcom_geni_console_data,
>   	},
> -	{
> -		.compatible = "qcom,sa8255p-geni-debug-uart",
> -		.data = &sa8255p_qcom_geni_console_data,
> -	},
>   	{
>   		.compatible = "qcom,geni-uart",
>   		.data = &qcom_geni_uart_data,
>   	},
> -	{
> -		.compatible = "qcom,sa8255p-geni-uart",
> -		.data = &sa8255p_qcom_geni_uart_data,
> -	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

