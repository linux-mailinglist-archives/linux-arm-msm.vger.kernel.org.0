Return-Path: <linux-arm-msm+bounces-117540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KL8WBzwBTmorBgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:50:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69615722D41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:50:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=wO3epuCC;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117540-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117540-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A623022627
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3842B3A1687;
	Wed,  8 Jul 2026 07:45:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8314C3F58C2
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:45:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496720; cv=none; b=TxHbZ8nYVsjmn80/7RGHpd83YEe0v9d2jnjPB/UoSybt3JeWWCFKTmt15w3wCpI6XscyYZi58VaA2y/UVnIayCFvd+FhBG7lM2t7MoPTAilnqy+eJD6V42pf0kaMPzzy8U3o+5k4J41e5v9+344Pg52zLLXI7aCzBaaiT2TwZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496720; c=relaxed/simple;
	bh=Gh0a0KyvZHqcAMLXC9dM3ySw1qVhU7bsFqIhGro8tEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7BgWl7MAQgFvHQLmsY8MJZKjQgHBlByYNWZz5io1VRGEVJ4rtmINsQdQKuIUlw9Nmxc4yqzQzYRnVBKw9bkBK2RnrE4Q7K98mcBoBTAmhTc7HnrPfJEWx9JypqrpsfSf4GlUcfjvzjO7wMnwg8DEhzNGMwH8lRSMLCW5HsJi/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wO3epuCC; arc=none smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeafa51b5cso53159e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783496705; x=1784101505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mkXy4kbxINUY2w5Y8HT7KOs4yBngnLIiuXbssaXGyXo=;
        b=wO3epuCC/dKgBw7E3cBkDN+xcqu05WVKPzlcxjHxKYDiJoKcsjJMzbrq+6wqIT+dqI
         9RBdVZtx9D34XXRazL1gA+R6An40AEGGK1PRWQ/mDjFDHTnTwzmWXAq8WGKtlHLQLHZh
         fEFN5OB5X+LtX9vSVZKMbLMeRjf+Y+Zb/rX89kv/SNE7SzKW4pkLa7R2Tt0XYPBFF1fX
         WhQkiOkS6ZfuAJdbKa9OzNcqp45hSNoRtOiQfB67cgiuzh3gUCUjVpukYNfofH7dfjTD
         SLg6YX6PAtDPnQ3maUvsDamek5JK0e1Th5uGP5SVJd4vImM2Xieze1g/fj7ag2RJMovJ
         CJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496705; x=1784101505;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkXy4kbxINUY2w5Y8HT7KOs4yBngnLIiuXbssaXGyXo=;
        b=jVV7CWQKiT6YWumztJAkp1wyiKv+qHav0cuy5vQtjZoHLv6OwPNGLEMOej9Jp6mWnr
         vMY7+5TWd0s5t5R41tLWAQEPHQ6TnYcVQVKNlqML2ZgXa2F2GYiaCDzm+FKPVXio+qxM
         1UC55IopXjCRUtUwI93yx6qrxKjAgELRCttGaCH/lhEeUD/X/yPZOX5BvJcxQXSTsT5S
         NsWc9IMEUKJup86/VsGYlTUUB93Birv29tkdCkC/Guq00V4rgNBiAciNd/1K2f4j4wYp
         FOa2PS4rZ7Up93jVMu+ylG0NztFXBb1L0eViN63wTi7KfevZhfIwZ1vbBgNqKy5pZq6S
         +sGw==
X-Forwarded-Encrypted: i=1; AHgh+RoNNzB6rdVwoTkpTjC8EhwizgYu1VB+1d+cBVEdCRodqcxTQJpGQuLbGeKfF1rc9oM0fjcnzm5hFyIXF0s/@vger.kernel.org
X-Gm-Message-State: AOJu0YziFO0ReXAxcTuuVKzMZRlczRQw9n8Zh89Ag0panRGv+Wj8LM/f
	PvYn2hOch5BoGpj8ecBvmIN/aAT+Xih/ObW765aElGTQ7Ly8C5AM7atySs73DNsUdz8=
