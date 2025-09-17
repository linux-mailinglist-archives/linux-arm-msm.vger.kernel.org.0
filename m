Return-Path: <linux-arm-msm+bounces-73866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB624B7F516
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3BF73B010A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A6B2F25E6;
	Wed, 17 Sep 2025 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EuaHPm2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1662E542A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092936; cv=none; b=GYTj3gI01p+FriglxSYGItpcX29vhxdrtcw0X5R+yB/1tNuIt3WnDPN3kEpQV43vjfo7iJmGnBdNez5M2fRRKozD7xHFAlEnxRkE2jEctT7mW8Or6dXbeTVVX7/rocJM/3dixzIRekKdwpNSksl67LoXLSbK3hO7b9EmmGspU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092936; c=relaxed/simple;
	bh=ghh8f7c7dHgoFU96mLfUg95zZb0yUffRkhQnBIriyD4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=kkFkJiZ4jpKvmNIkmPn+X1j4sTjXB+RojxgYmc3dt8cFmytL9bB04x/6crk6462QHXT68Mo9rIFAcOtDltcaHma3cPPJkmvIvj88Lg0GUKW5H7tZXJeIkBWE1LlGYLGFN6I69xwPHyl3zUgE7ZJaxwLvTd9qxqrai5WEaA6zVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EuaHPm2y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso62469415e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 00:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758092932; x=1758697732; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJK4r9naNgdoIpAJSQN31kuHKBKYgSYDtK0elIxrPLg=;
        b=EuaHPm2y/3TXpoEssKVHl3oG2WMcA94pa3wxG72v1WZ7MguLEi6e/hx9sv5QHoumFg
         eMBDZ/g7VEOprKDesKkyFqWch0Yd4+yssFdis/zhCWj6La4gdWVDCOenlFY1Vti0xMjU
         0jukFGOKtsQkbnwwMW9bYSVV3qPxAHDKWW6gKWmZUFRHp8c8aeyqvkQqDjrg1tOyw8S6
         bQlB4+xIyB4DOc4LfLYCyC3K23y+NGfI21BcR81p45zMY/c8eQpbjGswomNa0RpOuXoQ
         au67wa4zCNJIqDj0Ee7UH8NjblijrMP4R2p1wZc2L3rT5XKTHdzKyCgFfgE5Yld+Phbd
         QL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758092932; x=1758697732;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJK4r9naNgdoIpAJSQN31kuHKBKYgSYDtK0elIxrPLg=;
        b=gazQZfeSN45w/wDzoNTI3k9nRGisZPEfk6qH0Va1pm648P+XTeFIR38Q4cnV/as6Em
         w+ibPuu6I3dOl1q8kN1MtheVhVYYBu7a+owEuFSDEC88baOuhpBcZo0qD7lmBSEKli/P
         699HADF+qGhK18LFG7wdKqVTy1G1QNBhga5JlSX012UaLjM5BDnd5oYWQw6mS/BcQFzy
         Cbxm2vdFxYfQHI37Dvxmm+esSRLp1QURmWnp2pk3ctlByUYG4K94QsEF4DUQvTzmAKmf
         ys1P8xd49Wqo0y4eLoBqDsbG1yOKnS8bmjU3/l9tAobbZcJZTb89Pz9K0GZ82aWaeyXA
         xl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCValXSghcVlNlC80fmrFJY+KAb5rSkrXR3xEfvfNZGjvR9+PoK2B//F8aO5V4aJ1byGfjNSsC6GMFcVKMIz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6vQ8IWbfruWC7S0L4BfjOI712rLSidDDIck4yFVJLf9Ix9nhl
	NMhZH8INRDhEoHi5KaTN1rs/1asAqzjv1+qeg/I/8/fNcoIvgJhVnz0eQwDS/ny0PT0=
X-Gm-Gg: ASbGnctqdE3bh/mfI5vQnz873DkKpJXvqnvV++/AeB96hhsPicNmn0QDZdWQ895HWNU
	u1Fx+aYt7YWAZUqM3fBosiQcP/nmuhnRytHpQFbhFfUFFu1giy93K/Bpt9k30DonaBkEaEJStj6
	i7vej/7Fodg/aIKGV6wA+/zrssfzziVE4kJMe1Z5njZboKI4PSjMFu6NIITzEmhxwwfTQeao5q2
	n7MAy5Yp/YFAisT88pqJxRpPfTzX/9NimRODiNfzlD7PqYQn3d6STfIS6XP9Qcv/bqQVPYiUV88
	HwFbFgiImM0z8irSiFR7kTAtWmZwFt/Lo+mvC4IlKkAoaHUzLoiQ4aRozlWuYffRI+Ix/WlF/Wi
	k02hBsZfXjuT3xs6wG9S9r3uuoCs=
