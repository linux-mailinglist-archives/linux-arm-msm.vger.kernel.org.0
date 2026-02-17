Return-Path: <linux-arm-msm+bounces-93103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iItKGrA9lGk6BAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:06:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C214AAF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C7643000890
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E8D2D5C6C;
	Tue, 17 Feb 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="iX+oh7dq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B442D3220;
	Tue, 17 Feb 2026 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322797; cv=none; b=uzNiDA0b8jN+T+V7N42J2pQ+rPmCLMZ5hB5vwONhXu+pYuWQ0H15UNnPFcXn0L5T+ehV1kD2j4SLv4Vf2HIZXpWuKqNF1HxN2Cg2UYb7FxNDOIjcbZsMp1HrTcROC5wlhUgoavMQk/I8sEynq/iOtY9Jsd2vQVXloLn7MxrCnrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322797; c=relaxed/simple;
	bh=AdK8LnW/Bx53n/lVXk3PiLpD4HK+YjYVt1vCDPMO6jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNBuIJgLs8h6laN9M836YDNDs3vFS6CBI0Sn6J0ZaJacsMEk4d6e0w5p2BbApErf1kUDuTIAQ5nl2j9MlCQhNPsqknZ1Ay9hQ7zz+auZj1QOLWWiDbSMjfODGFZhYLu30yweA6jgNI76reY7sUfW9+6DO+zro/dXejYFcwaskV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=iX+oh7dq; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [IPV6:2a02:f000:10bd:e301::1d7] (unknown [IPv6:2a02:f000:10bd:e301::1d7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 4C4365341487;
	Tue, 17 Feb 2026 11:06:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1771322793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JdKJTF7zaACXesVjm8bcMb+9T+QLCOrHvL/F2wjpOm8=;
	b=iX+oh7dqkfI1THhrvqKc8TNBWd2yaFsd7DhRv/Ceq2Q6KZgsqJ1OiFHm45zUlNcorfUK8A
	hHj8J4S8mjC5WeBucKvAqKj3IsANFanZ6z7J51E+PhegaEU47haawYvQASTl/QDEur4KN9
	BcEsCzyiclzspKwLHFPymmhM668OmnI=
Message-ID: <e73a3b72-ad0e-4c22-82ae-13754c0d141e@ixit.cz>
Date: Tue, 17 Feb 2026 11:06:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: add support for pixel 3a xl with
 the tianma panel
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-7-mailingradian@gmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20260217000854.131242-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93103-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ixit.cz:mid,ixit.cz:dkim,9c000000:email]
X-Rspamd-Queue-Id: E06C214AAF8
X-Rspamd-Action: no action

On 17/02/2026 01:08, Richard Acayan wrote:
> The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
> panel or a Tianma panel. Add the device tree for the variant with the
> Tianma panel.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  1 +
>   .../dts/qcom/sdm670-google-bonito-tianma.dts  | 38 +++++++++++++++++++
>   2 files changed, 39 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..6237aeb0e36d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -245,6 +245,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-motorola-ocean.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-bonito-tianma.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>   
>   sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
> new file mode 100644
> index 000000000000..da309434b511
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Device tree for Google Pixel 3a XL with the panel connected to the Samsung
> + * Display Controller.
> + *
> + * Copyright (c) 2023-2024, Richard Acayan. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm670-google-common.dtsi"
> +
> +/ {
> +	model = "Google Pixel 3a XL (with Tianma panel)";
> +	compatible = "google,bonito-tianma", "google,bonito", "qcom,sdm670";
> +};
> +
> +&battery {
> +	charge-full-design-microamp-hours = <3700000>;
> +};
> +
> +&framebuffer {
> +	reg = <0 0x9c000000 0 (1080 * 2160 * 4)>;

Since you already touching the code, try to use memory-region mapped to

                 framebuffer-region@9c000000 {
                         reg = <0 0x9c000000 0 0x2400000>;
                         no-map;
                 };

The size is usually common for whole qcom sub architecture, so no need 
to worry about that in specific device-trees.

I assume only custom part is height, and status can be kept in common, 
see sdm845-oneplus-enchilada.dts for and example.

> +	width = <1080>;
> +	height = <2160>;
> +	stride = <(1080 * 4)>;
> +	status = "okay";
> +};
> +
> +&panel {
> +	compatible = "novatek,nt37700f";

newline before status (when it's not only property in the node).> + 
status = "okay";
> +};
> +
> +&rmi4_f12 {
> +	touchscreen-x-mm = <69>;
> +	touchscreen-y-mm = <137>;
> +};

-- 
David Heidelberg


