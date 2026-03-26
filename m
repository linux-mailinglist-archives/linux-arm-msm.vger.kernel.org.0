Return-Path: <linux-arm-msm+bounces-99988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDLxM1uWxGnn1AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:13:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3CB32E415
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E9DA3030EB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98AF38F25E;
	Thu, 26 Mar 2026 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCT8lSIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95207212FB9
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490598; cv=none; b=u1SWoojTe2q6wgZ9KleGge+whyGw61KQK/Q4vimbhhAd4YfmX3c1TKs8JxZEZ9s86f7R+uV/R1I4dXYgqPX7pNbFTR6FKbr8eFjbTzmpasPxPKUF23hLH9m74HtLCugplqlZGOgdM2liu5PB/FzNPEV35YVLg1cp51iTO+AYMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490598; c=relaxed/simple;
	bh=898EE3uTRWNqQWKaeojRbazK62aRyTS+EtJVfzejI9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGRHny1+PX3sHYZ2TU4LIahby4AEDH5J3Le9pCGjuRHJiRlwxW1rsOUM75GcpzKR2v+RW03bei/j7Ug7/GxOZIkutxofV6yuz8zEN7JDLS5WqmatEdN9cJWUeo9LrNDCGpPtc0npHeIe27u/n4rBE6gQ2WE+9j/H6YRTibrrJzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCT8lSIV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so3988485e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774490595; x=1775095395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ssl/A4FTlxsDnKppPyscG81oRYVzD7RmlywNbIRpMjg=;
        b=SCT8lSIV+AHUb537eBT8wDlPWCrIKB/52C1EgssRzCkkygUuCZHTwXhOGyG3Brz973
         lD6+uYHKKuGqKEqbrvnjfE25Ko9snsXGxmCIML83BNNuXQAyJFQyJbEO07ivgIADKNcJ
         rPEz0t9vX1AH2ABGc4DsC1IVh/XOOaG0aFujDtyYVtr/tjMaMwbBoaulVKpkvK1Q3e1f
         Og2S7TzDOm30ov9O+/ADFaOi8DM+hcwsZMiFzqsLta3+1PILwkVZpUcDV6hiiRBMfKU/
         UkBqyaCUOPouv+lcvtmZSqhmshTw1bemi+TfWsJW66/tAvb8ndXqoahSbVj43tKgRhho
         hXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490595; x=1775095395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ssl/A4FTlxsDnKppPyscG81oRYVzD7RmlywNbIRpMjg=;
        b=bFId79xUkGUjN3cz5KcAzSlGIGY2HtqxgzEGmM2KITPEZT+3MOUqOp0TOvDnFM4Wth
         yeSsqZmEvWXiRV4SeUH1Qu6pBKusx126PuC6pB8CzfitRD+Y2kgf3nWikDMKpIIRR11j
         mA2jHDhZmuFRTeFfh+pBffiCFjB+aRJNTLORaYKTdVPmHll2OdUqrWTDjH8oKMFdSSJe
         MetgF0iGfzhuB7pwY82f/i5RXvWesmzfI0hQovqXODjhwMpeBr6TUcfcLLuFfL8Pdtx8
         ulWLTMIOKKGGB5hkSdEaPJZ7M/AqcmErJ5A4NWsBHl1tnZu+8j9794bZRjm259/nV96K
         6FBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+UqTe+s42rcSn0/Uxy8RH4N1+W/9nRfeAEhmmE6PHz68gf10cBzAVVhxY8Q/+VKmwKBGkE10ZG5ImrHy0@vger.kernel.org
X-Gm-Message-State: AOJu0YyKsxZggy2dsz5KDpwmZxu1tpkKVD5KQJQI4RMuFhPmGlmJx7W7
	FKhjyqeJg7mRbjCOb4X/kk0Sv/8kHRMjS3y4Ixv5mUX2w7gVG/R7gjt1Jx6fgb8EKeU=
X-Gm-Gg: ATEYQzzLO/i/7PBoqTG15vEi9KNhcatQqH2ctBKHkgLnETA2dkHstUqAAn0SIlCVxoG
	k0hO+tPEddg4ycw5UHz42QKAxDacJm1Y0ZQbmgC2b37iA5yvSDT+xLKxz5M2pVYgNjr1NzwzP0g
	AltExkBdKSc3Cqyvor12Zh6cURe/j0UBGGNYP9ENNbgMfAH0krQN7pqLoYi63PVXWoQ4Fn5LEgX
	RM53rjz+nbZbreqMgL6BUbYuApnF0l+a/T45d8+JwGMFsbUiVPbt2a/3dNiXpjTRUbwhVT0GTzh
	EJWx0ENxP0xn4xYbJUgbJoo2w7n5whGaTDJopDBWQrre25wGUE6rw2i38bGA8xUCX6uJiN4XbWZ
	xag3M2LwwTPleadfrYhZgi19btbvPal2BhbRPu//fLrfA07s8l8EYDe0vZaPaTYDSjHwcv0TF6b
	zs42epXlrZH85GSgm++n2ew+QKoZ7X6GbsaSY=
X-Received: by 2002:a05:600c:c089:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-48715fba9d6mr67260955e9.2.1774490594918;
        Wed, 25 Mar 2026 19:03:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720926246sm4251725e9.26.2026.03.25.19.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 19:03:14 -0700 (PDT)
