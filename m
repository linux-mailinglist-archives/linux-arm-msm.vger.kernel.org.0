Return-Path: <linux-arm-msm+bounces-60156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7496ACC962
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 16:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14F48188321D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403FA238C26;
	Tue,  3 Jun 2025 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvHsuaLA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941717A2EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961776; cv=none; b=To7YRze34KP5VeTlKeYi3UjgKIlnaQC587YShEolT2pDgLbIhdObX9KzkcKdFxIP1+6UDkNZ9HwgwX5ygghgsk0O2/za1uDBAea8vYGGYP4t6WWopUIzG5b4TzmqTwWZInoY9rL+wQhn7G96khmdQoJLwwi/47kydcSn+lJMG9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961776; c=relaxed/simple;
	bh=c6nw/zKVb6cTi4ZCZBsAqQI9vCilD0W6s2t/c/WVVKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HUJbEIT6WcV8X4Cwm0flTBhbPCXQIJF+/tJaXt3Ijw41RH7wlgJJ9CV+PKGfWwKMoc0OHIe9EdzTtubVe380/7VmV1biNhnfQ4c4JjsXzuKyJsasYayquwQt9KOhoYLJTcUH2z5Soxv8utcG6eqwBEbv0VfmNqi9UZpMMl079K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvHsuaLA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so63241745e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748961772; x=1749566572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSY3d2fHzmf8tz11ZszZbv0h9m7v/xD0XmSTgwQsEm4=;
        b=xvHsuaLA370R+WgcpekeFiFWTYTc68B1BXMPL23nSJpWkOJY7Kh7V6bmGefCeGtOjF
         O4aJt9hJh9S1rm4QqyV3q23RnjLvkYlWdZMr/UMrJrRFRmpAzst4oIDYfWKT70ZWDkss
         IZ42Cjo77UMMMhyW1+3lkSFKvYJJl++FMpi8nMmUg9JdjsjAw3lPj2T0iKWF9MIT8OTP
         12Fc/wpnzLhw6uaQz8T2RNFQXUyCUTK5mUvKxKE0gb+dzw4jFd9hduTeEo88BmnCc5Uy
         zBj9I/sbxO1opomDqQh5nd3Bbi1f+iMSHJm2JEfhMyytZDPwZfRbdZZM9tPeQjxbamFQ
         +l4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961772; x=1749566572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSY3d2fHzmf8tz11ZszZbv0h9m7v/xD0XmSTgwQsEm4=;
        b=lBXqDZEYUZo0rBQxX8SRZHahk5OyFOrLvcQjPnNZjYhv5SQw4aXv31OWGvtz4H15ha
         aXjRdt5A3tJRRjBxU8zWckZH60WBmyDa3siZ53HQMtC10Xye0Jh1ZaJGrB121NzXG2f4
         FUUCgriCi3gmFG34Qak5D554k6OzqQNXguZpLTpiBEAq9b13THLPYvWQsB4MOhVh8ZCy
         BvHX/Bag9GWzoVoRAPMZYcikrntqFHOzBGA1cpLBSvEHXjhHuZfHEzPVwWPmwr2vD4Zw
         qKenmwkhypJXXkaZrz02pMchEhEXCKkCcmv0XMehpV4SUHSBbc7vMSLet1VgzlrQB7BD
         ewtg==
X-Forwarded-Encrypted: i=1; AJvYcCUebQY3asKerlp/yaJw0qZPztb6dPbgmlqSXos9kHgoBsdOscTimL61Z5wdstFt01r0khSx8HMnnsvEwrGB@vger.kernel.org
X-Gm-Message-State: AOJu0YzQzf9+QP4jVdguU6IZ35Z/krmjFNvaRjxHsP9gdf1MjTj8heVB
	ohqSm90XZs380CHagijs02tNh7eebu3/uZzRILiBS+fpGJhRW6/Fog3L9Vl+AUw08W4=
