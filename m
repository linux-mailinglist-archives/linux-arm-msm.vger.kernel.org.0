Return-Path: <linux-arm-msm+bounces-107992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOEjFRBACGoRgQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:59:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B156755AFFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6E23300DE0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 09:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3F037EFE1;
	Sat, 16 May 2026 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdMytAET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA49F19B5B1;
	Sat, 16 May 2026 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925580; cv=none; b=hgu3REa3OOn/1sG/4sXtFB7IZizZANmaG32BmZVXqMDmmNA/XzcQPZi2oINaD4W8FMcJRpsYJ1HcplMkObU85YdINc4nkE1H/3gxq4WYymtWdoKTyXq+INi4kJNb1KQ5T9aDYCup2Xf2al3fc6ArbNKzdKcU2jpHt0KV8B8R4ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925580; c=relaxed/simple;
	bh=6tNtF84euk+znVjOJuLcSviJ2wZ7fO+YBywlcbsuVvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfBq1gEPFN2F6VH4PAHKDiy81XtAL2j9BS4UUoy2HCfgAlEQdSmIkrsKYUszsnbyuFvAhRmP8r6/FaOMeK/E/thoPLES+lj9cG+VV+7oCVEDgeAuckaf2eBOYc+5PY2jlRJ5IyrJqxktddUSj3ZSPtmmHtXCRVDBKnmGEvNB7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdMytAET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F6DC2BCB8;
	Sat, 16 May 2026 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778925580;
	bh=6tNtF84euk+znVjOJuLcSviJ2wZ7fO+YBywlcbsuVvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdMytAET/RdylTAxEQgPFV3sd8JUzhA2e+ZUfOmcSZx4Tiv/XdtsAVzFfMLVV0f5C
	 0Hy6vbjMlfT69vw71NNmG+nbM6lGehMvq/PSrrjqzbips2msuvZ70ylueUkCuQJm7a
	 75PG2jIIyEuX/S8ZpgAq1GrdXbDsRm9MJc7e1L5TuCbj66u4+Sf5Zi69aV1nMePih8
	 WwcER4L8Gq732vraj4I7rqA0OKlGvNeXbXGg+LKU2Y3+LLWIH5yiZ4GyuJCyocsScG
	 jnVvRyCxM/QE/K1fsge6K59aogD7z9UulReBLw/PSy0Re4FfqVbx9iFwG3CB4C+ekP
	 SPjr0+NbNm7VA==
Date: Sat, 16 May 2026 11:59:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
X-Rspamd-Queue-Id: B156755AFFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107992-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> boards. Both boards are built from a base board paired with a SoM which
> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> LPDDR, eMMC and UFS.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Heh, I noticed only after sending email - where is any user of that?

I expressed it many times - we do not take bindings without users.

Best regards,
Krzysztof


