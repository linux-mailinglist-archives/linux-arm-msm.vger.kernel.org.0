Return-Path: <linux-arm-msm+bounces-107738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJS3JejkBmoHowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:18:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F654C3FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB78E3113C01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C66F40F8C9;
	Fri, 15 May 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvv1IfIX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0723F3F4119;
	Fri, 15 May 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835100; cv=none; b=Df+OLbhVs5QqoYPRJR/m2u1mYqOkcE1hk8AJntUXfAoudT3RCiwWJJvOrAFSlZBj10A6lDMMqrZqnJ7msO8tQsj99+E7bGylnyZssXWAA0y3bT2WszjhyMD2OaUMQjzq94J/iEu8UtGAcYaJN2xmSUCDuTfZkyJAeR7ARUOh5Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835100; c=relaxed/simple;
	bh=GUDh7csve5Af1Ir+XPRcGhmpi3nn8y3D30mqwIhD+Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azeeULA4eSCktIDpDwABAQJACAreTcZc3TUR6gMbYJghZF/R2+Z2Ut/u7NU2H+2BSAwMhElJorRCzgii6WWYipr6Tt4Q7heKNJZjFQkuNZRAZZXkCZx6dm6bF0OVUEwrtjONPe17UlnTOe+74I+Sgh91yh59/Dh3V1wrVBJHy2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvv1IfIX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B1DC2BCB8;
	Fri, 15 May 2026 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778835099;
	bh=GUDh7csve5Af1Ir+XPRcGhmpi3nn8y3D30mqwIhD+Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvv1IfIX+ZBhMY8G9UetoR0uoqNjjcFeLAt3il2BC9JTuHY5MInnFdXZ5tUb8PqHg
	 qL3Xbyjy71xJ/jvam8M6axLkhOvI6jzCyY7lGZ6WYdD3tpb3boP8hVOIR66iwTPMlA
	 HSwD7I0xlCK7EYN19OEcbZxL3TeaRPzBBzQ2goIi8465urOFKL2mjRuW+J5zfmgyzA
	 ucOcDbsmWZszBqMwHqXhVa/dF3Y0+vGxMLPOEG8nKligwC/Im8jTjKaL+XLaRzK/ej
	 BfR/HZIkCLqLHchBHpMh/+pO2dxC4ExCtzME8dHmkZddGZUzepO7ryBrsEFq3+Fr6b
	 F4W/OWdBBTUhw==
Date: Fri, 15 May 2026 10:51:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Message-ID: <20260515-pumpkin-cuscus-of-expression-cec1ea@quoll>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-1-716438330dd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-shikra-dt-v1-1-716438330dd0@oss.qualcomm.com>
X-Rspamd-Queue-Id: F08F654C3FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107738-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 09:38:04AM +0530, Komal Bajaj wrote:
> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
> passives, and is designed to be mounted on carrier boards.
> 
> One SoM variant is introduced:
>   - CQM: retail variant with integrated modem (PM4125 PMIC)
> 
> Two EVK boards are supported:
>   - shikra-cqm-evk: pairs with the CQM SoM
>   - shikra-cqs-evk: pairs with the CQM SoM, with no modem support

s/CQM/CQS/

but anyway I would prefer to use full product names from
include/dt-bindings/arm/qcom,ids.h (so CQXXXXM).

> 
> Each EVK provides debug UART, USB, and other peripheral interfaces.
> 
> Add compatible strings for the CQM SoM variant and its two
> corresponding EVK boards.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 2741c07e9f41..f041d71d7957 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -963,6 +963,13 @@ properties:
>            - const: qcom,qcs9100
>            - const: qcom,sa8775p
>  
> +      - items:
> +          - enum:
> +              - qcom,shikra-cqm-evk
> +              - qcom,shikra-cqs-evk
> +          - const: qcom,shikra-cqm-som

This is not accurate. The SoM has physically different SoC - either CQM
or CQS. You either need two lists, like Toradex is doing (e.g.
toradex,verdin-imx95), or enum in the middle of the lists, like Renesas
is doing (e.g. renesas,rzt2h-evk).

I prefer the first option, so Toradex choice.

But for sure you do not get the third solution... Really, you are not
supposed to invent these things, but look at existing solutions (and I
was mentioning Toradex during internal meetings whenever someone asked
me how the SoM and carrier should be organized).

Best regards,
Krzysztof


