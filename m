Return-Path: <linux-arm-msm+bounces-97688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM0tHQEktWnFwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:01:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740BE28C417
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 692553012820
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5EA29DB6A;
	Sat, 14 Mar 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P28Ozixk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A4286405;
	Sat, 14 Mar 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773478905; cv=none; b=jIkrz/Ic+btxlytc1ebHDqrrXQ41VEvwmGiRXiNpCmSSW6UhFDV7Qzw2UeBDBFdRqJwJHWccC4Ng1QvxillE7iKYH7b0DI8W8XEHf7gO6qKYThtqcGraU6TOpi8gPq+ckCD1XY8zWD5DHGn6Ey2zlWNX7jD7erDw6IigDkfRpFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773478905; c=relaxed/simple;
	bh=3un0fWnRuKDl/f/T8R1D28aJLdNp3WGmfmnjwwjKUOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQLOcXpj7tNvyr5qVzJnLTdQtBON4JXPszzlT2r3A9Idr9u5jP/aM84OxWOWTZIPMnXejzQq2jm6vHZCo6Whtd9MRim4OP/k66ibrwe5ICHmiuKfs3Q2dQFPXpM3ra8UarRiIDpSYjWCHhWnaXKpCgLaePr6vHRUz09sXKOGqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P28Ozixk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C096C116C6;
	Sat, 14 Mar 2026 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773478904;
	bh=3un0fWnRuKDl/f/T8R1D28aJLdNp3WGmfmnjwwjKUOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P28OzixkGBKvfoAsS1woDY+WKvW5nIdpHY8IX0vCUArlyvkZZEs8wC8eIC80Miis7
	 D2f70Sv5zuwcgODWpuMlW0II+znhLawrIF+9s6yhQtqNKmJp5A4x29G8KskNEOPdMl
	 ZyJHNFO2smhPaeCFRsHvhousAwrq7lHtYnHjIfM7dREGjvePqp6Vh827Vb0QlGOlmI
	 l2spjrE26+X5X5eRI/g9SBwxAXQLOWlul4Zxt6dtNmzqeCZrB3GWRyDsXwaf47VynR
	 +3hyeo6HMgJHV6Mun73BuySav99ZgAiov36i76TMS+7c7Efzcjq5djdT4rfSnGBLXZ
	 CPa1TRl1PTCVQ==
Date: Sat, 14 Mar 2026 10:01:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mani@kernel.org
Subject: Re: [PATCH V5 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur CDSP
Message-ID: <20260314-dashing-screeching-swift-ed0d1e@quoll>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
 <20260313120814.1312410-3-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313120814.1312410-3-sibi.sankar@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97688-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 740BE28C417
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:38:11PM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur CDSP PAS which is compatible
> with SM8550 SoC except for the one additional interrupt ("shutdown-ack").
> Similar to the Qualcomm Kaanapali SoC, "global_sync_mem" is not managed
> by the kernel so it remains unlisted.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


