Return-Path: <linux-arm-msm+bounces-103792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aItsJ2NF5mkfuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:25:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D9642E253
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C4753033240
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4183235B63B;
	Mon, 20 Apr 2026 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njA37NOT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD435B14B;
	Mon, 20 Apr 2026 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776697510; cv=none; b=rkAbZGCn+N0Sm6tn4UwLkxDPJKskuoUCsziqB13rksVT6GQmte48Sys2F+gKF4E3OAkKqvXH4YC0mzLtbQ5dnEzBHmuZEW5nnyRaxIAdCm2Q+KMQkPVlpgwhbQDFuIMvslb2358SJTCLDl7Kf1gItFY2zYb5gtbbgDgTe7RW2ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776697510; c=relaxed/simple;
	bh=4nct2CqBtU47DDDelbVpOfSzPlqtTlAFLH7S9iKL/wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHMNqkA+oGDprKkgfzH746hM2CJN3NFJSVagtcxMmpE2DE1Dah1Q3vdnRZvRXYAVIm8OBbS7XmBPWxZy4+4ckkSRLlvUoXPFwgEMS+ZSEG0wsgc6kD/pqi1lptpcAw+B4jKwZe8wGt8PzUZ2JKQjhhJgIE0TOidIb/fJ8NRIS0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njA37NOT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E27C2BCB8;
	Mon, 20 Apr 2026 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776697509;
	bh=4nct2CqBtU47DDDelbVpOfSzPlqtTlAFLH7S9iKL/wA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njA37NOTW53dTs0lTFB4gAzQ/Sht5/lbkE7SSyBU7E+7OwSqHj8k9vl3B9C3enCoC
	 bgLBD0780W7/zBfZDwpduz1kHi26pRvr0QjX4ekhfTGGX2ZmWNmKqYQ6vE6iK2f22+
	 3Lf6/lTezIgBfDTfyKyer15Vql93h4b91hvyKufzxcQ66yxkTViXnEw+Uj2MHaLOHa
	 5zR7PQUc+gksBs0B5xuKxX78aAyEIbb6kNFA334fOlquWvYKZ3veQmjgFy5xp2QcgA
	 U4gFDd0MUgT8nFuVR/wyJPhkKNROX0xRuWEsDPqu8C4iGcKP9rHSJhLMnWAwZFj7iH
	 6yICtzqMevlAA==
Date: Mon, 20 Apr 2026 10:05:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: sram: Document qcom,eliza-imem
Message-ID: <177669750588.2498877.10492101946043091522.robh@kernel.org>
References: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
 <20260418-eliza-imem-v3-2-bfbd499b6e77@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418-eliza-imem-v3-2-bfbd499b6e77@pm.me>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-103792-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 40D9642E253
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 18 Apr 2026 10:39:52 +0000, Alexander Koskovich wrote:
> Add compatible for Eliza SoC IMEM.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


