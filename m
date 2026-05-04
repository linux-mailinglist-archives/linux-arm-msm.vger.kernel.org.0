Return-Path: <linux-arm-msm+bounces-105723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ErVvN9+J+GmwwQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:58:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0994BCAFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5C6B300FC72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 11:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF243B9D84;
	Mon,  4 May 2026 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAYcTF2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72034D4C9;
	Mon,  4 May 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895901; cv=none; b=j5fwvpCwoZbXGusAQoBMX/cr8b77PBRACrMOOXWCN9dZA0rW/KguXxXxtC5YcdKtcARzJdy6iKnYkZz7njiDPEd0xsJADl5Lts9Xq0j+FxxRHrd4q+GsyJ4afs4RSRScVT2J4utz+29Hua3AVO6D0XCJfyMuNID/u3vJr1zQHTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895901; c=relaxed/simple;
	bh=gSsvyPBazZgd9rhyKQa4QCJ3STIhX978e7ISsDkghL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSZZxifjvXcLPvcoy8Diew8Ds1bmowreiHdPyqjw7z3Fd/9KwYkw8jVOhjtLm9eKiVsAoAttpN9PRqg6sVbo78kv9iUsytPr71qHBQt/6Q9vEJlaAnPgpGDnbQjXsf57A2iD5kdGOuVzNsS0kJVV1qLb1MPknQtiI7Axxn3eU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAYcTF2n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0077EC2BCB8;
	Mon,  4 May 2026 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777895900;
	bh=gSsvyPBazZgd9rhyKQa4QCJ3STIhX978e7ISsDkghL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAYcTF2nXIxWP39OyXv6dGuoXlWAurobpvxyDzhHT8jisSzCkRh1o2b4JvWRDf54E
	 hqN3lOsaJuzdefwYNv0OAmR69DCZ2+guTYhfATDNeMP2whGXS21B3GXPu72ihD2UQE
	 vGtPPvC16cv+Llp0oZTR8ubGW+O/RXFmOoZcAN/Fl42LNiGUOuc9giseqEYu3UGPyj
	 xqTkFComAe2zBJMFe6UIiQUNRKKhwWBG5lq3JHKyasCcxvdTFDdy8zojTJxtcBYdxd
	 5YlwKz6Kk1ifXia71KVY+jf0QOcojCyXr10SaY95x0V/Ru8YGVcgmap7gwzkcWk4JN
	 4gl1k28BZa0Lg==
Date: Mon, 4 May 2026 13:58:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: qcom,llcc: Document Shikra LLCC
Message-ID: <20260504-meticulous-neon-chicken-a31b5f@quoll>
References: <20260502-shikra-llcc-binding-v1-1-1da4b1eff0a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260502-shikra-llcc-binding-v1-1-1da4b1eff0a8@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5C0994BCAFB
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
	TAGGED_FROM(0.00)[bounces-105723-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sat, May 02, 2026 at 09:35:06PM +0530, Komal Bajaj wrote:
> Document the Last Level Cache Controller on Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


