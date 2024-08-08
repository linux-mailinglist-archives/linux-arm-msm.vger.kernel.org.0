Return-Path: <linux-arm-msm+bounces-28167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A4594BFBD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 16:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271591F21E8D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A21C18E03C;
	Thu,  8 Aug 2024 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll/vCCmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FC1EA90;
	Thu,  8 Aug 2024 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723127899; cv=none; b=haAMG5QrUg8ogH4QOGCZAV9fpPJqVI2bXndzoQo4T7SxP/ILJiBl7zJqzPt8qu7HUxSWEPBJvZpVBlzdkn6qFOF6aVHVoOx/th0IgVelHK9dVHDeMFiH1haxCKONmpb2PjBZVKCFWu2ricxKg5Ff9xdsSE8k+KCHMXXZci9GEOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723127899; c=relaxed/simple;
	bh=hSjeiqnr5aAwzBd9Sn/yugh4BM6IEWpBe7Pwe72BkFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlG2p2JoCYQfhht+wovRdq1fq99l/W2yD3lkrfReIxZJXitfHG2sc6zCtmq0IxVA9v0Zi3fW7VTxvgTjtZKji24GQn0tRe9zJlmwAq4act2jyj61Z22dB8cGB6TVfU7wZzh2F09KgpgeQLj8IAaMITokMfoWZK0seM49n3/mqBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll/vCCmj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA0CC32782;
	Thu,  8 Aug 2024 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723127898;
	bh=hSjeiqnr5aAwzBd9Sn/yugh4BM6IEWpBe7Pwe72BkFo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ll/vCCmjpYcq2iE4+J9AQl5/DG+FrNlA6rrsxAIk9EzGG/b272cMSGh56Q48mRu7t
	 QSVQA6Qt6D6JXXzBqtRXg0uQU6suADxza38PIavs9PVeH2wuKX94sIhpIl1hsbwr6p
	 Io51hkuPaLaamLaCo4pwiwVivzfPG1y4P+UZEgHdlSbC3P1I4SylnkyG0rr29J++y+
	 nDZgTOMHzYF3+l+0EnlnfpN/OpeirXggTIHQTq76qQpvsITXzXzQvuQizhpPQm9DRO
	 3M2XAmehhEY2EoLwasjF5GhtWmyydYZSiOY2acDcysVAfZu2B4HLC4j+l4fCy1up2o
	 QsuBzgw9lPD/Q==
Message-ID: <81524fee-c32c-405b-b63b-d048dde6ae33@kernel.org>
Date: Thu, 8 Aug 2024 16:38:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add common PLL clock
 controller for IPQ SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
 quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com,
 quic_leiwei@quicinc.com
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
 <20240808-qcom_ipq_cmnpll-v1-1-b0631dcbf785@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240808-qcom_ipq_cmnpll-v1-1-b0631dcbf785@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2024 16:03, Luo Jie wrote:
> The common PLL controller provides clocks to networking hardware
> blocks on Qualcomm IPQ SoC. It receives input clock from the on-chip
> Wi-Fi, and produces output clocks at fixed rates. These output rates
> are predetermined, and are unrelated to the input clock rate. The
> output clocks are supplied to the Ethernet hardware such as PPE
> (packet process engine) and the externally connected switch or PHY
> device.
> 
> The common PLL driver is initially being supported for IPQ9574 SoC.

Drop references to driver and explain the hardware.

Above with the usage of "common" looks like this is all for some common
driver, not for particular hardware.

> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/clock/qcom,ipq-cmn-pll.yaml           | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml
> new file mode 100644
> index 000000000000..c45b3a201751
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml

Use compatible as filename.

> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,ipq-cmn-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Common PLL Clock Controller on IPQ SoC
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Luo Jie <quic_luoj@quicinc.com>
> +
> +description:
> +  The common PLL clock controller expects a reference input clock.
> +  This reference clock is from the on-board Wi-Fi. The CMN PLL
> +  supplies a number of fixed rate output clocks to the Ethernet
> +  devices including PPE (packet process engine) and the connected
> +  switch or PHY device.
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
> +      - description: The reference clock, the supported clock rates include
> +          25000000, 31250000, 40000000, 48000000, 50000000 and 96000000 HZ.
> +      - description: The AHB clock
> +      - description: The SYS clock
> +    description:
> +      The reference clock is the source clock of CMN PLL, which is from the
> +      Wi-Fi. The AHB and SYS clocks must be enabled to access common PLL
> +      clock registers.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: ahb
> +      - const: sys
> +
> +  clock-output-names:
> +    items:
> +      - const: ppe-353mhz
> +      - const: eth0-50mhz
> +      - const: eth1-50mhz
> +      - const: eth2-50mhz
> +      - const: eth-25mhz

Drop entire property. If the names are fixed, what's the point of having
it in DTS? There is no.

Best regards,
Krzysztof


