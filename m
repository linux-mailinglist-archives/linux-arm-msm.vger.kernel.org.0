Return-Path: <linux-arm-msm+bounces-106063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEjmDxTn+mlIUAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:00:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F26FB4D6E70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9AB5300B8D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 07:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAED369972;
	Wed,  6 May 2026 07:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="Z5SXtAUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-13.smtp.spacemail.com (out-13.smtp.spacemail.com [63.250.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B736C582;
	Wed,  6 May 2026 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050829; cv=none; b=epYHDyo4WS1pP1CWWz1VR3YQTL2m30tCJ6j2LY4TiY6t+W29Y3SnRJon41bhS7XKwRLAkKy27kZbmx6rllfPk8N90kVYsTdXTLiIId1si8BgEalfpJwTqiIQnVPGrWcEYLIy/xgMDXtCsrYnQ9x1fohGpZ5Y+pZ/s31Ath3P2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050829; c=relaxed/simple;
	bh=DDF15fig5HtBB4tclAb/u/AQ4KrJU8SHxLxa1mKtko4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aM7qxZo/BiHeIwwKE/BKtz7W3Miwmw7LCah8j4EV04yKxbrVrQJrO2CAf+gtEJAVf+mbDh/W0ICiHcVxYVXCCK4lJtGImT7HzyDUrVPdSVafJls9xueRrjnkHWVZzfBOPi9SJsNPkhF4zlkt63z8R2v7xBn3pW0cOmGeA7MQNHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=Z5SXtAUM; arc=none smtp.client-ip=63.250.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Received: from shakti (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4g9R8y4x2Sz8sWS;
	Wed, 06 May 2026 07:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1778050818;
	bh=sn8dL4Ww0aZC3QoLFXZNQQRE4Tu2kQ1cejaqSf1FHCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5SXtAUMcHMb6c9BvVieH+WnfTuuiBwCmoMXyFstVH9Scf4OmVkXUVjAnD029OZJR
	 Z8QoxSqHSaC695T8noD2gR1q3I8XF5hRmaKhSF5KuJX//balBby21iiI0CL3w0O7Wc
	 xOAgDw1sMONpOAIY144sF33oC6YgztYBjvIJcd8P3gPM5zaJqnVqiYZO9+RLDlv4Zo
	 uOmC0TzVPH8rqWLohJckyU4cGt0CnwyNXMkTrsYtvSGEr1XDwMbi7+AdoFOqdCUhu/
	 uuHFmfE0LSOZm5vQAnJHrz+G5cc11+BaMl54rKOGhRE7GOISaQVOItyjp1IS6JyMBK
	 dSI5LGM5eYNNA==
Date: Wed, 6 May 2026 00:00:17 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	=Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mfd: qcom: Unify user-visible "Qualcomm" name
Message-ID: <afrnAfTVdcVoH2l4@shakti>
References: <20260427070109.18271-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427070109.18271-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Envelope-From: linux@gurudas.dev
X-Rspamd-Queue-Id: F26FB4D6E70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gurudas.dev:s=spacemail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106063-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@gurudas.dev,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gurudas.dev:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 09:01:10AM +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Guru Das Srinagesh <linux@gurudas.dev>

> 
> ---
> 
> And "Qualcomm Technologies" has even variations over the tree:
> Qualcomm Technologies
> Qualcomm Technologies Inc.
> Qualcomm Technologies, Inc.
> 
> I am doing this tree wide:
> https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
> ---
>  drivers/mfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268..b9ad6cc5cee6 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2388,7 +2388,7 @@ config MFD_ACER_A500_EC
>  	  customized for the specific needs of the Acer A500 hardware.
>  
>  config MFD_QCOM_PM8008
> -	tristate "QCOM PM8008 Power Management IC"
> +	tristate "Qualcomm PM8008 Power Management IC"
>  	depends on I2C && OF
>  	select MFD_CORE
>  	select REGMAP_I2C
> -- 
> 2.51.0
> 

