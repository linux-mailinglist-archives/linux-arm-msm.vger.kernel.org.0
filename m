Return-Path: <linux-arm-msm+bounces-42319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EDA9F2D0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 10:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07BEB7A132F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C8B200116;
	Mon, 16 Dec 2024 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlYjIsnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148F1347B4;
	Mon, 16 Dec 2024 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734341599; cv=none; b=HV4ErCtWEAaxvNjlMAG5ahrMJI2xTwIqGOwRNW6wDBFbpCb2DcX0tbdWDjQDqFLlvD8Ay6eMmQjzdbwstAV9k3mqkxI4FcsHBOX+Q0veu3TSYgNsnFMt90VqNuOJRjJB1XpJbLfP76oldcsfOKdVA1Beu2dxDutsPkQV5PK7Ves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734341599; c=relaxed/simple;
	bh=yndVn34bCyl1mk7624b3uy12Ns2e5Qunxm39WYYBdts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FER11oUj5elr3pR9BMsTPozcF85NAL6mWhrZRrOnsf/BQ0nLfS6pG1FGsq+hA8j3F08mqUQmQDpOJ+noTbaB3CGT6SSWDNrFTUZtxuiI/WduGNZphA1tyJVWf1MBWc+Bpme0r3Y9GXW6AVwlb5zfnxQrvC1jdwxtOdEAB54y7EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlYjIsnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CD2C4CED0;
	Mon, 16 Dec 2024 09:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734341597;
	bh=yndVn34bCyl1mk7624b3uy12Ns2e5Qunxm39WYYBdts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlYjIsnBEL4QGqc+5XEvmXKjI9BYHk2jAGISl3dcIy6WB3L/Go8Hde9JbdNRaABg/
	 5CuPLu9J43l7Q9SbWGUGlCBcwl2+yLzInKyrobgT2mdvAWJmAiUAjpjIsthSUFLBev
	 Jxvi+VhWZJ8RCmKAAzJtif9WnKBTUy+lfWKpD6MG6vHOhfQRx+cdbD3LdRMjd5k7GC
	 kJ9mEX5eqKmWt9UsfeT1bsOAL0P6OnNjjag4be6LE1mwediA8y3MimeP00gqZoEqEz
	 H83HllpQgXB32Wgxtpdk88dFA4fLyC46ezfaXfdWh1tSHzc0opwF2lzSpYLFZhCkO8
	 ozOKCR0Rb89tQ==
Date: Mon, 16 Dec 2024 10:33:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/4] dt-bindings: display/msm: gpu: Document
 A612 GPU
Message-ID: <zzqp3ejgdtaala6ksdwnlmfv7c32o43eghqbmulp2f2p4pqlvs@5ihzuzav3tah>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-1-47f3b312b178@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-qcs615-gpu-dt-v2-1-47f3b312b178@quicinc.com>

On Fri, Dec 13, 2024 at 05:01:03PM +0530, Akhil P Oommen wrote:
> A612 GPU requires an additional smmu_vote clock. Update the bindings to
> reflect this.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 6ddc72fd85b04537ea270754a897b4e7eb269641..1276331cb262e64cc94d6a9973463b3c1ff8b7a8 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -217,6 +217,42 @@ allOf:
>        required:
>          - clocks
>          - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,adreno-612.0
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
> +        clock-names:
> +          items:
> +            - const: core
> +              description: GPU Core clock
> +            - const: mem_iface
> +              description: GPU Memory Interface clock
> +            - const: alt_mem_iface
> +              description: GPU Alternative Memory Interface clock
> +            - const: gmu
> +              description: CX GMU clock
> +            - const: xo
> +              description: GPUCC clocksource clock
> +

Missing constraints for reg. xxx and xxx-names cannot be different.

Best regards,
Krzysztof


