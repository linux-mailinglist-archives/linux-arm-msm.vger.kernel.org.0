Return-Path: <linux-arm-msm+bounces-111776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DRg4APaKJmreYQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:27:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B371654976
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:27:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ahTbVFL6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111776-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111776-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CF353005ACF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71F93B47C9;
	Mon,  8 Jun 2026 09:25:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E58365A14;
	Mon,  8 Jun 2026 09:25:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910740; cv=none; b=IEgeWjtUUQSYGpr0D0ZQpmAnyQq1So0ySEy8MSmgPgMqv1XhcHlUTrrZqtZyBEgs48Of3H1CL+sIeRHlpeoohL9K0xD9ZYbdJm4y/HywmWjACUwHvjQdtUxhZMyXgywt0TQSMHrUmqrWvQXRgTLDrVGAhNKDOFQaL4YWuiHwt8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910740; c=relaxed/simple;
	bh=jcITkZya5DctEjJTpnhNnyUaklT05KbjrGX++UKoNys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDmOtF0Ec/jlmiG3pEjfdnNWTf2ymOjm3LPcfVy9MWBlSSSSXCzTF7RkfgW2up98lOcn7lGJtp1/dzduRp1FNRp7t4o+qPua5/BNLIThpXpJ0VSFSIlkjGKmbR06uTNrKOmtFYX9zPDk2UdcqC+hjGz+6u8bPRyYY+HmJTQ+aYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahTbVFL6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F441F00893;
	Mon,  8 Jun 2026 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780910739;
	bh=97SVP/N1UPsxwdFM+XWV9XePY4QYpYmCHmoPoWmKD6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ahTbVFL6EgM2d7jyD1QZAZM1ROx1P5MW5VPygBDVUBcqURzOX1/t8vVKCGmBRZhDs
	 adXAVt+xkzwy18Rekd91qxeJNXBd18oi0CLm7ZL+grrOcqxWRsGsdEmJvmLWRYHWBd
	 h//0iCIEjyqBFe8dQfLpNKx0ss3xgrEgBlXAn9xEK7Pqc77iHM3YEok8gJp/MegGPM
	 cKxpdUz0TO6PlU8znPr86/DtkYHYd6sfoFMsBO4xQRfmgoKVMNW+9sAl3avTr0VTtu
	 K+J13BaYgm10HrlsN/wLNAUZ7Y618T9wiG58zAqBNLj8C1Y3LsNpKu4xszkxp5ncb7
	 nAmn1iIH0P6YA==
Date: Mon, 8 Jun 2026 11:25:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: cache: qcom,llcc: Document Maili SoC
Message-ID: <20260608-warm-astonishing-chinchilla-deff3f@quoll>
References: <20260604-maili-llcc-v2-1-dd24f05bc197@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-maili-llcc-v2-1-dd24f05bc197@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:conor@kernel.org,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111776-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B371654976

On Thu, Jun 04, 2026 at 11:06:16PM -0700, Jingyi Wang wrote:
> Add documentation for the Last Level Cache Controller (LLCC) bindings
> for Qualcomm Maili SoC which is fully compatible with the one found on
> Qualcomm Hawi.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update commit msg - Krzysztof
> - Link to v1: https://lore.kernel.org/r/20260525-maili-llcc-v1-1-cdc72b98b671@oss.qualcomm.com
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 63 ++++++++++++----------
>  1 file changed, 34 insertions(+), 29 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


