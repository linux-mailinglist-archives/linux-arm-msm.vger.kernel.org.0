Return-Path: <linux-arm-msm+bounces-93869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDm/M9gXnWlTMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:15:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC0181549
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0E9A304FFA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB13528504D;
	Tue, 24 Feb 2026 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwWM/pPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55AE42A82;
	Tue, 24 Feb 2026 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771902933; cv=none; b=cbq5hqpS6XokAZNpr0Bs0ibIMdiiWURroR7U/7ik35eEU2GvDm4hzXwkZn8i+ntTCqc1lYt3V8RHjljQP76KV528zDBVo6O95fX6KHJ9YwX7JFya7Wwf0w6/TqL56ozlYGQqA41j2mdig6PzImzoxCFGGIAN5vWqo0xI0e7coAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771902933; c=relaxed/simple;
	bh=ujg8PJxPHLTWrLp47StB6vTynQiaJsIrpk/gBeqRkoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6iq31WMT8dPy//GvLE5kiSf8vhORCrOBaKYXkFtp+NAxVtRSQ8GkYhPLV3X1avRRHmRWDdFOmoGDBB1l+FCmQi+SPsuWgodQsjbrJgRQSRaABjg94+EiecAwvZWnurK9G8nW965cSWHVy42uPsrgS3EVWD9PkCSyM7JPGUuUGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwWM/pPZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C008DC116C6;
	Tue, 24 Feb 2026 03:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771902933;
	bh=ujg8PJxPHLTWrLp47StB6vTynQiaJsIrpk/gBeqRkoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwWM/pPZZdWfyewwlIooloNxe/Q3n+RkjLxQW8QfBou5KNSgsaMVK8jD1s25+bTdh
	 IzYmQi6QKf30Il4As+jamj/bsTj5blxqH3syaSGSvqBypMBnvJQUavMIJw2pkDNvLw
	 82jsPjLzgQUxRgkkKq0ei6QwK3ubgppF9/WNgbpcLHBuU1t8H6NsAIAPCDLJGKCzDi
	 7CLTz/xrBPXRjd56uB1VYyhTokMBluBxSWQYVh6AtSwyjfaDnOkA2zbxEfBZSM+88x
	 r2BWH+g+e8tx52If6j5ziHiEKaPpjJS4uOp3zRvud6noTBebN8McLQzjHBIbEuJD2V
	 xiMkffiEYpqyw==
Date: Mon, 23 Feb 2026 21:15:30 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: cpus: Deprecate Qualcomm generic
 compatibles
