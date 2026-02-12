Return-Path: <linux-arm-msm+bounces-92679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKrJGpi2jWl96AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:16:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B572D12CE97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F260E308204E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8FF329C6C;
	Thu, 12 Feb 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iglfuqU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9202F1FD2;
	Thu, 12 Feb 2026 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894958; cv=none; b=mD8r8QJdqnyzj9zCOyn6cQMfH3p8i2q4RefStiEqhtcCCJUKNxJNKurLrqjQ2odyK2y4HjuZaGAxOgM4lKlaCPSNBogvTVKHdGgfebd9QCS35FkZ4X0w6/pxYdizlNHSKpZPwXnR+ZHYhmKMwdUfwFYEcHtNgzFkX1kj8z0fwyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894958; c=relaxed/simple;
	bh=JaROBJiSQgrGJWZSRBqinFk10ERX4PkHC50mhVsinh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSXcbrUf7AhVn09QzuQ5q8HuNb7hSXLf1MixLGBxe0/hEEKbQmvdwlnYFziVdWaEnyI+LdolvIE2AogYBFBQKvKTjSW0kk3YLegGoP24Qjf5mARm7GjCjERvSl3tZ8u4sI6vZAj/haxWCKe8a+1h7PZf7ZU7uGryPRCDI07VpZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iglfuqU8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9799C4CEF7;
	Thu, 12 Feb 2026 11:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770894958;
	bh=JaROBJiSQgrGJWZSRBqinFk10ERX4PkHC50mhVsinh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iglfuqU8Ih7yhE4RS9OFH5397ZNNUDEZWqCnic+fKm5ZSL3a/DLc+9jR5K8fMiwrL
	 evB28BbrFco8iw1rVJAp0BkInu6JAGTUN34wf94/Z3NDuCExoS74E05/0V38zgprVq
	 0qcAdRsCgOES4rKh2OGOAWrMn8/tGtD3+Mo9EhJSegIlTy7+vI39FH2nCF6z2r/Cxb
	 dCu7QRLdOUJdRClF3UPpwPxr5qpJ6L+3AqV6D3wwFsJ6WdTv4aunY56spAsBjpdKAA
	 4jKe4EX79mrg5AUlufqSA3hySrEB4YbG9MSQupgwQJLV/1jM/V1K5yE8Ey7XkYkVQI
	 cMLFQlS6wLldA==
Date: Thu, 12 Feb 2026 12:15:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maud Spierings <maud_spierings@hotmail.com>, "Colin K. Williams" <colin@li-nk.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add ASUS Vivobook
 X1P42100 variant
Message-ID: <20260212-watchful-inchworm-of-radiance-9bb4eb@quoll>
References: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
 <20260211-b4-vivobook-v2-1-9f500415d2ed@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211-b4-vivobook-v2-1-9f500415d2ed@oldschoolsolutions.biz>
X-Rspamd-Server: lfdr
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
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92679-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,hotmail.com,li-nk.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-nk.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,asus.com:url]
X-Rspamd-Queue-Id: B572D12CE97
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 09:37:50PM +0100, Jens Glathe wrote:
> The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.
> Add the Purwa-based variant:
> 
> asus,vivobook-s15-x1p4 compatible to Purwa SoC
> 
> [1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/
> 
> Tested-by: Colin K. Williams <colin@li-nk.org>

Please drop, you cannot test a binding in this meaning. I guess this was
populated from cover letter.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


