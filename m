Return-Path: <linux-arm-msm+bounces-100914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAbAMD8Cy2k2CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 01:07:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC86362435
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 01:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C19943052885
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F833258EC1;
	Mon, 30 Mar 2026 22:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcmW42Z+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24BE2F0C45
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 22:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774911458; cv=none; b=FMZHPauYEvDB+jNAzHqYzAcpZtsaVACk9p3n5zZao85LYBT7HvpMqshjf0JpvDEBGMyaq9gNHxIi1ivSj1Wj+tnoLMkpWUlaka64JAVo1Q1xxqLaQz8vMuPBddWzOe/BLxIg3xeSzHwhg6IHjyP5Es2crBJyqguymDXkIvW1yno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774911458; c=relaxed/simple;
	bh=hQsdyERR74qRKPMJNyFGbZHVahogzUjyMMONQNhrMWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kShzo4225eGuFF8Ijp1ZkkW6LiAlu8l/aWLDentmtHIPndQnI+N7aWiMQeU926OSDTvDcAjMunHXkqvhN1sPXV3/nUwMd5io7W3Yshc4JLUqpOtkrus2Odx5dsptJX92dHuj+UcCgDHEl47jctseu5ivQWsLbjSYhKXloHRqBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcmW42Z+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a33933e99so3480561fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774911454; x=1775516254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7WoW9KojJd/EruKijMjZJsZ/emWsflnF0k0IAtenmQ=;
        b=DcmW42Z+lpgwYdPQlFcPC7/tar5UPrszZk3+uOsh1qa9U6gmTqwlGnarYUpNQTQYvw
         2J+Mn3gw/aNOAHO+2RHdNFp2l//BYZrvJX0GddBiJTmWGf/Buif7gmOqj/C8zhckWDzn
         DfW1wtvuM6bgroBsMFMsiyzzMrPsY/Wac81FYDaBVd7NXoBwX5yhPuyG2ZQOP6g161si
         DI2AYizW84d9tnBfYmMZ41OiepPf/KDxhQXOXBJetn3L1jH7CZ17BvTJNU1i20DVXBi9
         RvU3oTPxvZZrS6DxeKtZNdlzFlUH4wE8UNi13u9IL7+HIl5xGiuoLr5FRHPTfG0DJVU5
         bPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774911454; x=1775516254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7WoW9KojJd/EruKijMjZJsZ/emWsflnF0k0IAtenmQ=;
        b=jKAc38DuTK5j+yzv+Vw0vIeEtDaiznwqrz3URkaw6xdl22luDAd2u810DfZQFHbu+o
         Gr0siqpyvg4XrlDRfrbP8yzAyvHjHj/7qXpjsy28RRciHlAtFcjk4w2WLe0NyIX1/mke
         lrvUIZlOL1+uWlMw1zU9B301emOD6GgLmHS4pZ2yS1i9rBlebB35qCDQEoJGZbaCue+4
         Nn2KJUIo66dK0sOUIDT7+bUJEOq4Mdjm0ScEPQvtmBRcX1y9P4+nTZ0yRnRt8G8/Kj7k
         kg94DjFyqDA9bx+EFmLjziGqj1/o4Te4i0hC28H06X2Q7H9DhmwFEXx2plYCvDNpvbPO
         jHCw==
X-Forwarded-Encrypted: i=1; AJvYcCVvvXbSjj7r2W9kOUV3MAvz76c3jtnv+til04EDKAk84GekvT0tSzZDChN8R1fmsnAo4PZfwDNywrprFiHs@vger.kernel.org
X-Gm-Message-State: AOJu0YzHhaDapQXp6s/hFJc3bbwBORGSOleywqAhKCl/fHvjLjUZCPkR
	gSE1eZWBleeiMLTDcuom1F56YSnnsa9l+OKSXzq79CvnTYoyjHGDpmVMBMEdc/0CPrhHZO0wjyj
	hDCFW
X-Gm-Gg: ATEYQzx+XwSD8ZRKjauuKf3JJwzaWjNCfDD8YFQYEdlrStzosC3sNP01sLEHLCs6YR5
	kvHtDS73wjupJIs/NvoUKRmCbytNdZohqEBc0TQIyIwyhcaWTd9+zi41ZaQhYcTCaUqFTmpr9Vl
	F+YP1slKm+U18u5s9Crr2g6jEDQwwcSBANGbGs9Nbl4d/2CfJo/RqeUxLD/CaY8CtSwLz3zWblf
	4j9v1bRQ6TylmKT6Rz+xoS4wE+irfeFBk7vSMpFBPL/fFz4N2sMzzHjoWIqIgtrGWCSZYFT4L0e
	FnbCDTbQm4NN64JMsJnuVBLGXgggqZ8PUL0+CCfoArbuzVsOQyMdp3qe5uTm46Z1ZTEEZE+1kLW
	CGwA2PnsAFRS0WoLcYZq4JdqVIOOxsvhhrOY60NDoZqteaNmFgJbVsUG5Nzad27pNYgwtSBQRmt
	Nd7KbNo84JXOnK9yNRYtTDeGmnbHKyBK9YlZOIhWSMnop+ny7x4F8iIP15Opo0rnlxY8RdNG96U
	QK0Cw==
