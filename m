Return-Path: <linux-arm-msm+bounces-64611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B370AB01E44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F17B05A585D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEAE8BEC;
	Fri, 11 Jul 2025 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0vKWX0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A572D3A6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241841; cv=none; b=IjUp5fEJF7R+JmWHVH0o91AYErWw0nS8bVUX7YYGFcvZ7CMRiAnm/nhSOvDYWqAWi7uREqs7iDCKtA0L9sa213FG71zRms5V5tm43bLC8+CaWn2cWhDvkTF8rmNiX3l++63NOQc93IQslgUGa1Rmo5AC7QD8p9Z1FpG0SmWhBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241841; c=relaxed/simple;
	bh=xrOfrea3ktIO3rH/cRZjG/WzXdNS8Fe/7C22LVDHtd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0MbLBHEsOxzDJkzkIsMQc7s9RjQoaUprwLHs1HCnM9GXRe7c7xkFuaG480VGgEEchuasu6MJbaRRVDJ1SR9kMAGdmDYxv1J/+8+RQUjvrA0GsFq4fR/En0J5CxoYksrJnumB6wjV1eEaP+OqRz12i+EhvFvKYMA72C2Q+dir5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W0vKWX0Q; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748e81d37a7so1351785b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752241839; x=1752846639; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxCChrglHn+Uqy0YUudJl4m6M4rjCL8xQf7aFXlmf3g=;
        b=W0vKWX0QDjMc7M4E53btXqi/fZKT2AHHqAsDH6LDM9lbB8fLYgy8j2G6+5U/AGT94V
         Sk6W6Vcwz+Akc4BP4VHttEyrl6+yPHtQcpriU5nTXRZ7ZbefLorI46b4WDHdeHfJhzEw
         R/VQi+fW772BQpPzEh3MCc7ccYGQmV1/Iy65lDxQW5kLZo1EHrt5ArUKnHf6R8ogoltc
         eHZre9nr6FTEhOaOwftpkA/3b0EAQoGW3c+WSDdUeBacPFt42GXD7j7Ka4EXQaCASk8M
         lK/vgype0Da1q4BMLMlV+fLD/sOM1yYcYKrfX2WbkePnngQBQTDZm5yZQ9/ddgI3P3eY
         qbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752241839; x=1752846639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxCChrglHn+Uqy0YUudJl4m6M4rjCL8xQf7aFXlmf3g=;
        b=Ag1lk5iPJOqPl3VRaveE502/NTRfSjTte4xZ8qaonsRrBYtNSl20G1PBlaEyiYxnsn
         klzRKYb7+9y+6sILVtLlZHq9CiCHYMthThiBTRpm6CPNoW7pN0n+ffak5SAW+Cb9GyD3
         XkppFOSEmsJyuVXwpxcoQB/1NlOG186nxgMuOuMuJhdjO9I/dlkgPlaN4DRmtkCj0Vp7
         eUQyDDGrdVgb7/KAyrhEiWz4X7UOKIVcF80aw+XsercZsczwfiwxyf6wBDN6MMaSH0C5
         jszHh8sND36ZU5YN6Vkdq9Tich9I0S7GkjM61PL9C6XuGSlxNq9FuWTZUo/x8jXsIGcr
         x21w==
X-Forwarded-Encrypted: i=1; AJvYcCW+Rg/TVhNPKM6S6Bxb8jpS8EH0r6L+wbs/NxM73hCZhVtLTOdnGRuaxf0DU1PS7SAPGk8TjSZWeClzrZKc@vger.kernel.org
X-Gm-Message-State: AOJu0YzBn+EYYcGm3wifHKRPFCGRFlK2Gwmp9Zaj5mcmQl0Vi0ZHY3F8
	QSJGeeyXOtHtmtd9K9PyrvzvaEuHWQ3kQBnne/SrnAYcEOPmxJR5qJVRJd3jpx3ToovEKgXJnUk
	zEGPNNZxc5J2MeVzluQyYPGfPfNzFyUUKWCcV8ppuOw==
