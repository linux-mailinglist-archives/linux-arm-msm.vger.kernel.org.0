Return-Path: <linux-arm-msm+bounces-74009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C678DB82A05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6EE3BEE2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 02:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13599239581;
	Thu, 18 Sep 2025 02:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYLRXOwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D765F22E406;
	Thu, 18 Sep 2025 02:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758161699; cv=none; b=rzUGKoexy5UsKToTg3QxTYqetX1PfTgd5Zjq28SW/oQSqzVSBOVNnuLVhvplu5t2MfBxOfpeOMMY9LqdDhT6alXl25qrK5EDhvxcggs/wl8mp81LWJRcsRU0F68gvwPqsRvh/omR2ddJEN1I0u3la1+IbiePVS4zUg4aOU1bZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758161699; c=relaxed/simple;
	bh=1ybd4XEKi/VKbKDyYLMn6+zqL9nuzg3O5Qs+oqC9ohM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oe+rfX+evS9VorC0OzbeiHbfNgzFIWjNimESFLhLw+PuDNxB3BGq/yp9jC16KZmvfIY30wNp6nRXy7E+wexOHljCQPmh3P4bk0bUet5sQw68/8H6L2jXvssZxCphk24xaw+97xPIKSqPr6N5vdubeEXDb1YqoVoWlMkMAsL/3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYLRXOwZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DDCC4CEE7;
	Thu, 18 Sep 2025 02:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758161698;
	bh=1ybd4XEKi/VKbKDyYLMn6+zqL9nuzg3O5Qs+oqC9ohM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYLRXOwZwiv3PBa5Wo+xMaFSMj4jOJXIlmZLVggdqV6deSOQO7n2eZIz5uk3MrMNB
	 f7b1oiIHxhldYqE2gJT3iqUKrRkjL6qFjnwLMqbPm3hfjL1igWIu+LFzT9oFVRwq2i
	 Mo3rgHXJEJo21SzFHvMp6Zk49Jd8lIkrVT9G2QcuPIVlvIxTLszDqgy8tq0IpWQ9ok
	 g17OD5jDLuBkfbs6DhNv9c44U1FPb2HIGq5k6e/ns9SmLMjJLyf+F/E4Myxh0wMbhJ
	 3+F0bJE+OENHh3Y40JzuDWVxtBiqWl84RKSrw3tXg4Ol61jpsF4J4kV6nTy7yyh1pO
	 gtyz73+vmhLLw==
Date: Wed, 17 Sep 2025 21:14:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Praveen Talari <quic_ptalari@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, alexey.klimov@linaro.org, krzk@kernel.org, 
	jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v2] serial: qcom_geni: Fix pinctrl deadlock on runtime
 resume
Message-ID: <7sxsfyu2kqbycyfftwfhrncwk3dfnubmzhyi2rqi3jtvi5qsnh@bya3cii45zhn>
References: <20250917185102.3763398-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917185102.3763398-1-praveen.talari@oss.qualcomm.com>

On Thu, Sep 18, 2025 at 12:21:02AM +0530, Praveen Talari wrote:
> A stall was observed in disable_irq() during
> pinctrl_pm_select_default_state(), triggered by wakeup IRQ being active
> while the UART port was not yet active. This led to a hang in
> __synchronize_irq(), as shown in the following trace:

Are you saying that the handle_threaded_wake_irq() in your callstack is
the handler for @irq and then in pinctrl_pm_select_default_state() the
code tries to disable that same @irq?

