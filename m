Return-Path: <linux-arm-msm+bounces-80933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E8C4541A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 022704E288C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E05A255F52;
	Mon, 10 Nov 2025 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="saykSZDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23574218AB0;
	Mon, 10 Nov 2025 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761094; cv=none; b=DDFDbQw98RUxW7UXaJRwgefvInqqqQxzUQGFUWv9BHNc01QCV/Phwb3XDvwBGEWhKujIUXcQYYdcvCdvoDmF6DNS++0F0U0u+76lqKloXIZ1tb8vCuA6cDIP8IXcX5QeRDPlQ6f+ajZrXfNgASHCR+74NW+RMZgG5d+LMWGGucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761094; c=relaxed/simple;
	bh=bApvZHKXsJmb8jKSRYJlnAZDkVWRrU6RYJOz67z8jh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6z7jyNHu6QWHbTpPNY74lFW98NR3eKnjs3iT514J2u2M90Di/5UN7vVe9OOfdM784F7UI3nQiy6KlKRaamcafj0E/vdbazcrpMcDDTpBhU77OJRxoPGN6p2UhXR0Wwwj9pqpyr16oZNn4LxEzrtga3tEN6VDdfTwBqqUovceCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=saykSZDd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F6AC19422;
	Mon, 10 Nov 2025 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762761093;
	bh=bApvZHKXsJmb8jKSRYJlnAZDkVWRrU6RYJOz67z8jh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=saykSZDddicJyqUayksM7BoUv/MK95zjeR+7tr7lepP5DNlF+8M7k76jyVEGNuuIF
	 PH+4nK87M6C9hxH0MZsZml5b6PAf0bkfVXchXFWsYbkKU3o4shP/2dvCQM815j+KQ7
	 4cHzbWYiT2iNjNkvi1tfSS9VXtFk2Noc9euXitXDf/SmcidC6JyOSwHwXjI4qxxQyz
	 gvYJvNYgPbIigPqH7hsHDNpBDe9B/ypU5QZmBhrRnU3Lk90DGcXXlNSHmEaCv7WrDb
	 TP3KusXOBuLV40OUaofnGIys5cnu0v9QugmEnJoXNw5PLJyESMoNUV6Qs+sV1gkVS/
	 AaD0zOawyRd1A==
Date: Mon, 10 Nov 2025 08:51:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
Message-ID: <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>

On Fri, Nov 07, 2025 at 02:20:08AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
> support. Compared to GMU, it doesn't manage GPU clock, voltage
> scaling, bw voting or any other functionalities. All it does is detect
> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
> it doesn't require iommu.
> 
> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
> schema.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 132 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
> new file mode 100644
> index 000000000000..7621556477d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml

Filename matching compatible, so qcom,adreno-rgmu.yaml


> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RGMU attached to certain Adreno GPUs
> +
> +maintainers:
> +  - Rob Clark <robin.clark@oss.qualcomm.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
> +  belong to Adreno A6xx family. It is a small state machine that helps to
> +  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
> +  power.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,adreno-rgmu-612.0
> +      - const: qcom,adreno-rgmu
> +
> +  reg:
> +    items:
> +      - description: Core RGMU registers
> +
> +  reg-names:
> +    items:
> +      - const: gmu

Drop reg-names, useless for one entry with same name as the block name.

> +
> +  clocks:
> +    items:
> +      - description: GMU clock
> +      - description: GPU CX clock
> +      - description: GPU AXI clock
> +      - description: GPU MEMNOC clock
> +      - description: GPU SMMU vote clock
> +
> +  clock-names:
> +    items:
> +      - const: gmu
> +      - const: cxo
> +      - const: axi
> +      - const: memnoc
> +      - const: smmu_vote
> +
> +  power-domains:
> +    items:
> +      - description: CX GDSC power domain
> +      - description: GX GDSC power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: gx
> +
> +  interrupts:
> +    items:
> +      - description: GMU OOB interrupt
> +      - description: GMU interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: oob
> +      - const: gmu
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +required:

compatible

> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - interrupts
> +  - interrupt-names

Keep the same order as in properties.

> +  - operating-points-v2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    rgmu: rgmu@506a000 {

Drop label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof


