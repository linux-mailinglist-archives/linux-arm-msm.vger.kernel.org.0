Return-Path: <linux-arm-msm+bounces-112973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MaKeOvaELGoeSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 00:15:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4675567CB07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 00:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S4FqT1AP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E173320FFB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 22:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745C23A4F46;
	Fri, 12 Jun 2026 22:15:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65A5C613;
	Fri, 12 Jun 2026 22:15:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302516; cv=none; b=n+7y7jTQoOkGDkg5kHUnTX8r5697u/CAslVQwd+S52Y1PTCRiMRtFR7D190oxkDOVVNuvQ+QDy/jD+wjW7eS1SQFdlmQI4cX5aZcwd6uV2kf7WqGTyZcKRQL2uKU4Z+3tt7DUWtpvzBozHtOUZAQeL0NExIiypO3YU/pjdoWsWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302516; c=relaxed/simple;
	bh=M6A4osexzl0pYDQkXp6+QRk3tm8ApUadRZ2JMct20Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lo+u/FF8Fw932syl5uR++2NpmuxNXNOUtC2uGWkcgZ4e1nWzG1UphudFhwLdhjjxGF6G8kkSHPchkyo05EIxAf0KXgOObRZhPEwwXfV+pN5OgF4pZ9ltAdJ5wWceNCj2vFwzhXEFbTCbjDJoryJgul412oaiv8Ll26G+Qk5ZIGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4FqT1AP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11F81F00A3A;
	Fri, 12 Jun 2026 22:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302515;
	bh=bjkKf0aI+XhWJ8bAQuSBUT5Ty3/af4+BnYhOymsGJw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4FqT1AP3f8JKIRWvy5RMGVJW3UMjWLFgBRhtsKgfAg3F0tVikdcOiHcvMtST3Yc0
	 kJg591lBsrfbSHCb9/Ul0e5lJxDZvTGpr6UMt2c/ozbbt0C5G4Fce1Kqsb75ePDmRr
	 XcXFWIpfzB4EqCii0B/oDbO1gVYaizhVBJfIquOfqgRIIVXFKvk7yVs6EX+YIXybvQ
	 yRMWehOe7j61QthTn0vs+Kfzu+u9V/gwKTd/dCYQAwM0U7Y0RdeTpH4bCyqNwiXPSB
	 Hb6KpZgEWc6V4gAc24Cn5kW5gltOuV6WZH/GLo+Ky0DHMyq0BWiBMng4+WqE5DkBet
	 b5pyALNhjhOmg==
Date: Fri, 12 Jun 2026 17:15:14 -0500
From: Rob Herring <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for Hawi SoC
Message-ID: <20260612221514.GA1951714-robh@kernel.org>
References: <20260506110226.2256249-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506110226.2256249-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112973-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4675567CB07

On Wed, May 06, 2026 at 04:32:26PM +0530, Mukesh Ojha wrote:
> Hawi uses the same protection domain layout as Kaanapali, so reuse the
> kaanapali_domains table. Also add the missing adsp_ois_pd entry (OIS
> protection domain, instance_id 74) to kaanapali_domains, which is
> required by both Kaanapali and Hawi.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 7bb14c20ab5d..b99718e25f2f 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -266,6 +266,12 @@ static const struct qcom_pdm_domain_data adsp_charger_pd = {
>  	.services = { NULL },
>  };
>  
> +static const struct qcom_pdm_domain_data adsp_ois_pd = {
> +	.domain = "msm/adsp/ois_pd",
> +	.instance_id = 74,
> +	.services = { NULL, },
> +};
> +
>  static const struct qcom_pdm_domain_data adsp_root_pd = {
>  	.domain = "msm/adsp/root_pd",
>  	.instance_id = 74,
> @@ -370,6 +376,7 @@ static const struct qcom_pdm_domain_data *glymur_domains[] = {
>  
>  static const struct qcom_pdm_domain_data *kaanapali_domains[] = {
>  	&adsp_audio_pd,
> +	&adsp_ois_pd,
>  	&adsp_root_pd,
>  	&adsp_sensor_pd,
>  	&cdsp_root_pd,
> @@ -581,6 +588,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{ .compatible = "qcom,eliza", .data = sm8550_domains, },
>  	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
>  	{ .compatible = "qcom,glymur", .data = glymur_domains, },
> +	{ .compatible = "qcom,hawi", .data = kaanapali_domains, },

This is not documented. I couldn't find any patch adding it. Please 
submit one.

Rob

