Return-Path: <linux-arm-msm+bounces-112369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lYZaOksoKWrRRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:03:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2166792F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:03:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nrV72KXM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112369-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112369-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D72730E57DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A44C3B47E3;
	Wed, 10 Jun 2026 08:55:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020D3B42E3;
	Wed, 10 Jun 2026 08:55:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081750; cv=none; b=au/+53xUqDPkykeiWbTNmdRumw4Diq7g3/GBKdQpyT4TLhPG9Z6cSGPmHah1lC+e5TtAshsbNmyIX/6NJB6rP96UXyuk2Pdb5FcNlhR/jhcJove/QzpondIZ5La4V0fBlnChHtefe11Z2QGS1pqWK4l5oShrShlTheo6pfrv1Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081750; c=relaxed/simple;
	bh=a+sRRfUHrctTpYK/ApL0KiB3sJRFNC0i7dDQnfFBUMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjoh0w4Tact5BEHVvzAfyytG1KWhbWWbGYmME35iU6IL6EuMz4XW9p6tlqwPqIvIhxxbWlL5+NfvDiKbzSBiJsACLgVaqQLkyWq29VF1D6TusbMDPHLBrwomSzR0esoCofTkxT+xOdix2ixrI1pTGTyYymF4478jeIVXMqN255Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrV72KXM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DAB1F00893;
	Wed, 10 Jun 2026 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081748;
	bh=24kKy5m5HqAQmbOX/28c8jXJQdgJGurt3Jbpga0TnVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nrV72KXMNgv+FyEiA6zBLSfuTrO1Oyl0jd/qHTN9eyMrqIGYaSWqpYAxv047yykcu
	 +H5l6v4Ao/iBZfhF+al+Ku7JuwuEiCGtGVAMjpW6pgYdVzuVXJrhbdEkIbBw1FHTwX
	 8jnFqibXksS/KsdyuiBDfm4BBstgFacRznXa7h2InV2ux4SjeyozM3Kvf6Mii58xfk
	 P0zab4JHJghv3X2dC0em6As9xbLwfhK0C59OOdqM1flbQ46O+gG+3BH8BlFcRouVy9
	 gBEz7jx3xeD86orh0OUftlU6DgE0tPWgwa3Yt/NnrVLO/temtCjus8nFVm6ROENHec
	 +hdIZYx7MgEzA==
Date: Wed, 10 Jun 2026 10:55:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
Message-ID: <20260610-mighty-dalmatian-of-piety-2fa184@quoll>
References: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
 <20260609-maili-crypto-v1-2-0f577df56a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-maili-crypto-v1-2-0f577df56a61@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
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
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112369-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,quoll:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79D2166792F

On Tue, Jun 09, 2026 at 02:08:57AM -0700, Jingyi Wang wrote:
> The Inline Crypto Engine found on Maili SoC is compatible with the common
> baseline IP 'qcom,inline-crypto-engine'. Hence, document the compatible as
> such.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index db895c50e2d2..c9489f6b8081 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -16,6 +16,7 @@ properties:
>            - qcom,eliza-inline-crypto-engine
>            - qcom,hawi-inline-crypto-engine
>            - qcom,kaanapali-inline-crypto-engine
> +          - qcom,maili-inline-crypto-engine

Why clocks are flexible?

Best regards,
Krzysztof


