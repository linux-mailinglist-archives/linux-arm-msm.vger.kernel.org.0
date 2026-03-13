Return-Path: <linux-arm-msm+bounces-97370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDceLRTPs2n2awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:47:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B627FEF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D049301F9AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61088386C3D;
	Fri, 13 Mar 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JepH0vlW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D8B386437;
	Fri, 13 Mar 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391633; cv=none; b=TPAg1H7WluJKUx8NIAhOeZY2x8NzQbkgBghXMZH+kWGyWdFndBOetdl/ITkqo5GydpBfEtE9uh/NR7tSvH3oaEjG+101RWhHrbXlWZ1E0tjwSjgrG2QALIBoWwOIftwMNVRHFJpyBNt0dESA7CyR+08DnxaFX/n37xd+oDwJG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391633; c=relaxed/simple;
	bh=FGn8dJxicvgrsI/h6Hp65oLeF+oMlSRnErsYPVzfqqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN42H7m5JRw+om9KVxah8uzHNr2CqW7MepuEKA04xiW0Uj5XjqboYva2kcMJuabQ1we3SufLbSW7sR+DzY27mpFb6deyb5Vq/9T5clxhfOomS/i5ftyivIbcK7JV6AhkJnFo6OGLl+PadnkxhNYaeZ1Ynbcae7izQUaRAxVtfrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JepH0vlW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773391631; x=1804927631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGn8dJxicvgrsI/h6Hp65oLeF+oMlSRnErsYPVzfqqk=;
  b=JepH0vlWQAHM04z4VugFqzL18gjiv51JpfZFSiQ+uXlsfSWUO84KQnTu
   R5RG+YCexun0PFIShChBncq6cLlTYy+4XihDpKqHJvz8BBY2h3Q/vBmN+
   lGpF3mfCImGbZhlQAeu8+klchf9kPY8b06tzNNSwyegIRxb2CaZbgUjj6
   2VZtX7qhoyrCJj3OqDKrR5XyVrVszYWyewW1NYYIMOkUnW52hdP8u+KcJ
   7oyW1PaWk3HrKvTKq48WtdbMdGIM5w9CEqcd/Ks2I6JJSCNIwB+Ckp4Jh
   RjQyRgl/u1KrXvCJdA9REvtT2dlRJFFjGixqnFrXaGUbn4guX4Ri1DNyG
   g==;
X-CSE-ConnectionGUID: Wa/c42eSQXKisWhsPjwFKw==
X-CSE-MsgGUID: yiozJj6ITKio6P72Wc5D0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="62067203"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="62067203"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 01:47:10 -0700
X-CSE-ConnectionGUID: EK0T+kaDQpCaPmPvtWwt/A==
X-CSE-MsgGUID: TwUHx1WNRQ6Dc8H0L0qKYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="244128261"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 Mar 2026 01:47:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 331FD95; Fri, 13 Mar 2026 09:47:07 +0100 (CET)
Date: Fri, 13 Mar 2026 10:46:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: qcom: Add support for per port VBUS
 detection
