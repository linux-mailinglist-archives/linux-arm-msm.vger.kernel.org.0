Return-Path: <linux-arm-msm+bounces-90953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EComBKvteWkF1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:06:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1BE9FEDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0AB4302D0AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB412C3268;
	Wed, 28 Jan 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtV4GQUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9B20DD52;
	Wed, 28 Jan 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598269; cv=none; b=Sn5sCPb+5X87SetNhdUD5cA8tMVOgbiwgTyq2WQBLwyhFTq2BZZXWL4natrNpkJ/8rRrbVO2I/R/bPWCDTHIEi0lbGkTRw6T8/kR9dd8904RI6lIOdguxqSXkZshprGYZQ3e+wSZ6GWjx+GBh090WrBpfxz/9fHzl46dD4lPAxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598269; c=relaxed/simple;
	bh=7/uozxFIxOmCH7mbpkX5r5jLjm4gescIxl6O5bSGMoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaRgCB8DHzVIhb/hK48+OrplVOvzNTBDutzE2eTbj3iVgFtLJz/7mz3poerCQg9ySaMdC7HWX5Of3UMcMiw/y9O8kT8JJbXm6GTobvO6K+7KfH9hOMDquHzjdAoCLP8OQufYsb+jn8gi9fQMf9xPCkhBEI4ZDjnkDgxAlpOTtJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtV4GQUs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9542EC4CEF1;
	Wed, 28 Jan 2026 11:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598269;
	bh=7/uozxFIxOmCH7mbpkX5r5jLjm4gescIxl6O5bSGMoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtV4GQUs7l23olpknFcXx1EkC9GAC5i2rZoYJT1mzmyM2w+6+zOURu+OGtDGJNLe6
	 mtJwMYS4UVX7pg/FECkf9e4QlS1FdMLJWiSG8zSI9wdybnoxv1EtO+yq13qqwAMQgB
	 RX+ZxtGjrL3dslyd3mimFLvbfdQh9eNpYVRXkJ5twX9ASGA/xhSNsojCYmf9Nc4l67
	 VzE7cPYVKq9/dpecPtdK5g49Elf/JRl61iOxwTB+aBfNtJ/OEb4jpzf60/pzYD8bYN
	 wU7ZqgbiXpyQQgocdOJ9+8ld0l1FS76IsUXP9MWzNuXYfeAHUeu1oVO1n6tGDvuEoc
	 CI9t7mM8cOWDg==
Date: Wed, 28 Jan 2026 12:04:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <20260128-daft-seriema-of-promotion-c50eb5@quoll>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <20260128-enable-ufs-ice-clock-scaling-v4-2-260141e8fce6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-enable-ufs-ice-clock-scaling-v4-2-260141e8fce6@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90953-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D1BE9FEDA
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:16:41PM +0530, Abhinaba Rakshit wrote:
>  	struct qcom_ice *engine;
> +	struct dev_pm_opp *opp;
> +	int err;
> +	unsigned long rate;
>  
>  	if (!qcom_scm_is_available())
>  		return ERR_PTR(-EPROBE_DEFER);
> @@ -584,6 +651,46 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	if (IS_ERR(engine->core_clk))
>  		return ERR_CAST(engine->core_clk);
>  
> +	/* Register the OPP table only when ICE is described as a standalone

This is not netdev...

> +	 * device node. Older platforms place ICE inside the storage controller
> +	 * node, so they don't need an OPP table here, as they are handled in
> +	 * storage controller.
> +	 */
> +	if (of_device_is_compatible(dev->of_node, "qcom,inline-crypto-engine")) {

Just add additional argument to qcom_ice_create().

> +		/* OPP table is optional */
> +		err = devm_pm_opp_of_add_table(dev);
> +		if (err && err != -ENODEV) {
> +			dev_err(dev, "Invalid OPP table in Device tree\n");
> +			return ERR_PTR(err);
> +		}
> +		engine->has_opp = (err == 0);
> +
> +		if (!engine->has_opp)
> +			dev_info(dev, "ICE OPP table is not registered\n");
> +	}

Best regards,
Krzysztof


