Return-Path: <linux-arm-msm+bounces-108704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDXsMuWRDWpyzgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:50:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C0158BF4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3194E3010EDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9393D1CB0;
	Wed, 20 May 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIH+9RBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9852690D5;
	Wed, 20 May 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274211; cv=none; b=s2bqeISw4OwILNSj7qt1MIAIb9ke3l6ya6YDWMLPJvDv0z16HhwifGsLnDwoBEs2F1+lbn3Bb9hifM86KgzEa0D7UPbiivpW2zMpOijwnix37yvHtlXcBy7jIFwa+BULAS1N7uHOlGS2udDVMzbHuobvEwRysWEw+jhHpPGmSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274211; c=relaxed/simple;
	bh=xzmO1vBrs+r/Q9X6qapHMsiXQvyu1KHDSm7okMidSKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Urd4JNsZW2rrOYtxhLubNTzhOiXQAvSI46IW2bfUARDXcCaHkz79POyr2hQ5+lYN0xOJzp9XNbGyHoMff9ufFLQnmaZaepsrwIIkc3NNRFGY6bE9FLEtLaZo6AEx+lZjjCJ1k82qyG8JEXZjWWyCMd5Nhe+mnxQw6+QPVdMFFSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIH+9RBl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8371F000E9;
	Wed, 20 May 2026 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779274209;
	bh=/wVfsAohPrdpu7sbtvWCMGRpNzk5eiUS7Z2FelCwjeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIH+9RBlu9qkRby5Gy1sjgthKpT7jyYDrHNO44ICLyu0r3sc5hGwq8q7RRTjLjlil
	 Q/WuGvQ0lgrPoDlXd06iVjAsShvNeRGopWmFfSmW8wljrLpeX2oVPhsUkrwBcDjsQy
	 zj0QyKRElfPqAi/Fs3ZmQkDJ6NNu2MY6BElv6bn/Y6gD7izp7EpEYLQFCTHJFE5tiV
	 7+vSyzuaKLTec7+5i9/EgH3kl3Afw9UoZs0dHbWDzBUSFDo4YmurtfAWlNlFsa3kpE
	 FHAWHu4oBe8vMcIs8ptKUN9Qan/Tb5p+5ou8QiJJ49zkB2IrhiNvCqfCJY4cRQKYDB
	 DWEvRrbxLMZhQ==
