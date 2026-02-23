Return-Path: <linux-arm-msm+bounces-93657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAn8NdktnGkKAgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:37:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D981174FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03E443004F3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B579534EF01;
	Mon, 23 Feb 2026 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOvhkl2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916723EBF08;
	Mon, 23 Feb 2026 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843031; cv=none; b=DI3oCdQg8N3uhKuu+Qhz4KmbcxKJ3F9y35CJQi0oR1xsvXXxpc//5AbyBLJ7A6a6lEGFzWA1GBlOLwLM413Fy28EFdPkNTl3Jxc9C6dEBgr/wlLaVJTQMGFOTymlH96CTLUpQfurg7XPJlrsywJnhiYdwrWMjWbM/eKLT8uzuX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843031; c=relaxed/simple;
	bh=iN4YmUmbPj7+ysWJ8/nfJ3lVBJKQ65Rl/nt9+XzSJCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yn3F0mVKt0xlKEghJ2vJRoa+kbmshH1SjiAergxBl0wJkglvj+bADhQnZuh4uZqbft/m8ctGXepCKIuVnSD2L8T96lJgZSbuiZU9KI7YiK8aQIJ3NmcUhHJqA1Dw+h0ZEE2xIf0FcnGYv4g6TeUBrrgghWAjD2BrP+Gx1Ji4+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOvhkl2L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2752C116C6;
	Mon, 23 Feb 2026 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771843031;
	bh=iN4YmUmbPj7+ysWJ8/nfJ3lVBJKQ65Rl/nt9+XzSJCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOvhkl2LQqqSbY7o+40x1fgguhr7V1MfD3k/0mXXnSfM3M6jMpTIrLnjb8/G8rVGE
	 1/KYf8c2rE1Is6jc9g/4vIkTbptuc2BxKnFe8DndNy6k/eqwHqO8TrAn5+4IpxiaFl
	 JQSg6M5mUdEXw/ztMEXDXORYN2r4jyJs/LyWdIURY2FQAHqR+DyeDrrrKg41kDtAbX
	 sTXAyYXJkZ79/49+P7dQaqwoPkNYWikrHk7CX0CENhhsVH7bS6eKzcRHDKqR4XdyLk
	 kxVK0tANPRjDCvKnTRqVxmnGE4vxJLXDZjZ8BtGR0U50kLqyxljlIV8iwpuX9k6Hro
	 lRRPJGGtg575w==
Date: Mon, 23 Feb 2026 11:37:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document
 the Eliza ICE
Message-ID: <20260223-loud-acrid-coot-bff822@quoll>
References: <20260223-eliza-bindings-crypto-ice-v1-1-fc76c1a5adce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-eliza-bindings-crypto-ice-v1-1-fc76c1a5adce@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93657-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 7D981174FCD
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:44:02AM +0200, Abel Vesa wrote:
> Document the Inline Crypto Engine (ICE) on the Eliza platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


