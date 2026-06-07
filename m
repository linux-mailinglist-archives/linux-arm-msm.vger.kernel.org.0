Return-Path: <linux-arm-msm+bounces-111552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8RMYGccqJWqmEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 10:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3C64F20A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 10:24:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FujeNzYm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111552-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111552-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0543301349E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 08:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E509F36D510;
	Sun,  7 Jun 2026 08:24:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F083E25771;
	Sun,  7 Jun 2026 08:24:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780820667; cv=none; b=ktohzhMxM+HbCzfEy1ZkbMGPQ9Ob7NQSr/+FcmtL3teKxRbn2YS57i+2S3faozX837qGmQp7nHO+CfpW5CnxQA7q0xRocVVMiaRvZJw/EeSg/sWDWGl0lMtB+AWdHrwtGN2lJS8PgayirIbKUKLaLEreOMEVulvfEsCKx6CtUyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780820667; c=relaxed/simple;
	bh=+rTHbzo9qUf4BSL6kKHxiWK7nU0BduoKkHBs3gIJce4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jb4Dpw4acPpkW0z+7LqNJe+lYdJGbs7QtgIPc1X8ZMN8V/463l0BMQ3cxkTOKcNU2acDn1930inadiQzHxfJduMORKBWvQAQe115Zno8qIf5Ad3yD5aQT96YMQNzU2W5Ac//YUFHA8SYPUiAoPNDiC/ItQzMPQh9BQXAHUEqhvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FujeNzYm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F4C1F00893;
	Sun,  7 Jun 2026 08:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780820666;
	bh=oU/8DTtx96lIbNMj4Yb3/vP8xacXjJGiGRRi+s5b7+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FujeNzYmf1XXKrO5wO6vcV8bOtlAUPYcwwuM0lMqZ14yGJz3SOa3jcfk+ZMqj34DR
	 kW0kDi9sDcoMfC1aswILUM4XUPO02CIIo2VOEWokxRYyV40M+fxitau7ocm7RtEwjD
	 5E9ZMRK/kbTZbyQADCzGXVCzAj82hK2s4sDkfJ/sWcetC5iW0ptUtF0jUuZUHzX96X
	 GgrJQcxSgCVAd4gamAJrL41LSY8WGtgbnYnat2OJtk+jMfBfrm0a6KCRYLgcEx/zkR
	 i4b072hds8oAB65da7mEANWf8CApm0NUbmaJFNtDLd2z9k+csBZBQgtUb2sd2GK3uH
	 HUPOA6lVCVcYg==
Date: Sun, 7 Jun 2026 10:24:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Georgi Djakov <djakov@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] interconnect: qcom: add MSM8x60 NoC driver
Message-ID: <20260607-secret-ivory-stingray-7e6bb5@quoll>
References: <20260606-submit-interconnect-msm8660-v4-0-6e1e5c5efa26@herrie.org>
 <20260606-submit-interconnect-msm8660-v4-2-6e1e5c5efa26@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260606-submit-interconnect-msm8660-v4-2-6e1e5c5efa26@herrie.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111552-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1F3C64F20A

On Sat, Jun 06, 2026 at 03:00:47PM +0200, Herman van Hazendonk wrote:
> 
> Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/interconnect/qcom/Kconfig               |   14 +
>  drivers/interconnect/qcom/Makefile              |    2 +
>  drivers/interconnect/qcom/msm8660.c             | 1716 +++++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,msm8660.h |    6 +-

Not a relevasnt change.

Best regards,
Krzysztof


