Return-Path: <linux-arm-msm+bounces-25369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9F9286E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 12:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9596281CC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 10:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E8B1474CE;
	Fri,  5 Jul 2024 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t76SkQ4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694522313;
	Fri,  5 Jul 2024 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720175905; cv=none; b=acVcuNAJ5DNfdMQeUpQHnwl50F9E7A06vP8UD6P8ceTz1egaCElPE41/enIoqDmpopdu1T+FBuk0ZB3JsEHiZr1S4xnDlfBO7D2Rntnv3lu1G39GSMUgZ47Z6cKsVv/nLZ7IDjSzYrFFQY7L4elWBXmfrJ+3ydOXGduzwpdxWl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720175905; c=relaxed/simple;
	bh=LRdwaRpuZCAs/Vy1Tl3fRK1XDLh9y5w9qG9C35tz6Do=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=WKWNQKUKzRmeDykD2vcexaOnxjky7mQhlsA55BAn2b9X37uOAqNgb2ztzl/arPGwzIvgtdS37QQ2eOH3ontoppCmK4afgqDMCnRc/BWyFuzHm6uHmzBYh4v5BkzlVIC/7TdZ54u8EmYqZgkNBZdrsqTO41RG3dPkhkRYcna6BY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t76SkQ4z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F74C116B1;
	Fri,  5 Jul 2024 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720175904;
	bh=LRdwaRpuZCAs/Vy1Tl3fRK1XDLh9y5w9qG9C35tz6Do=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=t76SkQ4zGR3huLD0htaDY0LamPF0cMG4KB20gT2CzsQc8r2/0yNY6dCMr0y5NFp5G
	 QyPuVgkl+VAyIYx5sLDLjgXXwxxDIxfJKrVKpAKJihdXC8sF1PZqYwvuo89e6doWy7
	 yvU6YSdN4NCnEKAnV84uZs3HgqQSyV/SbqM7tYiCO+RI6A9ffsefOgK2gY+cVeWnjY
	 r0WPqTIVttUMlhW5ORdtH5i/+yBvDp3WOwAw2pUdINzijvAUwj9O5Dxw35FbnQipgf
	 pogEunTspWCz/5ppZeDdicJvJYdIK9O6qZRssl6nCoWi/hPHFwX3+8QinMNUqo9TV4
	 WVpjSI+G6UlxQ==
Date: Fri, 05 Jul 2024 04:38:23 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tao Zhang <quic_taozha@quicinc.com>
Cc: Jie Gan <quic_jiegan@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
 Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 James Clark <james.clark@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Tingwei Zhang <quic_tingweiz@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, Song Chai <quic_songchai@quicinc.com>, 
 Leo Yan <leo.yan@linaro.org>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
 devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
In-Reply-To: <20240705085152.9063-2-quic_taozha@quicinc.com>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
 <20240705085152.9063-2-quic_taozha@quicinc.com>
Message-Id: <172017590249.2933726.1790899873101654561.robh@kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering


On Fri, 05 Jul 2024 16:51:50 +0800, Tao Zhang wrote:
> Add a new property "filter_src" to label the source corresponding
> to the output connection for a static replicator. By combining
> a funnel and a static replicator in devicetree, a new device that
> supports multi-port input and multi-port output is implemented.
> In order to match the output port with the input port and
> successfully build the trace path, add this new property to
> indicate the data source corresponding to this output port.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>  .../arm/arm,coresight-static-replicator.yaml   | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: ^port@[01]$: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: endpoint: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240705085152.9063-2-quic_taozha@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


