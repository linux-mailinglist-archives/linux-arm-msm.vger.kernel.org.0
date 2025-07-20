Return-Path: <linux-arm-msm+bounces-65769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12289B0B380
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 06:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35FB4168336
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 04:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6022619D08F;
	Sun, 20 Jul 2025 04:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZG86+t1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D40D299;
	Sun, 20 Jul 2025 04:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752985098; cv=none; b=fEXAJoYf3eAOv5bxBywadH3cbUfDbBuxolsH/TqDX5EGo7f0q93fT70FfLvsqR9iTiHRQwZoGkZUdG0E+Gkgqwy+nQpnVmg1yZTHu7rtkdsNLLUT807IHUHB6HGNAgsn8lXIRthThWWiaJD8iGj+YOQSByi5nIQlR6af0i1fNio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752985098; c=relaxed/simple;
	bh=zTPSGV2RN1Tag3sEwHr3Y8/f9dwXxNdVFtcCN53nUPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsXWb50GL0Vy28K52nY7hmZJgOTp/7RgNvLQe+UPD/BvW8wblR4ZRIrK3YhQUDSW3nvkFIme+V0nwhs2wT7O3s8RxwPpAUF8jHVH1T4qUpQ+yst234A8Y/kqrnZMuTTl0yjbXGXrQeF8VcUHPTka7K3NCniG2fZHby8SMc63T0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZG86+t1B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B37C4CEEB;
	Sun, 20 Jul 2025 04:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752985097;
	bh=zTPSGV2RN1Tag3sEwHr3Y8/f9dwXxNdVFtcCN53nUPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZG86+t1BxJ2IZOGOWK2RipHXXZRclzaoCksosk0COZBjY4IKxMJBvU742bR+9SMCN
	 j4FlKXrs6HzltarHh5XbDHN24uOk6r715RmwVMVEAe8P9aVWXamB4v6Z47JlQjCy+4
	 P0Tr7cdiiq1Xkbm05D3yN1+FYJ43BGToh9ifzLQ/nb6hVym5sJkt90K5MRtKHvw/DT
	 0CLJbCf1cRURhX9TFUYBd+7veU7DMOoSR8FYCJDdSBuCBxaQEp3d+HPcr1v6xQisGe
	 JdrVB2dQbk33rxqp+bNqqGEBoysu1LXw6VxlBPbm+DroFqIedKw3GZfdhvjch5aE0L
	 Q9WcxdlS9yRsw==
Date: Sat, 19 Jul 2025 23:18:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: pmic_glink: Add support for subsystem
 restart (SSR)
Message-ID: <isc35khjez4yvuyqtfakalgbdsub477shqh2h2ejiii4rutfk3@qlhrjvfwr734>
References: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
 <20250716004004.311001-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716004004.311001-3-anjelique.melendez@oss.qualcomm.com>

On Tue, Jul 15, 2025 at 05:40:04PM -0700, Anjelique Melendez wrote:
> Add support for PMIC Glink clients to receive notificiation when
> the subsystem goes down and comes up again.
> 

When I restart the adsp on my devices, I can see pmic glink reacting to
that (and UCSI oopsing). So please describe what's actually missing in
the current implementation.

Regards,
Bjorn

> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 80 ++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 0a6d325b195c..3e755073db60 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2022, Linaro Ltd
> + * ​​​​Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  #include <linux/auxiliary_bus.h>
>  #include <linux/cleanup.h>
> @@ -9,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/remoteproc/qcom_rproc.h>
>  #include <linux/rpmsg.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/pdr.h>
> @@ -23,13 +25,18 @@ enum {
>  	PMIC_GLINK_CLIENT_UCSI,
>  };
>  
> +struct pmic_glink_data {
> +	unsigned long	client_mask;
> +	char		*ssr_name;
> +};
> +
>  struct pmic_glink {
>  	struct device *dev;
>  	struct pdr_handle *pdr;
>  
>  	struct rpmsg_endpoint *ept;
>  
> -	unsigned long client_mask;
> +	const struct pmic_glink_data *data;
>  
>  	struct auxiliary_device altmode_aux;
>  	struct auxiliary_device ps_aux;
> @@ -39,10 +46,14 @@ struct pmic_glink {
>  	struct mutex state_lock;
>  	unsigned int client_state;
>  	unsigned int pdr_state;
> +	unsigned int ssr_state;
>  
>  	/* serializing clients list updates */
>  	spinlock_t client_lock;
>  	struct list_head clients;
> +
> +	struct notifier_block ssr_nb;
> +	void *ssr_handle;
>  };
>  
>  static struct pmic_glink *__pmic_glink;
> @@ -205,10 +216,13 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
>  	unsigned long flags;
>  
>  	if (pg->client_state != SERVREG_SERVICE_STATE_UP) {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
> +		if ((pg->pdr_state == SERVREG_SERVICE_STATE_UP ||
> +		     pg->ssr_state == QCOM_SSR_AFTER_POWERUP) && pg->ept)
>  			new_state = SERVREG_SERVICE_STATE_UP;
>  	} else {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
> +		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN ||
> +		    pg->ssr_state == QCOM_SSR_BEFORE_SHUTDOWN ||
> +		    !pg->ept)
>  			new_state = SERVREG_SERVICE_STATE_DOWN;
>  	}
>  
> @@ -231,6 +245,18 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
>  	pmic_glink_state_notify_clients(pg);
>  }
>  
> +static int pmic_glink_ssr_callback(struct notifier_block *nb, unsigned long code, void *data)
> +{
> +	struct pmic_glink *pg = container_of(nb, struct pmic_glink, ssr_nb);
> +
> +	mutex_lock(&pg->state_lock);
> +	pg->ssr_state = code;
> +
> +	pmic_glink_state_notify_clients(pg);
> +	mutex_unlock(&pg->state_lock);
> +	return 0;
> +}
> +
>  static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct pmic_glink *pg;
> @@ -280,7 +306,6 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
>  
>  static int pmic_glink_probe(struct platform_device *pdev)
>  {
> -	const unsigned long *match_data;
>  	struct pdr_service *service;
>  	struct pmic_glink *pg;
>  	int ret;
> @@ -297,12 +322,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  	spin_lock_init(&pg->client_lock);
>  	mutex_init(&pg->state_lock);
>  
> -	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
> -	if (!match_data)
> +	pg->data = of_device_get_match_data(&pdev->dev);
> +	if (!pg->data)
>  		return -EINVAL;
>  
> -	pg->client_mask = *match_data;
> -
>  	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
>  	if (IS_ERR(pg->pdr)) {
>  		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr),
> @@ -310,17 +333,17 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
>  		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
>  		if (ret)
>  			goto out_release_pdr_handle;
>  	}
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
>  		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
>  		if (ret)
>  			goto out_release_ucsi_aux;
>  	}
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
>  		ret = pmic_glink_add_aux_device(pg, &pg->ps_aux, "power-supply");
>  		if (ret)
>  			goto out_release_altmode_aux;
> @@ -333,6 +356,16 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  		goto out_release_aux_devices;
>  	}
>  
> +	if (device_property_present(&pdev->dev, "qcom,subsys-restart")) {
> +		pg->ssr_nb.notifier_call = pmic_glink_ssr_callback;
> +		pg->ssr_handle = qcom_register_ssr_notifier(pg->data->ssr_name, &pg->ssr_nb);
> +		if (IS_ERR(pg->ssr_handle)) {
> +			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
> +					"failed adding ssr notifier\n");
> +			goto out_release_aux_devices;
> +		}
> +	}
> +
>  	mutex_lock(&__pmic_glink_lock);
>  	__pmic_glink = pg;
>  	mutex_unlock(&__pmic_glink_lock);
> @@ -340,13 +373,13 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  	return 0;
>  
>  out_release_aux_devices:
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
>  		pmic_glink_del_aux_device(pg, &pg->ps_aux);
>  out_release_altmode_aux:
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
>  		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
>  out_release_ucsi_aux:
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
>  		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
>  out_release_pdr_handle:
>  	pdr_handle_release(pg->pdr);
> @@ -360,23 +393,28 @@ static void pmic_glink_remove(struct platform_device *pdev)
>  
>  	pdr_handle_release(pg->pdr);
>  
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
> +	if (pg->ssr_handle)
> +		qcom_unregister_ssr_notifier(pg->ssr_handle, &pg->ssr_nb);
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
>  		pmic_glink_del_aux_device(pg, &pg->ps_aux);
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
>  		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
>  		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
>  
>  	guard(mutex)(&__pmic_glink_lock);
>  	__pmic_glink = NULL;
>  }
>  
> -static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> -							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
> -							   BIT(PMIC_GLINK_CLIENT_UCSI);
> +static const struct pmic_glink_data pmic_glink_sm8450_data = {
> +	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> +		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
> +		       BIT(PMIC_GLINK_CLIENT_UCSI),
> +	.ssr_name = "lpass",
> +};
>  
>  static const struct of_device_id pmic_glink_of_match[] = {
> -	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
> +	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
> -- 
> 2.34.1
> 

