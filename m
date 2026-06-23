Return-Path: <linux-arm-msm+bounces-114120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K/0pCmtLOmrz5QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:01:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D26B5841
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:01:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=J5LYJiiU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114120-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114120-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E563830DDE8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DD13CF208;
	Tue, 23 Jun 2026 08:55:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DCC3CEBB9;
	Tue, 23 Jun 2026 08:55:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204947; cv=none; b=t7PuQlebZ6YqG3IA4gCQmZvUSyYt/q3bUbL5eRWNFmfha/j/QcvXbSozvYI49pzb03yZpKjmQ+83d0vfMHNAKY+pH3GOuSphKPsu72HEiLvpO34mRib0YEiGm8i1uuyspHgNOhBzZjyZXBcoHxPEFuIfpDOJBpftdfQp3V1Z2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204947; c=relaxed/simple;
	bh=jGwyzwpV+0fbRB304ZsBQubFjjTShLOmX41SJ6Iuny8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9LZ97MOF3XydbnLLz8W62Yq2q7tFgVVFtE9MoU4T791tZzq8ub/uJN31WUQ/9TCu87Lqt5Z4e9+HFtjBbr4ooifTi14lEZRHNnJAhjl5e+cyxdiYC0OxMA4mRWTp6WEq+lXaKQnka4005cZhfszudLqcy7YKMNHeo4afiZLoJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5LYJiiU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4161F000E9;
	Tue, 23 Jun 2026 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204945;
	bh=4X3bBQc3lvKwGqiHYbAt5IGECs2yaCHfuNxmosYV04c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J5LYJiiUjJkIs72bmaLxztLrP4euT6PWAllXHlNCC4TWiM6KcZgJfg1VxwVGnCs5q
	 v6OBFJ43UP7bCijAbNb8/mbzWxCIZoeQ4JDlVCuYFLwVUFr+OrgkjaBLUR7+1DYGcp
	 zN0b4Yp1Kn6MiNmNd7Dvw4QSTgCvOCVwa7uwwOeirCemVse+WRCh+RmdiZ2sBrb2Jm
	 j5PlIxXo/PWCVivrmTCrqegxBBXv2UNyMVC+VvIgEaVjuN1QJ3GD4ovTAEjrdC3iUd
	 biSMdYIfxYnHeL2QNJ1ntLnn35iEUUIUIXMjYYrPGa3jlYXwkWLoGMcUu9Fs8R/595
	 TuQ5JZKoIMmEw==
Date: Tue, 23 Jun 2026 10:55:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
Message-ID: <20260623-eccentric-accurate-heron-fece6f@quoll>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114120-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,proton.me:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 025D26B5841

On Mon, Jun 22, 2026 at 09:44:17PM -0400, Esteban Urrutia wrote:
> Add support for IPA in DT while expanding the IMEM region just enough to
> accommodate the modem tables used by IPA.
> As reference, SM8450 uses IPA v5.1.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 55 ++++++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 56cb6e959e4e..c904720008fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2639,6 +2639,47 @@ adreno_smmu: iommu@3da0000 {
>  			dma-coherent;
>  		};
>  
> +		ipa: ipa@3f40000 {
> +			compatible = "qcom,sm8450-ipa";
> +
> +			iommus = <&apps_smmu 0x5c0 0x0>,
> +				 <&apps_smmu 0x5c2 0x0>;
> +			reg = <0 0x3f40000 0 0x10000>,

'reg' is always the second property, followed by reg-names.

> +			      <0 0x3f50000 0 0x5000>,
> +			      <0 0x3e04000 0 0xfc000>;
> +			reg-names = "ipa-reg",
> +				    "ipa-shared",
> +				    "gsi";

Best regards,
Krzysztof


