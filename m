Return-Path: <linux-arm-msm+bounces-102937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INimH03T3GmcWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:28:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC13EB4AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 771723012246
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBBE3BFE3A;
	Mon, 13 Apr 2026 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCPJ59tE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841C23AE87;
	Mon, 13 Apr 2026 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079621; cv=none; b=DfAw6B62e4ZOvjeOyzPDuTcUFcpWg5MWpsMZCtNq3/maWnfw2ZrG6IUPA85xZkyZEfRdO2oW4k0Zp8MWuRIM37qZvJ8qIIkTsrp/jywG6uuN/uMKyFGWwoPhfuNsnL2eA2Z6KDh4VDJCTFB44QgK0gjjjATwSjGyUxJHhv1bnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079621; c=relaxed/simple;
	bh=e11dG/1PaJPNgRXjK/Zx+/DeJ/ARnA1AtRogWkYiVkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lncKBK3mZ5zUrqRGyxMMKUkM8+mRsERuCr+pTodOXYbzHuJGoXtZ8S8FFzlLuH3l+qPX/gGnAMpGYahsE4RRe9DdiO+6rw+LnKRFJvKOuhkJKij2ReNfUSuvb4slJH/UqXU+Xolgv7azZQjILQXmuVXK9/Z90vyQ9EKFTPMdXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCPJ59tE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8DDC116C6;
	Mon, 13 Apr 2026 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776079621;
	bh=e11dG/1PaJPNgRXjK/Zx+/DeJ/ARnA1AtRogWkYiVkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCPJ59tEA7udDDdQaPHGGIh0z2VzXgSzuJW5+KEykkNj8I/FwriVWi2P3ANWydQvb
	 Dd1CWPDtQfaAgr2A+BQtrJ2ibklTgojb/og01i8N49cfu456g8J9Qt7fL6PcGMhLaG
	 7FolTa5snB5gn3Koz2AyYLyZ1F0nA2Z9ZhZ4xHW5Pc+BY7x5MJiTlYDH56h3w06/vL
	 kwKoiGVKvE1+IGb/sTYtKWGqgCeB7ZTUqmYoDqwg/JSmpnbgWdKDnVdpB2i7qZM9JD
	 6/XS1N8xNGhfD/AbCKoHH+HNveJvQrNbBvojAMi5WzmaIBFAO/qAaPLHmcv264YIYe
	 HS+1HKtk2DO/w==
Date: Mon, 13 Apr 2026 16:56:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
Message-ID: <2sykuv6r643v3i6ymdoevzohoxdmgrrodvgpbaystskz7fwgun@fd3p7gcso252>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102937-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25CC13EB4AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 12:01:44PM +0530, Kishore Batta wrote:
> The Sahara driver currently selects firmware image tables using
> scattered, device specific conditionals in the probe path, making the
> logic harder to  follow and extend.
> 
> Refactor firmware image table selection into a single, explicit probe-time
> mechanism by introducing a variant table that captures device matching,
> firmware image tables, firmware folder names, and streaming behavior in
> one place.
> 
> This centralizes device specific decisions, simplifies the probe logic,
> and avoids ad-hoc conditionals while preserving the existing behavior for
> all supported AIC devices.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -180,6 +180,16 @@ struct sahara_context {
>  	u32				read_data_length;
>  	bool				is_mem_dump_mode;
>  	bool				non_streaming;
> +	const char			*fw_folder;
> +};
> +
> +struct sahara_variant {
> +	const char *match;
> +	bool match_is_chan;

This name makes no sense.

- Mani

> +	const char * const *image_table;
> +	size_t table_size;
> +	const char *fw_folder;
> +	bool non_streaming;
>  };
>  
>  static const char * const aic100_image_table[] = {
> @@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
>  	[78] = "qcom/aic200/pvs.bin",
>  };
>  
> +static const struct sahara_variant sahara_variants[] = {
> +	{
> +		.match = "AIC100",
> +		.match_is_chan = false,
> +		.image_table = aic100_image_table,
> +		.table_size = ARRAY_SIZE(aic100_image_table),
> +		.fw_folder = "aic100",
> +		.non_streaming = true,
> +	},
> +	{
> +		.match = "AIC200",
> +		.match_is_chan = false,
> +		.image_table = aic200_image_table,
> +		.table_size = ARRAY_SIZE(aic200_image_table),
> +		.fw_folder = "aic200",
> +		.non_streaming = false,
> +	}
> +};
> +
>  static bool is_streaming(struct sahara_context *context)
>  {
>  	return !context->non_streaming;
>  }
>  
> +static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
> +							  const struct mhi_device_id *id)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
> +		const struct sahara_variant *v = &sahara_variants[i];
> +
> +		if (v->match_is_chan) {
> +			if (id && id->chan && !strcmp(id->chan, v->match))
> +				return v;
> +		} else {
> +			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
> +			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
> +				return v;
> +		}
> +	}
> +	return NULL;
> +}
> +
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  {
>  	int ret;
> @@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
>  
>  static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>  {
> +	const struct sahara_variant *variant;
>  	struct sahara_context *context;
>  	int ret;
>  	int i;
> @@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  	if (!context->rx)
>  		return -ENOMEM;
>  
> -	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
> -		context->image_table = aic200_image_table;
> -		context->table_size = ARRAY_SIZE(aic200_image_table);
> -	} else {
> -		context->image_table = aic100_image_table;
> -		context->table_size = ARRAY_SIZE(aic100_image_table);
> -		context->non_streaming = true;
> -	}
> +	variant = sahara_select_variant(mhi_dev, id);
> +	if (!variant)
> +		return -ENODEV;
> +
> +	context->image_table = variant->image_table;
> +	context->table_size = variant->table_size;
> +	context->non_streaming = variant->non_streaming;
> +	context->fw_folder = variant->fw_folder;
>  
>  	/*
>  	 * There are two firmware implementations for READ_DATA handling.
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

