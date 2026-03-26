Return-Path: <linux-arm-msm+bounces-99982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPGQOP+RxGnH0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:55:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF31432E171
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF02A3058916
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66CB387377;
	Thu, 26 Mar 2026 01:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3XwXZnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D0837B012
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489601; cv=none; b=pX80b20+frYX25uGv5rVbFSGw01y89+cM5XKmm2/EU57JQ6ezzj8igUMlSHPTzzaXVMUQcCwhti9d9b20wBrSNUduzWGAYV6vdd72ApHuq9CW2Sjq2zXWHaMypBQ6DIomzA0UO1OLMsv7s0suOoZtPzjnYMmDrofTq+rukTfviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489601; c=relaxed/simple;
	bh=evJCgtmUCKMOUoX5jIoibYRIq4Js+xZOoni/9Fwf0RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVUMLN2WwDj9QJPf+Zux+Q01b8r2gtcxiMLSdwwHQFaBAzn2i3qiXGG1AW1WIiB6WvLT22FXIjDFcPjecXVLYd84QheuLurk+lNH6LkOc3uNMiOoYwtifw1sRELZJ/0MViF8K1REkaI4W6XZQPH1p5XE0rtW9Df6OetvljgL2Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3XwXZnX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a284984dc0so64708e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774489598; x=1775094398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMM8gnzSZHuXSR/4tgTYg0ThVeyoW9N0uLZg0sQTEPk=;
        b=F3XwXZnX5ju96FUaDalJB4ylLq2PiI9l3XXhGChR0Hee6/hD49o7wGfzJZ72hMtPYe
         wngoq+vWFQmckdIf7Q/JpVvXMxRU8lGwR9/ucdnmDDu1e/3iE2iuvs/BdbXJkXwN9yVJ
         nVXQVnAE9jFgRhi+bQLyEga67x26VAyUFz3t5q+zgTLdzueYJRwc+Gx53OIXkc0IMpre
         41MsieE7UOTWXC+KfO5n0BdP23P+s+HgcEHa1iycTot9zwpUPDoVzVvQoLQ2DFQ9YxT1
         UgzEmxvClT8Xq3Lqd3wHqsgwL5lKp5QT/TRvUoBPGLAFb01m8lTvru2XY6BpiTKwkV8A
         OwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489598; x=1775094398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMM8gnzSZHuXSR/4tgTYg0ThVeyoW9N0uLZg0sQTEPk=;
        b=k0MdWYvKWsLtLx6hk15hNJOvVV3Rjl2fxYlte0vsJylhas+f7tDMz6/kSqnyZrra2b
         eksoFgnMGXNcXgmeyalaTRD0Ysa7NsNn7p5RwnTPio6IdciQlzEFmxyGia9M2XwClCGV
         aXBcYlxcp9A6rRII2DWNNNtY3sZNYk1Ts9TSUHwJV/bQYJcIb46XVYXdIw4h6KHBS6AA
         NyXmuSsuHLK9/eJYAJjG964H8EYxH6M9f63u1Rrcz3f1ZTxzQ7y/Cd3OT/78BnfBLcST
         rk5/MOxpdyHy5IzYkKss6kZygE+0AGACAevStDAovKSdPiLrkZQPR3EPiTG97U4KZNPk
         IkyA==
X-Forwarded-Encrypted: i=1; AJvYcCW4dCAeeoyq0wMIblEx6o7fRuoRBFJxp0QtEDVDovIXSKNhTwaNpGGq77DH/hulySfj/3jar2ykUlSWje57@vger.kernel.org
X-Gm-Message-State: AOJu0YyFnoqMSRnXmoJGm3DWmZE8pU5weq0L61mEcJgwgTXmk/37JqPZ
	ZMBXvfO1MrBmDNt3GW3idY2f8hlKEY6a3NTMcDYIGapEDJjDyMXlN/TYmTX7ssrukz66VezVv87
	CLr87
