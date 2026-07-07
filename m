Return-Path: <linux-arm-msm+bounces-117063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QmSoIwBHTGqJigEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 02:23:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9617167A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 02:23:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Zmqoq15h;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117063-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117063-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D61CD301E7C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 00:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297EC1684BE;
	Tue,  7 Jul 2026 00:23:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06422301;
	Tue,  7 Jul 2026 00:23:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783383805; cv=none; b=IcLyBBA5cY2qM4TTqMWLlhCfIXkbJnPhL4XqUCEBIIzEbLMYY/v1VK1sJdD0g1RP7VNVwEDNobJEMkVBW2IxomftqDL9BHTQ0UxU6+Dbet7ANS3I1lQ9nUcg54zcI4Lb0WERj3KKQGnHWd9qN4qTqkElf1nozJqtqYAtXgisXeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783383805; c=relaxed/simple;
	bh=KESq28kjthSmS4J5zfWb3lJIRiCvXUIXKjxITab28ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV6+GS5OsCjcwbwAHc7LkpZQ9dQnZmuUBHmuahRd8yAa5q47eILAPzGj/eRBmo+72vtASdaFeGOYXDMglDg2hF2+dkgruszJdbzRypY5XU//2pMKXFLiZEZpJMJUBZn9yWi2bgWjUV4ZohKm64CrYBUZmRPv7mW3pg5sYzDzov0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zmqoq15h; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DB51F000E9;
	Tue,  7 Jul 2026 00:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783383803;
	bh=1HDrKCWsJjNzEJihGkMggdF4BVdh8kzeKEp2eMd1tO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zmqoq15hcmgBH1RRCU8oPELos4iqYxq/iFRTLwXvMUPapkLAfpnnUI+akAYezrvvG
	 jwnn9tlizYYeXdnaFStjVcRr76hOrq71mzPUi1/MgEtqk26dxAywHnLvW69QstxVkK
	 3PEAY1mZedsTQr45U8LLLwOOymLZBvjhCNu+OMN0iNiWPnrQ6kTYEXfmTahK73WCAu
	 QDmrh+BwPOly3LIVHfPrh2aJvRfmvW4Z4GCaLP3BBcJ0uvojnd8Doz+VUZX7ynvF4B
	 Fe02jS78JmYv3IiA71DTf1QPQIq1mvEVqiRsOmmJDpB8FaRZx6SRcok9S169/WiQO6
	 JUtS5WkEB7TWg==
Date: Mon, 6 Jul 2026 19:23:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
Message-ID: <akxG4bzq7qAprz0M@baldur>
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330165237.101045-2-mailingradian@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@linaro.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117063-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF9617167A2

On Mon, Mar 30, 2026 at 12:52:36PM -0400, Richard Acayan wrote:
> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> the first 6 CPUs are in the little cluster and the next 2 are in the big
> cluster. Define the clusters in the match data and define the different
> cluster configuration for SDM670.
> 
> Currently, this tolerates linking to any CPU in a given cluster.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/thermal/qcom/lmh.c | 54 ++++++++++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
> index 3d072b7a4a6d..81ab2f0be9c8 100644
> --- a/drivers/thermal/qcom/lmh.c
> +++ b/drivers/thermal/qcom/lmh.c
> @@ -30,14 +30,17 @@
>  
>  #define LMH_REG_DCVS_INTR_CLR		0x8
>  
> -#define LMH_ENABLE_ALGOS		1
> -
>  struct lmh_hw_data {
>  	void __iomem *base;
>  	struct irq_domain *domain;
>  	int irq;
>  };
>  
> +struct lmh_soc_data {
> +	bool enable_algos;
> +	unsigned int clus1_start_idx;
> +};
> +
>  static irqreturn_t lmh_handle_irq(int hw_irq, void *data)
>  {
>  	struct lmh_hw_data *lmh_data = data;
> @@ -100,8 +103,8 @@ static int lmh_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	struct device_node *cpu_node;
>  	struct lmh_hw_data *lmh_data;
> +	const struct lmh_soc_data *match_data;
>  	int temp_low, temp_high, temp_arm, cpu_id, ret;
> -	unsigned int enable_alg;
>  	u32 node_id;
>  
>  	if (!qcom_scm_is_available())
> @@ -121,6 +124,11 @@ static int lmh_probe(struct platform_device *pdev)
>  	cpu_id = of_cpu_node_to_id(cpu_node);
>  	of_node_put(cpu_node);
>  
> +	if (cpu_id < 0) {
> +		dev_err(dev, "Wrong CPU id associated with LMh node\n");
> +		return -EINVAL;
> +	}
> +
>  	ret = of_property_read_u32(np, "qcom,lmh-temp-high-millicelsius", &temp_high);
>  	if (ret) {
>  		dev_err(dev, "missing qcom,lmh-temp-high-millicelsius property\n");
> @@ -139,26 +147,16 @@ static int lmh_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	/*
> -	 * Only sdm845 has lmh hardware currently enabled from hlos. If this is needed
> -	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
> -	 * of a dt match table.
> -	 */
> -	if (cpu_id == 0) {
> +	match_data = of_device_get_match_data(dev);
> +	if (cpu_id < match_data->clus1_start_idx)
>  		node_id = LMH_CLUSTER0_NODE_ID;
> -	} else if (cpu_id == 4) {
> +	else
>  		node_id = LMH_CLUSTER1_NODE_ID;
> -	} else {
> -		dev_err(dev, "Wrong CPU id associated with LMh node\n");
> -		return -EINVAL;
> -	}
>  
>  	if (!qcom_scm_lmh_dcvsh_available())
>  		return -EINVAL;
>  
> -	enable_alg = (uintptr_t)of_device_get_match_data(dev);
> -
> -	if (enable_alg) {
> +	if (match_data->enable_algos) {
>  		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
>  					 LMH_NODE_DCVS, node_id, 0);
>  		if (ret)
> @@ -231,10 +229,26 @@ static int lmh_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct lmh_soc_data sdm670_lmh_data = {
> +	.enable_algos = true,
> +	.clus1_start_idx = 6,
> +};
> +
> +static const struct lmh_soc_data sdm845_lmh_data = {
> +	.enable_algos = true,
> +	.clus1_start_idx = 4,
> +};
> +
> +static const struct lmh_soc_data sm8150_lmh_data = {
> +	.enable_algos = false,
> +	.clus1_start_idx = 4,
> +};
> +
>  static const struct of_device_id lmh_table[] = {
> -	{ .compatible = "qcom,sc8180x-lmh", },
> -	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
> -	{ .compatible = "qcom,sm8150-lmh", },
> +	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
> +	{ .compatible = "qcom,sdm670-lmh", .data = &sdm670_lmh_data },
> +	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
> +	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_lmh_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, lmh_table);
> -- 
> 2.53.0
> 