X-Received: by 2002:a05:6512:1381:b0:5a2:845e:9d9a with SMTP id 2adb3069b0e04-5a2ab937b64mr3184312e87.6.1774911453823;
        Mon, 30 Mar 2026 15:57:33 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4367sm1966324e87.1.2026.03.30.15.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 15:57:33 -0700 (PDT)
Message-ID: <fe00906e-fb06-44e3-985b-3d0e95839e43@linaro.org>
Date: Tue, 31 Mar 2026 01:57:32 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100914-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: 6AC86362435
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/16/26 10:54, Luca Weiss wrote:
> Add bindings for the Camera Subsystem on the SM6350 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++++
>   1 file changed, 471 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> new file mode 100644
> index 000000000000..96974d90d8c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> @@ -0,0 +1,471 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm6350-camss
> +
> +  reg:
> +    maxItems: 24
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +      - const: a5_csr
> +      - const: a5_qgic
> +      - const: a5_sierra
> +      - const: bps
> +      - const: camnoc
> +      - const: core_top_csr_tcsr
> +      - const: cpas_cdm
> +      - const: cpas_top
> +      - const: ipe
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: lrme
> +
> +  clocks:
> +    maxItems: 39
> +
> +  clock-names:
> +    items:
> +      - const: cam_axi
> +      - const: soc_ahb
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe2_axi
> +      - const: vfe2
> +      - const: vfe2_cphy_rx
> +      - const: vfe2_csid
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +      - const: bps
> +      - const: bps_ahb
> +      - const: bps_areg
> +      - const: bps_axi
> +      - const: icp
> +      - const: ipe0
> +      - const: ipe0_ahb
> +      - const: ipe0_areg
> +      - const: ipe0_axi
> +      - const: jpeg
> +      - const: lrme
> +
> +  interrupts:
> +    maxItems: 18
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +      - const: a5
> +      - const: cpas
> +      - const: cpas_cdm
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: lrme
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +      - const: sf_icp_mnoc
> +
> +  iommus:
> +    maxItems: 14
> +
> +  power-domains:
> +    maxItems: 6
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +      - const: bps
> +      - const: ipe

I've lost the content, why 'top' is somewhere in the middle?

