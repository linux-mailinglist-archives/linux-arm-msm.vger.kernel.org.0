Return-Path: <linux-arm-msm+bounces-106414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJHfJqCb/Gk6RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:03:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 483654E9C88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5B0305E36E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4678D3FAE19;
	Thu,  7 May 2026 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJjfZPXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226543F7A93;
	Thu,  7 May 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162286; cv=none; b=oGXrC2RVP9CGFNGl7h37GyXMFBsT3CGv6qSy8bJB/9/josBhzal44UgcLVHIKgrEIgdJcR1Uxf7DLfZiZ08b4kafdJTGRj82+YjnQFMF1IXKx69WpEiAe4KzdqUlGOIYKt6zSdPhrPlfJeG2yUP6RjRCM202Lz9PosiqPQqdn00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162286; c=relaxed/simple;
	bh=OlGWb/di+cIBNs760oUnufgVHfwkGavGdQINZlG0LKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ol8ewF3TX6Dj9EfHJBKFeuA0IY8DFwKub3y9tsKifVd0okO3NISav/rQQjHUJsNB8dREMMJYZmsmV+lpn46X9pOWy3QeF3T3HfkqztNB3UeE95iJuAgo2fKvn+Gmhuu9tfw2m6eGX3LKzopBuBCqRClTz1rpzq1+kJPuhxzhTD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJjfZPXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED736C2BCB2;
	Thu,  7 May 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778162285;
	bh=OlGWb/di+cIBNs760oUnufgVHfwkGavGdQINZlG0LKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJjfZPXmhfVpQlVDJ50qS0HwTavca/aac71YEzV7zSRAWaiW1pDWIDyj3huXu3XV0
	 9F99a+KXGZvY+3zWNrV0M65YyByrB5NWad7HbndONYpNc9L824KmP+2o3WkQbyo144
	 eoWrTnerscA3nffXz6DcIdqJkwfme3BCQ2jC+vNgRm60vQoExIDt7Bo+yDSGWrdrIV
	 HHbdfDGLbJwwo1nQLrkRyg81VFiSiY5SiRAVAsNpMjU/CnuOqbFaO57vL/gVAG37ky
	 LrO0oRA1sTeSYpVHoC+C4tuXbfY43zU0VqB4sDqjBdemFekrLhaEqLsxi6m7/zNlL6
	 tEdjCRCBZb1pQ==
Date: Thu, 7 May 2026 08:58:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: Add fixed regulators for WLAN
 supplies
Message-ID: <afyYaCSFXy-Fm7DR@baldur>
References: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com>
X-Rspamd-Queue-Id: 483654E9C88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106414-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 01, 2026 at 01:19:18PM +0800, Qian Zhang wrote:

There shouldn't be a "v1" tag in your subject, and the subject prefix
should be:

arm64: dts: qcom: monaco-arduino-monza: ...

> Add GPIO-controlled fixed regulators for the WLAN power rails on the
> Arduino VENTUNO Q board:
> 
>   - wlan_reg_3v3: 3.3V supply controlled by GPIO54 (wlan_rf_kill)
>   - wlan_reg_1v8: 1.8V supply controlled by GPIO56 (wlan_en)

Those really sounds like gpios, rather than regulators. Why are they
represented as regulators. Please start your commit message by
describing the "problem" that you're solving.

> 
> Both regulators are enabled at boot to support WLAN initialization.
> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---
> Changes in v1:

What do you mean? Changes since version 0?

>   - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
>   - Improved commit message readability with bullet list format

It's impossible for me to know if the regulator vs gpio was already
discussed, because you didn't include a link to the previous version.

Use b4 instead of doing your own thing, it will handle the versioning
for you and it will provide links to previous versions.

> 
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..1a40ac5bb4bb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us = <20000>;
>  	};
> +
> +	wlan_reg_3v3: wlan-3v3-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
> +	wlan_reg_1v8: wlan-1v8-regulator {

Shouldn't these two regulators be referenced from a WiFi or PMU node?

Regards,
Bjorn

> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
>  };
>  
>  &ethernet0 {
> -- 
> 2.34.1
> 