> 
> Call trace:
>     __switch_to+0xe0/0x120
>     __schedule+0x39c/0x978
>     schedule+0x5c/0xf8
>     __synchronize_irq+0x88/0xb4
>     disable_irq+0x3c/0x4c
>     msm_pinmux_set_mux+0x508/0x644
>     pinmux_enable_setting+0x190/0x2dc
>     pinctrl_commit_state+0x13c/0x208
>     pinctrl_pm_select_default_state+0x4c/0xa4
>     geni_se_resources_on+0xe8/0x154
>     qcom_geni_serial_runtime_resume+0x4c/0x88
>     pm_generic_runtime_resume+0x2c/0x44
>     __genpd_runtime_resume+0x30/0x80
>     genpd_runtime_resume+0x114/0x29c
>     __rpm_callback+0x48/0x1d8
>     rpm_callback+0x6c/0x78
>     rpm_resume+0x530/0x750
>     __pm_runtime_resume+0x50/0x94
>     handle_threaded_wake_irq+0x30/0x94
>     irq_thread_fn+0x2c/0xa8
>     irq_thread+0x160/0x248
>     kthread+0x110/0x114
>     ret_from_fork+0x10/0x20
> 
> To fix this, wakeup IRQ setup is moved from probe to UART startup,
> ensuring it is only configured when the port is active. Correspondingly,
> the wakeup IRQ is cleared during shutdown.

The wakeup_irq is the GPIO pin, and the reason why we do this dance of
muxing in the GPIO during suspend is so that we can get woken up when
the system is powered down.

Doesn't what you describe here disable that mechanism?

In fact, while the UART is up and running, we don't need wakeup
interrupts enabled, because the pin is muxed to the QUP.

> This avoids premature IRQ
> disable during pinctrl setup and prevents the observed stall.

The scheme of pinmuxing a pad to GPIO function, in order to allow
powering down the IP block and still be woken up is an important
feature, so are we certain that this should be fixed on this side?

The purpose of the disable_irq() in msm_pinmux_set_mux() is to
reconfigure TLMM (and PDC presumably) to not give us interrupts while
we've muxed the pin to a non-GPIO function. But why does that need to be
synchronized? It seems worst case there's a parallel thread (or this
thread) handling the interrupt right now and then there won't be any
more.

I.e. isn't the solution to this problem to change disable_irq() in
msm_pinmux_set_mux() to disable_irq_no_sync()?

Regards,
Bjorn

> The probe
> and remove pathsare simplified by removing redundant wakeup IRQ handling.
> 
> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
> Tested-by: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1 -> v2:
> - remove changes from runtime resume/suspend.
> - updated commit text based on changes.
> - added new a change w.r.t wakeup IRQ setup.
> - verified on RB1 (qrb2210-rb1-core-kit).
> ---
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 0fdda3a1e70b..9c1bd4e5852c 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1160,6 +1160,7 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
>  
>  static void qcom_geni_serial_shutdown(struct uart_port *uport)
>  {
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
>  	disable_irq(uport->irq);
>  
>  	uart_port_lock_irq(uport);
> @@ -1168,6 +1169,8 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
>  
>  	qcom_geni_serial_cancel_tx_cmd(uport);
>  	uart_port_unlock_irq(uport);
> +	if (port->wakeup_irq > 0)
> +		dev_pm_clear_wake_irq(uport->dev);
>  }
>  
>  static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
> @@ -1236,6 +1239,13 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
>  			return ret;
>  	}
>  
> +	if (port->wakeup_irq > 0) {
> +		ret = dev_pm_set_dedicated_wake_irq(uport->dev,
> +						    port->wakeup_irq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	uart_port_lock_irq(uport);
>  	qcom_geni_serial_start_rx(uport);
>  	uart_port_unlock_irq(uport);
> @@ -1888,17 +1898,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto error;
>  
> -	if (port->wakeup_irq > 0) {
> +	if (port->wakeup_irq > 0)
>  		device_init_wakeup(&pdev->dev, true);
> -		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
> -						port->wakeup_irq);
> -		if (ret) {
> -			device_init_wakeup(&pdev->dev, false);
> -			ida_free(&port_ida, uport->line);
> -			uart_remove_one_port(drv, uport);
> -			goto error;
> -		}
> -	}
>  
>  	return 0;
>  
> @@ -1913,7 +1914,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>  	struct uart_port *uport = &port->uport;
>  	struct uart_driver *drv = port->private_data.drv;
>  
> -	dev_pm_clear_wake_irq(&pdev->dev);
>  	device_init_wakeup(&pdev->dev, false);
>  	ida_free(&port_ida, uport->line);
>  	uart_remove_one_port(drv, &port->uport);
> 
> base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
> -- 
> 2.34.1
> 

