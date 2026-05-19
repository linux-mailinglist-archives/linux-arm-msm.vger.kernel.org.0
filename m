Return-Path: <linux-arm-msm+bounces-108532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLdLMqdwDGpKhgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:16:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2865805C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7805C30FC474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC5B3ED3D0;
	Tue, 19 May 2026 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lj7Zv1LA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099803F0744;
	Tue, 19 May 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199563; cv=none; b=S3IZ5JmX4Gn+umgcTU5OFA0diVddLov16l9VkNrstY66ECLlQ3qruq2kF1E0q5KpfKvHgonvkLaNt3dhk/mz9jkkn6IPTQu50X3CzSDXmnuMX1PZ5krdwklq+ou4TWWt9PGG4J8rJhXnHrV2gt/5cNEVaab81eJNSnDF9fMmYOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199563; c=relaxed/simple;
	bh=lBSEGo7O8hgJ9dLZNCapesRoomudLa7YDbyuKR0GaYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ml/X9zdIN5H/BU9WxYttr2LoMRYZ43XXAI1SQWBozxZO9nkoNgDKcRfMy/IFnIoPv4x76nZW8OT/XcZneZ6NOSSuNeqDhTWu6MudrfqAkJAKCahebkoJIalB+v1H9V9yqbkDt8z2NIWcKFGsXc3egGINjxOZOcHiv7VaNU0N/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lj7Zv1LA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779199561; x=1810735561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lBSEGo7O8hgJ9dLZNCapesRoomudLa7YDbyuKR0GaYs=;
  b=lj7Zv1LAfZJeiikSv/y7I8mTuGLD6vv8kcl8Ur1LqvBqGKCPDcyxnB5U
   oBeUNl3BA+Mo4rlC/1nEm8bIoXW0Ly2XYnoiE7F+iXgrQcLSYC7IFpcEa
   RjadOAIjFYB4ii68Ybm6QmgViHt9/frNumdshlkZ4DIkAWPc89KSBoyhK
   /iat3Pokhu7j+RDyiduWpnmLaXp8F2kWjs/KmcFYT9Ky8wXOHhO3UYGeI
   gkoCx0ED7qbJW/xqgj3bwQ6eIMgyRDIqyhMLpSFZwwW0QoevKPArBsI7h
   xTYuP+29Q1pT2YLkZSFrXQHVcdc0uET94qZjIhL9+OsJp1bMu83tOUbaz
   w==;
X-CSE-ConnectionGUID: 0Im4ecPuT3C3zRQYOgvfkA==
X-CSE-MsgGUID: HGy9XJTYSuKkMYIhfFwTZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="82642876"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="82642876"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:05:59 -0700
X-CSE-ConnectionGUID: 6ljnlqZOSJiEhUFOsE2rnQ==
X-CSE-MsgGUID: cJGSqS8wSkC57oQu8xOI1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244745243"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 19 May 2026 07:05:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 29F5D95; Tue, 19 May 2026 16:05:55 +0200 (CEST)
Date: Tue, 19 May 2026 17:05:43 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] usb: typec: tcpm: qcom: prefer VBUS supply from the
 connector node
Message-ID: <agxuN6O8rRKGQr1F@kuha>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108532-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linaro.org,linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1A2865805C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:48:04PM +0300, Dmitry Baryshkov wrote:
> Current way of specifying VBUS supply (via the device's vdd-vbus-supply
> property) is not ideal. In the end, VBUS is supplied to the USB-C
> connector rather than the Type-C block in the PMIC. Follow the standard
> way of specifying it (via the connector node) and fallback to the old
> property if there is no vbus-supply in the connector node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 8051eaa46991..429bd42a0e62 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> @@ -704,6 +705,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct pmic_typec_port_irq_data *irq_data;
>  	struct pmic_typec_port *pmic_typec_port;
> +	struct fwnode_handle *connector;
>  	int i, ret, irq;
>  
>  	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
> @@ -720,7 +722,15 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  
>  	mutex_init(&pmic_typec_port->vbus_lock);
>  
> -	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
> +	connector = device_get_named_child_node(dev, "connector");
> +	if (!connector)
> +		return -EINVAL;
> +
> +	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
> +								   to_of_node(connector),
> +								   "vbus");
> +	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
> +		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
>  	if (IS_ERR(pmic_typec_port->vdd_vbus))
>  		return PTR_ERR(pmic_typec_port->vdd_vbus);
>  
> 
> -- 
> 2.47.3

-- 
heikki

