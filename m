Return-Path: <linux-arm-msm+bounces-108694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAmXLWCMDWoIzQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:26:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F458BBA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC3530D427B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8923D75B1;
	Wed, 20 May 2026 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQZZVvlL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E04372B31;
	Wed, 20 May 2026 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272445; cv=none; b=EwnH7yffiMgactoMkSRSE3Osfh4LJ9Vjq3f21SjxTbCkFPoCxO48G4bk90wrYA87K8Xg0TlxlVSCY1OW0D9MQQcRM0Fv1QXEjda4IrXUEBmx/Yabo7MqtL5QkAj99bBKfWOGHSd9Nkbeu57H8oERA3qdEAtZr4zVJrrD/vySP8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272445; c=relaxed/simple;
	bh=i8YXp88SBrjSfaEabpCqCwQuLWqcSJRB7zqdNAJQHeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvZ2kkI0PxcCuLzEKxaW32ODLQ6ZoZzBfZloPNy6iUc9SI6t9pqvyPzF+uE6qSzLp4aKVxQ/9/wK9Xl1D2QI7rLKR7GgpTY6J8I0gAmoQHS1Drnzp/1Q8KOTyOSl50R5yioJjAh1obW0sKZe8yN2ZOHmQL01kZZ/t/U64vCS5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQZZVvlL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD0B1F000E9;
	Wed, 20 May 2026 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779272439;
	bh=6g9ajzLqaEWEZ3KYt0gRi4e7YSp9lg1KdLS1jVzQoSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AQZZVvlLPqBw2UoxzkuD5EIcIzW5wozB3Tz2HC1nrXxhcttdIZyLbH9HAIumgriVM
	 xpaw0MOFiD0lsN4PZM20uRz4DZ3yLXtTCYbth/2fn9Ja7SEMwAckeBtqxNCEEAum5c
	 ++eomNgH4DF5mTJOBDL7hByDsqM1SxOYNtBsi0YonPhHUiNt+tci7/436imEJ1495N
	 tXSdH1DZzid6s7lVAVQjcXvqGuNnuFmxFxKUdXSygaIoG10/bu4qrslaBucHABOtDf
	 9PX1Gy2DhrFe7twM9xULskYEU/R1tJ20wCYG8iF6KgDpyaRnqczMn2OLTKiDgJSztk
	 iPlBefVyNu6Hg==
Date: Wed, 20 May 2026 12:20:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
Message-ID: <20260520-hissing-rook-of-penetration-b4d6c5@quoll>
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
 <20260519-shikra-cpufreq-scaling-v2-1-2b09f0e1c9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-shikra-cpufreq-scaling-v2-1-2b09f0e1c9d8@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-108694-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.200:email,0.0.1.44:email,qualcomm.com:email,0.0.0.0:email,0.0.0.100:email]
X-Rspamd-Queue-Id: 189F458BBA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:58:03PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
> Shikra specific bindings to represent this constrained EPSS variant.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml   | 133 +++++++++++++++++++++

Filename must match compatible. Please read writing-bindings doc.

>  1 file changed, 133 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..52079ed661671554fcca8677409ee11199f5727b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/shikra-cpufreq-qcom-hw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CPUFREQ HW for Qualcomm Shikra SoC
> +
> +maintainers:
> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +

Drop blank line

> +  CPUFREQ HW is a hardware engine used by some Qualcomm SoCs to manage
> +  frequency in hardware. It is capable of controlling frequency for
> +  multiple clusters.
> +
> +  The Qualcomm Shikra CPUFREQ HW supports up to 12 frequency lookup table
> +  (LUT) entries.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,shikra-cpufreq-epss

cpufreq is Linux term. How the device called in manual? EPSS? cpufreq?
cpufreq-epss?

> +
> +  reg:
> +    items:
> +      - description: Frequency domain 0 register region
> +      - description: Frequency domain 1 register region
> +
> +  reg-names:
> +    items:
> +      - const: freq-domain0
> +      - const: freq-domain1
> +
> +  clocks:
> +    items:
> +      - description: XO Clock
> +      - description: GPLL0 Clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: alternate
> +
> +  interrupts:
> +    items:
> +      - description: IRQ line for DCVSH 0
> +      - description: IRQ line for DCVSH 1
> +
> +  interrupt-names:
> +    items:
> +      - const: dcvsh-irq-0
> +      - const: dcvsh-irq-1
> +
> +  '#freq-domain-cells':
> +    const: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#freq-domain-cells'

Why interrupts are not required?

Why clock-cells are missing? The device is a clock provider, no? Does it
differ per each board?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +
> +      cpus {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        cpu0: cpu@0 {
> +          device_type = "cpu";
> +          compatible = "arm,cortex-a55";
> +          reg = <0x0 0x0>;
> +          enable-method = "psci";
> +          qcom,freq-domain = <&cpufreq_hw 0>;
> +          clocks = <&cpufreq_hw 0>;
> +        };
> +
> +        cpu1: cpu@100 {
> +          device_type = "cpu";
> +          compatible = "arm,cortex-a55";
> +          reg = <0x0 0x100>;
> +          enable-method = "psci";
> +          qcom,freq-domain = <&cpufreq_hw 0>;
> +          clocks = <&cpufreq_hw 0>;
> +        };
> +
> +        cpu2: cpu@200 {
> +          device_type = "cpu";
> +          compatible = "arm,cortex-a55";
> +          reg = <0x0 0x200>;
> +          enable-method = "psci";
> +          qcom,freq-domain = <&cpufreq_hw 0>;
> +          clocks = <&cpufreq_hw 0>;
> +        };
> +
> +        cpu3: cpu@300 {
> +          device_type = "cpu";
> +          compatible = "arm,cortex-a78c";
> +          reg = <0x0 0x300>;
> +          enable-method = "psci";
> +          qcom,freq-domain = <&cpufreq_hw 1>;
> +          clocks = <&cpufreq_hw 1>;
> +        };
> +      };

Drop all nodes above.

> +
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      cpufreq@fd91000 {
> +        compatible = "qcom,shikra-cpufreq-epss";
> +        reg = <0x0fd91000 0x1000>, <0x0fd92000 0x1000>;
> +        reg-names = "freq-domain0", "freq-domain1";
> +
> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gpll0>;
> +        clock-names = "xo", "alternate";

Incomplete example.

> +
> +        #freq-domain-cells = <1>;
> +        #clock-cells = <1>;
> +      };
> +    };
> +...
> 
> -- 
> 2.34.1
> 

