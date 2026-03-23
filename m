Return-Path: <linux-arm-msm+bounces-99122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKcdEV3zwGkwPAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:01:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E51142EE04C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C1A5305B09A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ABE364058;
	Mon, 23 Mar 2026 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKZ6Oc0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1514E364029;
	Mon, 23 Mar 2026 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252318; cv=none; b=XokBUOx2CsTVTERWQtxG7n7pHMx8gpq5nvtfnVL7W3Gys25TXv+MbC2NQ2Xe4N7k3USt/UYyKn7J/PAkd4LnpChNfpwmCpACEBf+uXHmHKMpNrI/RocGUeS/BDua+r9/erHehh70ihw7+3LtueJAvi+NsgOJAr1LWV3WsVsusyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252318; c=relaxed/simple;
	bh=MiiypIF9G2ZZgD64iNSp8lsNxT7U3ANGaFlGH6Srrk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qayqPBT0hSCop0j2HitWNUsiNYRZDCbhoVV1edp8iSApsYqyo405uJgoPXEc4NzGjQwPPJpsf6ypzpF56jE+ZinPEMeI3Aez48RbOocWdLasxkZUNecbo9VJQhy9Yf2n15EZ33hi4ERwBAk9ledkFa/sn29AR/roTghdF+3GNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKZ6Oc0o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36550C4CEF7;
	Mon, 23 Mar 2026 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252317;
	bh=MiiypIF9G2ZZgD64iNSp8lsNxT7U3ANGaFlGH6Srrk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKZ6Oc0oZrNLuoXRZ3RivaMl01s7Btyds0LxRPv6ANQKxcauy06dyu0LFTcaLrkQz
	 D1dn5g9r0kjvY03pqdUxEAiZ+weh5zuTcBtFMcFdjuRMZExn1q/HAUtgVFUb1qcMrz
	 er9oJ8kSNQvxelZL9EnNmFfTLnEnsFkGD91LgMMS8HXLil8coyrjs6UL2oOPe9iLjP
	 LeNOEscBu/x+9Gu5azKMwWb18IDVvF8F3oqdDg1ApCsfXykkpfK/+RVUHdcIABEz1I
	 9AakRCColgmWKbghwTPA3c6u9KttvLhrmqffEbcWA1d33c3evyJObTiibRKOrMcly5
	 9O5nvqe8eKXLA==
Date: Mon, 23 Mar 2026 08:51:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
Message-ID: <20260323-laughing-pumpkin-oarfish-99fafb@quoll>
References: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
 <20260322-ayn-qcs8550-v3-1-4afa89c20888@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260322-ayn-qcs8550-v3-1-4afa89c20888@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E51142EE04C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 09:05:18PM -0500, Aaron Kling wrote:
> Namely:
> * Odin 2
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d054a8f5632d853509b7cd37f07f02473cf6bf71..ee68963c30eae10fd3b3a5e21bda63ab941893fa 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1075,6 +1075,15 @@ properties:
>            - const: qcom,qcs8550
>            - const: qcom,sm8550
>  
> +      - items:
> +          - enum:
> +              - ayntec,odin2
> +              - ayntec,odin2mini
> +              - ayntec,odin2portal
> +              - ayntec,thor

I already commented on vendor prefix patch, that you incorrectly moved
it out from this set. This only stalls your patchsets, because none of
the trees will have it thus none will pass any checks.

Best regards,
Krzysztof