X-Google-Smtp-Source: AGHT+IEV0vTT/XNc5OKi7rjTK+jaItMIqenxjHFWCKAa4kCBZcGZsvlMLEbgeMFkL1di8SFusYOkBg==
X-Received: by 2002:a05:600c:c4b8:b0:45f:2bc5:41c3 with SMTP id 5b1f17b1804b1-46202174cb4mr9532275e9.8.1758092932388;
        Wed, 17 Sep 2025 00:08:52 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:75ac:2ea2:dfdc:89c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46137c0f342sm23837645e9.8.2025.09.17.00.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 00:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Sep 2025 08:08:51 +0100
Message-Id: <DCUVXIPKCGFS.E32DN2I35RRR@linaro.org>
Subject: Re: [PATCH v2] serial: qcom-geni: Fix blocked task
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jiri Slaby"
 <jirislaby@kernel.org>, "Praveen Talari" <quic_ptalari@quicinc.com>, "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250917010437.129912-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250917010437.129912-2-krzysztof.kozlowski@linaro.org>

On Wed Sep 17, 2025 at 2:04 AM BST, Krzysztof Kozlowski wrote:
> Revert commit 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for
> serial driver") and its dependent commit 86fa39dd6fb7 ("serial:
> qcom-geni: Enable Serial on SA8255p Qualcomm platforms") because the
> first one causes regression - hang task on Qualcomm RB1 board (QRB2210)
> and unable to use serial at all during normal boot:
>
>   INFO: task kworker/u16:0:12 blocked for more than 42 seconds.
>         Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>   task:kworker/u16:0   state:D stack:0     pid:12    tgid:12    ppid:2   =
   task_flags:0x4208060 flags:0x00000010
>   Workqueue: async async_run_entry_fn
>   Call trace:
>    __switch_to+0xe8/0x1a0 (T)
>    __schedule+0x290/0x7c0
>    schedule+0x34/0x118
>    rpm_resume+0x14c/0x66c
>    rpm_resume+0x2a4/0x66c
>    rpm_resume+0x2a4/0x66c
>    rpm_resume+0x2a4/0x66c
>    __pm_runtime_resume+0x50/0x9c
>    __driver_probe_device+0x58/0x120
>    driver_probe_device+0x3c/0x154
>    __driver_attach_async_helper+0x4c/0xc0
>    async_run_entry_fn+0x34/0xe0
>    process_one_work+0x148/0x290
>    worker_thread+0x2c4/0x3e0
>    kthread+0x118/0x1c0
>    ret_from_fork+0x10/0x20
>
> The issue was reported on 12th of August and was ignored by author of
> commits introducing issue for two weeks.  Only after complaining author
> produced a fix which did not work, so if original commits cannot be
> reliably fixed for 5 weeks, they obviously are buggy and need to be
> dropped.
>
> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial dri=
ver")
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>



