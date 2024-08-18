Return-Path: <linux-arm-msm+bounces-28886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C743955CF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 16:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66DB31C21290
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 14:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC617E792;
	Sun, 18 Aug 2024 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T08IAoyL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D423AD;
	Sun, 18 Aug 2024 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723991316; cv=none; b=bZNsI5BLZLuN2Kjo1aOY2qJviPh147ud8eMmSi2LynnFGBHD998fiSx8O+rx2Tsdp4ey5QGb1CAWZdsnn0fDgZmNmc1Bzhzdx58ylFYr15sDvjvB9pLwCw94OUh1fUxh+RhbNRQtTCnJ9b0M6OQGILHUoucoCawt+T7hYHB5QuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723991316; c=relaxed/simple;
	bh=ERjFyGYRu9IS6cNV44ysAr6kZGddvGxSQYBB0E8yVr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPRa7K8g4zp7nHluC7LeALZaknYg1DAnjVvsqvvHKTpqGeiczBE11Dr8x2a/3gmVeFnHDSTjTKOQo4B+lhK8TVVmcXgMjzSnuq3Mvo6lj+HYlSiFedpyEceNGHMi9pr4SAFZAdtrdTWuVhWcg5OUehFm5Gp42MUM+WbtpfeOjjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T08IAoyL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CDCC32786;
	Sun, 18 Aug 2024 14:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723991315;
	bh=ERjFyGYRu9IS6cNV44ysAr6kZGddvGxSQYBB0E8yVr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T08IAoyLfg/rmGSYA1kGz+EsoQRqG/nYkV++COKiYEPMrWbj7jWV8iGjmRtzet+wk
	 OYvYRJt8E5xq1HA7+i4Cjqn7Ie5kxf3JMuxdFoxgfvukSfYjJaNKBw5dW6CZO91BIC
	 /7PzxAITui5Wia1vxUhXpi1+tJ4Bx4XqKRy53u5cQdp9l7lFqCPmesoERQkIGTd8ex
	 vfKVRLZBqdkSfZ806vc/B7P6+LZAI+pp1tB2bErCPaDmyU/+kfR2Iy57r75vv6Yx5R
	 2fDv5ynVChp14PEyW70AA128ygQiP27287NINr+l461p1ZuBAvJkg3ACKSiWds+A77
	 Q6ICmTjLWqHdA==
Date: Sun, 18 Aug 2024 08:28:34 -0600
From: Rob Herring <robh@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Song Chai <quic_songchai@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
Message-ID: <20240818142834.GA27754-robh@kernel.org>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812024141.2867655-4-quic_jiegan@quicinc.com>

On Mon, Aug 12, 2024 at 10:41:39AM +0800, Jie Gan wrote:
> Add binding file to specify how to define a Coresight TMC
> Control Unit device in device tree.
> 
> It is responsible for controlling the data filter function
> based on the source device's Trace ID for TMC ETR device.
> The trace data with that Trace id can get into ETR's buffer
> while other trace data gets ignored.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-ctcu.yaml     | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> new file mode 100644
> index 000000000000..7a9580007942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CoreSight TMC Control Unit
> +
> +maintainers:
> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +  - Jie Gan <quic_jiegan@quicinc.com>
> +
> +description:
> +  The Coresight TMC Control unit controls various Coresight behaviors.
> +  It works as a helper device when connected to TMC ETR device.
> +  It is responsible for controlling the data filter function based on
> +  the source device's Trace ID for TMC ETR device. The trace data with
> +  that Trace id can get into ETR's buffer while other trace data gets
> +  ignored.

Nowhere is TMC defined.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sa8775p-ctcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  in-ports:

Use 'ports' unless you have both in and out ports.

> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port(@[0-7])?$':
> +        description: Input connections from CoreSight Trace bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - in-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ctcu@1001000 {
> +        compatible = "qcom,sa8775p-ctcu";
> +        reg = <0x1001000 0x1000>;
> +
> +        clocks = <&aoss_qmp>;
> +        clock-names = "apb";
> +
> +        in-ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                ctcu_in_port0: endpoint {
> +                    remote-endpoint = <&etr0_out_port>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                ctcu_in_port1: endpoint {
> +                    remote-endpoint = <&etr1_out_port>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 