X-Gm-Gg: ASbGncuCdNcevTnY/PVkcq0N0rQDX8toP6pZKXDHxNxjS7psiIm95ZZRZzSdjvQcGs+
	DMQj/CnD5kq8c02mvf5n88aENWKqhch2TFRLN2Cei37hTT1cxFjsSeuJGbcF0lFqv5BAXNWH+Hs
	xepR1VU8pqGEBfUHFoddDtfQtw5lznDPY/iLir474EzWj65palDt2PjVJ7mTOZ9+wAKuuV1FwqI
	TGX7m3A7KxJ0dvj7xRxie2pyuJgvvUAvCvLSPRR
X-Google-Smtp-Source: AGHT+IF9w1zlsOy9Tpc/VqUpX5hlsohRMIl3W8B9IgIpmh4707Cf+Roh6PhUrMsx1N8++dq63Ov8Ydg2FFN95JGpX3E=
X-Received: by 2002:a05:6a00:856:b0:748:fcfa:8bd5 with SMTP id
 d2e1a72fcca58-74ee0bb022amr4951233b3a.3.1752241839246; Fri, 11 Jul 2025
 06:50:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com> <20250611-trace-noc-v10-1-a83b5c63da34@quicinc.com>
In-Reply-To: <20250611-trace-noc-v10-1-a83b5c63da34@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Jul 2025 14:50:27 +0100
X-Gm-Features: Ac12FXz5suXDSfb0reqEF8K7TSk9o2sFELW1ViZ5ykT-xvY6SdObq4JpNg1MVng
Message-ID: <CAJ9a7Vhs=5pXu4JvqeAbLBbV97x4xwVP6ag4oiK5sbJntwNNqA@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: arm: Add device Trace Network On
 Chip definition
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 11:43, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
>
> Add a new coresight-tnoc.yaml file to describe the bindings required to
> define Trace Network On Chip (TNOC) in device trees. TNOC is an
> integration hierarchy which is a hardware component that integrates the
> functionalities of TPDA and funnels. It collects trace form subsystems
> and transfers to coresight sink.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9d1c93a9ade3ff14ede4a8d1481782776cf47be9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Trace Network On Chip - TNOC
> +
> +maintainers:
> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> +
> +description: >
> +  The Trace Network On Chip (TNOC) is an integration hierarchy hardware
> +  component that integrates the functionalities of TPDA and funnels.
> +
> +  It sits in the different subsystem of SOC and aggregates the trace and
> +  transports it to Aggregation TNOC or to coresight trace sink eventually.
> +  TNOC embeds bridges for all the interfaces APB, ATB, TPDA and NTS (Narrow
> +  Time Stamp).
> +
> +  TNOC can take inputs from different trace sources i.e. ATB, TPDM.
> +
> +  Note this binding is specifically intended for Aggregator TNOC instances.
> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,coresight-tnoc
> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^tn(@[0-9a-f]+)$"
> +
> +  compatible:
> +    items:
> +      - const: qcom,coresight-tnoc
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  clocks:
> +    items:
> +      - description: APB register access clock
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port(@[0-9a-f]{1,2})?$':
> +        description: Input connections from CoreSight Trace Bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +  out-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description:
> +          Output connection to CoreSight Trace Bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - in-ports
> +  - out-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tn@109ab000  {
> +      compatible = "qcom,coresight-tnoc", "arm,primecell";
> +      reg = <0x109ab000 0x4200>;
> +
> +      clocks = <&aoss_qmp>;
> +      clock-names = "apb_pclk";
> +
> +      in-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +
> +          tn_ag_in_tpdm_gcc: endpoint {
> +            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
> +          };
> +        };
> +      };
> +
> +      out-ports {
> +        port {
> +          tn_ag_out_funnel_in1: endpoint {
> +            remote-endpoint = <&funnel_in1_in_tn_ag>;
> +          };
> +        };
> +      };
> +    };
> +...
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

