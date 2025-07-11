Return-Path: <linux-arm-msm+bounces-64551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A7B01A40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 870B2761668
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E983283CB0;
	Fri, 11 Jul 2025 11:03:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64A327EC99;
	Fri, 11 Jul 2025 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752231827; cv=none; b=St6zhfbyIKWrM7pgFEmEg3EecPu+etaQXaIdXlfAj0couQW2YNQ0TGMcxj1AqTujqwSnLT2rxu9hdQNQzLXBXgbBsJ9UDSW2l3gqdMMwGrtY9k2LyXKfYU6ZMxvWQfbdwhqWQ52P5v7pEtAlzpaPI8Q8OA3RSOGkr92ohx8zV4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752231827; c=relaxed/simple;
	bh=Xifiq/9Gg8y9DEvTT6Sc2V4g3MYCUrrYoIsrJyJvGfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCuO1/0f2uJUblJJYuL8b9opjHsfMufht9YLEC3VKA6rA/grVlqqksun29GeTlAXan+w+gtoL6ikZqlJPwJR8oBUTiZjkLhDT1Hh3kgJXapCGkECaIQz6jomrkggSVY0D0X+bPIioCA8UtLu62H+5kqyFTTMZOMULw5Oe8CEwHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 585BE16F2;
	Fri, 11 Jul 2025 04:03:33 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60E813F6A8;
	Fri, 11 Jul 2025 04:03:42 -0700 (PDT)
Message-ID: <3ef8295d-2dd3-404c-9776-5792a7567f56@arm.com>
Date: Fri, 11 Jul 2025 12:03:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 24/04/2025 12:58, Mao Jinlong wrote:
> Add new coresight-qmi.yaml file describing the bindings required
> to define qmi node in the device trees.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

Why does this have to do anything with coresight ? Surely coresight may
be using the QMI along with other subsystems. I don't see why this is
named as "coresight-qmi"

In my opinion, the QMI driver should be outside coresight driver
framework and whatever coresight component driver relies on it
could add the dependency.

Suzuki


> ---
>   .../bindings/arm/qcom,coresight-qmi.yaml      | 65 +++++++++++++++++++
>   1 file changed, 65 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> new file mode 100644
> index 000000000000..601c865fe4d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-qmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm coresight QMI(Qualcomm Messaging Interface) component
> +
> +description: |
> +  Qualcomm Messaging Interface (QMI) is an interface that clients can
> +  use to send, and receive, messages from a remote entity. The coresight
> +  QMI component is to configure QMI instance ids and service ids for different
> +  remote subsystem connections. Coresight QMI driver uses the ids to init
> +  the qmi connections. Other coresight drivers call the send qmi request
> +  function when connection is established.
> +
> +maintainers:
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,coresight-qmi
> +
> +patternProperties:
> +  '^conns(-[0-9]+)?$':
> +    type: object
> +    description:
> +      QMI instance id and service id for different remote subsystem connections.
> +
> +    properties:
> +      qmi-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Instance id for the remote subsystem connection.
> +
> +      service-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Service id for the remote subsystem connection.
> +
> +    additionalProperties: false
> +
> +    required:
> +      - qmi-id
> +      - service-id
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  # Minimum coresight qmi definition.
> +  - |
> +    coresight-qmi {
> +      compatible = "qcom,coresight-qmi";
> +
> +      conns-0 {
> +          qmi-id = <0xd>;
> +          service-id = <0x33>;
> +      };
> +    };
> +
> +...


