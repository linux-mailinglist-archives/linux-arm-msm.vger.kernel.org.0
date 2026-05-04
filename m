Return-Path: <linux-arm-msm+bounces-105715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK2RLql9+GkowAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:06:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4384BC253
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B353019BB3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 11:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D2A3A7820;
	Mon,  4 May 2026 11:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fILSU+X9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F493A7597;
	Mon,  4 May 2026 11:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892773; cv=none; b=h4KaoDEjQW+ZT1wrAjgbYOAcfQ3TjhjoueqOnDCkihMSdx0bU9vayjfwxWUgkBA4uE3KlzMQSkzh4hV7OqoMNzeN+AObBOpG3NGPWiKUBWihlStFtrn6IoVK3AZfFCHx8KOdFSzvy9yn5Jg4ZgchIvm6BIagVFbCM8Sfhjy/IWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892773; c=relaxed/simple;
	bh=sJTZIiOg7b1p9ynGB6mRqkfzuVlPomfglTd9N0O3xOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXF8Qs5ClUyC7OIEN4/2Ilqcmo1QAgbnKrGsXU+7T+mSTiWSQ+HaZ6aUlo9YBffwWNglNb9xTX4plQa+SDmWaS69p3e1Mkq/qCVpmd70sJbVCDctQ3dfReKV4u+eOhnLjQgqTWIFpDYDRomH2ZZtBWsgy112X6CDa2SXjWa5gZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fILSU+X9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9918BC2BCF4;
	Mon,  4 May 2026 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777892773;
	bh=sJTZIiOg7b1p9ynGB6mRqkfzuVlPomfglTd9N0O3xOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fILSU+X9QGcj5rznf88KfCoLItmzl3G3OsS2TYVopCDh97QH3pXChF3p/f8c1UehX
	 liccl8UT7Q4cCfNOSucwPTlzaCQWtSO+51A2kjZndj8VJNqXXoz/1x9NHovUuwu0HP
	 FjIM8Mzqd27vGUt+QtJnUSCYtaHo6s35d/A+IR3hxkMPc5BC2yY7hd50GlXbjj4px9
	 PEUPdmP1tBuAV3diMNavrRi4ByatDk5aj3vJrEsvz8Pe1vKmwgPAFP8ExseSdNY00M
	 E02dt26ZElE97VAoaRf4BkbS82VHI8AVbnAUY4TZPl67ggcJj7343qfcB0L8yAb9bo
	 nbPLVLLMMSSrg==
Date: Mon, 4 May 2026 13:06:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add Shikra compatible
Message-ID: <20260504-ingenious-bison-of-defense-5e16ba@quoll>
References: <20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2D4384BC253
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-105715-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 11:40:59PM +0530, Komal Bajaj wrote:
> Document compatible string for the QFPROM on Shikra platform.

subject prefix - it is "qcom,qfprom"

Here as well: s/Shikra platform/Qualcomm Shikra SoC/

Best regards,
Krzysztof


