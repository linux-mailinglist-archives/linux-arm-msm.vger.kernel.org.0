Return-Path: <linux-arm-msm+bounces-112397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rG9lCvA/KWoDTAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:44:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A9668664
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:43:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l48MXXUe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112397-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112397-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB31314FEAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CF13EDE53;
	Wed, 10 Jun 2026 10:40:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056D372B5E;
	Wed, 10 Jun 2026 10:40:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088035; cv=none; b=ZRl+EXwgx6kWzePNg/jFXZuVMowyeHvtjnA1MYv5o2hemOcPE/PoGSVJwHEcm+IcQVAv0dEUUUejGjqm1vF11hCkXSVFpOQnWwEFrZY+egcRrBqLyU2PsbdEmBhSh+6RDBNRkNabhNcCDkBKUmIyo0zmORoOt8BM6poidbo9bYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088035; c=relaxed/simple;
	bh=Q+ghOmwb6ca6yzsNslfSKHa+AkbW/ej9Rfb3xdIxs34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ht2xS6yYBx6TcdvTB1OE35k9yKcyLb2k1dFVY9MXG55eUnwaHgw3PJbXtC9OihM+XM8eBjo4ugppRDdRctbdSsbVdqeHLKNdK9HQ9ILkRBnsmt3BxOS957HjCCBcdtKyRWOJU6yNl+vOG5IasVnEwXo6rz41GOhOiEBMqDklqk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l48MXXUe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B821F00893;
	Wed, 10 Jun 2026 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781088033;
	bh=y3zogafe8Nfrcsf+kJY2CSo0RioNu8OlWnXsDWbzwH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l48MXXUe0y24pBLizMG9gqp66VI1e/D2JJv5j/aIRzXyludmgTo87u324IoAENt6q
	 Gfvw07hIK7TV8Apt9wCMJsvUMxZEFeD+WZh2C830e4uxEmX41LNL/GDyJ+TCbExwwe
	 FIxkN74Z6mJxMnVOPg6+Hdg6NyYua9PD5kVDrZU1rUPsCjtAtTJH7c/QrRDC9Gdveb
	 woUCW5EVKYd6GQxZfz6WdXd87ngblNcXF8V6PAro/fBwWxmcfnFrocnKeQMvIHIWVK
	 A5WTUmwi2LF/6Xy54jJZbJFDvZGx8PloA3L77zrqePoM2aVHoS9Ttq43YGOWesFuVU
	 mmFN0yFX1AQIQ==