X-Gm-Gg: AfdE7cmb+vQhyQ0mljdNPreiCckJymgWIoMl/2QzldhxLlSE0gqR2RI1LOYR3F/7hSl
	nTxHMZK+SG8WfL35khXmBbYZWPiA+D2NRFBP/8Txb1JKnpJjDpW0pliKtOE8Z72B566bEKty9iz
	1w7OLXcp5Ic7qtMNMvWeNowmiJ1DUkgeAJHcDeHRXypN0JyzvtapGhb4j+tJ1SFi8J4gixifHsm
	Qtewtbbsxw+0dnzAY/Kl8dLiaEDWPVoNH9JMQLjaTF+ldsKL7f+s2Rt7+k22kH0VOF9BTupfGvP
	J24hFJQ54MZeaDlxK+NLITjdQBMmc6pzwNCxuWP/jLgSbbb4LXtsFbdbGxxuURl2ks7/qdmLlSp
	08cVf605txOYWQ2Ijx7hIZgvIPnbhOfyLP8O+yvOrbT6/AyoH/bzJkKncQ36IJ17IkE5TcBY7WQ
	CXevsOPtWgl/M9f/r2E39KQe6PepgK4t7xWObvKF4qe9L9XiRomqa5YwtxxtFlGHXSIOrsiyxBF
	7f37Q==
X-Received: by 2002:a05:6512:3e05:b0:5ae:b0ea:d32e with SMTP id 2adb3069b0e04-5b0114471b9mr260939e87.2.1783496704298;
        Wed, 08 Jul 2026 00:45:04 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm4284357e87.12.2026.07.08.00.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:45:03 -0700 (PDT)
Message-ID: <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org>
Date: Wed, 8 Jul 2026 10:44:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117540-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69615722D41

On 7/8/26 02:39, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
> 
> The schema here defines two ports with three endpoints:
> 
> port@0: Sensor input.
>            endpoint@0: primary sensor
>            endpoint@1: optional second sensor, implies DPHY split-mode
> 
> port@1: Controller output.
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
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 202 +++++++++++++++++++++
>   1 file changed, 202 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..a7fbf6804cd9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SoC CSI2 PHY
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

Unfortunately my review comment given before was ignored before publishing
this version, thus I will repeat.

There is a clash between the proposed phy cells value and 'bus-type' property
of the media endpoint, the proposed value of phy cells brings no information,
and therefore the whole proposed '#phy-cells' prorperty shall be removed.

There shall be no third link introduced between CAMSS and CAMSS CSIPHYs.

> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +      - const: ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  power-domains:
> +    items:
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +      - description: MMCX voltage rail
> +      - description: MXC or MXA voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: mmcx
> +      - const: mx

None of the power domains finds its place in this device tree node, the
child device belongs to CAMSS, which already enables these power domains.

> +
> +  vdda-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to a PHY.

The property name shall be vdda-0p9-supply, the description shall be
changed accordingly

> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Sensor input. Always present. A single sensor is described by a
> +          single endpoint with one to four data lanes. DPHY split mode,
> +          where two independent sensors share the same PHY, is described
> +          by two endpoints; endpoint@0 with exactly two-data lanes and
> +          endpoint@1 with exactly one data-lane.
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":

This is too wide regexp mask for one or two endpoints only.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +              remote-endpoint: true
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 2
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      maxItems: 1
> +              required:
> +                - endpoint@0
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Output to the CAMSS CSID controller.
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +            properties:
> +              remote-endpoint: true
> +            required:
> +              - remote-endpoint
> +
> +    required:
> +      - port@0
> +      - port@1
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
> +  - vdda-0p8-supply
> +  - vdda-1p2-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> +        clock-names = "core",
> +                      "timer",
> +                      "ahb";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "top",
> +                             "mmcx",
> +                             "mx";
> +
> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csiphy0_in: endpoint {
> +                    data-lanes = <0 1 2 3>;

The previously given review comment about numeration of lanes was
not implemented.

> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                csiphy0_out: endpoint {
> +                    remote-endpoint = <&csid_in>;
> +                };
> +            };
> +        };
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
> +    };
> 

-- 
Best wishes,
Vladimir