> +
> +  vdd-csiphy0-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY0.
> +
> +  vdd-csiphy0-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY0.
> +
> +  vdd-csiphy1-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY1.
> +
> +  vdd-csiphy1-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY1.
> +
> +  vdd-csiphy2-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY2.
> +
> +  vdd-csiphy2-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY2.
> +
> +  vdd-csiphy3-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY3.
> +
> +  vdd-csiphy3-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY3.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data from a CSIPHY.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
> +    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm6350.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@acb3000 {
> +            compatible = "qcom,sm6350-camss";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acba000 0x0 0x1000>,
> +                  <0x0 0x0acc1000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,
> +                  <0x0 0x0ac65000 0x0 0x1000>,
> +                  <0x0 0x0ac66000 0x0 0x1000>,
> +                  <0x0 0x0ac67000 0x0 0x1000>,
> +                  <0x0 0x0ac68000 0x0 0x1000>,
> +                  <0x0 0x0acaf000 0x0 0x4000>,
> +                  <0x0 0x0acb6000 0x0 0x4000>,
> +                  <0x0 0x0acbd000 0x0 0x4000>,
> +                  <0x0 0x0acc4000 0x0 0x4000>,
> +                  <0x0 0x0ac18000 0x0 0x3000>,
> +                  <0x0 0x0ac00000 0x0 0x6000>,
> +                  <0x0 0x0ac10000 0x0 0x8000>,
> +                  <0x0 0x0ac6f000 0x0 0x8000>,
> +                  <0x0 0x0ac42000 0x0 0x4600>,
> +                  <0x0 0x01fc0000 0x0 0x40000>,
> +                  <0x0 0x0ac48000 0x0 0x1000>,
> +                  <0x0 0x0ac40000 0x0 0x1000>,
> +                  <0x0 0x0ac87000 0x0 0xa000>,
> +                  <0x0 0x0ac52000 0x0 0x4000>,
> +                  <0x0 0x0ac4e000 0x0 0x4000>,
> +                  <0x0 0x0ac6b000 0x0 0xa00>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite",
> +                        "a5_csr",
> +                        "a5_qgic",
> +                        "a5_sierra",
> +                        "bps",
> +                        "camnoc",
> +                        "core_top_csr_tcsr",
> +                        "cpas_cdm",
> +                        "cpas_top",
> +                        "ipe",
> +                        "jpeg_dma",
> +                        "jpeg_enc",
> +                        "lrme";
> +
> +            clocks = <&gcc GCC_CAMERA_AXI_CLK>,
> +                     <&camcc CAMCC_SOC_AHB_CLK>,
> +                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAMCC_CORE_AHB_CLK>,
> +                     <&camcc CAMCC_CPAS_AHB_CLK>,
> +                     <&camcc CAMCC_CSIPHY0_CLK>,
> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY1_CLK>,
> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY2_CLK>,
> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY3_CLK>,
> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAMCC_IFE_0_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_0_CLK>,
> +                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_0_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_1_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_1_CLK>,
> +                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_1_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_2_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_2_CLK>,
> +                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_2_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAMCC_BPS_CLK>,
> +                     <&camcc CAMCC_BPS_AHB_CLK>,
> +                     <&camcc CAMCC_BPS_AREG_CLK>,
> +                     <&camcc CAMCC_BPS_AXI_CLK>,
> +                     <&camcc CAMCC_ICP_CLK>,
> +                     <&camcc CAMCC_IPE_0_CLK>,
> +                     <&camcc CAMCC_IPE_0_AHB_CLK>,
> +                     <&camcc CAMCC_IPE_0_AREG_CLK>,
> +                     <&camcc CAMCC_IPE_0_AXI_CLK>,
> +                     <&camcc CAMCC_JPEG_CLK>,
> +                     <&camcc CAMCC_LRME_CLK>;
> +            clock-names = "cam_axi",
> +                          "soc_ahb",
> +                          "camnoc_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "vfe0_axi",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe0_csid",
> +                          "vfe1_axi",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe1_csid",
> +                          "vfe2_axi",
> +                          "vfe2",
> +                          "vfe2_cphy_rx",
> +                          "vfe2_csid",
> +                          "vfe_lite",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid",
> +                          "bps",
> +                          "bps_ahb",
> +                          "bps_areg",
> +                          "bps_axi",
> +                          "icp",
> +                          "ipe0",
> +                          "ipe0_ahb",
> +                          "ipe0_areg",
> +                          "ipe0_axi",
> +                          "jpeg",
> +                          "lrme";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite",
> +                              "a5",
> +                              "cpas",
> +                              "cpas_cdm",
> +                              "jpeg_dma",
> +                              "jpeg_enc",
> +                              "lrme";
> +
> +            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
> +
> +            iommus = <&apps_smmu 0x820 0xc0>,
> +                     <&apps_smmu 0x840 0x0>,
> +                     <&apps_smmu 0x860 0xc0>,
> +                     <&apps_smmu 0x880 0x0>,
> +                     <&apps_smmu 0xc40 0x20>,
> +                     <&apps_smmu 0xc60 0x20>,
> +                     <&apps_smmu 0xc80 0x0>,
> +                     <&apps_smmu 0xca2 0x0>,
> +                     <&apps_smmu 0xcc0 0x20>,
> +                     <&apps_smmu 0xce0 0x20>,
> +                     <&apps_smmu 0xd00 0x20>,
> +                     <&apps_smmu 0xd20 0x20>,
> +                     <&apps_smmu 0xd40 0x20>,
> +                     <&apps_smmu 0xd60 0x20>;
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc IFE_2_GDSC>,
> +                            <&camcc TITAN_TOP_GDSC>,
> +                            <&camcc BPS_GDSC>,
> +                            <&camcc IPE_0_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "ife2",
> +                                 "top",
> +                                 "bps",
> +                                 "ipe";
> +
> +            vdd-csiphy0-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy0-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy1-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy1-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy2-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy2-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy3-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy3-1p25-supply = <&vreg_l22a>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy0_ep: endpoint {
> +                        data-lanes = <0 1 2 3>;
> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

Because CAMSS device tree nodes are far from being settled down, one
more time I can just express my opinion that there is no good enough
reason to describe all clocks and interconnects prematurely, anyway

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

