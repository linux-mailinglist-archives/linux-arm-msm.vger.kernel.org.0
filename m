Return-Path: <linux-arm-msm+bounces-108701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l9fwOWOQDWpyzgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:43:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBC958BE5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3C74300F53C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F359371D0A;
	Wed, 20 May 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YY5b0DEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B01552FD;
	Wed, 20 May 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273823; cv=none; b=ayzoxBiYKD8j1L+Fslnz8zdzp7Rb+bvUFFmoKm5K5jlzFTNh7I1Vd9Xm2iUbNUKs2V8PbBOTTsv6jZn6srI+g2f5mADm2Q6TaVp3Z36b4WGdLp1NO6sScekSdOZwbRVArJhpXEIX2v6xeikXYmrxC0Xf1kh3zWNUnBJYgo/4JxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273823; c=relaxed/simple;
	bh=bj6Id8EAV3QCFlNOdRDwqcZrzk2gNVRq8xA89i4EBWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/MIllgoU8V27a4H4HDj4Rz+P2rQ+p/AsvcogIQV9HS8gkLOpwx84HEvmBfmc+h2bXDp3Og230na/cMUQhf+feHNdyHTwXKywBmGcPatS5szWD2CKdx1F8ckS3JI55pTha20bwsvFYpd7azGNwPh1UcMb3osfyGY9fjbL64xeyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YY5b0DEU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E8D1F000E9;
	Wed, 20 May 2026 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273821;
	bh=QZv+oZ86UOoW/9p2GNR7IP+C5hYApHGXtBu9CwDd9N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YY5b0DEUP2T740InDXQ5sM18b8TzbgHPEJnsPiw2toEnodbAMok7wxmuGSEb7QZHU
	 WSLtu+MGw+cD2ZJJoWidwqhrAMyL19I5SY9vyvH9nFMK0QJXOraj6uhRR3UZNLKeqX
	 D5SjxhpoX+zEKsH9WNaNAXBTBfpZpx68JBOa24H6zhqu0iCBQx4bHUlenbQ9SRAktM
	 GR2mrcKhxG2HDBStPSgnMcXK5LynZE0DBSx9hBWloHbRDrcu0XbxzkAQCw/9QSXVyW
	 gtuBK2UJVVNXlDm9RvhQDJgz4flAD0cpmb5bNtTJXdZ29dg9RByzOr9RwhBzDHipBN
	 5LUhJbclz1fUQ==
Date: Wed, 20 May 2026 12:43:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
Message-ID: <20260520-hilarious-tungsten-giraffe-5f8cc2@quoll>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108701-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Queue-Id: 3BBC958BE5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:35:09AM +0530, Vignesh Viswanathan wrote:
> Add documentation for the CDSP Power Management driver, which handles

Luckily we do not take bindings for drivers, so I can stop you right
here. This is frequent feedback, expressed many times on the list, said
in many presentations, including DTS101, explained in writing bindings.

> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
> Power Mode (LPM) transitions via MPM handshake, and provides virtual
> regulators for the remoteproc driver to control CDSP power rails.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,cdsp-power.yaml         | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
> new file mode 100644
> index 000000000000..f0f89fdeba4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,cdsp-power.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CDSP Power Management
> +
> +maintainers:
> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> +
> +description:
> +  The CDSP Power Management driver provides power management services for the

NAK, again driver. I finished here.

Describe your hardware or drop entire patchset as it is not suitable for
mainline.

Best regards,
Krzysztof


