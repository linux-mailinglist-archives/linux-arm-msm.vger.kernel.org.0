Return-Path: <linux-arm-msm+bounces-103920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHH5NUxS52mn6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:32:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D1439939
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B6543038D06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1906A3B7767;
	Tue, 21 Apr 2026 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oi/uzCeg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C43A1A5F;
	Tue, 21 Apr 2026 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767414; cv=none; b=s02YP2DuL3R/hRqHAn+rPRKO5r5zXAyE1qI2RNELOQ6gko5zDnL+dOmH8XiuDwZS8+Z8H4i91Larp7UHDggyoVGc9XpeBGQXP+KV/uC+kcL6UY5MT6894iIwsSQiXfoywmnp52spVWntTfDJi5IcCxQp6J4s4hlRcvLFF2YZB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767414; c=relaxed/simple;
	bh=zp3St2ZPpV3+uoZ2cwpRxOGcnzYyOTjsdd/OkGYILsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9qiV+xoLe0b6emYbuXkfF9VDzBhS1Oj3sGkmaXhZKhvgpW3Dk06c05pQb1glIm9tduSN8MewPqAMe3uDOBlp4SZA7sbG/SQ26KMkvomnE2/hRZQ99h44LDOr66+PMNohSQGmr61/whQamskQ8f3Jiew3rQmFgkc3/YMUMsAyr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oi/uzCeg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A03C2BCB6;
	Tue, 21 Apr 2026 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776767414;
	bh=zp3St2ZPpV3+uoZ2cwpRxOGcnzYyOTjsdd/OkGYILsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oi/uzCegyCI+CV97WcLDfMpZw2C9Cqx0K6F74Jt6y9zttLXU0VECxGNMVulWqZq5c
	 hQALnB0wvd+jBmtggdGIn0LmiDBzfl+BHwwNet4U7mIlln7NGqcDdMRi9/sIK6NJO/
	 FMuTjaNL3GFxLIiRvPTsi8idl5Y53fFw3vLmP5+TVpU8GLE0UMz8nVWoXt8ffhkbd2
	 p0KEkv+OUWHc6r408NL/7UTmgucQ2Y76LGZaXuf1+g/SHBXSuZbCSbgTwF2tBP9Bsx
	 IRhZoaJvJ+js1Gf5aWd6XP1i0GmSXI3jF743mynB0FhhyrmBU09a3LnOMs9kszHt5b
	 9VLTnIUsW2vWQ==
Date: Tue, 21 Apr 2026 12:30:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP
 mailbox controller
Message-ID: <20260421-free-meticulous-beetle-bb3fcd@quoll>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <20260420034932.1247344-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420034932.1247344-2-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103920-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 594D1439939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 11:49:31AM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
> Nord SoC.  It has 16 IPC channels, compared to 3 on X1E80100 CPUCP.

And more channels does not make it incompatible (see writing bindings or
DTS101 slides). Please provide explanation why devices are not
compatible.

Best regards,
Krzysztof


