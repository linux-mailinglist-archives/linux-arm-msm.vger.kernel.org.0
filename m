Return-Path: <linux-arm-msm+bounces-105610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEhMHxp192kliAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 18:17:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7844B6621
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 18:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D88F300462C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 16:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62AA3C2769;
	Sun,  3 May 2026 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbU3spsN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F312F12B3;
	Sun,  3 May 2026 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825045; cv=none; b=Pf9aFAYZw81X5EOU7yiPne/XgB3vG+1XHD0yPqD5L9qbiEkhSCyn3Mo9YREzZgEweu+TwT/FuKQs8kHirJukYke9lKIS8n/7pFmNOuXAK0X70Mv91raCQEFN+IIqAzY3EgEyK64iAPdurCycHb42i+E3m58mL614qRl4kqt5lg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825045; c=relaxed/simple;
	bh=ftVKHFYpwRInenE9RpxSzKg9jgv0zisPlSEzxsPeq/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlrFeNtBmuOFrP/igeYLF0gRuIIEjuRXRAnxrUXgM1Rld8Kip+YjgBD4iZ4U3dsYW+EPghoryYoeGEiDmq9p20O93x+7kNA3iA3mnbbjkSz40tKSS54VwIrfPcu0xxaq6kuAjzeQpZbXtxPW0g0CUhRSSav08H+3FUrHJnKhN6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbU3spsN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8751C2BCB4;
	Sun,  3 May 2026 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777825045;
	bh=ftVKHFYpwRInenE9RpxSzKg9jgv0zisPlSEzxsPeq/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbU3spsNc94TKeiGLQVpthDxSSy+3vJAe1109rOHCmehtlO8Jzy/IJ7T+0oH46o/y
	 PHuYum2F8kVnfIQvt09TsZaeKDOB/pGuwk3sA2/jxZedwDksU6rRoG/w5SgJLcGllW
	 ggC83QhjIsYEa9uHFCaX/ePhpdR5KiTfPsai1aQTNQ5EnshPQpvZEmGronDu61ASeK
	 0O/7SlDGHNu+W69+x+M7qTSUawTYud18/h+Vo0JH37HZsFedHr6UTCGIZZyMAu57MV
	 t/N9TGbdMF+zJJKhoR0Y2BdD1o9kfgIX9oDoDc0Q3CpWiDWQk3KXqTDD5qK5DUc/T4
	 znIz5KRqSluyA==
Date: Sun, 3 May 2026 18:17:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPM
 Network-On-Chip interconnect in Shikra SoC
Message-ID: <20260503-enormous-benign-salamander-8d074c@quoll>
References: <20260429-shikra_icc-v1-0-e3439903edf1@oss.qualcomm.com>
 <20260429-shikra_icc-v1-1-e3439903edf1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429-shikra_icc-v1-1-e3439903edf1@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1F7844B6621
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105610-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 02:03:48PM +0000, Raviteja Laggyshetty wrote:
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,shikra.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Shikra Network-On-Chip interconnect
> +
> +maintainers:
> +  - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The Qualcomm Shikra interconnect providers support adjusting the
> +  bandwidth requirements between the various NoC fabrics.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,shikra-config-noc
> +      - qcom,shikra-mem-noc-core
> +      - qcom,shikra-sys-noc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +# Child node's properties
> +patternProperties:
> +  '^interconnect-[a-z0-9]+$':
> +    type: object
> +    description:
> +      The interconnect providers do not have a separate QoS register space,
> +      but share parent's space.
> +
> +    $ref: qcom,rpm-common.yaml#
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,shikra-clk-virt
> +          - qcom,shikra-mc-virt
> +          - qcom,shikra-mmrt-virt
> +          - qcom,shikra-mmnrt-virt
> +
> +    required:
> +      - compatible
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: qcom,rpm-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,shikra-mem-noc-core
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GPU-NoC AXI clock
> +
> +        clock-names:
> +          items:
> +            - const: gpu_axi
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,shikra-sys-noc
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: EMAC0-NoC AXI clock.
> +            - description: EMAC1-NoC AXI clock.
> +            - description: USB2-NoC AXI clock.
> +            - description: USB3-NoC AXI clock.
> +
> +        clock-names:
> +          items:
> +            - const: emac0_axi
> +            - const: emac1_axi
> +            - const: usb2_axi
> +            - const: usb3_axi
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,shikra-clk-virt
> +            - qcom,shikra-config-noc
> +            - qcom,shikra-mc-virt
> +            - qcom,shikra-mmrt-virt
> +            - qcom,shikra-mmnrt-virt

This if is pointless here, changes nothing and not really correct. Drop
it, I will fix existing bindings.

OTOH, do all NoCs have children? If not, the patternProperties should be
disallowed for such cases. Also clocks should be restricted, see my
patch:
20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com

Best regards,
Krzysztof


