Return-Path: <linux-arm-msm+bounces-105714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJyxOBF9+GkowAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:03:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A34D84BC1C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B854330098AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 11:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ED43A6B89;
	Mon,  4 May 2026 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JY5rRiWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0433A6407;
	Mon,  4 May 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892610; cv=none; b=fLHRNZP4hpG2mssW1piKzG4dWSPDOgZVd7r8SUwLtIlh1hxuROwz7BoajWWXfiXDRP30YkIhsskWAO03qEnL6u+F9+3vs0Gg123BS+7Fufnt8zW6xFgkjUXWKhcj2lwJsjNvWOFI82YG9yNoo4ad74IC5lHykZNJvwGCRK33pGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892610; c=relaxed/simple;
	bh=uKYVjUYMoZrWU4XmGoPdkRVCcDv+agPEh4z0uOW2YUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKd8BVMifGKxNdEMC1uFnsPvdkh/E9tNUa3+vMay0jZZovtehoFDF3ksC8Q0gOMGrT6MLYC6GYFSrKu3+3547Z6eppnpH5rJRXBRGHyZuBbNkTPtx7okMhSQQJAJF3ewnqYzCdQ6A6p29cISwoGRKEZdTMVNPCrCirw9CovXIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JY5rRiWt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BF3C2BCB8;
	Mon,  4 May 2026 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777892609;
	bh=uKYVjUYMoZrWU4XmGoPdkRVCcDv+agPEh4z0uOW2YUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JY5rRiWtLlsNlHO91YVp6QUXIwg6vMICVe733HyGvnQodbqVAmBwvp9ElmeGXNKwy
	 3reOlyqONTJmH5JPFU1sVLDhMIJzg3LFSUAwBf1OBXrbaJdY3+2hmMP91flsDTd+Rk
	 AsqgCjorVyRK5rEloD0ekbiZiZyfgSGvMX/qZwQYh2Ylib70u4PbcEVQozrpkpyOmZ
	 6BA1UZ7+HmtdJLDtC7w8NPJbTXLu5gWz1EGfX2FVcFkDCcSrNvvvEOXVWSaAK2eakl
	 lFw+QkiDl4Kp/EdCB+7/2MCEOrTlCn70JoO9Uw6Amh4+R7tOp/6qaG8vUkOadFi9f2
	 nqnubaTuIOV6w==
Date: Mon, 4 May 2026 13:03:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra
 SoC
Message-ID: <20260504-utopian-civet-of-symmetry-ed48a1@quoll>
References: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
X-Rspamd-Queue-Id: A34D84BC1C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105714-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 11:23:46PM +0530, Komal Bajaj wrote:
> Document the SCM compatible for the Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 7918d31f58b4..bb1e0a0d1d3c 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -65,6 +65,7 @@ properties:
>            - qcom,scm-sdx55
>            - qcom,scm-sdx65
>            - qcom,scm-sdx75
> +          - qcom,scm-shikra
>            - qcom,scm-sm6115
>            - qcom,scm-sm6125
>            - qcom,scm-sm6350
> @@ -146,6 +147,7 @@ allOf:
>                - qcom,scm-msm8974
>                - qcom,scm-msm8976
>                - qcom,scm-qcm2290
> +              - qcom,scm-shikra
>                - qcom,scm-sm6375
>      then:
>        required:
> @@ -165,6 +167,7 @@ allOf:
>                - qcom,scm-msm8660
>                - qcom,scm-msm8960
>                - qcom,scm-qcm2290
> +              - qcom,scm-shikra
>                - qcom,scm-sm6375

This looks wrong or the diff hunks are confusing. Aren't you changing
one if:then: block for clocks and then second different one which
disallows clocks?

dtbs_check on your DTS would tell you...

Best regards,
Krzysztof


