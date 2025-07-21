Return-Path: <linux-arm-msm+bounces-65847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C46B0BD05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E922B1885C17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9FD27FB2E;
	Mon, 21 Jul 2025 06:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UToVY+Cf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66219924D;
	Mon, 21 Jul 2025 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753080875; cv=none; b=B/6TVrWmzbURRKy8EjtlwNHA6Ji/ScH0naPfNQu0f2ofBxm04dK9EAmLpQfEkFHVnkBTnM6PhfshrT7x2U2poRO22SJFeaq4GXAVO++C3GAGBgTnU3O9PI6v37HB7oQqyZtAp7Z7zGT2PvlEiuJY/fNcKfcBXequGDOO7Af0VHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753080875; c=relaxed/simple;
	bh=loO9CY0pPRWxsZKpY7FRugQcMkLMn7XZ/qvHjonTF+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsvR8M8vUwb5hDCGyHjjuj0bWwDORPeOZFZDsBIR7gUtfIDEcf0L+mhVZv3JD1zv2evHHTFDxwnuA5PzTDU8T7AiuRD8xbRwRdHpyXdbAB7y8HKQ6PZyEvLP5T3tCOC0I+evl0HiGYixXYzrWc/240qQxZALnnRs5S7d9InvIyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UToVY+Cf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5341BC4CEF1;
	Mon, 21 Jul 2025 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753080874;
	bh=loO9CY0pPRWxsZKpY7FRugQcMkLMn7XZ/qvHjonTF+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UToVY+CfSHU/2B/nn4WjxnpTh9mCcznnPpB5FSIV9gGhbZAD1ukKXZj+dUOrJEF1y
	 kj47GA10pVMDcrnxyc1RY4ibFPNqzaWJ7CJd8Vd6f8deepww+djtpmbniqJ9DcaTer
	 p5qDLQ5uvRIm39iHk44+yS+QbOQu5MfeGffvZcNk=
Date: Mon, 21 Jul 2025 08:54:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <2025072119-constrict-wieldable-c4c3@gregkh>
References: <20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com>

On Mon, Jul 21, 2025 at 12:08:41PM +0530, Komal Bajaj wrote:
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
> Changes in v6:
> - Propagating the error code from disable_eud(), per Dmitry's suggestion
> - Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com
> 
> usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
> 
> Changes in v5:
> * Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's review
> * Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.bajaj@oss.qualcomm.com/
> 
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
> ---
>  drivers/usb/misc/Kconfig    |  1 +
>  drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
>  2 files changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636cdfd756344b9ed4e7 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
>  config USB_QCOM_EUD
>  	tristate "QCOM Embedded USB Debugger(EUD) Driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_SCM
>  	select USB_ROLE_SWITCH
>  	help
>  	  This module enables support for Qualcomm Technologies, Inc.
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 83079c414b4f281b2136d0d1eb39418c7f94ff8c..05c8bdc943a88dab6159a05c2d770484c084f7b7 100644
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
> @@ -43,18 +44,29 @@ struct eud_chip {
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
>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>  			priv->base + EUD_REG_INT1_EN_MASK);
> -	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
>  
>  	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>  }
>  
> -static void disable_eud(struct eud_chip *priv)
> +static int disable_eud(struct eud_chip *priv)
>  {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> +	if (ret)
> +		return ret;
> +
>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> -	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
> +	return 0;
>  }
>  
>  static ssize_t enable_show(struct device *dev,
> @@ -82,11 +94,12 @@ static ssize_t enable_store(struct device *dev,
>  			chip->enabled = enable;
>  		else
>  			disable_eud(chip);
> +
>  	} else {
> -		disable_eud(chip);
> +		ret = disable_eud(chip);
>  	}
>  
> -	return count;
> +	return ret < 0 ? ret : count;
>  }
>  
>  static DEVICE_ATTR_RW(enable);
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
>  
>  	chip->irq = platform_get_irq(pdev, 0);
>  	if (chip->irq < 0)
> 
> ---
> base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
> change-id: 20250715-eud_mode_manager_secure_access-6e57e3c71ec2
> 
> Best regards,
> -- 
> Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

