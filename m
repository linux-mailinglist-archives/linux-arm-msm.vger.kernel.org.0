Return-Path: <linux-arm-msm+bounces-103913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOg8HT1J52kh6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:54:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267543929E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7035230A6EBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487DE3B19AE;
	Tue, 21 Apr 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqqLocPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6633B0AE1;
	Tue, 21 Apr 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764876; cv=none; b=quAiRYx1UrHqd+Ni2OXt0LepR1qXPQzGRN1KnzrtFAD1fyCaEnmSj0eHGWdDE8TAawPUI1YKgECHJ75vWGFKTFc444hIvvzfYB8pYV6Ao94ocsJNIcAb91avthfjSY+rZ3Y0SwTybMg7IWk1bdmVs49eadz9frJ3PbFRg+2FSkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764876; c=relaxed/simple;
	bh=W4LFC7jn6OH75RmjKYwuNyY4WJomoN7IYSlxtObDypE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNogGfiUmUT2IGyU9YckJHG6Mt4teYTBkKCBpPvy+drIU3lcLTEeM49ta5r9DHKmK1ERBoWpD2KF+tY9suTCXk0pvcCPR0uMg0W4JZQRPlqFJLtGD8Oq4VhN0Y+3NSKJ9SxwOj/huANw/tGtXijk7SGVVbP6VAkMkPlUKDHOg9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqqLocPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CC3C2BCB0;
	Tue, 21 Apr 2026 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776764876;
	bh=W4LFC7jn6OH75RmjKYwuNyY4WJomoN7IYSlxtObDypE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqqLocPH8j9o4W+BdxWbt6Nks4btHxSSXb7ruyZX/3hR1vxMXiFlNT4jIU+1KwBTk
	 tGk7KZvQa4G2ehSNlN2LehvRX2+YnpLyketzwPOFqCBWtH3DRd4qHFyqzkgVRObJv/
	 LrMiT573PPumxHxLO7G9gz9Ag4gkv20dYnhZLr5B2gwoau3bVDfhQIyAPCV6Y+hxAz
	 pUM7c2tWFBVUFqNAmnIhWSvq68jMy8E20RxAHBUe+TvMBBxlcHiP0uu2k5PFf4gGdP
	 fXqiIfxbix69D35msalJ6JOQQX10L+M4OsVkCeUaxfBXOoOCEVB3MVZLIlj3f3GG2Y
	 Qfjg96cA1YXuw==
Date: Tue, 21 Apr 2026 11:47:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Glymur TRNG
Message-ID: <20260421-eager-judicious-dugong-aed4b7@quoll>
References: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
 <20260416-glymur_trng_enablement-v1-1-60abcfd45403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416-glymur_trng_enablement-v1-1-60abcfd45403@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-103913-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0267543929E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 05:56:11PM +0530, Harshal Dev wrote:
> Document glymur compatible for the True Random Number Generator.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


