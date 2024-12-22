Return-Path: <linux-arm-msm+bounces-43072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE09FA4A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 09:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DF231663AB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 08:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB461632FE;
	Sun, 22 Dec 2024 08:19:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E29FB660;
	Sun, 22 Dec 2024 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734855560; cv=none; b=lZJqDgE3TAraLe10+j15d8mdQCRrP7qQuhS/Tb5wAoSSexnROg0Zc62rf5/DGnHbqIXWekgszfbsEMb593ksfP3VYPih5B8Dv7TP6N7bvpB2YsRu3wPtCcsy3xelWbpCgBasNLAjwgWs7KBAdiVSQSbLLU920k0u0IDvosNRulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734855560; c=relaxed/simple;
	bh=7dedxWZlfHcvdXPQyn+nkvHPRxkM7FABOCTnMOafI04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuH5D598fEPmBHqfDkE+9R2dz/FLMODckm0VCcr8+hKHRAOSwMy8OxcKaqhd1XJe6FtfB+90lAmptiKlwWd91nPWZ7bnD+sMJwKuLRS6kRLJgmmGDPvU/jxnfUgz+Bk8iUZ1HbT+jf99wOZCPbUj0vvS0VWIZ2OHJROgee5A19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322A5C4CECD;
	Sun, 22 Dec 2024 08:19:17 +0000 (UTC)
Date: Sun, 22 Dec 2024 09:19:15 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
Message-ID: <yngf4ngbnkcmohjfkd6muynfr72v5yhynmyqfjmxh6qbxidmo7@bsvimplmpwsl>
References: <20241220-qcom_ipq_cmnpll-v7-0-438a1b5cb98e@quicinc.com>
 <20241220-qcom_ipq_cmnpll-v7-1-438a1b5cb98e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-qcom_ipq_cmnpll-v7-1-438a1b5cb98e@quicinc.com>

On Fri, Dec 20, 2024 at 09:22:42PM +0800, Luo Jie wrote:
> The CMN PLL controller provides clocks to networking hardware blocks
> and to GCC on Qualcomm IPQ9574 SoC. It receives input clock from the
> on-chip Wi-Fi, and produces output clocks at fixed rates. These output
> rates are predetermined, and are unrelated to the input clock rate.
> The primary purpose of CMN PLL is to supply clocks to the networking
> hardware such as PPE (packet process engine), PCS and the externally
> connected switch or PHY device. The CMN PLL block also outputs fixed
> rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ as sleep
> clock supplied to GCC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 85 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 22 ++++++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> new file mode 100644
> index 000000000000..db8a3ee56067
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CMN PLL Clock Controller on IPQ SoC
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Luo Jie <quic_luoj@quicinc.com>
> +
> +description:
> +  The CMN (or common) PLL clock controller expects a reference
> +  input clock. This reference clock is from the on-board Wi-Fi.
> +  The CMN PLL supplies a number of fixed rate output clocks to
> +  the devices providing networking functions and to GCC. These
> +  networking hardware include PPE (packet process engine), PCS
> +  and the externally connected switch or PHY devices. The CMN
> +  PLL block also outputs fixed rate clocks to GCC. The PLL's
> +  primary function is to enable fixed rate output clocks for
> +  networking hardware functions used with the IPQ SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq9574-cmn-pll
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The reference clock. The supported clock rates include
> +          25000000, 31250000, 40000000, 48000000, 50000000 and 96000000 HZ.
> +      - description: The AHB clock
> +      - description: The SYS clock
> +    description:
> +      The reference clock is the source clock of CMN PLL, which is from the
> +      Wi-Fi. The AHB and SYS clocks must be enabled to access CMN PLL
> +      clock registers.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: ahb
> +      - const: sys
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  assigned-clocks:

Drop

> +    maxItems: 1
> +
> +  assigned-clock-rates-u64:
> +    maxItems: 1

These wasn't here when you received review. Adding new properties always
invalidates review.

No, drop them.


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +  - assigned-clocks

Drop

> +  - assigned-clock-rates-u64

Drop... or explain

Drop all review tags after making significant changes like that.

Best regards,
Krzysztof


