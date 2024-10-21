Return-Path: <linux-arm-msm+bounces-35162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F69A5C44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF809282CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E071D14E7;
	Mon, 21 Oct 2024 07:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKuWxwT+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93C1D07A3;
	Mon, 21 Oct 2024 07:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729494909; cv=none; b=KC4PtqQEfLzECQWnIIqowJuGOJ8d3l4AKs9WzJMwgaUjR8faQew2E/4p2zXNCzQpUZ15lm1Wf/DCuB+NpLMCk5PGKvt0PTG8Yr1T8+SMbwNKQOwO867cu3Cal8VnnRgTdN7W1hZxL/fHizKwsYfnmyt1i9bcNqfPZmpKjVCPwe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729494909; c=relaxed/simple;
	bh=nKPzNF057pxm0ao76emLKlBxzsL74QCEn259038azO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv0sGyDKr52g7kH15JsvyoFj444etcyPxqGDvMgniVVAa5HjJqhGhTBpDeVTwBd3KK+Hq6YhK35+Fb0xH9DKCNi4bWb7GPyYM9lLXyY8XW+IRjw/f1m3EC50ujGOMG9cUfLhJW53/LZacqO0kOTnpgpltfpzaK29OfkxdsHVpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKuWxwT+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AF4C4CEC3;
	Mon, 21 Oct 2024 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729494909;
	bh=nKPzNF057pxm0ao76emLKlBxzsL74QCEn259038azO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKuWxwT+PirXJWAVCFhlrq4PmDauVrCIPG9OhbpDA4vaW6SURV8ySGsvCCkT7NKHD
	 PLYnw/oeETVXSAVGAN7IqgEZkDR7OGwRf90qnGbIMqrwAhnRKYf+PP/7zvzGK5sJvB
	 802kYFeA036TvrdzXz14zMLYvHpKJI7fGdHKX4mSiHjLFS+tSIUgJzBJAfNloixmFd
	 Wi9tbJ41XptxVqI7KK06g07bs4qhybsbQymNswWCbfOIFwTbPziGl/ElZ1M3SRgOFQ
	 g6MykEe4VTzzW+8LFVR/qYZBG9jwxI2aaW1+fuIOg8pespcp5nDUmpHiBLpISw1QKz
	 fJrOfbDn93kQw==
Date: Mon, 21 Oct 2024 09:15:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/12] dt-bindings: clock: qcom: Add QCS615 GCC clocks
Message-ID: <bqnqc3sxnh5afs6nb7hrc45scfk6amcj2d3hbeuyriydowmmam@jvma7o4mg65m>
References: <20241019-qcs615-mm-clockcontroller-v1-0-9f1ca2048287@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-5-9f1ca2048287@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-5-9f1ca2048287@quicinc.com>

On Sat, Oct 19, 2024 at 12:42:35AM +0530, Taniya Das wrote:
> Add device tree bindings for global clock controller on QCS615 SoCs.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

That's 5/12 but rest is missing. Are you sure you used sent it
correctly?

>  .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |  59 ++++++
>  include/dt-bindings/clock/qcom,qcs615-gcc.h        | 211 +++++++++++++++++++++
>  2 files changed, 270 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fecc694cd71b8aeb3d420ccea5f5ffba04c8ff9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on QCS615
> +
> +maintainers:
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on QCS615.
> +
> +  See also:: include/dt-bindings/clock/qcom,qcs615-gcc.h

s/::/:/

> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board active XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: sleep_clk

That's just "sleep".

Why do you need clock-names in the first place?

Best regards,
Krzysztof


