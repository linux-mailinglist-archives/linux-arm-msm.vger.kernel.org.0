Return-Path: <linux-arm-msm+bounces-40464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25EE9E514E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC9B91642B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD81A1D5AC6;
	Thu,  5 Dec 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deoroIp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96F18E028;
	Thu,  5 Dec 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733390937; cv=none; b=QYuOEGbQGPZ6vm3/0VQ0sorxOfGLev4cl9twcyAgEA4bkZ8P3ZVDVPS3IYhTc10BS/QrRs7V45MrgcAnQ6F7fF+W2uU12lRiFQDKJ764w9BpRHa5gqgQVtWH1oxRy72RxmS+njA4W6EFO2qNfVP/lbcrHnTXtkM4BNUQISPRDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733390937; c=relaxed/simple;
	bh=tk3LIQCxFVT/6TzDXNiyaw+HXW8CetB5EIotosZrDiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAhkU/7fnvR7Y+k073m1W52c/FIirdrZw+dxcRK6D5GgF4sSp/rV0NL7AcWsNhtWR/c4GKp9EZzSwhyCpsQgLoE+tPYuCekokBxfb7E3N4cnWgZ5/MSzL32WUAlBUH/eT2LDu0b8qzkwVkUvp71CWMXdDHFyr7ZKb4SfBgbqs08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deoroIp7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF54DC4CED1;
	Thu,  5 Dec 2024 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390937;
	bh=tk3LIQCxFVT/6TzDXNiyaw+HXW8CetB5EIotosZrDiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deoroIp76syUUWCBcHWlSyWz/IXwR8nslt0uhVaH1+Tr/cP7QSLQH8K0oWLd0f2h6
	 Mgvm7ye55eoC6ZGhibIYQINNG1CVd1wY6/qf+Gnnokx8bBP6wxju6UKD2t2LsEnedA
	 IwgnRppCwcayDDBzn4kOKbCSRgXgJ1D4cS1W1SsEmi/5snKptLoUX0Kw94fC/Dh8Ub
	 LyzYAqEckn2JhRxiarldHJuxSseqKzG56CRDs5x4oGto1OR8+8kQNg2nYxRUJPz3/U
	 o8NYgI+ZpZFvD8tzgiX/77VG/4UanJVFL6RIdcYtkutM9g9t7JYDesV4bc/FgdVEPL
	 Em+7Q3mkLD+EQ==
Date: Thu, 5 Dec 2024 10:28:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] dt-bindings: clock: qcom: Add SM8750 GCC
Message-ID: <lgkjp7aocv2sij6tiectv5vm3yygcfnaguj4nomxu27scvtggu@uwzvgbvm44nn>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
 <20241204-sm8750_master_clks-v3-5-1a8f31a53a86@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_clks-v3-5-1a8f31a53a86@quicinc.com>

On Wed, Dec 04, 2024 at 11:37:17AM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add device tree bindings for the global clock controller on Qualcomm
> SM8750 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |  62 ++++++
>  include/dt-bindings/clock/qcom,sm8750-gcc.h        | 226 +++++++++++++++++++++
>  2 files changed, 288 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..aab7039fd28db2f4e2a6b9b7a6340d17ad05156d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8750-gcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on SM8750
> +
> +maintainers:
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on SM8750
> +
> +  See also: include/dt-bindings/clock/qcom,sm8750-gcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8750-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board Always On XO source
> +      - description: Sleep clock source
> +      - description: PCIE 0 Pipe clock source

Are you absolutely sure there is no PCIE 1 Pipe clock? List will only be
able to grow at the end, breaking the order, if it turns out there is
such clock input.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