Message-ID: <decphyalrsuaw3c65qsbzlqlrbvjzj2laaxeyl3qmeodj7aj57@jun6og2wqv4b>
References: <20260223074422.18468-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223074422.18468-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93869-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37EC0181549
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:44:23AM +0100, Krzysztof Kozlowski wrote:
> Move compatibles for Qualcomm Kryo and Oryon custom CPU cores out of the
> enum into separate one with deprecated: true annotation, because these
> are too generic names.
> 
> These are names of the families and there are significant differences
> within individual processors, e.g. Kryo6xx can based on architectures
> from Cortex-X2, A710, A510 to A78 and probably more.
> 
> Just like other vendor processors are differentiated, also Qualcomm CPUs
> should come with specific compatibles.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> 
> ---
> 
> Changes in v2:
> 1. Do not touch Krait and Scorpion because no consensus was reached
>    about whether there is a final model-specific name for them.
> ---
>  .../devicetree/bindings/arm/cpus.yaml         | 290 +++++++++---------
>  1 file changed, 147 insertions(+), 143 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 736b7ab1bd0a..700255e9a002 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -79,149 +79,153 @@ properties:
>        All other bits in the reg cells must be set to 0.
>  
>    compatible:
> -    enum:
> -      - apm,potenza
> -      - apm,strega
> -      - apple,avalanche
> -      - apple,blizzard
> -      - apple,cyclone
> -      - apple,firestorm
> -      - apple,hurricane-zephyr
> -      - apple,icestorm
> -      - apple,mistral
> -      - apple,monsoon
> -      - apple,twister
> -      - apple,typhoon
> -      - arm,arm710t
> -      - arm,arm720t
> -      - arm,arm740t
> -      - arm,arm7ej-s
> -      - arm,arm7tdmi
> -      - arm,arm7tdmi-s
> -      - arm,arm9es
> -      - arm,arm9ej-s
> -      - arm,arm920t
> -      - arm,arm922t
> -      - arm,arm925
> -      - arm,arm926e-s
> -      - arm,arm926ej-s
> -      - arm,arm940t
> -      - arm,arm946e-s
> -      - arm,arm966e-s
> -      - arm,arm968e-s
> -      - arm,arm9tdmi
> -      - arm,arm1020e
> -      - arm,arm1020t
> -      - arm,arm1022e
> -      - arm,arm1026ej-s
> -      - arm,arm1136j-s
> -      - arm,arm1136jf-s
> -      - arm,arm1156t2-s
> -      - arm,arm1156t2f-s
> -      - arm,arm1176jzf
> -      - arm,arm1176jz-s
> -      - arm,arm1176jzf-s
> -      - arm,arm11mpcore
> -      - arm,armv8 # Only for s/w models
> -      - arm,c1-nano
> -      - arm,c1-premium
> -      - arm,c1-pro
> -      - arm,c1-ultra
> -      - arm,cortex-a5
> -      - arm,cortex-a7
> -      - arm,cortex-a8
> -      - arm,cortex-a9
> -      - arm,cortex-a12
> -      - arm,cortex-a15
> -      - arm,cortex-a17
> -      - arm,cortex-a32
> -      - arm,cortex-a34
> -      - arm,cortex-a35
> -      - arm,cortex-a53
> -      - arm,cortex-a55
> -      - arm,cortex-a57
> -      - arm,cortex-a65
> -      - arm,cortex-a72
> -      - arm,cortex-a73
> -      - arm,cortex-a75
> -      - arm,cortex-a76
> -      - arm,cortex-a77
> -      - arm,cortex-a78
> -      - arm,cortex-a78ae
> -      - arm,cortex-a78c
> -      - arm,cortex-a320
> -      - arm,cortex-a510
> -      - arm,cortex-a520
> -      - arm,cortex-a520ae
> -      - arm,cortex-a710
> -      - arm,cortex-a715
> -      - arm,cortex-a720
> -      - arm,cortex-a720ae
> -      - arm,cortex-a725
> -      - arm,cortex-m0
> -      - arm,cortex-m0+
> -      - arm,cortex-m1
> -      - arm,cortex-m3
> -      - arm,cortex-m4
> -      - arm,cortex-r4
> -      - arm,cortex-r5
> -      - arm,cortex-r7
> -      - arm,cortex-r52
> -      - arm,cortex-x1
> -      - arm,cortex-x1c
> -      - arm,cortex-x2
> -      - arm,cortex-x3
> -      - arm,cortex-x4
> -      - arm,cortex-x925
> -      - arm,neoverse-e1
> -      - arm,neoverse-n1
> -      - arm,neoverse-n2
> -      - arm,neoverse-n3
> -      - arm,neoverse-v1
> -      - arm,neoverse-v2
> -      - arm,neoverse-v3
> -      - arm,neoverse-v3ae
> -      - arm,rainier
> -      - brcm,brahma-b15
> -      - brcm,brahma-b53
> -      - brcm,vulcan
> -      - cavium,thunder
> -      - cavium,thunder2
> -      - faraday,fa526
> -      - intel,sa110
> -      - intel,sa1100
> -      - marvell,feroceon
> -      - marvell,mohawk
> -      - marvell,pj4a
> -      - marvell,pj4b
> -      - marvell,sheeva-v5
> -      - marvell,sheeva-v7
> -      - nvidia,tegra132-denver
> -      - nvidia,tegra186-denver
> -      - nvidia,tegra194-carmel
> -      - qcom,krait
> -      - qcom,kryo
> -      - qcom,kryo240
> -      - qcom,kryo250
> -      - qcom,kryo260
> -      - qcom,kryo280
> -      - qcom,kryo360
> -      - qcom,kryo385
> -      - qcom,kryo465
> -      - qcom,kryo468
> -      - qcom,kryo470
> -      - qcom,kryo485
> -      - qcom,kryo560
> -      - qcom,kryo570
> -      - qcom,kryo660
> -      - qcom,kryo670
> -      - qcom,kryo685
> -      - qcom,kryo780
> -      - qcom,oryon
> -      - qcom,scorpion
> -      - samsung,mongoose-m2
> -      - samsung,mongoose-m3
> -      - samsung,mongoose-m5
> +    oneOf:
> +      - enum:
> +          - apm,potenza
> +          - apm,strega
> +          - apple,avalanche
> +          - apple,blizzard
> +          - apple,cyclone
> +          - apple,firestorm
> +          - apple,hurricane-zephyr
> +          - apple,icestorm
> +          - apple,mistral
> +          - apple,monsoon
> +          - apple,twister
> +          - apple,typhoon
> +          - arm,arm710t
> +          - arm,arm720t
> +          - arm,arm740t
> +          - arm,arm7ej-s
> +          - arm,arm7tdmi
> +          - arm,arm7tdmi-s
> +          - arm,arm9es
> +          - arm,arm9ej-s
> +          - arm,arm920t
> +          - arm,arm922t
> +          - arm,arm925
> +          - arm,arm926e-s
> +          - arm,arm926ej-s
> +          - arm,arm940t
> +          - arm,arm946e-s
> +          - arm,arm966e-s
> +          - arm,arm968e-s
> +          - arm,arm9tdmi
> +          - arm,arm1020e
> +          - arm,arm1020t
> +          - arm,arm1022e
> +          - arm,arm1026ej-s
> +          - arm,arm1136j-s
> +          - arm,arm1136jf-s
> +          - arm,arm1156t2-s
> +          - arm,arm1156t2f-s
> +          - arm,arm1176jzf
> +          - arm,arm1176jz-s
> +          - arm,arm1176jzf-s
> +          - arm,arm11mpcore
> +          - arm,armv8 # Only for s/w models
> +          - arm,c1-nano
> +          - arm,c1-premium
> +          - arm,c1-pro
> +          - arm,c1-ultra
> +          - arm,cortex-a5
> +          - arm,cortex-a7
> +          - arm,cortex-a8
> +          - arm,cortex-a9
> +          - arm,cortex-a12
> +          - arm,cortex-a15
> +          - arm,cortex-a17
> +          - arm,cortex-a32
> +          - arm,cortex-a34
> +          - arm,cortex-a35
> +          - arm,cortex-a53
> +          - arm,cortex-a55
> +          - arm,cortex-a57
> +          - arm,cortex-a65
> +          - arm,cortex-a72
> +          - arm,cortex-a73
> +          - arm,cortex-a75
> +          - arm,cortex-a76
> +          - arm,cortex-a77
> +          - arm,cortex-a78
> +          - arm,cortex-a78ae
> +          - arm,cortex-a78c
> +          - arm,cortex-a320
> +          - arm,cortex-a510
> +          - arm,cortex-a520
> +          - arm,cortex-a520ae
> +          - arm,cortex-a710
> +          - arm,cortex-a715
> +          - arm,cortex-a720
> +          - arm,cortex-a720ae
> +          - arm,cortex-a725
> +          - arm,cortex-m0
> +          - arm,cortex-m0+
> +          - arm,cortex-m1
> +          - arm,cortex-m3
> +          - arm,cortex-m4
> +          - arm,cortex-r4
> +          - arm,cortex-r5
> +          - arm,cortex-r7
> +          - arm,cortex-r52
> +          - arm,cortex-x1
> +          - arm,cortex-x1c
> +          - arm,cortex-x2
> +          - arm,cortex-x3
> +          - arm,cortex-x4
> +          - arm,cortex-x925
> +          - arm,neoverse-e1
> +          - arm,neoverse-n1
> +          - arm,neoverse-n2
> +          - arm,neoverse-n3
> +          - arm,neoverse-v1
> +          - arm,neoverse-v2
> +          - arm,neoverse-v3
> +          - arm,neoverse-v3ae
> +          - arm,rainier
> +          - brcm,brahma-b15
> +          - brcm,brahma-b53
> +          - brcm,vulcan
> +          - cavium,thunder
> +          - cavium,thunder2
> +          - faraday,fa526
> +          - intel,sa110
> +          - intel,sa1100
> +          - marvell,feroceon
> +          - marvell,mohawk
> +          - marvell,pj4a
> +          - marvell,pj4b
> +          - marvell,sheeva-v5
> +          - marvell,sheeva-v7
> +          - nvidia,tegra132-denver
> +          - nvidia,tegra186-denver
> +          - nvidia,tegra194-carmel
> +          - qcom,krait
> +          - qcom,kryo240
> +          - qcom,kryo250
> +          - qcom,kryo260
> +          - qcom,kryo280
> +          - qcom,kryo360
> +          - qcom,kryo385
> +          - qcom,kryo465
> +          - qcom,kryo468
> +          - qcom,kryo470
> +          - qcom,kryo485
> +          - qcom,kryo560
> +          - qcom,kryo570
> +          - qcom,kryo660
> +          - qcom,kryo670
> +          - qcom,kryo685
> +          - qcom,kryo780
> +          - qcom,scorpion
> +          - samsung,mongoose-m2
> +          - samsung,mongoose-m3
> +          - samsung,mongoose-m5
> +      - enum:
> +          - qcom,kryo
> +          - qcom,oryon
> +        # Too generic, do not use in new code
> +        deprecated: true
>  
>    enable-method:
>      $ref: /schemas/types.yaml#/definitions/string
> -- 
> 2.51.0
> 

