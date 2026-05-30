Return-Path: <linux-arm-msm+bounces-110352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMDVGgm+GmpA8AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:38:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659C60C2A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE15A303E08F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 10:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61861363C43;
	Sat, 30 May 2026 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/jRMpZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE6125B0BF;
	Sat, 30 May 2026 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137462; cv=none; b=gqFlCt7FRN8MhumKDSPmjjwdfeJhdhLrapy55dRsrcGWBWdtliw0o1HC8UV4+sgzHAsG/H2iBV0Ll1+pGOcxxabq8VDGoWofieu29rSLyZglVRDY4yHSirZlq3xDH3QOT35qXgRAiAQwi87pFkKaiph5LwiywZCjAJdFPlmrqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137462; c=relaxed/simple;
	bh=RgpQFM/7IKIwFY+avYDgXwgc6wraBRMPyvv/6aoe8f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd8dt4UghUSIWvxvgZVfTBD+HlQt78RbHsYKN5gRmJjYixgY3j/oAgu6/yyRDP2Dtw4OSGeLnzDtTd7rYYJc6XunWHuDciXIPPJ1/a6YDrA4UqCQQpVIms7msNPAuh5o3Z3otDOgh1uK6/DyuocoCZI0p447u6H9lbFwK27QIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/jRMpZe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983811F00893;
	Sat, 30 May 2026 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137456;
	bh=ap9xB6AsZCtTAfnYFgzk7C+mWihjJYXBmNngUeObNCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g/jRMpZeDJiV12maKkhatn01VDl89psdV5+CLdb+xE9hJdwobiN2uX4LSS99OBG4y
	 pXwBbKqEjKCZKQ87MqFPLmxQv74zSdNQyDqInVGvEfCAiBoJlrH17YOGk9+gmGeMIr
	 hZvC6aBwajAd9GCQ4Ywe1DpOgZXFHqmHV2k7LNiovqDhZPipDA+DpusgNS2mY+Rf3f
	 BKiDvxUscT2sJurqM2pZ2yzfzsvo1eLG4rg0IOCsvQ08KYBpHcorrzzSpPJb1u1dHM
	 6+pvE9fUBu5YjHP1JX2lH0z1y5Dv9DBD8Fi2ZGDHkxMYBGumsn0vRnqMwUSFnrZuUy
	 Yf7l0DaGuwgpw==
Date: Sat, 30 May 2026 12:37:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Hawi ICE
Message-ID: <20260530-electronic-dog-of-bloom-2a0b04@quoll>
References: <20260521-hawi-crypto-v1-0-9176a3b51bc0@kernel.org>
 <20260521-hawi-crypto-v1-2-9176a3b51bc0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-hawi-crypto-v1-2-9176a3b51bc0@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110352-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1659C60C2A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 12:36:21PM +0000, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The Inline Crypto Engine found in Hawi SoC is compatible with the common
> baseline IP 'qcom,inline-crypto-engine'. Hence, document the compatible as
> such.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


