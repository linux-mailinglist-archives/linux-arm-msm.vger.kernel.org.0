Return-Path: <linux-arm-msm+bounces-96149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D8dBXx8rmnoFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:53:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66523514C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B6D23006B36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 07:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99F636894C;
	Mon,  9 Mar 2026 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q04OZdF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD736492F;
	Mon,  9 Mar 2026 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042713; cv=none; b=keGj3sPcnjZ9c+/6KDA9gBnzNLzz8n/M88u42oL7q/Ym8J0YsIY5cmIRT5Ofh+z00K790idfif1iKKcU6NPU/bDFheqtpB/fIS+cAUvykIhFarCOV7ys3305PjnT0czAThK4aNpOXwqmmzHKRfG2bsbLJIgoKRG0A17kfA2H658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042713; c=relaxed/simple;
	bh=VY8UI4kwRStHjLQuzei8w8SgS6+okNyaVN4M4QYvoSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOKOv+dSdg6Yha5D4DGY08+V7AaadlZiZLlrFyRYgE3JG/cZN2m5pOV9Bm3YbDKxPrwvdgKDCXkIQm+6neqhITWExrXB4wuCiWxn5KRmKQcwOUwB9Jnq1kv3ss7ocaG1LcNnMBFEMBsXxq/ttKGuUGiOXuWwashD3O0sp+RuUfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q04OZdF7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65D3C19423;
	Mon,  9 Mar 2026 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042713;
	bh=VY8UI4kwRStHjLQuzei8w8SgS6+okNyaVN4M4QYvoSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q04OZdF7gxzSBkpqNgOJRT7USDOxJ/gZ+hMI2lCCevuV1KdPAnrhqjwLWSTbQANag
	 q8tY136SzEGrlRNTmEVPVggF/Prb9LKruq5UZW70beh3tRghTjmAoAJ85r9J8lby28
	 w69EP+AbV5iYCNze6LirTF44ixzIkTodxpP60f47bV1SKi5hKeQ4VMCP24buoEVBPi
	 fvy6aRb9q4fCZZ0xfranzee0D4ttcKYTmM2QJcXa0VKH/nZwm+JmSPNFPfpT9w+J5j
	 TXwKjmpBiVkYMHWfSvs/SsAklF1Kk3Y4ts0Reotpdde0QNT2n7x2y5PIuEWnYjp/Ek
	 MFs8DTJes4lQw==
Date: Mon, 9 Mar 2026 08:51:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: ice: Document sm8250 inline
 crypto engine
Message-ID: <20260309-smooth-angelfish-of-popularity-05efd6@quoll>
References: <20260307-sm8250-ice-v1-0-a0c987371c62@pm.me>
 <20260307-sm8250-ice-v1-1-a0c987371c62@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-sm8250-ice-v1-1-a0c987371c62@pm.me>
X-Rspamd-Queue-Id: 6D66523514C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96149-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,pm.me:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:49:00AM +0000, Alexander Koskovich wrote:
> Document the compatible used for the inline crypto engine found on
> SM8250.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Please fix the case mismatch in From/SoB (rather to lowercase).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


