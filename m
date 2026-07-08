Return-Path: <linux-arm-msm+bounces-117581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0BeCCEItTmqKEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:58:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC25724952
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:58:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TSzrxP6d;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117581-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117581-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 083A3304704C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3152242B338;
	Wed,  8 Jul 2026 10:57:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75D423161;
	Wed,  8 Jul 2026 10:57:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508245; cv=none; b=Pue4ig15d4tTSlX6TIgQe7jdJUFH+WDGN5c8GURZuZUhzjBOc4cfhBAz/V2CnOqSoW702VJJyrA5zNy700b6v5/f0/wE7R9ykUTcv8HG3zbRN4oD97HXpbUxXCd5V57elcsPStIn3sKf/FWPqHbxITE1VsBCsaKMZQCBSWUNs0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508245; c=relaxed/simple;
	bh=KPcz36VVeuOxBqgsDYTD3PeBX63Dyo14K+ijXZsnwB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYuyNGS5qhjnONkrjOVbxQMDvB8QWC+cAQ1vgl6guEtSlwvGLhhkn7HXGRM9vQEEJGdiVzd3tLm858G4kHlWcxOMCCXmrUK9LswoTWOL6VDj8QdESF4AI6Whf1kO4eQhHWkb08dmmX+uFxSPwRiw4DMsCJs4Owq/VbT8QAPIisc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSzrxP6d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DB61F000E9;
	Wed,  8 Jul 2026 10:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783508238;
	bh=lbdwa3BjV0ySEMW85e5BW9zBU9bBHxFYsMhlWM+KTR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TSzrxP6dYmx+d1/ATLvSNGJPiEBf2LQo2llWK7Obmi73XqH8l3p9Xh7W5I0UIFeiy
	 81AKgJJL3ddG9xfj3iLWIs+JQRq7liwHiENPKeRSfSIgK155a100xYw01MrPYhaJNI
	 w3D9rsHZPjasx22VURWXuaLPStE+lFScOWcAOotpgFLf+EdXxjjvOOOvhYWDFFFKgy
	 +3djBDeevXjl1WPrt/9clhSMeOA48gTKkDHIwju+c3w+f0bAaP8u8i10+JC8heExNG
	 uyURcMV/nTsHv0k0DOeTWhK2d40RGQY3J5J6HcRutvmC243jPEG3bcyQ5Hfr+bgTOK
	 Ilnu2JzRn1FOA==
Date: Wed, 8 Jul 2026 12:57:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
Message-ID: <20260708-talented-refined-kelpie-a68e05@quoll>
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
 <20260707-maili_videocc-v1-1-ef0828c0bf6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-maili_videocc-v1-1-ef0828c0bf6e@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117581-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,quoll:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECC25724952

On Tue, Jul 07, 2026 at 11:43:10PM +0530, Jagadeesh Kona wrote:
> Add device tree bindings for the video clock controller on Qualcomm
> Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>  include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index a6fd1992d6d2f9c05751de2dbf2b53fb96de2958..6281e5ec8036b99ca21740c7f679f4b55edbb87c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -18,6 +18,7 @@ description: |
>      include/dt-bindings/clock/qcom,glymur-videocc.h
>      include/dt-bindings/clock/qcom,hawi-videocc.h
>      include/dt-bindings/clock/qcom,kaanapali-videocc.h
> +    include/dt-bindings/clock/qcom,maili-videocc.h
>      include/dt-bindings/clock/qcom,sm8450-videocc.h
>      include/dt-bindings/clock/qcom,sm8650-videocc.h
>      include/dt-bindings/clock/qcom,sm8750-videocc.h
> @@ -29,6 +30,7 @@ properties:
>        - qcom,glymur-videocc
>        - qcom,hawi-videocc
>        - qcom,kaanapali-videocc
> +      - qcom,maili-videocc
>        - qcom,sm8450-videocc
>        - qcom,sm8475-videocc
>        - qcom,sm8550-videocc
> @@ -72,6 +74,7 @@ allOf:
>                - qcom,glymur-videocc
>                - qcom,hawi-videocc
>                - qcom,kaanapali-videocc
> +              - qcom,maili-videocc

This I plan to drop, see:
<20260708-dt-bindings-camcc-required-opps-v1-3-ae0871774210@oss.qualcomm.com>

IMO, this patch should be rebased and come after my cleanup.

Best regards,
Krzysztof


