Return-Path: <linux-arm-msm+bounces-88018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B9FD01ABC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 09:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AD0D3055016
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 08:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F6237E2F0;
	Thu,  8 Jan 2026 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4UW5WSx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872342D4B40;
	Thu,  8 Jan 2026 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860273; cv=none; b=cC3p82xb6Hv6Ubr+c+DAjQYyGCKDgJ+VoUnzkdCSavcrAZbQpLamZiHxCUwRdNe6fYuExqJVq5W14/H0LelTR2x+kSs+3zym+4btUXQLDiQzHY9zlQed/avvIxdp0A1QbH0vmjsTGeZveWEY5dyS9VumdgefS+xF/toJRI//B3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860273; c=relaxed/simple;
	bh=1/gBImOJBnxvpdIanR4Ug777313epe/xx8uTuJUSptE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BR7wNS3cf3f8o+8v86EMnfpRuuELweItaGffshat/aCV0WRRJ3aKtIbGr9Afarq15M9PvJ8hpb785yf368rkT9qBApuYUNr/aIlwf8SpzZrQV+CTR/fDkecbRhmhPz6iLEImE33/WvSCx5YdI8l5pLEKcQPyxytkJpj9nx0vmwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4UW5WSx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944C7C16AAE;
	Thu,  8 Jan 2026 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767860272;
	bh=1/gBImOJBnxvpdIanR4Ug777313epe/xx8uTuJUSptE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4UW5WSx4T1eAxC7ka226/gGeMfrYhBD67vvxglu/vckB5Nn4A5xmN/jzZgazyYsd
	 /1bcLL+Ghbj8YJZ4jEcQIIrqcdL8TMLTVcEFCBP+OQnfT5O9YCAaniC/FWI5FN4ibf
	 LUXHBqpnMbuH1Yxoo9XejgOoJNJnyAeSHwJ7bpActjkiwj6wfDdhL5CqYH/8o5oqag
	 aV43dkpJMbUZyYABqtIuZucGadeqEBlkuTtRPd5uirs8BCK51W5bi1M3FIV2VC/gc3
	 zGZ1jvzLTGAT5cxOiO4FYYGeq/JED+jbWpnGySYhnNFvN45SJqOSzgmveQCNw6jNUT
	 wGv2hCdUeZF/g==
Date: Thu, 8 Jan 2026 09:17:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: qcom: document the
 Kaanapali GPU Clock Controller
Message-ID: <20260108-eminent-rich-mink-6acaf7@quoll>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-7-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-7-8e10adc236a8@oss.qualcomm.com>

On Wed, Jan 07, 2026 at 03:13:10PM +0530, Taniya Das wrote:
> Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
> Power domains (GDSC), but the requirement from the SW driver is to use

Requirement of what? or of whom? DXCTL requires to use GDSC?

In any case your driver requirements should not really shape new
bindings. I already said this last time.

> the GDSC power domain from the clock controller to recover the GPU
> firmware in case of any failure/hangs. The rest of the resources of the
> clock controller are being used by the firmware of GPU. This module
> exposes the GDSC power domains which helps the recovery of Graphics
> subsystem.
> 
> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
> power domain Controller for Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>  include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>  .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 13 +++++
>  4 files changed, 125 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5490a975f3db7d253a17cc13a67f6c44e0d47ef3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics power domain Controller on Kaanapali
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
> +  Power domains (GDSC). This module provides the power domains control
> +  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
> +
> +  See also:
> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kaanapali-gxclkctl
> +
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GMXC power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false

additionalProperties instead.

Best regards,
Krzysztof


