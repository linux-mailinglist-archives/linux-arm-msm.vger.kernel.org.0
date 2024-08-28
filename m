Return-Path: <linux-arm-msm+bounces-29793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6793E962BC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AD401C23B6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81A71A4B6C;
	Wed, 28 Aug 2024 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5wR9DUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F51A2C17;
	Wed, 28 Aug 2024 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857927; cv=none; b=JPPixrghu6gH/k2CIkZDkKaHM3GLS2+IDTHaz04hZ/LXfHUuPCjlMmWJPZSAhD03PfVK7qCs/VlMNC+zm1VZg8rcIZnd2OKVnhb15WAj2lzOcBJoV9wOhOSZWhFOPGXpoD9+/FlS2mFwDsoD3Oc92pjHnez/njnE0nRO3zd8PvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857927; c=relaxed/simple;
	bh=9GuXAxjPKxPmRMioM0desVcabOX2V79hzACInoh3ahU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWhzj+IiPtJunr8sEQ5vlxnNzrOv+1qiXkqYhe+72lzuqPGbi2462iEKs9NXkTjG4s8fz0F7RJAc18NIlF5oNMNgW6WjMJVhzhn3tz5wU0mi/ltUq+lS/cWtszLqt/a5Qy/385jPj7g6s+qJA8NrJZW+yk3co+Yo724WRQ7lqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5wR9DUa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC85C4CEC1;
	Wed, 28 Aug 2024 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857927;
	bh=9GuXAxjPKxPmRMioM0desVcabOX2V79hzACInoh3ahU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5wR9DUaujBFT4XeskFDnq/unR1mK7T6eJVLJ6YdAP+4nJKvH1Bn+zE/tDmRvwe07
	 q/ANLYGHJerruJiRG5M1e2eew8M4KozXaXfYkpzvJB9ffU04lJC7uDBHeA7OhT5ybC
	 /dwjw3Ixv+2eEcBdWnkCfyxbmgyH6b5BixfZHYVkOEDpn3+drA5zECDmYH3rcGhoAw
	 a7xOWsHEdyshtT5wRUFmtLz2zx2NqjL3wV7S11mJQbOG3xkIqm45rnAVDuUkpDBTxH
	 +BteBBRDPODTWwLRe+4wEk7ibapa3HeaM69wia0TMC7HzTu30IDQtkcZ8zKeXk0utP
	 nQ28Nxcj3TxiA==
Date: Wed, 28 Aug 2024 10:12:05 -0500
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
Subject: Re: [PATCH v4 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
Message-ID: <20240828151205.GA3830921-robh@kernel.org>
References: <20240828012706.543605-1-quic_jiegan@quicinc.com>
 <20240828012706.543605-4-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828012706.543605-4-quic_jiegan@quicinc.com>

On Wed, Aug 28, 2024 at 09:27:04AM +0800, Jie Gan wrote:
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
>  .../bindings/arm/qcom,coresight-ctcu.yaml     | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> new file mode 100644
> index 000000000000..669aac646451
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -0,0 +1,84 @@
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

You need '>' or '|' if you want to preserve paragraphs.

> +  The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB),
> +  Embedded Trace FIFO(ETF) and Embedded Trace Router(ETR) configurations.
> +  The configuration mode (ETB, ETF, ETR) is discovered at boot time when
> +  the device is probed.
> +
> +  The Coresight TMC Control unit controls various Coresight behaviors.
> +  It works as a helper device when connected to TMC ETR device.
> +  It is responsible for controlling the data filter function based on
> +  the source device's Trace ID for TMC ETR device. The trace data with
> +  that Trace id can get into ETR's buffer while other trace data gets
> +  ignored.
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

Just "ports". "in-ports" is for the case when you have "out-ports".

> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port(@[0-1])?$':
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

