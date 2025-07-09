Return-Path: <linux-arm-msm+bounces-64141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA0AFE304
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFC8D1748F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7507027C879;
	Wed,  9 Jul 2025 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0meTvm5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4276727AC37;
	Wed,  9 Jul 2025 08:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752050674; cv=none; b=ul6tRQ5qFdaPnoaY6oWPa3BrJOOGnaYTTlYjIsO0Iaa7GyW5u55oHZsM69lDQzNmx6wfYo81Eb9ryUD9jRQFypE+tqt1e/xICdcO29igayCePUiV5N3wmuRiOwTsftZOSNGtEIiffNkFw4Zi/YCEK74FufEBQXD2YXpbzrxt+A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752050674; c=relaxed/simple;
	bh=lwQ2KKKmVP54nbs4jel6XWDPyKiP+QppmSbUcd856N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MygE7F7wjJB2YWgKPYot/dhJtNsLNIAC5gHyQmNLERdgWw9REfO5QYDRtAYcX1WiQcnp+zJc+Poi/KtOnBn5gWvYa0LdIhbw88Tg1/zwa7ph/iaOiv+6ZDoTrlgzj7a7XqhvnCvJ1/91iT0aqDb3WOWXXiJtiSau/v9DYgzOzjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0meTvm5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C78BC4CEEF;
	Wed,  9 Jul 2025 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752050673;
	bh=lwQ2KKKmVP54nbs4jel6XWDPyKiP+QppmSbUcd856N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0meTvm5Fs8Qz7iZrXUC7Pg2gSzJmhZapvoDupt+zSqtOMzeBBZiuzq4gK4NpMlZy2
	 PT20Y4k9viWa4D6d/Bys4SM6I6X/AGjbplivRy8Xr+QTg+/5JeHz5G28GYFJ+of2KF
	 gh5GTlXCy8LC3R2oojoXOyvA5S6dveG79vBipnxU=
Date: Wed, 9 Jul 2025 10:44:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <2025070924-wilt-dreamt-fb25@gregkh>
References: <20250709065533.25724-1-komal.bajaj@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709065533.25724-1-komal.bajaj@oss.qualcomm.com>

On Wed, Jul 09, 2025 at 12:25:14PM +0530, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for HLOS, enforcing access restrictions that prohibit
> direct memory-mapped writes via writel().
> 
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
> 
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v4:
> * Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
> * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v3:
> * Moved secure write before normal writes
> * Added error checking in disable_eud()
> * Use ENOMEM error code if platform_get_resource() fails
> * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> 
>  drivers/usb/misc/Kconfig    |  1 +
>  drivers/usb/misc/qcom_eud.c | 27 +++++++++++++++++++++------
>  2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 6497c4e81e95..f49d5ac0e957 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -148,6 +148,7 @@ config USB_QCOM_EUD
>  	tristate "QCOM Embedded USB Debugger(EUD) Driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	select USB_ROLE_SWITCH
> +	select QCOM_SCM

How is this select going to work if COMPILE_TEST is enabled on
non-ARCH_QCOM configs?

Please don't use select if at all possible, use "depends" properly.


>  	help
>  	  This module enables support for Qualcomm Technologies, Inc.
>  	  Embedded USB Debugger (EUD). The EUD is a control peripheral
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 83079c414b4f..a58081f53db3 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/usb/role.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  
>  #define EUD_REG_INT1_EN_MASK	0x0024
>  #define EUD_REG_INT_STATUS_1	0x0044
> @@ -34,7 +35,7 @@ struct eud_chip {
>  	struct device			*dev;
>  	struct usb_role_switch		*role_sw;
>  	void __iomem			*base;
> -	void __iomem			*mode_mgr;
> +	phys_addr_t			mode_mgr;
>  	unsigned int			int_status;
>  	int				irq;
>  	bool				enabled;
> @@ -43,18 +44,30 @@ struct eud_chip {
>  
>  static int enable_eud(struct eud_chip *priv)
>  {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> +	if (ret)
> +		return ret;
> +
>  	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);

Nit, why is your local writel() function in backwards order of
parameters from qcom_scm_io_writel()?  That's going to be a major pain
to maintain over time, don't you think?


>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>  			priv->base + EUD_REG_INT1_EN_MASK);
> -	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
>  
>  	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>  }
>  
>  static void disable_eud(struct eud_chip *priv)
>  {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to disable eud\n");
> +		return;
> +	}
> +
>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> -	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
>  }
>  
>  static ssize_t enable_show(struct device *dev,
> @@ -178,6 +191,7 @@ static void eud_role_switch_release(void *data)
>  static int eud_probe(struct platform_device *pdev)
>  {
>  	struct eud_chip *chip;
> +	struct resource *res;
>  	int ret;
>  
>  	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> @@ -200,9 +214,10 @@ static int eud_probe(struct platform_device *pdev)
>  	if (IS_ERR(chip->base))
>  		return PTR_ERR(chip->base);
>  
> -	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(chip->mode_mgr))
> -		return PTR_ERR(chip->mode_mgr);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return -ENODEV;
> +	chip->mode_mgr = res->start;

No ioremap() call needed anymore?   Why not?

thanks,

greg k-h

