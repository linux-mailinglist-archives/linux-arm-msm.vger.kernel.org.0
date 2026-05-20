Return-Path: <linux-arm-msm+bounces-108634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIdHGAhmDWquwgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:43:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A10589155
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F6F6301B724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 07:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B049351C27;
	Wed, 20 May 2026 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiJ/qGGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860D126FD9B;
	Wed, 20 May 2026 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262704; cv=none; b=bc/yGw335AoCJsZvQHeYNVW6s0qtF+ssSivjyTUb1AKXeqyyUi4EvpUFH3BjNBb/tfbYH9Aj+LIvG8kDZee55iv0UvQxwS4Czli2wStu+eDq6Fi7alAhuzpqS/ryd0MFCqd9+VrYGr4Z2FRG3t6QVRgYr9fX6x1KoVos23t5RWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262704; c=relaxed/simple;
	bh=2iGajhYPoM8w5pDSxhmkY2B2ciIGFlcRmO+klsGO2Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rY6/zVGgcPk8IlU9L+aVV4FSU+SKfx0LLn37At6BXJbmG+DGNwTC1AcL5odZFaTwJCYdAZJlim8KKGqB0dX+j+lOS6PZM07v2s5ywM5YVX8Ktk1bIXAEqZ5A1bFbQ1lmfnCJcKT8x2yeB2tCsPF7g+tCY/nvnEpfrPa0EI6p9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiJ/qGGq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 22B501F000E9;
	Wed, 20 May 2026 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779262703;
	bh=sxRRDOsCoNih4UGH+8mNEikLC6FHjrh1h3Cp++QBsh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iiJ/qGGqNeg9Trqa6wRxz2h6uDUlJSLAlM2IgqujfjtZBANlQgSsHakoq7ecA8Cec
	 r0OG+7WHdndJYlMGj7fnOLjxYssGd3xvFH0YOXWwJ55eZtIi0PXS8NstOEW8cRI/RA
	 n4RUaziljoGM/QpL6ZrwAn3h5mSS114APEPh7jbZR3n3Yv6ZoWhl8ms0xzgIvBhjEf
	 RzI0cjntDvJ733mt+frlqYe0qXtqEeiAcxjwtKPKXlXpJ/v3i5rZF6O86ZPVe723+i
	 yznm7P26UoKb1BVkxZeGeTwmBAHFiTcC37fRwrrlBwzL4Z6rRaqw7oCO9Td0VaDZ4x
	 ACxE+jzbFx2Zw==
Date: Wed, 20 May 2026 09:38:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	Harshal Dev <harshal.dev@oss.qualcomm.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: arm: qcom: Document SA8797P Ride
 board
Message-ID: <20260520-acoustic-inchworm-of-education-2fb9ba@quoll>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
 <20260519063505.883379-8-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260519063505.883379-8-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108634-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 03A10589155
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 02:35:04PM +0800, Shawn Guo wrote:
> The Nord is a new generation of SoC series from Qualcomm, and SA8797P
> is the automotive variant of Nord. SA8797P Ride is the automotive=E2=80=
=91grade
> development board built on SA8797P SoC. Document the board with a fallback
> on SA8797P and Nord compatible.
>=20
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index af266d584fae..ab25323c3581 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -303,6 +303,12 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
> =20
> +      - items:
> +          - enum:
> +              - qcom,sa8797p-ride
> +          - const: qcom,sa8797p

We do not use model compatibles for Shikra, Eliza, Hawi, Glymur etc, so
this is inconsistent and should be somehow explained in the commit msg.

> +          - const: qcom,nord

Best regards,
Krzysztof