X-Gm-Gg: ATEYQzyH1W3cgPk1ls3WqBu6iowoq+p363xOjwC7/kupO+QEN0KXZPu9InwhbT8dBYi
	c73CtsHeJIGkEgvxPG6Fihkg6+rDh/Tg1EkOxiZew9PUEMuPDX8coIHkVO4PteHg7xXG0QJ/v+r
	fKE7OpSe+ofmfa2d56FOSRIpsqSquFLi+nqC1uR87iHTeNeW3igs6VZY3ifJEMOOSmS2fxUjTtI
	kC8J1uiFlEzUqtT/08uavEMMlkWb0IBVvxtUuXYWB5WbMlHF0s2hAaGixchs4z2uve7nlJXvcA1
	pIG4Ik2ghOoOPdqC6JNMLeH6siy3xRBS5qMFFByuSfhpOj+PWEw6Mf9+haZnMsGT/2JBXHyHkp8
	sJqj5H2vDeXzoLVtEcfBKmQU5glOkq6ZkVx+znBwCjgqky1JbBiKueeLXs1j5Uf1UEAzFmXIdia
	SJv/Ih2kXkuZaQx4gzROuoqgmFo+K3s6eCcThzNcyk6zdQ69ujQRnSaPeOSyREDwHTIt7GwDkeq
	cT9p1X9QB78SE6S
X-Received: by 2002:a05:6512:3d0b:b0:5a2:78e2:504b with SMTP id 2adb3069b0e04-5a29b9a974emr1031388e87.7.1774489597790;
        Wed, 25 Mar 2026 18:46:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064c187sm243911e87.27.2026.03.25.18.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:46:37 -0700 (PDT)
Message-ID: <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
Date: Thu, 26 Mar 2026 03:46:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-99982-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,devicetree.org:url,acb7000:email]
X-Rspamd-Queue-Id: EF31432E171
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 03:04, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
> capture those modes as:
> 
> - PHY_QCOM_CSI2_MODE_DPHY
> - PHY_QCOM_CSI2_MODE_CPHY
> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY

Distinction between PHY_QCOM_CSI2_MODE_DPHY and PHY_QCOM_CSI2_MODE_SPLIT_DPHY
is
1) insufficient in just this simplistic form, because the assignment of
particular lanes is also needed,
2) and under the assumption that the lane mapping is set somewhere else, then
there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
it's just DPHY, and the subtype is deductible from data-lanes property on
the consumer side.

So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
and PHY_TYPE_CPHY is needed here, those two are sufficient.

> 
> The CSIPHY devices have their own pinouts on the SoC as well as their own
> individual voltage rails.
> 
> The need to model voltage rails on a per-PHY basis leads us to define
> CSIPHY devices as individual nodes.
> 
> Two nice outcomes in terms of schema and DT arise from this change.
> 
> 1. The ability to define on a per-PHY basis voltage rails.
> 2. The ability to require those voltage.
> 
> We have had a complete bodge upstream for this where a single set of
> voltage rail for all CSIPHYs has been buried inside of CAMSS.
> 
> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
> CAMSS parlance, the CSIPHY devices should be individually modelled.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 +++++++++++++++++++++
>   include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +++
>   2 files changed, 145 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..63114151104b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      The single cell specifies the PHY operating mode.
> +      See include/dt-bindings/phy/phy-qcom-mipi-csi2.h for valid values.

include/dt-bindings/phy/phy.h should be good enough as it's stated above.

> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: MXC or MXA voltage rail
> +      - description: MMCX voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: mx
> +      - const: mmcx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-0p9-supply
> +  - vdda-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    csiphy4: csiphy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +        clock-names = "core",
> +                      "timer";
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "mx",
> +                             "mmcx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +    };
> +
> +    csiphy_opp_table: opp-table {
> +        compatible = "operating-points-v2";
> +
> +        opp-300000000 {
> +            opp-hz = /bits/ 64 <300000000>;
> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                            <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-400000000 {
> +            opp-hz = /bits/ 64 <400000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz = /bits/ 64 <480000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs>;
> +        };
> +    };
> +
> +    isp@acb7000 {
> +        phys = <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
> +    };

This example is incomplete in sense that it does not include CAMSS
CSIPHY IP hardware configuration in whole.

> diff --git a/include/dt-bindings/phy/phy-qcom-mipi-csi2.h b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
> new file mode 100644
> index 0000000000000..fa48fd75c58d8
> --- /dev/null
> +++ b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Qualcomm MIPI CSI2 PHY constants
> + *
> + * Copyright (C) 2026 Linaro Limited
> + */
> +
> +#ifndef __DT_BINDINGS_PHY_MIPI_CSI2__
> +#define __DT_BINDINGS_PHY_MIPI_CSI2__
> +
> +#define PHY_QCOM_CSI2_MODE_DPHY		0
> +#define PHY_QCOM_CSI2_MODE_CPHY		1
> +#define PHY_QCOM_CSI2_MODE_SPLIT_DPHY	2
> +
> +#endif /* __DT_BINDINGS_PHY_MIPI_CSI2__ */
> 

-- 
Best wishes,
Vladimir

