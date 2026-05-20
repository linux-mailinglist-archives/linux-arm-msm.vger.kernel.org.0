Return-Path: <linux-arm-msm+bounces-108684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOECHRiJDWpdygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:12:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291958B783
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56943303A197
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AF03D3D03;
	Wed, 20 May 2026 10:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3t3k+dI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169673D6688;
	Wed, 20 May 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271920; cv=none; b=V0wqeTeo1Xj5jsDL454Zbh0XMY2prBnxXWkNhHd4bpmZ4ABGe1XEWudDSQEmYaopaTLuJO7tnKBJnKQpdlrqPWOCQdoKQhrP/o0e3uO8mHVnpmafuAnrueMo7hxJvybitpEJcftbW332VRuFI0clqgoFD9EhQ4hI/fZ3w7Or3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271920; c=relaxed/simple;
	bh=Y4yCwv3Ef8S3mI/bBKyorpZC34HOH1wQjZB5GWOA/Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCyWx8K0nqHFb/Vq4fGtak89lbZ4TOSaGzwq3gwx+7Rq4g4BQ4nVFrVi+TlBgY2pRjxTFMcJOi+IKW8RtSGoJLCxOAF2nT+VsZSNUvHMNs/d9k8J1hnzESJ2NzhwbdCBX7/K0WLAqsFyxxK2hiOLlM8vrJNl5/Hx0SVUcb/tiww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3t3k+dI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF181F000E9;
	Wed, 20 May 2026 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271913;
	bh=J/pLXd0oVnRoh9JM4E/FnToSsEzH3ndtEOPvwQo4Pek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J3t3k+dIb9Rbo/r0mxMR0V9JXmvmp9LzpNYHUiGYLSYEgK/gfC1iUByKn7hcOxsHv
	 haPfWVVLUXbYbUZqUywehFK28+RH3XD2MVtxfCDqV4QB7Oc69R2z9ZOeFTBosv2A64
	 6IMpY/78hJCsbmSk4YL9KczFx5nmucHhb9ggWGIQvo1kNBibFwYWy3TJLha5+7E7Wi
	 2gWwloGTES8SRqk6BYunnG0autnUjv2IGetwx1q0yqvfG8HKqwP5kFxzcLqil1eJSB
	 izb0qPsVJZHiVlIkJuXnPusTBa5YQ7rnTJzHe6byQzb8rGKoP9YXYdfPIeoFGYE72O
	 x5G+uv90e5Biw==
Date: Wed, 20 May 2026 12:11:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
Message-ID: <20260520-wealthy-ivory-wallaby-8c5cc0@quoll>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108684-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 6291958B783
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 07:09:53PM +0300, Abel Vesa wrote:
> The Eliza CQS (CQ7790S) System-on-Module is designed to be connected to
> an Eliza EVK base board. The SoM provides the SoC, PMICs, LPDDR and eMMC,
> while the EVK base board provides connectors for a multitude of
> peripherals.
> 
> Add the Eliza CQS SoM DTSI so it can be included by the EVK board DTS.
> Describe the regulators and board clocks, enable eMMC support through
> SDHC1, specify the ADSP firmware and enable the ADSP remoteproc.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 388 ++++++++++++++++++++++++++++
>  1 file changed, 388 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