> ---
>
> Changes in v2:
> 1. Correct reference to cause (proper commit) in the commit msg.
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 176 +++-----------------------
>  1 file changed, 16 insertions(+), 160 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 0fdda3a1e70b..7c5befe5490d 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -14,7 +14,6 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -102,16 +101,10 @@
>  #define DMA_RX_BUF_SIZE		2048
> =20
>  static DEFINE_IDA(port_ida);
> -#define DOMAIN_IDX_POWER	0
> -#define DOMAIN_IDX_PERF		1
> =20
>  struct qcom_geni_device_data {
>  	bool console;
>  	enum geni_se_xfer_mode mode;
> -	struct dev_pm_domain_attach_data pd_data;
> -	int (*resources_init)(struct uart_port *uport);
> -	int (*set_rate)(struct uart_port *uport, unsigned int baud);
> -	int (*power_state)(struct uart_port *uport, bool state);
>  };
> =20
>  struct qcom_geni_private_data {
> @@ -149,7 +142,6 @@ struct qcom_geni_serial_port {
> =20
>  	struct qcom_geni_private_data private_data;
>  	const struct qcom_geni_device_data *dev_data;
> -	struct dev_pm_domain_list *pd_list;
>  };
> =20
>  static const struct uart_ops qcom_geni_console_pops;
> @@ -1301,42 +1293,6 @@ static int geni_serial_set_rate(struct uart_port *=
uport, unsigned int baud)
>  	return 0;
>  }
> =20
> -static int geni_serial_set_level(struct uart_port *uport, unsigned int b=
aud)
> -{
> -	struct qcom_geni_serial_port *port =3D to_dev_port(uport);
> -	struct device *perf_dev =3D port->pd_list->pd_devs[DOMAIN_IDX_PERF];
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
>  static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  					 struct ktermios *termios,
>  					 const struct ktermios *old)
> @@ -1355,7 +1311,7 @@ static void qcom_geni_serial_set_termios(struct uar=
t_port *uport,
>  	/* baud rate */
>  	baud =3D uart_get_baud_rate(uport, termios, old, 300, 8000000);
> =20
> -	ret =3D port->dev_data->set_rate(uport, baud);
> +	ret =3D geni_serial_set_rate(uport, baud);
>  	if (ret)
>  		return;
> =20
> @@ -1642,27 +1598,8 @@ static int geni_serial_resources_off(struct uart_p=
ort *uport)
>  	return 0;
>  }
> =20
> -static int geni_serial_resource_state(struct uart_port *uport, bool powe=
r_on)
> +static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
>  {
> -	return power_on ? geni_serial_resources_on(uport) : geni_serial_resourc=
es_off(uport);
> -}
> -
> -static int geni_serial_pwr_init(struct uart_port *uport)
> -{
> -	struct qcom_geni_serial_port *port =3D to_dev_port(uport);
> -	int ret;
> -
> -	ret =3D dev_pm_domain_attach_list(port->se.dev,
> -					&port->dev_data->pd_data, &port->pd_list);
> -	if (ret <=3D 0)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> -static int geni_serial_resource_init(struct uart_port *uport)
> -{
> -	struct qcom_geni_serial_port *port =3D to_dev_port(uport);
>  	int ret;
> =20
>  	port->se.clk =3D devm_clk_get(port->se.dev, "se");
> @@ -1707,10 +1644,10 @@ static void qcom_geni_serial_pm(struct uart_port =
*uport,
>  		old_state =3D UART_PM_STATE_OFF;
> =20
>  	if (new_state =3D=3D UART_PM_STATE_ON && old_state =3D=3D UART_PM_STATE=
_OFF)
> -		pm_runtime_resume_and_get(uport->dev);
> +		geni_serial_resources_on(uport);
>  	else if (new_state =3D=3D UART_PM_STATE_OFF &&
>  		 old_state =3D=3D UART_PM_STATE_ON)
> -		pm_runtime_put_sync(uport->dev);
> +		geni_serial_resources_off(uport);
> =20
>  }
> =20
> @@ -1813,16 +1750,13 @@ static int qcom_geni_serial_probe(struct platform=
_device *pdev)
>  	port->se.dev =3D &pdev->dev;
>  	port->se.wrapper =3D dev_get_drvdata(pdev->dev.parent);
> =20
> -	ret =3D port->dev_data->resources_init(uport);
> +	ret =3D geni_serial_resource_init(port);
>  	if (ret)
>  		return ret;
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		ret =3D -EINVAL;
> -		goto error;
> -	}
> -
> +	if (!res)
> +		return -EINVAL;
>  	uport->mapbase =3D res->start;
> =20
>  	uport->rs485_config =3D qcom_geni_rs485_config;
> @@ -1834,26 +1768,19 @@ static int qcom_geni_serial_probe(struct platform=
_device *pdev)
>  	if (!data->console) {
>  		port->rx_buf =3D devm_kzalloc(uport->dev,
>  					    DMA_RX_BUF_SIZE, GFP_KERNEL);
> -		if (!port->rx_buf) {
> -			ret =3D -ENOMEM;
> -			goto error;
> -		}
> +		if (!port->rx_buf)
> +			return -ENOMEM;
>  	}
> =20
>  	port->name =3D devm_kasprintf(uport->dev, GFP_KERNEL,
>  			"qcom_geni_serial_%s%d",
>  			uart_console(uport) ? "console" : "uart", uport->line);
> -	if (!port->name) {
> -		ret =3D -ENOMEM;
> -		goto error;
> -	}
> +	if (!port->name)
> +		return -ENOMEM;
> =20
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		ret =3D irq;
> -		goto error;
> -	}
> -
> +	if (irq < 0)
> +		return irq;
>  	uport->irq =3D irq;
>  	uport->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
> =20
> @@ -1875,18 +1802,16 @@ static int qcom_geni_serial_probe(struct platform=
_device *pdev)
>  			IRQF_TRIGGER_HIGH, port->name, uport);
>  	if (ret) {
>  		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> -		goto error;
> +		return ret;
>  	}
> =20
>  	ret =3D uart_get_rs485_mode(uport);
>  	if (ret)
>  		return ret;
> =20
> -	devm_pm_runtime_enable(port->se.dev);
> -
>  	ret =3D uart_add_one_port(drv, uport);
>  	if (ret)
> -		goto error;
> +		return ret;
> =20
>  	if (port->wakeup_irq > 0) {
>  		device_init_wakeup(&pdev->dev, true);
> @@ -1896,15 +1821,11 @@ static int qcom_geni_serial_probe(struct platform=
_device *pdev)
>  			device_init_wakeup(&pdev->dev, false);
>  			ida_free(&port_ida, uport->line);
>  			uart_remove_one_port(drv, uport);
> -			goto error;
> +			return ret;
>  		}
>  	}
> =20
>  	return 0;
> -
> -error:
> -	dev_pm_domain_detach_list(port->pd_list);
> -	return ret;
>  }
> =20
>  static void qcom_geni_serial_remove(struct platform_device *pdev)
> @@ -1917,31 +1838,6 @@ static void qcom_geni_serial_remove(struct platfor=
m_device *pdev)
>  	device_init_wakeup(&pdev->dev, false);
>  	ida_free(&port_ida, uport->line);
>  	uart_remove_one_port(drv, &port->uport);
> -	dev_pm_domain_detach_list(port->pd_list);
> -}
> -
> -static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device=
 *dev)
