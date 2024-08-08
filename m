Return-Path: <linux-arm-msm+bounces-28142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEC894BAD9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 12:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54B1F1F22AED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 10:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4890E18A6D2;
	Thu,  8 Aug 2024 10:25:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D1018A6C8;
	Thu,  8 Aug 2024 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112720; cv=none; b=hFc9hk4kteDF+lEUf+9yXSfb7ClDq/q7K5qbgLvIYH1zGMmwWLR3aONHrW+ZH3XYKliElfIlqHZxKeKH/bBxTFnvYVmDwWr2rmhn1Hd+jg+66XZkDYUw9iScN4lzoWraE7yoUh88SUlviN6jeYN0YEdSyLILuHL/L3PsEJOGpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112720; c=relaxed/simple;
	bh=HyjKYMIGAL4Z2kGzUdViDxY5IvayIFVXwuk8LcAI4YU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6Kt61kJsdjeYToOJfYmKu8C1ap8NlUk68/Xnnd4QtQ24tCeUsCdM35prO3Z+FW+yG0XDjYiXNX3RcOwN9Qf498yliYBO5O7SSd4wNpksaUcvvEP6Geq3n8dVOgDheV2eP7dcCxpO32uA4b0HjJqlrpqJDwPDAXYG0vYC6gL4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07D61FEC;
	Thu,  8 Aug 2024 03:25:44 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB1F13F766;
	Thu,  8 Aug 2024 03:25:15 -0700 (PDT)
Message-ID: <d72622bb-7dd8-4674-a2db-6c605e388ddb@arm.com>
Date: Thu, 8 Aug 2024 11:25:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add qcom,inst-id for remote etm
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240807071054.12742-1-quic_jinlmao@quicinc.com>
 <20240807071054.12742-2-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240807071054.12742-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2024 08:10, Mao Jinlong wrote:
> qcom,inst-id is the instance id used by qmi API to communicate with
> remote processor.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..a65121505c68 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -20,6 +20,13 @@ properties:
>     compatible:
>       const: qcom,coresight-remote-etm

That is a generic name, without any clue of the QMI transport. Are there 
other ways in which an ETM could be connected ? Given how this QMI 
inst-id is added, I wonder if this is an after thought ? Why was the dt
pushed without a proper driver for it ?


Suzuki


>   
> +  qcom,inst-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This id is used by qmi API to communicate with remote processor for
> +      enabling and disabling remote etm. Each processor has its unique instance
> +      id.
> +
>     out-ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>       additionalProperties: false
> @@ -31,6 +38,7 @@ properties:
>   
>   required:
>     - compatible
> +  - qcom,inst-id
>     - out-ports
>   
>   additionalProperties: false
> @@ -40,6 +48,8 @@ examples:
>       etm {
>           compatible = "qcom,coresight-remote-etm";
>   
> +        qcom,inst-id = <5>;
> +
>           out-ports {
>               port {
>                   modem_etm0_out_funnel_modem: endpoint {