Message-ID: <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
Date: Thu, 26 Mar 2026 02:03:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-99988-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ace4000:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,acb7000:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F3CB32E415
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 01:46, Vladimir Zapolskiy wrote:
> On 3/26/26 03:04, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI 
>> CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode 
>> DPHY. We
>> capture those modes as:
>>
>> - PHY_QCOM_CSI2_MODE_DPHY
>> - PHY_QCOM_CSI2_MODE_CPHY
>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> 
> Distinction between PHY_QCOM_CSI2_MODE_DPHY and 
> PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> is
> 1) insufficient in just this simplistic form, because the assignment of
> particular lanes is also needed,
> 2) and under the assumption that the lane mapping is set somewhere else, 
> then
> there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
> it's just DPHY, and the subtype is deductible from data-lanes property on
> the consumer side.
> 
> So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
> and PHY_TYPE_CPHY is needed here, those two are sufficient.

Because knowing the split-mode exists and that you have asked about how 
such a thing would be supported, I thought about how to represent that 
mode right from the start, even if we don't support it.

To support split phy we will need to pass the parameter.

So we define those parameters upfront.

> 
>>
>> The CSIPHY devices have their own pinouts on the SoC as well as their own
>> individual voltage rails.
>>
>> The need to model voltage rails on a per-PHY basis leads us to define
>> CSIPHY devices as individual nodes.
>>
>> Two nice outcomes in terms of schema and DT arise from this change.
>>
>> 1. The ability to define on a per-PHY basis voltage rails.
>> 2. The ability to require those voltage.
>>
>> We have had a complete bodge upstream for this where a single set of
>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>
>> Much like the I2C bus which is dedicated to Camera sensors - the CCI 
>> bus in
>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 +++++++++++ 
>> ++++++++++
>>   include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +++
>>   2 files changed, 145 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml
>> new file mode 100644
>> index 0000000000000..63114151104b4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,130 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CSI2 PHY
>> +
>> +maintainers:
>> +  - Bryan O'Donoghue <bod@kernel.org>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 
>> sensors
>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and 
>> D-PHY
>> +  modes.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,x1e80100-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      The single cell specifies the PHY operating mode.
>> +      See include/dt-bindings/phy/phy-qcom-mipi-csi2.h for valid values.
> 
> include/dt-bindings/phy/phy.h should be good enough as it's stated above.

While include/dt-bindings/phy/phy.h provides generic definitions for 
D-PHY and C-PHY, it does not contain a definition for Qualcomm's 
proprietary Split D-PHY mode. Because this hardware supports a 
vendor-specific operating mode, introducing a vendor-specific header to 
define that state is necessary.

This is exactly what we do with the QMP to support a similar use-case - 
the PHYs do vendor specific things, so we use vendor specific defines.

If we lock to phy.h CPHY/DPHY only then we exclude the possibility of 
say adding split-mode to an upstream SoC as the DT ABI will not then 
facilitate the mode.

> 
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description: MXC or MXA voltage rail
>> +      - description: MMCX voltage rail
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: mx
>> +      - const: mmcx
>> +
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#phy-cells"
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - operating-points-v2
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-0p9-supply
>> +  - vdda-1p2-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>> +    #include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    csiphy4: csiphy@ace4000 {
>> +        compatible = "qcom,x1e80100-csi2-phy";
>> +        reg = <0x0ace4000 0x2000>;
>> +        #phy-cells = <1>;
>> +
>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>> +        clock-names = "core",
>> +                      "timer";
>> +
>> +        operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        power-domains = <&rpmhpd RPMHPD_MX>,
>> +                        <&rpmhpd RPMHPD_MMCX>;
>> +        power-domain-names = "mx",
>> +                             "mmcx";
>> +
>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>> +    };
>> +
>> +    csiphy_opp_table: opp-table {
>> +        compatible = "operating-points-v2";
>> +
>> +        opp-300000000 {
>> +            opp-hz = /bits/ 64 <300000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
>> +                            <&rpmhpd_opp_low_svs_d1>;
>> +        };
>> +
>> +        opp-400000000 {
>> +            opp-hz = /bits/ 64 <400000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>,
>> +                            <&rpmhpd_opp_low_svs>;
>> +        };
>> +
>> +        opp-480000000 {
>> +            opp-hz = /bits/ 64 <480000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>,
>> +                            <&rpmhpd_opp_low_svs>;
>> +        };
>> +    };
>> +
>> +    isp@acb7000 {
>> +        phys = <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
>> +    };
> 
> This example is incomplete in sense that it does not include CAMSS
> CSIPHY IP hardware configuration in whole.


No that's not the way examples work. You don't replicate entire nodes 
from other schemas you just give a terse reference.

> 
>> diff --git a/include/dt-bindings/phy/phy-qcom-mipi-csi2.h b/include/ 
>> dt-bindings/phy/phy-qcom-mipi-csi2.h
>> new file mode 100644
>> index 0000000000000..fa48fd75c58d8
>> --- /dev/null
>> +++ b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>> +/*
>> + * Qualcomm MIPI CSI2 PHY constants
>> + *
>> + * Copyright (C) 2026 Linaro Limited
>> + */
>> +
>> +#ifndef __DT_BINDINGS_PHY_MIPI_CSI2__
>> +#define __DT_BINDINGS_PHY_MIPI_CSI2__
>> +
>> +#define PHY_QCOM_CSI2_MODE_DPHY        0
>> +#define PHY_QCOM_CSI2_MODE_CPHY        1
>> +#define PHY_QCOM_CSI2_MODE_SPLIT_DPHY    2
>> +
>> +#endif /* __DT_BINDINGS_PHY_MIPI_CSI2__ */
>>
> 


