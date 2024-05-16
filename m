Return-Path: <linux-arm-msm+bounces-19938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BAA8C77D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 15:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76B551F22B4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 13:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4329146A72;
	Thu, 16 May 2024 13:41:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8725928680;
	Thu, 16 May 2024 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715866875; cv=none; b=oJoxDnswTOQb6O/EtNOOxH3KDgRPrgeyIrRuNYthf3Tww3DPt2MfTe2N2PehvZZ+gAKQdZZmaHp179vhE7ZY748I3WbA3lq05n1KO9l2GCb2PZStNtz7jZUOoZTCszwsVKHzICmUDBx1sgpHndOyU6BWouWOBISk371VD6EaaXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715866875; c=relaxed/simple;
	bh=VPm12psuaZndL/wP6JfnMY2aRs+EzAwdiDQqEIcw2lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONFSreWFSTkUYmfqtIY4TXV2Yys+X0R8CYzZb9q1iyncIDv6HNj3zngxYYXk4WQQ5WU1KbROa4LTa9RWHgMDnAGoEUAKGB3KSFwXSF+vXHQtaKq+URNseiIBAuWT2VCgBFkdkhzQuqAR5URz4BH9ZLZ4t011CMMARyS1J/6HqEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2629EDA7;
	Thu, 16 May 2024 06:41:37 -0700 (PDT)
Received: from [10.91.2.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F2893F7A6;
	Thu, 16 May 2024 06:41:10 -0700 (PDT)
Message-ID: <8f1814fe-7ae5-4c32-8645-0df9e607b522@arm.com>
Date: Thu, 16 May 2024 15:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: Add trace-id for coresight dummy
 source
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, songchai <quic_songchai@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20240516025644.4383-1-quic_jinlmao@quicinc.com>
 <20240516025644.4383-2-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240516025644.4383-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/05/2024 04:56, Mao Jinlong wrote:
> Add trace-id for static id support to coresight dummy source.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> index 6745b4cc8f1c..9adf34ea450e 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> @@ -38,6 +38,12 @@ properties:
>      enum:
>        - arm,coresight-dummy-source
>  
> +  trace-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      If dummy source needs static id support, use this to set trace id.
> +      The range is 1 to 127.
> +

The max is CORESIGHT_TRACE_ID_RES_TOP, so this would be 1 to 111 (inclusive)

>    out-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  