Message-ID: <abPO31SynIPY6fJD@kuha>
References: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97370-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 145B627FEF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thu, Mar 12, 2026 at 06:16:58AM +0000, Alexander Koskovich kirjoitti:
> This is required for devices (e.g. ASUS ROG Phone 3) where more than
> one USB port can act as a sink and both share a single USBIN input on
> the PMIC.
> 
> Because the PM8150B uses USBIN to determine VBUS presence, a charger
> connected to one port causes the PMIC to falsely detect VBUS on the
> other port, preventing it from entering source mode.
> 
> For example, plugging a charger into one port prevents using the other
> port for a flash drive.
> 
> Fix this by adding support for the vbus-gpios connector binding so the
> driver can use an external GPIO for per-port VBUS presence detection
> instead of the shared USBIN register.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Dropped RFC prefix
> - Remove redundant vbus-detect-gpios, instead use existing vbus-gpios from usb-connector (Dmitry)
> - Updated cover to better describe scenario where this change is relevant
> - Update comment for EN_TRY_SRC to make more sense
> - Skip vSafe5V poll too not just vSafe0V
> - return gpiod_get_value_cansleep (Konrad)
> - regmap_update_bits -> regmap_set_bits (Konrad)
> - Get vbus-gpios per connector (Konrad)
> - Add bracket to if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) (Bryan)
> - Link to v1: https://lore.kernel.org/r/20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 53 +++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 8051eaa46991..a8f6687a3522 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/err.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
> @@ -176,6 +177,8 @@ struct pmic_typec_port {
>  	bool				vbus_enabled;
>  	struct mutex			vbus_lock;		/* VBUS state serialization */
>  
> +	struct gpio_desc		*vbus_detect_gpio;
> +
>  	int				cc;
>  	bool				debouncing_cc;
>  	struct delayed_work		cc_debounce_dwork;
> @@ -279,6 +282,9 @@ static int qcom_pmic_typec_port_vbus_detect(struct pmic_typec_port *pmic_typec_p
>  	unsigned int misc;
>  	int ret;
>  
> +	if (pmic_typec_port->vbus_detect_gpio)
> +		return gpiod_get_value_cansleep(pmic_typec_port->vbus_detect_gpio);
> +
>  	ret = regmap_read(pmic_typec_port->regmap,
>  			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
>  			  &misc);
> @@ -310,6 +316,13 @@ static int qcom_pmic_typec_port_vbus_toggle(struct pmic_typec_port *pmic_typec_p
>  		val = TYPEC_SM_VBUS_VSAFE0V;
>  	}
>  
> +	/*
> +	 * On devices with multiple ports sharing USBIN, VBUS from another
> +	 * port makes the USBIN-based vsafe polls unreliable.
> +	 */
> +	if (pmic_typec_port->vbus_detect_gpio)
> +		return 0;
> +
>  	/* Poll waiting for transition to required vSafe5V or vSafe0V */
>  	ret = regmap_read_poll_timeout(pmic_typec_port->regmap,
>  				       pmic_typec_port->base + TYPEC_SM_STATUS_REG,
> @@ -589,7 +602,15 @@ static int qcom_pmic_typec_port_start_toggling(struct tcpc_dev *tcpc,
>  		mode = EN_SNK_ONLY;
>  		break;
>  	case TYPEC_PORT_DRP:
> -		mode = EN_TRY_SNK;
> +		/*
> +		 * With VBUS present on USBIN from another port, EN_TRY_SNK
> +		 * keeps the port in sink mode. Use EN_TRY_SRC so the port
> +		 * tries to source first.
> +		 */
> +		if (pmic_typec_port->vbus_detect_gpio)
> +			mode = EN_TRY_SRC;
> +		else
> +			mode = EN_TRY_SNK;
>  		break;
>  	}
>  
> @@ -677,6 +698,19 @@ static int qcom_pmic_typec_port_start(struct pmic_typec *tcpm,
>  	if (ret)
>  		goto done;
>  
> +	/*
> +	 * On devices with multiple USB-C ports sharing USBIN, bypass
> +	 * VSAFE0V so SRC attachment can complete despite VBUS being
> +	 * present on USBIN from another port.
> +	 */
> +	if (pmic_typec_port->vbus_detect_gpio) {
> +		ret = regmap_set_bits(pmic_typec_port->regmap,
> +				     pmic_typec_port->base + TYPEC_EXIT_STATE_CFG_REG,
> +				     BYPASS_VSAFE0V_DURING_ROLE_SWAP);
> +		if (ret)
> +			goto done;
> +	}
> +
>  	pmic_typec_port->tcpm_port = tcpm_port;
>  
>  	for (i = 0; i < pmic_typec_port->nr_irqs; i++)
> @@ -704,6 +738,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct pmic_typec_port_irq_data *irq_data;
>  	struct pmic_typec_port *pmic_typec_port;
> +	struct fwnode_handle *connector;
>  	int i, ret, irq;
>  
>  	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
> @@ -724,6 +759,22 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	if (IS_ERR(pmic_typec_port->vdd_vbus))
>  		return PTR_ERR(pmic_typec_port->vdd_vbus);
>  
> +	connector = device_get_named_child_node(dev, "connector");
> +	if (connector) {
> +		pmic_typec_port->vbus_detect_gpio =
> +			devm_fwnode_gpiod_get(dev, connector, "vbus",
> +					      GPIOD_IN, NULL);
> +		fwnode_handle_put(connector);
> +
> +		if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) {
> +			ret = PTR_ERR(pmic_typec_port->vbus_detect_gpio);
> +			pmic_typec_port->vbus_detect_gpio = NULL;
> +			if (ret != -ENOENT)
> +				return dev_err_probe(dev, ret,
> +						     "failed to get vbus GPIO\n");
> +		}
> +	}
> +
>  	pmic_typec_port->dev = dev;
>  	pmic_typec_port->base = base;
>  	pmic_typec_port->regmap = regmap;
> 
> ---
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> change-id: 20260308-qcom-typec-shared-vbus-7d37c6b2d155
> 
> Best regards,
> -- 
> Alexander Koskovich <akoskovich@pm.me>
> 

-- 
heikki

