Return-Path: <linux-arm-msm+bounces-83413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D882CC88FA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAC9F4E2E6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5912DECA3;
	Wed, 26 Nov 2025 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8s8QaHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845DCA4E;
	Wed, 26 Nov 2025 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149738; cv=none; b=g10WGIS7JW7xSRFzMZBnTBLnsabTojpHbvtjjk/bM6n0CqGxN/D01DmqExUkO/CWCdcPHd/F7sXje4+t33hK8I2f+pOF3fDNdv063LNr3OY0amNERlG5mCUm0KiXe3Kn5fLbjf1wqqYVQM+8ZzY7GUOlpLUBXSHqmMLtGVjMfJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149738; c=relaxed/simple;
	bh=pAkJlp5goDwDdu02OIOe7+6vJcgsUEP5Zd6BF3BYipA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEwY4QaeFj8an3Kjt7HwOByK2MhcWX5apMAPEoA1CHOF+LkehXuYXv0CahJOTKlouCRf+GAKQ4l5dvoVE1kKWaxNWnlbuflFKNn3+lvc/4vC31PN+j7odGZDVahgyUWecjCEDGihWByfqgBFFyFwfyNY5NLreWC74+3szrhD0JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8s8QaHx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85170C113D0;
	Wed, 26 Nov 2025 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764149738;
	bh=pAkJlp5goDwDdu02OIOe7+6vJcgsUEP5Zd6BF3BYipA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8s8QaHxemNFYILPPeLU6SMRyEeHZhUyLFUoq3qhcvUAMtM6tJMcR7dvVyNaSQVcS
	 ICCvX368nxhkVX7ehukSnzbyxZ328NMmyeKAvUYvdlecUveRY1k3g/QKkA9B05+YCP
	 kYNsjAISn2e4UWoFYKAqwaMA12P+whbx3VPNRwWIBNPrFuLo0j04aYHY79AjgeW0KC
	 8yMEobYPEEGTH6qutCTXXEYAH+bSKurj69vyKxhrf7OUVzE6EAruLXH9ePKLmxLmZ6
	 7wq0sIc1stVV9C4BN9ZrvV6u68HoE7QkybuL9Mk6sGlfTpoxobIZO237Vv2mVogjmG
	 zkUWlBVdmx6tw==
Date: Wed, 26 Nov 2025 10:35:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the
 Kaanapali GPU Clock Controller
Message-ID: <20251126-elated-stoic-scorpion-25b630@kuoka>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>

On Tue, Nov 25, 2025 at 11:15:16PM +0530, Taniya Das wrote:
> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
> power domain Controller.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>  include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>  .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
>  4 files changed, 124 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..31398aec839d88007c9f1de7e1a248beae826640
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

"Power Domain"

> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm graphics power domain control module provides the power
> +  domains on Qualcomm SoCs. This module exposes the GDSC power domain
> +  which helps the recovery of Graphics subsystem.
> +
> +  See also::

Just one ':'

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

Power domain controllers do not belong to clocks, so this is:
1. Misplaced - wrong folder
2. Probably wrongly named. gxclkctl sounds like clock controller, but
this is domain controller?

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
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@3d68024 {
> +            compatible = "qcom,kaanapali-gxclkctl";
> +            reg = <0 0x3d68024 0x0 0x8>;

Keep consistent hex, so first 0 -> 0x0.

But the problem is that you defined a device for two registers,
basically one domain. I have doubts now whether this is complete and
real device.

> +            power-domains = <&rpmhpd RPMHPD_GFX>,
> +                            <&rpmhpd RPMHPD_GMXC>,
> +                            <&gpucc 0>;
> +            #power-domain-cells = <1>;

And cells 1 makes no sense in such case.

Best regards,
Krzysztof


