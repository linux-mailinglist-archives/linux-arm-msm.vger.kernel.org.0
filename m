Return-Path: <linux-arm-msm+bounces-107990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mUbKNxw/CGoRgQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:55:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D1A55AFBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DAAF30125E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 09:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98696360ED9;
	Sat, 16 May 2026 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYXZcXY5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C2346E43;
	Sat, 16 May 2026 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925338; cv=none; b=GNkip928RQInQhrsG1tf0Hup8F429FwRe+5GYlF5LZaK6vcURUDyB9eLH2Qf/OF63mmrOkN+D9Qk7eBSWI4Jz2u1CzXG3kuxbXxwKP6TysY8wZq81PKd0eSjhWAgC2YcbkI1iZ28OqnCERemTH/gCXNGd9awcJl6JS1SS8hOZgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925338; c=relaxed/simple;
	bh=ThEE449rYWdZBLplfabPorNZfG5RZ359gcGvT8Bg00o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scQsFgFHWax0wmA3+yyS71ErmG682DJoncuz6wdII4YW32POk0B2TNVP/kLLfHlKkx2cCOnRk8Mbt1/NFcTXqW471tV58oSDS1UtRF6peUDltwj95hjBTk6jZUGpJAfnes5yqENMyY4YZkTchCYKQSNtwFWl25jS/XlIjNgedJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYXZcXY5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC50EC19425;
	Sat, 16 May 2026 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778925338;
	bh=ThEE449rYWdZBLplfabPorNZfG5RZ359gcGvT8Bg00o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYXZcXY5PnAZGaRxGz42XDZ4yrXTFKQiNZOOGXyAp7SxfhbN7VV01rKU9/+JGTqNd
	 Msuq9ELpUUBLqwHSMbRj3DzO1Srk3iOPtRxLM1fpDC4gprP+yfssGgaM512dXzXKN4
	 0ma7yuUtvBr6fXMChA9Y7ibyCgs6SOkpg9wK2Mishe3l4m6f5aiaVRU2wxcASioHp/
	 eMWzv4xnlrnetLUIGRf21HAqZCsJpB8IX8vlW9lKLmWj38qyc50fF98uFdvkYwPXw9
	 S+EIN70onmG9iE27+mvybs5w0fZeBJbyHOom5Ym6j+nvYFSN7utEUbEd435Ux2YlDu
	 CovkoOrr4Oq0g==
Date: Sat, 16 May 2026 11:55:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Message-ID: <20260516-hungry-ultraviolet-lemur-ea9aea@quoll>
References: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
X-Rspamd-Queue-Id: 91D1A55AFBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107990-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 02:54:34PM +0530, Varadarajan Narayanan wrote:
> Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

This applies to all your patches, not only to this one.

Best regards,
Krzysztof


