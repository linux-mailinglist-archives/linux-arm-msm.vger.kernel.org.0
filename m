Return-Path: <linux-arm-msm+bounces-115837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dHKZBcgKRmrHIAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4856F3EE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bJWjsFxm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115837-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115837-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C376E304E450
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABC838D6B5;
	Thu,  2 Jul 2026 06:50:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F538D686;
	Thu,  2 Jul 2026 06:50:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975011; cv=none; b=Mqry+TXixC6GkEdZrlTCkYRNptA/dB2mQ1u5NuIm7UyC7xvnVyKilCXZIzs9gWed0swtoNScvPj5L0PNCezwmg1MzZSo6nOWkI/Fp2T1IduZZw57o2bFrymTceO2ixxvo4Y6W/4pHwycw5gS3zJ/Q++dpB5sPiKxNlKDva1ySjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975011; c=relaxed/simple;
	bh=bkNR+h7i8XtRjTR7MH35ML5P+7LwZhwwecN8CO/eqp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgiwMzj/se11WdKmB3cEpLPe3U4cRz7B+h4FvN5rP0wQ1uPkuYCHbi+ihtngaSbUh1T1DjwKKGgscqobe1Mx6j+67Mb4Bj5iBSnt443bf2sww+XCndyi7wtkM2OqAGhTzfyXgvmzylCgdlMY6ghU8paEqOgZAsAK7bJJ5eXp6lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJWjsFxm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F461F000E9;
	Thu,  2 Jul 2026 06:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782975010;
	bh=H68M3pSDEtjkA1BdTYx+RoorfU7H3yfF/UXaB8nZkRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJWjsFxmc7yGMXCHoLO1nOXiV9jl0RaHe7gFR9havHqZYdWe3Ribw5o2aOso25M+/
	 gjYjRZTz7POHQGlnSJm3ZZ8UNpanZYMXHCWsNHtFh1p2NqVIN0bXVrmEIqK2aNHY/l
	 pVKFVrzDD/wt2tAQZHSxrmRYdEXVsYCoa9w97KuXEudoQzeV84FbbWKtLU0CgE+bEt
	 ZR3UfwTtq7gauh9W0FXomLgG/lIbaa9GeQLomTLWj9/daQqUoy30jWm1ldL4U5ZpSg
	 J07QeIB838DB+AYuqTG4pGKG37HGcMNcoeDv/GEC2jeWv0BYSWsCOPnBWgNE7FwM2D
	 1WYCVfvpnyCiw==
Date: Thu, 2 Jul 2026 08:50:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
Message-ID: <20260702-magnetic-fennec-from-eldorado-cec489@quoll>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115837-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C4856F3EE7

On Wed, Jul 01, 2026 at 04:27:47PM +0530, Harendra Gautam wrote:
> Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) controller
> DAI IDs. This provides shared constants for devicetree sound-dai references
> and QAIF aif-interface reg values instead of using raw numeric IDs.
> 
> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF moves PCM data between system memory and external serial audio
> interfaces through the AIF path, and between memory and the internal Bolero
> digital codec through the CIF path. The controller needs a binding so
> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
> clocks, interrupt, DAI cells and per-interface AIF configuration.
> 
> Describe the single register region, one EE interrupt, the required GCC
> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
> child nodes used for static PCM, TDM or MI2S configuration.
> 
> Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
>   support on Qualcomm Shikra SoC
>   https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com/

There is no such tag. Why would you want to include it in the Git
history?

...

> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qaif-cpu

How did this appear?

You ignored my previous comments (I checked one or two).


> +      - qcom,shikra-qaif-cpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 9
> +
> +  clock-names:
> +    items:
> +      - const: lpass_config
> +      - const: lpass_core_axim
> +      - const: aud_dma
> +      - const: aud_dma_mem
> +      - const: bus
> +      - const: aif_if0_ibit
> +      - const: aif_if1_ibit
> +      - const: aif_if2_ibit
> +      - const: aif_if3_ibit
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +

Why double line break?

> +patternProperties:
> +  "^aif-interface@[0-9a-f]+$":

Use consistent quotes.

> +    type: object
> +    description:
> +      AIF interface configuration child node. The compatible string
> +      identifies the serial protocol the interface is wired for on the
> +      board. The unit address matches the hardware AIF interface index.
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,qaif-pcm-dai
> +          - qcom,qaif-tdm-dai
> +          - qcom,qaif-mi2s-dai
> +      reg:
> +        maxItems: 1
> +        description: |
> +          Hardware AIF interface index (AUD_INTFa block index). This value
> +          also serves as the ALSA DAI ID; it corresponds directly to the
> +          QAIF_MI2S_TDM_AIFn constants in <dt-bindings/sound/qcom,qaif.h>
> +          (e.g. reg = <2> selects QAIF_MI2S_TDM_AIF2).
> +      qcom,qaif-aif-sync-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2]
> +        description:
> +          Defines the FRAME SYNC mode for the audio interface.
> +            0 = SHORT - FRAME SYNC is high for 1 INTF clock cycle per frame
> +            1 = ONE_SLOT - FRAME SYNC is high for 1 slot per frame (pulse
> +                stretched by MIN(RPCM_WIDTH, TPCM_WIDTH))
> +            2 = LONG - FRAME SYNC is high for half the frame duration
> +      qcom,qaif-aif-sync-src:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description:
> +          Sync clock/frame source. Independent of sync-mode;
> +          all combinations of sync-mode and sync-src are valid.
> +            0 = External source (slave)
> +            1 = Internal source (master)
> +      qcom,qaif-aif-invert-sync:
> +        type: boolean
> +        description: Invert the frame sync polarity.

There is no such style of such text flow. Open any existing binding.

Either you disregarded existing code or you just vibe coded something.
Both cases are not right.

Combining missed comments, that's a NAK

Best regards,
Krzysztof


