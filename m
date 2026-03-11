Return-Path: <linux-arm-msm+bounces-96938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJfZKYVGsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:40:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02771262629
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDC443250E8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6EA3C8717;
	Wed, 11 Mar 2026 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9z+qsWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F21A6815;
	Wed, 11 Mar 2026 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224148; cv=none; b=C5n9TVW/cgpMwfs2nQlauueHHTH9eYjYYlZd0RfcdRZajSMhXG63jL3wDp3HflF3g3rTjgPh521K9ZqODHR06IUmd8boqcduToQZbiO4Hy4d1dpEL+L16wv1hMnufGWE4SUeGP++O42itMu5AaisadWlxDczvmBipFIHooeBV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224148; c=relaxed/simple;
	bh=YW6jK4q1cRoVbL/Q8w0pHJlD6v45FmOUjMdExgNkh6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cbv1719qcnp7JMB3xCxHIFc4icFUlN0cCtN3wmn+EIYO+E3vK95HecxgoOQWaKGBU1y9GBuy0T1UFrGyZj6Go3Wcz0Pf2HZzcBuyxMCOaCs8RqgcKzDDLXYcwlTj9ZVyjdIZSzU9AvwKTNNha2ifyQGfc0ldF6sX4zMiDD0YDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9z+qsWR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3B1C2BC9E;
	Wed, 11 Mar 2026 10:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773224147;
	bh=YW6jK4q1cRoVbL/Q8w0pHJlD6v45FmOUjMdExgNkh6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9z+qsWR3ZXL21ssrLYmWYli9WQ0rp7zFuRyhn9DOz1WPDVgjFJf8prbhFN8aE00W
	 Z53DILAD7ShWQkLV8S1NMnxrCytphgMXH8utjCtV50XlZgp2Hf//ywq5MDjV2A8U2M
	 KzziVa1MAJJvB+GkJQnJlXTfyZhnLv8/mF3GRHy7TWTqgA7ZE1Q+GOx64f7mJAV5U3
	 zS4+4e6pIaRqhmndXYXpPG3PhdNVwFCEjhVZXDTeAnfBPWvTDGztISGI1hb9ljaG01
	 p2snkAcAAFW/JhWpe+vUY24ezUbg4DIIGFxInBu7MpN6oLnGdHl8sNUQ1r8nEZ1Shi
	 NTLGZZOS2FmvA==
Date: Wed, 11 Mar 2026 11:15:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com, 
	pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Document Mahua SoC and board
Message-ID: <20260311-sloppy-weightless-tiger-cb3770@quoll>
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-2-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310054947.2114445-2-gopikrishna.garmidi@oss.qualcomm.com>
X-Rspamd-Queue-Id: 02771262629
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96938-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 10:49:45PM -0700, Gopikrishna Garmidi wrote:
> Mahua is a derivative of Glymur with the third CPU cluster disabled.

"of Glymur SoC"

No need to send new version just for that

> Document the compatible strings for the Mahua SoC and the Compute
> Reference Device (CRD) board based on it.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


