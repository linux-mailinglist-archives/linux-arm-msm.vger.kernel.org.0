Return-Path: <linux-arm-msm+bounces-100082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOMKOl8MxWn05wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:37:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E769333863
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30ED3318E434
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005B03BD629;
	Thu, 26 Mar 2026 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUQ4uH4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15353AF645;
	Thu, 26 Mar 2026 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520060; cv=none; b=p5U5cHRMy5ytXTPxKzuI30pR6u+bPrSbfrlvEH3L/tEq71OzoNdugJNv8t/3KV3+mxwJFpasjsmrYKepXlaKwkWeIIisl/IY5wLoxIb2Ly59zVS3Rf4iV4JvziQxFlcx3DtVAUNANvRrx+bG56T2dknXZKugTy5nngBbJZ+ZgQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520060; c=relaxed/simple;
	bh=JwyM0QZfb86+QwRrN223Y00Z3tm2tXge4lHLjaRrDrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtLAHkV6ZMp1Vgjv2SKdNtjikTJkuVR5/rzvDv1guAoHtHJB+M6NEkkiHZQpCAVJr1XCMO7cBw9u5Ton1f4KmS5x61IITgLsleYqrBII08fzu5v3iPuKkCqvy94QDhXkWMi6Fil5/3J+N798L3JZ44Oq5XKXj6hRMHjV7GxuFMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUQ4uH4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBDDC116C6;
	Thu, 26 Mar 2026 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520060;
	bh=JwyM0QZfb86+QwRrN223Y00Z3tm2tXge4lHLjaRrDrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUQ4uH4OtLF/ayrZYaDD0/ue+T5UZPmoAQJG6ei1em05BJCiP1z1U88YtC6vC6I+P
	 NYFlHzx56w7MTx83BpsnYMwMitcLmED3MpRBS1dHXYM7Me8ZXYndDX4L6ViMmUZ/R8
	 xTj3xqevTvwI0n40vLHRwWWaEQpQpuXBm266ymKlJTg6PMOkFvw1ZJcuTqvh2Q93f+
	 VxIpzycBlqj/pWFdHvZLlNx2L+T0Tt3sJa9jIoLJ2xkbJ9+q3SyrLZmt4PwHZMzhJ8
	 LX5p2V5n6BdzSfynUMWNfuAuhd5tl3i/c1OspiwIv1JchefXQ+aSB3VjLs8zhWTIgq
	 7bTr9QAgRQb4Q==
Date: Thu, 26 Mar 2026 11:14:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document ipq9650 SCM
Message-ID: <20260326-avocet-of-inevitable-gaiety-6dc8db@quoll>
References: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100082-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E769333863
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 05:09:43PM +0530, Kathiravan Thirumoorthy wrote:
> Document the scm compatible for ipq9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


