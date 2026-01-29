Return-Path: <linux-arm-msm+bounces-91204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBjGNq2ee2nOGAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:53:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47126B3444
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 079743008A67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FD63559C9;
	Thu, 29 Jan 2026 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZdSWXS7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0545F34A3A5;
	Thu, 29 Jan 2026 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708984; cv=none; b=uM8PbhtuUW8Mc5bNMdImI4vZgdwGwwSRumirhUuJlRU5JFdvTlzkQnsHENWd0Z2Ru/tDXAOlYzTovXWFNnjW26DshXR3pnOt8ybUrdT4xjWBF5XULU8mmb5jSYCV6wo1IeBiujKAGej6EWF1KqKH/Uym+3DCL9OItCBPFOxdEeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708984; c=relaxed/simple;
	bh=gEHvadmzl4LEDFhKtaFmMTseScHIiexCv2jMG2q2OBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgQbYEyFqqiJbqRCWC3p8b8hSj8zxOvzVgpI62EMlCo6pzHtJhpU94Te9JVne30u5owCMap33xpWvSr05Rg0NN6i17/FVJglRWkzAcKCHhEHZHciv0ppMPuX3SsjHHueYL7gCfTjME4yXrlqGJRFuWdnY/64q1zN+yLP2UsllG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZdSWXS7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BD3C4CEF7;
	Thu, 29 Jan 2026 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708983;
	bh=gEHvadmzl4LEDFhKtaFmMTseScHIiexCv2jMG2q2OBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZdSWXS79SpaW+Gx+Je1m1wWbFwi1Ifrw3myZZMUv0w4uZ/KNDO0+HStzBlUv8oUB
	 Lg5us3Bnyd3curqQlOdE57irw++J9A/xAjACuEkAtX37oEkoCqlL7KLRaVdEeTF9E8
	 09ESqfTtShYPqL1OPt4VD7uXjl3ElXPg9Zo84wT8xKvXPeJ2L6oY9O49qOxAdH7uMp
	 EnlXSpVGQIGmhh4sEj0kHiMxS82jPDCcKeFPkh5U+OJ0xRBlgSkjv7xHDfjkzlDkVE
	 xIZELpAAHN1jEWSASTnUINVrMekJh7x9KAJfgapEA0wkPVmsdqRpsnUyMujhoiIkeh
	 RbZud8PwK+zEQ==
Date: Thu, 29 Jan 2026 11:49:42 -0600
From: Rob Herring <robh@kernel.org>
To: Saikiran <bjsaikiran@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, andersson@kernel.org,
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow
 regulator-off-on-delay-us
Message-ID: <20260129174829.GA1324020-robh@kernel.org>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260127190211.14312-2-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127190211.14312-2-bjsaikiran@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91204-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47126B3444
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:32:10AM +0530, Saikiran wrote:
> Add the standard 'regulator-off-on-delay-us' property to the list of
> allowed properties for RPMh regulators.

You almost fooled me, but 'regulator-off-on-delay-us' is not a standard 
property.

> 
> This property is required for platforms where specific rails (like camera
> LDOs) rely on passive discharge and need a mandatory off-time constraint
> enforced by the regulator core.

Does enforcing some off time on all your regulators cause some negative 
impact on the ones that don't need it? If turning them back on is 
performance critical maybe don't turn them off in the first place.

> 
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index 58bb0ad5dda4..b02311263191 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -131,6 +131,8 @@ properties:
>      $ref: regulator.yaml#
>      unevaluatedProperties: false
>      description: BOB regulator node.
> +    properties:
> +      regulator-off-on-delay-us: true
>      dependencies:
>        regulator-allow-set-load: [ regulator-allowed-modes ]
>  
> @@ -140,6 +142,8 @@ patternProperties:
>      $ref: regulator.yaml#
>      unevaluatedProperties: false
>      description: smps/ldo regulator nodes(s).
> +    properties:
> +      regulator-off-on-delay-us: true
>      dependencies:
>        regulator-allow-set-load: [ regulator-allowed-modes ]
>  
> -- 
> 2.51.0
> 