Date: Wed, 20 May 2026 12:50:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] soc: qcom: Add CDSP power management driver
Message-ID: <20260520-mottled-space-pony-ac82ac@quoll>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-2-85eb9501a1cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-cdsp-power-v1-2-85eb9501a1cd@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108704-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 48C0158BF4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:35:10AM +0530, Vignesh Viswanathan wrote:
> +/**
> + * cdsp_power_probe() - Probe the CDSP power management driver
> + * @pdev: Platform device
> + *
> + * Acquires the PMIC regulator consumer handles, registers the virtual
> + * cdsp-vdd-cx (and optionally cdsp-vdd-mx) regulator providers, maps the
> + * MPM and RSCC register regions, and registers the DCVS and LPM interrupt
> + * handlers.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int cdsp_power_probe(struct platform_device *pdev)
> +{
> +	struct regulator_config virt_cfg = {};
> +	struct cdsp_power_driver *drv;
> +	struct regulator_dev *rdev;
> +	void __iomem *rscc_base;
> +	void __iomem *mpm_base;
> +	size_t smem_size;
> +	u32 smem_id;
> +	int ret;
> +
> +	/* Allocate driver context */
> +	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	drv->dev = &pdev->dev;
> +	mutex_init(&drv->lock);
> +	atomic_set(&drv->power_state, CDSP_POWER_ON);
> +
> +	/* Get SMEM item ID from device tree */
> +	ret = of_property_read_u32(pdev->dev.of_node, "qcom,smem-item", &smem_id);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to get SMEM item ID\n");
> +
> +	/* Create SMEM entry for DCVS */
> +	ret = qcom_smem_alloc(CDSP_SMEM_NSP_HOST_ID, smem_id, CDSP_SMEM_SIZE);
> +	if (ret && ret != -EEXIST)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to allocate SMEM\n");
> +
> +	/* Get SMEM pointer and validate size */
> +	drv->smem = qcom_smem_get(CDSP_SMEM_NSP_HOST_ID, smem_id, &smem_size);
> +	if (IS_ERR(drv->smem))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->smem),
> +				     "Failed to get SMEM\n");
> +
> +	if (smem_size < CDSP_SMEM_SIZE)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "SMEM region too small: got %zu, expected %u\n",
> +				     smem_size, CDSP_SMEM_SIZE);
> +
> +	/*
> +	 * Initialise the SMEM channel header.
> +	 * Zero the entire region first so all padding and reserved fields
> +	 * are clean, then fill in the fixed protocol fields.
> +	 * apss_state is set to 1 last (after wmb) so NSP Q6 only sees a
> +	 * fully-populated header once APSS is ready.
> +	 */
> +	memset(drv->smem, 0, sizeof(*drv->smem));
> +	drv->smem->hdr.magic           = CDSP_SMEM_MAGIC;
> +	drv->smem->hdr.version         = CDSP_SMEM_VERSION;
> +	drv->smem->hdr.request_offset  = CDSP_SMEM_REQUEST_OFFSET;
> +	drv->smem->hdr.request_size    = CDSP_SMEM_REQUEST_SIZE;
> +	drv->smem->hdr.response_offset = CDSP_SMEM_RESPONSE_OFFSET;
> +	drv->smem->hdr.response_size   = CDSP_SMEM_RESPONSE_SIZE;
> +	/* Signal APSS readiness to NSP Q6 */
> +	WRITE_ONCE(drv->smem->hdr.apss_state, 1);
> +	/* Ensure SMEM header is fully written before NSP Q6 reads it */
> +	wmb();
> +
> +	/*
> +	 * Get voltage regulator consumer handles.
> +	 * These are the actual NSP_CX and NSP_MX voltage rails.
> +	 * The virtual regulator ops pass through to these handles.
> +	 */
> +	drv->vdd_cx = devm_regulator_get(&pdev->dev, "vdd-cx");
> +	if (IS_ERR(drv->vdd_cx))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->vdd_cx),
> +				     "Failed to get vdd-cx regulator\n");
> +
> +	drv->vdd_mx = devm_regulator_get_optional(&pdev->dev, "vdd-mx");
> +	if (IS_ERR(drv->vdd_mx)) {
> +		if (PTR_ERR(drv->vdd_mx) != -ENODEV)
> +			return dev_err_probe(&pdev->dev, PTR_ERR(drv->vdd_mx),
> +					     "Failed to get vdd-mx regulator\n");
> +		drv->vdd_mx = NULL;
> +		dev_dbg(&pdev->dev, "No vdd-mx regulator, MX rail absent on this board\n");
> +	}
> +
> +	/*
> +	 * Register virtual regulator provider.
> +	 *
> +	 * Expose vdd-cx and vdd-mx virtual regulators so that PAS remoteproc
> +	 * can consume them via cx-supply / mx-supply DTS properties.
> +	 * The enable/disable ops pass through to vdd_cx / vdd_mx above,
> +	 * making CDSP the sole hardware power manager for the NSP subsystem.
> +	 */
> +	virt_cfg.dev         = &pdev->dev;
> +	virt_cfg.driver_data = drv;
> +	virt_cfg.of_node     = pdev->dev.of_node;
> +
> +	INIT_WORK(&drv->dcvs_work, cdsp_dcvs_work_fn);
> +	INIT_WORK(&drv->lpm_work, cdsp_lpm_work_fn);
> +
> +	drv->lpm_wq = alloc_ordered_workqueue("cdsp_lpm_wq", 0);
> +	if (!drv->lpm_wq) {
> +		mbox_free_channel(drv->dcvs_mbox_chan);
> +		return dev_err_probe(&pdev->dev,
> +				     -ENOMEM,
> +				     "failed to allocate cdsp lpm workqueue\n");
> +	}
> +
> +	rdev = devm_regulator_register(&pdev->dev,
> +				       &cdsp_virt_reg_descs[CDSP_VIRT_NSP_CX],
> +				       &virt_cfg);
> +	if (IS_ERR(rdev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
> +				     "Failed to register cdsp-vdd-cx virtual regulator\n");
> +
> +	if (drv->vdd_mx) {
> +		rdev = devm_regulator_register(&pdev->dev,
> +					       &cdsp_virt_reg_descs[CDSP_VIRT_NSP_MX],
> +					       &virt_cfg);
> +		if (IS_ERR(rdev))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
> +					     "Failed to register cdsp-vdd-mx virtual regulator\n");
> +	}
> +
> +	/* Register DCVS interrupt */
> +	drv->dcvs_irq = platform_get_irq_byname(pdev, "dcvs");
> +	if (drv->dcvs_irq < 0)
> +		return dev_err_probe(&pdev->dev, drv->dcvs_irq,
> +				     "Failed to get DCVS IRQ\n");
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, drv->dcvs_irq,
> +					NULL, cdsp_dcvs_irq_handler,
> +					IRQF_ONESHOT, "cdsp-dcvs", drv);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to request DCVS IRQ\n");
> +
> +	/* Setup MPM for LPM */
> +	mpm_base = devm_platform_ioremap_resource_byname(pdev, "mpm");
> +	if (IS_ERR(mpm_base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(mpm_base),
> +				     "Failed to map MPM registers\n");
> +
> +	drv->mpm_regmap = devm_regmap_init_mmio(&pdev->dev, mpm_base, &cdsp_regmap_config);
> +	if (IS_ERR(drv->mpm_regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->mpm_regmap),
> +				     "Failed to init MPM regmap\n");
> +
> +	/* Setup RSCC for power mode detection */
> +	rscc_base = devm_platform_ioremap_resource_byname(pdev, "rscc");
> +	if (IS_ERR(rscc_base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rscc_base),
> +				     "Failed to map RSCC registers\n");
> +
> +	drv->rscc_regmap = devm_regmap_init_mmio(&pdev->dev, rscc_base, &cdsp_rscc_regmap_config);
> +	if (IS_ERR(drv->rscc_regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->rscc_regmap),
> +				     "Failed to init RSCC regmap\n");
> +
> +	drv->lpm_irq = platform_get_irq_byname(pdev, "lpm");
> +	if (drv->lpm_irq < 0)
> +		return dev_err_probe(&pdev->dev, drv->lpm_irq,
> +				     "Failed to get LPM IRQ\n");
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, drv->lpm_irq,
> +					NULL, cdsp_lpm_irq_handler,
> +					IRQF_ONESHOT, "cdsp-lpm", drv);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to request LPM IRQ\n");
> +
> +	/* Setup mbox for DCVS response */
> +	drv->dcvs_mbox_client.dev = &pdev->dev;
> +	drv->dcvs_mbox_client.knows_txdone = true;
> +	drv->dcvs_mbox_chan = mbox_request_channel(&drv->dcvs_mbox_client, 0);
> +	if (IS_ERR(drv->dcvs_mbox_chan))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->dcvs_mbox_chan),
> +				     "Failed to get dcvs mbox channel\n");
> +
> +	platform_set_drvdata(pdev, drv);
> +
> +	dev_dbg(&pdev->dev, "CDSP power driver initialized\n");

Drop. All my comments from your regulator driver apply.

> +
> +	return 0;
> +}

Best regards,
Krzysztof


