Return-Path: <linux-arm-msm+bounces-115111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Z55Fqt3Qmq87wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:48:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C9A6DB81D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:48:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="nJ/v7HWb";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115111-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115111-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3BF4304B06E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EEF231C91;
	Mon, 29 Jun 2026 13:38:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF81920C00A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:38:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740314; cv=none; b=AtjFNCYMrvvQ6cHXzTvV/X5wlFYvEvTzM4dUHHsMo2eubVX8MFWBAtsD9C+u3Y1DiA6s/ctVfmgZtJzDQrSsGCu2lk9ZNtIYbdIcKG0c6tSfkIyVcxHSbv4Dqy99ag1zG8ZgTf8XkyrmpbZ35GEtPaAVk1Tgcln4IIG7XWKKoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740314; c=relaxed/simple;
	bh=TfGPUSh1Tkv5RQsbszpn0J091nTNxxCn1z8sG6lbaa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgNYIxtvxJRby4wSgHUSq+lnVcKilRVA9qr9AdGAojP0gUBzI5t2LnovtYZaDEt00Les3ty5igV485sLKRHIIWmwLOLyJ0uZYtR/ttr0tTbxLArXum/B1cQurFxv9cTTG8YVmb5kHQrpcaOFbjsbP2KkSpdSmKS7Uae9erUDGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJ/v7HWb; arc=none smtp.client-ip=209.85.167.43
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aea63b44eeso281142e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782740311; x=1783345111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zJW6e0aSzU7jXjzCKOKSVMzV7kCjNy2RKnzo8JF5eQ8=;
        b=nJ/v7HWbplWkjOcvCCCQutg4rzqmAMqUAaoodtWWIsG/YmtcBhp691pqEXdxzxJgeT
         Xbs7A+txNeOzMn+neBSnUhACZZ6AccrRI4L66QhHukN3Cm7olEGuFwkrX9JRzo25C7nK
         xEHzm6vCz5C6BkFhVOVWpQFrDdx+WSYQh9K6e/ns0UOmiTkHHWleU/W5ZKQPuDRXXPY2
         rovCMmsiI36mzxNjoDl2RrzHQuMYuuq/CwasrT8YXi5aGZ10JUqORTQZBHAJjojpm5Tk
         dtjtgDgnG85BezrwUtFXenufbNETUlWdpTiEU73ieA8xL38Uw88KmkD4cK+WKNi5tpKa
         +Whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740311; x=1783345111;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJW6e0aSzU7jXjzCKOKSVMzV7kCjNy2RKnzo8JF5eQ8=;
        b=D3oUsrgDK6mOj4YzLsq2tzmbuhTC22EWo0PAaxrgLtr1ryyxX3RBeegfEQRo06JX1K
         7g2SMkoHbbl2KLB6Juh0HxQpxRrT9YoCvKinRlVMq+38f9KLLkGSfR26rClx4fN5yBm5
         iDGFCZ+nlf99ZNwLNzaDYFGiegNl6aw45Ui4LCWNWvKXLAjWVYeLC/k/pYFTwZvsdBPB
         1WDHW6VuNXlzlwu9suHz0zxRwj5iyxRSh3Np+Z5ob2i44XMsCI3sjf4pTLjPQAepqFs+
         gFJYeFHawTsM2O1KiktaCoRxLo0A6gPXxUZE2Mp3Zl4dN6Zda66Fkm2vhMxqzYefIcqD
         hLFw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8whtPmL4nNf2Tly9WQAOLznpupO7Q4/wdMadJG/066SjEBEt2KI2uWGwE4wmTZnSy0ro9WQlfs6h0+zQy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WN/1vXQfSAg7xdbvJAsfbwk0FuhVGpUSHc7l6Rkh+VjoCWi+
	ZGt/KSGFHS+A/43wka0o6XCqtedJEMo+RaqrFsKflBp6wI9pys8hSdDS9WtSSJQ15xU=
X-Gm-Gg: AfdE7cn6vEu/E3F7Ml7KZXb4zwDaUYUlDa4YvhIrGb1SWMzL9iql29hVe+UBZyTwzwX
	x+Z6NqHtb/zhV+qNppg8yv5D1n2I4gUHaWxXnmeRYQZ6URvk2bQj6Ril8oyNqk211wZ5LPxJA/v
	I/2Q3ho9yJw1qwR0/Sz5VabmS9aMULkBI5E5daOtLncoByCcj71/+9gLb5BHY4Gx5KoGwQxYFAU
	mbwvg4qqE5zKnrXW9tPQhOlcCxhWRXFvHOuFq8pr2r6UqhUMqkrKAKkjce2RLDp5UbnbvJyQdbk
	GPBdjkgGvN5MplSYQTbTqNEep0AEuiwtJuTeZzbLxHz67xdwc5FauZ5zXUBlgv5q4g+uNj8yV8k
	P2T1VrHA7ITwfVYsgfxfmQZU6qa1igEHqciZfuevzBVSTmzNit69CKBlndZxyy8miVJYdJqtG/L
	26grs0QOgx2BC5Tmg4NeDcwUt9ZlBRKXWmxD0FC9zjqMH364XzXRSlND/1N7Tvi/QA/O0=
