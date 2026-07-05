Return-Path: <linux-arm-msm+bounces-116613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j0RMDBXaSmqdIgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 00:26:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540270BA09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 00:26:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Oc2EpdS/";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116613-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116613-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26F8530053D7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 22:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10B3370D7D;
	Sun,  5 Jul 2026 22:26:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705832FE56E;
	Sun,  5 Jul 2026 22:26:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783290386; cv=none; b=PJD7No+Xc00xiNdxNwL8WZBjk5rL8HIfA6czZeD0vunUoqcrWGPld3pgr6kNUdeUB7dWbWW8BRLgR10mdSevxOZSMYZfE4uTESZD30um9mmk86MFG8zGp+TjsQMqT7gNoevyZPLzN/jqyZ/T+lOey6TVXRx8Uz0opGEmiBzZIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783290386; c=relaxed/simple;
	bh=Li3zyx8I9449OSxEiPYCCAq4TNpMSTfm3cYi6CSjwgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkxhO7+Rru0SqSQ3JmcZ7j2/j2qGPTCkyg6XFEGhBaLpUdsgBM6b4gZlOwvdtXHFGRHPPgpR4ddauQoHvN51n/NA1Eo56KQW0mQGaWHJLz758492fF3li5zLJbj91ZiXYph/pQU6KFUkhVcBDs0Nn0V+LbZv+acn94RVttPEQwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oc2EpdS/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962BF1F000E9;
	Sun,  5 Jul 2026 22:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783290385;
	bh=XKHn5GQOs/hGw34f8hdEnhHa/THNjs4DDuEXGF5lsqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oc2EpdS/geufNhuSK4NmGv7bWrgjd9DJc7x51qAPx9dNV6ia5q5wqCtITDwGlyUKP
	 ZbtHI8Em5dCRc7smQWqeIIhO6ofKmxHQ1PdtoHcuoQwFit59qzq7ggCfojcTJDsF83
	 HJ722qdrGmep31f6roZbTdBovtbU4gnqndn7c6Jeqb2hm7YYJwpVpaPKvrtk1JECBl
	 rHim1LVUbpfllt0U8eK0iu0I2Uof2Z2/xxieKtYEXS9yextu7V0z689SRcjoCB3DPx
	 6yhNt3ob+z0mPl+mymYiLRZXwDEmlyMuFNrouFycSbtCEwOw6O9hKYQoa3k4607YaD
	 7yJPHDNPDk5Dw==
Date: Sun, 5 Jul 2026 17:26:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 force shmbridge creation
Message-ID: <akrWGWtPpIJhL0pF@baldur>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116613-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,qualcomm.com:server fail,vger.kernel.org:server fail,baldur:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ananthu.cv@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7540270BA09

On Fri, Jul 03, 2026 at 05:31:11AM -0700, Ananthu C V wrote:
> Most Qualcomm platforms feature Gunyah hypervisor, which typically
> handles Stage 2 IOMMU configuration.

This statement is true, but the IOMMU isn't involved in the interaction
between OS and TZ, so it doesn't add value to your problem description.

> Additionally, SHM bridge setup is required to enable memory protection
> for both remoteproc metadata and its memory regions.

"Additionally"? Isn't this the entire problem?

> When the aforementioned hypervisor is absent, the operating system
> must perform these configurations instead.

Please rephrase these three sentences to make sure we have a clear
problem description.

Then, at this point in the text you have established the problem, so
break the paragraph with an empty line.

> We've been relying on the iommu property being present for this, but
> for remoteprocs that are already running like SoCCP the mappings are
> already in place, and any attempt to recreate them while active would
> lead to smmu faults and a non-functional remoteproc.

This is a significant detail. Please expand the description around
"attempt to recreate them while active" to ensure that it's clear to the
reader what the problem (what does it mean that mappings are already in
place).

Then another </p><p> here, as we're once again in need of some breathing
and thinking-room.

> Fix this by adding a needs_tzmem
> flag which ensures tzmem and SHM bridge setup is performed independent to
> the iommu property being present.

"flag which ensures...", the flag doesn't ensure anything, it is
propagates as an alternative trigger to the PAS helpers to ensure that
the shmbridge is established.

Regards,
Bjorn

> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 60a4337d9e51..cd7273fbcf98 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -61,6 +61,7 @@ struct qcom_pas_data {
>  	bool region_assign_shared;
>  	int region_assign_vmid;
>  	bool early_boot;
> +	bool needs_tzmem;
>  };
>  
>  struct qcom_pas {
> @@ -914,8 +915,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  		goto remove_ssr_sysmon;
>  	}
>  
> -	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> -	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
> +	pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>  
>  	if (desc->early_boot)
>  		pas->rproc->state = RPROC_DETACHED;
> @@ -1657,8 +1658,27 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
>  	.early_boot = true,
>  };
>  
> +static const struct qcom_pas_data glymur_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.dtb_firmware_name = "soccp_dtb.mbn",
> +	.pas_id = 51,
> +	.dtb_pas_id = 0x41,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.needs_tzmem = true,
> +};
> +
>  static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
> +	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
>  	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
>  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
>  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
> 
> -- 
> 2.43.0
> 

