Return-Path: <linux-arm-msm+bounces-103923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLyvHMpS52mn6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:34:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F843998A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25236300B50D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684BD3BC695;
	Tue, 21 Apr 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1n/0ujD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B93BC675;
	Tue, 21 Apr 2026 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767676; cv=none; b=kg8mL+A2B14Jup2PUQwZp45B8ttM84acC8+r0mI4mYCkrSatFDZC6QjnhaCeXJHHKxfxLTY3UUMAdr18S4bvkqsxuYOAEisSDotbo3vRd4cYLq4elPeTXkK+2id4O97/Xc9chJWr78yFflA0pJXffrzh0UxA3yox20OzxC+tCi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767676; c=relaxed/simple;
	bh=SH0mo2WCb7oNgU42k3b2y9Ijw+YMkFgMBinzKGeUkX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKTaeYqBGp+mp9u32aiqUmcCRUCTSZ1FwYsZX3fblcxXtkm9I2qdULBCS/nFbVUkeJB3YAW34hhqjykDpsgfu3s1WnFF9ZBCMlWeYy1MUXulPcoansXs23C7ZTpMixuxsnIT74j3Nnv9lQXNvVD32NV+s9pRdEMx27xA3krYnrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1n/0ujD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AB6C2BCB0;
	Tue, 21 Apr 2026 10:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776767675;
	bh=SH0mo2WCb7oNgU42k3b2y9Ijw+YMkFgMBinzKGeUkX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1n/0ujDjpmCFfHUOdrtVH5Z9lNebLKv77Mmhf8H7jZUEUhdUQNlMJMoboXmuCZ4z
	 7y62RTBCPFwY1ZPX9zWDiJlSe0pCNysjlMCJBHmPsqA/QF18hONzEnl0IKfwUIV29e
	 SivR2MZNH5LHsEI/Vk80BY5q4VEMCpW/qO1c67ognakwDf9xBLFZBTZBiY06XOnUi+
	 BrqgDVaQUpmPtXnp1OoeeAyaFw/FTwjkcCqlM5PU9hBUY75+t5vtufjUrbNSQGPQ9E
	 pJa63LALtAgfmxglTykSFzUCDk8oiB9isZRfms03xPumXJqGpHfpzTW29EIUcYa64N
	 hgUUExtk0DJmw==
Date: Tue, 21 Apr 2026 12:34:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Praveen Talari <quic_ptalari@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: Add compatible for Qualcomm Nord SoC
Message-ID: <20260421-spotted-fiery-crab-4defd7@quoll>
References: <20260420060524.1248432-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420060524.1248432-1-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103923-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 7B0F843998A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 02:05:24PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document compatibles for QUP GENI UART controller on Nord SoC with
> fallback on SA8255P compatibles.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../bindings/serial/qcom,sa8255p-geni-uart.yaml     | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


