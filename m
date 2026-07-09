Return-Path: <linux-arm-msm+bounces-117850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FTgsNOw9T2rkcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:21:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A172D122
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:21:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HE50AB6T;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117850-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117850-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E447B3014242
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C1E3B775E;
	Thu,  9 Jul 2026 06:21:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E73ABD8E;
	Thu,  9 Jul 2026 06:21:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578084; cv=none; b=GdzVtGqi269yqvFP/QYPeFiQWsgA5xhFSda5jholkqH3eaYKHs9ODQT7G+yE4IMWF3Xr2eEnTIZDfC2u4zhZUI1urv/RXM/Aa1zqgd2WhN6fCM8WRtFTlGUrMMY6qsNoQjXVTkBlPqyYPEJBpP/KdjbbvWTPhvqKWk3lLbiaVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578084; c=relaxed/simple;
	bh=grAu5E6GfaofHrek+v2aH9VBcsjYoFThFsuqz8IEfOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbwVnsG1PSi5HYQ7xX8rGG3mYHiHUteyVoiqM31wtT9frUfw/ojbxAaRYmaSLmmA5iVkbAogfKI6hqID/wkJhIRfkItnKwvMGTwfrnGi5rCqrLBav5qXe6N22SgNR39KxoTp78AboTsCMdlFy+FSFHFCC35SoX4w6XpZ3LdJ5mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HE50AB6T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0951F000E9;
	Thu,  9 Jul 2026 06:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783578083;
	bh=avnLObW5dxVopVTUHmZJmNzAyLLSH95SmjofjaiSK/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HE50AB6T6u8vIVbIcCz6uZe8Kj3T1R1zz8vsHh11DaO/+G75qD99OSEHjxbwRnon6
	 77VNDQDXMACMZydcRTx4NGDbjjU6OpoalrqW2ZFiW7vtb7jmazsxcfPTzv1Gr/pPwB
	 0BdHltp8Hm0im/kYSM/tIZrcc4c35KyH+DOwx1dH9vzohc2yZUp5WfbX4Flmgd7oi6
	 eyVvo/7wAVeX9Qy+CFYKBt+X8Reh0XPm3mGVzEUIHdLxq8MwksQpHMqVT0d5VAG5jB
	 QyS3NXDeoLzb+y/cUAbhNX2AFcxuAA3ejWNN3dx94ugUtdGPcb9cCinT9jLA7A6QgJ
	 Ti1eRvYeQMTAw==
Date: Thu, 9 Jul 2026 08:21:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mhi@lists.linux.dev
Subject: Re: [PATCH v6 5/7] bus: mhi: Load DDR training data using device
 serial number
Message-ID: <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kishore.batta@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117850-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,2bhq4vzuqlnw:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C88A172D122

On Wed, Jul 01, 2026 at 04:07:39PM +0530, Kishore Batta wrote:
> Devices may provide device specific DDR training data that can be reused
> across boot to avoid retraining and reduce boot time. The Sahara driver
> currently always falls back to the default DDR training image, even when
> serial specific training data is available.
> 
> Extend the firmware loading logic for the DDR training image to first
> attempt loading a per-device image dervied from the device serial number.
> If the serial-specific image is not present, fall back to the existing
> default image, preserving current behavior.
> 
> This allows reuse of previously generated DDR training data when available,
> while keeping the existing training flow unchanged for devices without
> saved data or for all other firmware images.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
> index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
> @@ -59,6 +59,7 @@
>  #define SAHARA_RESET_LENGTH		0x8
>  #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>  #define SAHARA_MEM_READ64_LENGTH	0x18
> +#define SAHARA_DDR_TRAINING_IMG_ID	34
>  
>  struct sahara_packet {
>  	__le32 cmd;
> @@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  		return 0;
>  	}
>  
> +	/* DDR training special case: Try per-serial number file first */
> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
> +		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
> +
> +		fw_path = kasprintf(GFP_KERNEL,
> +				    "qcom/%s/mdmddr_0x%x.mbn",
> +				    context->fw_folder, serial_num);
> +		if (!fw_path)
> +			return -ENOMEM;
> +
> +		ret = firmware_request_nowarn(&context->firmware,
> +					      fw_path,
> +					      &context->mhi_dev->dev);
> +		kfree(fw_path);
> +
> +		if (!ret) {
> +			context->active_image_id = image_id;
> +			return 0;
> +		}
> +	}
> +
>  	/*
>  	 * This image might be optional. The device may continue without it.
>  	 * Only the device knows. Suppress error messages that could suggest an
> @@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  				      context->image_table[image_id],
>  				      &context->mhi_dev->dev);
>  	if (ret) {
> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
> +		dev_dbg(&context->mhi_dev->dev,
> +			"request for image id %d / file %s failed %d\n",

Spurious change.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

