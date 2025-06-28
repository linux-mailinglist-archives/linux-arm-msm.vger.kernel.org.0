Return-Path: <linux-arm-msm+bounces-62909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AAAEC7B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 16:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42AA73B7CD4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 14:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5345221F01;
	Sat, 28 Jun 2025 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kDkfsgaG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832351FECB1;
	Sat, 28 Jun 2025 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751121367; cv=none; b=WUT8DhG68aDO6xWjEtjzkynT9HYS2ITKqvHjMGOaUzOGJR+tra7Eq46zqVU69UkPnXmMS3Z0ps4W+08T9/lx6P15mT/Ny3e4wJ7mpyeOe19tvqlaLel7vHVMe5StYpteko9jKFLPGLUY3w7lfVrYp5H8olmReyhwfXwDItqTKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751121367; c=relaxed/simple;
	bh=LMBKCBRq57KuHMKbf/M16fyDVipmK1nxt7NY+25su0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhrMQpfeHq0zjr45VCzHPElQApFcLKeAI5D6H496+D+4A4GYFwWdpCSfVGScZBvCKY4JHIZj3CarEZscOsbWevpO8qope32p52/8Bl/8vtvEWU30dIK0CHcdk3vFuccXxpi8QKnyUqe+ho+iXLESCXd4vm+6Ktae5ETtxyQq870=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kDkfsgaG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B16C4CEF0;
	Sat, 28 Jun 2025 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751121367;
	bh=LMBKCBRq57KuHMKbf/M16fyDVipmK1nxt7NY+25su0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDkfsgaGrEC3bt5bPghmzke7/i2X+/wxx8ygfjXq9/2l6p6v4OgUEVjrP2j6G/Nk3
	 0MNlof4YugA9iNXeLS72JH3OfmRsURY2xH7a1xzGEVYeaXcKDB0AvKGT9wmHtbRGJw
	 j24c7esq5wjkKNtuUo7g9DH5QEq+SwSJX1n0dJCs=
Date: Sat, 28 Jun 2025 16:36:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <2025062812-passive-untracked-1231@gregkh>
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>

On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
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
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> 
>  drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 83079c414b4f..30c999c49eb0 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -16,6 +16,8 @@
>  #include <linux/sysfs.h>
>  #include <linux/usb/role.h>
>  
> +#include <linux/firmware/qcom/qcom_scm.h>

Why the blank line before this #include line?

> +
>  #define EUD_REG_INT1_EN_MASK	0x0024
>  #define EUD_REG_INT_STATUS_1	0x0044
>  #define EUD_REG_CTL_OUT_1	0x0074
> @@ -34,7 +36,7 @@ struct eud_chip {
>  	struct device			*dev;
>  	struct usb_role_switch		*role_sw;
>  	void __iomem			*base;
> -	void __iomem			*mode_mgr;
> +	phys_addr_t			mode_mgr;
>  	unsigned int			int_status;
>  	int				irq;
>  	bool				enabled;
> @@ -43,10 +45,14 @@ struct eud_chip {
>  
>  static int enable_eud(struct eud_chip *priv)
>  {
> +	int ret;
> +
>  	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>  			priv->base + EUD_REG_INT1_EN_MASK);
> -	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> +	if (ret)
> +		return ret;

So the previous writes are ok, but this one could fail?  And if it does
fail, what did the previous writes cause to happen to the chip / system?

>  	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>  }
> @@ -54,7 +60,7 @@ static int enable_eud(struct eud_chip *priv)
>  static void disable_eud(struct eud_chip *priv)
>  {
>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> -	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
> +	qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);

No error checking needed?


>  }
>  
>  static ssize_t enable_show(struct device *dev,
> @@ -178,6 +184,7 @@ static void eud_role_switch_release(void *data)
>  static int eud_probe(struct platform_device *pdev)
>  {
>  	struct eud_chip *chip;
> +	struct resource *res;
>  	int ret;
>  
>  	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> @@ -200,9 +207,10 @@ static int eud_probe(struct platform_device *pdev)
>  	if (IS_ERR(chip->base))
>  		return PTR_ERR(chip->base);
>  
> -	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(chip->mode_mgr))
> -		return PTR_ERR(chip->mode_mgr);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return -ENODEV;

-ENOMEM perhaps?

thanks,

greg k-h

