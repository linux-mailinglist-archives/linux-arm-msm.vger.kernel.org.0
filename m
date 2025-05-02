Return-Path: <linux-arm-msm+bounces-56466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C7AA6E0A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 11:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6081C7AD94C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 09:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE19201033;
	Fri,  2 May 2025 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxbfJ/63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2921B229B2E
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177889; cv=none; b=ue/0yPypWMyPZB8bLFSZUlNI3MnUWT6yrcU4EkcZdVBQIlmdphMax4C6tjOroKaeIIclCuZPhm7H2c9yyNcFdj5zJqG3FawQmiNeHxgLFMYgX/8Kg2mmgrEYKCEALDwo4OcI8xz/0h1zplzZZ0aROkWp+ofnLXsi5lhALcTq3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177889; c=relaxed/simple;
	bh=girCR832i3VqI4TrWisqlVnPCO94U7GVFtP3RF/fjOg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jlt/rpVPvLBaYG6gqsQbW9CHqRlJd4FLbAQcSORV+pFbcGti8HawVsnQtebRnfImGqgGlK2IP16fBHCk7UmoR532C+U5bYY9iUJv8SUgVashAq+Rcp6EoDbhDtCzX6jp9hfoeqnrj9WbbpuAEdDCl2PMWwQ35eM5IGNdQ0GRmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxbfJ/63; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0618746bso10908275e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746177884; x=1746782684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQp/QEUsu8zl6paOkwfjHMN7jFZiXU+No55367DtrjQ=;
        b=JxbfJ/637XtWJA6GpL1lWIECC7g6ojZcCIuhku0BFys4LDOe8fnQ1RATWGIqFMHIKW
         q+WtGVP6nXdFtGsUo4P0ZsUb0AuJy+S+UINZd4QfriBtY2TlWEo3gIk/1VwfbF/wy7N+
         BvEWI4m8xSKD3WNzFyfj/B78ODOOFQky4JFGP+J9ge5q2Yaebs+8Rn26/ej4QYW0hKxW
         GY09bRn/cy8V7g7HSMqM9+XdqMX9Pg/x7NpoIT+RJlYJ6F6tH3lFXSvaHivLqWXeFhyk
         P0kkJ4+SwQQkY3zrw0X0rSRxeizeG6mO4Lw1y4HDthYrr+iHnmx2skoFOnvYNx/eYtTZ
         28ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177884; x=1746782684;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mQp/QEUsu8zl6paOkwfjHMN7jFZiXU+No55367DtrjQ=;
        b=ZyfuBEqAL4z7mfoUhCXSA1w/sTmqLzgJMa57m7A2emBCZuoZu6nDkP44AVju+nEpB8
         apVJwRd6NErXB3rh6GovJTA5EKZw2tnZrP53TJJWm0Gh7ouas5gI7M0/OiyqYaNwSjKq
         SElHDEetbARkdcQIMfSGli7aUe/P36m2C77xdkdtvyggbciw4YW253YaY2wZv32nBe6x
         Gr7e/SzOs2knpK3qfnGf/XtbUFKzbSypEU1XYSR0x25jHEoOMvok5/uZZJSYsS0Vcb/H
         xZLRFYw4EL7nuQ1F/+DHlSWdeY1+3JfFwNRTHNyZMGTTgtMmhUQ1QgEy6jSqCyOSM26+
         BLDg==
X-Forwarded-Encrypted: i=1; AJvYcCV457fK2TkmJ95sCqmkVwDYVcn+mqQL54njAtuWRfS/JJLHJk546ooRI3M2xXuANEj8R5ZFh9MlNPaaihoO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4fwL2Ba4zhZIO4GyetWX7E9Q6b939qeUgkmPUBTpubzkBfUNf
	yggSjGkhwdqekIE+sRdR1tw7+1y6DYLp8PgvL8YPMpd3IJeF/SGqD86stDO6oPg=
