Return-Path: <linux-arm-msm+bounces-115596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2z0WN+nBRGqW0QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:29:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D636EAA49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:29:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aMDFig+9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115596-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115596-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7AB93002F40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 07:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038703B7767;
	Wed,  1 Jul 2026 07:29:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1823B42EB;
	Wed,  1 Jul 2026 07:29:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890978; cv=none; b=rxoXwRhXtGGCOzUEqvqWKJTin+mXTfg1HYsR/5Mq0fVx3s1X+N71CbZdyIGqxPf2XzKfhmZeRexLmwTP0oWkBvkVFvDWZQlMcemlmSyaOkWuk42qpZbEBtYw5MgJxDybSAZTeuWVH7tu4XpVvIGlMnr4JOzRLvkDlVAjksWUR5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890978; c=relaxed/simple;
	bh=Cyq2HZXkk5lT5/DTeH89v5V71oCHf/Iytel8Y7jQheU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj5lDR8oSadUBpLY3R4eS5x8IzYwFt9isjb4IiJv27q39Bii5mHEtbhPxUt1HXOkztli+ekONEBwXCxF+ywZaPb8uxq0ZaWYMv0hcVtkYmRFhJgXTdzKvPJIeG8YzoamGEl022aFlq9UrHSHlMYLJxQtx2Xhqg8lJ8e0BFU+cmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMDFig+9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59621F000E9;
	Wed,  1 Jul 2026 07:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890977;
	bh=uK5uRqNOcaWAtQFL8ul8j7o0WwrQEuYId8Tdiyh34Ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMDFig+9OG+LdrGx5fswuoNnrmm+9DG6UPziEbs6CyAvGmNtEnQtBwNqh4rE7iZoi
	 xd4y+7dvoAHK0zAyznwCpQhyOdG3SzAkNsifEHtrxb6stRUkRhyhkiu9xt0Zj//ktZ
	 Cng/2VapxwypTaV4C3Vr544L8qcaISAGkdJ7iy+Qi/WXEQCHWdCx2u5PeSFMEQxOVa
	 rzZsF1kBf7kczQcLEJpkUuM76lYXGZFz9Fz6K9l53YXUGQYO0nk7w/U9OorUI/ZiKG
	 MXbY6Em2ho7vqhdRwNwKyioUNaX2nlHQ6Ef7OJm6g2cpRIFsNvovc4vJksq0Wavy3Y
	 Zr2Uvo5Z99cew==
Date: Wed, 1 Jul 2026 09:29:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Message-ID: <20260701-uptight-piquant-raccoon-abceb4@quoll>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
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
	FORGED_RECIPIENTS(0.00)[m:yuanjie.yang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115596-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0D636EAA49

On Tue, Jun 30, 2026 at 03:10:12PM +0800, Yuanjie Yang wrote:
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
>  .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
>  arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
>  4 files changed, 156 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f09c..549287e3eeba 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-come.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
> new file mode 100644
> index 000000000000..935af96c2b85
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi

What is the point of this file?

> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "hamoa-iot-som.dtsi"
> +
> +/ {
> +};

It is completely empty.

Best regards,
Krzysztof