X-Received: by 2002:a05:6512:3b11:b0:5ae:ba7d:8fad with SMTP id 2adb3069b0e04-5aeba7d9145mr395243e87.4.1782740310847;
        Mon, 29 Jun 2026 06:38:30 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb72c186dsm1237741e87.43.2026.06.29.06.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:38:30 -0700 (PDT)
Message-ID: <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
Date: Mon, 29 Jun 2026 16:38:29 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115111-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4C9A6DB81D

Hi Atanas.

On 6/29/26 15:17, Atanas Filipov wrote:
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) SoCs.
> 
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,jpeg-encoder.yaml     | 160 ++++++++++++++++++
>   1 file changed, 160 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..c8b4808054cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-jenc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: hf_axi
> +      - const: sf_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cnoc_axi
> +      - const: jpeg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    description:
> +      Two SMMU stream IDs for the JPEG hardware. The first entry is for
> +      the JPEG core engine; the second is for the JPEG DMA/scale path.
> +      The exact stream ID assignment is SoC-specific and not publicly
> +      documented by Qualcomm.
> +    minItems: 2
> +    maxItems: 2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: hf-mnoc
> +      - const: sf-mnoc
> +      - const: icp-mnoc
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - iommus
> +  - interconnects
> +  - interconnect-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss@ac6a000 {
> +            compatible = "qcom,sm8250-camss";
> +            reg = <0 0x0ac6a000 0 0x2000>;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            jpeg-encoder@ac53000 {
> +                compatible = "qcom,sm8250-jenc";
> +                reg = <0 0xac53000 0 0x1000>;
> +
> +                interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +                power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +                clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                         <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                         <&camcc CAM_CC_CORE_AHB_CLK>,
> +                         <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                         <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                         <&camcc CAM_CC_JPEG_CLK>;
> +                clock-names = "hf_axi",
> +                              "sf_axi",
> +                              "core_ahb",
> +                              "cpas_ahb",
> +                              "cnoc_axi",
> +                              "jpeg";
> +                iommus = <&apps_smmu 0x2040 0x400>,
> +                         <&apps_smmu 0x2440 0x400>;
> +
> +                interconnects =
> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
> +                interconnect-names = "cpu-cfg",
> +                                     "hf-mnoc",
> +                                     "sf-mnoc",
> +                                     "icp-mnoc";

Since the proper option for describing this hardware is to have it as
a child device tree node of CAMSS device tree node, which should serve
or be percepted as a bus, it makes no sense to repeat and moreover rename
bus/parent's resources, here is the list:

* "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
* Titan GDSC power domain and all four interconnects.

Only "jpeg" clock and iommus are left specific to the hardware description
of this IP under CAMSS, right? Thus, it should be reflected like this in
the dt description as well, and the complexity of shared resource management
has to be done in the driver, which might be tedious unfortunately, but
certainly doable.

> +
> +                operating-points-v2 = <&jpeg_opp_table>;
> +
> +                jpeg_opp_table: opp-table {
> +                    compatible = "operating-points-v2";
> +
> +                    opp-300000000 {
> +                        opp-hz = /bits/ 64 <300000000>;
> +                        opp-level = <0>;
> +                        required-opps = <&rpmhpd_opp_svs>;
> +                    };
> +
> +                    opp-400000000 {
> +                        opp-hz = /bits/ 64 <400000000>;
> +                        opp-level = <1>;
> +                        required-opps = <&rpmhpd_opp_svs>;
> +                    };
> +
> +                    opp-480000000 {
> +                        opp-hz = /bits/ 64 <480000000>;
> +                        opp-level = <2>;
> +                        required-opps = <&rpmhpd_opp_svs_l1>;
> +                    };
> +
> +                    opp-600000000 {
> +                        opp-hz = /bits/ 64 <600000000>;
> +                        opp-level = <3>;
> +                        required-opps = <&rpmhpd_opp_nom>;
> +                    };
> +                };
> +            };
> +        };
> +    };

-- 
Best wishes,
Vladimir

