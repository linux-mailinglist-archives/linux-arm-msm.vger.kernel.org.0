Return-Path: <linux-arm-msm+bounces-108401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGEBIzofDGqoWgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:28:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 449A157A0B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04D0630309F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E723E121A;
	Tue, 19 May 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUyGG4mo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832C83E1204;
	Tue, 19 May 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178919; cv=none; b=HyO24/5DCFJSotpMIFo/N3ACjF0hmCy/4OlfPK6D1qv3/QhNRHJEgj1YEDNlSNcYMSzhXR5Wd/We3sYKtNu2R3JaTNU+NyVtUdG9F42P3joBAhcpFgrKQhFHM6OPPlF6U6JsmlEj00d3PSncglAUcXGj2BG6Pbcm2dZWGwPlW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178919; c=relaxed/simple;
	bh=jW76pzp0sOdf2l4htMdq55N8bvvlTvZo4+2UV1iNegI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQzR3kGycuuiOY8DNYuKJrdyc5EdsS+iNeaU4IKkbcmtpgI227ZQ2UxyPl0/lnWDap4nsGae66INSFHd5Hf9Nk6QbmBytPk85QLAuAumh1YUeWR4GGRgtSIqxXrNKRhYUa64X/mUneGsJhxLA21/3Vkm1sXZ4tyn3UhZzjC4rRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUyGG4mo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A98C2BCC9;
	Tue, 19 May 2026 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178919;
	bh=jW76pzp0sOdf2l4htMdq55N8bvvlTvZo4+2UV1iNegI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUyGG4mo2oBHW2uYFmMvvSoEA666+FebGjYnIhqBwlF96s2bQ6qSkXRj6dsy1btfN
	 pSXw4aGjII8xDDfdG5tXjZz7fYVYvPOEpsY7nw9RO1OoXmySku1qQhMB3wKEdwBNfQ
	 q2+guf6wvPFAnAZaxxU51U8BAv8pIi/RuhohQDCTFzTHNJ6geFYsHmB3aBGdh/DYfe
	 BN196eGHWivwzowJPduF4enHq4zsSxDgny9N7KzHTf6/sqwF1idy9Wz9ihXRpgwthy
	 3BhqTycYmKZNb+3mAAnu6kp65T1lXUP/PPdvcIYl+3Muz2SnPcp25iEPHrXvcWDFSX
	 CfR+Zt6s57LZA==
Date: Tue, 19 May 2026 10:21:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Message-ID: <20260519-uppish-lemon-hoatzin-4de233@quoll>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
 <20260518173039.20592-3-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518173039.20592-3-blfizzyy@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108401-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Queue-Id: 449A157A0B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 11:00:38PM +0530, Ajit Singh wrote:
> The Vicharak Axon Mini is a single-board computer based on the
> Qualcomm QCM6490 platform.
> 
> Add the top-level compatible string for this board.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


