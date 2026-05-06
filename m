Return-Path: <linux-arm-msm+bounces-106068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ABaFbjw+ml1UgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:41:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 557394D7581
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F0633300C7DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 07:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE003CCA13;
	Wed,  6 May 2026 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NX5j8+DL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3613A3C277C;
	Wed,  6 May 2026 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053296; cv=none; b=ugioMs1gC2njnoDOktueVRLu6TvtOURzihWp0L6jIGLI+dmcII1IeIDofAo/rKfGz3Rq5tNrqERuAwG3tBzvRt3MMtw4J+f/ZnSeieCtguvzx+S6W9ePQtcc7W/GO7+kfPPNV62mnoQnNYp5ISIRk0kTcxtNXsZ+0CR2e0yobRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053296; c=relaxed/simple;
	bh=GXVXhZGikhOcellttunRt1yhv2GRkmg9lFxj+ADsBIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KV1VR1SZe5CaKCRxnmgfY2lMQzUBeBS4+uVEZs5piPFA4g+oLXAa8t0wi2xiSthETnc9gY2LUSDYkAiadq1wnQoHt7NtRZ4m5G74o4MsFJ4dOdioT8ThtKxNqVwteuXYo7o0ukV5M7QB8BaNtGETR9eeo+weAu/PYvknZHAFboU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NX5j8+DL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EDEC2BCB8;
	Wed,  6 May 2026 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778053295;
	bh=GXVXhZGikhOcellttunRt1yhv2GRkmg9lFxj+ADsBIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NX5j8+DLujUI9/NQl8kAjb2CU7WbfXJsFl/WqfGb9h/K02R0yrnDIu0iGWL4Gd22H
	 GgO+ECjlX5X9j23Grh9yp9i29z5Gj5rqmigGBbCOcTpe5NJ0Th437Kt5OShixZuoMY
	 hZIXuH5gnGqQCH7Q3/Ir9hzfOf3Cg2qmdRSzOo8B2XvPz+MoMkoEfZ1b7lF/YNFNRA
	 LFncmKl5PP3MpaDFRcPxYdGi2oXYPOOgYSMFUUVVzpcGgHFE+X4TQdqJj2wPJFdMcf
	 w5KlDWW3nSwWGBkTJZvGUV2ds83H02ZE7gRsbys0FnUTnzoGiQYt/99z8sPiG0dXbm
	 rdc3HuxMN2J8g==
Date: Wed, 6 May 2026 09:41:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: William Bright <william.bright@imd-tec.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add IMDT
Message-ID: <20260506-light-taipan-of-courtesy-8bfbcf@quoll>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
 <20260505-imdt-qcs8550-sbc-rfc-v2-1-b4767d0dd421@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505-imdt-qcs8550-sbc-rfc-v2-1-b4767d0dd421@imd-tec.com>
X-Rspamd-Queue-Id: 557394D7581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106068-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 09:09:51PM +0100, William Bright wrote:
> Add IMDT (IMD Technologies Ltd) to the vendor prefixes
> list.

One line. Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ee7fd3cfe203..2db12a1cb6e1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -769,6 +769,8 @@ patternProperties:
>      description: ILI Technology Corporation (ILITEK)
>    "^imagis,.*":
>      description: Imagis Technologies Co., Ltd.
> +  "^imdt,.*":

Domain is imd-tec, so that is your prefix.

> +    description: IMD Technologies Ltd.
>    "^img,.*":
>      description: Imagination Technologies Ltd.
>    "^imi,.*":
> 
> -- 
> 2.43.0
> 

