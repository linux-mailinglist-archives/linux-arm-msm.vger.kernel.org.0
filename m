Return-Path: <linux-arm-msm+bounces-110370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gu0hEhvMGmoh9AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:38:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A53760C8B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D781730158AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 11:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571DF39C006;
	Sat, 30 May 2026 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TV40RShq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653C01E5201;
	Sat, 30 May 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141080; cv=none; b=RNSwbUZvCUdFgg9V6wfKyunASW3RLqqhTlM1PK1REsyar718lXN3DKC8KfgxbEkZF9G55o0Cv0lTcusfT0UcaRqJAKu7SgnVnTyhhgp4bXRY1S3/wBQ0yQWqR9TpWkyk6Ufd1e4Y/AjLHWfBZmsqI+/fdPTuiZD7JUtgaCAD430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141080; c=relaxed/simple;
	bh=2aiI1r3zg+/0XbovJ5OQbberURXSE8VAoUFWJIamNc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6o76LatWQhqChcZ5XtLTWH/a7iatOLijYSBBCvYEzLXkF4Ot9zKq3PNgjKcLCQaXagr3p2NqqrbSzTFroRZdzy3JB0Dzo199t/BDAgweNCWM0tswiREtL2hrQ+RyTT7vAMsfc7E5tPbSrDRRzloenosZY4YKnIH8rmjOuXNPII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TV40RShq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817571F00893;
	Sat, 30 May 2026 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141079;
	bh=sdc9x4Y45qdWvGNfTfHjNpjsc5UtJuGGAV9/b/Q37m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TV40RShqPgbGb8hwuMkMEi9WQQGcrGn7pCA0KAV4+E43kJI0GPZ0QBl3NRBC9OY0W
	 2zBNE6fgbYM4p4lGkyzIdPk9zj6gvOyLQMhzMCcNKQ0POAK/k0yxdF2TS+2V+dusaU
	 jtgM0p1gcG0YNZK8/wj4DnYzj5pWc9a5Cql91Bo2OoUvZouuGx2hG8HNztQGH/DehL
	 34UIfcKsCVVHNBkTOD+wg9YTHuQVCKiYDpYg8dAAvKdYTvEaRVP4eBi/8D8SMQQSax
	 LE5AuNPbtx7neECT6VaOtL4QvZjYRDDI7QomrS8isFm+B9JMgk0+TUZRPXoRdv24dq
	 hlM8/M1BhNctQ==
Date: Sat, 30 May 2026 13:37:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Message-ID: <20260530-cordial-civet-of-enrichment-89eacd@quoll>
References: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
 <20260527-yukon-eagle-v1-1-98119d64a71b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527-yukon-eagle-v1-1-98119d64a71b@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110370-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9A53760C8B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 11:08:01PM +0300, Erikas Bitovtas wrote:
> Document the Sony Xperia M2, which is a smartphone based on the
> Qualcomm MSM8926 SoC.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


