Return-Path: <linux-arm-msm+bounces-108697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M+OEbqNDWoIzQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:32:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2415B58BCBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2479D303D137
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BC239C636;
	Wed, 20 May 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/xu3rRH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D594370D70;
	Wed, 20 May 2026 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272873; cv=none; b=W8vaku3cNK3tR+weNC1+CPg+333oMpmXyLYoUuhabXGTtyh8sndrUbp0UYjrMi0xNCKi1AnhG5QEVX6yry/PCAVZOd7+LhXhRDHbdPeP89+4J7U0n6KmxpZ66rdk+JFT28x8X1Gi/G2oBBvfLSiFupzmJCXoWTzo0tstw83hxdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272873; c=relaxed/simple;
	bh=BnPTcSmpVRwDkfqkdwbPpoZ5ptgPI7d8UI+1EVqrf4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUxXneujIQnFv3JnHW4KokIrbedLPxe1zdN6YzvPREs4A5UzET9X8MQh9kuCcYZZN6KMLSAkYgaUqMfWayPzCTiRuC6qkqQtuV2K+TmVnLrwRHJzIGQXKelKlW9zHj6kPoZaVeUhpW2KLFtqkcQNnPXD/tHfvxjE/NJMRDIjbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/xu3rRH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114581F00893;
	Wed, 20 May 2026 10:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779272863;
	bh=PXuhWMBW4R5WVatyNftyCjjSzFGtkZFEfoCUnhl2YYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g/xu3rRHJHu78ueoKVqHqsNSFH5iH0jAd0+T7Bl68bmI2uDaIS9NPLPkCLhICPRRk
	 3fKuRUCz1NlWypyP0dCZnYAwgHV1kIr60pui+naT/ygRsU+GWlto+qeQGBl/sda2lV
	 oB+4Zsk5thvkaYxMk9N0MLwXZQf/ZHObTVA7UwRQhd044/Vr5hjLbSD0H+oovfwTZL
	 e3NR0L6fA5IvKFYILe+BKK4vzXAqApu9mi41Eifq6BgQke4BWGNaUnA375XnjrCtjQ
	 tdx70pl0qhPDvt70PeF9baq2MpeQsRV1dKf/q5eNww43ju0PTgjWQo1Jb2jHwrQjXC
	 no24TLqpS8KUQ==
Date: Wed, 20 May 2026 12:27:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Saravanan Sekar <sravanhome@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mps,mp8899: Add binding for
 MP8899 PMIC
Message-ID: <20260520-passionate-handsome-dogfish-9fc65b@quoll>
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-108697-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 2415B58BCBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:51:05PM +0530, Vignesh Viswanathan wrote:
> Add devicetree binding documentation for the Monolithic Power Systems
> MP8899 PMIC, which provides four synchronous buck converters controlled
> over I2C.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/regulator/mps,mp8899.yaml  | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
> new file mode 100644
> index 000000000000..3225c92db2c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mps,mp8899.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Monolithic Power System MP8899 PMIC
> +
> +maintainers:
> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^pmic@[0-9a-f]{1,2}$"

Drop nodename.

> +  compatible:
> +    enum:
> +      - mps,mp8899
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      list of regulators provided by this controller, must be named
> +      after their hardware counterparts BUCK[1-4]

Drop description.

> +
> +    patternProperties:
> +      "^buck[1-4]$":
> +        type: object
> +        $ref: regulator.yaml#
> +

Droip blank line

> +        unevaluatedProperties: false
> +
> +    additionalProperties: false

Put this additionalProps after type.

> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators

Best regards,
Krzysztof


