Return-Path: <linux-arm-msm+bounces-50252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04373A4EAC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 19:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53BCE42253E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5208E284B37;
	Tue,  4 Mar 2025 17:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVMooXPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837B259C8E;
	Tue,  4 Mar 2025 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110356; cv=none; b=OxLOtseK7W/y6Cl44mR+0RpvBzDSUwNVsXppCJfSwejKR3ppY43FQKnbspWCLF59e8toiJQyFsBpQy/AuMD5qd5ZTweGkwJuLJWJL8p5Bb+elJo0BV+4kJY+RUOjHfrpRHDKSAEau/l8bVlqRhTVCzSn0ceQ0EybQEiM5irU5q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110356; c=relaxed/simple;
	bh=dMmbRSw5Wygxzqtk7yBIvmykz+bSqg8Tu3586uZGrOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKF+hc0djwqCg1gCBiDBTLxu/HQrrrIUdKBdgCvUpWycxogo2UjLmCxg+bKhkRp5HoVO3qUPTbH7rvrl3onhutevdrxaIIbiWF4v9grJUgC3zrqiETs1vD5+M1bTcABqmqi7Gzi8hhYN2Chpj4CBFfE0ooW++pVAaM4TPPzqAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVMooXPe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78E5C4CEE5;
	Tue,  4 Mar 2025 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741110355;
	bh=dMmbRSw5Wygxzqtk7yBIvmykz+bSqg8Tu3586uZGrOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVMooXPefi4t97hpLHFZ9BqCzhlFsGejQJ8vuBGwLmnbj3WDSqs/hao5H4qxtIr5v
	 YQ+13QUGc6uyyK7BXaHQRUmtlFgJtUc75VY0hNt9f3vJ6ynhTPk787G7SnKGcL5+Lk
	 LR/9k4lGu0QXs798Pq+RsYCMmtN80BZWba33noIfbc2ls1FwWebU7r4ha8NMG24ZOb
	 kdQfMpaHzRVbF2u3JASSNHz1h8WuqCV8mPnogVjP1cuWcbccPgexA2fDEd7iJXPuCS
	 9JBKj1P9vFKfyEPnCevx/MXGCAvLFNLSPEAElatTnjPHdMSwHmZTmQcv8a/n8plNOF
	 8pSGwEgkfUCyg==
Date: Tue, 4 Mar 2025 11:45:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v1] serial: qcom-geni: Remove alias dependency from qcom
 serial driver
Message-ID: <tn6czifetdf2mg5gl3mhfpwcb6q7dkn5r4kgqln6evm4qdsjvi@ehpl3qj3axvw>
References: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>

On Tue, Mar 04, 2025 at 12:44:23PM +0530, Viken Dadhaniya wrote:
> Remove the dependency on aliases in the device tree configuration for the
> qcom serial driver. Currently, the absence of an alias results in an
> invalid line number, causing the driver probe to fail for geni serial.
> 
> To prevent probe failures, implement logic to dynamically assign line
> numbers if an alias is not present in the device tree for non-console
> ports.
> 

Please read and follow https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Start with your problem description, then a description of your proposed
solution.

> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index a80ce7aaf309..2457f39dfc84 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -98,6 +98,8 @@
>  
>  #define DMA_RX_BUF_SIZE		2048
>  
> +static DEFINE_IDR(port_idr);

You're just looking for a index allocator, so DEFINE_IDA() is probably
what you want to use.


That said, theoretically I think we could get 24 GENI serial instances
in a system. Making this a huge waste of memory and CPU cycles.

An empty idr takes 88 bytes, if you then allocate 1 entry it grows with
at least one xa_array node which is 576 bytes.

> +
>  struct qcom_geni_device_data {
>  	bool console;
>  	enum geni_se_xfer_mode mode;
> @@ -253,10 +255,25 @@ static struct qcom_geni_serial_port *get_port_from_line(int line, bool console)
>  	struct qcom_geni_serial_port *port;
>  	int nr_ports = console ? GENI_UART_CONS_PORTS : GENI_UART_PORTS;
>  
> -	if (line < 0 || line >= nr_ports)
> -		return ERR_PTR(-ENXIO);
> +	if (console) {
> +		if (line < 0 || line >= nr_ports)
> +			return ERR_PTR(-ENXIO);
> +
> +		port = &qcom_geni_console_port;
> +	} else {
> +		int max_alias_num = of_alias_get_highest_id("serial");
> +
> +		if (line < 0 || line >= nr_ports)
> +			line = idr_alloc(&port_idr, (void *)port, max_alias_num + 1, nr_ports,
> +					 GFP_KERNEL);
> +		else
> +			line = idr_alloc(&port_idr, (void *)port, line, nr_ports, GFP_KERNEL);
> +
> +		if (line < 0)
> +			return ERR_PTR(-ENXIO);
>  
> -	port = console ? &qcom_geni_console_port : &qcom_geni_uart_ports[line];
> +		port = &qcom_geni_uart_ports[line];

Plus qcom_geni_uart_ports[] is GENI_UART_PORTS long. So you will
actually only have a maximum of 3 ports.


I like the change, but please replace port_idr with a u32 and use
linux/bitmap.h to implement the port allocation scheme.

Regards,
Bjorn

> +	}
>  	return port;
>  }
>  
> @@ -1761,6 +1778,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  						port->wakeup_irq);
>  		if (ret) {
>  			device_init_wakeup(&pdev->dev, false);
> +			idr_remove(&port_idr, uport->line);
>  			uart_remove_one_port(drv, uport);
>  			return ret;
>  		}
> @@ -1772,10 +1790,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  static void qcom_geni_serial_remove(struct platform_device *pdev)
>  {
>  	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
> +	struct uart_port *uport = &port->uport;
>  	struct uart_driver *drv = port->private_data.drv;
>  
>  	dev_pm_clear_wake_irq(&pdev->dev);
>  	device_init_wakeup(&pdev->dev, false);
> +	idr_remove(&port_idr, uport->line);
>  	uart_remove_one_port(drv, &port->uport);
>  }
>  
> -- 
> 2.34.1
> 
> 

