Return-Path: <linux-arm-msm+bounces-61615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 376ADADD3CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 18:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21E021645A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 15:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D692EF29A;
	Tue, 17 Jun 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJnjQyZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D92EE60C;
	Tue, 17 Jun 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175638; cv=none; b=Wua6ofzH2ItXrnB5h5eYAxlNlOiZ7YI2o1Ssqo5SYBxJkRTo54zi2zN0rEIIFqj3yS1OQXzVyrhc/Go/sVIwNMtlcMkJELUvoFrHXLA2dg8dOrzJtzgPQKIMdwsABZKU5inn8LErA5Ox1uEQS1VNQblYoFSFGlO8RNpNEwKBsII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175638; c=relaxed/simple;
	bh=Xmi1segpA11UP+V+o5ts0ddLZv32iD3xxVOdV/BoX0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJ9k2GMKUfdwBNqxj/AV3GCgWG4LUZ3OC0IOjTXN2qHGYzoDy0SPhySE2bZFpt61S4JGyif4S/dNgOHv3NzGu3lM2wer+C0zaeD2nHAI0HorgrlGHnr2lpOt8g+TNlB5ueNuC/prnorvxHFEehJEEsrRkJOqyfYi2cSwrgImw+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJnjQyZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2CCC4CEE3;
	Tue, 17 Jun 2025 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750175637;
	bh=Xmi1segpA11UP+V+o5ts0ddLZv32iD3xxVOdV/BoX0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJnjQyZs2WukgTIGrOZ4NLTHG4aQxtoWKt+MijZ79h2DNRRGnnK40lZLezVngpq9x
	 xjXq9icUhycIdkZp9Aouq6wkzVoRcvPO6CBuNlrnYWcldqYEGoBtv1WqUnyqP3ojrD
	 MOTD6sw+tMAjkCI2RLOE/O3G+lahwO6HJCwRZgeBZt/15w7goIiUgj1HOeauKt/atF
	 BEYBWLp9fyPgxHajrXkAOPePV1oLXV7MgIrEnny+LSDvntDjc3ilNaOdVCsdCg8YbM
	 UUx/PFfJuqM5x2fc/LKuum1o8V8Kz0yyoAvmrfT8jxbqVV+Ngu1N3Wkloqx48Qq8Y0
	 HAWJHSVg12lYw==
Date: Tue, 17 Jun 2025 10:53:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v6 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
Message-ID: <d6cr4elhrbh27lmlcv5xzuel75uvsgi7klxjkevm7vg4jcbawe@5ojgetrxkag5>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-8-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606172114.6618-8-quic_ptalari@quicinc.com>

On Fri, Jun 06, 2025 at 10:51:13PM +0530, Praveen Talari wrote:
> Add Power Management (PM) runtime support to Qualcomm GENI
> serial driver.
> 

Doesn't this have impact on the behavior outside of your
project? Or is the transition from qcom_geni_serial_pm() to explicit
RPM merely moving code around?

Seems like this deserves to not be hidden in a middle of a patch series.

> Introduce necessary callbacks and updates to ensure seamless
> transitions between power states, enhancing overall power
> efficiency.
> 

This commit message fails to state why we need runtime PM support in the
driver.

Also, start your commit message with a problem description, per
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
> v5 -> v6
> - added reviewed-by tag in commit
> - added __maybe_unused to PM callback functions to avoid
>   warnings of defined but not used
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index b6fa7dc9b1fb..3691340ce7e8 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>  		old_state = UART_PM_STATE_OFF;
>  
>  	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> -		geni_serial_resources_on(uport);
> +		pm_runtime_resume_and_get(uport->dev);
>  	else if (new_state == UART_PM_STATE_OFF &&
>  		 old_state == UART_PM_STATE_ON)
> -		geni_serial_resources_off(uport);
> +		pm_runtime_put_sync(uport->dev);
>  
>  }
>  
> @@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	pm_runtime_enable(port->se.dev);

Any reason not to use devm_pm_runtime_enable() and avoid the
two pm_runtime_disable() below?

Regards,
Bjorn

> +
>  	ret = uart_add_one_port(drv, uport);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	if (port->wakeup_irq > 0) {
>  		device_init_wakeup(&pdev->dev, true);
> @@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  			device_init_wakeup(&pdev->dev, false);
>  			ida_free(&port_ida, uport->line);
>  			uart_remove_one_port(drv, uport);
> -			return ret;
> +			goto error;
>  		}
>  	}
>  
>  	return 0;
> +
> +error:
> +	pm_runtime_disable(port->se.dev);
> +	return ret;
>  }
>  
>  static void qcom_geni_serial_remove(struct platform_device *pdev)
> @@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>  	dev_pm_clear_wake_irq(&pdev->dev);
>  	device_init_wakeup(&pdev->dev, false);
>  	ida_free(&port_ida, uport->line);
> +	pm_runtime_disable(port->se.dev);
>  	uart_remove_one_port(drv, &port->uport);
>  }
>  
> +static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	struct uart_port *uport = &port->uport;
> +
> +	return geni_serial_resources_off(uport);
> +}
> +
> +static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
> +{
> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	struct uart_port *uport = &port->uport;
> +
> +	return geni_serial_resources_on(uport);
> +}
> +
>  static int qcom_geni_serial_suspend(struct device *dev)
>  {
>  	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> @@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
>  };
>  
>  static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> +			   qcom_geni_serial_runtime_resume, NULL)
>  	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>  };
>  
> -- 
> 2.17.1
> 