X-Gm-Gg: ASbGncsxddCzzsTC0BhoMrn977bW3s5zZNV2OvSwxp4wZHn1fiaeGILesy43FxTEAHv
	FUyFMxyw1AI/xlgqMMp69Bo0sjeK0aGYCG4451OzhgTPdd4zZypLWKqSO0so6+1nxJsj3CI0lA8
	UJbRKh6s0nJ4ClOpXZQdlXHEchspOd0pr5qnd1pXum6oFjQOOogcFlqs7fj3ZXcyIP6NJIW/sUF
	DCRBjhZuOYDTCGObyeBre01zte8iXt/NT+EGI9S7XiUBg6/jXsrjnrxQniU4jFz+IHJ2zNcl+zz
	rjKbDoFs+rGuvcgkL/c+gKwLpQMhMK2Y3n31IhrxD6bUqb18xrp5XvndF1XOJ80jqF1/Jpuk3LS
	m+v0gFy39xY/+204guqWM4lG9c4A=
X-Google-Smtp-Source: AGHT+IEEsISNcafiB1EJ54Q5v26DBzVAy/duUN9sRABDJbDKKNVPalBCusb2bVQQUvJeorr1xZ/fZw==
X-Received: by 2002:a05:600c:4f05:b0:450:d611:eb95 with SMTP id 5b1f17b1804b1-4511ee150c2mr138571685e9.17.1748961772547;
        Tue, 03 Jun 2025 07:42:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm165701595e9.1.2025.06.03.07.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:42:52 -0700 (PDT)
Message-ID: <b5958e94-7d83-4d87-b5cc-15e40e15eba9@linaro.org>
Date: Tue, 3 Jun 2025 15:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <al7FOrwGsnaq9zGSHVjKj4mANrXQj5ID0LM34V0zaIeaSjIvNVhM7_OnjxWfPCKMnNZow76kfyuMEB_bOEkR0g==@protonmail.internalid>
 <20250506180232.1299-8-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250506180232.1299-8-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 19:02, Praveen Talari wrote:
> Add Power Management (PM) runtime support to Qualcomm GENI
> serial driver.
> 
> Introduce necessary callbacks and updates to ensure seamless
> transitions between power states, enhancing overall power
> efficiency.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
>   1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 60afee3884a6..9d698c354510 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>   		old_state = UART_PM_STATE_OFF;
> 
>   	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> -		geni_serial_resources_on(uport);
> +		pm_runtime_resume_and_get(uport->dev);
>   	else if (new_state == UART_PM_STATE_OFF &&
>   			old_state == UART_PM_STATE_ON)
> -		geni_serial_resources_off(uport);
> +		pm_runtime_put_sync(uport->dev);
> 
>   }
> 
> @@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   		return ret;
>   	}
> 
> +	pm_runtime_enable(port->se.dev);
> +
>   	ret = uart_add_one_port(drv, uport);
>   	if (ret)
> -		return ret;
> +		goto error;
> 
>   	if (port->wakeup_irq > 0) {
>   		device_init_wakeup(&pdev->dev, true);
> @@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   			device_init_wakeup(&pdev->dev, false);
>   			ida_free(&port_ida, uport->line);
>   			uart_remove_one_port(drv, uport);
> -			return ret;
> +			goto error;
>   		}
>   	}
> 
>   	return 0;
> +
> +error:
> +	pm_runtime_disable(port->se.dev);
> +	return ret;
>   }
> 
>   static void qcom_geni_serial_remove(struct platform_device *pdev)
> @@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>   	dev_pm_clear_wake_irq(&pdev->dev);
>   	device_init_wakeup(&pdev->dev, false);
>   	ida_free(&port_ida, uport->line);
> +	pm_runtime_disable(port->se.dev);
>   	uart_remove_one_port(drv, &port->uport);
>   }
> 
> +static int qcom_geni_serial_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	struct uart_port *uport = &port->uport;
> +
> +	return geni_serial_resources_off(uport);
> +};
> +
> +static int qcom_geni_serial_runtime_resume(struct device *dev)
> +{
> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	struct uart_port *uport = &port->uport;
> +
> +	return geni_serial_resources_on(uport);
> +};
> +
>   static int qcom_geni_serial_suspend(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> @@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
>   };
> 
>   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> +			   qcom_geni_serial_runtime_resume, NULL)
>   	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>   };
> 
> --
> 2.17.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