Date: Wed, 10 Jun 2026 12:40:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>, Harshal Dev <harshal.dev@oss.qualcomm.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <mcqrm4pwziflqomw22gepqusc7jdlb2foslcfvtjufuyyoslb7@37olf54qxtfv>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112397-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[37olf54qxtfv:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A9A9668664

On Tue, Jun 09, 2026 at 03:17:23AM +0530, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> during device probe. Attach the OPP-table with only the ICE
> core clock. Since, dtbinding is on a transition phase to include
> iface clock and clock-names, attaching the opp-table to core clock
> remains optional such that it does not cause probe failures.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock based on the target frequency provided and if a valid
> OPP-table is registered. Use round_ceil passed to decide on the
> rounding of the clock freq against OPP-table. Clock scaling is
> disabled when a valid OPP-table is not registered.
> 
> This ensures when an ICE-device specific OPP table is available,
> use the PM OPP framework to manage frequency scaling and maintain
> proper power-domain constraints.
> 
> Also, ensure to drop the votes in suspend to prevent power/thermal
> retention. Subsequently restore the frequency in resume from
> core_clk_freq which stores the last ICE core clock operating frequency.
> 
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/soc/qcom/ice.h |  2 ++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 5f20108aa03ebe9a47a10fba9afde420add0f34a..519d08c4727a6cb2dc5991216a2c042ed6218857 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/xarray.h>
> +#include <linux/pm_opp.h>
>  
>  #include <linux/firmware/qcom/qcom_scm.h>
>  
> @@ -113,6 +114,8 @@ struct qcom_ice {
>  	bool use_hwkm;
>  	bool hwkm_init_complete;
>  	u8 hwkm_version;
> +	unsigned long core_clk_freq;
> +	bool has_opp;
>  };
>  
>  static DEFINE_XARRAY(ice_handles);
> @@ -315,6 +318,10 @@ int qcom_ice_resume(struct qcom_ice *ice)
>  	struct device *dev = ice->dev;
>  	int err;
>  
> +	/* Restore the ICE core clk freq */

Redundant comment.

> +	if (ice->has_opp && ice->core_clk_freq)

Can core clk be 0 if OPP is used?

> +		dev_pm_opp_set_rate(ice->dev, ice->core_clk_freq);
> +
>  	err = clk_prepare_enable(ice->core_clk);
>  	if (err) {
>  		dev_err(dev, "Failed to enable core clock: %d\n", err);
> @@ -335,6 +342,11 @@ int qcom_ice_suspend(struct qcom_ice *ice)
>  {
>  	clk_disable_unprepare(ice->iface_clk);
>  	clk_disable_unprepare(ice->core_clk);
> +
> +	/* Drop the clock votes while suspend */

Redundant comment.

> +	if (ice->has_opp)
> +		dev_pm_opp_set_rate(ice->dev, 0);
> +
>  	ice->hwkm_init_complete = false;
>  
>  	return 0;
> @@ -560,6 +572,51 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>  }
>  EXPORT_SYMBOL_GPL(qcom_ice_import_key);
>  
> +/**
> + * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
> + * @ice: ICE driver data
> + * @target_freq: requested frequency in Hz
> + * @round_ceil: when true, selects nearest freq >= @target_freq;
> + *              otherwise, selects nearest freq <= @target_freq
> + *
> + * Selects an OPP frequency based on @target_freq and the rounding direction
> + * specified by @round_ceil, then programs it using dev_pm_opp_set_rate(),
> + * including any voltage or power-domain transitions handled by the OPP
> + * framework. Updates ice->core_clk_freq on success.
> + *
> + * Return: 0 on success; -EOPNOTSUPP if no OPP table; or error from

s/error/errno

> + *         dev_pm_opp_set_rate()/OPP lookup.
> + */
> +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
> +		       bool round_ceil)
> +{
> +	unsigned long ice_freq = target_freq;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	if (!ice->has_opp)
> +		return -EOPNOTSUPP;
> +
> +	if (round_ceil)
> +		opp = dev_pm_opp_find_freq_ceil(ice->dev, &ice_freq);
> +	else
> +		opp = dev_pm_opp_find_freq_floor(ice->dev, &ice_freq);
> +
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	dev_pm_opp_put(opp);
> +
> +	ret = dev_pm_opp_set_rate(ice->dev, ice_freq);
> +	if (ret) {
> +		dev_err(ice->dev, "Unable to scale ICE clock rate\n");
> +		return ret;
> +	}
> +	ice->core_clk_freq = ice_freq;
> +
> +	return ret;

return 0;

> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
> +
>  static struct qcom_ice *qcom_ice_create(struct device *dev,
>  					void __iomem *base)
>  {
> @@ -738,6 +795,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  	unsigned long phandle = pdev->dev.of_node->phandle;
>  	struct qcom_ice *engine;
>  	void __iomem *base;
> +	int err;
>  
>  	guard(mutex)(&ice_mutex);
>  
> @@ -756,6 +814,41 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  		return PTR_ERR(engine);
>  	}
>  
> +	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
> +	if (err && err != -ENOENT) {
> +		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
> +		/* Store the error pointer for devm_of_qcom_ice_get() */
> +		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
> +		return err;
> +	}
> +
> +	/* OPP table is optional */
> +	err = devm_pm_opp_of_add_table(&pdev->dev);
> +	if (err && err != -ENODEV) {
> +		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> +		/* Store the error pointer for devm_of_qcom_ice_get() */
> +		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
> +		return err;
> +	}
> +
> +	/*
> +	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
> +	 * -ENODEV when no OPP table is present in DT, which is not treated
> +	 * as an error. Therefore, track successful OPP registration only
> +	 * when err is not -ENODEV.
> +	 */
> +	if (err == -ENODEV)
> +		dev_info(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");

dev_dbg() please. No need to spam old DTs.

> +	else
> +		engine->has_opp = true;
> +
> +	/*
> +	 * Store the core clock rate for suspend resume cycles,
> +	 * against OPP aware DVFS operations. core_clk_freq will
> +	 * have a valid value only for non-legacy bindings.

use full 80 column width for comments.

> +	 */
> +	engine->core_clk_freq = clk_get_rate(engine->core_clk);

Why can't you conditionally cache the freq by moving it to the above else
condition?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

