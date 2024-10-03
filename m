Return-Path: <linux-arm-msm+bounces-32996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 303D598EADD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 09:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D649C1F22C8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 07:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA76B126C12;
	Thu,  3 Oct 2024 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQTzBMJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F36053363;
	Thu,  3 Oct 2024 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727942123; cv=none; b=raxqW1OZuCdCePNQXCCCoRuqGWwuDgQjX7oNiTX+MJQKpttkjBVitM8HkTT98SufCrsr3DnYjKg0TqTB/dXa4Hgy/p5iGh+uEmHA5g4IAx676FpbXLrtW6u1cv7BBflX9HLAzjh5o8L8KpmhfZ5gtUH1SRqc7tyVLndIdsYoe7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727942123; c=relaxed/simple;
	bh=B1/LqVGQu6maiREI328zrITlgx61icUEJ8iMvU2ORW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIrxnCZy7dUV1LGg1+6k+heV8SI/+ybCJH3s+1EMbdInCWdyFC+2YDSk+oail3iZ+zfkMrCCyYn3FtbBjiAgpHRV55eYkfcxSiV8aIRb6J+FRJ1xupbS+wR4dAsqWlMWyu7wMKuX7nd5/rQqDMyFmlg8lSOdceUO3qKg28Cos0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQTzBMJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C5CC4CEC7;
	Thu,  3 Oct 2024 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727942123;
	bh=B1/LqVGQu6maiREI328zrITlgx61icUEJ8iMvU2ORW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQTzBMJEFmHIMxuufG4A0OtBKDnZxUNE3ViK9qhFszU7Adv7WfFmVxF3DevpAnWeh
	 TuPqXv1W/X0d9FRExwtozTZhY9c7uKgInzKhYUTCPtPo4TV+b+PBFXOqd641+hW5pW
	 hvSABhXKFxxA2J4ScqVLo790QSdsZ2akf1OGIu3qzGrJR8vO8mgRmvx6xA/7fBGzLe
	 otuLYiF8SDFEo1fpZPKBaQrm9he/BP03JU4qVuvGvTNLVrl+CnCVBzgLZqikAKy+km
	 Am/2H7QBR29DySr+CM8qWC77h/WoXfo7Wo2hJXYyw6/SzNt6ZMmOnTvG7oeOIDb78x
	 S8ZCr9C685eTA==
Date: Thu, 3 Oct 2024 09:55:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kalyan Thota <quic_kalyant@quicinc.com>, Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P
Message-ID: <mbhafnxq4fmndrszkv5bhvqjaik2c3v4sizjner47zapaagnvc@cfvjuvrjtxxx>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-2-d23284f45977@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-2-d23284f45977@quicinc.com>

On Tue, Oct 01, 2024 at 12:11:37PM +0530, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,sa8775p-dpu.yaml     | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fda88bdbd04214e06255e105eae582ff926d72e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SA8775P Display DPU
> +
> +maintainers:
> +  - Mahadevan <quic_mahap@quicinc.com>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8775p-dpu
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display hf AXI
> +      - description: Display AHB
> +      - description: Display lut
> +      - description: Display core
> +      - description: Display vsync
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: iface
> +      - const: lut
> +      - const: core
> +      - const: vsync

This looks the same as sm8650-dpu. Add the compatible there.

Best regards,
Krzysztof


