Return-Path: <linux-arm-msm+bounces-2148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B43FE7FA8AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 19:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB148B20FF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 18:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB733BB4E;
	Mon, 27 Nov 2023 18:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C668719A;
	Mon, 27 Nov 2023 10:13:49 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b565e35fedso2721938b6e.2;
        Mon, 27 Nov 2023 10:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108829; x=1701713629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR1Rs/ndx5ls/RDGhrbQcXFAp09UG6IwnVF2MyVPSLg=;
        b=oBQNWT6D0TS3GNjjlnkCaDcJncTcnWhQiv/ED/gph2cjgFmV44VH+nQmMmJj5gFTV3
         PgSecFxNMgv4fJrl270mKjjKxMPTZjslC0aVguafLd/h40cd/qPfxN/PNxY75uyu9wA6
         Do/WEdACyw1QjALcSeOCTChxa7Q4/Hspd4Hhf+t5vNC9+aVmKj2pfcWQr8Hu28wnjU4X
         nMK7/BIMv//p4MWLYOt+1Xf4W1Lj98qKGywXqhalT7xCTkcRShUFsep1bB2UbJV7f35h
         Y4EEAYihTziICG911S5/ONytK1l98w4PPvGMOmyh4HnIJyU52ODwLQQ6HV2Afcuj7rfq
         2l1w==
X-Gm-Message-State: AOJu0Yyy/bnYyG5wuZfpeorK234A9sir6sez6J1T/WVMXH0t2ZanAXWE
	0h08SoFs/J7suwPU1QsoRspnnpqs9g==
X-Google-Smtp-Source: AGHT+IEm/Eap+gR2fTM/l+v5zOO+PgePHcGsnBPWYC1e0nJGthy00BuM6p6br3QKG2WYcF/pn+lYpw==
X-Received: by 2002:a05:6808:1a0e:b0:3b6:ced9:4176 with SMTP id bk14-20020a0568081a0e00b003b6ced94176mr17481305oib.31.1701108828974;
        Mon, 27 Nov 2023 10:13:48 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bi21-20020a056808189500b003b85c5813fdsm919620oib.21.2023.11.27.10.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:13:48 -0800 (PST)
Received: (nullmailer pid 2053755 invoked by uid 1000);
	Mon, 27 Nov 2023 18:13:47 -0000
Date: Mon, 27 Nov 2023 12:13:47 -0600
From: Rob Herring <robh@kernel.org>
To: Georgi Djakov <quic_c_gdjako@quicinc.com>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, devicetree@vger.kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_cgoldswo@quicinc.com, quic_sukadev@quicinc.com, quic_pdaly@quicinc.com, quic_sudaraja@quicinc.com, djakov@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: Add Translation Buffer Unit
 bindings
Message-ID: <20231127181347.GA1953740-robh@kernel.org>
References: <20231118042730.2799-1-quic_c_gdjako@quicinc.com>
 <20231118042730.2799-2-quic_c_gdjako@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118042730.2799-2-quic_c_gdjako@quicinc.com>

On Fri, Nov 17, 2023 at 08:27:25PM -0800, Georgi Djakov wrote:
> The "apps_smmu" on the Qualcomm sdm845 platform is an implementation
> of the SMMU-500, that consists of a single TCU (Translation Control
> Unit) and multiple TBUs (Translation Buffer Units). The TCU is already
> being described in the generic SMMU DT schema. Add also bindings for
> the TBUs to describe their properties and resources that needs to be
> managed in order to operate them.
> 
> In this DT schema, the TBUs are modelled as child devices of the TCU
> and each of them is described with it's register space, clocks, power
> domains, interconnects etc.
> 
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 25 ++++++
>  .../bindings/iommu/qcom,qsmmuv500-tbu.yaml    | 89 +++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index aa9e1c0895a5..f7f89be5f7a3 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -231,6 +231,18 @@ properties:
>        enabled for any given device.
>      $ref: /schemas/types.yaml#/definitions/phandle
>  
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^tbu@[0-9a-f]*":
> +    type: object
> +
>  required:
>    - compatible
>    - reg
> @@ -453,6 +465,19 @@ allOf:
>              - description: Voter clock required for HLOS SMMU access
>              - description: Interface clock required for register access
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,smmu-500

Doesn't match your example. No failure either, so there's some problem 
with your schema. The issue is the tbu@ entry above has no constraint on 
child properties. Dropping it would solve the issue. However, having a 
TBU is not QCom specific, so that doesn't feel right.


> +    then:
> +      patternProperties:
> +        "^tbu@[0-9a-f]*":

'+' rather than '*' as 1 is the minimum, not 0.

> +          $ref: qcom,qsmmuv500-tbu.yaml
> +          unevaluatedProperties: false
> +      properties:
> +        ranges: true
> +
>    # Disallow clocks for all other platforms with specific compatibles
>    - if:
>        properties:
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml b/Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml
> new file mode 100644
> index 000000000000..4dc9d0ca33c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/qcom,qsmmuv500-tbu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm TBU (Translation Buffer Unit)
> +
> +maintainers:
> +  - Georgi Djakov <quic_c_gdjako@quicinc.com>
> +
> +description:
> +  The Qualcomm SMMU500 implementation consists of TCU and TBU. The TBU contains
> +  a Translation Lookaside Buffer (TLB) that caches page tables. TBUs provides
> +  debug features to trace and trigger debug transactions. There are multiple TBU
> +  instances distributes with each client core.
> +
> +properties:
> +  $nodename:
> +    pattern: "^tbu@[0-9a-f]+$"

Drop. You defined this in the parent already.

> +
> +  compatible:
> +    const: qcom,qsmmuv500-tbu
> +
> +  reg:
> +    items:
> +      - description: Address and size of the TBU's register space.
> +
> +  reg-names:
> +    items:
> +      - const: base

Not a useful name. Drop.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  qcom,stream-id-range:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Stream ID range (address and size) that is assigned by the TBU
> +    items:
> +      minItems: 2
> +      maxItems: 2

Perhaps implementations other than QCom's needs this?

Rob