> -{
> -	struct qcom_geni_serial_port *port =3D dev_get_drvdata(dev);
> -	struct uart_port *uport =3D &port->uport;
> -	int ret =3D 0;
> -
> -	if (port->dev_data->power_state)
> -		ret =3D port->dev_data->power_state(uport, false);
> -
> -	return ret;
> -}
> -
> -static int __maybe_unused qcom_geni_serial_runtime_resume(struct device =
*dev)
> -{
> -	struct qcom_geni_serial_port *port =3D dev_get_drvdata(dev);
> -	struct uart_port *uport =3D &port->uport;
> -	int ret =3D 0;
> -
> -	if (port->dev_data->power_state)
> -		ret =3D port->dev_data->power_state(uport, true);
> -
> -	return ret;
>  }
> =20
>  static int qcom_geni_serial_suspend(struct device *dev)
> @@ -1979,46 +1875,14 @@ static int qcom_geni_serial_resume(struct device =
*dev)
>  static const struct qcom_geni_device_data qcom_geni_console_data =3D {
>  	.console =3D true,
>  	.mode =3D GENI_SE_FIFO,
> -	.resources_init =3D geni_serial_resource_init,
> -	.set_rate =3D geni_serial_set_rate,
> -	.power_state =3D geni_serial_resource_state,
>  };
> =20
>  static const struct qcom_geni_device_data qcom_geni_uart_data =3D {
>  	.console =3D false,
>  	.mode =3D GENI_SE_DMA,
> -	.resources_init =3D geni_serial_resource_init,
> -	.set_rate =3D geni_serial_set_rate,
> -	.power_state =3D geni_serial_resource_state,
> -};
> -
> -static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data=
 =3D {
> -	.console =3D true,
> -	.mode =3D GENI_SE_FIFO,
> -	.pd_data =3D {
> -		.pd_flags =3D PD_FLAG_DEV_LINK_ON,
> -		.pd_names =3D (const char*[]) { "power", "perf" },
> -		.num_pd_names =3D 2,
> -	},
> -	.resources_init =3D geni_serial_pwr_init,
> -	.set_rate =3D geni_serial_set_level,
> -};
> -
> -static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data =
=3D {
> -	.console =3D false,
> -	.mode =3D GENI_SE_DMA,
> -	.pd_data =3D {
> -		.pd_flags =3D PD_FLAG_DEV_LINK_ON,
> -		.pd_names =3D (const char*[]) { "power", "perf" },
> -		.num_pd_names =3D 2,
> -	},
> -	.resources_init =3D geni_serial_pwr_init,
> -	.set_rate =3D geni_serial_set_level,
>  };
> =20
>  static const struct dev_pm_ops qcom_geni_serial_pm_ops =3D {
> -	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> -			   qcom_geni_serial_runtime_resume, NULL)
>  	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>  };
> =20
> @@ -2027,18 +1891,10 @@ static const struct of_device_id qcom_geni_serial=
_match_table[] =3D {
>  		.compatible =3D "qcom,geni-debug-uart",
>  		.data =3D &qcom_geni_console_data,
>  	},
> -	{
> -		.compatible =3D "qcom,sa8255p-geni-debug-uart",
> -		.data =3D &sa8255p_qcom_geni_console_data,
> -	},
>  	{
>  		.compatible =3D "qcom,geni-uart",
>  		.data =3D &qcom_geni_uart_data,
>  	},
> -	{
> -		.compatible =3D "qcom,sa8255p-geni-uart",
> -		.data =3D &sa8255p_qcom_geni_uart_data,
> -	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);


