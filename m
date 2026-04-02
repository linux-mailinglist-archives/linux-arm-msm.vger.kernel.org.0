Return-Path: <linux-arm-msm+bounces-101481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA33BQQpzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:29:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD4386062
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3CCA30524D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361B422256F;
	Thu,  2 Apr 2026 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1g6Jgvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1432C236B;
	Thu,  2 Apr 2026 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118389; cv=none; b=CfxYKmGoNxlW2U5dBbs0Z34WrH4XC6WbEzWPZRk4bCKkI86PAhM0P+EbrxpA+fUES58fGm2u+c0ZvYKHUYpEFTcgpLaqX1mvmMjulYr/TLWSdQxl8PJNia3ATPvmMkjkOJzJ44Vx5tHEHhLDmle56cQVhDwo3DFJqc475qdOTLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118389; c=relaxed/simple;
	bh=/OHmXKv2sH/QGyTg/3Ci4IsED/j42m9zA8yzSn2bW+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOkvMBWuawwijNmjzAT/ISnkakinsZsa8jJ7R+xoA5QIwsZx54xNfG9BC9dxfvXlQZmvwFrDC06cClhxPzj+oXp1Ckw1Xam5FZrnlZBy9xH8Cx3R5edyIB+9SSz7/RJRXOK1YWDWec2fZ9BJ9BI4+6cIkbDDvrqtZ2ki20lL9yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1g6Jgvc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB03C116C6;
	Thu,  2 Apr 2026 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118388;
	bh=/OHmXKv2sH/QGyTg/3Ci4IsED/j42m9zA8yzSn2bW+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1g6Jgvc+RSYR8yZFTuPGIX2o6TYcTryslmBaxRlXZwuiheOdEqVLUzOub92rXz2o
	 ZwuHCLiSqfOou3UdGIfB6qyNEXzLYOia1WQIjqjhkNKlYj7X4vG1hntebgdjMEALoT
	 AyxXPLS1+YilL1x93yO8K0VV/iXbynaqb4KHiZ+cWAh4/IWPD+gkiOLeOSvQEtcDqt
	 5PDIir+L3e4g5xPAzlByOI9QQvOwCqzr+3c0OMGTgTLHKkeoRCUAZ0yVGuFXk2/JMn
	 9VGB2MaMDE+5xx+Gkod2XpPOsX6mJ3Fm1aINEBG7hKZ1qJyYSVGHUa9BtoXxrxSSnk
	 aPQAoCohJS1mA==
Date: Thu, 2 Apr 2026 10:26:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, 
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 1/4] dt-bindings: platform: introduce EC for Dell XPS 13
 9345
Message-ID: <20260402-flounder-of-unexpected-infinity-83b5af@quoll>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-1-afa5cacd49be@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-dell-xps-9345-ec-v1-1-afa5cacd49be@vinarskis.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101481-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vinarskis.com:email]
X-Rspamd-Queue-Id: AFCD4386062
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 09:33:10AM +0200, Aleksandrs Vinarskis wrote:
> Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
> codename 'tributo'). It may be partially or fully compatible with EC
> found in Snapdragon-based Dell Latitude, Inspiron ('thena').
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../embedded-controller/dell,xps13-9345-ec.yaml    | 86 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 91 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..30dc6dcd8c9f0312fdb4eafdef96bf0ce4975798
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345-ec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dell XPS 13 9345 Embedded Controller
> +
> +maintainers:
> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> +
> +description:
> +  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles thermal and power

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).  However don't wrap blindly (see Kernel coding style).

> +  management. It is communicating with SoC over multiple i2c busses. Particular driver

Drop "driver" references and describe what you think EC is doing.

> +  is for EC subsystem that handles fan speed control, thermal shutdown, peripherals
> +  supply including trackpad, touch-row, display.
> +
> +properties:
> +  compatible:
> +    const: dell,xps13-9345-ec
> +
> +  reg:
> +    const: 0x3b
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  io-channels:
> +    description:
> +      ADC channels connected to the 7 onboard thermistors on PMK8550.
> +      EC requires frequent thermal readings of these channels to perform
> +      automated fan speed control.
> +    items:
> +      - description: ADC channel for sys_therm0
> +      - description: ADC channel for sys_therm1
> +      - description: ADC channel for sys_therm2
> +      - description: ADC channel for sys_therm3
> +      - description: ADC channel for sys_therm4
> +      - description: ADC channel for sys_therm5
> +      - description: ADC channel for sys_therm6
> +
> +  io-channel-names:
> +    items:
> +      - const: sys_therm0
> +      - const: sys_therm1
> +      - const: sys_therm2
> +      - const: sys_therm3
> +      - const: sys_therm4
> +      - const: sys_therm5
> +      - const: sys_therm6
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - io-channels
> +  - io-channel-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+

If there is going to be resend:
Drop +, I think we don't ever use it in the examples.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


