Return-Path: <linux-arm-msm+bounces-116616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gHXqEqfrSmoRJwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 01:41:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4070BC2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 01:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="g/LufPGP";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116616-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116616-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C30F3009519
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 23:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849D137204C;
	Sun,  5 Jul 2026 23:41:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBDA171CD;
	Sun,  5 Jul 2026 23:41:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783294883; cv=none; b=TTv0q4/QlDXRhxch2RN9iCRtFql1Hxaat9GL4VmuTb4cdWnYkpyppvURzQkmZlEg4glVta0oGO52AiWDfi01s6dV8BfK+okREykWRaE7SmWWN+Fr0x9uHj17lxT9DGx9X0IJR3RL1qvsY96cbStP30UkxCaC/Jnu045r/5AXNNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783294883; c=relaxed/simple;
	bh=j4UHXdIKS1X4jO8pcuQ4Vnfg6JT1EnD/XaqMHlRkFGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhpjuOGO1MuH5T9G01j+t1qQIBQtUuV5cCmNJTzznK1EKfhpgkK87IPBRbqUx8fPJ8nEQrr4hyqrNI1gMl+UbBrwQYNxrncz3G8FRzvVYC8JCTV4Ll0FGqx9nkunS+9U6lH95h94lM6Jw/SYIMvbk4vn4G5mvB+DbjKb+Uc4q/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/LufPGP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2B01F000E9;
	Sun,  5 Jul 2026 23:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783294882;
	bh=lBr6LGeQEfi/gguF0uhUwTMBWbLqEubQbfsnGeA9+84=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g/LufPGPrUTVjTHlUExUH+F0fz3BmbIVIFO5ClRj7004Zc6X+9uBcZcVoeD8bRuNy
	 C0irRqSX0mCOxQdIhuKrEeGjqaEzmIWFB3hGQjxSvz/FWEJRb0mZLN/ldUHJV1srSc
	 5iFL+KzHQBZL8A5J6LcF7bMuplf9fSlUfRsVP+A3kvUJYrbqIQ8dv5kCKwZh73/PSM
	 byIGWdGNPIy6dwJ91EYr7BqG3NTactYUA+m19U/XzKjPXxgxF4z3cW3diJNefUiEU+
	 WmpfAWwZsZrtir6FXIRjj5OwHB1pUdUnopxA+3flW6fBlaHZpUobTCR5055n3FX/LG
	 wHAarbj+OXFwQ==
Date: Mon, 6 Jul 2026 00:41:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Amit Kucheria
 <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>, David Collins
 <david.collins@oss.qualcomm.com>, Anjelique Melendez
 <anjelique.melendez@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v3 2/3] iio: adc: qcom-spmi-adc5-gen3: Remove an
 unnecessary print
Message-ID: <20260706004114.5bf9d5ba@jic23-huawei>
In-Reply-To: <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
	<20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116616-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AB4070BC2E

On Sun, 05 Jul 2026 22:23:34 +0530
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> devm_request_threaded_irq internally prints an error message using
> dev_err_probe in case of any errors. Remove the error print in the
> devm_request_threaded_irq failure path as it is not needed.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
On basis I might not be taking this through IIO.
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

> ---
>  drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> index c1962312afcd..74988040e6e5 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> @@ -793,9 +793,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
>  					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
>  					adc);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "Failed to request SDAM%d irq\n",
> -				     ADC5_GEN3_VADC_SDAM);
> +		return ret;
>  
>  	ret = adc5_get_fw_data(adc);
>  	if (ret)
> 


