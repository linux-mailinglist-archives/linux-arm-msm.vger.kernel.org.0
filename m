Return-Path: <linux-arm-msm+bounces-96538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJOFEmjQr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:03:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291C246E4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76B1F3008D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7E43ECBF0;
	Tue, 10 Mar 2026 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teuuA2kp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6173E9F89;
	Tue, 10 Mar 2026 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129821; cv=none; b=s8cl1yGRBJWuqK0z7wwTryR3i+q0wbbkL1RpIhS0X8FwFrazsnge8I1721xQgg5AWjz11ZWgyu5Yzt+o64Rr9PcBxbT5C4X1Jqxdj9zTHldduFNWeA3xVdZ7Tya/BVnCDgAvzu8/gyH278yPabSdbtqCLkl2TTU6lpQsj0RPFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129821; c=relaxed/simple;
	bh=QYykVt/pMggiqx8fiqzV6OVjRy9J86Tpmjmqb5WNIeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrdhYx/cO4HUM3JQoxcf81gyPtCYprd6N0ApI2tlV4cMVs1EfuzxJq/NqfpqoKxsP9gq0AT9RUAeQb6cEN7r1TvVi6gRmES7Hp2LNiP86ONg5SZiK2oMfH9QKlxUe4D4wWn+yPjZi2qqzgLr5sZW+Ltg0a8OMe8mgvWZ74unJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teuuA2kp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A680C2BC86;
	Tue, 10 Mar 2026 08:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773129821;
	bh=QYykVt/pMggiqx8fiqzV6OVjRy9J86Tpmjmqb5WNIeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teuuA2kp3gzhu+cwPiVI5VO5faos1t27JTpMfjBLLawHKpij/eTsDf0bdZMiNMxyO
	 ScshvvIBXaal4tn1We2WJXK2pHvYD5PetpDbJBdSguimULqDINVYSJkGu8iR7ytpIZ
	 BH22TMGqAKMx3TgHgGE1lsXPrufTUhxSz3x8yoH5uPsbK4jbnUFyLFyahZTQ98GJ3R
	 CC47MKFpss2uHV1ia094ELVyRJ6Osny3IolwpdTaZ6vBPua4VluKZum5/csWBxz7Zl
	 6tuzxIL9RmU67l9B095X9Xog9p/pX7qZOFvK+NxvgvPete5FvNLEtPM8Jb/72FLwgw
	 ZT6rN44pw34pA==
Date: Tue, 10 Mar 2026 09:03:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: crypto: ice: Document sm8250 inline
 crypto engine
Message-ID: <20260310-tremendous-vengeful-wapiti-8d9a39@quoll>
References: <20260309-sm8250-ice-v3-0-418bf5c5c042@pm.me>
 <20260309-sm8250-ice-v3-1-418bf5c5c042@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-sm8250-ice-v3-1-418bf5c5c042@pm.me>
X-Rspamd-Queue-Id: 5291C246E4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96538-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,pm.me:email,bootlin.com:url]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 03:12:53AM +0000, Alexander Koskovich wrote:
> Document the compatible used for the inline crypto engine found on
> SM8250.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


