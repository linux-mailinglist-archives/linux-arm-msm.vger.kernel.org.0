Return-Path: <linux-arm-msm+bounces-110351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL5fFPK9GmpA8AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:37:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9EE60C280
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2865C303AB5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 10:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C20D3A5989;
	Sat, 30 May 2026 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhASs7xz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F473A2E2E;
	Sat, 30 May 2026 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137445; cv=none; b=jVFsq2bXQCtFo2FNBId89YQq9Ld7HEvxepViD/ISse9yITQhBtlXfXIUaKQHtKH8HPEsucO3vjvJe9XZGx+RmyOdTf7aeYfDEqDLjjqUg+pS2eIkwwDQ3oid79GuzkjWhYOICUnM7hgT/hzOaNo18QfPKZmGpfv35caAS1Pb+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137445; c=relaxed/simple;
	bh=6GNDi5gdG4nCyzWxphIJPhS0mi4DMYNOXhiKal73CpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAM1+eoTZFyNibPlhnkVVkyZzfOTCzvoCukcUiuecuRT/Sw9I8I0hxBlkPqIKgIHB37heUCTVQPF/d7P1PRtBNDEU/rU/1eiFZ/s5NZwcETIjnLQabEUNaby1BnI6FvZTKYFKNa5tPtfvMl+iw5ypeYdpYmeg9KJivUFTPyXKmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhASs7xz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9B51F00893;
	Sat, 30 May 2026 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137440;
	bh=6cOiSaY5k+4Rw1Fij7yu7hGfhvAiz1DVIx9iJ6tvlXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YhASs7xzSs3ODs5zaIICjv71bIDoTFAcAbNugZaIYjQAANsp7TZXh8NBSpUo2m+W5
	 sf1/q0tTPs4OhOoPDdBoKFssqH5TW1mVXD3MeWz+Vx/iCHVvf7/C1MX0KgsA0SgtW/
	 F9jcmJeZNmTUETJHP7v8tsH/UImyss1sNfrOj2m41pqqJrN69fp/uO5Ld25KQtSq2e
	 Wr7JFFVpFmtRClPr3rr+DDCxitAlu5fLxW5uliYpjvAwNpqxODPdvyzLLf1d4h2CZx
	 e46dW//Jp2JhOAKBdQegjT/vynsM9L6401u8DG7Bq5U+HNVfr2GsKW5DvZa3VnAG1P
	 nh/eGgyazJhiQ==
Date: Sat, 30 May 2026 12:37:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Hawi TRNG
Message-ID: <20260530-realistic-handsome-scallop-cf01ec@quoll>
References: <20260521-hawi-crypto-v1-0-9176a3b51bc0@kernel.org>
 <20260521-hawi-crypto-v1-1-9176a3b51bc0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-hawi-crypto-v1-1-9176a3b51bc0@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110351-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DD9EE60C280
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 12:36:20PM +0000, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Hawi SoC has the True Random Number Generator (TRNG) which is compatible
> with the baseline IP "qcom,trng". Hence, document the compatible as such.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