X-Gm-Gg: ASbGncvlZBBpDmkIQPfjLheF19tR9TlYBIrUAhoiBFhr6CkrD9dlVD/QlykF3bG1Zhx
	g5a/lqyI3/5cduIhpbDdCSrQcw0udaNQs+s4qyTN4mE4anM7sgLqwGzXDbzhLJ0QNKWkewwXBiR
	FzhnFq3Nat9BryqdMt5MyiU67i4DCgg+aCCSXGVM+P8vMI56SffwKaXjE2iGUxZtMzF1y4p/g3P
	jmcDpeesrcMsC3M80w1ALU7U5gu8+PDJWz1Hl8uuWeGaDMpNfN6X6lPfHl6Wpiwh3QcIHYxzVWp
	FrPbR8zpNttD2WX35xX/cyqm+gRRDpTdxo67UitA/j0UD7vOvegimJXvmklg53e/UKubFQkiwFK
	Nyf01NK4dAqmHgR1Wag==
X-Google-Smtp-Source: AGHT+IF0RHm7eK8a8pTNdQCeWi4C3StVViogUTshQRuYXPjYI7q3A68CsbQtf6xL5MhXQ3hBSkJp/w==
X-Received: by 2002:a05:6000:250c:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-3a099af1e87mr1536113f8f.55.1746177884297;
        Fri, 02 May 2025 02:24:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:161e:57b7:439b:f09f? ([2a01:e0a:3d9:2080:161e:57b7:439b:f09f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm1580008f8f.44.2025.05.02.02.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 02:24:43 -0700 (PDT)
Message-ID: <aef73cdc-d855-4f17-bd76-289b6e26cc14@linaro.org>
Date: Fri, 2 May 2025 11:24:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 9/9] serial: qcom-geni: Enable Serial on SA8255p
 Qualcomm platforms
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250502031018.1292-1-quic_ptalari@quicinc.com>
 <20250502031018.1292-10-quic_ptalari@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250502031018.1292-10-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 05:10, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages UART baud rates, with each baud
> rate represented by a performance level. The driver uses the
> dev_pm_opp_set_level() API to request the desired baud rate by
> specifying the performance level.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 150 +++++++++++++++++++++++---
>   1 file changed, 135 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 9d698c354510..51036d5c8ea1 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -11,6 +11,7 @@
>   #include <linux/irq.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -99,10 +100,16 @@
>   #define DMA_RX_BUF_SIZE		2048
>   
>   static DEFINE_IDA(port_ida);
> +#define DOMAIN_IDX_POWER	0
> +#define DOMAIN_IDX_PERF		1
>   
>   struct qcom_geni_device_data {
>   	bool console;
>   	enum geni_se_xfer_mode mode;
> +	struct dev_pm_domain_attach_data pd_data;
> +	int (*geni_serial_pwr_rsc_init)(struct uart_port *uport);
> +	int (*geni_serial_set_rate)(struct uart_port *uport, unsigned long clk_freq);
> +	int (*geni_serial_switch_power_state)(struct uart_port *uport, bool state);

The geni_serial_ is not needed here, so not need to use "pwr", just use the
original names:
resources_init
set_rate
power_state

Neil

>   };
>   
>   struct qcom_geni_private_data {
> @@ -140,6 +147,7 @@ struct qcom_geni_serial_port {
>   
>   	struct qcom_geni_private_data private_data;
>   	const struct qcom_geni_device_data *dev_data;
> +	struct dev_pm_domain_list *pd_list;
>   };
>   
>   static const struct uart_ops qcom_geni_console_pops;
> @@ -1331,6 +1339,42 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned long baud)
>   	return 0;
>   }
>   
> +static int geni_serial_set_level(struct uart_port *uport, unsigned long baud)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	struct device *perf_dev = port->pd_list->pd_devs[DOMAIN_IDX_PERF];
> +
> +	/*
> +	 * The performance protocol sets UART communication
> +	 * speeds by selecting different performance levels
> +	 * through the OPP framework.
> +	 *
> +	 * Supported perf levels for baudrates in firmware are below
> +	 * +---------------------+--------------------+
> +	 * |  Perf level value   |  Baudrate values   |
> +	 * +---------------------+--------------------+
> +	 * |      300            |      300           |
> +	 * |      1200           |      1200          |
> +	 * |      2400           |      2400          |
> +	 * |      4800           |      4800          |
> +	 * |      9600           |      9600          |
> +	 * |      19200          |      19200         |
> +	 * |      38400          |      38400         |
> +	 * |      57600          |      57600         |
> +	 * |      115200         |      115200        |
> +	 * |      230400         |      230400        |
> +	 * |      460800         |      460800        |
> +	 * |      921600         |      921600        |
> +	 * |      2000000        |      2000000       |
> +	 * |      3000000        |      3000000       |
> +	 * |      3200000        |      3200000       |
> +	 * |      4000000        |      4000000       |
> +	 * +---------------------+--------------------+
> +	 */
> +
> +	return dev_pm_opp_set_level(perf_dev, baud);
> +}
> +
>   static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   					 struct ktermios *termios,
>   					 const struct ktermios *old)
> @@ -1349,7 +1393,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   	/* baud rate */
>   	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
>   
> -	ret = geni_serial_set_rate(uport, baud);
> +	ret = port->dev_data->geni_serial_set_rate(uport, baud);
>   	if (ret) {
>   		dev_err(port->se.dev,
>   			"%s: Failed to set baud:%u ret:%d\n",
> @@ -1640,8 +1684,27 @@ static int geni_serial_resources_on(struct uart_port *uport)
>   	return 0;
>   }
>   
> -static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
> +static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
>   {
> +	return power_on ? geni_serial_resources_on(uport) : geni_serial_resources_off(uport);
> +}
> +
> +static int geni_serial_pwr_init(struct uart_port *uport)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	int ret;
> +
> +	ret = dev_pm_domain_attach_list(port->se.dev,
> +					&port->dev_data->pd_data, &port->pd_list);
> +	if (ret <= 0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int geni_serial_resource_init(struct uart_port *uport)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
>   	int ret;
>   
>   	port->se.clk = devm_clk_get(port->se.dev, "se");
> @@ -1680,7 +1743,6 @@ static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
>   static void qcom_geni_serial_pm(struct uart_port *uport,
>   		unsigned int new_state, unsigned int old_state)
>   {
> -
>   	/* If we've never been called, treat it as off */
>   	if (old_state == UART_PM_STATE_UNDEFINED)
>   		old_state = UART_PM_STATE_OFF;
> @@ -1774,13 +1836,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   	port->se.dev = &pdev->dev;
>   	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>   
> -	ret = geni_serial_resource_init(port);
> +	ret = port->dev_data->geni_serial_pwr_rsc_init(uport);
>   	if (ret)
>   		return ret;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -EINVAL;
> +	if (!res) {
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
>   	uport->mapbase = res->start;
>   
>   	port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
> @@ -1790,19 +1855,26 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   	if (!data->console) {
>   		port->rx_buf = devm_kzalloc(uport->dev,
>   					    DMA_RX_BUF_SIZE, GFP_KERNEL);
> -		if (!port->rx_buf)
> -			return -ENOMEM;
> +		if (!port->rx_buf) {
> +			ret = -ENOMEM;
> +			goto error;
> +		}
>   	}
>   
>   	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
>   			"qcom_geni_serial_%s%d",
>   			uart_console(uport) ? "console" : "uart", uport->line);
> -	if (!port->name)
> -		return -ENOMEM;
> +	if (!port->name) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> +	if (irq < 0) {
> +		ret = irq;
> +		goto error;
> +	}
> +
>   	uport->irq = irq;
>   	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
>   
> @@ -1824,7 +1896,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   			IRQF_TRIGGER_HIGH, port->name, uport);
>   	if (ret) {
>   		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> -		return ret;
> +		goto error;
>   	}
>   
>   	pm_runtime_enable(port->se.dev);
> @@ -1849,6 +1921,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   
>   error:
>   	pm_runtime_disable(port->se.dev);
> +	dev_pm_domain_detach_list(port->pd_list);
>   	return ret;
>   }
>   
> @@ -1863,22 +1936,31 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>   	ida_free(&port_ida, uport->line);
>   	pm_runtime_disable(port->se.dev);
>   	uart_remove_one_port(drv, &port->uport);
> +	dev_pm_domain_detach_list(port->pd_list);
>   }
>   
>   static int qcom_geni_serial_runtime_suspend(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>   	struct uart_port *uport = &port->uport;
> +	int ret = 0;
>   
> -	return geni_serial_resources_off(uport);
> +	if (port->dev_data->geni_serial_switch_power_state)
> +		ret = port->dev_data->geni_serial_switch_power_state(uport, false);
> +
> +	return ret;
>   };
>   
>   static int qcom_geni_serial_runtime_resume(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>   	struct uart_port *uport = &port->uport;
> +	int ret = 0;
> +
> +	if (port->dev_data->geni_serial_switch_power_state)
> +		ret = port->dev_data->geni_serial_switch_power_state(uport, true);
>   
> -	return geni_serial_resources_on(uport);
> +	return ret;
>   };
>   
>   static int qcom_geni_serial_suspend(struct device *dev)
> @@ -1916,11 +1998,41 @@ static int qcom_geni_serial_resume(struct device *dev)
>   static const struct qcom_geni_device_data qcom_geni_console_data = {
>   	.console = true,
>   	.mode = GENI_SE_FIFO,
> +	.geni_serial_pwr_rsc_init = geni_serial_resource_init,
> +	.geni_serial_set_rate = geni_serial_set_rate,
> +	.geni_serial_switch_power_state = geni_serial_resource_state,
>   };
>   
>   static const struct qcom_geni_device_data qcom_geni_uart_data = {
>   	.console = false,
>   	.mode = GENI_SE_DMA,
> +	.geni_serial_pwr_rsc_init = geni_serial_resource_init,
> +	.geni_serial_set_rate = geni_serial_set_rate,
> +	.geni_serial_switch_power_state = geni_serial_resource_state,
> +};
> +
> +static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
> +	.console = true,
> +	.mode = GENI_SE_FIFO,
> +	.pd_data = {
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +		.pd_names = (const char*[]) { "power", "perf" },
> +		.num_pd_names = 2,
> +	},
> +	.geni_serial_pwr_rsc_init = geni_serial_pwr_init,
> +	.geni_serial_set_rate = geni_serial_set_level,
> +};
> +
> +static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
> +	.console = false,
> +	.mode = GENI_SE_DMA,
> +	.pd_data = {
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +		.pd_names = (const char*[]) { "power", "perf" },
> +		.num_pd_names = 2,
> +	},
> +	.geni_serial_pwr_rsc_init = geni_serial_pwr_init,
> +	.geni_serial_set_rate = geni_serial_set_level,
>   };
>   
>   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> @@ -1934,10 +2046,18 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
>   		.compatible = "qcom,geni-debug-uart",
>   		.data = &qcom_geni_console_data,
>   	},
> +	{
> +		.compatible = "qcom,sa8255p-geni-debug-uart",
> +		.data = &sa8255p_qcom_geni_console_data,
> +	},
>   	{
>   		.compatible = "qcom,geni-uart",
>   		.data = &qcom_geni_uart_data,
>   	},
> +	{
> +		.compatible = "qcom,sa8255p-geni-uart",
> +		.data = &sa8255p_qcom_geni_uart_data,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);


