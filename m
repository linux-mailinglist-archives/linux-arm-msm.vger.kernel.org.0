Return-Path: <linux-arm-msm+bounces-25471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B367F929F6D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 11:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E381C235A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A261977F2D;
	Mon,  8 Jul 2024 09:42:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CB8770E8;
	Mon,  8 Jul 2024 09:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720431722; cv=none; b=sXqneOOaDFtyFMEOgYsZht5IYHUuF3cFOkHX/8W+VMHm1KVmocc/ifeXx70v4xc9qoDIFG6IByCPLWGlNFM+GcCtdR6aETdsS9Tlr5uXuNZR3xFqPR59tcEkLwS4gkM9r+eiNnjm77L9V2QVTTld8eXDQXvIhxv+NMEiC+KmDkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720431722; c=relaxed/simple;
	bh=vtN+WW/X2RVGMOt7ANxJqvnLxl7gNECcMeB+/jYJOFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bONVPAE3m0t7kI2tF4u/KjcXVG/3CZNweytAaOcr5BDV5M1qRXy+GD+RY88+Iexoi9b/owaGQxgl407Tz2gu0AQ59MRA9bESZryUFQe0Q26D9jWcjhFX8695MhQa6LXfdOBVcdHs1MhYb97ZBpue71wMxdWHGfKxsVVrPy+2DzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E97821042;
	Mon,  8 Jul 2024 02:42:23 -0700 (PDT)
Received: from [10.57.74.191] (unknown [10.57.74.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FF0F3F641;
	Mon,  8 Jul 2024 02:41:56 -0700 (PDT)
Message-ID: <208b3861-6898-4506-9152-c9d770ef1555@arm.com>
Date: Mon, 8 Jul 2024 10:41:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: Add binding document for
 Coresight Control Unit device.
To: Jie Gan <quic_jiegan@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Clark <james.clark@arm.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240705090049.1656986-3-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2024 10:00, Jie Gan wrote:
> Add binding document for Coresight Control Unit device.

nit: This is again too generic ? corsight-tmc-control-unit ? After all
thats what it is and not a *generic* coresight control unit ?

> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
>   1 file changed, 87 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> new file mode 100644
> index 000000000000..9bb8ced393a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CoreSight Control Unit
> +
> +maintainers:
> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +  - Jie Gan <quic_jiegan@quicinc.com>
> +
> +description:
> +  The Coresight Control unit controls various Coresight behaviors.
> +  Used to enable/disable ETR’s data filter function based on trace ID.
> +
> +properties:
> +  compatible:
> +    const: qcom,coresight-ccu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  reg-names:
> +    items:
> +      - const: ccu-base
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    unevaluatedProperties:
> +      patternProperties:
> +        '^port(@[0-7])?$':
> +          description: Input connections from CoreSight Trace bus
> +          $ref: /schemas/graph.yaml#/properties/port
> +
> +          properties:
> +            qcom,ccu-atid-offset:

Why do we need this atid offset ? Couldn't this be mapped to the "port"
number ?

e.g, input-port 0 on CCU => Offset x
      input-port 1 on CCU => (Offset x + Size of 1 region)

I believe I mentioned this in the previous posting too ?

Suzuki


