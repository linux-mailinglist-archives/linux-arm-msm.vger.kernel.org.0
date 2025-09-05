Return-Path: <linux-arm-msm+bounces-72384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F47BB4670F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 01:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C46193BAA12
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 23:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E74217F36;
	Fri,  5 Sep 2025 23:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sly972OZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8711F4622;
	Fri,  5 Sep 2025 23:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757114300; cv=none; b=cndM3bATkV5kMpgUg1v76BSuowKrJxTq4Tq3SmhST17/g9r9tOdQy7oQ+yIPXGwen3I86dZrodMmIF30d4Si2Ngf+8GlyI9QY5dIVi24bpbXyKVxzUdGwhxOgQfDkrgKgoX4u4X+QYZu5AQXLQc3b8xEYNEbqTP16g/yLV0BOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757114300; c=relaxed/simple;
	bh=J9WEIa+VV0+QVsnt8Ym5PX6MCPZuNTIbHrVfBa7z+wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6k4eNtEGyuj5DXdj3QH1iEbTe3i4w4Zy3nrcjrHvOGiQ96F/t3pf0WRj4KzYtRbBn3acsAm9nAh+G7R/5khUvVJw80zX2q8yrhDoj4u/6WpK2/BmvI+XPPgMzqwLwjjDRKBT5fXK5PLantAEpVNCVoXLmGmltcjI4Dgt+DGCZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sly972OZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38E6C4CEF1;
	Fri,  5 Sep 2025 23:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757114300;
	bh=J9WEIa+VV0+QVsnt8Ym5PX6MCPZuNTIbHrVfBa7z+wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sly972OZKjGVPtM0/0oy4e80y36ZqOj9wlbDQWxdlzl6I0e/OsuQd5q/ULITS8SLv
	 +6CzeXIOFhWm5Jc4NrGuwofQx2+fVFlVKUZ0UB/lcR3VjxLWRhPT+IoeQ5hvV2k2om
	 Wi2GQqnLE9OnMo2o0vnU/c0YTZOln7K1IC2sHqTR9LecmffgcUeu1LXaNySGkuIs1q
	 dPLQ78Mp0VrIpk7inTNgfWvRWyqYzX0EMqJq9ikhftdDFa7Dwscl3ZKZwQc3jQ5Miv
	 McNRvtIUQaWxYr4Hsee6wIPEOR3atfQ5+FSDTOmSV8YDtcvHhMz5gvnRW0j2V13Kxk
	 hUTS4wWQSdttQ==
Date: Fri, 5 Sep 2025 18:18:19 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 remoteprocs
Message-ID: <20250905231819.GA1484997-robh@kernel.org>
References: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
 <20250905-sm7635-remoteprocs-v4-1-9e24febcb246@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-sm7635-remoteprocs-v4-1-9e24febcb246@fairphone.com>

On Fri, Sep 05, 2025 at 11:37:04AM +0200, Luca Weiss wrote:
> Document the bindings for the ADSP, CDSP, MPSS and WPSS PAS on the Milos
> (e.g. SM7635) SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 +++++++++++++++++++++
>  1 file changed, 201 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..790ad38a0330bf81f6333e887522ddb97690edbc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
> @@ -0,0 +1,201 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,milos-pas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Milos SoC Peripheral Authentication Service
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  Qualcomm Milos SoC Peripheral Authentication Service loads and boots firmware
> +  on the Qualcomm DSP Hexagon cores.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,milos-adsp-pas
> +      - qcom,milos-cdsp-pas
> +      - qcom,milos-mpss-pas
> +      - qcom,milos-wpss-pas
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  interrupts:
> +    minItems: 6
> +    maxItems: 6
> +
> +  interrupt-names:
> +    minItems: 6
> +    maxItems: 6
> +
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
> +  smd-edge: false
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string-array

Drop. Already has a type.

> +    minItems: 1
> +    items:
> +      - description: Firmware name of the Hexagon core
> +      - description: Firmware name of the Hexagon Devicetree
> +
> +  memory-region:
> +    minItems: 1
> +    items:
> +      - description: Memory region for core Firmware authentication
> +      - description: Memory region for Devicetree Firmware authentication
> +
> +required:
> +  - compatible
> +  - reg
> +  - memory-region
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,milos-adsp-pas
> +            - qcom,milos-cdsp-pas
> +    then:
> +      properties:
> +        memory-region:
> +          minItems: 2
> +          maxItems: 2

Max is already 2. Drop.

> +        firmware-name:
> +          minItems: 2
> +          maxItems: 2

Max is already 2. Drop.

> +    else:
> +      properties:
> +        memory-region:
> +          maxItems: 1
> +        firmware-name:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,milos-adsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: LCX power domain
> +            - description: LMX power domain
> +        power-domain-names:
> +          items:
> +            - const: lcx
> +            - const: lmx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,milos-cdsp-pas
> +            - qcom,milos-wpss-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MX power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,milos-mpss-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MSS power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mss
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    remoteproc@3000000 {
> +        compatible = "qcom,milos-adsp-pas";
> +        reg = <0x03000000 0x10000>;
> +
> +        interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog",
> +                          "fatal",
> +                          "ready",
> +                          "handover",
> +                          "stop-ack",
> +                          "shutdown-ack";
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "xo";
> +
> +        power-domains = <&rpmhpd RPMHPD_LCX>,
> +                        <&rpmhpd RPMHPD_LMX>;
> +        power-domain-names = "lcx",
> +                             "lmx";
> +
> +        interconnects = <&lpass_ag_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +
> +        memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
> +
> +        firmware-name = "qcom/milos/vendor/device/adsp.mbn",
> +                        "qcom/milos/vendor/device/adsp_dtb.mbn";
> +
> +        qcom,qmp = <&aoss_qmp>;
> +
> +        qcom,smem-states = <&smp2p_adsp_out 0>;
> +        qcom,smem-state-names = "stop";
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&ipcc IPCC_CLIENT_LPASS
> +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +            label = "lpass";
> +            qcom,remote-pid = <2>;
> +
> +            /* ... */
> +        };
> +    };
> 
> -- 
> 2.51.0
> 

